50 REM Super Mayoimichi Ver 1.0
60 REM   by Akie  June 1983
70 REM   m.l. is ($a000-$a33e)
100 CLEAR 300,&H9fff
110 WIDTH 40,25:CONSOLE 0,25,0,1:COLOR 7,0
120 J=VAL(MID$(TIME$,4,2)+RIGHT$(TIME$,2))
130 POKE &Ha9fd,1'PEEK(VARPTR(J))
140 FOR I=0 TO VAL(RIGHT$(TIME$,2)):J=RND(1):NEXT I
200 DEFINT A-Z
210 DEFSTR V,U
220 DEFUSR1=&Ha003
230 DEFUSR2=&Ha006
235 DEFUSR3=&Ha009
240 DEFFNAD(X,Y)=X+Y*160+&Haa00
250 DEFFNMP(X,Y)=PEEK(X+Y*160+&Haa00)
260 DEFFNCH(X,Y)=X<0 OR Y<0 OR X>158 OR Y>98
300 IF INP(9)<255 THEN 300
310 GOSUB 20000
500 SC=0:LIM=10
600 DUMMY=USR1(DUMMY)'make maze
700 UM="00:"+RIGHT$("0"+MID$(STR$(LIM),2),2)+":00"
1000 MO=3
1010 WIDTH40:PRINTCHR$(12)
1020 PRINT TAB(5)LIM"? ?Ų? ?޸??? ??!"
1030 PRINT:PRINT TAB(8)"OK?޽?? ";INPUT$(1)
1100 GOSUB 9000
1110 GOSUB 8000:GOSUB 5500:GOSUB 5700
1120 PX=0:PY=1
1130 GOSUB 6000
1200 TIME$="00:00:00"
1400 GOSUB 4000
1410 GOSUB 6000
1450 IF PX=158 AND PY=97 THEN 10000'next scene
1460 IF TIME$>UM THEN 11000
1690 GOTO 1400
4000 COLOR 5
4001 LOCATE 29,8
4002 PRINT USING"(###?##)";PX,PY;
4003 COLOR 5:LOCATE 32,5:PRINT RIGHT$(TIME$,5)
4004 LOCATE 0,0:COLOR 7
4005 DX=0:DY=0
4010 IF(INP(0)AND 4)=0 THEN DY=1
4020 IF(INP(0)AND 16)=0 THEN DX=-1
4030 IF(INP(0)AND 64)=0 THEN DX=1
4040 IF(INP(1)AND 1)=0 THEN DY=-1
4090 IF DX=0 AND DY=0 THEN 4003
4100 X=PX+DX:Y=PY+DY
4110 IF X<0 OR Y<0 OR X>158 OR Y>98 THEN BEEP:RETURN
4120 IF FNMP(X,Y)=255 THEN RETURN
4200 BEEP1:PX=X:PY=Y:BEEP0
4300 J=FNMP(PX,PY)
4310 IF J>=ASC("A") AND J<=ASC("J") THEN GOSUB 5000
4400 X=PX+DY:Y=PY+DX:IF FNCH(X,Y) THEN 4420
4410 IF FNMP(X,Y)<>255 THEN RETURN
4420 X=PX-DY:Y=PY-DX:IF FNCH(X,Y) THEN RETURN
4430 IF FNMP(X,Y)<>255 THEN RETURN
4440 GOSUB 6000:GOTO 4100
5000 'get score
5010 BEEP 1:POKE FNAD(PX,PY),0
5020 J=J-ASC("A"):BEEP 0
5030 SC=SC+10-J
5040 GOSUB 5500
5050 LOCATE 31,J+12
5060 COLOR 6:PRINT"O.K.!"
5080 IF SC>30000 THEN 12000'give up
5090 RETURN
5500 IF SC=0 THEN RETURN
5505 LOCATE 31,3
5510 COLOR 5
5520 PRINT USING"#####0";SC
5530 RETURN
5700 IF HS=0 THEN RETURN
5705 LOCATE 31,1
5710 COLOR 5
5720 PRINT USING"#####0";HS
5730 RETURN
6000 ' disp sub
6010 POKE &Ha9ff,PX
6020 POKE &Ha9fe,PY
6030 DUMMY=USR2(DUMMY)
6040 COLOR 6:LOCATE 13,13:PRINT "?";
6050 RETURN
8000 ' screen
8100 WIDTH 40,25
8110 COLOR 5,0
8120 PRINT CHR$(12);
8130 COLOR 6
8140 PRINT "  Super Mayoimichi Ver 1.0
8150 COLOR 4
8160 PRINT "   Written By Akira Kita
8200 LINE(0,2)-(2,24),"?",7,BF
8210 LINE(2,2)-(24,24),"?",7,B
8220 LINE(24,2)-(27,24),"?",7,BF
8230 LINE(28,0)-(28,24),"?",6
8400 X=29
8410 COLOR 7:LOCATE X, 0:PRINT "HI-SCORE"
8415 COLOR 5:LOCATE X, 1:PRINT "       0"
8420 COLOR 7:LOCATE X, 2:PRINT "   SCORE"
8425 COLOR 5:LOCATE X, 3:PRINT "       0"
8430 COLOR 7:LOCATE X, 4:PRINT "    TIME"
8440 COLOR 7:LOCATE X, 6:PRINT "????????"
8450 COLOR 7:LOCATE X, 7:PRINT "Position"
8460 COLOR 5:LOCATE X, 8:PRINT "(   ?  )"
8465 COLOR 7:LOCATE X,11:PRINT "  Point "
8470 IF MO<3 THEN 8600
8480 FOR I=0 TO 9
8490 LOCATE X,I+12
8500 COLOR 6:PRINT CHR$(ASC("A")+I);"-";
8510 COLOR 3:PRINT USING"(###)";(10-I)*10;
8520 NEXT I
8600 '
8900 RETURN
9000 ' drop target
9010 IF MO<3 THEN RETURN
9020 FOR I=0 TO 9
9030  X=RND(1)*100+30
9040  Y=RND(1)*70+15
9050  IF FNMP(X,Y)>0 THEN 9030
9060  POKE FNAD(X,Y),ASC("A")+I
9070 NEXT I
9090 RETURN
10000 REM next scene
10050 VV=TIME$
10100 FOR J=0 TO 5
10110 BEEP1:FOR I=0 TO 300:NEXT:BEEP0:FORI=0TO300:NEXT
10200 J=10-VAL(MID$(VV,4,2))
10210 COLOR 3
10220 LOCATE 10,10:PRINT "*****************"
10230 LOCATE 10,11:PRINT "*** BONUS:##0 ***"
10240 LOCATE 10,12:PRINT "*****************"
10300 COLOR 6
10310 LOCATE 14,11:PRINT USING "BONUS:###";J;
10400 SC=SC+J
10410 GOSUB 5500
10500 FOR I=0 TO 5000:NEXT
10510 LIM=LIM-1:IF LIM<1 THEN LIM=10
10600 GOTO 600
11000 REM game over
11100 COLOR 7:PRINT CHR$(12)
11110 V="G A M E   O V E R":LOCATE 10,8
11120 FOR I=1 TO LEN(V)
11130 V0=MID$(V,I,1):IF V0<>" "THEN BEEP1:BEEP0
11140 PRINT V0;"_";CHR$(29);
11150 FOR J=0 TO 50:NEXT
11160 NEXT:PRINT" ";
11200 FOR J=0 TO 1000:NEXT J
11250 IF HS<SC THEN HS=SC
11300 LOCATE 8,10:PRINT USING"   SCORE:#####0";SC
11310 LOCATE 8,11:PRINT USING"HI-SCORE:#####0";HS
11400 LOCATE 7,20:PRINT"TRY AGAIN?";
11410 IF INPUT$(1)="n" THEN END :ELSE 500
12000 REM give up!
12100 COLOR7:PRINT CHR$(12)
12200 PRINT:PRINT"YOU ARE CRAZY!!!!!!
12300 PRINT:PRINT"   I HAVE TO GIVE UP!
12350 PRINT
12400 PRINT "YOUR SCORE";SC
12450 PRINT "      IS THAT WRITER UNEXPECTED SCORE!!"
12500 PRINT:PRINT:PRINT STRING$(10,7)
12600 END
20000 REM explain
20010 WIDTH40:COLOR7:PRINT CHR$(12)
20020 PRINT" Super Mayoimichi
20030 PRINT
20040 PRINT" ?ò??? ?޶? ?Ų?
20050 PRINT"   A ?? J ???? 10 ??Ӽަ ????
20060 PRINT"  Ҳ? з޼? ? ?޸??Ͳ?ø?޻??
20065 PRINT
20070 PRINT" ????? (??޳ γ??)
20080 PRINT"   ???
20090 PRINT"   ?8?
20100 PRINT"   ???
20110 PRINT"???   ???
20120 PRINT"?4? ? ?6?
20130 PRINT"???   ???
20140 PRINT"   ???
20150 PRINT"   ?2?
20160 PRINT"   ???
20200 LOCATE 10,22:PRINT"OK?";
20210 IF INPUT$(1)="n" THEN 20000 :ELSE RETURN
