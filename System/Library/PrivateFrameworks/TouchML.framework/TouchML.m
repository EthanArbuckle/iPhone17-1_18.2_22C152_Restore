void sub_23982D5F0(objc_class *a1)
{
  objc_method *InstanceMethod;
  objc_method *v3;
  uint64_t vars8;

  InstanceMethod = class_getInstanceMethod(a1, sel_prepareLayout);
  v3 = class_getInstanceMethod(a1, sel_tmlPrepareLayout);
  method_exchangeImplementations(InstanceMethod, v3);
}

uint64_t sub_23982D648(void *a1, const char *a2, double a3)
{
  objc_msgSend_tmlPrepareLayout(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, @"prepareLayout", 0);
}

void sub_23982D750(uint64_t a1)
{
  size_t v2 = strlen("83847776g&}/eWZKBaN-@%-{yB/0iXwWE{+Cd>8:9CsIf1y.]uA7AZd%%nrfce4{f%BugoTwJusfXm*-.uFiUKZjF)IP7M{55vL.?O)ek!X0]r442uT)1)GL(g.8ni]M&17j:DY!rj:?gmWOH7UrEP#v$8<nC9i<VAaOgiDO3C=-I98/HeBz(hhp&ZF+BZ]I]x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btw^Q3mG.evpShPz!a02Bxrf#xI-bTvqPN$wPz&Vz/6DfwPRT8zBeeTv}#RR8w&!*Aa9=}zdN*2A=R<2wnbK}x(v($A^nMu3j*S+ze:r5BzkVhltQNIyz3!Wy&r*0a$vzEvpShPz!a02Bxrf#xI-bTvqPN$wPz&Mv@Dj6y?mZ5z/d)Tz!0Mzb76.yq+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6l$HgCxjk)[b2!)<Ab](cBZ]I]x>qGQz/fVqz!%l3AZTRLmRM:OB7=9=8zhvbC4>JilVl<:A=k=gwPwz6q+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6c&$>9mSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776g&}/eWZKBaN-@%-{yB/0iXwWE{+Cd>8:9CsIf1y.]uA7AZd%%nrfce4{f%BugoTwJusfXm*-.uFiUKZjF)IP7M{55vL.?O)ek!X0]r442uT)1)GL(g.8ni]M&17j:DY!rj:?gmWOH7UrEP#v$8<nC9i<VAaOgiDO3C=-I98/HeBz(hhp&ZF+BZ]I]x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btw^Q3mG.evpShPz!a02Bxrf#xI-bTvqPN$wPz&Vz/6DfwPRT8zBeeTv}#RR8w&!*Aa9=}zdN*2A=R<2wnbK}x(v($A^nMu3j*S+ze:r5BzkVhltQNIyz3!Wy&r*0a$vzEvpShPz!a02Bxrf#xI-bTvqPN$wPz&Mv@Dj6y?mZ5z/d)Tz!0Mzb76.yq+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6l$HgCxjk)[b2!)<Ab](cBZ]I]x>qGQz/fVqz!%l3AZTRLmRM:OB7=9=8zhvbC4>JilVl<:A=k=gwPwz6q+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6c&$>9mSiA!wmoN]z/b", v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_23982D9C4(uint64_t a1)
{
  size_t v2 = strlen(a83847776kajGqq);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776kajGqq, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_23982DC70(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v6 = (void *)MEMORY[0x263F5C0E8];
  id v7 = (void *)MEMORY[0x263F087B0];
  id v8 = a2;
  v11 = objc_msgSend_decimalNumberWithString_(v7, v9, v10, a3);
  v14 = objc_msgSend_summaryItemWithLabel_amount_type_(v6, v12, v13, v8, v11, a4);

  return v14;
}

id sub_23982DD08(uint64_t a1, void *a2)
{
  size_t v2 = (objc_class *)MEMORY[0x263F5BF50];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v12 = 0;
  id v7 = objc_msgSend_initWithData_error_(v4, v5, v6, v3, &v12);

  id v8 = v12;
  v9 = v8;
  if (v8)
  {
    NSLog(&cfstr_WrongPassData.isa, v8);
    id v10 = 0;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

uint64_t sub_23982DDB0()
{
  Class v0 = NSClassFromString(&cfstr_Pkpaymentautho.isa);
  return MEMORY[0x270F9A6D0](v0, sel_canMakePayments, v1);
}

uint64_t sub_23982DDE0(uint64_t a1, void *a2)
{
  id v2 = a2;
  Class v3 = NSClassFromString(&cfstr_Pkpaymentautho.isa);
  uint64_t PaymentsUsingNetworks = objc_msgSend_canMakePaymentsUsingNetworks_(v3, v4, v5, v2);

  return PaymentsUsingNetworks;
}

uint64_t sub_23982DE24(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  Class v5 = NSClassFromString(&cfstr_Pkpaymentautho.isa);
  uint64_t PaymentsUsingNetworks_capabilities = objc_msgSend_canMakePaymentsUsingNetworks_capabilities_(v5, v6, v7, v4, a3);

  return PaymentsUsingNetworks_capabilities;
}

uint64_t sub_23982EA4C()
{
  qword_268A05648 = objc_alloc_init(TMLAspectsRegistration);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_23982EEB8(uint64_t a1, void *a2, double a3)
{
  objc_msgSend_object(a2, (const char *)a2, a3);
  id v4 = (const char *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v4, v5, v4);
  }
  return MEMORY[0x270F9A758]();
}

void sub_23982F74C(uint64_t a1)
{
  size_t v2 = strlen(a83847776dxapYv);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776dxapYv, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_23982F8E4()
{
  id v0 = objc_alloc_init(MEMORY[0x263F04B98]);
  return v0;
}

id sub_23982F914(double a1, uint64_t a2, const char *a3)
{
  if (a3)
  {
    double v4 = objc_msgSend_eventWithEventStore_(MEMORY[0x263F04B90], a3, a1, a3);
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

uint64_t sub_23982F964()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F04B18], sel_alarmWithRelativeOffset_, 0.0);
}

uint64_t sub_23982F974(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F04B18], sel_alarmWithRelativeOffset_, a1);
}

id sub_23982F980(double a1, uint64_t a2, const char *a3)
{
  if (a3)
  {
    double v4 = objc_msgSend_alarmWithAbsoluteDate_(MEMORY[0x263F04B18], a3, a1, a3);
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

void sub_23982FCFC(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (const char *)objc_msgSend_UTF8String(v7, v1, v2);
  double v4 = dispatch_get_global_queue(-2, 0);
  dispatch_queue_t v5 = dispatch_queue_create_with_target_V2(v3, 0, v4);
  double v6 = (void *)qword_268A05660;
  qword_268A05660 = (uint64_t)v5;
}

void sub_23982FD88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if objc_msgSend_isObject(v6, v9, v10) && (objc_msgSend_isObject(v8, v11, v12))
  {
    double v13 = objc_msgSend_toString(v6, v11, v12);
    v16 = objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v14, v15, v7, 16);
    v19 = objc_msgSend_stringWithUTF8String_(NSString, v17, v18, "@");
    v22 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v20, v21, v8, v19);

    v23 = qword_268A05660;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23982FF70;
    block[3] = &unk_264DAB6F0;
    id v38 = v13;
    id v39 = v16;
    id v40 = v22;
    id v24 = v22;
    id v25 = v16;
    id v26 = v13;
    dispatch_async(v23, block);
  }
  else
  {
    v27 = (void *)MEMORY[0x263F10390];
    v28 = objc_msgSend_currentContext(MEMORY[0x263F10378], v11, v12);
    v31 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v27, v29, v30, @"Block is not a function", v28);
    v34 = objc_msgSend_currentContext(MEMORY[0x263F10378], v32, v33);
    objc_msgSend_setException_(v34, v35, v36, v31);
  }
}

void sub_23982FF70(uint64_t a1, const char *a2, double a3)
{
  double v4 = objc_msgSend_executeFunction_argument_(TMLBackgroundBlock, a2, a3, *(void *)(a1 + 32), *(void *)(a1 + 40));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23983002C;
  v7[3] = &unk_264DAB6C8;
  id v5 = *(id *)(a1 + 48);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t sub_23983002C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_239830094()
{
  qword_268A05670 = (uint64_t)objc_alloc_init(MEMORY[0x263F10398]);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2398302DC(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_handleException_, a2);
}

void sub_2398304AC(void *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = sub_239830538(v9);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = sub_2398305B4(v9, v4, 1);
    objc_msgSend_addTarget_action_forControlEvents_(a1, v7, v8, v6, sel_controlAction_forEvent_, v5);
  }
}

uint64_t sub_239830538(void *a1)
{
  uint64_t v1 = qword_268A05698;
  id v3 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_268A05698, &unk_26ECEBB18);
  }
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05690, v2, v4, v3);

  uint64_t v8 = objc_msgSend_unsignedIntegerValue(v5, v6, v7);
  return v8;
}

id sub_2398305B4(void *a1, uint64_t a2, int a3)
{
  id v6 = a1;
  if (qword_268A05688 != -1) {
    dispatch_once(&qword_268A05688, &unk_26ECEBAF8);
  }
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05680, v5, v7, v6);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = a3 == 0;
  }
  if (!v9)
  {
    double v10 = [TMLUIControlActionTarget alloc];
    uint64_t v8 = objc_msgSend_initWithSignal_controlEvent_(v10, v11, v12, v6, a2);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_268A05680, v13, v14, v8, v6);
  }

  return v8;
}

void sub_239830680(void *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = sub_239830538(v9);
  uint64_t v5 = v9;
  if (v4)
  {
    double v7 = sub_2398305B4(v9, v4, 0);
    if (v7) {
      objc_msgSend_removeTarget_action_forControlEvents_(a1, v6, v8, v7, sel_controlAction_forEvent_, v4);
    }

    uint64_t v5 = v9;
  }
}

uint64_t sub_239830844()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9A0]);
  qword_268A05680 = objc_msgSend_initWithCapacity_(v0, v1, v2, 14);
  return MEMORY[0x270F9A758]();
}

void sub_239830888()
{
  id v0 = (void *)qword_268A05690;
  qword_268A05690 = (uint64_t)&unk_26ED1B0F8;
}

void sub_239830964(uint64_t a1)
{
  size_t v2 = strlen("83847776LGhrPtbps#)ww/)[iNQevE7814Oi-tO>e29f<:MGWDO%$.oUDBak=%l7)X>={BDrKdK6>70>0/[?2OU265ulRM@f<Q&pR5Z{9es^HN#o@(8#4gyMqQ$KdRd2>t.XmBE$=Ey^{pUs:1Z%u+GZTo.%n&!m@<SPoftV3zdta8avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPwz0ry]}]C4>O$BzkVhlVl<:A=k=gwPw$a3i+0:wO#P52sRoOC4CMka@Q!1wN]H%r+Vb?l$HgCxjk)[5^An-ygQ)%a@Q^}wP?T5Bw)p1A+b<(mn36)wO#P*Bz(hhg9u]kv{%m+wO:!Cx([6bxaL7/4p-*:v}xEBwncd1zF6rJ0sxAcog9c7wO#3!AZKIUz/YGg5!F5mr+Vb?lVl<:A=k=gwPw$h3j?h>z*cm<z/fbMB-..zzw07Yz/oCo7yyT[wO+{/BzkVhq/)q3wFb8VzGDY@a}+j*wmYN*xjk)[5^An-ygQ)%a@H.1B7/GoB3<wNv}xEyB-..zzw07Yz/oCo8vv6$wO+{/By!#IvqGH)wmoI15^q3eq!p4TG-II}mn36)wO#P<x>qGQz/fVqz!%l3AUn{-nMGLpCscp^BAhqoy?mSh9srJ&y&13lB3<wLwO#3!A.{^/C4>Ji5^hVZz!{Qg3j7fNy?ml/By=6?z^)D)v@@[f3jQAWy&sJsmpZaOx(mL@1y=p/y:6z$1.z<*zGDG@mn36)wO#PlJSxF2mn36)wO#P<x>qGRwO+{<vru68Cm20{C4CMkr+Vb?lVl<:A=k=gwPws.8y2N@v@DmbA=k=gwPwy#mn36)wO#P<x>qGQz/fVqz!%l3AVbw]24q1-x(v(418hT{a$veEwO#P<x>qGQz/fVqz!%l3AYN-Bwj7oLAbo9cwMJO/xHccIx(v(Ibk83A8avg=vqGH)wmoHCxM4*gwPygIy?ml/By=T:3k^nYy?mG{vra.Gz/oYdAZTRLmRM:OB7=9=8ybU2v{%g+zE^f@v}Y!0B7Gw85K/tWvqGH)wmoHCxM4*gwPxg2b18+Pv{%g+zE^f@lUHyRB7GwWx>fOtzEWl]5ciW{3j*SPy?mG{vrb<>z/oYdAUn%Mog9c7wO#3!AZKIUz/YGgc&$O!3l-[/y?mG{vra.Gz/oYdA-lK=wN/*@z/d%Swj73szF9I(0u9i<4}x3:wO#3!A:@^3z/YGg5!NM9lT:!xzE^f@lUHyRB7Gwu0Wri$3kVc7mrSlWBvx.OBxi9!Csl1UwOkB[wG>K&gg+SuzGFrTx()x&wP{HWzGG]qy&0W6l$G$sB.(d!vqGH)wmoHFz/OP:CsuW^zGG}h5e(]63s!0(BAhqoy?mS18avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPxg2b7/[67Id=3zGFrTx()x&wP{HWzGG]qy&0W65ciW%3jpoYzGG]qy&0W65/BbhmrSlWBvx.OBxi9!Cscp^BAhqoy?mS94giqFv@#B6zw04=zGE6PwP?T5Bvx.OBxi9!Cscp^BAhqoy?mSFwnbNwz/6DfwPRG+x([2Ov@#B6zAolMmrSlWBw3s&");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776LGhrPtbps#)ww/)[iNQevE7814Oi-tO>e29f<:MGWDO%$.oUDBak=%l7)X>={BDrKdK6>70>0/[?2OU265ulRM@f<Q&pR5Z{9es^HN#o@(8#4gyMqQ$KdRd2>t.XmBE$=Ey^{pUs:1Z%u+GZTo.%n&!m@<SPoftV3zdta8avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPwz0ry]}]C4>O$BzkVhlVl<:A=k=gwPw$a3i+0:wO#P52sRoOC4CMka@Q!1wN]H%r+Vb?l$HgCxjk)[5^An-ygQ)%a@Q^}wP?T5Bw)p1A+b<(mn36)wO#P*Bz(hhg9u]kv{%m+wO:!Cx([6bxaL7/4p-*:v}xEBwncd1zF6rJ0sxAcog9c7wO#3!AZKIUz/YGg5!F5mr+Vb?lVl<:A=k=gwPw$h3j?h>z*cm<z/fbMB-..zzw07Yz/oCo7yyT[wO+{/BzkVhq/)q3wFb8VzGDY@a}+j*wmYN*xjk)[5^An-ygQ)%a@H.1B7/GoB3<wNv}xEyB-..zzw07Yz/oCo8vv6$wO+{/By!#IvqGH)wmoI15^q3eq!p4TG-II}mn36)wO#P<x>qGQz/fVqz!%l3AUn{-nMGLpCscp^BAhqoy?mSh9srJ&y&13lB3<wLwO#3!A.{^/C4>Ji5^hVZz!{Qg3j7fNy?ml/By=6?z^)D)v@@[f3jQAWy&sJsmpZaOx(mL@1y=p/y:6z$1.z<*zGDG@mn36)wO#PlJSxF2mn36)wO#P<x>qGRwO+{<vru68Cm20{C4CMkr+Vb?lVl<:A=k=gwPws.8y2N@v@DmbA=k=gwPwy#mn36)wO#P<x>qGQz/fVqz!%l3AVbw]24q1-x(v(418hT{a$veEwO#P<x>qGQz/fVqz!%l3AYN-Bwj7oLAbo9cwMJO/xHccIx(v(Ibk83A8avg=vqGH)wmoHCxM4*gwPygIy?ml/By=T:3k^nYy?mG{vra.Gz/oYdAZTRLmRM:OB7=9=8ybU2v{%g+zE^f@v}Y!0B7Gw85K/tWvqGH)wmoHCxM4*gwPxg2b18+Pv{%g+zE^f@lUHyRB7GwWx>fOtzEWl]5ciW{3j*SPy?mG{vrb<>z/oYdAUn%Mog9c7wO#3!AZKIUz/YGgc&$O!3l-[/y?mG{vra.Gz/oYdA-lK=wN/*@z/d%Swj73szF9I(0u9i<4}x3:wO#3!A:@^3z/YGg5!NM9lT:!xzE^f@lUHyRB7Gwu0Wri$3kVc7mrSlWBvx.OBxi9!Csl1UwOkB[wG>K&gg+SuzGFrTx()x&wP{HWzGG]qy&0W6l$G$sB.(d!vqGH)wmoHFz/OP:CsuW^zGG}h5e(]63s!0(BAhqoy?mS18avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPxg2b7/[67Id=3zGFrTx()x&wP{HWzGG]qy&0W65ciW%3jpoYzGG]qy&0W65/BbhmrSlWBvx.OBxi9!Cscp^BAhqoy?mS94giqFv@#B6zw04=zGE6PwP?T5Bvx.OBxi9!Cscp^BAhqoy?mSFwnbNwz/6DfwPRG+x([2Ov@#B6zAolMmrSlWBw3s&", v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_239830BA0(uint64_t a1)
{
  size_t v2 = strlen("83847776JKtlZRFuLw0CK9.-67bNgQu@3{B)=^F6zuMaKS.&.Ao!gB>j0Ry=pe0@eNbhH)iH]cw?Nrzy9(Dp*2H=RAl0Qv-ZV>LTrR#/5T&<74Z%xYVOOZONx)k<r:yRFOu}*ko37828/vPx1KW9{NQTJ8px)5?UNZFt.&x)3G86{2sz6Iz!%uja}L7+xl4M{zw0a+y&r:77Y+/]3jpoYy&st)Aa9l/5^98{AU[*35deOHy&B5@5^q(-z^^-80u@S[6MXwpx(mMYwPhW3B7Glhvruj4zw0d{BAh8kxbyT[4*&CGy&%q41.IN?vrrs!a}s}ZA+e+]1.IN?vrrs!a@*}5zGP/9wPyNUlVl*Xz/fc7BAn5$B.L-n7Y=x]3kE5?y&st}x([2^wN[qKwO2:Cy&%q25e>(.0DF!Rw]8x]Bq+F[0Cr2Gw]8x]Bq+F[0B=VBw]8x]BrROMv@Dg4A-V%%xI@zLi+JFAwO%Lry&%qIghEpnx(mTbs7#+&qE%xeA+e*1ltQ^Ql2pHNvgS$*3jl/O5^q(-z^^-a3jl/D5^q(-z^^-a3jl/y5^q(-z^^-a3jl/x5^q(-z^^-i9CGz9Bxrf#xI@zLi+JFAwO%Lry&%qIvqG)@vlcez3kvh(x()A<BzaM-wjHVKwO%?JB.89}8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:7a@s%hx()A<BzaM-wiavzwO2:uvR*f#iX&M15mYS{z/O][Bza3ilVl^VAU5^23KM]A5^z&TBA}?pa}=zoz!%ujs7#+&lQ%HZy&stPgbogEx(mTbs7#+&lQ%HZy&st95e>]-0B(-Dv}G?dAaHj8x(mTbs7#+&lQ%HZy&stPgh^Hrv@Dg4A-V%%xI@zLm@&fLzBeeZwKgcKxKIC-8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:78vu/Lvg&-Qy&r:7a%esBz!%ujs7#+&qE%x1xl4M{zAqlyB.9Qxy&B5@iX&@c4}xJ]z/O][BzaP{A+PA75d/-%3j.8/Ab]JhwO#P#BzkVh5^AA0A+PA7a}Vtnz!%ujs7#+&q/)4]zF80qX=SoBlRf:Yy&<lea@7B(z/{evB-Zn/D2<P4vrcx%C]cMa7ZZT?B-.OBBv*sTxjRXXlRf<^vp%c*0u@6Z1A4T+wFbh*BAh8kxbyT[6BCdXzG6-uoj-x&5^qY:A::kg0u@A?3sO3#A+P09By/Ia3s)<XBzkVhvrcSg0wVFs4RxA>By/F]x([2-vqPM!5e(2=1A4T+wFbh*BAh8kxcE)qw[=76wPy<^BzaATzdL:-As9>3x(4)5A-V%%xII#MwMJO/xI08XB-ZC*A:-/@By/Gl5d/-&3iUlPzdKs:B98CpzF6>43i>DTA:-*a5^&e-v@#B6zEENha%XWJx(4)5A-V%%xII#MwJC3HBzal-Acln0vrb^[wPRH7B2(6A3j.b*Bxh*^B.a3XA.x$?5ciWW3i+PYy&%q425^%=wN/*24gihMwQa))B98CpzF7d8B7GC]vqH6$i+AqJoj-xfgaS+uC42ifwKZPUoj-wW5e>#+18zE[5^AA0A+PA7a}eT6y&%qUz/OGZC@^Y23jy]^BvoXLvrDydA$wu@3V/)3l$G$sB.(ev3jd4AlRf<^vp%c");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776JKtlZRFuLw0CK9.-67bNgQu@3{B)=^F6zuMaKS.&.Ao!gB>j0Ry=pe0@eNbhH)iH]cw?Nrzy9(Dp*2H=RAl0Qv-ZV>LTrR#/5T&<74Z%xYVOOZONx)k<r:yRFOu}*ko37828/vPx1KW9{NQTJ8px)5?UNZFt.&x)3G86{2sz6Iz!%uja}L7+xl4M{zw0a+y&r:77Y+/]3jpoYy&st)Aa9l/5^98{AU[*35deOHy&B5@5^q(-z^^-80u@S[6MXwpx(mMYwPhW3B7Glhvruj4zw0d{BAh8kxbyT[4*&CGy&%q41.IN?vrrs!a}s}ZA+e+]1.IN?vrrs!a@*}5zGP/9wPyNUlVl*Xz/fc7BAn5$B.L-n7Y=x]3kE5?y&st}x([2^wN[qKwO2:Cy&%q25e>(.0DF!Rw]8x]Bq+F[0Cr2Gw]8x]Bq+F[0B=VBw]8x]BrROMv@Dg4A-V%%xI@zLi+JFAwO%Lry&%qIghEpnx(mTbs7#+&qE%xeA+e*1ltQ^Ql2pHNvgS$*3jl/O5^q(-z^^-a3jl/D5^q(-z^^-a3jl/y5^q(-z^^-a3jl/x5^q(-z^^-i9CGz9Bxrf#xI@zLi+JFAwO%Lry&%qIvqG)@vlcez3kvh(x()A<BzaM-wjHVKwO%?JB.89}8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:7a@s%hx()A<BzaM-wiavzwO2:uvR*f#iX&M15mYS{z/O][Bza3ilVl^VAU5^23KM]A5^z&TBA}?pa}=zoz!%ujs7#+&lQ%HZy&stPgbogEx(mTbs7#+&lQ%HZy&st95e>]-0B(-Dv}G?dAaHj8x(mTbs7#+&lQ%HZy&stPgh^Hrv@Dg4A-V%%xI@zLm@&fLzBeeZwKgcKxKIC-8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:78vu/Lvg&-Qy&r:7a%esBz!%ujs7#+&qE%x1xl4M{zAqlyB.9Qxy&B5@iX&@c4}xJ]z/O][BzaP{A+PA75d/-%3j.8/Ab]JhwO#P#BzkVh5^AA0A+PA7a}Vtnz!%ujs7#+&q/)4]zF80qX=SoBlRf:Yy&<lea@7B(z/{evB-Zn/D2<P4vrcx%C]cMa7ZZT?B-.OBBv*sTxjRXXlRf<^vp%c*0u@6Z1A4T+wFbh*BAh8kxbyT[6BCdXzG6-uoj-x&5^qY:A::kg0u@A?3sO3#A+P09By/Ia3s)<XBzkVhvrcSg0wVFs4RxA>By/F]x([2-vqPM!5e(2=1A4T+wFbh*BAh8kxcE)qw[=76wPy<^BzaATzdL:-As9>3x(4)5A-V%%xII#MwMJO/xI08XB-ZC*A:-/@By/Gl5d/-&3iUlPzdKs:B98CpzF6>43i>DTA:-*a5^&e-v@#B6zEENha%XWJx(4)5A-V%%xII#MwJC3HBzal-Acln0vrb^[wPRH7B2(6A3j.b*Bxh*^B.a3XA.x$?5ciWW3i+PYy&%q425^%=wN/*24gihMwQa))B98CpzF7d8B7GC]vqH6$i+AqJoj-xfgaS+uC42ifwKZPUoj-wW5e>#+18zE[5^AA0A+PA7a}eT6y&%qUz/OGZC@^Y23jy]^BvoXLvrDydA$wu@3V/)3l$G$sB.(ev3jd4AlRf<^vp%c", v2,
    0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

uint64_t sub_23983187C(void *a1, const char *a2, double a3, uint64_t a4)
{
  return objc_msgSend_tmlValueForKeyPath_inDictionary_(a1, a2, a3, a4, a1);
}

id sub_239831884(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_rangeOfString_(v6, v8, v9, @".");
  double v13 = objc_msgSend_objectForKey_(v7, v11, v12, v6);
  if (v13 || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v22 = v13;
    id v25 = v22;
  }
  else
  {
    v16 = objc_msgSend_substringToIndex_(v6, v14, v15, v10);
    v19 = objc_msgSend_substringFromIndex_(v6, v17, v18, v10 + 1);
    objc_msgSend_objectForKey_(v7, v20, v21, v16);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = objc_msgSend_tmlValueForKeyPath_inDictionary_(a1, v23, v24, v19, v22);
    }
    else
    {
      id v25 = 0;
    }
  }
  return v25;
}

void sub_239831F84(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = malloc_type_malloc(0x30uLL, 0x10700407919B52CuLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 48) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_2398327A8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  objc_msgSend_objectForKeyedSubscript_(v3, v5, v6, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTMLValue_forKeyPath_(*(void **)(a1 + 40), v7, v8, v9, v4);
}

void TouchML_init()
{
  if (qword_268A056B0 != -1) {
    dispatch_once(&qword_268A056B0, &unk_26ECEBB38);
  }
}

uint64_t sub_239832B9C(double a1, uint64_t a2, const char *a3)
{
  objc_msgSend_tmlLoadCategory(MEMORY[0x263F8C6D0], a3, a1);
  objc_msgSend_tmlLoadCategory(MEMORY[0x263F1CB60], v3, v4);
  objc_msgSend_tmlLoadCategory(MEMORY[0x263F1CB68], v5, v6);
  objc_msgSend_tmlLoadCategory(MEMORY[0x263F1CA98], v7, v8);
  v11 = (void *)MEMORY[0x263F1C518];
  return objc_msgSend_tmlLoadCategory(v11, v9, v10);
}

id TMLAttributedStringForMarkdown(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v5 = a1;
  objc_msgSend_dictionaryWithDictionary_(v3, v6, v7, v4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = objc_msgSend_parse_tags_withRules_(TMLMarkdownParser, v8, v9, v5, &v15, 0);

  double v13 = objc_msgSend_attributedStringWithFormat_attributes_(TMLAttributedString, v11, v12, v10, v4);

  return v13;
}

id sub_239833004(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v9 = objc_alloc(*(Class *)(a1 + 32));
  v11 = objc_msgSend_initWithRect_(v9, v10, a2, a3, a4, a5);
  return v11;
}

BOOL sub_239833064(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  double v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  objc_msgSend_rect(v4, v15, v7);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  double v24 = v8;
  uint64_t v25 = v10;
  uint64_t v26 = v12;
  uint64_t v27 = v14;
  uint64_t v28 = v17;
  uint64_t v29 = v19;
  uint64_t v30 = v21;
  uint64_t v31 = v23;
  return CGRectEqualToRect(*(CGRect *)&v24, *(CGRect *)&v28);
}

BOOL sub_239833110(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  double v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  objc_msgSend_rect(v4, v15, v7);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  double v24 = v8;
  uint64_t v25 = v10;
  uint64_t v26 = v12;
  uint64_t v27 = v14;
  uint64_t v28 = v17;
  uint64_t v29 = v19;
  uint64_t v30 = v21;
  uint64_t v31 = v23;
  return CGRectIntersectsRect(*(CGRect *)&v24, *(CGRect *)&v28);
}

BOOL sub_2398331BC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  double v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  objc_msgSend_rect(v4, v15, v7);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  double v24 = v8;
  uint64_t v25 = v10;
  uint64_t v26 = v12;
  uint64_t v27 = v14;
  uint64_t v28 = v17;
  uint64_t v29 = v19;
  uint64_t v30 = v21;
  uint64_t v31 = v23;
  return CGRectContainsRect(*(CGRect *)&v24, *(CGRect *)&v28);
}

BOOL sub_239833268(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  double v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  objc_msgSend_point(v4, v15, v7);
  uint64_t v17 = v16;
  uint64_t v19 = v18;

  double v20 = v8;
  uint64_t v21 = v10;
  uint64_t v22 = v12;
  uint64_t v23 = v14;
  uint64_t v24 = v17;
  uint64_t v25 = v19;
  return CGRectContainsPoint(*(CGRect *)&v20, *(CGPoint *)&v24);
}

id sub_2398332FC(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(objc_class **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 alloc];
  objc_msgSend_rect(v6, v8, v9);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  objc_msgSend_rect(v5, v18, v19);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v32.origin.x = v11;
  v32.origin.y = v13;
  v32.size.width = v15;
  v32.size.height = v17;
  v34.origin.x = v21;
  v34.origin.y = v23;
  v34.size.width = v25;
  v34.size.height = v27;
  CGRect v33 = CGRectIntersection(v32, v34);
  uint64_t v29 = objc_msgSend_initWithRect_(v7, v28, v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  return v29;
}

id sub_2398333D8(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v6 = *(objc_class **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 alloc];
  objc_msgSend_rect(v7, v9, v10);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  CGRect v24 = CGRectInset(v23, a3, a4);
  double v20 = objc_msgSend_initWithRect_(v8, v19, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  return v20;
}

id sub_23983347C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_CGRectValue(v3, v4, v5);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  id v14 = objc_alloc(*(Class *)(a1 + 32));
  CGFloat v16 = objc_msgSend_initWithRect_(v14, v15, v7, v9, v11, v13);

  return v16;
}

id sub_239833DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  double v8 = objc_msgSend_initWithRange_(v5, v6, v7, a2, a3);
  return v8;
}

void sub_239834750(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_239834864;
  v2[3] = &unk_264DAB890;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  sub_2398347EC(v2);
}

void sub_2398347EC(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F08B88];
  block = a1;
  if (objc_msgSend_isMainThread(v1, v2, v3)) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void sub_239834864(uint64_t a1, const char *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_2398348BC(v3, v4, 0);
}

void sub_2398348BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_239837940;
  v11[3] = &unk_264DAB890;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  objc_msgSend_runInContext_block_(TMLJSEnvironment, v9, v10, a1, v11);
}

void sub_239834984(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_239834A3C;
  v5[3] = &unk_264DAB8B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v4 = v3;
  sub_2398347EC(v5);
}

void sub_239834A3C(uint64_t a1, const char *a2, double a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v8 = *(void **)(a1 + 48);
  double v9 = v8;
  if (!v8)
  {
    double v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v7);
  }
  v11[0] = v9;
  double v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, v7, v11, 1);
  sub_2398348BC(v4, v6, v10);

  if (!v8) {
}
  }

void sub_239834B10(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_239834BB4;
  v4[3] = &unk_264DAB908;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  sub_2398347EC(v4);
}

void sub_239834BB4(uint64_t a1, const char *a2, double a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v8 = objc_msgSend_numberWithBool_(NSNumber, v6, v7, *(unsigned __int8 *)(a1 + 48));
  v12[0] = v8;
  double v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v12, 1);
  sub_2398348BC(v4, v5, v11);
}

void sub_239834C74(uint64_t a1, float a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_239834D20;
  v4[3] = &unk_264DAB958;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  float v7 = a2;
  sub_2398347EC(v4);
}

void sub_239834D20(uint64_t a1, const char *a2, double a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  id v8 = objc_msgSend_numberWithFloat_(NSNumber, v7, v6);
  v12[0] = v8;
  double v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v12, 1);
  sub_2398348BC(v4, v5, v11);
}

void sub_239834DE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_239834EC4;
  v9[3] = &unk_264DAB9A8;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  sub_2398347EC(v9);
}

void sub_239834EC4(uint64_t a1, const char *a2, double a3)
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v8 = *(void **)(a1 + 48);
  double v9 = v8;
  if (!v8)
  {
    double v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v7);
  }
  v13[0] = v9;
  id v10 = *(void **)(a1 + 56);
  id v11 = v10;
  if (!v10)
  {
    id v11 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v7);
  }
  v13[1] = v11;
  id v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, v7, v13, 2);
  sub_2398348BC(v4, v6, v12);

  if (!v10)
  {

    if (v8) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_7:
}

void sub_239834FD4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23983509C;
  v8[3] = &unk_264DAB9F8;
  id v9 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  sub_2398347EC(v8);
}

void sub_23983509C(uint64_t a1, const char *a2, double a3)
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v9 = objc_msgSend_numberWithBool_(NSNumber, v6, v7, *(unsigned __int8 *)(a1 + 56));
  v14[0] = v9;
  id v11 = *(void **)(a1 + 48);
  char v12 = v11;
  if (!v11)
  {
    char v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v14[1] = v12;
  id v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v8, v10, v14, 2);
  sub_2398348BC(v4, v5, v13);

  if (!v11) {
}
  }

void sub_239835190(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_239835294;
  void v13[3] = &unk_264DABA48;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  sub_2398347EC(v13);
}

void sub_239835294(uint64_t a1, const char *a2, double a3)
{
  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v8 = *(void **)(a1 + 48);
  id v9 = v8;
  if (!v8)
  {
    id v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v7);
  }
  v15[0] = v9;
  id v10 = *(void **)(a1 + 56);
  id v11 = v10;
  if (!v10)
  {
    id v11 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v7, v15[0]);
  }
  v15[1] = v11;
  id v12 = *(void **)(a1 + 64);
  id v13 = v12;
  if (!v12)
  {
    id v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v7);
  }
  v15[2] = v13;
  id v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, v7, v15, 3);
  sub_2398348BC(v4, v6, v14);

  if (v12)
  {
    if (v10) {
      goto LABEL_9;
    }
LABEL_12:

    if (v8) {
      goto LABEL_10;
    }
LABEL_13:

    goto LABEL_10;
  }

  if (!v10) {
    goto LABEL_12;
  }
LABEL_9:
  if (!v8) {
    goto LABEL_13;
  }
LABEL_10:
}

void sub_2398353DC(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = sub_2398354C8;
  v11[3] = &unk_264DABA98;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = v7;
  char v16 = a3;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  sub_2398347EC(v11);
}

void sub_2398354C8(uint64_t a1, const char *a2, double a3)
{
  v16[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v8 = *(void **)(a1 + 48);
  id v9 = v8;
  if (!v8)
  {
    id v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v7);
  }
  id v11 = objc_msgSend_numberWithBool_(NSNumber, v5, v7, *(unsigned __int8 *)(a1 + 64), v9);
  v16[1] = v11;
  id v13 = *(void **)(a1 + 56);
  id v14 = v13;
  if (!v13)
  {
    id v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  v16[2] = v14;
  id v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, v12, v16, 3);
  sub_2398348BC(v4, v6, v15);

  if (!v13) {
  if (!v8)
  }
}

void sub_2398355F0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_239835720;
  v17[3] = &unk_264DABAE8;
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  sub_2398347EC(v17);
}

void sub_239835720(uint64_t a1, const char *a2, double a3)
{
  void v17[4] = *MEMORY[0x263EF8340];
  uint64_t v16 = *(void *)(a1 + 32);
  id v5 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  double v7 = *(void **)(a1 + 48);
  id v8 = v7;
  if (!v7)
  {
    id v8 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v6);
  }
  v17[0] = v8;
  id v9 = *(void **)(a1 + 56);
  id v10 = v9;
  if (!v9)
  {
    id v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v6);
  }
  v17[1] = v10;
  id v11 = *(void **)(a1 + 64);
  id v12 = v11;
  if (!v11)
  {
    id v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v6);
  }
  v17[2] = v12;
  id v13 = *(void **)(a1 + 72);
  id v14 = v13;
  if (!v13)
  {
    id v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v6);
  }
  v17[3] = v14;
  id v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v4, v6, v17, 4);
  sub_2398348BC(v16, v5, v15);

  if (v13)
  {
    if (v11) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v11)
    {
LABEL_11:
      if (v9) {
        goto LABEL_12;
      }
LABEL_16:

      if (v7) {
        goto LABEL_13;
      }
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v9) {
    goto LABEL_16;
  }
LABEL_12:
  if (!v7) {
    goto LABEL_17;
  }
LABEL_13:
}

uint64_t sub_23983589C(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_removeManagedReference_withOwner_, a2);
}

id sub_239835EC0(uint64_t a1, const char *a2, double a3)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v5 = sub_239835F1C(v3, v4, 0);

  return v5;
}

id sub_239835F1C(void *a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F08B88];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  objc_msgSend_isMainThread(v5, v9, v10);
  id v13 = objc_msgSend_currentContext(TMLJSEnvironment, v11, v12);
  objc_msgSend_setCurrentContext_(TMLJSEnvironment, v14, v15, v8);

  id v18 = objc_msgSend_context(v7, v16, v17);
  objc_msgSend_setException_(v18, v19, v20, 0);

  id v23 = objc_msgSend_callWithArguments_(v7, v21, v22, v6);
  sub_2398379A4(v23);
  objc_claimAutoreleasedReturnValue();

  CGFloat v27 = objc_msgSend_toObject(v23, v24, v25);
  if (v27)
  {
    uint64_t v29 = objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v26, v28, v23, 16);
  }
  else
  {
    uint64_t v29 = 0;
  }

  objc_msgSend_setCurrentContext_(TMLJSEnvironment, v30, v31, v13);
  return v29;
}

id sub_239836040(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = objc_msgSend_value(*(void **)(a1 + 40), v5, v6);
  double v10 = v3;
  if (!v3)
  {
    double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v7, v9);
  }
  v14[0] = v10;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v7, v9, v14, 1);
  double v12 = sub_239835F1C(v4, v8, v11);

  if (!v3) {
  return v12;
  }
}

id sub_239836138(uint64_t a1, const char *a2, double a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  id v8 = objc_msgSend_numberWithBool_(NSNumber, v6, v7, a2);
  v14[0] = v8;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v14, 1);
  double v12 = sub_239835F1C(v4, v5, v11);

  return v12;
}

id sub_23983621C(uint64_t a1, const char *a2, double a3)
{
  int v3 = LODWORD(a3);
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  LODWORD(v6) = v3;
  id v8 = objc_msgSend_numberWithFloat_(NSNumber, v7, v6);
  v14[0] = v8;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v14, 1);
  double v12 = sub_239835F1C(v4, v5, v11);

  return v12;
}

id sub_239836300(uint64_t a1, void *a2, void *a3)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  id v11 = objc_msgSend_value(*(void **)(a1 + 40), v8, v9);
  id v13 = v5;
  if (!v5)
  {
    id v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  v18[0] = v13;
  id v14 = v6;
  if (!v6)
  {
    id v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  v18[1] = v14;
  double v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, v12, v18, 2);
  uint64_t v16 = sub_239835F1C(v7, v11, v15);

  if (v6)
  {
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_7;
    }
  }

LABEL_7:
  return v16;
}

id sub_239836440(uint64_t a1, uint64_t a2, void *a3)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  double v9 = objc_msgSend_value(*(void **)(a1 + 40), v7, v8);
  id v13 = objc_msgSend_numberWithBool_(NSNumber, v10, v11, a2);
  v19[0] = v13;
  double v15 = v5;
  if (!v5)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v19[1] = v15;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, v14, v19, 2);
  double v17 = sub_239835F1C(v6, v9, v16);

  if (!v5) {
  return v17;
  }
}

id sub_23983655C(uint64_t a1, uint64_t a2, void *a3)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  double v9 = objc_msgSend_value(*(void **)(a1 + 40), v7, v8);
  id v13 = objc_msgSend_numberWithInteger_(NSNumber, v10, v11, a2);
  v19[0] = v13;
  double v15 = v5;
  if (!v5)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v19[1] = v15;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, v14, v19, 2);
  double v17 = sub_239835F1C(v6, v9, v16);

  if (!v5) {
  return v17;
  }
}

id sub_239836678(uint64_t a1, void *a2, void *a3, void *a4)
{
  v22[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = *(void **)(a1 + 32);
  double v14 = objc_msgSend_value(*(void **)(a1 + 40), v11, v12);
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v22[0] = v16;
  double v17 = v8;
  if (!v8)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15, v22[0]);
  }
  v22[1] = v17;
  id v18 = v9;
  if (!v9)
  {
    id v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v22[2] = v18;
  id v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, v15, v22, 3);
  double v20 = sub_239835F1C(v10, v14, v19);

  if (v9)
  {
    if (v8) {
      goto LABEL_9;
    }
LABEL_14:

    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v8) {
    goto LABEL_14;
  }
LABEL_9:
  if (v7) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:
  return v20;
}

id sub_2398367FC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v23[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  id v13 = objc_msgSend_value(*(void **)(a1 + 40), v10, v11);
  double v15 = v7;
  if (!v7)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  double v17 = objc_msgSend_numberWithBool_(NSNumber, v12, v14, a3, v15);
  v23[1] = v17;
  id v19 = v8;
  if (!v8)
  {
    id v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v18);
  }
  v23[2] = v19;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, v18, v23, 3);
  id v21 = sub_239835F1C(v9, v13, v20);

  if (!v8) {
  if (!v7)
  }

  return v21;
}

id sub_239836958(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v27[4] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = *(void **)(a1 + 32);
  uint64_t v25 = objc_msgSend_value(*(void **)(a1 + 40), v14, v15);
  double v18 = v9;
  if (!v9)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17, v25);
  }
  v27[0] = v18;
  id v19 = v10;
  if (!v10)
  {
    id v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);
  }
  v27[1] = v19;
  double v20 = v11;
  if (!v11)
  {
    double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);
  }
  v27[2] = v20;
  id v21 = v12;
  if (!v12)
  {
    id v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);
  }
  v27[3] = v21;
  double v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, v17, v27, 4, v25);
  id v23 = sub_239835F1C(v13, v26, v22);

  if (v12)
  {
    if (v11) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v11)
    {
LABEL_11:
      if (v10) {
        goto LABEL_12;
      }
LABEL_18:

      if (v9) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v10) {
    goto LABEL_18;
  }
LABEL_12:
  if (v9) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:
  return v23;
}

uint64_t sub_239836B1C(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_removeManagedReference_withOwner_, a2);
}

id sub_239836C70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((objc_msgSend_isObject(v5, v7, v8) & 1) == 0)
  {
    id v19 = (void *)MEMORY[0x263F10390];
    uint64_t v16 = objc_msgSend_currentContext(MEMORY[0x263F10378], v9, v10);
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v19, v20, v21, @"Value is not a function", v16);
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend_integerValue(v6, v9, v10);
  if (v11 >= 1)
  {
    uint64_t v14 = v11;
    if ((unint64_t)v11 >= 5)
    {
      double v15 = (void *)MEMORY[0x263F10390];
      uint64_t v16 = objc_msgSend_currentContext(MEMORY[0x263F10378], v12, v13);
      objc_msgSend_valueWithNewErrorFromMessage_inContext_(v15, v17, v18, @"Argument count exceeds maximum supported value", v16);
      double v22 = LABEL_6:;
      uint64_t v25 = objc_msgSend_currentContext(MEMORY[0x263F10378], v23, v24);
      objc_msgSend_setException_(v25, v26, v27, v22);

      double v28 = 0;
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v30 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF980]);
    do
    {
      CGRect v33 = objc_msgSend_stringWithUTF8String_(NSString, v31, v32, "@");
      objc_msgSend_addObject_(v30, v34, v35, v33);

      --v14;
    }
    while (v14);
    objc_msgSend_componentsJoinedByString_(v30, v31, v32, &stru_26ECF02A8);
    uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (objc_msgSend_isEqualToString_(v6, v12, v13, @"undefined"))
  {
    uint64_t v29 = &stru_26ECF02A8;
    uint64_t v30 = v6;
LABEL_12:

LABEL_13:
    id v36 = objc_alloc(*(Class *)(a1 + 32));
    double v28 = objc_msgSend_initWithFunction_argumentsEncoding_(v36, v37, v38, v5, v29);
    id v6 = v29;
    goto LABEL_14;
  }
  sub_239836E54(v6);
  uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v29) {
    goto LABEL_13;
  }
  double v28 = 0;
LABEL_15:

  return v28;
}

id sub_239836E54(void *a1)
{
  id v1 = a1;
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  double v28 = sub_239837A70;
  uint64_t v29 = sub_239837A80;
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_msgSend_length(v1, v2, v3))
  {
    id v6 = objc_msgSend_componentsSeparatedByString_(v1, v4, v5, @",");
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_239837A88;
    v24[3] = &unk_264DABD08;
    v24[4] = &v25;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, COERCE_DOUBLE(3221225472), v24);
  }
  double v8 = (void *)v26[5];
  if (v8)
  {
    id v9 = objc_msgSend_componentsJoinedByString_(v8, v4, v5, &stru_26ECF02A8);
  }
  else
  {
    double v10 = (void *)MEMORY[0x263F10390];
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v4, v5, @"Unsupported argument type <%@>", v1);
    uint64_t v14 = objc_msgSend_currentContext(MEMORY[0x263F10378], v12, v13);
    double v17 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v10, v15, v16, v11, v14);
    double v20 = objc_msgSend_currentContext(MEMORY[0x263F10378], v18, v19);
    objc_msgSend_setException_(v20, v21, v22, v17);

    id v9 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v9;
}

void sub_239837028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239837040(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v124 = a2;
  id v6 = a4;
  id v7 = a3;
  NSClassFromString(&cfstr_Nsblock.isa);
  if (objc_opt_isKindOfClass())
  {
    double v10 = sub_239836E54(v7);

    if (!v10) {
      goto LABEL_51;
    }
    switch(objc_msgSend_length(v10, v11, v12))
    {
      case 0:
        double v15 = (void (**)(void))MEMORY[0x23ECA7DD0](v124);
        v15[2]();
        break;
      case 1:
        uint64_t v25 = objc_msgSend_stringWithUTF8String_(NSString, v13, v14, "B");
        int isEqualToString = objc_msgSend_isEqualToString_(v10, v26, v27, v25);

        if (isEqualToString)
        {
          double v15 = (void (**)(void))MEMORY[0x23ECA7DD0](v124);
          CGRect v33 = objc_msgSend_firstObject(v6, v31, v32);
          uint64_t v36 = objc_msgSend_BOOLValue(v33, v34, v35);
          ((void (*)(void (**)(void), uint64_t))v15[2])(v15, v36);
          goto LABEL_49;
        }
        v61 = objc_msgSend_stringWithUTF8String_(NSString, v29, v30, "q");
        int v64 = objc_msgSend_isEqualToString_(v10, v62, v63, v61);

        if (v64)
        {
          double v15 = (void (**)(void))MEMORY[0x23ECA7DD0](v124);
          CGRect v33 = objc_msgSend_firstObject(v6, v67, v68);
          uint64_t v71 = objc_msgSend_integerValue(v33, v69, v70);
          ((void (*)(void (**)(void), uint64_t))v15[2])(v15, v71);
          goto LABEL_49;
        }
        v103 = objc_msgSend_stringWithFormat_(NSString, v65, v66, @"%s", "@");
        int v106 = objc_msgSend_isEqualToString_(v10, v104, v105, v103);

        if (!v106) {
          goto LABEL_41;
        }
        double v15 = (void (**)(void))MEMORY[0x23ECA7DD0](v124);
        CGRect v33 = objc_msgSend_objectAtIndexedSubscript_(v6, v107, v108, 0);
        if (v33) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v109, v110, 0);
        }
        else {
        v90 = objc_msgSend_null(MEMORY[0x263EFF9D0], v109, v110);
        }
        ((void (*)(void (**)(void), void *))v15[2])(v15, v90);
        goto LABEL_48;
      case 2:
        v37 = objc_msgSend_stringWithFormat_(NSString, v13, v14, @"%s%s", "@", "@");
        int v40 = objc_msgSend_isEqualToString_(v10, v38, v39, v37);

        if (!v40) {
          goto LABEL_11;
        }
        double v15 = (void (**)(void))MEMORY[0x23ECA7DD0](v124);
        CGRect v33 = objc_msgSend_objectAtIndexedSubscript_(v6, v41, v42, 0);
        if (v33) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v43, v44, 0);
        }
        else {
        v90 = objc_msgSend_null(MEMORY[0x263EFF9D0], v43, v44);
        }
        v94 = objc_msgSend_objectAtIndexedSubscript_(v6, v118, v119, 1);
        if (v94) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v120, v121, 1);
        }
        else {
        v96 = objc_msgSend_null(MEMORY[0x263EFF9D0], v120, v121);
        }
        ((void (*)(void (**)(void), void *, void *))v15[2])(v15, v90, v96);
        goto LABEL_47;
      case 3:
LABEL_11:
        v45 = objc_msgSend_stringWithFormat_(NSString, v13, v14, @"%s%s%s", "@", "@", "@");
        int v48 = objc_msgSend_isEqualToString_(v10, v46, v47, v45);

        if (!v48) {
          goto LABEL_14;
        }
        double v15 = (void (**)(void))MEMORY[0x23ECA7DD0](v124);
        CGRect v33 = objc_msgSend_objectAtIndexedSubscript_(v6, v49, v50, 0);
        if (v33) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v51, v52, 0);
        }
        else {
        v90 = objc_msgSend_null(MEMORY[0x263EFF9D0], v51, v52);
        }
        v94 = objc_msgSend_objectAtIndexedSubscript_(v6, v91, v92, 1);
        if (v94) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v93, v95, 1);
        }
        else {
        v96 = objc_msgSend_null(MEMORY[0x263EFF9D0], v93, v95);
        }
        v100 = objc_msgSend_objectAtIndexedSubscript_(v6, v97, v98, 2);
        if (v100) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v99, v101, 2);
        }
        else {
        v102 = objc_msgSend_null(MEMORY[0x263EFF9D0], v99, v101);
        }
        ((void (*)(void (**)(void), void *, void *, void *))v15[2])(v15, v90, v96, v102);

LABEL_47:
        goto LABEL_48;
      case 4:
LABEL_14:
        v53 = objc_msgSend_stringWithFormat_(NSString, v13, v14, @"%s%s%s%s", "@", "@", "@", "@");
        int v56 = objc_msgSend_isEqualToString_(v10, v54, v55, v53);

        if (!v56) {
          goto LABEL_41;
        }
        double v15 = (void (**)(void))MEMORY[0x23ECA7DD0](v124);
        v123 = objc_msgSend_objectAtIndexedSubscript_(v6, v57, v58, 0);
        if (v123) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v59, v60, 0);
        }
        else {
        v122 = objc_msgSend_null(MEMORY[0x263EFF9D0], v59, v60);
        }
        v75 = objc_msgSend_objectAtIndexedSubscript_(v6, v72, v73, 1);
        if (v75) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v74, v76, 1);
        }
        else {
        v77 = objc_msgSend_null(MEMORY[0x263EFF9D0], v74, v76);
        }
        v81 = objc_msgSend_objectAtIndexedSubscript_(v6, v78, v79, 2);
        if (v81) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v80, v82, 2);
        }
        else {
        v83 = objc_msgSend_null(MEMORY[0x263EFF9D0], v80, v82);
        }
        v87 = objc_msgSend_objectAtIndexedSubscript_(v6, v84, v85, 3);
        if (v87) {
          objc_msgSend_objectAtIndexedSubscript_(v6, v86, v88, 3);
        }
        else {
        v89 = objc_msgSend_null(MEMORY[0x263EFF9D0], v86, v88);
        }
        ((void (*)(void (**)(void), void *, void *, void *, void *))v15[2])(v15, v122, v77, v83, v89);

        break;
      default:
LABEL_41:
        v111 = (void *)MEMORY[0x263F10390];
        objc_msgSend_currentContext(MEMORY[0x263F10378], v13, v14);
        double v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        CGRect v33 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v111, v112, v113, @"Unsupported block invocation", v15);
        v90 = objc_msgSend_currentContext(MEMORY[0x263F10378], v114, v115);
        objc_msgSend_setException_(v90, v116, v117, v33);
LABEL_48:

LABEL_49:
        break;
    }
  }
  else
  {
    double v16 = (void *)MEMORY[0x263F10390];
    objc_msgSend_currentContext(MEMORY[0x263F10378], v8, v9);
    double v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    double v19 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v16, v17, v18, @"Argument is not block", v15);
    double v22 = objc_msgSend_currentContext(MEMORY[0x263F10378], v20, v21);
    objc_msgSend_setException_(v22, v23, v24, v19);

    double v10 = v7;
  }

LABEL_51:
}

id sub_239837750(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((objc_msgSend_isObject(v5, v7, v8) & 1) == 0)
  {
    double v19 = (void *)MEMORY[0x263F10390];
    double v16 = objc_msgSend_currentContext(MEMORY[0x263F10378], v9, v10);
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v19, v20, v21, @"Value is not a function", v16);
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend_integerValue(v6, v9, v10);
  if (v11 >= 1)
  {
    uint64_t v14 = v11;
    if ((unint64_t)v11 >= 5)
    {
      double v15 = (void *)MEMORY[0x263F10390];
      double v16 = objc_msgSend_currentContext(MEMORY[0x263F10378], v12, v13);
      objc_msgSend_valueWithNewErrorFromMessage_inContext_(v15, v17, v18, @"Argument count exceeds maximum supported value", v16);
      double v22 = LABEL_6:;
      uint64_t v25 = objc_msgSend_currentContext(MEMORY[0x263F10378], v23, v24);
      objc_msgSend_setException_(v25, v26, v27, v22);

      double v28 = 0;
LABEL_14:

      goto LABEL_15;
    }
    double v30 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF980]);
    do
    {
      CGRect v33 = objc_msgSend_stringWithUTF8String_(NSString, v31, v32, "@");
      objc_msgSend_addObject_(v30, v34, v35, v33);

      --v14;
    }
    while (v14);
    objc_msgSend_componentsJoinedByString_(v30, v31, v32, &stru_26ECF02A8);
    uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (objc_msgSend_isEqualToString_(v6, v12, v13, @"undefined"))
  {
    uint64_t v29 = &stru_26ECF02A8;
    double v30 = v6;
LABEL_12:

LABEL_13:
    id v36 = objc_alloc(*(Class *)(a1 + 32));
    double v28 = objc_msgSend_initWithFunctionWithValue_argumentsEncoding_(v36, v37, v38, v5, v29);
    id v6 = v29;
    goto LABEL_14;
  }
  sub_239836E54(v6);
  uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v29) {
    goto LABEL_13;
  }
  double v28 = 0;
LABEL_15:

  return v28;
}

void sub_239837940(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4 = objc_msgSend_context(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_setException_(v4, v5, v6, 0);

  double v9 = objc_msgSend_callWithArguments_(*(void **)(a1 + 32), v7, v8, *(void *)(a1 + 40));
  id v10 = sub_2398379A4(v9);
}

id sub_2398379A4(void *a1)
{
  id v1 = a1;
  uint64_t v4 = objc_msgSend_context(v1, v2, v3);
  id v7 = objc_msgSend_exception(v4, v5, v6);

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263EFF940]);
    uint64_t v11 = objc_msgSend_toString(v7, v9, v10);
    uint64_t v14 = objc_msgSend_initWithName_reason_userInfo_(v8, v12, v13, @"TMLJSException", v11, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v15, v16, v14);
  }
  return v1;
}

uint64_t sub_239837A70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_239837A80(uint64_t a1)
{
}

void sub_239837A88(uint64_t a1, const char *a2, double a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, a2, a3, a2);
  objc_msgSend_encodedTypeForType_(TMLTypeRegistry, v8, v9, v7);
  double v10 = (const char *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  double v13 = *(void **)(v12 + 40);
  uint64_t v14 = (char *)v10;
  if (v10)
  {
    objc_msgSend_addObject_(v13, v10, v11, v10);
  }
  else
  {
    *(void *)(v12 + 40) = 0;

    *a5 = 1;
  }
}

void sub_239837C38(uint64_t a1)
{
  size_t v2 = strlen("83847776E(RNtV#K83.35M.b&(f-fA35yuEaB77wH8xXd!2N:Gpem&TlB@-eN7HLfA#1EbA:B3k8UjNjHz:YsIky>2OIO3{9p7Nw2Ev.bt*uM27%DDQU}.dHaQnkCT4:BV.=W[7#/xzQ$-DvE{FVe[3Z0hn8w$/Fpc1&lq(A3FbE?5jn=KwO#QgvqFUDzEEf?AV$#21-[=]By=6!x(n2f0u@c-2XmH.wOkB[wFbh=vRPE:BrRza3tBMWv{%m)x(mL@1y=p/y-0gdvg1i0wPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%A$x066BCjZwmYU2x>z6<A=R&%vrcx%C{jFNwPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%B2(7b0syb]v{%mAz/OV=A+PGawPzi}B606$xJ5F.C4>C$B5c:%x(v)g5ciW:3jH#!A=#ebwMq-4l#@$Avrcx%C]vz82xaN6x(v)g5^&e-v@#B6zEENha$4CwvqXLMA.{s/x(E-%A:-^9s7#+&q!o#)x>7Z}i=w$Vx(v)giX>ET7?mG4zE)s1p?sVYAa&*6vqF.UBzkVhA$wu<8vu*<wPzH7xK#i)y.vdzlqRllx(E-%A:-=56:+g:Acb/jzGuA$wnbK}x(v($A^n&Ev@Dm5wN/*UwPzH7xK#i)y=VGNBzkVhB2(6T3kEn)x()A<Bza6Ny?ml/By!r(wP.L}5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@[hx(mTbs7#+&l$HgCxjk)[i=PpNB.9P?Ef{%dzFsh]x([2RwO+{<vru6TB.bYbpJgz&z/fRc5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@R73i$G*BzkVhA$O*<x>8m0z/f07C{jtAzFsh]x([2RwO+{<vru6wADL&nwJB:GBzkVhB2(5(3j7Y{z/wS+vqVRSa{-miz/wS+vqW&q3mG}aBAh8bC4B3VzF<2}By!#VwPzH7xK#i)y&-V(BzaP:A=#ebwPFy@8wAI^x>g^)Bzku3wPz&81Z#B(vr<4CA+fukx>qE0lVl<WwN/*[wkD&Tx(E-%A:-^9s7#+&q!o#)x>7Z}iX<+z8E)h[v}xEMwPzH7xK#i)y^SbUzE)s1x(v(20u8<-3ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y:6*dvqYN^y/1X-x(E-%A:-=Kz/fD7v@#B6zAna:3jGo*p?sVYAa&*6vqEb03iUlPzdKs:B98CpzF6^!a@gH)x>g^)Bzku3wPwy/pe+d)nKKx@baw/A7^*RSwO#QgvqFUDzEEf?AZTFPwOkB[wG)@K3mfg[zGG]cy!XtQvp%d(l${g1x(^^5zF<2}BwMK?x(E-%A:-+}0u8):2v?s.BAg/a5!Ez%lUgdSA:-=UvqYH^wPwXc3jp--A+PGawPzi}5!4b]p?sVYAa&*6vqD?[3i+0YA=k$h2tOh^A=M8sa$WqozGG]cy!XtQvp%d(i+h@nl${ZLz/fD7v@$KUA+PGawPzi}i+rtLz/N(!0Wu+c3ohKbzGG]cy!XtQvp%d(l${g1x(^^5C4CX<wPzH7xK#i)y^zPPwPz)bB7Gi1zGFoPByw6Cq+mJ38xf1*v}xL1A:-+%5jn=KwO#QgvqFUDzEEf?AVb&63ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y-jx55N/i[wPz)bB7Gi1zGGz$Byt^?wnbK}x(v($A^nMk3iUx<B7(l>z^)D)v@@[Sv}xL1A:-=UvqYH^wPx?xx>fRCB7ociwPyQUA+PGawPzi}i:(MxwPz)bB7Gi1zGFoPByvjdq=umGc&$PF0sy2XwO#QgvqFUDzEEf?AZTRLlVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi}a%ZVfzGG]cy!XtQvp%d(i+h@nlVl<WwN/*UwPzH7xK#i)y=S%Cb0unMv}xL1A:-=UvqYH^wPygMwl0OVvru6VByxo55ciW*3i$6LzGG]cy.vpDlpks4BAg/ao<}{FxjV9cCm2y3w"
         "O#QgvqFUDzEEf?A-V%>y/j?=Bz(hhq/(C&wE[>X8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8wiwWwnbK}5^&e-v@#B6zEENha%pxbzGG]cy!"
         "XtQvp%d(i^kpOy/j?=Bz(hhq/(C&wJzjvbc7.Kc$u?aBAg/ao<}{FxjV9Kx>fXwx(3:!lVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO#QgvqDL/lQB"
         "dKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi}8w0kVwPz*fAUnQLq:>.Ez/N3Qv}xL1A:-=UvqYH^wPx?xx>fXwx(3:!lVl<"
         "WwN/*UwPzH7xK#i)y=VcFA=k$Vc&$>9mSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776E(RNtV#K83.35M.b&(f-fA35yuEaB77wH8xXd!2N:Gpem&TlB@-eN7HLfA#1EbA:B3k8UjNjHz:YsIky>2OIO3{9p7Nw2Ev.bt*uM27%DDQU}.dHaQnkCT4:BV.=W[7#/xzQ$-DvE{FVe[3Z0hn8w$/Fpc1&lq(A3FbE?5jn=KwO#QgvqFUDzEEf?AV$#21-[=]By=6!x(n2f0u@c-2XmH.wOkB[wFbh=vRPE:BrRza3tBMWv{%m)x(mL@1y=p/y-0gdvg1i0wPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%A$x066BCjZwmYU2x>z6<A=R&%vrcx%C{jFNwPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%B2(7b0syb]v{%mAz/OV=A+PGawPzi}B606$xJ5F.C4>C$B5c:%x(v)g5ciW:3jH#!A=#ebwMq-4l#@$Avrcx%C]vz82xaN6x(v)g5^&e-v@#B6zEENha$4CwvqXLMA.{s/x(E-%A:-^9s7#+&q!o#)x>7Z}i=w$Vx(v)giX>ET7?mG4zE)s1p?sVYAa&*6vqF.UBzkVhA$wu<8vu*<wPzH7xK#i)y.vdzlqRllx(E-%A:-=56:+g:Acb/jzGuA$wnbK}x(v($A^n&Ev@Dm5wN/*UwPzH7xK#i)y=VGNBzkVhB2(6T3kEn)x()A<Bza6Ny?ml/By!r(wP.L}5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@[hx(mTbs7#+&l$HgCxjk)[i=PpNB.9P?Ef{%dzFsh]x([2RwO+{<vru6TB.bYbpJgz&z/fRc5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@R73i$G*BzkVhA$O*<x>8m0z/f07C{jtAzFsh]x([2RwO+{<vru6wADL&nwJB:GBzkVhB2(5(3j7Y{z/wS+vqVRSa{-miz/wS+vqW&q3mG}aBAh8bC4B3VzF<2}By!#VwPzH7xK#i)y&-V(BzaP:A=#ebwPFy@8wAI^x>g^)Bzku3wPz&81Z#B(vr<4CA+fukx>qE0lVl<WwN/*[wkD&Tx(E-%A:-^9s7#+&q!o#)x>7Z}iX<+z8E)h[v}xEMwPzH7xK#i)y^SbUzE)s1x(v(20u8<-3ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y:6*dvqYN^y/1X-x(E-%A:-=Kz/fD7v@#B6zAna:3jGo*p?sVYAa&*6vqEb03iUlPzdKs:B98CpzF6^!a@gH)x>g^)Bzku3wPwy/pe+d)nKKx@baw/A7^*RSwO#QgvqFUDzEEf?AZTFPwOkB[wG)@K3mfg[zGG]cy!XtQvp%d(l${g1x(^^5zF<2}BwMK?x(E-%A:-+}0u8):2v?s.BAg/a5!Ez%lUgdSA:-=UvqYH^wPwXc3jp--A+PGawPzi}5!4b]p?sVYAa&*6vqD?[3i+0YA=k$h2tOh^A=M8sa$WqozGG]cy!XtQvp%d(i+h@nl${ZLz/fD7v@$KUA+PGawPzi}i+rtLz/N(!0Wu+c3ohKbzGG]cy!XtQvp%d(l${g1x(^^5C4CX<wPzH7xK#i)y^zPPwPz)bB7Gi1zGFoPByw6Cq+mJ38xf1*v}xL1A:-+%5jn=KwO#QgvqFUDzEEf?AVb&63ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y-jx55N/i[wPz)bB7Gi1zGGz$Byt^?wnbK}x(v($A^nMk3iUx<B7(l>z^)D)v@@[Sv}xL1A:-=UvqYH^wPx?xx>fRCB7ociwPyQUA+PGawPzi}i:(MxwPz)bB7Gi1zGFoPByvjdq=umGc&$PF0sy"
    "2XwO#QgvqFUDzEEf?AZTRLlVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi"
    "}a%ZVfzGG]cy!XtQvp%d(i+h@nlVl<WwN/*UwPzH7xK#i)y=S%Cb0unMv}xL1A:-=UvqYH^wPygMwl0OVvru6VByxo55ciW*3i$6LzGG]cy.vpDlpks4"
    "BAg/ao<}{FxjV9cCm2y3wO#QgvqFUDzEEf?A-V%>y/j?=Bz(hhq/(C&wE[>X8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8wiwWwnbK}5^&e-v@#B6z"
    "EENha%pxbzGG]cy!XtQvp%d(i^kpOy/j?=Bz(hhq/(C&wJzjvbc7.Kc$u?aBAg/ao<}{FxjV9Kx>fXwx(3:!lVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO"
    "#QgvqDL/lQBdKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi}8w0kVwPz*fAUnQLq:>.Ez/N3Qv}xL1A:-=UvqYH^wPx?xx>fXwx(3"
    ":!lVl<WwN/*UwPzH7xK#i)y=VcFA=k$Vc&$>9mSiA!wmoN]z/b",
    v2,
    0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_239838190(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(objc_class **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  double v9 = *(void **)(a1 + 32);
  uint64_t v12 = objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v10, v11, v6, 20);

  double v15 = objc_msgSend_attributedStringWithFormat_attributes_(v9, v13, v14, v7, v12);

  double v18 = objc_msgSend_initWithAttributedString_(v8, v16, v17, v15);
  return v18;
}

id sub_239838250(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = objc_alloc_init(TMLAttributedString_Attributes);
  objc_msgSend_setValuesForKeysWithDictionary_(v3, v4, v5, v2);

  id v8 = objc_msgSend_attributes(v3, v6, v7);

  return v8;
}

id sub_2398382BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = (void *)MEMORY[0x263EFF9A0];
    id v11 = v7;
    objc_msgSend_dictionaryWithDictionary_(v10, v12, v13, v8);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    double v16 = objc_msgSend_parse_tags_withRules_(TMLMarkdownParser, v14, v15, v11, &v29, v9);

    id v17 = objc_alloc(*(Class *)(a1 + 32));
    double v18 = *(void **)(a1 + 32);
    double v21 = objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v19, v20, v29, 20);
    double v24 = objc_msgSend_attributedStringWithFormat_attributes_(v18, v22, v23, v16, v21);
    double v27 = objc_msgSend_initWithAttributedString_(v17, v25, v26, v24);
  }
  else
  {
    double v27 = 0;
  }

  return v27;
}

uint64_t sub_2398388B8(uint64_t a1, void *a2, double a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend_isEqualToString_(a2, (const char *)a2, a3, *(void *)(a1 + 32));
  *a5 = result;
  return result;
}

void sub_2398388E8(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = objc_msgSend_objectAtIndexedSubscript_(v5, v7, v8, a3);
  uint64_t v12 = objc_msgSend_rangeValue(v9, v10, v11);
  uint64_t v14 = v13;

  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v15, v16, v6);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v14) {
    BOOL v17 = v27 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    double v18 = objc_alloc_init(TMLAttributedString_Attributes);
    objc_msgSend_setValuesForKeysWithDictionary_(v18, v19, v20, v27);
    double v21 = *(void **)(a1 + 48);
    double v24 = objc_msgSend_attributes(v18, v22, v23);
    objc_msgSend_addAttributes_range_(v21, v25, v26, v24, v12, v14);
  }
}

uint64_t sub_239838AD4(uint64_t result, const char *a2, double a3)
{
  if (a2) {
    return objc_msgSend_addObject_(*(void **)(result + 32), a2, a3, a2);
  }
  return result;
}

id sub_239839F48(uint64_t a1, double a2, double a3)
{
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  id v7 = objc_msgSend_initWithSize_(v5, v6, a2, a3);
  return v7;
}

BOOL sub_239839F90(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_size(a2, v5, v6);
  double v8 = v7;
  double v10 = v9;
  objc_msgSend_size(v4, v11, v7);
  double v13 = v12;
  double v15 = v14;

  return v10 == v15 && v8 == v13;
}

void sub_23983A500(uint64_t a1)
{
  size_t v2 = strlen("838477766fbYoy<U]]mBh>@>h3EF2g[]2ImjAm3Pg)HD/648eE.=sK$v!fR0/JFLB]pP*wxdm=OEMpfQcNL)xb+<7tOtE/)RhnRM@{<M%iN$uZzy6f!L2cWfVNxnUl3:QTA}TW/CIv}/1FAIsi?OdfDK]H=xd12m<^0pgIV!3pCjco&B#jx>7{&AV#k93#6M!xjTLDy?lQAoCdCIA+(M[a%mjby&r/(y?Xibwjg0Iv@=p5BzkVh5^AA0A+PA77Y:%<3klcjo>wx!vp%dBx)a5Yvr(^lBp]9Uq+Z?AB75Y)oKSi+B-W$C0TYxhq=v^Lv@2T@r+Vb?5^zucr+Vb?a}$v?B98bayH}J02#at%Bzkl2wPw$n3k3Y:x(dp2x(v(SB-H]jx(v(424RT{vR/P)0wU&a4S=-2A=:P+x(dp2x(mL{0u@1{Byxiil2HyNvruj3xegOp4rDSfA6XwQzddK2zF6HYa}nQnz/w0Wx(dp2x(mMs9106/B3TXTzddK2zF6HZa}5aal2HyNvruj3xeiD]6LRD0Bxrf#xHW2JzdMT/x>7{&AU5^24ginJA:-/@5^ik^v@@R63i$S]x>7{&AUnWMq=v^Lv@2T@a@j)gx()A<Bzac:vqPNpB98bayH}JE3k0QQo&B+$B8$=5wLuJTz/{deSrARFo&B+$B8$=5wPHdRA8{W:Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#?q5[bo(x)a5Pz/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(a0u@D&5Pz=4B7Glhvruj4zC$U5y?jjZB.L-n7Y=9J3lS>[wk)OTzGxJlx(v(*z+$E=B7Glhvruj4zC$U5y?jdU8w@>]Ab]JhwO#P#BzkVhq/)q3wFbb*x(n2xn^Vbux>fOtzEWl]q!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sl<:oix>gaMv}xv$wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#P%3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zyNBH4}Gx+qE%]-xkQ1BBzk]f5ciW<3jHA.zGYPiB76f8z/cf$o&Bz$zGYPiB76f8z/d3&3l:Rcy&06>vqZd2BzkVhrbUPNwPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zC$U5y?jjZB.L-ndOf%TwnbNMByxiiq!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sgZT!rx(4PLwN/T}wKf*Fx)a500u90^3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zzz[k2v}K&ze16j5ci%Wwnca4x(!tJqvjmYwPq<7B97l0wPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zGx]By?jjZB.L-na@LAjADL&lBwN0?B7Glhvruj4zC$U5y?kTm?#Kf3o&B+$B8$=5wMikTAbn%8wLuJTz/{dm4]2$%wPI{3xjT+BD2E?Ea@*}5BAg/7y?W^1q/#LVvq{s5z/cf(B98CpzF7dh3j?l0vqfK(zF8sBAcb/jzw0d{BAh8kxcF2%3uHu0v{%s#x(v(426j)bx(mMc6BCgYzdd6*rb3C<wFbh*BAh8kxcE/)1.?*ZxjRXVx(do>wG?={3#GM^x<<FBy?lQAoCdCIA+({i3i$6HAcb/jzw0d{BAh8kxcFc04qxV/xjU1:vSVsay?jj-B98CpzF6p:3jfB9q!p2>x(v>@RW0Lso&Bz$zGYPiB76f8z/c:u3j?h?y?m9#wN[IDB8$=5wFbqzq+Z?AB75Y)7Y+*c3l0-0v{%gIvrcE7v}/)<zGFDXwO#Q7w[+*%5^z9frAhQU7Y+*d3lj7$zeTJcp*[x^x>7<@vqZfUwmYU2x>z6<A=R&%vrcx%C]cMqGAhz>x(n06A=:P?BywV)zdNQb5ciWR3iLA>y.u?)A+(Tb3j7lTy?mG)zdKs:B98CpzF6>33jpoYze:r5BzkVh5^q-Xz!0MbiCAwLwPz(UBAy@3xL?r#BujRWBz9%RB"
         "y/Ggvru6Ix(4u#vqPNpv@Dj6y?mZ5z/e9OzE^M{AYL%N3jpG+B7GxlraQq@5ciWV3iUDZCYTM5B98CpzF6>33jpoYze:r5BzkVh5^q-Xz!0Mb9C"
         "GzjwPz((wQ5qTv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlq/(.-yH}I$0u8TV2xL03v@2T@5^.ohq/(.-yH}J86ab7Rz/6DfwPRT8zw0aZy&r"
         "*0a%pPqB7Gxlq/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=EMB8$=5wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#i?3s!0>Abo9cx(v("
         "41.8p^v@0nfB7Gl1o>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=W/x>7{&AU5l&6BC7^Bzkl2wPwy&o&B#jx>7{&AVbO#3s!0>Abo9c"
         "x(v(41.8p^v@0nfB7Gl1q/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlo>wx!vp%c.0u8TV2w[3[B75Y)5^.oho>wx!vp%c&6ab7Rz"
         "/6DfwPRT8zw0aZy&r*0a%pPqB7Gxlo>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL$a0sxrTwO#3ABAy@3xL?r#BpXD>3jl(TA+(u<B-Ipp5^![Rx("
         "4u#vqPM*26j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a#:NOzE=4PBywV)zdNQbi^kpWxHcDRwPzV%By^{Qy?mG)zdL+rz/6DfwPRT8zB!hNwnC"
         "*$iX<Cq2Y<M{wk)b+BpXD>4HJtXwQ5qf26j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a@+PmzE=ZTCYU#Rz/6DfwPRT8zB!hNwnC*$iTQ&F3jfB"
         "9o>wx!vp%c}843N:vr(^lBp]9Uq+Z?AB75Y)oKSi+B-X/P3la4$zE^s0p*[x^x>7<@vqZfUwmYU2x>z6<AUnNKq=M*?l(k}G910r!v}f7>B7]8$"
         "y?X0poKRywy.u}[BAh8kxcF2%40c92B.>OSCYmwqwFbbPz/oCo777p/wPI{bz/cf]o&B#4B8#5lzwSx#5deOLA=M8s5^IfgmriA!AV#k93V*Dcz"
         "ddEgraQq@5^AA0A+PA7a{[UVrz(H619FT2gck*Nx(mTbs7#+&q!p2>x(v(25e(k&2xKD$B7]Mg5^.ohq!p2>x(v(k5nu2@Bxrf#xJ5F-B7]MgiW"
         "$qknLr=tdHFT-B-7.#BzkVh");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "838477766fbYoy<U]]mBh>@>h3EF2g[]2ImjAm3Pg)HD/648eE.=sK$v!fR0/JFLB]pP*wxdm=OEMpfQcNL)xb+<7tOtE/)RhnRM@{<M%iN$uZzy6f!L2cWfVNxnUl3:QTA}TW/CIv}/1FAIsi?OdfDK]H=xd12m<^0pgIV!3pCjco&B#jx>7{&AV#k93#6M!xjTLDy?lQAoCdCIA+(M[a%mjby&r/(y?Xibwjg0Iv@=p5BzkVh5^AA0A+PA77Y:%<3klcjo>wx!vp%dBx)a5Yvr(^lBp]9Uq+Z?AB75Y)oKSi+B-W$C0TYxhq=v^Lv@2T@r+Vb?5^zucr+Vb?a}$v?B98bayH}J02#at%Bzkl2wPw$n3k3Y:x(dp2x(v(SB-H]jx(v(424RT{vR/P)0wU&a4S=-2A=:P+x(dp2x(mL{0u@1{Byxiil2HyNvruj3xegOp4rDSfA6XwQzddK2zF6HYa}nQnz/w0Wx(dp2x(mMs9106/B3TXTzddK2zF6HZa}5aal2HyNvruj3xeiD]6LRD0Bxrf#xHW2JzdMT/x>7{&AU5^24ginJA:-/@5^ik^v@@R63i$S]x>7{&AUnWMq=v^Lv@2T@a@j)gx()A<Bzac:vqPNpB98bayH}JE3k0QQo&B+$B8$=5wLuJTz/{deSrARFo&B+$B8$=5wPHdRA8{W:Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#?q5[bo(x)a5Pz/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(a0u@D&5Pz=4B7Glhvruj4zC$U5y?jjZB.L-n7Y=9J3lS>[wk)OTzGxJlx(v(*z+$E=B7Glhvruj4zC$U5y?jdU8w@>]Ab]JhwO#P#BzkVhq/)q3wFbb*x(n2xn^Vbux>fOtzEWl]q!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sl<:oix>gaMv}xv$wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#P%3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zyNBH4}Gx+qE%]-xkQ1BBzk]f5ciW<3jHA.zGYPiB76f8z/cf$o&Bz$zGYPiB76f8z/d3&3l:Rcy&06>vqZd2BzkVhrbUPNwPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zC$U5y?jjZB.L-ndOf%TwnbNMByxiiq!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sgZT!rx(4PLwN/T}wKf*Fx)a500u90^3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zzz[k2v}K&ze16j5ci%Wwnca4x(!tJqvjmYwPq<7B97l0wPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zGx]By?jjZB.L-na@LAjADL&lBwN0?B7Glhvruj4zC$U5y?kTm?#Kf3o&B+$B8$=5wMikTAbn%8wLuJTz/{dm4]2$%wPI{3xjT+BD2E?Ea@*}5BAg/7y?W^1q/#LVvq{s5z/cf(B98CpzF7dh3j?l0vqfK(zF8sBAcb/jzw0d{BAh8kxcF2%3uHu0v{%s#x(v(426j)bx(mMc6BCgYzdd6*rb3C<wFbh*BAh8kxcE/)1.?*ZxjRXVx(do>wG?={3#GM^x<<FBy?lQAoCdCIA+({i3i$6HAcb/jzw0d{BAh8kxcFc04qxV/xjU1:vSVsay?jj-B98CpzF6p:3jfB9q!p2>x(v>@RW0Lso&Bz$zGYPiB76f8z/c:u3j?h?y?m9#wN["
    "IDB8$=5wFbqzq+Z?AB75Y)7Y+*c3l0-0v{%gIvrcE7v}/)<zGFDXwO#Q7w[+*%5^z9frAhQU7Y+*d3lj7$zeTJcp*[x^x>7<@vqZfUwmYU2x>z6<A=R&"
    "%vrcx%C]cMqGAhz>x(n06A=:P?BywV)zdNQb5ciWR3iLA>y.u?)A+(Tb3j7lTy?mG)zdKs:B98CpzF6>33jpoYze:r5BzkVh5^q-Xz!0MbiCAwLwPz(U"
    "BAy@3xL?r#BujRWBz9%RBy/Ggvru6Ix(4u#vqPNpv@Dj6y?mZ5z/e9OzE^M{AYL%N3jpG+B7GxlraQq@5ciWV3iUDZCYTM5B98CpzF6>33jpoYze:r5B"
    "zkVh5^q-Xz!0Mb9CGzjwPz((wQ5qTv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlq/(.-yH}I$0u8TV2xL03v@2T@5^.ohq/(.-yH}J86ab7Rz/6DfwP"
    "RT8zw0aZy&r*0a%pPqB7Gxlq/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=EMB8$=5wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#i?3s!0>Abo"
    "9cx(v(41.8p^v@0nfB7Gl1o>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=W/x>7{&AU5l&6BC7^Bzkl2wPwy&o&B#jx>7{&AVbO#3s!0>Abo9"
    "cx(v(41.8p^v@0nfB7Gl1q/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlo>wx!vp%c.0u8TV2w[3[B75Y)5^.oho>wx!vp%c&6ab7Rz/6Df"
    "wPRT8zw0aZy&r*0a%pPqB7Gxlo>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL$a0sxrTwO#3ABAy@3xL?r#BpXD>3jl(TA+(u<B-Ipp5^![Rx(4u#vqPM*2"
    "6j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a#:NOzE=4PBywV)zdNQbi^kpWxHcDRwPzV%By^{Qy?mG)zdL+rz/6DfwPRT8zB!hNwnC*$iX<Cq2Y<M{wk"
    ")b+BpXD>4HJtXwQ5qf26j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a@+PmzE=ZTCYU#Rz/6DfwPRT8zB!hNwnC*$iTQ&F3jfB9o>wx!vp%c}843N:vr("
    "^lBp]9Uq+Z?AB75Y)oKSi+B-X/P3la4$zE^s0p*[x^x>7<@vqZfUwmYU2x>z6<AUnNKq=M*?l(k}G910r!v}f7>B7]8$y?X0poKRywy.u}[BAh8kxcF2"
    "%40c92B.>OSCYmwqwFbbPz/oCo777p/wPI{bz/cf]o&B#4B8#5lzwSx#5deOLA=M8s5^IfgmriA!AV#k93V*DczddEgraQq@5^AA0A+PA7a{[UVrz(H6"
    "19FT2gck*Nx(mTbs7#+&q!p2>x(v(25e(k&2xKD$B7]Mg5^.ohq!p2>x(v(k5nu2@Bxrf#xJ5F-B7]MgiW$qknLr=tdHFT-B-7.#BzkVh",
    v2,
    0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_23983A630(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F12598]);
    id v6 = (id)objc_msgSend_initWithSession_(v3, v4, v5, v2);
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F12598]);
  }
  id v7 = v6;

  return v7;
}

id sub_23983A690()
{
  id v0 = objc_alloc_init(MEMORY[0x263F125B0]);
  return v0;
}

id sub_23983A6C0(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F125A0];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v7 = objc_msgSend_initWithAlternateLayout_(v4, v5, v6, v3);

  return v7;
}

void sub_23983AA50(uint64_t a1)
{
  size_t v2 = strlen("83847776i!Wwx+<A{R!L88?/I*mXO<n0upa1gbHmA!De^PzW77&=d1<z=WW#Az?Ie9U=90/+SBXB33?T^{M0koE8oDsH)Qrj{Yk)MEAcBN>LH*o1?Nb!9DOEKZ#tN.Rv/[rp$7]H{JEy&:LnFCiFbjQ0F46Df[E-xEC^1(yE3rWYNry]F}Abok#vruj4zC$j!A=+/lBv/$XzzBrY4@2J(zDyK]xHuYQBywW35d/-]3i$6VzGGq%Bp[)Epd5@qBywW3a}Vttv@Dl^x([2Qz/fV9v@%:s]92EqlRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li3$Bi[BywW3q/(}#wFbFupd5@qBywW3q/(}#wG&f56>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{j1h3VGJ{wO#PWA=l8t5^H^0m@&J<A3u894pK6{wPzV%By!iQzdKs:B98CpzF7de3i$6VzGGq%Bp[)Epd5@qBywW37Y+/)3i$AVB8$=5wFbh*BAh8kxcF5$4pK6?z*cm>wncd1zF6N+vScg3a@7B]vqG:#Cxl5WBzkVhA$OQ+z/oCo5^![PwO+{<vru5[25^%=wN/*aapn%bxM53fwk^eWCt8Z*yH}3zz/fV9v@#=81y=p/y:6]c4@+@$wO#PSz/fV9x(mH55^}64lVl<:vqfQ<AXYSZ8dWr1v@=p5Bz(g?z/O-!ADL#owN[CBD2<Jda@R$xwPIv4x(FfjAZ<$/qE%&<x(W=}oj-x&gf+edC4>JilVl<:A=k=gwPymUA-E0)zF%-plVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy6aUd.IwP{HWzGG]qy&0W6mSirEzFKcdCwY=^zGGq%Buhf&3k^C<xj#9}xj#x-A=k]dA==Odx([2YwQa*/8vW2QyH}=726j)bx(mM46BCgYwmYU2x>z6<AUnN$BAh8kxcFQmx>I9}x>Ia3p&ZF[wPz)rs7#+&oj-xfx>g^)Bzku3wPx*!p6}?Yx>qGQz/fVqz!%l3AZ<$/lVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy68y]#BwP{HWzGG]qy&0W6mSirmz/fV9v@%:!r0<N/x>qGQz/fVqz!%l3AZ<$/pgXSpz/fV9v@@m[8wAI-v@DmbvpKx(2$4DPz/fV9v@@[nd%tSrCscp^BAhqoy?mSRz/OP:Cscp^BywW3iTUuS3lqGelVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li6>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{i>d2XmH.wOkB[wFbh=vRPE:BrSsAa8(miwnbKZBy^{WA-lK=wN/*@z/eu.p&ZF[wPz)r5^}Dkp&ZbTx>7N[wG&Yk9=MdhwnbKZBy^{WA-lK=wN/*@z/eu.lVl<:vpKx(3R<R%A+e=}v{%E<a$r{sAb]J2x>7N[wKZPUmq=Kyy?W^1lVl<:vpKx(3R<R%A+e=}v{%E<bc.pU7EH}+z/fV9v@$KYv@2T@l$HgCxjk)[b1h?Ov@DmbvpKyQx>7{&AZTRLlT:>xwO.[U8yC<@Aa@/$wPwz7lRZ0!zGGq%BwMWYyH}J!x>qGQz/fVqz!%l3AWQ#kQx7YFv@DmbvpKyQx>7{&AZTRLq!o=Rv@$7RzGGq%BwN0@AaK6iC[o#{cKH5%x>7{&AUoxWpd5@qBywW3p?:APwPy*=wP{HWzGG]qy&0W68ybU2v@DmbvpKy#A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5Tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@$K/z/xodBA][}0Wri%3lAX}zGGq%BwMWYyH}JOx>gdNy?m9#lVl<:vpKz25ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS95EF!Nz/fV9v@#=81Z#B(vr<4tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@#=Mc&$PB0sx&Sz/fV9v@$KYv@2T@l${ggwO+{/Bvf$:BywW35ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A"
         "-M)=Cscp^BAhqoy?mS96BC7Pz/fV9v@@s&lRZ0!zGGq%BrR/pz/fV9v@$KYv@2T@i+h@nq!o=Rv@$7RzGGq%Bug/KbaO-wcU47jBywW3p?:APwP"
         "ygMwk^5QwN/*Hz/fV9v@$K/z/xodBzkrc5ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS98vv6^z/fV9v@#Wgz/xodBzk"
         "rc5^qY:A::kqdpWplBywW3p?:APwPx?xx>gdNy?m9#lVl<:vpKyQA=k]dA==2bB2>YJbaX(za45^<z/fV9v@$:=wP{HWzGG]qy&0W6l$HgCxjk)"
         "[bgV=4l1s?JBywW3r+Vb?lVl<:A=k=gwPyZ.z/](bp?sVVz/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA[A08yV16C4>Jiv@DmbA=k=g"
         "wPwz1lRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS99sr6>A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5$v@DmbvpKyWx>qGQz/fVqz!%l3AYOnPz/](bp"
         "?sVVz/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA][}0Wsrs3m/R8zGGq%Bxi9!Cscp^BAhqoy?mSPx>fOHze:r5By!J/Bza3WzGGq%Bp"
         "XD>dgcMdx>qGQz/fVqz!%l3AUofQpd5@qBywW3r+Vb?lVl<:A=k=gwPwX63i$6VzGGq%Bp[)Epd5@qBywW3a$WqyzGGq%Bxi9!Cscp^BAhqoy?m"
         "SFwnbNwz/6DfwPRG+x([2Qz/fV9v@%:W0XaEyz/fV9v@#=w3pX@RzE^f$x(v>");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776i!Wwx+<A{R!L88?/I*mXO<n0upa1gbHmA!De^PzW77&=d1<z=WW#Az?Ie9U=90/+SBXB33?T^{M0koE8oDsH)Qrj{Yk)MEAcBN>LH*o1?Nb!9DOEKZ#tN.Rv/[rp$7]H{JEy&:LnFCiFbjQ0F46Df[E-xEC^1(yE3rWYNry]F}Abok#vruj4zC$j!A=+/lBv/$XzzBrY4@2J(zDyK]xHuYQBywW35d/-]3i$6VzGGq%Bp[)Epd5@qBywW3a}Vttv@Dl^x([2Qz/fV9v@%:s]92EqlRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li3$Bi[BywW3q/(}#wFbFupd5@qBywW3q/(}#wG&f56>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{j1h3VGJ{wO#PWA=l8t5^H^0m@&J<A3u894pK6{wPzV%By!iQzdKs:B98CpzF7de3i$6VzGGq%Bp[)Epd5@qBywW37Y+/)3i$AVB8$=5wFbh*BAh8kxcF5$4pK6?z*cm>wncd1zF6N+vScg3a@7B]vqG:#Cxl5WBzkVhA$OQ+z/oCo5^![PwO+{<vru5[25^%=wN/*aapn%bxM53fwk^eWCt8Z*yH}3zz/fV9v@#=81y=p/y:6]c4@+@$wO#PSz/fV9x(mH55^}64lVl<:vqfQ<AXYSZ8dWr1v@=p5Bz(g?z/O-!ADL#owN[CBD2<Jda@R$xwPIv4x(FfjAZ<$/qE%&<x(W=}oj-x&gf+edC4>JilVl<:A=k=gwPymUA-E0)zF%-plVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy6aUd.IwP{HWzGG]qy&0W6mSirEzFKcdCwY=^zGGq%Buhf&3k^C<xj#9}xj#x-A=k]dA==Odx([2YwQa*/8vW2QyH}=726j)bx(mM46BCgYwmYU2x>z6<AUnN$BAh8kxcFQmx>I9}x>Ia3p&ZF[wPz)rs7#+&oj-xfx>g^)Bzku3wPx*!p6}?Yx>qGQz/fVqz!%l3AZ<$/lVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy68y]#BwP{HWzGG]qy&0W6mSirmz/fV9v@%:!r0<N/x>qGQz/fVqz!%l3AZ<$/pgXSpz/fV9v@@m[8wAI-v@DmbvpKx(2$4DPz/fV9v@@[nd%tSrCscp^BAhqoy?mSRz/OP:Cscp^BywW3iTUuS3lqGelVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li6>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{i>d2XmH.wOkB[wFbh=vRPE:BrSsAa8(miwnbKZBy^{WA-lK=wN/*@z/eu.p&ZF[wPz)r5^}Dkp&ZbTx>7N[wG&Yk9=MdhwnbKZBy^{WA-lK=wN/*@z/eu.lVl<:vpKx(3R<R%A+e=}v{%E<a$r{sAb]J2x>7N[wKZPUmq=Kyy?W^1lVl<:vpKx(3R<R%A+e=}v{%E<bc.pU7EH}+z/fV9v@$KYv@2T@l$HgCxjk)[b1h?Ov@DmbvpKyQx>7{&AZTRLlT:>xwO.[U8yC<@Aa@/$wPwz7lRZ0!zGGq%BwMWYyH}J!x>qGQz/fVqz!%l3AWQ#kQx7YFv@DmbvpKyQx>7{&AZTRLq!o=Rv@$7RzGGq%BwN0@AaK6iC[o#{cKH5%x>7{&AUoxWpd5@qBywW3p?:APwPy*=wP{HWzGG]qy&0W68ybU2v@DmbvpKy#A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5Tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@$K/z/x"
    "odBA][}0Wri%3lAX}zGGq%BwMWYyH}JOx>gdNy?m9#lVl<:vpKz25ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS95EF!Nz/fV"
    "9v@#=81Z#B(vr<4tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@#=Mc&$PB0sx&Sz/fV9v@$KYv@2T@l${ggwO+{/Bvf$:BywW35ciW%3i>D-v@2T@"
    "5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS96BC7Pz/fV9v@@s&lRZ0!zGGq%BrR/pz/fV9v@$KYv@2T@i+h@nq!o=Rv@$7RzGGq%Bug/KbaO-wc"
    "U47jBywW3p?:APwPygMwk^5QwN/*Hz/fV9v@$K/z/xodBzkrc5ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS98vv6^z/fV9v@"
    "#Wgz/xodBzkrc5^qY:A::kqdpWplBywW3p?:APwPx?xx>gdNy?m9#lVl<:vpKyQA=k]dA==2bB2>YJbaX(za45^<z/fV9v@$:=wP{HWzGG]qy&0W6l$H"
    "gCxjk)[bgV=4l1s?JBywW3r+Vb?lVl<:A=k=gwPyZ.z/](bp?sVVz/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA[A08yV16C4>Jiv@DmbA=k="
    "gwPwz1lRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS99sr6>A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5$v@DmbvpKyWx>qGQz/fVqz!%l3AYOnPz/](bp?sVV"
    "z/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA][}0Wsrs3m/R8zGGq%Bxi9!Cscp^BAhqoy?mSPx>fOHze:r5By!J/Bza3WzGGq%BpXD>dgcMdx"
    ">qGQz/fVqz!%l3AUofQpd5@qBywW3r+Vb?lVl<:A=k=gwPwX63i$6VzGGq%Bp[)Epd5@qBywW3a$WqyzGGq%Bxi9!Cscp^BAhqoy?mSFwnbNwz/6DfwP"
    "RG+x([2Qz/fV9v@%:W0XaEyz/fV9v@#=w3pX@RzE^f$x(v>",
    v2,
    0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

uint64_t sub_23983AAE8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  Class = object_getClass(v4);
  if (objc_msgSend_tmlIsKindOfClass_(v4, v6, v7, a1)) {
    goto LABEL_2;
  }
  objc_msgSend_superclass(a1, v8, v9);
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (id v11 = v4, objc_msgSend_observationInfo(v11, v12, v13)))
  {
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  double v15 = NSString;
  double v16 = NSStringFromClass((Class)a1);
  BOOL v17 = NSStringFromClass(Class);
  objc_msgSend_stringWithFormat_(v15, v18, v19, @"%@_%@", v16, v17);
  id v20 = objc_claimAutoreleasedReturnValue();
  double v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);

  double v24 = objc_lookUpClass(v23);
  if (v24)
  {
    ClassPair = v24;
    if (object_getClass(v11) == v24) {
      goto LABEL_2;
    }
  }
  else
  {
    ClassPair = objc_allocateClassPair(Class, v23, 0);
    unsigned int outCount = 0;
    double v26 = class_copyProtocolList((Class)a1, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; class_addProtocol(ClassPair, v26[i++]))
        ;
    }
    free(v26);
    unsigned int v51 = 0;
    double v28 = class_copyMethodList((Class)a1, &v51);
    if (v51)
    {
      for (unint64_t j = 0; j < v51; ++j)
      {
        double v30 = v28[j];
        Name = method_getName(v30);
        Implementation = method_getImplementation(v30);
        TypeEncoding = method_getTypeEncoding(v30);
        class_addMethod(ClassPair, Name, Implementation, TypeEncoding);
      }
    }
    free(v28);
    InstanceMethod = class_getInstanceMethod(Class, sel_class);
    double v35 = imp_implementationWithBlock(&unk_26ECEBC98);
    id v36 = method_getName(InstanceMethod);
    v37 = method_getTypeEncoding(InstanceMethod);
    class_addMethod(ClassPair, v36, v35, v37);
    if (!class_getInstanceMethod(Class, sel_tmlSuperClass))
    {
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = sub_23983AEE8;
      v50[3] = &unk_264DABEA0;
      v50[4] = Class;
      double v38 = (void *)MEMORY[0x23ECA7DD0](v50);
      double v39 = imp_implementationWithBlock(v38);

      int v40 = method_getTypeEncoding(InstanceMethod);
      class_addMethod(ClassPair, sel_tmlSuperClass, v39, v40);
    }
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = sub_23983AEF0;
    v49[3] = &unk_264DABEC0;
    v49[4] = a1;
    v41 = (void *)MEMORY[0x23ECA7DD0](v49);
    double v42 = imp_implementationWithBlock(v41);

    v43 = class_getInstanceMethod(Class, sel_isKindOfClass_);
    double v44 = method_getTypeEncoding(v43);
    class_addMethod(ClassPair, sel_tmlIsKindOfClass_, v42, v44);
    v45 = class_getInstanceMethod(Class, sel_respondsToSelector_);
    v46 = method_getName(v45);
    double v47 = method_getTypeEncoding(v45);
    class_addMethod(ClassPair, v46, (IMP)sub_23983AF00, v47);
    objc_registerClassPair(ClassPair);
    size_t InstanceSize = class_getInstanceSize(Class);
    if (InstanceSize != class_getInstanceSize(ClassPair)) {
      goto LABEL_5;
    }
  }
  object_setClass(v11, ClassPair);
LABEL_2:
  uint64_t v10 = 1;
LABEL_6:

  return v10;
}

Class sub_23983AEBC(int a1, id a2)
{
  Class = object_getClass(a2);
  return class_getSuperclass(Class);
}

id sub_23983AEE8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL sub_23983AEF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a1 + 32) == a3;
}

BOOL sub_23983AF00(void *a1, const char *a2, const char *a3)
{
  id v5 = a1;
  Superclass = (objc_class *)objc_msgSend_tmlSuperClass(v5, v6, v7);
  v13.receiver = v5;
  if (!Superclass)
  {
    Class = object_getClass(v5);
    Superclass = class_getSuperclass(Class);
  }
  v13.super_class = Superclass;
  if (objc_msgSendSuper(&v13, a2, a3))
  {
    BOOL v10 = 1;
  }
  else
  {
    id v11 = object_getClass(v5);
    BOOL v10 = class_getInstanceMethod(v11, a3) != 0;
  }

  return v10;
}

uint64_t sub_23983AF94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_opt_class();
  return objc_msgSend_isSubclassOfClass_(v4, v5, v6, a3);
}

void sub_23983B344(void *a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v4 = sub_23983B3C0(v8);
  if (v4)
  {
    id v5 = sub_23983B43C(v8, v4, 1);
    objc_msgSend_addTarget_action_(a1, v6, v7, v5, sel_handleGesture_);
  }
}

uint64_t sub_23983B3C0(void *a1)
{
  uint64_t v1 = qword_268A056E8;
  id v3 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_268A056E8, &unk_26ECEBCD8);
  }
  id v5 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A056E0, v2, v4, v3);

  uint64_t v8 = objc_msgSend_integerValue(v5, v6, v7);
  return v8;
}

id sub_23983B43C(void *a1, uint64_t a2, int a3)
{
  id v6 = a1;
  if (qword_268A056D8 != -1) {
    dispatch_once(&qword_268A056D8, &unk_26ECEBCB8);
  }
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A056D0, v5, v7, v6);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = a3 == 0;
  }
  if (!v9)
  {
    BOOL v10 = [TMLUIGestureRecognizerActionTarget alloc];
    uint64_t v8 = objc_msgSend_initWithSignal_state_(v10, v11, v12, v6, a2);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_268A056D0, v13, v14, v8, v6);
  }

  return v8;
}

void sub_23983B508(void *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = sub_23983B3C0(v9);
  id v5 = v9;
  if (v4)
  {
    double v7 = sub_23983B43C(v9, v4, 0);
    if (v7) {
      objc_msgSend_removeTarget_action_(a1, v6, v8, v7, sel_handleGesture_);
    }

    id v5 = v9;
  }
}

double sub_23983B588(void *a1, const char *a2, double a3)
{
  uint64_t v4 = objc_msgSend_view(a1, a2, a3);
  objc_msgSend_locationInView_(a1, v5, v6, v4);
  double v8 = v7;

  return v8;
}

uint64_t sub_23983B6CC()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9A0]);
  qword_268A056D0 = objc_msgSend_initWithCapacity_(v0, v1, v2, 14);
  return MEMORY[0x270F9A758]();
}

void sub_23983B710()
{
  id v0 = (void *)qword_268A056E0;
  qword_268A056E0 = (uint64_t)&unk_26ED1B120;
}

void sub_23983BBAC(objc_class *a1)
{
  InstanceMethod = class_getInstanceMethod(a1, sel_setValue_forUndefinedKey_);
  id v3 = class_getInstanceMethod(a1, sel_tmlSetValue_forUndefinedKey_);
  method_exchangeImplementations(InstanceMethod, v3);
}

uint64_t sub_23983BC04(void *a1, uint64_t a2, const char *a3, void *a4)
{
  v28[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v27.receiver = a1;
  v27.super_class = (Class)&off_26ED3D080;
  uint64_t v7 = (uint64_t)objc_msgSendSuper2(&v27, sel_canPerformAction_withSender_, a3, v6);
  BOOL v10 = objc_msgSend_delegate(a1, v8, v9);
  v28[0] = a1;
  double v12 = NSStringFromSelector(a3);
  v28[1] = v12;
  double v14 = v6;
  if (!v6)
  {
    double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v28[2] = v14;
  double v15 = objc_msgSend_numberWithBool_(NSNumber, v11, v13, v7);
  v28[3] = v15;
  double v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, v17, v28, 4);
  id v26 = 0;
  int v21 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(v10, v19, v20, @"textFieldCanPerformActionWithSenderDefaultValue", v18, &v26);
  id v22 = v26;

  if (!v6) {
  if (v21)
  }
    uint64_t v7 = objc_msgSend_BOOLValue(v22, v23, v24);

  return v7;
}

void sub_23983BD8C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v41 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v6, v7, v8, @"enablesReturnKeyAutomatically"))
  {
    uint64_t v11 = objc_msgSend_BOOLValue(v41, v9, v10);
    objc_msgSend_setEnablesReturnKeyAutomatically_(a1, v12, v13, v11);
  }
  else if (objc_msgSend_isEqualToString_(v6, v9, v10, @"returnKeyType"))
  {
    uint64_t v16 = objc_msgSend_integerValue(v41, v14, v15);
    objc_msgSend_setReturnKeyType_(a1, v17, v18, v16);
  }
  else if (objc_msgSend_isEqualToString_(v6, v14, v15, @"keyboardType"))
  {
    uint64_t v21 = objc_msgSend_integerValue(v41, v19, v20);
    objc_msgSend_setKeyboardType_(a1, v22, v23, v21);
  }
  else if (objc_msgSend_isEqualToString_(v6, v19, v20, @"autocorrectionType"))
  {
    uint64_t v26 = objc_msgSend_integerValue(v41, v24, v25);
    objc_msgSend_setAutocorrectionType_(a1, v27, v28, v26);
  }
  else if (objc_msgSend_isEqualToString_(v6, v24, v25, @"autocapitalizationType"))
  {
    uint64_t v31 = objc_msgSend_integerValue(v41, v29, v30);
    objc_msgSend_setAutocapitalizationType_(a1, v32, v33, v31);
  }
  else if (objc_msgSend_isEqualToString_(v6, v29, v30, @"spellCheckingType"))
  {
    uint64_t v36 = objc_msgSend_integerValue(v41, v34, v35);
    objc_msgSend_setSpellCheckingType_(a1, v37, v38, v36);
  }
  else if (objc_msgSend_isEqualToString_(v6, v34, v35, @"textContentType"))
  {
    objc_msgSend_setTextContentType_(a1, v39, v40, v41);
  }
  else
  {
    objc_msgSend_tmlSetValue_forUndefinedKey_(a1, v39, v40, v41, v6);
  }
}

void sub_23983BFDC(uint64_t a1)
{
  size_t v2 = strlen("838477764bgqNZpim]UgJ2oyyw#Kj*Uv]MZ7]NH6S)8w1)UBij<$Fu@bO$ww*m.lorW))g^>7^^]i7]ck-i2VKBPPE!CcqELyy=v%BXI!.s@<:=J!-nKiXF}mQ%V:UzMBIU+V[>7N}sbW4<z=e+%7:mit673L6(CizRnV5}K3zW+h7e)X3vp&}*x&X}VCscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Rk6(Xh8w[u16wN[boA-u:<Bvf$.z/MD]v@Dg4AU[<45^![PwO+{<vru5[25^%=wN/*a8WWi*x(!c9B8%V<BAzCsq/)q3wFb8VzGDY%a%WHkAb]J4wPz*5wj7oMBAhqorb3k(lVl^VAUnK=z!%uj7Y(Du3jyM=x()A<BzaVLoB}:N2NQPP5^9n%y:6p4zFsh]x([2*qCobbA%-:#zFsh]x([2*qCoC@zF0P}B-H]jx(v(25e>/Y0D/1SB-IppeEzX(z/ff3xa=B/mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/c:qx(mTbs7#+&rz(HKv@Dl%x>INevruj4zAofEggpIlx(mTbs7#+&rz(HVzGGDgB5DNTwmY^}w<HPGx(4i!y?jd?8vcVJBRj!0A+(T23isPG1y=p/y:7cszFsh]x([2*qCob.zGGDgB5DNTwmY^Mw<HPGx(4i!y?kTmA0^**mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/cf[pe:}$ygQ)%a@*}7vQTpAz!%k#Ac2-hxglYDvR/Q^5^hVZz!{Qt3kWn>By/GlqE%oEwPyvOl3uWJy**^?wFbbPz/oC.0v3F93lAbnq^<oDA+OM*wP{HWzGG]qy&0W6l$HgCxjk)[bb22AdSY3gvrc6.x>qGQz/fVqz!%l3AZTRLlVl*Xy?mZ1nP5l:x<>*Kz^^e/0u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mS98WWl?x>h3#vpTC4v}f7>B7PMhy<uS@vScg3a$N!zw)]Z]r+Vb?lVl<:A=k=gwPx?xx>fOHze:r5By!3Yx([5$y!O+Qwi8aubaeDs9B<29BAhqoy?mSMv@#Bdx([R(By/rgmSirEqCmSk8ybT%v@DmbA=k=gwPwz0q:%X]w)]Z]r+Vb?lVl<:A=k=gwPwW$3iLA>y.u[Dq=MZ?8v)eUBzk&kwFbh*BAh8kxcG0Ivp&}*x&X}VCscp^BAhqoy?mSFvpKy[C4(5znPXJXB4g7*rz(HKBzk&kwJzjvbc}pSflpMlvrc6.x>qGQz/fVqz!%l3AZ+j.y&%o1wi<ZEx)aijC#P6dwPHsVA-D1h5d/:93jpoYzGG]qy&0W65/aznq^<oDA+OM*wP{HWzGG]qy&0W68vM@PB-Iph1X}#@qCm#t3i+J=BzLI326j)bx(mMch/&ztvrc6.x>qGQz/fVqz!%l3AYN=Rv@co#wN[8pBzk]jBA{&hAaK8Wz/O&QoGEofBzLIHc&$O:3lsg@w)]Z]r+Vb?lVl<:A=k=gwPygMwjyoJx(^@00u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mSn0XavNnLr=t");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "838477764bgqNZpim]UgJ2oyyw#Kj*Uv]MZ7]NH6S)8w1)UBij<$Fu@bO$ww*m.lorW))g^>7^^]i7]ck-i2VKBPPE!CcqELyy=v%BXI!.s@<:=J!-nKiXF}mQ%V:UzMBIU+V[>7N}sbW4<z=e+%7:mit673L6(CizRnV5}K3zW+h7e)X3vp&}*x&X}VCscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Rk6(Xh8w[u16wN[boA-u:<Bvf$.z/MD]v@Dg4AU[<45^![PwO+{<vru5[25^%=wN/*a8WWi*x(!c9B8%V<BAzCsq/)q3wFb8VzGDY%a%WHkAb]J4wPz*5wj7oMBAhqorb3k(lVl^VAUnK=z!%uj7Y(Du3jyM=x()A<BzaVLoB}:N2NQPP5^9n%y:6p4zFsh]x([2*qCobbA%-:#zFsh]x([2*qCoC@zF0P}B-H]jx(v(25e>/Y0D/1SB-IppeEzX(z/ff3xa=B/mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/c:qx(mTbs7#+&rz(HKv@Dl%x>INevruj4zAofEggpIlx(mTbs7#+&rz(HVzGGDgB5DNTwmY^}w<HPGx(4i!y?jd?8vcVJBRj!0A+(T23isPG1y=p/y:7cszFsh]x([2*qCob.zGGDgB5DNTwmY^Mw<HPGx(4i!y?kTmA0^**mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/cf[pe:}$ygQ)%a@*}7vQTpAz!%k#Ac2-hxglYDvR/Q^5^hVZz!{Qt3kWn>By/GlqE%oEwPyvOl3uWJy**^?wFbbPz/oC.0v3F93lAbnq^<oDA+OM*wP{HWzGG]qy&0W6l$HgCxjk)[bb22AdSY3gvrc6.x>qGQz/fVqz!%l3AZTRLlVl*Xy?mZ1nP5l:x<>*Kz^^e/0u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mS98WWl?x>h3#vpTC4v}f7>B7PMhy<uS@vScg3a$N!zw)]Z]r+Vb?lVl<:A=k=gwPx?xx>fOHze:r5By!3Yx([5$y!O+Qwi8aubaeDs9B<29BAhqoy?mSMv@#Bdx([R(By/rgmSirEqCmSk8ybT%v@DmbA=k=gwPwz0q:%X]w)]Z]r+Vb?lVl<:A=k=gwPwW$3iLA>y.u[Dq=MZ?8v)eUBzk&kwFbh*BAh8kxcG0Ivp&}*x&X}VCscp^BAhqoy?mSFvpKy[C4(5znPXJXB4g7*rz(HKBzk&kwJzjvbc}pSflpMlvrc6.x>qGQz/fVqz!%l3AZ+j.y&%o1wi<ZEx)aijC#P6dwPHsVA-D1h5d/:93jpoYzGG]qy&0W65/aznq^<oDA+OM*wP{HWzGG]qy&0W68vM@PB-Iph1X}#@qCm#t3i+J=BzLI326j)bx(mMch/&ztvrc6.x>qGQz/fVqz!%l3AYN=Rv@co#wN[8pBzk]jBA{&hAaK8Wz/O&QoGEofBzLIHc&$O:3lsg@w)]Z]r+Vb?lVl<:A=k=gwPygMwjyoJx(^@00u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mSn0XavNnLr=t", v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_23983C330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23983C34C(uint64_t a1)
{
  size_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    objc_msgSend_shared(TMLAspectsRegistration, v4, v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = objc_loadWeakRetained(v2);
    objc_msgSend_unregisterAspect_withKey_(v9, v7, v8, v6, *(void *)(a1 + 32));
  }
}

void sub_23983C6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_23983C6E0(uint64_t a1)
{
  size_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    double v5 = (id *)(a1 + 40);
    id v6 = objc_loadWeakRetained(v5);

    if (v6)
    {
      id v10 = objc_loadWeakRetained(v2);
      id v7 = objc_loadWeakRetained(v5);
      objc_msgSend_unregisterAspect_(v10, v8, v9, v7);
    }
  }
}

void sub_23983C844(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  v41[4] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v41[0] = v11;
    v40[0] = @"object";
    v40[1] = @"ctx";
    double v19 = v12;
    if (!v12)
    {
      double v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18);
    }
    v41[1] = v19;
    v40[2] = @"arguments";
    double v20 = v13;
    if (!v13)
    {
      double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18);
    }
    v41[2] = v20;
    v40[3] = @"returnValue";
    uint64_t v21 = v14;
    if (!v14)
    {
      uint64_t v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18);
    }
    v41[3] = v21;
    id v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, v18, v41, v40, 4);
    if (!v14) {

    }
    if (!v13) {
    if (!v12)
    }

    id v23 = objc_loadWeakRetained(v15);
    double v39 = v22;
    uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v24, v25, &v39, 1);
    id v38 = 0;
    objc_msgSend_emitTMLSignal_withArguments_returnValue_(v23, v27, v28, @"activate", v26, &v38);
    id v29 = v38;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a6)
      {
        double v32 = objc_msgSend_objectForKeyedSubscript_(v29, v30, v31, @"newArguments");
        double v33 = v32;
        if (v32) {
          *a6 = v32;
        }
      }
      if (a7)
      {
        CGRect v34 = objc_msgSend_objectForKeyedSubscript_(v29, v30, v31, @"newReturnValue");
        double v35 = v34;
        if (v34) {
          *a7 = v34;
        }
      }
    }
  }
}

void sub_23983CAC4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    objc_msgSend_raiseException_(TMLExceptionHandler, v3, v4, v2);

    objc_end_catch();
    JUMPOUT(0x23983CA78);
  }
  _Unwind_Resume(exception_object);
}

id sub_23983CF8C(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_23989E6F8);
}

void sub_23983CF98(void *a1, uint64_t a2, void *a3)
{
  id value = a3;
  double v4 = objc_getAssociatedObject(a1, &unk_23989E6F8);
  id v7 = v4;
  if (v4)
  {
    double v8 = objc_msgSend_componentsSeparatedByString_(v4, v5, v6, @",");
    char v11 = objc_msgSend_containsObject_(v8, v9, v10, value);

    if (v11) {
      goto LABEL_6;
    }
    uint64_t v14 = objc_msgSend_stringByAppendingFormat_(v7, v12, v13, @",%@", value);

    double v15 = (void *)v14;
  }
  else
  {
    double v15 = value;
  }
  id value = v15;
  objc_setAssociatedObject(a1, &unk_23989E6F8, v15, (void *)3);
LABEL_6:
}

uint64_t sub_23983D07C(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_classForObject_(TMLRuntime, a2, a3, a1);
}

void sub_23983D08C(void *a1, uint64_t a2)
{
  double v4 = objc_getAssociatedObject(a1, &unk_23989E6F9);
  objc_msgSend_makeObjectsPerformSelector_(v4, v5, v6, a2);

  objc_setAssociatedObject(a1, &unk_23989E6F9, 0, (void *)1);
  objc_setAssociatedObject(a1, &unk_23989E6FA, 0, (void *)1);
  objc_setAssociatedObject(a1, &unk_23989E6FB, 0, (void *)1);
  objc_setAssociatedObject(a1, &unk_23989E6FC, 0, (void *)1);
  objc_setAssociatedObject(a1, &unk_23989E6FD, 0, (void *)1);
}

void sub_23983D15C(void *a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  double v5 = objc_getAssociatedObject(a1, &unk_23989E6F9);
  if (!v5)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    double v5 = objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(a1, &unk_23989E6F9, v5, (void *)1);
  }
  objc_msgSend_addObject_(v5, v4, v6, v10);
}

id sub_23983D1FC(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_23989E6F9);
}

id sub_23983D208(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_23989E6FE);
}

void sub_23983D214(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_setAssociatedObject(a1, &unk_23989E6FE, v6, 0);
  objc_msgSend_addTmlChild_(v6, v4, v5, a1);
}

id sub_23983D27C(void *a1)
{
  id v2 = objc_getAssociatedObject(a1, &unk_23989E6FA);
  if (!v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = 0;
    }
    else
    {
      uint64_t v3 = objc_opt_class();
      id v2 = objc_msgSend_stateForClass_stateName_(TMLState, v4, v5, v3, &stru_26ECF02A8);
      objc_setAssociatedObject(v2, &unk_23989E6FE, a1, 0);
      objc_setAssociatedObject(a1, &unk_23989E6FA, v2, (void *)1);
    }
  }
  return v2;
}

__CFString *sub_23983D340(void *a1)
{
  uint64_t v1 = objc_getAssociatedObject(a1, &unk_23989E6FB);
  objc_msgSend_tmlStateName(v1, v2, v3);
  double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  double v5 = v4;
  if (!v4) {
    double v4 = &stru_26ECF02A8;
  }
  id v6 = v4;

  return v6;
}

void sub_23983D3A8(void *a1, uint64_t a2, void *a3)
{
  id v26 = a3;
  double v4 = objc_getAssociatedObject(a1, &unk_23989E6FB);
  id v7 = objc_msgSend_tmlStateName(v4, v5, v6);
  char isEqualToString = objc_msgSend_isEqualToString_(v26, v8, v9, v7);

  if ((isEqualToString & 1) == 0)
  {
    double v13 = objc_msgSend_tmlStateForName_(a1, v11, v12, v26);
    objc_setAssociatedObject(a1, &unk_23989E6FB, v13, (void *)1);
    uint64_t v16 = objc_msgSend_tmlStateName(v13, v14, v15);
    objc_msgSend_leaveStateToState_(v4, v17, v18, v16);

    objc_msgSend_applyToObject_fromState_(v13, v19, v20, a1, v4);
    id v23 = objc_msgSend_tmlStateName(v4, v21, v22);
    objc_msgSend_enterStateFromState_(v13, v24, v25, v23);
  }
}

id sub_23983D4B4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6))
  {
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x3032000000;
    double v20 = sub_23983D60C;
    uint64_t v21 = sub_23983D61C;
    id v22 = 0;
    double v9 = objc_msgSend_tmlChildren(a1, v7, COERCE_DOUBLE(0x3032000000));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = sub_23983D624;
    void v14[3] = &unk_264DABF70;
    id v15 = v4;
    uint64_t v16 = &v17;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, v11, v14);

    id v12 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_msgSend_tmlDefaultState(a1, v7, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void sub_23983D5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23983D60C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23983D61C(uint64_t a1)
{
}

void sub_23983D624(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = objc_msgSend_tmlStateName(v13, v7, v8);
    int isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, *(void *)(a1 + 32));

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

BOOL sub_23983D6DC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id AssociatedObject = j__objc_getAssociatedObject(a1, &unk_23989E6FF);
  if (!AssociatedObject) {
    objc_setAssociatedObject(a1, &unk_23989E6FF, v4, 0);
  }

  return AssociatedObject == 0;
}

BOOL sub_23983D74C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id AssociatedObject = j__objc_getAssociatedObject(a1, &unk_23989E6FF);

  return !AssociatedObject || AssociatedObject == v4;
}

void sub_23983D79C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v40 = a3;
  id v6 = a4;
  double v9 = objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v7, v8, v6, a1, 1);
  uint64_t v12 = objc_msgSend_type(v9, v10, v11);

  id v15 = objc_msgSend_valueForTarget_withKeyPath_(TMLReactiveValue, v13, v14, a1, v6);
  objc_msgSend_unassign(v15, v16, v17);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_assignToTarget_withKeyPath_(v40, v18, v19, a1, v6);
  }
  if (objc_msgSend_conformsToProtocol_(v40, v18, v19, &unk_26ED1D5F8))
  {
    uint64_t v22 = objc_msgSend_value(v40, v20, v21);

    id v40 = (id)v22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v25 = objc_msgSend_rangeOfString_options_(v6, v23, v24, @".", 4);
    id v26 = v6;
    id v28 = a1;
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v30 = objc_msgSend_substringFromIndex_(v26, v27, v29, v25 + 1);

      double v33 = objc_msgSend_substringToIndex_(v26, v31, v32, v25);
      uint64_t v36 = objc_msgSend_valueForKeyPath_(v28, v34, v35, v33);

      id v26 = (id)v30;
      id v28 = (id)v36;
    }
    v37 = (const char *)v40;
    if (v40)
    {
      uint64_t v38 = objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, (const char *)v40, v29, v40, v12);

      double v39 = (void *)v38;
    }
    else
    {
      double v39 = 0;
    }
    id v40 = v39;
    objc_msgSend_setValue_forKey_(v28, v37, v29);
  }
}

id sub_23983DA28(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v7 = objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v5, v6, v4, a1, 0);
  uint64_t v10 = objc_msgSend_type(v7, v8, v9);

  id v13 = objc_msgSend_valueForKeyPath_(a1, v11, v12, v4);

  double v14 = [TMLValue alloc];
  double v17 = objc_msgSend_initWithValue_valueType_(v14, v15, v16, v13, v10);
  double v20 = objc_msgSend_convertTmlValue_(TMLJSEnvironment, v18, v19, v17);

  return v20;
}

id sub_23983DAF4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v7 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v5, v6, v4, a1, 0);
  uint64_t v10 = objc_msgSend_valueForKey_(a1, v8, v9, v4);

  return v10;
}

void sub_23983DB74(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_getAssociatedObject(a1, &unk_23989E700);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v13 = (id)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(a1, &unk_23989E700, v13, (void *)1);
  }
  uint64_t v10 = objc_msgSend_methodName(v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v13, v11, v12, v4, v10);
}

void sub_23983DC2C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v26 = a3;
  id v6 = a4;
  double v8 = objc_getAssociatedObject(a1, &unk_23989E6FC);
  if (!v8)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    double v8 = objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(a1, &unk_23989E6FC, v8, (void *)1);
  }
  objc_msgSend_objectForKeyedSubscript_(v8, v7, v9, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v26)
  {
    if (v26)
    {
      objc_msgSend_detach(v14, v13, v15);
      objc_msgSend_setObject_forKeyedSubscript_(v8, v16, v17, v26, v6);
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_tmlSignalDetach_(a1, v20, v21, v6);
      }
      objc_msgSend_detach(v14, v20, v21);
    }
    objc_msgSend_makeAccessible_signalName_(TMLNSObjectAccessibility, v18, v19, a1, v6);
    objc_msgSend_attach(v26, v22, v23);
    if (!v14 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend_tmlSignalAttach_(a1, v24, v25, v6);
    }
  }
}

uint64_t sub_23983DD88(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](a1, sel_setTMLSignalHandler_block_, a2);
}

void sub_23983DD98(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  if (objc_msgSend_hasSuffix_(v7, v8, v9, @"Changed"))
  {
    uint64_t v12 = objc_msgSend_length(v7, v10, v11);
    uint64_t v15 = objc_msgSend_substringToIndex_(v7, v13, v14, v12 - 7);
    id v18 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v16, v17, v15, a1, 0);
    double v19 = [TMLPropertyChangedBlockSignalHandler alloc];
    uint64_t v22 = objc_msgSend_bindingForTarget_withKeyPath_(TMLBinding, v20, v21, a1, v15);
    id v30 = (id)objc_msgSend_initWithBlock_binding_(v19, v23, v24, v6, v22);

    id v6 = (id)v15;
  }
  else
  {
    double v25 = [TMLBlockSignalHandler alloc];
    id v30 = (id)objc_msgSend_initWithBlock_(v25, v26, v27, v6);
  }

  objc_msgSend_setTMLHandler_forSignal_(a1, v28, v29, v30, v7);
}

id sub_23983DEC8(void *a1, uint64_t a2, void *a3, int a4)
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7)
  {
    double v8 = (void *)v7;
    do
    {
      double v9 = objc_getAssociatedObject(v8, &unk_23989E700);
      uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, v11, v6);
      double v8 = objc_msgSend_superclass(v8, v13, v14);

      if (v12) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = v8 == 0;
      }
    }
    while (!v15);
    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (a4)
  {
    double v17 = (void *)MEMORY[0x263EFF940];
    id v18 = NSString;
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_stringWithFormat_(v18, v20, v21, @"Attempt to call undeclared method %@ in class %@", v6, v19);
    CGRect v34 = @"identifier";
    uint64_t v25 = objc_msgSend_tmlIdentifier(a1, v23, v24);
    id v28 = (void *)v25;
    double v29 = &stru_26ECF02A8;
    if (v25) {
      double v29 = (__CFString *)v25;
    }
    v35[0] = v29;
    id v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, v27, v35, &v34, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v17, v31, v32, @"TMLRuntimeException", v22, v30);
    id v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v33);
  }
LABEL_12:

  return v12;
}

id sub_23983E090(void *a1, uint64_t a2, void *a3, void *a4)
{
  v36[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_methodName(v6, v8, v9);
  id v35 = v7;
  objc_msgSend_willEmitSignalOrMethod_withArguments_newArguments_(a1, v11, v12, v10, v7, &v35);
  id v13 = v35;

  v36[0] = a1;
  double v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v36, 1);
  uint64_t v19 = objc_msgSend_arrayByAddingObjectsFromArray_(v16, v17, v18, v13);
  uint64_t v22 = objc_msgSend_callWithArguments_(v6, v20, v21, v19);

  if (v22)
  {
    uint64_t v25 = objc_msgSend_convertTmlValue_(TMLJSEnvironment, v23, v24, v22);
  }
  else
  {
    uint64_t v25 = 0;
  }
  id v26 = v25;
  double v29 = objc_msgSend_methodName(v6, v27, v28);
  id v34 = v26;
  objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v30, v31, v29, v13, v26, &v34);
  id v32 = v34;

  return v32;
}

id sub_23983E224(void *a1, uint64_t a2, void *a3, void *a4)
{
  v36[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v11 = objc_msgSend_tmlGetMethod_throwIfMissing_(a1, v8, v9, v6, 0);
  if (v11)
  {
    objc_msgSend_tmlInvokeMethodCall_withArguments_(a1, v10, v12, v11, v7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v34 = 0;
    char v14 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v10, v12, v6, v7, &v34);
    id v13 = v34;
    if ((v14 & 1) == 0)
    {
      double v17 = (void *)MEMORY[0x263EFF940];
      double v18 = NSString;
      uint64_t v19 = objc_opt_class();
      uint64_t v22 = objc_msgSend_stringWithFormat_(v18, v20, v21, @"Attempt to call undeclared method %@ in class %@", v6, v19);
      id v35 = @"identifier";
      uint64_t v25 = objc_msgSend_tmlIdentifier(a1, v23, v24);
      double v28 = (void *)v25;
      double v29 = &stru_26ECF02A8;
      if (v25) {
        double v29 = (__CFString *)v25;
      }
      v36[0] = v29;
      id v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, v27, v36, &v35, 1);
      objc_msgSend_exceptionWithName_reason_userInfo_(v17, v31, v32, @"TMLRuntimeException", v22, v30);
      id v33 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v33);
    }
  }
  double v15 = v13;

  return v15;
}

id sub_23983E3E0(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_23989E6FD);
}

void sub_23983E3EC(void *a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_metaObjects(a1, v5, v6);
  id v10 = v7;
  if (v7)
  {
    double v11 = objc_msgSend_arrayByAddingObject_(v7, v8, v9, v4);
  }
  else
  {
    v13[0] = v4;
    double v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v8, v9, v13, 1);
  }
  double v12 = v11;
  objc_setAssociatedObject(a1, &unk_23989E6FD, v11, (void *)1);
}

id sub_23983E4BC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    double v8 = (void *)MEMORY[0x263EFF980];
    uint64_t v9 = objc_msgSend_count(v3, v6, v7);
    objc_msgSend_arrayWithCapacity_(v8, v10, v11, v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v3;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, v15, &v26, v30, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v13);
          }
          double v23 = objc_msgSend_object(*(void **)(*((void *)&v26 + 1) + 8 * i), v17, v18, (void)v26);
          if (v23) {
            objc_msgSend_addObject_(v12, v22, v24, v23);
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, v18, &v26, v30, 16);
      }
      while (v19);
    }
  }
  else
  {
    id v12 = v3;
  }

  return v12;
}

id sub_23983E620(void *a1, uint64_t a2, void *a3, int a4, int a5)
{
  id v8 = a3;
  if (a4) {
    uint64_t v9 = &unk_23989E702;
  }
  else {
    uint64_t v9 = &unk_23989E701;
  }
  double v11 = objc_getAssociatedObject(a1, v9);
  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = a5 == 0;
  }
  if (!v13)
  {
    double v11 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x263F08968], v10, v12);
    objc_setAssociatedObject(a1, v9, v11, (void *)1);
  }
  double v15 = objc_msgSend_objectForKey_(v11, v10, v12, v8);
  if (v15) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = a5 == 0;
  }
  if (!v17)
  {
    double v15 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v14, v16, 2);
    objc_msgSend_setObject_forKey_(v11, v18, v19, v15, v8);
  }

  return v15;
}

void sub_23983E724(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_signalName(v4, v5, v6);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_advice(v4, v7, v8);
  double v12 = objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v10, v11, v18, v9, 1);
  double v15 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v13, v14, v4);

  objc_msgSend_addObject_(v12, v16, v17, v15);
}

void sub_23983E7D0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v7 = objc_msgSend_signalName(v4, v5, v6);
  uint64_t v10 = objc_msgSend_advice(v4, v8, v9);
  BOOL v13 = objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v11, v12, v7, v10, 0);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v13;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, v16, &v29, v33, 16);
  id v20 = v14;
  if (v17)
  {
    uint64_t v21 = v17;
    uint64_t v22 = *(void *)v30;
LABEL_3:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v30 != v22) {
        objc_enumerationMutation(v14);
      }
      double v24 = *(void **)(*((void *)&v29 + 1) + 8 * v23);
      objc_msgSend_object(v24, v18, v19, (void)v29);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v25 && v25 == v4) {
        break;
      }

      if (v21 == ++v23)
      {
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, v19, &v29, v33, 16);
        if (v21) {
          goto LABEL_3;
        }
        id v20 = v14;
        goto LABEL_15;
      }
    }
    id v20 = v24;

    if (!v20) {
      goto LABEL_16;
    }
    objc_msgSend_removeObject_(v14, v27, v28, v20);
  }
LABEL_15:

LABEL_16:
}

void sub_23983E94C(void *a1, uint64_t a2, void *a3, void *a4, id *a5)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v12 = objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v10, v11, v8, 0, 0);
  objc_msgSend_strongObjectsArray_(a1, v13, v14, v12);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v18 = objc_msgSend_shared(TMLAspectsRegistration, v16, v17);
  double v39 = v8;
  uint64_t v21 = objc_msgSend_aspectsForObject_signalName_advice_(v18, v19, v20, a1, v8, 0);

  if (objc_msgSend_count(v21, v22, v23))
  {
    if (v15)
    {
      uint64_t v26 = objc_msgSend_arrayByAddingObjectsFromArray_(v15, v24, v25, v21);

      id v15 = (id)v26;
    }
    else
    {
      id v15 = v21;
    }
  }
  id v27 = v9;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v28 = v15;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, v30, &v40, v44, 16);
  uint64_t v34 = v27;
  if (v31)
  {
    uint64_t v35 = v31;
    uint64_t v36 = *(void *)v41;
    uint64_t v34 = v27;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend_activateWithObject_arguments_returnValue_newArguments_newReturnValue_(*(void **)(*((void *)&v40 + 1) + 8 * v37), v32, v33, a1, v34, 0, a5, 0);
        if (a5)
        {
          id v38 = *a5;

          uint64_t v34 = v38;
        }
        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v32, v33, &v40, v44, 16);
    }
    while (v35);
  }
}

BOOL sub_23983EB54(void *a1, uint64_t a2, void *a3, void *a4, void *a5, id *a6)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v15 = objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v13, v14, v10, 1, 0);
  objc_msgSend_strongObjectsArray_(a1, v16, v17, v15);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = objc_msgSend_shared(TMLAspectsRegistration, v19, v20);
  double v44 = v10;
  double v24 = objc_msgSend_aspectsForObject_signalName_advice_(v21, v22, v23, a1, v10, 1);

  long long v43 = v24;
  if (objc_msgSend_count(v24, v25, v26))
  {
    if (v18)
    {
      uint64_t v29 = objc_msgSend_arrayByAddingObjectsFromArray_(v18, v27, v28, v24);

      id v18 = (id)v29;
    }
    else
    {
      id v18 = v24;
    }
  }
  id v30 = v12;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v31 = v18;
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, v33, &v46, v50, 16);
  uint64_t v37 = v34;
  uint64_t v45 = v30;
  if (v34)
  {
    uint64_t v38 = *(void *)v47;
    uint64_t v39 = v34;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend_activateWithObject_arguments_returnValue_newArguments_newReturnValue_(*(void **)(*((void *)&v46 + 1) + 8 * i), v35, v36, a1, v11, v30, 0, a6);
        if (a6)
        {
          id v41 = *a6;

          id v30 = v41;
        }
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v35, v36, &v46, v50, 16);
    }
    while (v39);
  }

  return v37 != 0;
}

id sub_23983ED88(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v9 = objc_msgSend_tmlGetMethod_(a1, v7, v8, a3);
  id v12 = objc_msgSend_tmlInvokeMethodCall_withArguments_(a1, v10, v11, v9, v6);

  return v12;
}

uint64_t sub_23983EE04(void *a1, const char *a2, double a3, uint64_t a4)
{
  return objc_msgSend_tmlGetMethod_throwIfMissing_(a1, a2, a3, a4, 1);
}

id sub_23983EE0C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = objc_getAssociatedObject(a1, &unk_23989E6FC);
  id v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);
  if (!v9)
  {
    uint64_t v11 = objc_opt_class();
    if (!v11) {
      goto LABEL_10;
    }
    double v14 = (void *)v11;
    do
    {
      id v15 = objc_getAssociatedObject(v14, &unk_23989E6FC);
      id v9 = objc_msgSend_objectForKeyedSubscript_(v15, v16, v17, v4);
      double v14 = objc_msgSend_superclass(v14, v18, v19);

      if (v9) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v14 == 0;
      }
    }
    while (!v20);
    if (!v9)
    {
LABEL_10:
      id v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v5, v12, v13, v9, v4);
  }
  uint64_t v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  if (v9 == v21) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v9;
  }
  id v23 = v22;

  return v23;
}

uint64_t sub_23983EF2C(void *a1, const char *a2, double a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_23983EF34(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v36[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v35 = v9;
  objc_msgSend_willEmitSignalOrMethod_withArguments_newArguments_(a1, v10, v11, v8, v9, &v35);
  id v12 = v35;
  double v16 = objc_msgSend_tmlSignalHandlerForSignal_(a1, v13, v14, v8);
  if (v16)
  {
    objc_msgSend_tmlParent(a1, v15, v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19) {
      id v19 = a1;
    }
    v36[0] = v19;
    uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v20, v36, 1);
    double v24 = objc_msgSend_arrayByAddingObjectsFromArray_(v21, v22, v23, v12);
    id v27 = objc_msgSend_callWithArguments_(v16, v25, v26, v24);

    if (a5)
    {
      objc_msgSend_value(v27, v28, v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      *a5 = v30;
      objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v31, v32, v8, v12, v30, a5);
    }
    else
    {
      objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v28, v29, v8, v12, 0, 0);
    }

    uint64_t v33 = 1;
  }
  else
  {
    uint64_t v33 = objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v15, v17, v8, v12, 0, a5);
  }

  return v33;
}

void sub_23983F0EC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_getAssociatedObject(a1, &unk_23989E6FC);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v5, v6, 0, v4);
}

BOOL sub_23983F158(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  id v4 = objc_msgSend_signal_forObject_(TMLRuntime, a2, a4, a3, a1);
  BOOL v5 = v4 != 0;

  return v5;
}

void sub_23983F25C(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___TMLApplication;
  id v1 = objc_msgSendSuper2(&v6, sel_allocWithZone_, 0);
  uint64_t v4 = objc_msgSend_init(v1, v2, v3);
  BOOL v5 = (void *)qword_268A056F8;
  qword_268A056F8 = v4;
}

void sub_23983F304()
{
  size_t size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  id v0 = malloc_type_malloc(size, 0xBE30D705uLL);
  sysctlbyname("hw.machine", v0, &size, 0, 0);
  uint64_t v3 = objc_msgSend_stringWithCString_encoding_(NSString, v1, v2, v0, 4);
  uint64_t v4 = (void *)qword_268A05708;
  qword_268A05708 = v3;

  free(v0);
}

void sub_23983F3FC(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], a3, a1);
  objc_msgSend_infoDictionary(v3, v4, v5);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = objc_msgSend_objectForKey_(v22, v6, v7, *MEMORY[0x263EFFB70]);
  double v11 = objc_msgSend_objectForKey_(v22, v9, v10, @"CFBundleShortVersionString");
  double v14 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], v12, v13, @"^\\d+\\.\\d+", 0, 0);
  uint64_t v17 = objc_msgSend_length(v11, v15, v16);
  uint64_t v20 = objc_msgSend_numberOfMatchesInString_options_range_(v14, v18, v19, v11, 0, 0, v17);

  if (v20) {
    uint64_t v21 = v11;
  }
  else {
    uint64_t v21 = v8;
  }
  objc_storeStrong((id *)&qword_268A05718, v21);
}

void sub_23983F5C0(uint64_t a1)
{
  size_t v2 = strlen(a83847776l8gakb);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776l8gakb, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_23983F720(uint64_t a1, void *a2)
{
  size_t v2 = (objc_class *)MEMORY[0x263EFD7E8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v7 = objc_msgSend_initWithRecordName_(v4, v5, v6, v3);

  return v7;
}

id sub_23983F778(uint64_t a1, void *a2)
{
  size_t v2 = (objc_class *)MEMORY[0x263EFD7C8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v7 = objc_msgSend_initWithRecordType_(v4, v5, v6, v3);

  return v7;
}

id sub_23983F7D0(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x263EFD7C8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 alloc];
  double v10 = objc_msgSend_initWithRecordType_recordID_(v7, v8, v9, v6, v5);

  return v10;
}

id sub_23983F844(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (objc_class *)MEMORY[0x263EFD820];
  id v5 = a2;
  id v6 = [v4 alloc];
  double v9 = objc_msgSend_initWithRecord_action_(v6, v7, v8, v5, a3);

  return v9;
}

id sub_23983F8AC(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (objc_class *)MEMORY[0x263EFD820];
  id v5 = a2;
  id v6 = [v4 alloc];
  double v9 = objc_msgSend_initWithRecordID_action_(v6, v7, v8, v5, a3);

  return v9;
}

id sub_2398402CC(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v9 = objc_alloc(*(Class *)(a1 + 32));
  double v11 = objc_msgSend_initWithDirectionalEdgeInsets_(v9, v10, a2, a3, a4, a5);
  return v11;
}

BOOL sub_23984032C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_directionalEdgeInsets(a2, v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  objc_msgSend_directionalEdgeInsets(v4, v15, v7);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  BOOL v24 = v10 == v19;
  if (v8 != v17) {
    BOOL v24 = 0;
  }
  if (v14 != v23) {
    BOOL v24 = 0;
  }
  return v12 == v21 && v24;
}

id sub_239840984(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id v13 = objc_alloc(*(Class *)(a1 + 32));
  *(double *)double v18 = a2;
  *(double *)&v18[1] = a3;
  *(double *)&v18[2] = a4;
  *(double *)&void v18[3] = a5;
  *(double *)&v18[4] = a6;
  *(double *)&v18[5] = a7;
  double v16 = objc_msgSend_initWithAffineTransform_(v13, v14, v15, v18);
  return v16;
}

id sub_2398409FC(uint64_t a1, CGFloat a2, CGFloat a3)
{
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  CGAffineTransformMakeTranslation(&v10, a2, a3);
  double v8 = objc_msgSend_initWithAffineTransform_(v5, v6, v7, &v10);
  return v8;
}

id sub_239840A68(uint64_t a1, CGFloat a2, CGFloat a3)
{
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  CGAffineTransformMakeScale(&v10, a2, a3);
  double v8 = objc_msgSend_initWithAffineTransform_(v5, v6, v7, &v10);
  return v8;
}

id sub_239840AD4(uint64_t a1, CGFloat a2)
{
  id v3 = objc_alloc(*(Class *)(a1 + 32));
  CGAffineTransformMakeRotation(&v8, a2);
  double v6 = objc_msgSend_initWithAffineTransform_(v3, v4, v5, &v8);
  return v6;
}

id sub_239840B38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = objc_alloc(*(Class *)(a1 + 32));
  if (v5)
  {
    objc_msgSend_transform(v5, v7, v9);
    if (v6)
    {
LABEL_3:
      objc_msgSend_transform(v6, v7, v10);
      goto LABEL_6;
    }
  }
  else
  {
    double v10 = 0.0;
    memset(&t1, 0, sizeof(t1));
    if (v6) {
      goto LABEL_3;
    }
  }
  memset(&v15, 0, sizeof(v15));
LABEL_6:
  CGAffineTransformConcat(&v17, &t1, &v15);
  id v13 = objc_msgSend_initWithAffineTransform_(v8, v11, v12, &v17);

  return v13;
}

id sub_239840C04(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7 = a2;
  id v9 = objc_alloc(*(Class *)(a1 + 32));
  if (v7) {
    objc_msgSend_transform(v7, v8, v10);
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CGAffineTransformTranslate(&v16, &v15, a3, a4);
  id v13 = objc_msgSend_initWithAffineTransform_(v9, v11, v12, &v16);

  return v13;
}

id sub_239840CAC(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7 = a2;
  id v9 = objc_alloc(*(Class *)(a1 + 32));
  if (v7) {
    objc_msgSend_transform(v7, v8, v10);
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CGAffineTransformScale(&v16, &v15, a3, a4);
  id v13 = objc_msgSend_initWithAffineTransform_(v9, v11, v12, &v16);

  return v13;
}

id sub_239840D54(uint64_t a1, void *a2, CGFloat a3)
{
  id v5 = a2;
  id v7 = objc_alloc(*(Class *)(a1 + 32));
  if (v5) {
    objc_msgSend_transform(v5, v6, v8);
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CGAffineTransformRotate(&v14, &v13, a3);
  double v11 = objc_msgSend_initWithAffineTransform_(v7, v9, v10, &v14);

  return v11;
}

id sub_239840DF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  if (v3) {
    objc_msgSend_transform(v3, v4, v6);
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CGAffineTransformInvert(&v12, &v11);
  id v9 = objc_msgSend_initWithAffineTransform_(v5, v7, v8, &v12);

  return v9;
}

BOOL sub_239840E84(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v8 = v5;
  if (!v4)
  {
    double v9 = 0.0;
    memset(&t1, 0, sizeof(t1));
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v12, 0, sizeof(v12));
    goto LABEL_6;
  }
  objc_msgSend_transform(v4, v6, v7);
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  objc_msgSend_transform(v8, v6, v9);
LABEL_6:
  BOOL v10 = CGAffineTransformEqualToTransform(&t1, &v12);

  return v10;
}

uint64_t sub_239840F68(objc_class *a1)
{
  InstanceMethod = class_getInstanceMethod(a1, sel_didMoveToWindow);
  id v3 = class_getInstanceMethod(a1, sel_tmlDidMoveToWindow);
  Implementation = method_getImplementation(v3);
  TypeEncoding = method_getTypeEncoding(v3);
  if (class_addMethod(a1, sel_didMoveToWindow, Implementation, TypeEncoding))
  {
    double v6 = method_getImplementation(InstanceMethod);
    double v7 = method_getTypeEncoding(InstanceMethod);
    class_replaceMethod(a1, sel_tmlDidMoveToWindow, v6, v7);
  }
  else
  {
    method_exchangeImplementations(InstanceMethod, v3);
  }
  double v8 = class_getInstanceMethod(a1, sel_traitCollectionDidChange_);
  double v9 = class_getInstanceMethod(a1, sel_tmlTraitCollectionDidChange_);
  BOOL v10 = method_getImplementation(v9);
  CGAffineTransform v11 = method_getTypeEncoding(v9);
  if (class_addMethod(a1, sel_traitCollectionDidChange_, v10, v11))
  {
    CGAffineTransform v12 = method_getImplementation(v8);
    CGAffineTransform v13 = method_getTypeEncoding(v8);
    class_replaceMethod(a1, sel_tmlTraitCollectionDidChange_, v12, v13);
  }
  else
  {
    method_exchangeImplementations(v8, v9);
  }
  CGAffineTransform v14 = class_getInstanceMethod(a1, sel_accessibilityActivate);
  CGAffineTransform v15 = class_getInstanceMethod(a1, sel_tmlAccessibilityActivate);
  CGAffineTransform v16 = method_getImplementation(v15);
  CGAffineTransform v17 = method_getTypeEncoding(v15);
  if (class_addMethod(a1, sel_accessibilityActivate, v16, v17))
  {
    double v18 = method_getImplementation(v14);
    double v19 = method_getTypeEncoding(v14);
    class_replaceMethod(a1, sel_tmlAccessibilityActivate, v18, v19);
  }
  else
  {
    method_exchangeImplementations(v14, v15);
  }
  double v20 = class_getInstanceMethod(a1, sel_accessibilityDecrement);
  double v21 = class_getInstanceMethod(a1, sel_tmlAccessibilityDecrement);
  double v22 = method_getImplementation(v21);
  double v23 = method_getTypeEncoding(v21);
  if (class_addMethod(a1, sel_accessibilityDecrement, v22, v23))
  {
    BOOL v24 = method_getImplementation(v20);
    double v25 = method_getTypeEncoding(v20);
    class_replaceMethod(a1, sel_tmlAccessibilityDecrement, v24, v25);
  }
  else
  {
    method_exchangeImplementations(v20, v21);
  }
  double v26 = class_getInstanceMethod(a1, sel_accessibilityIncrement);
  id v27 = class_getInstanceMethod(a1, sel_tmlAccessibilityIncrement);
  double v28 = method_getImplementation(v27);
  double v29 = method_getTypeEncoding(v27);
  if (class_addMethod(a1, sel_accessibilityIncrement, v28, v29))
  {
    id v30 = method_getImplementation(v26);
    id v31 = method_getTypeEncoding(v26);
    class_replaceMethod(a1, sel_tmlAccessibilityIncrement, v30, v31);
  }
  else
  {
    method_exchangeImplementations(v26, v27);
  }
  uint64_t v34 = (void *)MEMORY[0x263F1C6D0];
  return objc_msgSend_tmlLoadCategory(v34, v32, v33);
}

void sub_23984127C(void *a1, const char *a2, double a3)
{
  objc_msgSend_tmlDidMoveToWindow(a1, a2, a3);
  double v6 = objc_msgSend_window(a1, v4, v5);

  if (v6)
  {
    objc_msgSend_emitTMLSignal_withArguments_(a1, v7, v8, @"didMoveToWindow", 0);
    CGAffineTransform v11 = objc_msgSend_traitCollection(a1, v9, v10);
    objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v12, v13, a1, v11, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_emitTMLSignal_withArguments_(v16, v14, v15, @"enter", 0);
  }
}

void sub_239841350(void *a1, uint64_t a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_tmlTraitCollectionDidChange_(a1, v5, v6, v4);
  double v9 = objc_msgSend_traitCollection(a1, v7, v8);
  CGAffineTransform v12 = objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v10, v11, a1, v9, v4);

  if (v4)
  {
    v20[0] = v4;
    double v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, v14, v20, 1);
    objc_msgSend_emitTMLSignal_withArguments_(a1, v16, v17, @"traitCollectionDidChange", v15);
  }
  else
  {
    objc_msgSend_emitTMLSignal_withArguments_(a1, v13, v14, @"traitCollectionDidChange", 0);
  }
  objc_msgSend_emitTMLSignal_withArguments_(v12, v18, v19, @"enter", 0);
}

void sub_239841468(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = objc_getAssociatedObject(a1, &unk_23989E703);
  objc_msgSend_removeObjectsInArray_(v5, v6, v7, v4);
  double v10 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v8, v9, @"superview == %@", a1);
  double v13 = objc_msgSend_filteredArrayUsingPredicate_(v5, v11, v12, v10);
  objc_msgSend_makeObjectsPerformSelector_(v13, v14, v15, sel_removeFromSuperview);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = sub_23984159C;
  v20[3] = &unk_264DAC158;
  v20[4] = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v16, COERCE_DOUBLE(3221225472), v20);
  double v19 = objc_msgSend_mutableCopy(v4, v17, v18);

  objc_setAssociatedObject(a1, &unk_23989E703, v19, (void *)1);
}

uint64_t sub_23984159C(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_addSubview_, a2);
}

void sub_2398415A8(void *a1, uint64_t a2, void *a3)
{
  id value = a3;
  id v4 = objc_getAssociatedObject(a1, &unk_23989E704);
  if (objc_msgSend_count(v4, v5, v6)) {
    objc_msgSend_deactivateConstraints_(MEMORY[0x263F08938], v7, v8, v4);
  }
  double v9 = value;
  if (value)
  {
    objc_msgSend_activateConstraints_(MEMORY[0x263F08938], v7, v8, value);
    double v9 = value;
  }
  objc_setAssociatedObject(a1, &unk_23989E704, v9, (void *)3);
}

void sub_239841654(void *a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = objc_getAssociatedObject(a1, &unk_23989E705);
  if (objc_msgSend_count(v5, v6, v7))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = v5;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, v10, &v30, v35, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend_removeLayoutGuide_(a1, v12, v13, *(void *)(*((void *)&v30 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, v13, &v30, v35, 16);
      }
      while (v14);
    }
  }
  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v4;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, v19, &v26, v34, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v27;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend_addLayoutGuide_(a1, v21, v22, *(void *)(*((void *)&v26 + 1) + 8 * v25++), (void)v26);
        }
        while (v23 != v25);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, v22, &v26, v34, 16);
      }
      while (v23);
    }
  }
  objc_setAssociatedObject(a1, &unk_23989E705, v4, (void *)3);
}

void sub_239841824(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v7 = objc_msgSend_gestureRecognizers(a1, v5, v6);
  double v10 = objc_msgSend_mutableCopy(v7, v8, v9);

  objc_msgSend_removeObjectsInArray_(v10, v11, v12, v4);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_23984192C;
  void v18[3] = &unk_264DAC180;
  v18[4] = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v10, v13, v14, v18);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_239841938;
  v17[3] = &unk_264DAC180;
  void v17[4] = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v15, v16, v17);
}

uint64_t sub_23984192C(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_removeGestureRecognizer_, a2);
}

uint64_t sub_239841938(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_addGestureRecognizer_, a2);
}

id sub_239841944()
{
  id v0 = NSString;
  id v1 = (objc_class *)objc_opt_class();
  Name = class_getName(v1);
  double v5 = objc_msgSend_stringWithUTF8String_(v0, v3, v4, Name);
  id v8 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v6, v7);
  uint64_t v11 = objc_msgSend_pathForResource_ofType_(v8, v9, v10, v5, @"tml");

  return v11;
}

void sub_2398419D4(void *a1, uint64_t a2, void *a3)
{
}

id sub_2398419E4(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_23989E706);
}

id sub_2398419F0(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_23989E707);
}

void sub_2398419FC(void *a1, uint64_t a2, void *a3)
{
  double v4 = a3;
  objc_getAssociatedObject(a1, &unk_23989E707);
  double v5 = (TMLContext *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    double v6 = objc_alloc_init(TMLContext);
    double v9 = objc_msgSend_tmlObjects(a1, v7, v8);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_239841C20;
    v28[3] = &unk_264DAC1A8;
    double v5 = v6;
    long long v29 = v5;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v10, v11, v28);

    double v14 = objc_msgSend_tmlObjects(a1, v12, v13);
    id v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, v16, @"owner");

    if (!v17)
    {
      uint64_t v20 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v18, v19, a1);
      objc_msgSend_addObject_withIdentifier_(v5, v21, v22, v20, @"owner");
    }
    objc_setAssociatedObject(a1, &unk_23989E707, v5, (void *)1);
    objc_initWeak(&location, v5);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_239841C2C;
    v25[3] = &unk_264DAC1D0;
    objc_copyWeak(&v26, &location);
    objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v23, v24, v25, a1);
    v4[2](v4, v5);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void sub_239841C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_239841C20(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_239841C2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);
}

void sub_239841C6C(void *a1)
{
  double v2 = objc_getAssociatedObject(a1, &unk_23989E707);
  if (v2)
  {
    id v7 = v2;
    objc_msgSend_dispose(v2, v3, v4);
    objc_setAssociatedObject(a1, &unk_23989E707, 0, (void *)1);
    objc_msgSend_tmlDispose(a1, v5, v6);
    double v2 = v7;
  }
}

void sub_239841CE4(void *a1, const char *a2, double a3)
{
  objc_msgSend_tmlViewPath(a1, a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlLoadViewFromPath_(a1, v4, v5, v6);
}

void sub_239841D38(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_239841DD8;
  v10[3] = &unk_264DAC1F8;
  id v11 = v4;
  double v12 = a1;
  id v7 = v4;
  objc_msgSend__tmlEnsureContext_(a1, v8, v9, v10);
}

void sub_239841DD8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend_loadSource_(v4, v5, v6, v3);
  objc_msgSend_rootObject(v4, v7, v8);
  double v19 = (char *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqual_(v19, v9, v10, *(void *)(a1 + 40)) & 1) == 0)
  {
    double v12 = (void *)MEMORY[0x263EFF940];
    double v13 = objc_msgSend_stringWithFormat_(NSString, v19, v11, @"Expected to load own UIView for %@", v19);
    double v16 = objc_msgSend_exceptionWithName_reason_userInfo_(v12, v14, v15, @"TMLRuntimeException", v13, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v17, v18, v16);
  }
}

void sub_239841EC4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_239841F64;
  v10[3] = &unk_264DAC1F8;
  id v11 = v4;
  double v12 = a1;
  id v7 = v4;
  objc_msgSend__tmlEnsureContext_(a1, v8, v9, v10);
}

void sub_239841F64(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend_loadSourceFromPath_(v4, v5, v6, v3);
  objc_msgSend_rootObject(v4, v7, v8);
  double v19 = (char *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqual_(v19, v9, v10, *(void *)(a1 + 40)) & 1) == 0)
  {
    double v12 = (void *)MEMORY[0x263EFF940];
    double v13 = objc_msgSend_stringWithFormat_(NSString, v19, v11, @"Expected to load own UIView for %@", v19);
    double v16 = objc_msgSend_exceptionWithName_reason_userInfo_(v12, v14, v15, @"TMLRuntimeException", v13, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v17, v18, v16);
  }
}

void sub_239842050(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  double v8 = objc_msgSend_initWithCapacity_(v5, v6, v7, 8);
  double v11 = objc_msgSend_tmlContext(a1, v9, v10);
  double v14 = objc_msgSend_allObjects(v11, v12, v13);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_2398421B8;
  v28[3] = &unk_264DAC1A8;
  id v15 = v8;
  id v29 = v15;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v16, v17, v28);

  objc_msgSend__tmlUnloadContext(a1, v18, v19);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_239842238;
  v24[3] = &unk_264DAC220;
  id v25 = v15;
  id v26 = v4;
  long long v27 = a1;
  id v20 = v4;
  id v21 = v15;
  objc_msgSend__tmlEnsureContext_(a1, v22, v23, v24);
}

void sub_2398421B8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_setObject_forKey_(*(void **)(a1 + 32), v6, v7, v5, v8);
  }
}

void sub_239842238(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = sub_239842378;
  long long v27 = &unk_264DAC1A8;
  id v5 = v3;
  id v28 = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v6, v7, &v24);
  objc_msgSend_loadSource_(v5, v8, v9, a1[5]);
  double v12 = objc_msgSend_rootObject(v5, v10, v11);
  if ((objc_msgSend_isEqual_(v12, v13, v14, a1[6]) & 1) == 0)
  {
    double v17 = (void *)MEMORY[0x263EFF940];
    double v18 = objc_msgSend_stringWithFormat_(NSString, v15, v16, @"Expected to load own UITableViewCell for %@", v12, v24, v25, v26, v27);
    id v21 = objc_msgSend_exceptionWithName_reason_userInfo_(v17, v19, v20, @"TMLRuntimeException", v18, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v22, v23, v21);
  }
}

uint64_t sub_239842378(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

id sub_239842384(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = objc_alloc_init(TMLContext);
  objc_msgSend_loadSourceFromPath_(v4, v5, v6, v3);
  double v9 = objc_msgSend_rootObject(v4, v7, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v12 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v10, v11, v9);
    id v15 = objc_msgSend_tmlIdentifier(v9, v13, v14);
    objc_msgSend_addObject_withIdentifier_(v4, v16, v17, v12, v15);

    objc_setAssociatedObject(v9, &unk_23989E707, v4, (void *)1);
    objc_initWeak(&location, v4);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2398425C0;
    v31[3] = &unk_264DAC1D0;
    objc_copyWeak(&v32, &location);
    objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v18, v19, v31, v9);
    id v20 = v9;
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    id v21 = (void *)MEMORY[0x263EFF940];
    double v22 = objc_msgSend_stringWithFormat_(NSString, v10, v11, @"Expected to load UIView for %@", v9);
    uint64_t v25 = objc_msgSend_exceptionWithName_reason_userInfo_(v21, v23, v24, @"TMLRuntimeException", v22, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v26, v27, v25);

    id v28 = objc_alloc(MEMORY[0x263F1CB60]);
    id v20 = (id)objc_msgSend_initWithFrame_(v28, v29, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }

  return v20;
}

void sub_2398425A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2398425C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_disposeIfNecessary(WeakRetained, v1, v2);
}

uint64_t sub_239842600(void *a1, const char *a2, double a3)
{
  id v12 = 0;
  int v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, @"accessibilityActivate", 0, &v12);
  id v5 = v12;
  double v8 = v5;
  if (v4) {
    uint64_t v9 = objc_msgSend_BOOLValue(v5, v6, v7);
  }
  else {
    uint64_t v9 = objc_msgSend_tmlAccessibilityActivate(a1, v6, v7);
  }
  uint64_t v10 = v9;

  return v10;
}

uint64_t sub_23984267C(void *a1, const char *a2, double a3)
{
  return objc_msgSend_emitTMLSignal_withArguments_(a1, a2, a3, @"accessibilityIncrement", 0);
}

uint64_t sub_23984268C(void *a1, const char *a2, double a3)
{
  return objc_msgSend_emitTMLSignal_withArguments_(a1, a2, a3, @"accessibilityDecrement", 0);
}

void sub_23984269C(objc_class *a1)
{
  InstanceMethod = class_getInstanceMethod(a1, sel_traitCollectionDidChange_);
  id v3 = class_getInstanceMethod(a1, sel_tmlTraitCollectionDidChange_);
  Implementation = method_getImplementation(v3);
  TypeEncoding = method_getTypeEncoding(v3);
  if (class_addMethod(a1, sel_traitCollectionDidChange_, Implementation, TypeEncoding))
  {
    double v6 = method_getImplementation(InstanceMethod);
    double v7 = method_getTypeEncoding(InstanceMethod);
    class_replaceMethod(a1, sel_tmlTraitCollectionDidChange_, v6, v7);
  }
  else
  {
    method_exchangeImplementations(InstanceMethod, v3);
  }
}

void sub_239842780(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_tmlTraitCollectionDidChange_(a1, v5, v6, v4);
  uint64_t v9 = objc_msgSend_traitCollection(a1, v7, v8);
  objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v10, v11, a1, v9, v4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_emitTMLSignal_withArguments_(v14, v12, v13, @"enter", 0);
}

void sub_2398428D4(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10398]);
  id v3 = (void *)qword_268A05750;
  qword_268A05750 = (uint64_t)v2;

  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v7 = objc_msgSend_initWithCapacity_(v4, v5, v6, 16);
  double v8 = (void *)qword_268A05760;
  qword_268A05760 = v7;

  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v9, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v13, v11, v12, *(void *)(a1 + 32), sel_applicationDidReceiveMemoryWarningNotification_, *MEMORY[0x263F1D060], 0);
}

void sub_239842A18(void *a1)
{
}

uint64_t sub_239842BE8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void sub_2398430FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raiseJSException_(v8, v6, v7, v3);
}

uint64_t sub_239843160(double a1, uint64_t a2, const char *a3)
{
  return objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);
}

uint64_t sub_239843170(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v2, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v3) {
      uint64_t isNil = 1;
    }
    else {
      uint64_t isNil = objc_msgSend_isNil_(TMLTypes, v5, v7, v3);
    }
  }
  else
  {
    uint64_t isNil = 1;
  }

  return isNil;
}

BOOL sub_2398431EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v2, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v3
      || (objc_msgSend_isNil_(TMLTypes, v5, v7, v3) & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend_count(v3, v10, v11))
    {
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend_length(v3, v12, v13) == 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

id sub_2398432B4(double a1, uint64_t a2, const char *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = sub_2398433A8(v3);
    }
    else
    {
      v9[0] = v3;
      double v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v4, v5, v9, 1);
      id v6 = sub_2398433A8(v7);
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

id sub_2398433A8(void *a1)
{
  id v1 = a1;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = sub_239844868;
  double v19 = sub_239844878;
  id v20 = 0;
  id v3 = objc_msgSend_null(MEMORY[0x263EFF9D0], v2, COERCE_DOUBLE(0x3032000000));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = sub_239844880;
  v11[3] = &unk_264DAC340;
  id v4 = v3;
  id v12 = v4;
  id v14 = &v15;
  id v5 = v1;
  id v13 = v5;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v5, v6, v7, 2, v11);
  BOOL v8 = (void *)v16[5];
  if (!v8) {
    BOOL v8 = v5;
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_2398434EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_23984413C(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263EFF980];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v6 = objc_msgSend_count(v2, v4, v5);
  id v9 = objc_msgSend_initWithCapacity_(v3, v7, v8, v6);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = sub_23984480C;
  void v14[3] = &unk_264DAC318;
  id v10 = v9;
  id v15 = v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v2, v11, v12, v14);

  return v10;
}

id sub_23984420C(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263EFF9A0];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v6 = objc_msgSend_count(v2, v4, v5);
  id v9 = objc_msgSend_initWithCapacity_(v3, v7, v8, v6);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = sub_239844794;
  void v14[3] = &unk_264DAC2F0;
  id v10 = v9;
  id v15 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v2, v11, v12, v14);

  return v10;
}

id sub_2398442E8(void *a1, uint64_t a2)
{
  id v4 = a1;
  if (v4)
  {
    switch(a2)
    {
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 17:
      case 21:
      case 23:
      case 24:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        goto LABEL_4;
      case 15:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v4;
          objc_msgSend_CGColor(v4, v8, v9);
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_4;
        }
        id v4 = v4;
        objc_msgSend_CGImage(v4, v16, v17);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 19:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        goto LABEL_9;
      case 20:
        id v10 = objc_msgSend_unwrap_(TMLJSNil, v3, v5, v4);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v7 = sub_23984420C(v10);
        }
        else
        {
          double v7 = 0;
        }
        id v4 = v10;
        goto LABEL_16;
      case 22:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_4;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_14;
        }
        goto LABEL_15;
      default:
        if (objc_msgSend_isNil_(TMLJSNil, v3, v5, v4))
        {
          objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15);
          id v6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            sub_23984420C(v4);
            id v6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
LABEL_9:
              sub_23984413C(v4);
              id v6 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend_NSAttributedString(v4, v18, v19);
                id v6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
LABEL_14:
                  objc_msgSend_UIFontValue(v4, v11, v12);
                  id v6 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_msgSend_CGRectValue(v4, v20, v21);
                    id v6 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      objc_msgSend_CGPointValue(v4, v22, v23);
                      id v6 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        objc_msgSend_CGSizeValue(v4, v24, v25);
                        id v6 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          objc_msgSend_NSRangeValue(v4, v26, v27);
                          id v6 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            objc_msgSend_UIEdgeInsetsValue(v4, v28, v29);
                            id v6 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              objc_msgSend_NSDirectionalEdgeInsetsValue(v4, v30, v31);
                              id v6 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                objc_msgSend_CGAffineTransformValue(v4, v32, v33);
                                id v6 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  objc_msgSend_CATransform3DValue(v4, v34, v35);
                                  id v6 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                else
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    objc_msgSend_blockValue(v4, v36, v37);
                                    id v6 = (id)objc_claimAutoreleasedReturnValue();
                                  }
                                  else
                                  {
LABEL_4:
                                    id v6 = v4;
                                    id v4 = v6;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        break;
    }
    double v7 = v6;
  }
  else
  {
LABEL_15:
    double v7 = 0;
  }
LABEL_16:

  return v7;
}

void sub_239844794(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  sub_2398442E8(a3, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v6, v7, v8, v5);
}

void sub_23984480C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  sub_2398442E8(a2, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v2, v3, v4, v5);
}

uint64_t sub_239844868(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_239844878(uint64_t a1)
{
}

void sub_239844880(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(id *)(a1 + 32) == v5)
  {
    id v12 = v5;
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v8)
    {
      uint64_t v9 = objc_msgSend_mutableCopy(*(void **)(a1 + 40), v6, v7);
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      double v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend_removeObjectAtIndex_(v8, v6, v7, a3);
    id v5 = v12;
  }
}

void sub_239844EA4(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x239844DFCLL);
  }
  JUMPOUT(0x239844E00);
}

uint64_t sub_239844EEC(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if (objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2)) {
      return 0;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (!*(void *)(v12 + 160))
    {
      uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"Unexpected token '%s' at line %d", a2, a4);
      uint64_t v14 = *(void *)(a1 + 32);
      double v15 = *(void **)(v14 + 160);
      *(void *)(v14 + 160) = v13;

      uint64_t v12 = *(void *)(a1 + 32);
    }
    *(void *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_2398451D4(_Unwind_Exception *a1)
{
}

void sub_2398451F4(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x239845150);
  }
  JUMPOUT(0x239845154);
}

uint64_t sub_239845218(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if (objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2)) {
      return 0;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (!*(void *)(v12 + 160))
    {
      uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"Unexpected token '%s' at line %d", a2, a4);
      uint64_t v14 = *(void *)(a1 + 32);
      double v15 = *(void **)(v14 + 160);
      *(void *)(v14 + 160) = v13;

      uint64_t v12 = *(void *)(a1 + 32);
    }
    *(void *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_2398454BC(_Unwind_Exception *a1)
{
}

void sub_2398454DC(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x239845424);
  }
  JUMPOUT(0x239845428);
}

uint64_t sub_239845500(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if (objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2)) {
      return 0;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (!*(void *)(v12 + 160))
    {
      uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"Unexpected token '%s' at line %d", a2, a4);
      uint64_t v14 = *(void *)(a1 + 32);
      double v15 = *(void **)(v14 + 160);
      *(void *)(v14 + 160) = v13;

      uint64_t v12 = *(void *)(a1 + 32);
    }
    *(void *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_239845790(_Unwind_Exception *a1)
{
}

void sub_2398457B0(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x23984570CLL);
  }
  JUMPOUT(0x239845710);
}

uint64_t sub_2398457D0(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if (objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2)) {
      return 0;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (!*(void *)(v12 + 160))
    {
      uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"Unexpected token '%s' at line %d", a2, a4);
      uint64_t v14 = *(void *)(a1 + 32);
      double v15 = *(void **)(v14 + 160);
      *(void *)(v14 + 160) = v13;

      uint64_t v12 = *(void *)(a1 + 32);
    }
    *(void *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_2398459C0(_Unwind_Exception *a1)
{
}

void sub_2398459E0(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x239845974);
  }
  JUMPOUT(0x239845978);
}

void sub_239845A20(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 16) == 18)
  {
    *a4 = 1;
  }
  else
  {
    *(_DWORD *)(v9 + 96) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v10 = *(void **)(a1 + 32);
    id v31 = v6;
    uint64_t v11 = objc_msgSend_token(v6, v7, v8);
    objc_msgSend_text(v31, v12, v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_cStringUsingEncoding_(v14, v15, v16, 4);
    LOBYTE(v10) = objc_msgSend_consumeToken_text_(v10, v18, v19, v11, v17);

    if ((v10 & 1) == 0)
    {
      uint64_t v22 = *(void *)(a1 + 32);
      if (!*(void *)(v22 + 160))
      {
        double v23 = NSString;
        double v24 = objc_msgSend_text(v31, v20, v21);
        uint64_t v27 = objc_msgSend_stringWithFormat_(v23, v25, v26, @"Unexpected token '%@' at line %u", v24, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
        uint64_t v28 = *(void *)(a1 + 32);
        double v29 = *(void **)(v28 + 160);
        *(void *)(v28 + 160) = v27;

        uint64_t v22 = *(void *)(a1 + 32);
      }
      *(void *)(v22 + 16) = 18;
      *a4 = 1;
    }
    BOOL v30 = objc_msgSend_token(v31, v20, v21) == 1;
    id v6 = v31;
    if (v30) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

void sub_239846C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_239846C2C(uint64_t a1, void *a2, double a3)
{
  uint64_t result = objc_msgSend_token(a2, (const char *)a2, a3);
  if ((unint64_t)(result - 2) <= 5) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += qword_23989E708[result - 2];
  }
  return result;
}

uint64_t sub_239847570(double a1, uint64_t a2, const char *a3)
{
  qword_268A05770 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], a3, a1, @"(^|(\\w+\\.)+)on([A-Z].*)", 0, 0);
  return MEMORY[0x270F9A758]();
}

void sub_239847774(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_token(v11, v3, v4) == 19)
  {
    double v7 = *(void **)(*(void *)(a1 + 32) + 72);
    double v8 = objc_msgSend_text(v11, v5, v6);
    objc_msgSend_addImplements_(v7, v9, v10, v8);
  }
}

void sub_239847EAC(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v22 = a2;
  uint64_t v8 = objc_msgSend_token(v22, v6, v7);
  if (v8 == 21)
  {
    double v15 = objc_msgSend_text(v22, v9, v10);
    char isEqualToString = objc_msgSend_isEqualToString_(v15, v16, v17, @",");

    if (isEqualToString) {
      goto LABEL_6;
    }
  }
  else if (v8 == 19)
  {
    id v11 = (void *)a1[4];
    uint64_t v12 = objc_msgSend_text(v22, v9, v10);
    objc_msgSend_addObject_(v11, v13, v14, v12);

    goto LABEL_6;
  }
  uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"Malformed argument for pragma %@ at line %d", a1[6], *(unsigned int *)(a1[5] + 96));
  uint64_t v20 = a1[5];
  double v21 = *(void **)(v20 + 160);
  *(void *)(v20 + 160) = v19;

  *a4 = 1;
LABEL_6:
}

void sub_239847F9C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v22 = a2;
  uint64_t v8 = objc_msgSend_token(v22, v6, v7);
  if (v8 == 21)
  {
    double v15 = objc_msgSend_text(v22, v9, v10);
    char isEqualToString = objc_msgSend_isEqualToString_(v15, v16, v17, @",");

    if (isEqualToString) {
      goto LABEL_6;
    }
  }
  else if (v8 == 19)
  {
    id v11 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = objc_msgSend_text(v22, v9, v10);
    objc_msgSend_addRequire_(v11, v13, v14, v12);

    goto LABEL_6;
  }
  uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"Malformed argument for pragma %@ at line %d", *(void *)(a1 + 40), *(unsigned int *)(*(void *)(a1 + 32) + 96));
  uint64_t v20 = *(void *)(a1 + 32);
  double v21 = *(void **)(v20 + 160);
  *(void *)(v20 + 160) = v19;

  *a4 = 1;
LABEL_6:
}

void sub_239848090(uint64_t a1, void *a2, double a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend_text(a2, (const char *)a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v3, v4, v5, v6);
}

void sub_239848430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_239848458(uint64_t a1, void *a2)
{
  id v26 = a2;
  uint64_t v5 = objc_msgSend_token(v26, v3, v4);
  switch(v5)
  {
    case 2:
      uint64_t v8 = *(void *)(a1 + 56);
      goto LABEL_10;
    case 3:
      uint64_t v19 = *(void *)(a1 + 56);
      goto LABEL_12;
    case 4:
    case 5:
      goto LABEL_14;
    case 6:
      uint64_t v8 = *(void *)(a1 + 48);
LABEL_10:
      uint64_t v20 = *(void *)(v8 + 8);
      uint64_t v21 = *(void *)(v20 + 24) + 1;
      goto LABEL_13;
    case 7:
      uint64_t v19 = *(void *)(a1 + 48);
LABEL_12:
      uint64_t v20 = *(void *)(v19 + 8);
      uint64_t v21 = *(void *)(v20 + 24) - 1;
LABEL_13:
      *(void *)(v20 + 24) = v21;
      goto LABEL_14;
    default:
      if (v5 != 21
        || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
        || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
        || (objc_msgSend_text(v26, v6, v7),
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            int isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, @","),
            v9,
            !isEqualToString))
      {
LABEL_14:
        id v22 = *(void **)(a1 + 32);
        double v23 = objc_msgSend_text(v26, v6, v7);
        objc_msgSend_appendString_(v22, v24, v25, v23);
      }
      else
      {
        double v13 = *(void **)(a1 + 40);
        double v14 = objc_msgSend_copy(*(void **)(a1 + 32), v6, v7);
        objc_msgSend_addObject_(v13, v15, v16, v14);

        objc_msgSend_setString_(*(void **)(a1 + 32), v17, v18, &stru_26ECF02A8);
      }

      return;
  }
}

void sub_2398485C8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = NSString;
  id v7 = a2;
  objc_msgSend_stringWithFormat_(v6, v8, v9, @"%%%u", a3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_length(*(void **)(a1 + 32), v10, v11);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v5, v13, v14, v15, v7, 2, 0, v12);
}

void sub_239849070(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2398490A4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v9 = v7;
  if (a3)
  {
    double v14 = v7;
    id v7 = (id)objc_msgSend_token(v7, (const char *)v7, v8);
    if (v7 == (id)2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      id v9 = v14;
LABEL_6:
      *a4 = 1;
      goto LABEL_7;
    }
    id v7 = (id)objc_msgSend_token(v14, v10, v11);
    id v9 = v14;
    if (v7)
    {
      id v7 = (id)objc_msgSend_token(v14, (const char *)v14, v12);
      id v9 = v14;
      if (v7 != (id)1) {
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  return MEMORY[0x270F9A758](v7, v9);
}

void sub_239849150(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v121 = a2;
  switch(objc_msgSend_token(v121, v7, v8))
  {
    case 0:
      if (a3)
      {
        double v23 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v9, v10, a3 - 1);
        objc_msgSend_text(v23, v24, v25);
        id v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v26 = 0;
      }
      if (!sub_2398496DC(v26)) {
        goto LABEL_48;
      }
      double v60 = *(void **)(a1 + 40);
      uint64_t v61 = objc_msgSend_text(v121, v58, v59);
      goto LABEL_27;
    case 2:
      uint64_t v27 = *(void *)(*(void *)(a1 + 88) + 8);
      if (!*(unsigned char *)(v27 + 24))
      {
        uint64_t v28 = objc_alloc_init(TMLJSScope);
        objc_msgSend_setType_(v28, v29, v30, 0);
        objc_msgSend_addObject_(*(void **)(a1 + 64), v31, v32, v28);

        uint64_t v27 = *(void *)(*(void *)(a1 + 88) + 8);
      }
      *(unsigned char *)(v27 + 24) = 0;
      goto LABEL_12;
    case 3:
      objc_msgSend_lastObject(*(void **)(a1 + 64), v9, v10);
      id v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeLastObject(*(void **)(a1 + 64), v33, v34);
      if (!v26 || objc_msgSend_type(v26, v35, v36) != 1) {
        goto LABEL_40;
      }
      uint64_t v39 = *(void **)(a1 + 40);
      long long v40 = objc_msgSend_text(v121, v37, v38);
      objc_msgSend_appendFormat_(v39, v41, v42, @"%@.bind(currentContext())", v40);
      goto LABEL_28;
    case 6:
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      }
      goto LABEL_41;
    case 7:
LABEL_12:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      goto LABEL_41;
    case 10:
    case 19:
      uint64_t v11 = objc_msgSend_length(*(void **)(a1 + 48), v9, v10);
      uint64_t v14 = objc_msgSend_token(v121, v12, v13);
      if (v11)
      {
        if (v14 != 10
          || a3 + 1 >= (unint64_t)objc_msgSend_count(*(void **)(a1 + 32), v9, v10)
          || (objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v9, v10, a3 + 1),
              id v15 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_text(v15, v16, v17),
              double v18 = objc_claimAutoreleasedReturnValue(),
              char isEqualToString = objc_msgSend_isEqualToString_(v18, v19, v20, @"$"),
              v18,
              v15,
              (isEqualToString & 1) == 0))
        {
          id v22 = *(void **)(a1 + 48);
LABEL_47:
          objc_msgSend_text(v121, v9, v10);
          id v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v22, v119, v120, v26);
          goto LABEL_48;
        }
LABEL_41:
        if (objc_msgSend_length(*(void **)(a1 + 48), v9, v10))
        {
          double v105 = objc_msgSend_copy(*(void **)(a1 + 48), v9, v10);
          uint64_t v108 = objc_msgSend_indexOfObject_(*(void **)(a1 + 72), v106, v107, v105);
          v111 = *(void **)(a1 + 40);
          if (v108 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v112 = objc_msgSend_count(*(void **)(a1 + 72), v109, v110);
            objc_msgSend_appendFormat_(v111, v113, v114, @"$(%u)", v112);
            objc_msgSend_addObject_(*(void **)(a1 + 72), v115, v116, v105);
          }
          else
          {
            objc_msgSend_appendFormat_(v111, v109, v110, @"$(%u)", v108);
          }
          objc_msgSend_setString_(*(void **)(a1 + 48), v117, v118, &stru_26ECF02A8);
        }
        id v22 = *(void **)(a1 + 40);
        goto LABEL_47;
      }
      if (v14 == 10) {
        goto LABEL_41;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        objc_msgSend_lastObject(*(void **)(a1 + 64), v9, v10);
        id v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        long long v40 = objc_msgSend_text(v121, v54, v55);
        objc_msgSend_addVar_(v26, v56, v57, v40);
LABEL_31:

LABEL_40:
        goto LABEL_41;
      }
      double v66 = objc_opt_class();
      v69 = objc_msgSend_subarrayWithRange_(*(void **)(a1 + 32), v67, v68, 0, a3);
      objc_msgSend_previousNonSpaceToken_(v66, v70, v71, v69);
      id v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();

      long long v40 = objc_msgSend_text(v121, v72, v73);
      double v76 = objc_msgSend_text(v26, v74, v75);
      char v79 = objc_msgSend_isEqualToString_(@"var", v77, v78, v76);

      if (v79)
      {
        double v82 = objc_msgSend_lastObject(*(void **)(a1 + 64), v80, v81);
        objc_msgSend_addVar_(v82, v83, v84, v40);

        goto LABEL_31;
      }
      if (!objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 56) + 128), v80, v81, v40)
        || objc_msgSend_token(v26, v85, v86) == 10
        || objc_msgSend_token(v121, v87, v88) == 10)
      {
        goto LABEL_37;
      }
      v89 = objc_opt_class();
      double v92 = objc_msgSend_varsInCurrentScope_(v89, v90, v91, *(void *)(a1 + 64));
      if (objc_msgSend_containsObject_(v92, v93, v94, v40))
      {

LABEL_37:
LABEL_38:
        v97 = objc_msgSend_text(v121, v9, v10);
        int v100 = objc_msgSend_isEqualToString_(v97, v98, v99, @"function");

        if (!v100) {
          goto LABEL_41;
        }
        id v26 = objc_alloc_init(TMLJSScope);
        objc_msgSend_setType_(v26, v101, v102, 1);
        objc_msgSend_addObject_(*(void **)(a1 + 64), v103, v104, v26);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        goto LABEL_40;
      }
      objc_msgSend_appendFormat_(*(void **)(a1 + 40), v95, v96, @"this.%@", v40);

LABEL_28:
LABEL_48:

LABEL_49:

      return;
    case 15:
      if (objc_msgSend_length(*(void **)(a1 + 48), v9, v10))
      {
        uint64_t v45 = NSString;
        uint64_t v46 = *(void *)(a1 + 56);
        uint64_t v47 = *(void *)(v46 + 24);
        long long v48 = objc_msgSend_type(*(void **)(v46 + 72), v43, v44);
        uint64_t v51 = objc_msgSend_stringWithFormat_(v45, v49, v50, @"Invalid expression for '%@' of type %@ at line %d", v47, v48, *(unsigned int *)(*(void *)(a1 + 56) + 96));
        uint64_t v52 = *(void *)(a1 + 56);
        v53 = *(void **)(v52 + 160);
        *(void *)(v52 + 160) = v51;

        *a4 = 1;
        goto LABEL_49;
      }
      double v60 = *(void **)(a1 + 48);
      objc_msgSend_text(v121, v43, v44);
      id v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      uint64_t v61 = objc_msgSend_substringFromIndex_(v26, v64, v65, 1);
LABEL_27:
      long long v40 = (void *)v61;
      objc_msgSend_appendString_(v60, v62, v63, v61);
      goto LABEL_28;
    case 20:
      goto LABEL_38;
    default:
      goto LABEL_41;
  }
}

uint64_t sub_2398496DC(void *a1)
{
  uint64_t v1 = qword_268A05790;
  id v3 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_268A05790, &unk_26ECEBF18);
  }
  uint64_t v5 = objc_msgSend_containsObject_((void *)qword_268A05788, v2, v4, v3);

  return v5;
}

unint64_t sub_239849B94(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (objc_msgSend_count(v3, v4, v5) > a2)
  {
    uint64_t v8 = 0;
    do
    {
      id v9 = objc_msgSend_objectAtIndexedSubscript_(v3, v6, v7, a2);
      uint64_t v12 = objc_msgSend_token(v9, v10, v11);

      if (v12 == 7)
      {
        if (!--v8) {
          goto LABEL_10;
        }
      }
      else if (v12 == 6)
      {
        ++v8;
      }
      ++a2;
    }
    while (a2 < objc_msgSend_count(v3, v13, v14));
  }
  a2 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return a2;
}

void sub_23984AD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_23984AD74(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v7 = a2;
  switch(objc_msgSend_token(v7, v8, v9))
  {
    case 0:
    case 1:
    case 10:
      goto LABEL_2;
    case 2:
      uint64_t v16 = *(void *)(*(void *)(a1 + 104) + 8);
      if (!*(unsigned char *)(v16 + 24))
      {
        double v17 = objc_alloc_init(TMLJSScope);
        objc_msgSend_setType_(v17, v18, v19, 0);
        if (!objc_msgSend_count(*(void **)(a1 + 64), v20, v21))
        {
          double v24 = *(void **)(a1 + 72);
          if (v24)
          {
            long long v135 = 0u;
            long long v136 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            id v25 = v24;
            uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, v27, &v133, v137, 16);
            if (v28)
            {
              uint64_t v31 = v28;
              uint64_t v32 = *(void *)v134;
              do
              {
                for (uint64_t i = 0; i != v31; ++i)
                {
                  if (*(void *)v134 != v32) {
                    objc_enumerationMutation(v25);
                  }
                  objc_msgSend_addVar_(v17, v29, v30, *(void *)(*((void *)&v133 + 1) + 8 * i));
                }
                uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v29, v30, &v133, v137, 16);
              }
              while (v31);
            }
          }
        }
        objc_msgSend_addObject_(*(void **)(a1 + 64), v22, v23, v17);

        uint64_t v16 = *(void *)(*(void *)(a1 + 104) + 8);
      }
      *(unsigned char *)(v16 + 24) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_16;
    case 3:
      objc_msgSend_lastObject(*(void **)(a1 + 64), v10, v11);
      double v34 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      double v13 = v34;
      if (v34
        && objc_msgSend_type(v34, v35, v36) == 1
        && (unint64_t)objc_msgSend_count(*(void **)(a1 + 64), v35, v36) >= 2)
      {
        double v37 = *(void **)(a1 + 56);
        double v38 = objc_msgSend_text(v7, v35, v36);
        objc_msgSend_appendFormat_(v37, v39, v40, @"%@.bind(currentContext())", v38);
      }
      else
      {
        double v75 = *(void **)(a1 + 56);
        double v38 = objc_msgSend_text(v7, v35, v36);
        objc_msgSend_appendString_(v75, v76, v77, v38);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      objc_msgSend_removeLastObject(*(void **)(a1 + 64), v78, v79);
      goto LABEL_37;
    case 6:
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
        || !*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      }
      goto LABEL_34;
    case 7:
LABEL_16:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
      goto LABEL_34;
    case 15:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        v80 = *(void **)(a1 + 32);
        objc_msgSend_text(v7, v10, v11);
        double v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v80, v81, v82, v13);
        goto LABEL_42;
      }
      objc_msgSend_text(v7, v10, v11);
      double v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v13, v41, v42, @"$"))
      {
LABEL_42:

        goto LABEL_2;
      }
      uint64_t v45 = objc_msgSend_text(v7, v43, v44);
      char isEqualToString = objc_msgSend_isEqualToString_(v45, v46, v47, @"$self");

      if (isEqualToString)
      {
LABEL_2:
        uint64_t v12 = *(void **)(a1 + 56);
        objc_msgSend_text(v7, v10, v11);
        double v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v12, v14, v15, v13);
        goto LABEL_37;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
      {
        long long v49 = NSString;
        uint64_t v50 = *(void *)(a1 + 40);
        uint64_t v51 = *(void *)(v50 + 24);
        uint64_t v52 = objc_msgSend_type(*(void **)(v50 + 72), v10, v11);
        uint64_t v55 = objc_msgSend_stringWithFormat_(v49, v53, v54, @"Invalid expression for '%@' of type %@ at line %d", v51, v52, *(unsigned int *)(*(void *)(a1 + 40) + 96));
        uint64_t v56 = *(void *)(a1 + 40);
        double v57 = *(void **)(v56 + 160);
        *(void *)(v56 + 160) = v55;

        *a4 = 1;
        goto LABEL_38;
      }
      v111 = objc_opt_class();
      double v114 = objc_msgSend_subarrayWithRange_(*(void **)(a1 + 48), v112, v113, 0, a3);
      objc_msgSend_previousNonSpaceToken_(v111, v115, v116, v114);
      double v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();

      double v60 = objc_msgSend_text(v7, v117, v118);
      id v121 = objc_msgSend_text(v13, v119, v120);
      int v124 = objc_msgSend_isEqualToString_(@"var", v122, v123, v121);

      if (v124) {
        objc_msgSend_addObject_(*(void **)(a1 + 32), v125, v126, v60);
      }
      if (objc_msgSend_containsObject_(*(void **)(a1 + 32), v125, v126, v60))
      {

        goto LABEL_42;
      }
      v129 = *(void **)(a1 + 56);
      v130 = objc_msgSend_substringFromIndex_(v60, v127, v128, 1);
      objc_msgSend_appendFormat_(v129, v131, v132, @"$$('%@')", v130);

      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
LABEL_56:

LABEL_37:
LABEL_38:

      return;
    case 19:
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
      {
        objc_msgSend_lastObject(*(void **)(a1 + 64), v10, v11);
        double v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        double v60 = objc_msgSend_text(v7, v58, v59);
        objc_msgSend_addVar_(v13, v61, v62, v60);
        goto LABEL_30;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
LABEL_34:
        double v71 = *(void **)(a1 + 56);
        v72 = objc_msgSend_text(v7, v10, v11);
        objc_msgSend_appendString_(v71, v73, v74, v72);

        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
        goto LABEL_38;
      }
      v83 = objc_opt_class();
      double v86 = objc_msgSend_subarrayWithRange_(*(void **)(a1 + 48), v84, v85, 0, a3);
      objc_msgSend_previousNonSpaceToken_(v83, v87, v88, v86);
      double v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();

      double v60 = objc_msgSend_text(v7, v89, v90);
      v93 = objc_msgSend_text(v13, v91, v92);
      int v96 = objc_msgSend_isEqualToString_(@"var", v94, v95, v93);

      if (v96)
      {
        double v99 = objc_msgSend_lastObject(*(void **)(a1 + 64), v97, v98);
        objc_msgSend_addVar_(v99, v100, v101, v60);
      }
      else
      {
        if (!objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 40) + 128), v97, v98, v60)
          || objc_msgSend_token(v13, v102, v103) == 10)
        {
LABEL_30:

LABEL_33:
          goto LABEL_34;
        }
        double v104 = objc_opt_class();
        double v99 = objc_msgSend_varsInCurrentScope_(v104, v105, v106, *(void *)(a1 + 64));
        if (!objc_msgSend_containsObject_(v99, v107, v108, v60))
        {
          objc_msgSend_appendFormat_(*(void **)(a1 + 56), v109, v110, @"this.%@", v60);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;

          goto LABEL_56;
        }
      }

      goto LABEL_30;
    case 20:
      double v63 = objc_msgSend_text(v7, v10, v11);
      int v66 = objc_msgSend_isEqualToString_(v63, v64, v65, @"function");

      if (!v66) {
        goto LABEL_34;
      }
      double v13 = objc_alloc_init(TMLJSScope);
      objc_msgSend_setType_(v13, v67, v68, 1);
      objc_msgSend_addObject_(*(void **)(a1 + 64), v69, v70, v13);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
      goto LABEL_33;
    default:
      goto LABEL_34;
  }
}

uint64_t sub_23984B638(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], a3, a1, @"Array", @"Boolean", @"Date", @"Function", @"Math", @"Number", @"Object", @"RegExp", @"String", 0);
  uint64_t v4 = qword_268A05778;
  qword_268A05778 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t sub_23984B7D4(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], a3, a1, @"return", @"var", @"new", @"switch", @"case", @"throw", @"let", @"instanceof", @"else", @"in", @"of", @"const", @"delete", @"typeof", 0);
  uint64_t v4 = qword_268A05788;
  qword_268A05788 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

const char *sub_23984B8A8()
{
  return "1.2.1";
}

uint64_t sub_23984B8B4()
{
  return 1002001;
}

char *sub_23984B8C0(uint64_t a1, size_t __n, void *__src)
{
  size_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  size_t v8 = v6 + __n;
  if (v6 + __n <= v7)
  {
    double v11 = *(char **)(a1 + 24);
LABEL_13:
    uint64_t result = (char *)memcpy(&v11[v6], __src, __n);
    *(void *)(a1 + 16) = v8;
    return result;
  }
  do
    v7 *= 2;
  while (v7 < v8);
  if (*(void *)(a1 + 40)) {
    double v9 = *(uint64_t (***)(int, size_t))(a1 + 40);
  }
  else {
    double v9 = &off_26B8786E0;
  }
  uint64_t result = (char *)(*v9)((int)v9[2], v7);
  if (result)
  {
    double v11 = result;
    memcpy(result, *(const void **)(a1 + 24), *(void *)(a1 + 16));
    if (*(_DWORD *)(a1 + 32))
    {
      if (*(void *)(a1 + 24)) {
        ((void (*)(uint64_t (*)(int, size_t)))v9[1])(v9[2]);
      }
    }
    else
    {
      *(_DWORD *)(a1 + 32) = 1;
    }
    *(void *)(a1 + 24) = v11;
    *(void *)(a1 + 8) = v7;
    uint64_t v6 = *(void *)(a1 + 16);
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_23984B99C(uint64_t a1)
{
  uint64_t v1 = *(_DWORD **)a1;
  if (**(_DWORD **)a1 != 682290937) {
    sub_239898F44();
  }
  if (v1[12])
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *((void *)v1 + 7);
      uint64_t v6 = (_DWORD *)(v5 + 72 * v3);
      uint64_t v7 = v6[5];
      size_t v8 = (unsigned int *)(a1 + v6[6]);
      int v9 = v6[3];
      if (v9 == 1)
      {
        if ((*(unsigned char *)(v5 + 72 * v3 + 48) & 4) != 0)
        {
          if (*(_DWORD *)(a1 + v7) != *(_DWORD *)(v5 + 72 * v3 + 8)) {
            goto LABEL_38;
          }
          int v24 = *(_DWORD *)(v5 + 72 * v3 + 16);
          if (v24 != 16 && v24 != 14) {
            goto LABEL_6;
          }
        }
        else
        {
          int v11 = *(_DWORD *)(v5 + 72 * v3 + 16);
          if (v11 != 16 && v11 != 14)
          {
            if (!*(_DWORD *)(a1 + v7)) {
              goto LABEL_38;
            }
            goto LABEL_6;
          }
        }
        if (!*(void *)v8 || *(void *)v8 == *(void *)(v5 + 72 * v3 + 40)) {
          goto LABEL_38;
        }
      }
      else if (v9)
      {
        unint64_t v13 = *(void *)(a1 + v7);
        if (v13)
        {
          unsigned int v14 = *(_DWORD *)(v5 + 72 * v3 + 8);
          if (v14 >> 25) {
            uint64_t v15 = 5;
          }
          else {
            uint64_t v15 = 4;
          }
          if (v14 < 0x40000) {
            uint64_t v15 = 3;
          }
          if (v14 < 0x800) {
            uint64_t v15 = 2;
          }
          if (v14 >= 0x10) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = 1;
          }
          uint64_t v17 = v5 + 72 * v3;
          int v19 = *(_DWORD *)(v17 + 48);
          double v18 = (_DWORD *)(v17 + 48);
          int v20 = v19 & 1;
          if (v19) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = v13;
          }
          uint64_t v22 = *(void *)v8;
          switch(*(v18 - 8))
          {
            case 0:
            case 0xD:
              uint64_t v26 = 0;
              uint64_t v23 = 0;
              unsigned int v27 = 1;
              do
              {
                unsigned int v28 = *(_DWORD *)(v22 + 4 * v26);
                if ((v28 & 0x80000000) != 0)
                {
                  uint64_t v29 = 10;
                }
                else if (v28 >= 0x80)
                {
                  if (v28 >= 0x4000)
                  {
                    if (v28 >> 28) {
                      uint64_t v30 = 5;
                    }
                    else {
                      uint64_t v30 = 4;
                    }
                    if (v28 >= 0x200000) {
                      uint64_t v29 = v30;
                    }
                    else {
                      uint64_t v29 = 3;
                    }
                  }
                  else
                  {
                    uint64_t v29 = 2;
                  }
                }
                else
                {
                  uint64_t v29 = 1;
                }
                v23 += v29;
                uint64_t v26 = v27;
                BOOL v31 = v13 > v27++;
              }
              while (v31);
              break;
            case 1:
              uint64_t v39 = 0;
              uint64_t v23 = 0;
              unsigned int v40 = 1;
              do
              {
                unsigned int v41 = (2 * *(_DWORD *)(v22 + 4 * v39)) ^ (*(int *)(v22 + 4 * v39) >> 31);
                if (v41 >= 0x80)
                {
                  if (v41 >= 0x4000)
                  {
                    if (v41 >= 0x200000)
                    {
                      if (v41 >> 28) {
                        uint64_t v42 = 5;
                      }
                      else {
                        uint64_t v42 = 4;
                      }
                    }
                    else
                    {
                      uint64_t v42 = 3;
                    }
                  }
                  else
                  {
                    uint64_t v42 = 2;
                  }
                }
                else
                {
                  uint64_t v42 = 1;
                }
                v23 += v42;
                uint64_t v39 = v40;
                BOOL v31 = v13 > v40++;
              }
              while (v31);
              break;
            case 2:
            case 7:
            case 0xA:
              uint64_t v23 = 4 * v13;
              break;
            case 3:
            case 8:
              uint64_t v32 = 0;
              uint64_t v23 = 0;
              unsigned int v33 = 1;
              do
              {
                unint64_t v34 = *(void *)(v22 + 8 * v32);
                if (HIDWORD(v34))
                {
                  if (v34 >> 35)
                  {
                    if (v34 >> 42)
                    {
                      unint64_t v37 = v34 >> 49;
                      unint64_t v38 = HIBYTE(v34);
                      if ((v34 & 0x8000000000000000) == 0) {
                        uint64_t v35 = 9;
                      }
                      else {
                        uint64_t v35 = 10;
                      }
                      if (!v38) {
                        uint64_t v35 = 8;
                      }
                      if (!v37) {
                        uint64_t v35 = 7;
                      }
                    }
                    else
                    {
                      uint64_t v35 = 6;
                    }
                  }
                  else
                  {
                    uint64_t v35 = 5;
                  }
                }
                else if (v34 >= 0x80)
                {
                  if (v34 >= 0x4000)
                  {
                    if (v34 >> 28) {
                      uint64_t v36 = 5;
                    }
                    else {
                      uint64_t v36 = 4;
                    }
                    if (v34 >= 0x200000) {
                      uint64_t v35 = v36;
                    }
                    else {
                      uint64_t v35 = 3;
                    }
                  }
                  else
                  {
                    uint64_t v35 = 2;
                  }
                }
                else
                {
                  uint64_t v35 = 1;
                }
                v23 += v35;
                uint64_t v32 = v33;
                BOOL v31 = v13 > v33++;
              }
              while (v31);
              break;
            case 4:
              uint64_t v43 = 0;
              uint64_t v23 = 0;
              unsigned int v44 = 1;
              do
              {
                unint64_t v45 = (2 * *(void *)(v22 + 8 * v43)) ^ (*(uint64_t *)(v22 + 8 * v43) >> 63);
                if (HIDWORD(v45))
                {
                  if (v45 >> 35)
                  {
                    if (v45 >> 42)
                    {
                      if (v45 >> 49)
                      {
                        if (HIBYTE(v45))
                        {
                          if ((v45 & 0x8000000000000000) == 0) {
                            uint64_t v46 = 9;
                          }
                          else {
                            uint64_t v46 = 10;
                          }
                        }
                        else
                        {
                          uint64_t v46 = 8;
                        }
                      }
                      else
                      {
                        uint64_t v46 = 7;
                      }
                    }
                    else
                    {
                      uint64_t v46 = 6;
                    }
                  }
                  else
                  {
                    uint64_t v46 = 5;
                  }
                }
                else if (v45 >= 0x80)
                {
                  if (v45 >= 0x4000)
                  {
                    if (v45 >= 0x200000)
                    {
                      if (v45 >> 28) {
                        uint64_t v46 = 5;
                      }
                      else {
                        uint64_t v46 = 4;
                      }
                    }
                    else
                    {
                      uint64_t v46 = 3;
                    }
                  }
                  else
                  {
                    uint64_t v46 = 2;
                  }
                }
                else
                {
                  uint64_t v46 = 1;
                }
                v23 += v46;
                uint64_t v43 = v44;
                BOOL v31 = v13 > v44++;
              }
              while (v31);
              break;
            case 5:
            case 9:
            case 0xB:
              uint64_t v23 = 8 * v13;
              break;
            case 6:
              uint64_t v47 = 0;
              uint64_t v23 = 0;
              unsigned int v48 = 1;
              do
              {
                unsigned int v49 = *(_DWORD *)(v22 + 4 * v47);
                if (v49 >= 0x80)
                {
                  if (v49 >= 0x4000)
                  {
                    if (v49 >> 28) {
                      uint64_t v51 = 5;
                    }
                    else {
                      uint64_t v51 = 4;
                    }
                    if (v49 >= 0x200000) {
                      uint64_t v50 = v51;
                    }
                    else {
                      uint64_t v50 = 3;
                    }
                  }
                  else
                  {
                    uint64_t v50 = 2;
                  }
                }
                else
                {
                  uint64_t v50 = 1;
                }
                v23 += v50;
                uint64_t v47 = v48;
                BOOL v31 = v13 > v48++;
              }
              while (v31);
              break;
            case 0xC:
              uint64_t v23 = v13;
              break;
            case 0xE:
              int v75 = v20;
              uint64_t v76 = v21;
              uint64_t v78 = v16;
              uint64_t v55 = 0;
              uint64_t v23 = 0;
              unsigned int v56 = 1;
              do
              {
                size_t v57 = strlen(*(const char **)(v22 + 8 * v55));
                uint64_t v58 = 4;
                if (v57 >> 28) {
                  uint64_t v58 = 5;
                }
                if (v57 < 0x200000) {
                  uint64_t v58 = 3;
                }
                if (v57 < 0x4000) {
                  uint64_t v58 = 2;
                }
                if (v57 < 0x80) {
                  uint64_t v58 = 1;
                }
                v23 += v57 + v58;
                uint64_t v55 = v56;
                BOOL v31 = v13 > v56++;
              }
              while (v31);
              uint64_t v21 = v76;
              uint64_t v16 = v78;
              int v20 = v75;
              break;
            case 0xF:
              uint64_t v59 = 0;
              uint64_t v23 = 0;
              unsigned int v60 = 1;
              do
              {
                uint64_t v61 = *(void *)(v22 + 16 * v59);
                if (v61 >> 28) {
                  uint64_t v62 = 5;
                }
                else {
                  uint64_t v62 = 4;
                }
                if (v61 < 0x200000) {
                  uint64_t v62 = 3;
                }
                if (v61 < 0x4000) {
                  uint64_t v62 = 2;
                }
                if (v61 < 0x80) {
                  uint64_t v62 = 1;
                }
                v23 += v61 + v62;
                uint64_t v59 = v60;
                BOOL v31 = v13 > v60++;
              }
              while (v31);
              break;
            case 0x10:
              uint64_t v77 = v21;
              uint64_t v79 = v16;
              uint64_t v63 = 0;
              uint64_t v23 = 0;
              unsigned int v64 = 1;
              do
              {
                uint64_t v65 = sub_23984B99C(*(void *)(v22 + 8 * v63));
                if (v65 >> 28) {
                  uint64_t v66 = 5;
                }
                else {
                  uint64_t v66 = 4;
                }
                if (v65 < 0x200000) {
                  uint64_t v66 = 3;
                }
                if (v65 < 0x4000) {
                  uint64_t v66 = 2;
                }
                if (v65 < 0x80) {
                  uint64_t v66 = 1;
                }
                v23 += v65 + v66;
                uint64_t v63 = v64;
                BOOL v31 = v13 > v64++;
              }
              while (v31);
              int v20 = *v18 & 1;
              uint64_t v21 = v77;
              uint64_t v16 = v79;
              break;
            default:
              uint64_t v23 = 0;
              break;
          }
          uint64_t v52 = v21 * v16;
          if (v23 >> 28) {
            uint64_t v53 = 5;
          }
          else {
            uint64_t v53 = 4;
          }
          if (v23 < 0x200000) {
            uint64_t v53 = 3;
          }
          if (v23 < 0x4000) {
            uint64_t v53 = 2;
          }
          if (v23 < 0x80) {
            uint64_t v53 = 1;
          }
          uint64_t v54 = v53 + v52;
          if (v20) {
            uint64_t v52 = v54;
          }
          uint64_t v10 = v52 + v23;
          goto LABEL_143;
        }
LABEL_38:
        uint64_t v10 = 0;
        goto LABEL_143;
      }
LABEL_6:
      uint64_t v10 = sub_23984C078((uint64_t)v6, v8);
LABEL_143:
      v4 += v10;
      ++v3;
      uint64_t v1 = *(_DWORD **)a1;
      if (v3 >= *(unsigned int *)(*(void *)a1 + 48)) {
        goto LABEL_181;
      }
    }
  }
  uint64_t v4 = 0;
LABEL_181:
  uint64_t v67 = *(unsigned int *)(a1 + 8);
  if (v67)
  {
    double v68 = (void *)(*(void *)(a1 + 16) + 8);
    do
    {
      unsigned int v69 = *((_DWORD *)v68 - 2);
      uint64_t v71 = *v68;
      v68 += 3;
      uint64_t v70 = v71;
      if (v69 >> 25) {
        uint64_t v72 = 5;
      }
      else {
        uint64_t v72 = 4;
      }
      if (v69 < 0x40000) {
        uint64_t v72 = 3;
      }
      if (v69 < 0x800) {
        uint64_t v72 = 2;
      }
      if (v69 >= 0x10) {
        uint64_t v73 = v72;
      }
      else {
        uint64_t v73 = 1;
      }
      v4 += v73 + v70;
      --v67;
    }
    while (v67);
  }
  return v4;
}

uint64_t sub_23984C078(uint64_t a1, unsigned int *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v2 >> 25) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x40000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x800) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x10) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  switch(*(_DWORD *)(a1 + 16))
  {
    case 0:
    case 0xD:
      unsigned int v8 = *a2;
      if ((*a2 & 0x80000000) == 0) {
        goto LABEL_31;
      }
      uint64_t v9 = 10;
      return v9 + v6;
    case 1:
      unsigned int v14 = (2 * *a2) ^ ((int)*a2 >> 31);
      if (v14 < 0x80) {
        goto LABEL_32;
      }
      if (v14 < 0x4000) {
        goto LABEL_29;
      }
      if (v14 < 0x200000) {
        goto LABEL_80;
      }
      unsigned int v15 = v14 >> 28;
      goto LABEL_84;
    case 2:
    case 7:
    case 0xA:
      return v6 + 4;
    case 3:
    case 8:
      unint64_t v10 = *(void *)a2;
      if (HIDWORD(*(void *)a2))
      {
        if (!(v10 >> 35)) {
          goto LABEL_71;
        }
        unint64_t v25 = v10 >> 42;
        unint64_t v26 = v10 >> 49;
        unint64_t v27 = HIBYTE(v10);
        BOOL v28 = (v10 & 0x8000000000000000) != 0;
        uint64_t v9 = 9;
        if (v28) {
          uint64_t v9 = 10;
        }
        if (!v27) {
          uint64_t v9 = 8;
        }
        if (!v26) {
          uint64_t v9 = 7;
        }
        if (!v25) {
          uint64_t v9 = 6;
        }
      }
      else
      {
        if (v10 < 0x80) {
          goto LABEL_32;
        }
        uint64_t v11 = 3;
        uint64_t v12 = 4;
        if (v10 >> 28) {
          uint64_t v12 = 5;
        }
        if (v10 >= 0x200000) {
          uint64_t v11 = v12;
        }
        BOOL v13 = v10 >= 0x4000;
LABEL_38:
        if (v13) {
          uint64_t v9 = v11;
        }
        else {
          uint64_t v9 = 2;
        }
      }
      break;
    case 4:
      unint64_t v16 = (2 * *(void *)a2) ^ (*(uint64_t *)a2 >> 63);
      if (HIDWORD(v16))
      {
        if (v16 >> 35)
        {
          if (v16 >> 42)
          {
            if (v16 >> 49)
            {
              if (HIBYTE(v16))
              {
                BOOL v28 = (v16 & 0x8000000000000000) != 0;
                uint64_t v9 = 9;
                if (v28) {
                  uint64_t v9 = 10;
                }
              }
              else
              {
                uint64_t v9 = 8;
              }
            }
            else
            {
              uint64_t v9 = 7;
            }
          }
          else
          {
            uint64_t v9 = 6;
          }
        }
        else
        {
LABEL_71:
          uint64_t v9 = 5;
        }
      }
      else if (v16 < 0x80)
      {
LABEL_32:
        uint64_t v9 = 1;
      }
      else if (v16 >= 0x4000)
      {
        if (v16 >= 0x200000)
        {
          unsigned int v15 = v16 >> 28;
LABEL_84:
          BOOL v30 = v15 == 0;
          uint64_t v9 = 4;
          if (!v30) {
            uint64_t v9 = 5;
          }
        }
        else
        {
LABEL_80:
          uint64_t v9 = 3;
        }
      }
      else
      {
LABEL_29:
        uint64_t v9 = 2;
      }
      break;
    case 5:
    case 9:
    case 0xB:
      return v6 | 8;
    case 6:
      unsigned int v8 = *a2;
LABEL_31:
      if (v8 < 0x80) {
        goto LABEL_32;
      }
      uint64_t v11 = 3;
      uint64_t v17 = 4;
      if (v8 >> 28) {
        uint64_t v17 = 5;
      }
      if (v8 >= 0x200000) {
        uint64_t v11 = v17;
      }
      BOOL v13 = v8 >= 0x4000;
      goto LABEL_38;
    case 0xC:
      return v6 + 1;
    case 0xE:
      double v18 = *(const char **)a2;
      if (!*(void *)a2) {
        goto LABEL_56;
      }
      double v18 = (const char *)strlen(v18);
      goto LABEL_55;
    case 0xF:
      unint64_t v19 = *(void *)a2;
      uint64_t v20 = 1;
      uint64_t v21 = 2;
      uint64_t v22 = 3;
      uint64_t v23 = 4;
      if (*(void *)a2 >> 28) {
        uint64_t v23 = 5;
      }
      if (v19 >= 0x200000) {
        uint64_t v22 = v23;
      }
      if (v19 >= 0x4000) {
        uint64_t v21 = v22;
      }
      if (v19 >= 0x80) {
        uint64_t v20 = v21;
      }
      return v19 + v6 + v20;
    case 0x10:
      double v18 = *(const char **)a2;
      if (!*(void *)a2) {
        goto LABEL_56;
      }
      double v18 = (const char *)sub_23984B99C();
LABEL_55:
      if (v18 >= 0x80)
      {
        if (v18 >= 0x4000)
        {
          uint64_t v24 = 3;
          uint64_t v29 = 4;
          if (v18 >> 28) {
            uint64_t v29 = 5;
          }
          if (v18 >= 0x200000) {
            uint64_t v24 = v29;
          }
        }
        else
        {
          uint64_t v24 = 2;
        }
      }
      else
      {
LABEL_56:
        uint64_t v24 = 1;
      }
      return (uint64_t)&v18[v6 + v24];
    default:
      sub_239898F70();
  }
  return v9 + v6;
}

uint64_t sub_23984C3A0(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD **)a1;
  if (**(_DWORD **)a1 != 682290937) {
    sub_239899020();
  }
  uint64_t v3 = a2;
  if (v2[12])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *((void *)v2 + 7);
      unsigned int v8 = (_DWORD *)(v7 + 72 * v5);
      uint64_t v9 = v8[5];
      unint64_t v10 = (unint64_t *)(a1 + v8[6]);
      int v11 = v8[3];
      if (v11 == 1)
      {
        uint64_t v12 = (unsigned char *)(v3 + v6);
        if ((*(unsigned char *)(v7 + 72 * v5 + 48) & 4) != 0)
        {
          if (*(_DWORD *)(a1 + v9) != *(_DWORD *)(v7 + 72 * v5 + 8)) {
            goto LABEL_33;
          }
          int v23 = *(_DWORD *)(v7 + 72 * v5 + 16);
          if (v23 != 16 && v23 != 14) {
            goto LABEL_7;
          }
        }
        else
        {
          int v14 = *(_DWORD *)(v7 + 72 * v5 + 16);
          if (v14 != 16 && v14 != 14)
          {
            if (!*(_DWORD *)(a1 + v9)) {
              goto LABEL_33;
            }
            goto LABEL_7;
          }
        }
        if (!*v10 || *v10 == *(void *)(v7 + 72 * v5 + 40)) {
          goto LABEL_33;
        }
      }
      else
      {
        if (v11)
        {
          unint64_t v16 = *(void *)(a1 + v9);
          uint64_t v17 = (unsigned char *)(v3 + v6);
          double v18 = (char *)*v10;
          if (*(unsigned char *)(v7 + 72 * v5 + 48))
          {
            if (v16)
            {
              uint64_t v25 = v7 + 72 * v5;
              int v26 = sub_23984FAB4(*(_DWORD *)(v25 + 8), (unsigned char *)(v3 + v6));
              *v17 |= 2u;
              int v27 = *(_DWORD *)(v25 + 16);
              if ((v27 - 2) > 9) {
                int v28 = 1;
              }
              else {
                int v28 = dword_23989E760[v27 - 2];
              }
              unsigned int v29 = v28 * v16;
              if (v29 >= 0x80)
              {
                if (v29 >= 0x4000)
                {
                  if (v29 >> 28) {
                    int v31 = 5;
                  }
                  else {
                    int v31 = 4;
                  }
                  if (v29 >= 0x200000) {
                    int v30 = v31;
                  }
                  else {
                    int v30 = 3;
                  }
                }
                else
                {
                  int v30 = 2;
                }
              }
              else
              {
                int v30 = 1;
              }
              int v75 = v26;
              uint64_t v32 = (v30 + v26);
              unsigned int v33 = &v17[v32];
              int v76 = v30;
              switch(v27)
              {
                case 0:
                case 13:
                  uint64_t v38 = 0;
                  unsigned int v39 = 1;
                  unint64_t v37 = &v17[v32];
                  do
                  {
                    unsigned int v40 = *(_DWORD *)&v18[4 * v38];
                    if ((v40 & 0x80000000) != 0)
                    {
                      int32x4_t v43 = vdupq_n_s32(v40);
                      unsigned char *v37 = v40 | 0x80;
                      int32x4_t v44 = (int32x4_t)vshlq_u32((uint32x4_t)v43, (uint32x4_t)xmmword_23989E740);
                      int16x8_t v45 = (int16x8_t)vshlq_s32(v43, (int32x4_t)xmmword_23989E740);
                      v44.i32[3] = v45.i32[3];
                      v45.i64[0] = *(void *)&vmovn_s32(v44) | 0x80008000800080;
                      *(_DWORD *)(v37 + 1) = vmovn_s16(v45).u32[0];
                      *(_DWORD *)(v37 + 5) = -1;
                      v37[9] = 1;
                      uint64_t v46 = 10;
                    }
                    else
                    {
                      if (v40 < 0x80)
                      {
                        uint64_t v42 = 0;
                      }
                      else
                      {
                        unsigned char *v37 = v40 | 0x80;
                        if (v40 < 0x4000)
                        {
                          v40 >>= 7;
                          uint64_t v42 = 1;
                        }
                        else
                        {
                          v37[1] = (v40 >> 7) | 0x80;
                          if (v40 < 0x200000)
                          {
                            v40 >>= 14;
                            uint64_t v42 = 2;
                          }
                          else
                          {
                            v37[2] = (v40 >> 14) | 0x80;
                            unsigned int v41 = v40 >> 21;
                            v40 >>= 28;
                            if (v40)
                            {
                              v37[3] = v41 | 0x80;
                              uint64_t v42 = 4;
                            }
                            else
                            {
                              LOBYTE(v40) = v41;
                              uint64_t v42 = 3;
                            }
                          }
                        }
                      }
                      uint64_t v46 = v42 + 1;
                      v37[v42] = v40;
                    }
                    v37 += v46;
                    uint64_t v38 = v39;
                    BOOL v22 = v16 > v39++;
                  }
                  while (v22);
                  break;
                case 1:
                  uint64_t v49 = 0;
                  unsigned int v50 = 1;
                  unint64_t v37 = &v17[v32];
                  do
                  {
                    unsigned int v51 = (2 * *(_DWORD *)&v18[4 * v49]) ^ (*(int *)&v18[4 * v49] >> 31);
                    if (v51 < 0x80)
                    {
                      uint64_t v53 = 0;
                    }
                    else
                    {
                      unsigned char *v37 = v51 | 0x80;
                      if (v51 < 0x4000)
                      {
                        v51 >>= 7;
                        uint64_t v53 = 1;
                      }
                      else
                      {
                        v37[1] = (v51 >> 7) | 0x80;
                        if (v51 < 0x200000)
                        {
                          v51 >>= 14;
                          uint64_t v53 = 2;
                        }
                        else
                        {
                          v37[2] = (v51 >> 14) | 0x80;
                          unsigned int v52 = v51 >> 21;
                          v51 >>= 28;
                          if (v51)
                          {
                            v37[3] = v52 | 0x80;
                            uint64_t v53 = 4;
                          }
                          else
                          {
                            LOBYTE(v51) = v52;
                            uint64_t v53 = 3;
                          }
                        }
                      }
                    }
                    uint64_t v54 = &v37[v53];
                    unsigned char *v54 = v51;
                    unint64_t v37 = v54 + 1;
                    uint64_t v49 = v50;
                    BOOL v22 = v16 > v50++;
                  }
                  while (v22);
                  break;
                case 2:
                case 7:
                case 10:
                  int v34 = v30 + v26;
                  int v35 = 4 * v16;
                  size_t v36 = (4 * v16) & 0xFFFFFFFC;
                  goto LABEL_48;
                case 3:
                case 8:
                  uint64_t v47 = 0;
                  unsigned int v48 = 1;
                  unint64_t v37 = &v17[v32];
                  do
                  {
                    v37 += sub_23984FB48(*(void *)&v18[8 * v47], v37);
                    uint64_t v47 = v48;
                    BOOL v22 = v16 > v48++;
                  }
                  while (v22);
                  break;
                case 4:
                  uint64_t v55 = 0;
                  unsigned int v56 = 1;
                  unint64_t v37 = &v17[v32];
                  do
                  {
                    v37 += sub_23984FB48((2 * *(void *)&v18[8 * v55]) ^ (*(uint64_t *)&v18[8 * v55] >> 63), v37);
                    uint64_t v55 = v56;
                    BOOL v22 = v16 > v56++;
                  }
                  while (v22);
                  break;
                case 5:
                case 9:
                case 11:
                  int v34 = v30 + v26;
                  int v35 = 8 * v16;
                  size_t v36 = (8 * v16) & 0xFFFFFFF8;
LABEL_48:
                  memcpy(v33, v18, v36);
                  LODWORD(v37) = v33 + v35;
                  LODWORD(v32) = v34;
                  break;
                case 6:
                  uint64_t v57 = 0;
                  unsigned int v58 = 1;
                  unint64_t v37 = &v17[v32];
                  do
                  {
                    unsigned int v59 = *(_DWORD *)&v18[4 * v57];
                    if (v59 < 0x80)
                    {
                      uint64_t v61 = 0;
                    }
                    else
                    {
                      unsigned char *v37 = v59 | 0x80;
                      if (v59 < 0x4000)
                      {
                        v59 >>= 7;
                        uint64_t v61 = 1;
                      }
                      else
                      {
                        v37[1] = (v59 >> 7) | 0x80;
                        if (v59 < 0x200000)
                        {
                          v59 >>= 14;
                          uint64_t v61 = 2;
                        }
                        else
                        {
                          v37[2] = (v59 >> 14) | 0x80;
                          unsigned int v60 = v59 >> 21;
                          v59 >>= 28;
                          if (v59)
                          {
                            v37[3] = v60 | 0x80;
                            uint64_t v61 = 4;
                          }
                          else
                          {
                            LOBYTE(v59) = v60;
                            uint64_t v61 = 3;
                          }
                        }
                      }
                    }
                    uint64_t v62 = &v37[v61];
                    unsigned char *v62 = v59;
                    unint64_t v37 = v62 + 1;
                    uint64_t v57 = v58;
                    BOOL v22 = v16 > v58++;
                  }
                  while (v22);
                  break;
                case 12:
                  uint64_t v63 = 0;
                  uint64_t v64 = 0;
                  do
                  {
                    v33[v63++] = *(_DWORD *)&v18[4 * v64] != 0;
                    uint64_t v64 = v63;
                  }
                  while (v16 > v63);
                  LODWORD(v37) = v33 + v63;
                  break;
                default:
                  sub_239898FC8();
              }
              unsigned int v65 = v37 - v33;
              if ((v37 - v33) >= 0x80)
              {
                if (v65 >= 0x4000)
                {
                  if (v65 >> 28) {
                    int v66 = 5;
                  }
                  else {
                    int v66 = 4;
                  }
                  if (v65 < 0x200000) {
                    int v66 = 3;
                  }
                }
                else
                {
                  int v66 = 2;
                }
              }
              else
              {
                int v66 = 1;
              }
              if (v76 != v66)
              {
                if (v76 + 1 != v66) {
                  sub_239898FF4();
                }
                memmove(v33 + 1, v33, (v37 - v33));
                LODWORD(v32) = v32 + 1;
              }
              uint64_t v67 = &v17[v75];
              if (v65 < 0x80)
              {
                uint64_t v69 = 0;
                LOBYTE(v68) = (_BYTE)v37 - (_BYTE)v33;
              }
              else
              {
                unsigned char *v67 = v65 | 0x80;
                unsigned int v68 = v65 >> 7;
                if (v65 < 0x4000)
                {
                  uint64_t v69 = 1;
                }
                else
                {
                  v67[1] = v68 | 0x80;
                  unsigned int v68 = v65 >> 14;
                  if (v65 < 0x200000)
                  {
                    uint64_t v69 = 2;
                  }
                  else
                  {
                    v67[2] = v68 | 0x80;
                    unsigned int v68 = v65 >> 21;
                    if (v65 >> 28)
                    {
                      v67[3] = v68 | 0x80;
                      unsigned int v68 = v65 >> 28;
                      uint64_t v69 = 4;
                    }
                    else
                    {
                      uint64_t v69 = 3;
                    }
                  }
                }
              }
              v67[v69] = v68;
              uint64_t v13 = v32 + v65;
              goto LABEL_119;
            }
          }
          else
          {
            uint64_t v19 = *(int *)(v7 + 72 * v5 + 16);
            if (v19 >= 0x11) {
              sub_239898F9C();
            }
            if (v16)
            {
              uint64_t v13 = 0;
              uint64_t v20 = qword_23989E788[v19];
              unsigned int v21 = 1;
              do
              {
                v13 += sub_23984CAE0((uint64_t)v8, (unint64_t *)v18, &v17[v13]);
                v18 += v20;
                BOOL v22 = v16 > v21++;
              }
              while (v22);
              goto LABEL_119;
            }
          }
LABEL_33:
          uint64_t v13 = 0;
          goto LABEL_119;
        }
        uint64_t v12 = (unsigned char *)(v3 + v6);
      }
LABEL_7:
      uint64_t v13 = sub_23984CAE0((uint64_t)v8, v10, v12);
LABEL_119:
      v6 += v13;
      ++v5;
      unsigned int v2 = *(_DWORD **)a1;
      uint64_t v3 = a2;
      if (v5 >= *(unsigned int *)(*(void *)a1 + 48)) {
        goto LABEL_122;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_122:
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v70 = 0;
    unint64_t v71 = 0;
    do
    {
      uint64_t v72 = *(void *)(a1 + 16) + v70;
      uint64_t v73 = sub_23984FAB4(*(_DWORD *)v72, (unsigned char *)(v3 + v6));
      *(unsigned char *)(v3 + v6) |= *(unsigned char *)(v72 + 4);
      memcpy((void *)(v3 + v6 + v73), *(const void **)(v72 + 16), *(void *)(v72 + 8));
      v6 += v73 + *(void *)(v72 + 8);
      ++v71;
      v70 += 24;
    }
    while (v71 < *(unsigned int *)(a1 + 8));
  }
  return v6;
}

uint64_t sub_23984CAE0(uint64_t a1, unint64_t *a2, unsigned char *a3)
{
  uint64_t v6 = sub_23984FAB4(*(_DWORD *)(a1 + 8), a3);
  uint64_t v7 = v6;
  switch(*(_DWORD *)(a1 + 16))
  {
    case 0:
    case 0xD:
      unsigned int v9 = *(_DWORD *)a2;
      unint64_t v10 = &a3[v6];
      if ((*(_DWORD *)a2 & 0x80000000) == 0) {
        goto LABEL_11;
      }
      *unint64_t v10 = v9 | 0x80;
      int32x4_t v11 = vdupq_n_s32(v9);
      int32x4_t v12 = (int32x4_t)vshlq_u32((uint32x4_t)v11, (uint32x4_t)xmmword_23989E740);
      int16x8_t v13 = (int16x8_t)vshlq_s32(v11, (int32x4_t)xmmword_23989E740);
      v12.i32[3] = v13.i32[3];
      v13.i64[0] = *(void *)&vmovn_s32(v12) | 0x80008000800080;
      *(_DWORD *)(v10 + 1) = vmovn_s16(v13).u32[0];
      *(_DWORD *)(v10 + 5) = -1;
      v10[9] = 1;
      uint64_t v8 = 10;
      return v8 + v7;
    case 1:
      unint64_t v10 = &a3[v6];
      unsigned int v9 = (2 * *(_DWORD *)a2) ^ (*(int *)a2 >> 31);
      goto LABEL_11;
    case 2:
    case 7:
    case 0xA:
      *a3 |= 5u;
      *(_DWORD *)&a3[v6] = *(_DWORD *)a2;
      uint64_t v8 = 4;
      return v8 + v7;
    case 3:
    case 8:
      unint64_t v14 = *a2;
      unsigned int v15 = &a3[v7];
      goto LABEL_9;
    case 4:
      unsigned int v15 = &a3[v6];
      unint64_t v14 = (2 * *a2) ^ ((uint64_t)*a2 >> 63);
LABEL_9:
      uint64_t v8 = sub_23984FB48(v14, v15);
      return v8 + v7;
    case 5:
    case 9:
    case 0xB:
      *a3 |= 1u;
      *(void *)&a3[v6] = *a2;
      uint64_t v8 = 8;
      return v8 + v7;
    case 6:
      unsigned int v9 = *(_DWORD *)a2;
      unint64_t v10 = &a3[v6];
LABEL_11:
      if (v9 < 0x80)
      {
        unsigned int v17 = 0;
      }
      else
      {
        *unint64_t v10 = v9 | 0x80;
        unsigned int v16 = v9 >> 7;
        if (v9 < 0x4000)
        {
          unsigned int v17 = 1;
        }
        else
        {
          v10[1] = v16 | 0x80;
          unsigned int v16 = v9 >> 14;
          if (v9 < 0x200000)
          {
            unsigned int v17 = 2;
          }
          else
          {
            v10[2] = v16 | 0x80;
            unsigned int v16 = v9 >> 21;
            v9 >>= 28;
            if (v9)
            {
              v10[3] = v16 | 0x80;
              unsigned int v17 = 4;
              goto LABEL_51;
            }
            unsigned int v17 = 3;
          }
        }
        LOBYTE(v9) = v16;
      }
LABEL_51:
      uint64_t v8 = v17 + 1;
      v10[v17] = v9;
      return v8 + v7;
    case 0xC:
      a3[v6] = *(_DWORD *)a2 != 0;
      goto LABEL_34;
    case 0xE:
      *a3 |= 2u;
      double v18 = (const char *)*a2;
      uint64_t v19 = &a3[v6];
      if (!v18) {
        goto LABEL_33;
      }
      size_t v20 = strlen(v18);
      size_t v21 = v20;
      if (v20 < 0x80)
      {
        unsigned int v23 = 0;
        LOBYTE(v22) = v20;
      }
      else
      {
        unsigned char *v19 = v20 | 0x80;
        unsigned int v22 = v20 >> 7;
        if (v20 < 0x4000)
        {
          unsigned int v23 = 1;
        }
        else
        {
          v19[1] = v22 | 0x80;
          unsigned int v22 = v20 >> 14;
          if (v20 < 0x200000)
          {
            unsigned int v23 = 2;
          }
          else
          {
            v19[2] = v22 | 0x80;
            unsigned int v22 = v20 >> 21;
            if (v20 >> 28)
            {
              void v19[3] = v22 | 0x80;
              unsigned int v23 = 4;
              unsigned int v22 = v20 >> 28;
            }
            else
            {
              unsigned int v23 = 3;
            }
          }
        }
      }
      uint64_t v37 = v23 + 1;
      v19[v23] = v22;
      memcpy(&v19[v37], v18, v20);
      uint64_t v8 = v21 + v37;
      return v8 + v7;
    case 0xF:
      *a3 |= 2u;
      uint64_t v24 = &a3[v6];
      size_t v25 = *a2;
      if (*a2 < 0x80)
      {
        unsigned int v27 = 0;
        unint64_t v26 = *a2;
      }
      else
      {
        *uint64_t v24 = v25 | 0x80;
        LODWORD(v26) = v25 >> 7;
        if (v25 < 0x4000)
        {
          unsigned int v27 = 1;
        }
        else
        {
          v24[1] = v26 | 0x80;
          LODWORD(v26) = v25 >> 14;
          if (v25 < 0x200000)
          {
            unsigned int v27 = 2;
          }
          else
          {
            v24[2] = v26 | 0x80;
            LODWORD(v26) = v25 >> 21;
            if (v25 >> 28)
            {
              v24[3] = v26 | 0x80;
              unsigned int v27 = 4;
              LODWORD(v26) = v25 >> 28;
            }
            else
            {
              unsigned int v27 = 3;
            }
          }
        }
      }
      uint64_t v36 = v27 + 1;
      v24[v27] = v26;
      memcpy(&v24[v36], (const void *)a2[1], v25);
      uint64_t v8 = v25 + v36;
      return v8 + v7;
    case 0x10:
      *a3 |= 2u;
      uint64_t v19 = &a3[v6];
      if (*a2)
      {
        size_t v28 = sub_23984C3A0(*a2, v19 + 1);
        size_t v29 = v28;
        if (v28 >= 0x80)
        {
          uint64_t v32 = 2;
          uint64_t v33 = 3;
          unsigned int v34 = v28 >> 28;
          uint64_t v35 = 4;
          if (v28 >> 28) {
            uint64_t v35 = 5;
          }
          if (v28 >= 0x200000) {
            uint64_t v33 = v35;
          }
          if (v28 >= 0x4000) {
            uint64_t v32 = v33;
          }
          memmove(&v19[v32], v19 + 1, v28);
          unsigned char *v19 = v29 | 0x80;
          unsigned int v31 = v29 >> 7;
          if (v29 < 0x4000)
          {
            unsigned int v30 = 1;
          }
          else
          {
            v19[1] = v31 | 0x80;
            unsigned int v31 = v29 >> 14;
            if (v29 < 0x200000)
            {
              unsigned int v30 = 2;
            }
            else
            {
              v19[2] = v31 | 0x80;
              unsigned int v31 = v29 >> 21;
              if (v34)
              {
                void v19[3] = v31 | 0x80;
                unsigned int v30 = 4;
                unsigned int v31 = v29 >> 28;
              }
              else
              {
                unsigned int v30 = 3;
              }
            }
          }
        }
        else
        {
          unsigned int v30 = 0;
          LOBYTE(v31) = v28;
        }
        v19[v30] = v31;
        uint64_t v8 = v29 + v30 + 1;
      }
      else
      {
LABEL_33:
        unsigned char *v19 = 0;
LABEL_34:
        uint64_t v8 = 1;
      }
      return v8 + v7;
    default:
      sub_23989904C();
  }
}

uint64_t sub_23984CF58(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  unsigned int v2 = *(_DWORD **)a1;
  if (**(_DWORD **)a1 != 682290937) {
    sub_2398990FC();
  }
  if (v2[12])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *((void *)v2 + 7);
      uint64_t v8 = (_DWORD *)(v7 + 72 * v5);
      uint64_t v9 = v8[5];
      unint64_t v10 = (unint64_t *)(a1 + v8[6]);
      int v11 = v8[3];
      if (v11 == 1)
      {
        if ((*(unsigned char *)(v7 + 72 * v5 + 48) & 4) != 0)
        {
          if (*(_DWORD *)(a1 + v9) != *(_DWORD *)(v7 + 72 * v5 + 8)) {
            goto LABEL_28;
          }
          int v19 = *(_DWORD *)(v7 + 72 * v5 + 16);
          if (v19 != 16 && v19 != 14) {
            goto LABEL_6;
          }
        }
        else
        {
          int v13 = *(_DWORD *)(v7 + 72 * v5 + 16);
          if (v13 != 16 && v13 != 14)
          {
            if (!*(_DWORD *)(a1 + v9)) {
              goto LABEL_28;
            }
            goto LABEL_6;
          }
        }
        if (!*v10 || *v10 == *(void *)(v7 + 72 * v5 + 40)) {
          goto LABEL_28;
        }
      }
      else if (v11)
      {
        uint64_t v15 = *(void *)(a1 + v9);
        if (v15)
        {
          unsigned int v16 = (unint64_t *)*v10;
          if (*(unsigned char *)(v7 + 72 * v5 + 48))
          {
            uint64_t v21 = v7 + 72 * v5;
            uint64_t v22 = sub_23984FAB4(*(_DWORD *)(v21 + 8), v93);
            int v24 = *(_DWORD *)(v21 + 16);
            unsigned int v23 = (_DWORD *)(v21 + 16);
            uint64_t v25 = v15;
            unsigned int v26 = v15;
            switch(v24)
            {
              case 0:
              case 13:
                unsigned int v26 = 0;
                unsigned int v27 = (unsigned int *)v16;
                uint64_t v28 = v15;
                do
                {
                  unsigned int v30 = *v27++;
                  unsigned int v29 = v30;
                  if ((v30 & 0x80000000) != 0)
                  {
                    int v31 = 10;
                  }
                  else if (v29 >= 0x80)
                  {
                    if (v29 >> 28) {
                      int v32 = 5;
                    }
                    else {
                      int v32 = 4;
                    }
                    if (v29 < 0x200000) {
                      int v32 = 3;
                    }
                    if (v29 >= 0x4000) {
                      int v31 = v32;
                    }
                    else {
                      int v31 = 2;
                    }
                  }
                  else
                  {
                    int v31 = 1;
                  }
                  v26 += v31;
                  --v28;
                }
                while (v28);
                break;
              case 1:
                unsigned int v26 = 0;
                uint64_t v42 = (int *)v16;
                uint64_t v43 = v15;
                do
                {
                  int v44 = *v42++;
                  unsigned int v45 = (2 * v44) ^ (v44 >> 31);
                  if (v45 >= 0x80)
                  {
                    if (v45 >= 0x4000)
                    {
                      if (v45 >= 0x200000)
                      {
                        if (v45 >> 28) {
                          int v46 = 5;
                        }
                        else {
                          int v46 = 4;
                        }
                      }
                      else
                      {
                        int v46 = 3;
                      }
                    }
                    else
                    {
                      int v46 = 2;
                    }
                  }
                  else
                  {
                    int v46 = 1;
                  }
                  v26 += v46;
                  --v43;
                }
                while (v43);
                break;
              case 2:
              case 7:
              case 10:
                unsigned int v26 = 4 * v15;
                break;
              case 3:
              case 8:
                unsigned int v26 = 0;
                uint64_t v33 = v16;
                uint64_t v34 = v15;
                do
                {
                  unint64_t v36 = *v33++;
                  unint64_t v35 = v36;
                  if (HIDWORD(v36))
                  {
                    if (v35 >> 35)
                    {
                      unint64_t v39 = v35 >> 42;
                      unint64_t v40 = v35 >> 49;
                      unint64_t v41 = HIBYTE(v35);
                      if ((v35 & 0x8000000000000000) == 0) {
                        int v37 = 9;
                      }
                      else {
                        int v37 = 10;
                      }
                      if (!v41) {
                        int v37 = 8;
                      }
                      if (!v40) {
                        int v37 = 7;
                      }
                      if (!v39) {
                        int v37 = 6;
                      }
                    }
                    else
                    {
                      int v37 = 5;
                    }
                  }
                  else if (v35 >= 0x80)
                  {
                    if (v35 >> 28) {
                      int v38 = 5;
                    }
                    else {
                      int v38 = 4;
                    }
                    if (v35 < 0x200000) {
                      int v38 = 3;
                    }
                    if (v35 >= 0x4000) {
                      int v37 = v38;
                    }
                    else {
                      int v37 = 2;
                    }
                  }
                  else
                  {
                    int v37 = 1;
                  }
                  v26 += v37;
                  --v34;
                }
                while (v34);
                break;
              case 4:
                unsigned int v26 = 0;
                uint64_t v47 = (uint64_t *)v16;
                uint64_t v48 = v15;
                do
                {
                  uint64_t v49 = *v47++;
                  unint64_t v50 = (2 * v49) ^ (v49 >> 63);
                  if (HIDWORD(v50))
                  {
                    if (v50 >> 35)
                    {
                      if (v50 >> 42)
                      {
                        if (v50 >> 49)
                        {
                          if (HIBYTE(v50))
                          {
                            if ((v50 & 0x8000000000000000) == 0) {
                              int v51 = 9;
                            }
                            else {
                              int v51 = 10;
                            }
                          }
                          else
                          {
                            int v51 = 8;
                          }
                        }
                        else
                        {
                          int v51 = 7;
                        }
                      }
                      else
                      {
                        int v51 = 6;
                      }
                    }
                    else
                    {
                      int v51 = 5;
                    }
                  }
                  else if (v50 >= 0x80)
                  {
                    if (v50 >= 0x4000)
                    {
                      if (v50 >= 0x200000)
                      {
                        if (v50 >> 28) {
                          int v51 = 5;
                        }
                        else {
                          int v51 = 4;
                        }
                      }
                      else
                      {
                        int v51 = 3;
                      }
                    }
                    else
                    {
                      int v51 = 2;
                    }
                  }
                  else
                  {
                    int v51 = 1;
                  }
                  v26 += v51;
                  --v48;
                }
                while (v48);
                break;
              case 5:
              case 9:
              case 11:
                unsigned int v26 = 8 * v15;
                break;
              case 6:
                unsigned int v26 = 0;
                unsigned int v52 = (unsigned int *)v16;
                uint64_t v53 = v15;
                do
                {
                  unsigned int v55 = *v52++;
                  unsigned int v54 = v55;
                  if (v55 >= 0x80)
                  {
                    if (v54 >> 28) {
                      int v57 = 5;
                    }
                    else {
                      int v57 = 4;
                    }
                    if (v54 < 0x200000) {
                      int v57 = 3;
                    }
                    if (v54 >= 0x4000) {
                      int v56 = v57;
                    }
                    else {
                      int v56 = 2;
                    }
                  }
                  else
                  {
                    int v56 = 1;
                  }
                  v26 += v56;
                  --v53;
                }
                while (v53);
                break;
              case 12:
                break;
              default:
                sub_239899078();
            }
            v93[0] |= 2u;
            unsigned int v58 = &v93[v22];
            if (v26 < 0x80)
            {
              uint64_t v60 = 0;
              LOBYTE(v59) = v26;
            }
            else
            {
              *unsigned int v58 = v26 | 0x80;
              unsigned int v59 = v26 >> 7;
              if (v26 < 0x4000)
              {
                uint64_t v60 = 1;
              }
              else
              {
                v58[1] = v59 | 0x80;
                unsigned int v59 = v26 >> 14;
                if (v26 < 0x200000)
                {
                  uint64_t v60 = 2;
                }
                else
                {
                  v58[2] = v59 | 0x80;
                  unsigned int v59 = v26 >> 21;
                  if (v26 >> 28)
                  {
                    v58[3] = v59 | 0x80;
                    unsigned int v59 = v26 >> 28;
                    uint64_t v60 = 4;
                  }
                  else
                  {
                    uint64_t v60 = 3;
                  }
                }
              }
            }
            v58[v60] = v59;
            uint64_t v61 = v60 + v22 + 1;
            (*a2)(a2, v61, v93);
            char v62 = 2;
            switch(*v23)
            {
              case 0:
              case 0xD:
                uint64_t v63 = 0;
                do
                {
                  unsigned int v65 = *(_DWORD *)v16;
                  unsigned int v16 = (unint64_t *)((char *)v16 + 4);
                  unsigned int v64 = v65;
                  if ((v65 & 0x80000000) != 0)
                  {
                    int32x4_t v68 = vdupq_n_s32(v64);
                    char v94 = v64 | 0x80;
                    int32x4_t v69 = (int32x4_t)vshlq_u32((uint32x4_t)v68, (uint32x4_t)xmmword_23989E740);
                    int16x8_t v70 = (int16x8_t)vshlq_s32(v68, (int32x4_t)xmmword_23989E740);
                    v69.i32[3] = v70.i32[3];
                    v70.i64[0] = *(void *)&vmovn_s32(v69) | 0x80008000800080;
                    unsigned __int32 v95 = vmovn_s16(v70).u32[0];
                    int v96 = -1;
                    char v97 = 1;
                    uint64_t v71 = 10;
                  }
                  else
                  {
                    if (v64 < 0x80)
                    {
                      uint64_t v67 = 0;
                    }
                    else
                    {
                      char v94 = v64 | 0x80;
                      if (v64 < 0x4000)
                      {
                        v64 >>= 7;
                        uint64_t v67 = 1;
                      }
                      else
                      {
                        LOBYTE(v95) = (v64 >> 7) | 0x80;
                        if (v64 < 0x200000)
                        {
                          v64 >>= 14;
                          uint64_t v67 = 2;
                        }
                        else
                        {
                          BYTE1(v95) = (v64 >> 14) | 0x80;
                          unsigned int v66 = v64 >> 21;
                          v64 >>= 28;
                          if (v64)
                          {
                            BYTE2(v95) = v66 | 0x80;
                            uint64_t v67 = 4;
                          }
                          else
                          {
                            LOBYTE(v64) = v66;
                            uint64_t v67 = 3;
                          }
                        }
                      }
                    }
                    uint64_t v71 = v67 + 1;
                    *(&v94 + v67) = v64;
                  }
                  (*a2)(a2, v71, &v94);
                  v63 += v71;
                  --v25;
                }
                while (v25);
                break;
              case 1:
                uint64_t v63 = 0;
                do
                {
                  int v74 = *(_DWORD *)v16;
                  unsigned int v16 = (unint64_t *)((char *)v16 + 4);
                  unsigned int v75 = (2 * v74) ^ (v74 >> 31);
                  if (v75 < 0x80)
                  {
                    uint64_t v77 = 0;
                  }
                  else
                  {
                    char v94 = v75 | 0x80;
                    if (v75 < 0x4000)
                    {
                      v75 >>= 7;
                      uint64_t v77 = 1;
                    }
                    else
                    {
                      LOBYTE(v95) = (v75 >> 7) | 0x80;
                      if (v75 < 0x200000)
                      {
                        v75 >>= 14;
                        uint64_t v77 = 2;
                      }
                      else
                      {
                        BYTE1(v95) = (v75 >> 14) | 0x80;
                        unsigned int v76 = v75 >> 21;
                        v75 >>= 28;
                        if (v75)
                        {
                          BYTE2(v95) = v76 | 0x80;
                          uint64_t v77 = 4;
                        }
                        else
                        {
                          LOBYTE(v75) = v76;
                          uint64_t v77 = 3;
                        }
                      }
                    }
                  }
                  uint64_t v78 = v77 + 1;
                  *(&v94 + v77) = v75;
                  (*a2)(a2, v77 + 1, &v94);
                  v63 += v78;
                  --v25;
                }
                while (v25);
                break;
              case 2:
              case 7:
              case 0xA:
                goto LABEL_131;
              case 3:
              case 8:
                uint64_t v63 = 0;
                do
                {
                  unint64_t v72 = *v16++;
                  unsigned int v73 = sub_23984FB48(v72, &v94);
                  (*a2)(a2, v73, &v94);
                  v63 += v73;
                  --v25;
                }
                while (v25);
                break;
              case 4:
                uint64_t v63 = 0;
                do
                {
                  uint64_t v79 = *v16++;
                  unsigned int v80 = sub_23984FB48((2 * v79) ^ (v79 >> 63), &v94);
                  (*a2)(a2, v80, &v94);
                  v63 += v80;
                  --v25;
                }
                while (v25);
                break;
              case 5:
              case 9:
              case 0xB:
                char v62 = 3;
LABEL_131:
                uint64_t v63 = (v15 << v62);
                (*a2)(a2, v63, v16);
                break;
              case 6:
                uint64_t v63 = 0;
                do
                {
                  unsigned int v82 = *(_DWORD *)v16;
                  unsigned int v16 = (unint64_t *)((char *)v16 + 4);
                  unsigned int v81 = v82;
                  if (v82 < 0x80)
                  {
                    uint64_t v84 = 0;
                  }
                  else
                  {
                    char v94 = v81 | 0x80;
                    if (v81 < 0x4000)
                    {
                      v81 >>= 7;
                      uint64_t v84 = 1;
                    }
                    else
                    {
                      LOBYTE(v95) = (v81 >> 7) | 0x80;
                      if (v81 < 0x200000)
                      {
                        v81 >>= 14;
                        uint64_t v84 = 2;
                      }
                      else
                      {
                        BYTE1(v95) = (v81 >> 14) | 0x80;
                        unsigned int v83 = v81 >> 21;
                        v81 >>= 28;
                        if (v81)
                        {
                          BYTE2(v95) = v83 | 0x80;
                          uint64_t v84 = 4;
                        }
                        else
                        {
                          LOBYTE(v81) = v83;
                          uint64_t v84 = 3;
                        }
                      }
                    }
                  }
                  uint64_t v85 = v84 + 1;
                  *(&v94 + v84) = v81;
                  (*a2)(a2, v84 + 1, &v94);
                  v63 += v85;
                  --v25;
                }
                while (v25);
                break;
              case 0xC:
                uint64_t v86 = v15;
                do
                {
                  int v87 = *(_DWORD *)v16;
                  unsigned int v16 = (unint64_t *)((char *)v16 + 4);
                  char v94 = v87 != 0;
                  (*a2)(a2, 1, &v94);
                  --v86;
                }
                while (v86);
                uint64_t v63 = v15;
                break;
              default:
                sub_2398990A4();
            }
            if (v63 != v26) {
              sub_2398990D0();
            }
            uint64_t v12 = v61 + v26;
          }
          else
          {
            uint64_t v17 = *(int *)(v7 + 72 * v5 + 16);
            if (v17 >= 0x11) {
              sub_239898F9C();
            }
            LODWORD(v12) = 0;
            uint64_t v18 = qword_23989E788[v17];
            do
            {
              uint64_t v12 = v12 + sub_23984D91C((uint64_t)v8, v16, a2);
              unsigned int v16 = (unint64_t *)((char *)v16 + v18);
              LODWORD(v15) = v15 - 1;
            }
            while (v15);
          }
          goto LABEL_182;
        }
LABEL_28:
        uint64_t v12 = 0;
        goto LABEL_182;
      }
LABEL_6:
      uint64_t v12 = sub_23984D91C((uint64_t)v8, v10, a2);
LABEL_182:
      v6 += v12;
      ++v5;
      unsigned int v2 = *(_DWORD **)a1;
      if (v5 >= *(unsigned int *)(*(void *)a1 + 48)) {
        goto LABEL_185;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_185:
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v88 = 0;
    unint64_t v89 = 0;
    do
    {
      uint64_t v90 = *(void *)(a1 + 16) + v88;
      uint64_t v91 = sub_23984FAB4(*(_DWORD *)v90, v93);
      v93[0] |= *(unsigned char *)(v90 + 4);
      (*a2)(a2, v91, v93);
      (*a2)(a2, *(void *)(v90 + 8), *(void *)(v90 + 16));
      v6 += v91 + *(void *)(v90 + 8);
      ++v89;
      v88 += 24;
    }
    while (v89 < *(unsigned int *)(a1 + 8));
  }
  return v6;
}

uint64_t sub_23984D91C(uint64_t a1, unint64_t *a2, void (**a3)(void, void, void))
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_23984FAB4(*(_DWORD *)(a1 + 8), v50);
  uint64_t v7 = v6;
  switch(*(_DWORD *)(a1 + 16))
  {
    case 0:
    case 0xD:
      unsigned int v9 = *(_DWORD *)a2;
      unint64_t v10 = &v50[v6];
      if ((*(_DWORD *)a2 & 0x80000000) != 0)
      {
        *unint64_t v10 = v9 | 0x80;
        int32x4_t v36 = vdupq_n_s32(v9);
        int32x4_t v37 = (int32x4_t)vshlq_u32((uint32x4_t)v36, (uint32x4_t)xmmword_23989E740);
        int16x8_t v38 = (int16x8_t)vshlq_s32(v36, (int32x4_t)xmmword_23989E740);
        v37.i32[3] = v38.i32[3];
        v38.i64[0] = *(void *)&vmovn_s32(v37) | 0x80008000800080;
        *(_DWORD *)(v10 + 1) = vmovn_s16(v38).u32[0];
        *(_DWORD *)(v10 + 5) = -1;
        v10[9] = 1;
        uint64_t v39 = 10;
        goto LABEL_60;
      }
      if (v9 < 0x80)
      {
        unsigned int v12 = 0;
      }
      else
      {
        *unint64_t v10 = v9 | 0x80;
        unsigned int v11 = v9 >> 7;
        if (v9 < 0x4000)
        {
          unsigned int v12 = 1;
        }
        else
        {
          v10[1] = v11 | 0x80;
          unsigned int v11 = v9 >> 14;
          if (v9 < 0x200000)
          {
            unsigned int v12 = 2;
          }
          else
          {
            v10[2] = v11 | 0x80;
            unsigned int v11 = v9 >> 21;
            v9 >>= 28;
            if (v9)
            {
              v10[3] = v11 | 0x80;
              unsigned int v12 = 4;
              goto LABEL_59;
            }
            unsigned int v12 = 3;
          }
        }
        LOBYTE(v9) = v11;
      }
LABEL_59:
      uint64_t v39 = v12 + 1;
      v10[v12] = v9;
LABEL_60:
      uint64_t v8 = v39 + v6;
      goto LABEL_61;
    case 1:
      uint64_t v15 = &v50[v6];
      unsigned int v16 = (2 * *(_DWORD *)a2) ^ (*(int *)a2 >> 31);
      goto LABEL_15;
    case 2:
    case 7:
    case 0xA:
      v50[0] |= 5u;
      *(_DWORD *)&v50[v6] = *(_DWORD *)a2;
      uint64_t v8 = v6 + 4;
      goto LABEL_61;
    case 3:
    case 8:
      unint64_t v13 = *a2;
      unint64_t v14 = &v50[v7];
      goto LABEL_13;
    case 4:
      unint64_t v14 = &v50[v6];
      unint64_t v13 = (2 * *a2) ^ ((uint64_t)*a2 >> 63);
LABEL_13:
      uint64_t v8 = sub_23984FB48(v13, v14) + v7;
      goto LABEL_61;
    case 5:
    case 9:
    case 0xB:
      v50[0] |= 1u;
      *(void *)&v50[v6] = *a2;
      uint64_t v8 = v6 + 8;
      goto LABEL_61;
    case 6:
      unsigned int v16 = *(_DWORD *)a2;
      uint64_t v15 = &v50[v6];
LABEL_15:
      if (v16 < 0x80)
      {
        unsigned int v18 = 0;
      }
      else
      {
        *uint64_t v15 = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        if (v16 < 0x4000)
        {
          unsigned int v18 = 1;
        }
        else
        {
          v15[1] = v17 | 0x80;
          unsigned int v17 = v16 >> 14;
          if (v16 < 0x200000)
          {
            unsigned int v18 = 2;
          }
          else
          {
            v15[2] = v17 | 0x80;
            unsigned int v17 = v16 >> 21;
            v16 >>= 28;
            if (v16)
            {
              v15[3] = v17 | 0x80;
              unsigned int v18 = 4;
              goto LABEL_55;
            }
            unsigned int v18 = 3;
          }
        }
        LOBYTE(v16) = v17;
      }
LABEL_55:
      v15[v18] = v16;
      uint64_t v8 = v6 + v18 + 1;
LABEL_61:
      (*a3)(a3, v8, v50);
      return v8;
    case 0xC:
      v50[v6] = *(_DWORD *)a2 != 0;
      uint64_t v8 = v6 + 1;
      goto LABEL_61;
    case 0xE:
      int v19 = (const char *)*a2;
      if (v19)
      {
        size_t v20 = strlen(v19);
        size_t v21 = v20;
        v50[0] |= 2u;
        LOBYTE(v22) = v20;
        if (v20 < 0x80)
        {
          unsigned int v25 = 0;
        }
        else
        {
          unsigned int v23 = &v50[v7];
          v50[v7] = v20 | 0x80;
          unsigned int v24 = v20 >> 7;
          if (v20 < 0x4000)
          {
            unsigned int v25 = 1;
          }
          else
          {
            v23[1] = v24 | 0x80;
            unsigned int v24 = v20 >> 14;
            if (v20 < 0x200000)
            {
              unsigned int v25 = 2;
            }
            else
            {
              v23[2] = v24 | 0x80;
              unsigned int v24 = v20 >> 21;
              unsigned int v22 = v20 >> 28;
              if (v20 >> 28)
              {
                v23[3] = v24 | 0x80;
                unsigned int v25 = 4;
                goto LABEL_69;
              }
              unsigned int v25 = 3;
            }
          }
          LOBYTE(v22) = v24;
        }
      }
      else
      {
        size_t v21 = 0;
        LOBYTE(v22) = 0;
        unsigned int v25 = 0;
        v50[0] |= 2u;
      }
LABEL_69:
      v50[v7 + v25] = v22;
      uint64_t v41 = v7 + v25 + 1;
      (*a3)(a3, v41, v50);
      (*a3)(a3, v21, v19);
      return v41 + v21;
    case 0xF:
      size_t v21 = *a2;
      v50[0] |= 2u;
      unsigned int v26 = &v50[v6];
      if (v21 < 0x80)
      {
        unsigned int v28 = 0;
        LOBYTE(v27) = v21;
      }
      else
      {
        *unsigned int v26 = v21 | 0x80;
        unsigned int v27 = v21 >> 7;
        if (v21 < 0x4000)
        {
          unsigned int v28 = 1;
        }
        else
        {
          v26[1] = v27 | 0x80;
          unsigned int v27 = v21 >> 14;
          if (v21 < 0x200000)
          {
            unsigned int v28 = 2;
          }
          else
          {
            v26[2] = v27 | 0x80;
            unsigned int v27 = v21 >> 21;
            if (v21 >> 28)
            {
              v26[3] = v27 | 0x80;
              unsigned int v28 = 4;
              unsigned int v27 = v21 >> 28;
            }
            else
            {
              unsigned int v28 = 3;
            }
          }
        }
      }
      v26[v28] = v27;
      uint64_t v41 = v6 + v28 + 1;
      (*a3)(a3, v41, v50);
      (*a3)(a3, v21, a2[1]);
      return v41 + v21;
    case 0x10:
      unint64_t v29 = *a2;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      int v44 = sub_23984B8C0;
      long long v45 = xmmword_23989E750;
      int v46 = &v49;
      v50[0] |= 2u;
      if (!v29)
      {
        uint64_t v31 = 0;
        LOBYTE(v32) = 0;
        goto LABEL_45;
      }
      uint64_t v30 = sub_23984CF58(v29, &v44);
      uint64_t v31 = v30;
      LOBYTE(v32) = v30;
      if (v30 < 0x80)
      {
LABEL_45:
        unsigned int v35 = 0;
        goto LABEL_73;
      }
      uint64_t v33 = &v50[v7];
      v50[v7] = v30 | 0x80;
      unsigned int v34 = v30 >> 7;
      if (v30 < 0x4000)
      {
        unsigned int v35 = 1;
      }
      else
      {
        v33[1] = v34 | 0x80;
        unsigned int v34 = v30 >> 14;
        if (v30 < 0x200000)
        {
          unsigned int v35 = 2;
        }
        else
        {
          v33[2] = v34 | 0x80;
          unsigned int v34 = v30 >> 21;
          unsigned int v32 = v30 >> 28;
          if (v30 >> 28)
          {
            v33[3] = v34 | 0x80;
            unsigned int v35 = 4;
            goto LABEL_73;
          }
          unsigned int v35 = 3;
        }
      }
      LOBYTE(v32) = v34;
LABEL_73:
      v50[v7 + v35] = v32;
      uint64_t v42 = v7 + v35 + 1;
      (*a3)(a3, v42, v50);
      (*a3)(a3, v31, v46);
      uint64_t v8 = v42 + v31;
      if (v47)
      {
        if (v48) {
          (*(void (**)(uint64_t, void *, uint64_t))(v48 + 8))(v48, v46, v43);
        }
        else {
          free(v46);
        }
      }
      return v8;
    default:
      sub_239899128();
  }
}

void *sub_23984DF34(uint64_t a1, uint64_t (**a2)(int, size_t size), unint64_t a3, char *a4)
{
  uint64_t v194 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 56);
  long long v192 = 0u;
  long long v191 = 0u;
  long long v190 = 0u;
  long long v189 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v182 = 0u;
  if (*(_DWORD *)a1 != 682290937) {
    sub_2398991D8();
  }
  if (a2) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v8 = &off_26B8786E0;
  }
  uint64_t v9 = (*v8)((int)v8[2], *(void *)(a1 + 40));
  if (!v9) {
    return 0;
  }
  unint64_t v10 = (void *)v9;
  v181 = &v193;
  unsigned int v11 = *(_DWORD *)(a1 + 48) + 7;
  if (v11 >= 0x88)
  {
    v178 = (unsigned char *)(*v8)((int)v8[2], v11 >> 3);
    if (!v178)
    {
      v178 = v10;
      goto LABEL_118;
    }
    bzero(v178, v11 >> 3);
  }
  else
  {
    v178 = v180;
    bzero(v180, v11 >> 3);
  }
  unint64_t v13 = *(void (**)(void *))(a1 + 88);
  if (v13)
  {
    v13(v10);
  }
  else
  {
    bzero(v10, *(void *)(a1 + 40));
    *unint64_t v10 = a1;
    if (*(_DWORD *)(a1 + 48))
    {
      uint64_t v56 = 0;
      unint64_t v57 = 0;
      do
      {
        uint64_t v58 = *(void *)(a1 + 56);
        unsigned int v59 = *(_DWORD **)(v58 + v56 + 40);
        if (v59 && *(_DWORD *)(v58 + v56 + 12) != 2)
        {
          uint64_t v60 = v58 + v56;
          int v61 = *(_DWORD *)(v60 + 16);
          char v62 = (_DWORD *)((char *)v10 + *(unsigned int *)(v60 + 24));
          switch(v61)
          {
            case 0:
            case 1:
            case 2:
            case 6:
            case 7:
            case 10:
            case 12:
            case 13:
              _DWORD *v62 = *v59;
              break;
            case 3:
            case 4:
            case 5:
            case 8:
            case 9:
            case 11:
              unsigned int v59 = *(_DWORD **)v59;
              goto LABEL_113;
            case 14:
            case 16:
LABEL_113:
              *(void *)char v62 = v59;
              break;
            case 15:
              *(_OWORD *)char v62 = *(_OWORD *)v59;
              break;
            default:
              break;
          }
        }
        ++v57;
        v56 += 72;
      }
      while (v57 < *(unsigned int *)(a1 + 48));
    }
  }
  unsigned int v179 = 0;
  unsigned int v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  v177 = v10;
  while (a3)
  {
    if (a3 >= 5) {
      unint64_t v17 = 5;
    }
    else {
      unint64_t v17 = a3;
    }
    unsigned int v18 = *a4;
    int v19 = (v18 >> 3) & 0xF;
    if ((v18 & 0x80000000) != 0)
    {
      if (v17 < 2) {
        goto LABEL_308;
      }
      char v21 = 4;
      uint64_t v22 = 1;
      while (1)
      {
        int v23 = a4[v22];
        if ((a4[v22] & 0x80000000) == 0) {
          break;
        }
        v19 |= (v23 & 0x7F) << v21;
        v21 += 7;
        if (v17 == ++v22) {
          goto LABEL_308;
        }
      }
      v19 |= v23 << v21;
      uint64_t v20 = v22 + 1;
      if (!v4) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v20 = 1;
      if (!v4) {
        goto LABEL_31;
      }
    }
    if (*(_DWORD *)(v4 + 8) == v19)
    {
      uint64_t v24 = v4;
      uint64_t v25 = v16;
LABEL_29:
      char v26 = 0;
      if (!*(_DWORD *)(v24 + 12)) {
        v178[(unint64_t)v25 >> 3] |= 1 << (v25 & 7);
      }
      uint64_t v16 = v25;
      uint64_t v4 = v24;
      goto LABEL_50;
    }
LABEL_31:
    unsigned int v27 = *(_DWORD *)(a1 + 72);
    if (!v27) {
      goto LABEL_49;
    }
    uint64_t v28 = *(void *)(a1 + 80);
    if (v27 != 1)
    {
      unsigned int v29 = 0;
      while (1)
      {
        uint64_t v30 = v29 + (v27 >> 1);
        int v31 = *(_DWORD *)(v28 + 8 * v30);
        if (v19 >= v31)
        {
          int v32 = *(_DWORD *)(v28 + 8 * v30 + 4);
          if (*(_DWORD *)(v28 + 8 * (v30 + 1) + 4) + v31 - v32 > v19)
          {
            uint64_t v25 = (v19 - v31 + v32);
            if ((v25 & 0x80000000) == 0) {
              goto LABEL_44;
            }
            goto LABEL_49;
          }
          v27 += v29 + ~v30;
          unsigned int v29 = v30 + 1;
        }
        else
        {
          v27 >>= 1;
        }
        if (v27 <= 1)
        {
          if (!v27) {
            goto LABEL_49;
          }
          goto LABEL_41;
        }
      }
    }
    unsigned int v29 = 0;
LABEL_41:
    uint64_t v33 = (int *)(v28 + 8 * v29);
    int v34 = *v33;
    if (*v33 > v19
      || (int v35 = v33[1], v34 - v35 + *(_DWORD *)(v28 + 8 * (v29 + 1) + 4) <= v19)
      || (uint64_t v25 = (v35 + v19 - v34), (v25 & 0x80000000) != 0))
    {
LABEL_49:
      uint64_t v24 = 0;
      ++v15;
      char v26 = 1;
    }
    else
    {
LABEL_44:
      uint64_t v36 = *(void *)(a1 + 56);
      if (v36)
      {
        uint64_t v24 = v36 + 72 * v25;
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      uint64_t v4 = 0;
      char v26 = 1;
      uint64_t v16 = v25;
    }
LABEL_50:
    int v37 = v18 & 7;
    int16x8_t v38 = &a4[v20];
    unint64_t v39 = a3 - v20;
    switch(v18 & 7)
    {
      case 0u:
        int v40 = 10;
        if (v39 < 0xA) {
          int v40 = v39;
        }
        if (v40)
        {
          uint64_t v41 = 0;
          while (v38[v41] < 0)
          {
            if (v40 == ++v41) {
              goto LABEL_308;
            }
          }
        }
        else
        {
          LODWORD(v41) = 0;
        }
        if (v41 == v40) {
          goto LABEL_308;
        }
        uint64_t v42 = 0;
        LODWORD(v43) = v41 + 1;
        goto LABEL_81;
      case 1u:
        if (v39 < 8) {
          goto LABEL_308;
        }
        uint64_t v42 = 0;
        LODWORD(v43) = 8;
        goto LABEL_81;
      case 2u:
        if (v39 >= 5) {
          uint64_t v44 = 5;
        }
        else {
          uint64_t v44 = v39;
        }
        if (v44)
        {
          uint64_t v45 = 0;
          char v46 = 0;
          int v47 = 0;
          while (1)
          {
            v47 |= (v38[v45] & 0x7F) << v46;
            if ((v38[v45] & 0x80) == 0) {
              break;
            }
            v46 += 7;
            if (v44 == ++v45) {
              goto LABEL_308;
            }
          }
        }
        else
        {
          LODWORD(v45) = 0;
          int v47 = 0;
        }
        if (v45 == v44) {
          goto LABEL_308;
        }
        unint64_t v43 = (v47 + v45 + 1);
        BOOL v48 = v43 && v39 >= v43;
        if (!v48) {
          goto LABEL_308;
        }
        uint64_t v42 = (v45 + 1);
LABEL_81:
        if (1 << (v179 + 4) == v14)
        {
          if (v179 == 22)
          {
            unsigned int v179 = 22;
LABEL_308:
            ((void (*)(uint64_t (*)(int, size_t), void *, uint64_t, uint64_t, uint64_t, uint64_t, char **, uint64_t))v8[1])(v8[2], v10, v15, 5, 1, 32, &v181, v16);
            if (v179)
            {
              for (unsigned int i = 1; i <= v179; ++i)
              {
                if ((&v181)[i]) {
                  ((void (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
                }
              }
            }
            unsigned int v12 = 0;
            if (v11 < 0x88) {
              return v12;
            }
            goto LABEL_314;
          }
          uint64_t v169 = v42;
          uint64_t v171 = v24;
          unsigned int v173 = v16;
          uint64_t v175 = v15;
          uint64_t v49 = (*v8)((int)v8[2], 32 << (v179 + 5));
          (&v181)[v179 + 1] = (char *)v49;
          unsigned int v14 = 0;
          if (!v49)
          {
            ++v179;
            uint64_t v15 = v175;
            unint64_t v10 = v177;
            uint64_t v16 = v173;
            goto LABEL_308;
          }
          ++v179;
          uint64_t v15 = v175;
          unint64_t v10 = v177;
          uint64_t v16 = v173;
          uint64_t v24 = v171;
          uint64_t v42 = v169;
        }
        else
        {
          uint64_t v49 = (uint64_t)(&v181)[v179];
        }
        uint64_t v50 = v49 + 32 * v14;
        *(_DWORD *)uint64_t v50 = v19;
        *(unsigned char *)(v50 + 4) = v37;
        *(unsigned char *)(v50 + 5) = v42;
        *(_WORD *)(v50 + 6) = 0;
        *(void *)(v50 + 8) = v24;
        *(void *)(v50 + 16) = v43;
        *(void *)(v50 + 24) = v38;
        if ((v26 & 1) == 0 && *(_DWORD *)(v24 + 12) == 2)
        {
          if (v37 == 2
            && ((int v51 = *(_DWORD *)(v24 + 16), (*(unsigned char *)(v24 + 48) & 1) != 0) || (v51 - 14) >= 3))
          {
            unint64_t v52 = v43 - v42;
            switch(v51)
            {
              case 0:
              case 1:
              case 3:
              case 4:
              case 6:
              case 8:
              case 13:
                if (v52)
                {
                  unint64_t v52 = 0;
                  uint64_t v53 = &v38[v42];
                  uint64_t v54 = v42 - v43;
                  do
                  {
                    unsigned int v55 = *v53++;
                    v52 += (v55 >> 7) ^ 1;
                    BOOL v48 = __CFADD__(v54++, 1);
                  }
                  while (!v48);
                }
                break;
              case 2:
              case 7:
              case 10:
                if ((v52 & 3) != 0) {
                  goto LABEL_308;
                }
                v52 >>= 2;
                break;
              case 5:
              case 9:
              case 11:
                if ((v52 & 7) != 0) {
                  goto LABEL_308;
                }
                v52 >>= 3;
                break;
              case 12:
                break;
              default:
                goto LABEL_308;
            }
          }
          else
          {
            unint64_t v52 = 1;
          }
          *(void *)((char *)v10 + *(unsigned int *)(v24 + 20)) += v52;
        }
        ++v14;
        a4 = &v38[v43];
        a3 = v39 - v43;
        break;
      case 5u:
        if (v39 < 4) {
          goto LABEL_308;
        }
        uint64_t v42 = 0;
        LODWORD(v43) = 4;
        goto LABEL_81;
      default:
        goto LABEL_308;
    }
  }
  unsigned int v172 = v11;
  unint64_t v63 = *(unsigned int *)(a1 + 48);
  unsigned int v64 = v14;
  if (!v63)
  {
LABEL_131:
    if (v15)
    {
      uint64_t v75 = (*v8)((int)v8[2], 24 * v15);
      unsigned int v14 = v64;
      v177[2] = v75;
      if (!v75) {
        goto LABEL_328;
      }
    }
    int v76 = 0;
    unsigned int v77 = v14;
    unsigned int v78 = v179;
    unsigned int v170 = v14;
    while (1)
    {
      uint64_t v79 = 1 << (v76 + 4);
      int v174 = v76;
      if (v76 == v78) {
        LODWORD(v79) = v77;
      }
      uint64_t v176 = v79;
      if (v79) {
        break;
      }
LABEL_299:
      int v76 = v174 + 1;
      unsigned int v78 = v179;
      unsigned int v77 = v170;
      if (v174 + 1 > v179)
      {
        unsigned int v12 = v177;
        if (v179)
        {
          for (unsigned int j = 1; j <= v179; ++j)
          {
            if ((&v181)[j]) {
              ((void (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
            }
          }
        }
        if (v172 < 0x88) {
          return v12;
        }
LABEL_314:
        if (!v178) {
          return v12;
        }
LABEL_315:
        v8[1]((int)v8[2], (size_t)v178);
        return v12;
      }
    }
    uint64_t v80 = 0;
    unsigned int v81 = (&v181)[v76];
    while (1)
    {
      unsigned int v82 = &v81[32 * v80];
      uint64_t v83 = *((void *)v82 + 1);
      if (!v83)
      {
        uint64_t v87 = v177[2];
        unsigned int v88 = *((_DWORD *)v177 + 2);
        *((_DWORD *)v177 + 2) = v88 + 1;
        uint64_t v89 = v87 + 24 * v88;
        *(_DWORD *)uint64_t v89 = *(_DWORD *)v82;
        *(_DWORD *)(v89 + 4) = v82[4];
        *(void *)(v89 + 8) = *((void *)v82 + 2);
        uint64_t v90 = (void *)((uint64_t (*)(uint64_t (*)(int, size_t)))*v8)(v8[2]);
        *(void *)(v89 + 16) = v90;
        if (!v90) {
          goto LABEL_328;
        }
        memcpy(v90, *(const void **)&v81[32 * v80 + 24], *(void *)(v89 + 8));
        goto LABEL_234;
      }
      uint64_t v84 = (void *)((char *)v177 + *(unsigned int *)(v83 + 24));
      int v85 = *(_DWORD *)(v83 + 12);
      if (!v85)
      {
        if (!sub_23984FC58((uint64_t)&v81[32 * v80], (void *)((char *)v177 + *(unsigned int *)(v83 + 24)), (uint64_t)v8, 1))goto LABEL_328; {
        goto LABEL_234;
        }
      }
      if (v85 == 2) {
        break;
      }
      if (v85 != 1) {
        sub_239899154();
      }
      if ((*(unsigned char *)(v83 + 48) & 4) != 0)
      {
        uint64_t v105 = *(unsigned int *)(v83 + 20);
        int v106 = *(_DWORD *)((char *)v177 + v105);
        if (!v106) {
          goto LABEL_232;
        }
        uint64_t v107 = *v177;
        unsigned int v108 = *(_DWORD *)(*v177 + 72);
        if (!v108) {
          goto LABEL_175;
        }
        uint64_t v109 = *(void *)(v107 + 80);
        if (v108 == 1)
        {
          unsigned int v110 = 0;
        }
        else
        {
          unsigned int v110 = 0;
          do
          {
            uint64_t v111 = v110 + (v108 >> 1);
            int v112 = *(_DWORD *)(v109 + 8 * v111);
            if (v106 >= v112)
            {
              int v113 = *(_DWORD *)(v109 + 8 * v111 + 4);
              if (*(_DWORD *)(v109 + 8 * (v111 + 1) + 4) + v112 - v113 > v106)
              {
                int v116 = v106 - v112 + v113;
                goto LABEL_215;
              }
              v108 += v110 + ~v111;
              unsigned int v110 = v111 + 1;
            }
            else
            {
              v108 >>= 1;
            }
          }
          while (v108 > 1);
          if (!v108) {
            goto LABEL_175;
          }
        }
        double v114 = (int *)(v109 + 8 * v110);
        int v115 = *v114;
        if (*v114 <= v106)
        {
          int v117 = v114[1];
          int v118 = v115 - v117 + *(_DWORD *)(v109 + 8 * (v110 + 1) + 4);
          int v119 = v117 + v106 - v115;
          if (v118 > v106) {
            int v116 = v119;
          }
          else {
            int v116 = -1;
          }
        }
        else
        {
LABEL_175:
          int v116 = -1;
        }
LABEL_215:
        uint64_t v130 = *(void *)(v107 + 56);
        int v131 = v116;
        uint64_t v132 = v130 + 72 * v116;
        unsigned int v135 = *(_DWORD *)(v132 + 16);
        long long v134 = (unsigned int *)(v132 + 16);
        unsigned int v133 = v135;
        if (v135 == 16)
        {
          uint64_t v138 = (void *)*v84;
          if (!*v84) {
            goto LABEL_236;
          }
          if (v138 != *(void **)(v130 + 72 * v131 + 40)) {
            sub_23984F10C(v138, v8);
          }
        }
        else
        {
          if (v133 != 15)
          {
            if (v133 == 14)
            {
              long long v136 = (void *)*v84;
              if (*v84)
              {
                v137 = *(void **)(v130 + 72 * v131 + 40);
                goto LABEL_226;
              }
LABEL_236:
              size_t v140 = 8;
LABEL_231:
              bzero(v84, v140);
LABEL_232:
              if (!sub_23984FC58((uint64_t)&v81[32 * v80], v84, (uint64_t)v8, 1)) {
                goto LABEL_328;
              }
              *(_DWORD *)((char *)v177 + v105) = *(_DWORD *)v82;
              goto LABEL_234;
            }
LABEL_229:
            if (v133 >= 0x11) {
              sub_239898F9C();
            }
            size_t v140 = qword_23989E788[v133];
            goto LABEL_231;
          }
          long long v136 = (void *)v84[1];
          if (v136)
          {
            uint64_t v139 = *(void *)(v130 + 72 * v131 + 40);
            if (!v139) {
              goto LABEL_227;
            }
            v137 = *(void **)(v139 + 8);
LABEL_226:
            if (v136 != v137) {
LABEL_227:
            }
              ((void (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
          }
        }
        unsigned int v133 = *v134;
        goto LABEL_229;
      }
      if (!sub_23984FC58((uint64_t)&v81[32 * v80], (void *)((char *)v177 + *(unsigned int *)(v83 + 24)), (uint64_t)v8, 1))goto LABEL_328; {
      uint64_t v86 = *(unsigned int *)(*((void *)v82 + 1) + 20);
      }
      if (v86) {
        *(_DWORD *)((char *)v177 + v86) = 1;
      }
LABEL_234:
      if (++v80 == v176) {
        goto LABEL_299;
      }
    }
    if (v81[32 * v80 + 4] == 2)
    {
      unsigned int v91 = *(_DWORD *)(v83 + 16);
      if ((*(unsigned char *)(v83 + 48) & 1) != 0 || v91 - 14 >= 3)
      {
        uint64_t v92 = *(unsigned int *)(v83 + 20);
        uint64_t v93 = 4;
        switch(v91)
        {
          case 0u:
          case 1u:
          case 2u:
          case 6u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
            break;
          case 3u:
          case 4u:
          case 5u:
          case 8u:
          case 9u:
          case 0xBu:
          case 0xEu:
          case 0x10u:
            uint64_t v93 = 8;
            break;
          case 0xFu:
LABEL_342:
            sub_239899180();
          default:
            sub_239898F9C();
        }
        uint64_t v94 = *(void *)((char *)v177 + v92);
        unsigned __int32 v95 = (_DWORD *)(*v84 + v94 * v93);
        int v96 = &v81[32 * v80];
        uint64_t v97 = v96[5];
        uint64_t v98 = *((void *)v96 + 3);
        double v99 = (unsigned char *)(v98 + v97);
        unint64_t v100 = *((void *)v96 + 2) - v97;
        char v101 = 2;
        switch(v91)
        {
          case 0u:
          case 0xDu:
            if (!v100) {
              goto LABEL_297;
            }
            uint64_t v120 = 0;
            while (1)
            {
              uint64_t v121 = v100 >= 0xA ? 10 : v100;
              if (v121)
              {
                uint64_t v122 = 0;
                while ((char)v99[v122] < 0)
                {
                  if (v121 == ++v122) {
                    goto LABEL_328;
                  }
                }
              }
              else
              {
                LODWORD(v122) = 0;
              }
              unsigned int v123 = v122 + 1;
              if (v122 == v121 || v122 == -1) {
                goto LABEL_328;
              }
              unsigned int v124 = *v99 & 0x7F;
              if (v123 >= 2)
              {
                unsigned int v124 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7);
                if (v122 != 1)
                {
                  unsigned int v124 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7) & 0x3FFF | ((v99[2] & 0x7F) << 14);
                  if (v123 >= 4)
                  {
                    unsigned int v124 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7) & 0x3FFF | ((v99[2] & 0x7F) << 14) & 0xF01FFFFF | ((v99[3] & 0x7F) << 21);
                    if (v122 != 3) {
                      v124 |= v99[4] << 28;
                    }
                  }
                }
              }
              v95[v120] = v124;
              unint64_t v125 = v120 + 1;
              v99 += v123;
              ++v120;
              v100 -= v123;
              if (!v100) {
                goto LABEL_298;
              }
            }
          case 1u:
            if (!v100) {
              goto LABEL_297;
            }
            uint64_t v141 = 0;
            while (1)
            {
              uint64_t v142 = v100 >= 0xA ? 10 : v100;
              if (v142)
              {
                uint64_t v143 = 0;
                while ((char)v99[v143] < 0)
                {
                  if (v142 == ++v143) {
                    goto LABEL_328;
                  }
                }
              }
              else
              {
                LODWORD(v143) = 0;
              }
              unsigned int v144 = v143 + 1;
              if (v143 == v142 || v143 == -1) {
                goto LABEL_328;
              }
              unsigned int v145 = *v99 & 0x7F;
              if (v144 >= 2)
              {
                unsigned int v145 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7);
                if (v143 != 1)
                {
                  unsigned int v145 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7) & 0x3FFF | ((v99[2] & 0x7F) << 14);
                  if (v144 >= 4)
                  {
                    unsigned int v145 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7) & 0x3FFF | ((v99[2] & 0x7F) << 14) & 0xF01FFFFF | ((v99[3] & 0x7F) << 21);
                    if (v143 != 3) {
                      v145 |= v99[4] << 28;
                    }
                  }
                }
              }
              v95[v141] = -(v145 & 1) ^ (v145 >> 1);
              unint64_t v125 = v141 + 1;
              v99 += v144;
              v100 -= v144;
              ++v141;
              if (!v100) {
                goto LABEL_298;
              }
            }
          case 2u:
          case 7u:
          case 0xAu:
            goto LABEL_157;
          case 3u:
          case 8u:
            if (!v100) {
              goto LABEL_297;
            }
            uint64_t v126 = 0;
            while (1)
            {
              uint64_t v127 = v100 >= 0xA ? 10 : v100;
              if (v127)
              {
                uint64_t v128 = 0;
                while ((char)v99[v128] < 0)
                {
                  if (v127 == ++v128) {
                    goto LABEL_328;
                  }
                }
              }
              else
              {
                LODWORD(v128) = 0;
              }
              unsigned int v129 = v128 + 1;
              if (v128 == v127 || v128 == -1) {
                goto LABEL_328;
              }
              *(void *)&v95[2 * v126] = sub_23984FF98((int)v128 + 1, v99);
              unint64_t v125 = v126 + 1;
              v99 += v129;
              ++v126;
              v100 -= v129;
              if (!v100) {
                goto LABEL_298;
              }
            }
          case 4u:
            if (!v100) {
              goto LABEL_297;
            }
            uint64_t v146 = 0;
            while (1)
            {
              uint64_t v147 = v100 >= 0xA ? 10 : v100;
              if (v147)
              {
                uint64_t v148 = 0;
                while ((char)v99[v148] < 0)
                {
                  if (v147 == ++v148) {
                    goto LABEL_328;
                  }
                }
              }
              else
              {
                LODWORD(v148) = 0;
              }
              unsigned int v149 = v148 + 1;
              if (v148 == v147 || v148 == -1) {
                goto LABEL_328;
              }
              unint64_t v150 = sub_23984FF98((int)v148 + 1, v99);
              *(void *)&v95[2 * v146] = -(uint64_t)(v150 & 1) ^ (v150 >> 1);
              unint64_t v125 = v146 + 1;
              v99 += v149;
              v100 -= v149;
              ++v146;
              if (!v100) {
                goto LABEL_298;
              }
            }
          case 5u:
          case 9u:
          case 0xBu:
            char v101 = 3;
LABEL_157:
            unint64_t v102 = v100 >> v101;
            memcpy(v95, (const void *)(v98 + v97), (v100 >> v101) * v93);
            double v103 = v177;
            uint64_t v104 = *(void *)((char *)v177 + v92) + v102;
            break;
          case 6u:
            if (!v100) {
              goto LABEL_297;
            }
            uint64_t v151 = 0;
            while (1)
            {
              uint64_t v152 = v100 >= 0xA ? 10 : v100;
              if (v152)
              {
                uint64_t v153 = 0;
                while ((char)v99[v153] < 0)
                {
                  if (v152 == ++v153) {
                    goto LABEL_328;
                  }
                }
              }
              else
              {
                LODWORD(v153) = 0;
              }
              unsigned int v154 = v153 + 1;
              if (v153 == v152 || v153 == -1) {
                goto LABEL_328;
              }
              unsigned int v155 = *v99 & 0x7F;
              if (v154 >= 2)
              {
                unsigned int v155 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7);
                if (v153 != 1)
                {
                  unsigned int v155 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7) & 0x3FFF | ((v99[2] & 0x7F) << 14);
                  if (v154 >= 4)
                  {
                    unsigned int v155 = *v99 & 0x7F | ((v99[1] & 0x7F) << 7) & 0x3FFF | ((v99[2] & 0x7F) << 14) & 0xF01FFFFF | ((v99[3] & 0x7F) << 21);
                    if (v153 != 3) {
                      v155 |= v99[4] << 28;
                    }
                  }
                }
              }
              v95[v151] = v155;
              unint64_t v125 = v151 + 1;
              v99 += v154;
              ++v151;
              v100 -= v154;
              if (!v100) {
                goto LABEL_298;
              }
            }
          case 0xCu:
            if (v100)
            {
              uint64_t v156 = 0;
              unsigned int v157 = 1;
              do
              {
                unsigned int v158 = v99[v156];
                if (v158 > 1) {
                  goto LABEL_328;
                }
                v95[v156] = v158;
                uint64_t v156 = v157;
              }
              while (v100 > v157++);
              unint64_t v125 = v100;
            }
            else
            {
LABEL_297:
              unint64_t v125 = 0;
            }
LABEL_298:
            uint64_t v104 = v125 + v94;
            double v103 = v177;
            break;
          default:
            goto LABEL_342;
        }
LABEL_166:
        *(void *)((char *)v103 + v92) = v104;
        goto LABEL_234;
      }
    }
    else
    {
      unsigned int v91 = *(_DWORD *)(v83 + 16);
    }
    if (v91 >= 0x11) {
      sub_239898F9C();
    }
    uint64_t v92 = *(unsigned int *)(v83 + 20);
    if (!sub_23984FC58((uint64_t)&v81[32 * v80], (void *)(*v84 + *(void *)((char *)v177 + v92) * qword_23989E788[v91]), (uint64_t)v8, 0))goto LABEL_328; {
    double v103 = v177;
    }
    uint64_t v104 = *(void *)((char *)v177 + v92) + 1;
    goto LABEL_166;
  }
  unint64_t v65 = 0;
  uint64_t v66 = 92;
  while (1)
  {
    uint64_t v67 = *(void *)(a1 + 56);
    int v68 = *(_DWORD *)(v67 + v66 - 80);
    if (!v68) {
      break;
    }
    if (v68 == 2)
    {
      uint64_t v69 = *(int *)(v67 + v66 - 76);
      if (v69 >= 0x11) {
        sub_239898F9C();
      }
      uint64_t v70 = *(unsigned int *)(v67 + v66 - 72);
      uint64_t v71 = *(void *)((char *)v10 + v70);
      if (v71)
      {
        uint64_t v72 = qword_23989E788[v69];
        *(void *)((char *)v10 + v70) = 0;
        if (!*v10) {
          sub_2398991AC();
        }
        uint64_t v73 = v15;
        uint64_t v74 = (*v8)((int)v8[2], v71 * v72);
        if (!v74)
        {
          unsigned int v163 = *(_DWORD *)(a1 + 48);
          if ((int)v65 + 1 < v163)
          {
            v164 = (unsigned int *)(*(void *)(a1 + 56) + v66);
            unsigned int v165 = ~v65 + v163;
            do
            {
              if (*(v164 - 2) == 2) {
                *(void *)((char *)v177 + *v164) = 0;
              }
              v164 += 18;
              --v165;
            }
            while (v165);
          }
          goto LABEL_328;
        }
        *(void *)((char *)v10 + *(unsigned int *)(v67 + v66 - 68)) = v74;
        unint64_t v63 = *(unsigned int *)(a1 + 48);
        unsigned int v14 = v64;
        uint64_t v15 = v73;
      }
    }
LABEL_130:
    ++v65;
    v66 += 72;
    if (v65 >= v63) {
      goto LABEL_131;
    }
  }
  if (*(void *)(v67 + v66 - 52) || ((v178[v65 >> 3] >> (v65 & 7)) & 1) != 0) {
    goto LABEL_130;
  }
  if ((v65 + 1) < v63)
  {
    v166 = (unsigned int *)(v67 + v66);
    int v167 = ~v65 + v63;
    do
    {
      if (*(v166 - 2) == 2) {
        *(void *)((char *)v177 + *v166) = 0;
      }
      v166 += 18;
      --v167;
    }
    while (v167);
  }
LABEL_328:
  sub_23984F10C(v177, v8);
  if (v179)
  {
    for (unsigned int k = 1; k <= v179; ++k)
    {
      if ((&v181)[k]) {
        ((void (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
      }
    }
  }
  unsigned int v12 = 0;
  if (v172 >= 0x88 && v178)
  {
LABEL_118:
    unsigned int v12 = 0;
    goto LABEL_315;
  }
  return v12;
}

uint64_t sub_23984F100(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 88))(a2);
}

void *sub_23984F10C(void *result, uint64_t (**a2)(int, size_t size))
{
  if (result)
  {
    unsigned int v2 = result;
    uint64_t v3 = (_DWORD *)*result;
    if (*(_DWORD *)*result != 682290937) {
      sub_239899204();
    }
    if (a2) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = &off_26B8786E0;
    }
    *uint64_t result = 0;
    unint64_t v5 = (unsigned int *)(result + 1);
    if (v3[12])
    {
      for (unint64_t i = 0; i < v3[12]; ++i)
      {
        uint64_t v7 = *((void *)v3 + 7);
        if ((*(unsigned char *)(v7 + 72 * i + 48) & 4) != 0
          && *(_DWORD *)(v7 + 72 * i + 8) != *(_DWORD *)((char *)v2 + *(unsigned int *)(v7 + 72 * i + 20)))
        {
          continue;
        }
        if (*(_DWORD *)(v7 + 72 * i + 12) == 2)
        {
          uint64_t v8 = v7 + 72 * i;
          size_t v9 = *(void *)((char *)v2 + *(unsigned int *)(v8 + 24));
          if (v9)
          {
            unint64_t v10 = *(void *)((char *)v2 + *(unsigned int *)(v8 + 20));
            int v11 = *(_DWORD *)(v7 + 72 * i + 16);
            if (v11 == 14)
            {
              if (v10)
              {
                uint64_t v21 = 0;
                unsigned int v22 = 1;
                do
                {
                  if (*(void *)(v9 + 8 * v21)) {
                    ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
                  }
                  uint64_t v21 = v22;
                  BOOL v15 = v10 > v22++;
                }
                while (v15);
              }
            }
            else if (v11 == 15)
            {
              if (v10)
              {
                uint64_t v23 = 0;
                unsigned int v24 = 1;
                do
                {
                  if (*(void *)(v9 + 16 * v23 + 8)) {
                    ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
                  }
                  uint64_t v23 = v24;
                  BOOL v15 = v10 > v24++;
                }
                while (v15);
              }
            }
            else if (v11 == 16 && v10 != 0)
            {
              uint64_t v13 = 0;
              unsigned int v14 = 1;
              do
              {
                sub_23984F10C(*(void *)(v9 + 8 * v13), v4);
                uint64_t v13 = v14;
                BOOL v15 = v10 > v14++;
              }
              while (v15);
            }
            v4[1]((int)v4[2], v9);
          }
          continue;
        }
        int v16 = *(_DWORD *)(v7 + 72 * i + 16);
        switch(v16)
        {
          case 16:
            uint64_t v18 = *(void *)((char *)v2 + *(unsigned int *)(v7 + 72 * i + 24));
            if (v18 && v18 != *(void *)(v7 + 72 * i + 40)) {
              sub_23984F10C(v18, v4);
            }
            continue;
          case 15:
            uint64_t v19 = v7 + 72 * i;
            size_t v17 = *(void *)((char *)v5 + *(unsigned int *)(v19 + 24));
            if (!v17) {
              continue;
            }
            uint64_t v20 = *(void *)(v19 + 40);
            if (v20)
            {
              if (*(void *)(v20 + 8) == v17) {
                continue;
              }
            }
            break;
          case 14:
            size_t v17 = *(void *)((char *)v2 + *(unsigned int *)(v7 + 72 * i + 24));
            if (!v17 || v17 == *(void *)(v7 + 72 * i + 40)) {
              continue;
            }
            break;
          default:
            continue;
        }
        v4[1]((int)v4[2], v17);
      }
    }
    unint64_t v25 = *v5;
    if (v25)
    {
      unint64_t v26 = 0;
      uint64_t v27 = 16;
      do
      {
        if (*(void *)(v2[2] + v27))
        {
          ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
          unint64_t v25 = *v5;
        }
        ++v26;
        v27 += 24;
      }
      while (v26 < v25);
    }
    if (v2[2]) {
      ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
    }
    unsigned int v29 = v4[1];
    uint64_t v28 = v4[2];
    return (void *)v29((int)v28, (size_t)v2);
  }
  return result;
}

uint64_t sub_23984F3C4(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = *(void *)result;
  if (!*(void *)result || *(_DWORD *)v2 != 682290937) {
    return 0;
  }
  uint64_t v3 = *(unsigned int *)(v2 + 48);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(v2 + 56);
  while (1)
  {
    uint64_t v6 = (_DWORD *)(v5 + 72 * v4);
    int v8 = v6[3];
    int v7 = v6[4];
    size_t v9 = (uint64_t *)(v1 + v6[6]);
    if (v8 != 2)
    {
      if (v7 == 14)
      {
        uint64_t v22 = *v9;
        if (v8) {
          BOOL v23 = 0;
        }
        else {
          BOOL v23 = v22 == 0;
        }
        if (v23) {
          return 0;
        }
      }
      else if (v7 == 15)
      {
        if ((!v8 || *(_DWORD *)(v1 + *(unsigned int *)(v5 + 72 * v4 + 20)) == 1) && *v9 && !v9[1]) {
          return 0;
        }
      }
      else if (v7 == 16 && (!v8 || *v9 != 0))
      {
        uint64_t result = ((uint64_t (*)(void))sub_23984F3C4)();
        if (!result) {
          return result;
        }
      }
      goto LABEL_47;
    }
    unint64_t v10 = *(void *)(v1 + *(unsigned int *)(v5 + 72 * v4 + 20));
    if (v10 && !*v9) {
      return 0;
    }
    if (v7 == 14) {
      break;
    }
    if (v7 == 15)
    {
      if (v10)
      {
        uint64_t v19 = 0;
        uint64_t v20 = *v9;
        unsigned int v21 = 1;
        while (!*(void *)(v20 + 16 * v19) || *(void *)(v20 + 16 * v19 + 8))
        {
          uint64_t v19 = v21;
          BOOL v14 = v10 > v21++;
          if (!v14) {
            goto LABEL_47;
          }
        }
        return 0;
      }
    }
    else if (v7 == 16 && v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = *v9;
      unsigned int v13 = 1;
      do
      {
        uint64_t result = sub_23984F3C4(*(void *)(v12 + 8 * v11));
        if (!result) {
          return result;
        }
        uint64_t v11 = v13;
        BOOL v14 = v10 > v13++;
      }
      while (v14);
    }
LABEL_47:
    ++v4;
    uint64_t result = 1;
    if (v4 == v3) {
      return result;
    }
  }
  if (!v10) {
    goto LABEL_47;
  }
  uint64_t v16 = 0;
  uint64_t v17 = *v9;
  unsigned int v18 = 1;
  while (*(void *)(v17 + 8 * v16))
  {
    uint64_t v16 = v18;
    BOOL v14 = v10 > v18++;
    if (!v14) {
      goto LABEL_47;
    }
  }
  return 0;
}

uint64_t sub_23984F5A4(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(*(void *)a1 + 40) <= a2) {
    sub_239899230();
  }
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 8 * a2 + 24);
  return v2();
}

void sub_23984F5F0(void *a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 336960451) {
    sub_23989925C();
  }
  a1[2] = a3;
  *a1 = a2;
  a1[1] = sub_23984F5A4;
  uint64_t v3 = a1 + 3;
  size_t v4 = 8 * a2[10];
  bzero(v3, v4);
}

uint64_t sub_23984F648(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_23984F650(uint64_t result, char *__s2)
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 64);
    if (v3)
    {
      unsigned int v5 = *(_DWORD *)(result + 56);
      if (v5 >= 2)
      {
        LODWORD(v6) = 0;
        while (1)
        {
          uint64_t v7 = v6 + (v5 >> 1);
          int v8 = strcmp(*(const char **)(v3 + 16 * v7), __s2);
          if (!v8) {
            return *(void *)(v2 + 48) + 24 * *(unsigned int *)(v3 + 16 * v7 + 8);
          }
          unsigned int v9 = v5 + v6 + ~v7;
          if (v8 < 0) {
            uint64_t v6 = (v7 + 1);
          }
          else {
            uint64_t v6 = v6;
          }
          if (v8 >= 0) {
            v5 >>= 1;
          }
          else {
            unsigned int v5 = v9;
          }
          if (v5 <= 1)
          {
            uint64_t v7 = v6;
            if (v5) {
              goto LABEL_16;
            }
            return 0;
          }
        }
      }
      uint64_t v7 = 0;
      if (v5)
      {
LABEL_16:
        if (!strcmp(*(const char **)(v3 + 16 * v7), __s2)) {
          return *(void *)(v2 + 48) + 24 * *(unsigned int *)(v3 + 16 * v7 + 8);
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_23984F724(uint64_t a1, int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 72);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 80);
  if (v2 != 1)
  {
    unsigned int v4 = 0;
    while (1)
    {
      uint64_t v5 = v4 + (v2 >> 1);
      int v6 = *(_DWORD *)(v3 + 8 * v5);
      int v7 = a2 - v6;
      if (a2 >= v6)
      {
        int v8 = *(_DWORD *)(v3 + 8 * v5 + 4);
        if (*(_DWORD *)(v3 + 8 * (v5 + 1) + 4) + v6 - v8 > a2)
        {
          unsigned int v12 = v7 + v8;
          if (((v7 + v8) & 0x80000000) == 0) {
            return *(void *)(a1 + 48) + 24 * v12;
          }
          return 0;
        }
        v2 += v4 + ~v5;
        unsigned int v4 = v5 + 1;
      }
      else
      {
        v2 >>= 1;
      }
      if (v2 <= 1)
      {
        if (!v2) {
          return 0;
        }
        goto LABEL_11;
      }
    }
  }
  unsigned int v4 = 0;
LABEL_11:
  unsigned int v9 = (int *)(v3 + 8 * v4);
  int v10 = *v9;
  if (*v9 > a2) {
    return 0;
  }
  int v11 = v9[1];
  if (v10 - v11 + *(_DWORD *)(v3 + 8 * (v4 + 1) + 4) <= a2) {
    return 0;
  }
  unsigned int v12 = v11 + a2 - v10;
  if ((v12 & 0x80000000) != 0) {
    return 0;
  }
  else {
    return *(void *)(a1 + 48) + 24 * v12;
  }
}

const char **sub_23984F7FC(uint64_t a1, char *__s2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 64);
  if (!v3) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 48);
  if (v5 < 2)
  {
    uint64_t v6 = 0;
    if (v5)
    {
LABEL_14:
      unsigned int v12 = (const char **)(*(void *)(a1 + 56) + 72 * *(unsigned int *)(v3 + 4 * v6));
      if (!strcmp(*v12, __s2)) {
        return v12;
      }
      else {
        return 0;
      }
    }
    return 0;
  }
  LODWORD(v6) = 0;
  uint64_t v7 = *(void *)(a1 + 56);
  while (1)
  {
    unsigned int v8 = v6 + (v5 >> 1);
    unsigned int v9 = (const char **)(v7 + 72 * *(unsigned int *)(v3 + 4 * v8));
    int v10 = strcmp(*v9, __s2);
    if (!v10) {
      return v9;
    }
    unsigned int v11 = v5 + v6 + ~v8;
    if (v10 < 0) {
      uint64_t v6 = v8 + 1;
    }
    else {
      uint64_t v6 = v6;
    }
    if (v10 >= 0) {
      v5 >>= 1;
    }
    else {
      unsigned int v5 = v11;
    }
    if (v5 <= 1)
    {
      if (!v5) {
        return 0;
      }
      goto LABEL_14;
    }
  }
}

uint64_t sub_23984F8E0(uint64_t a1, int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 72);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 80);
  if (v2 != 1)
  {
    unsigned int v4 = 0;
    while (1)
    {
      uint64_t v5 = v4 + (v2 >> 1);
      int v6 = *(_DWORD *)(v3 + 8 * v5);
      int v7 = a2 - v6;
      if (a2 >= v6)
      {
        int v8 = *(_DWORD *)(v3 + 8 * v5 + 4);
        if (*(_DWORD *)(v3 + 8 * (v5 + 1) + 4) + v6 - v8 > a2)
        {
          unsigned int v12 = v7 + v8;
          if (((v7 + v8) & 0x80000000) == 0) {
            return *(void *)(a1 + 56) + 72 * v12;
          }
          return 0;
        }
        v2 += v4 + ~v5;
        unsigned int v4 = v5 + 1;
      }
      else
      {
        v2 >>= 1;
      }
      if (v2 <= 1)
      {
        if (!v2) {
          return 0;
        }
        goto LABEL_11;
      }
    }
  }
  unsigned int v4 = 0;
LABEL_11:
  unsigned int v9 = (int *)(v3 + 8 * v4);
  int v10 = *v9;
  if (*v9 > a2) {
    return 0;
  }
  int v11 = v9[1];
  if (v10 - v11 + *(_DWORD *)(v3 + 8 * (v4 + 1) + 4) <= a2) {
    return 0;
  }
  unsigned int v12 = v11 + a2 - v10;
  if ((v12 & 0x80000000) != 0) {
    return 0;
  }
  else {
    return *(void *)(a1 + 56) + 72 * v12;
  }
}

const char **sub_23984F9B8(uint64_t a1, char *__s2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 40);
  if (v5 < 2)
  {
    uint64_t v6 = 0;
    if (v5)
    {
LABEL_14:
      int v11 = (const char **)(*(void *)(a1 + 48) + 24 * *(unsigned int *)(v3 + 4 * v6));
      if (!strcmp(*v11, __s2)) {
        return v11;
      }
      else {
        return 0;
      }
    }
    return 0;
  }
  LODWORD(v6) = 0;
  uint64_t v7 = *(void *)(a1 + 48);
  while (1)
  {
    unsigned int v8 = v6 + (v5 >> 1);
    unsigned int v9 = (const char **)(v7 + 24 * *(unsigned int *)(v3 + 4 * v8));
    int v10 = strcmp(*v9, __s2);
    if (!v10) {
      return v9;
    }
    if (v10 >= 0) {
      v5 >>= 1;
    }
    else {
      v5 += v6 + ~v8;
    }
    if (v10 < 0) {
      uint64_t v6 = v8 + 1;
    }
    else {
      uint64_t v6 = v6;
    }
    if (v5 <= 1)
    {
      if (!v5) {
        return 0;
      }
      goto LABEL_14;
    }
  }
}

void *sub_23984FA9C(int a1, size_t size)
{
  return malloc_type_malloc(size, 0xB182DB82uLL);
}

void sub_23984FAAC(int a1, void *a2)
{
}

uint64_t sub_23984FAB4(unsigned int a1, unsigned char *a2)
{
  if (a1 >> 29) {
    return sub_23984FB48(8 * a1, a2);
  }
  LOBYTE(v2) = 8 * a1;
  if (a1 < 0x10)
  {
    unsigned int v3 = 0;
  }
  else
  {
    *a2 = v2 | 0x80;
    unsigned int v2 = a1 >> 4;
    if (a1 < 0x800)
    {
      unsigned int v3 = 1;
    }
    else
    {
      a2[1] = v2 | 0x80;
      unsigned int v2 = a1 >> 11;
      if (a1 < 0x40000)
      {
        unsigned int v3 = 2;
      }
      else
      {
        a2[2] = v2 | 0x80;
        unsigned int v2 = a1 >> 18;
        if (a1 >> 25)
        {
          a2[3] = v2 | 0x80;
          unsigned int v3 = 4;
          unsigned int v2 = a1 >> 25;
        }
        else
        {
          unsigned int v3 = 3;
        }
      }
    }
  }
  uint64_t result = v3 + 1;
  a2[v3] = v2;
  return result;
}

uint64_t sub_23984FB48(unint64_t a1, unsigned char *a2)
{
  unint64_t v2 = HIDWORD(a1);
  if (!HIDWORD(a1))
  {
    if (a1 >= 0x80)
    {
      *a2 = a1 | 0x80;
      unsigned int v5 = a1 >> 7;
      if (a1 < 0x4000)
      {
        LODWORD(v4) = 1;
      }
      else
      {
        a2[1] = v5 | 0x80;
        unsigned int v5 = a1 >> 14;
        if (a1 < 0x200000)
        {
          LODWORD(v4) = 2;
        }
        else
        {
          a2[2] = v5 | 0x80;
          unsigned int v5 = a1 >> 21;
          LODWORD(a1) = a1 >> 28;
          if (a1)
          {
            a2[3] = v5 | 0x80;
            LODWORD(v4) = 4;
LABEL_19:
            unsigned int v3 = v4 + 1;
            goto LABEL_20;
          }
          LODWORD(v4) = 3;
        }
      }
      LOBYTE(a1) = v5;
      goto LABEL_19;
    }
    LODWORD(v4) = 0;
    goto LABEL_19;
  }
  *a2 = a1 | 0x80;
  a2[1] = (a1 >> 7) | 0x80;
  a2[2] = (a1 >> 14) | 0x80;
  a2[3] = (a1 >> 21) | 0x80;
  LODWORD(a1) = a1 >> 28;
  if (v2 >= 8)
  {
    a2[4] = a1 | 0x80;
    LODWORD(a1) = v2 >> 3;
    if (v2 < 0x400)
    {
      LODWORD(v4) = 5;
    }
    else
    {
      uint64_t v4 = 5;
      do
      {
        a2[v4++] = a1 | 0x80;
        unsigned int v6 = a1 >> 14;
        LODWORD(a1) = a1 >> 7;
      }
      while (v6);
    }
    goto LABEL_19;
  }
  unsigned int v3 = 5;
  LODWORD(v4) = 4;
LABEL_20:
  a2[v4] = a1;
  return v3;
}

uint64_t sub_23984FC58(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  unsigned int v8 = *(char **)(a1 + 24);
  int v10 = *(unsigned __int8 *)(a1 + 4);
  switch(*(_DWORD *)(v4 + 16))
  {
    case 0:
    case 6:
    case 0xD:
      if (*(unsigned char *)(a1 + 4)) {
        return 0;
      }
      LODWORD(v11) = *v8 & 0x7F;
      if (v9 >= 2)
      {
        LODWORD(v11) = *v8 & 0x7F | ((v8[1] & 0x7F) << 7);
        if (v9 != 2)
        {
          LODWORD(v11) = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14);
          if (v9 >= 4)
          {
            LODWORD(v11) = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14) & 0xF01FFFFF | ((v8[3] & 0x7F) << 21);
            if (v9 != 4) {
              LODWORD(v11) = v11 | (v8[4] << 28);
            }
          }
        }
      }
      goto LABEL_10;
    case 1:
      if (*(unsigned char *)(a1 + 4)) {
        return 0;
      }
      unsigned int v13 = *v8 & 0x7F;
      if (v9 >= 2)
      {
        unsigned int v13 = *v8 & 0x7F | ((v8[1] & 0x7F) << 7);
        if (v9 != 2)
        {
          unsigned int v13 = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14);
          if (v9 >= 4)
          {
            unsigned int v13 = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14) & 0xF01FFFFF | ((v8[3] & 0x7F) << 21);
            if (v9 != 4) {
              v13 |= v8[4] << 28;
            }
          }
        }
      }
      LODWORD(v11) = -(v13 & 1) ^ (v13 >> 1);
      goto LABEL_10;
    case 2:
    case 7:
    case 0xA:
      if (v10 != 5) {
        return 0;
      }
      LODWORD(v11) = *(_DWORD *)v8;
      goto LABEL_10;
    case 3:
    case 8:
      if (*(unsigned char *)(a1 + 4)) {
        return 0;
      }
      *a2 = sub_23984FF98(*(void *)(a1 + 16), v8);
      return 1;
    case 4:
      if (*(unsigned char *)(a1 + 4)) {
        return 0;
      }
      unint64_t v14 = sub_23984FF98(*(void *)(a1 + 16), v8);
      unint64_t v12 = -(uint64_t)(v14 & 1) ^ (v14 >> 1);
      goto LABEL_13;
    case 5:
    case 9:
    case 0xB:
      if (v10 != 1) {
        return 0;
      }
      unint64_t v12 = *(void *)v8;
LABEL_13:
      *a2 = v12;
      return 1;
    case 0xC:
      if (v9)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        while (1)
        {
          char v15 = *v8++;
          if ((v15 & 0x7F) != 0) {
            break;
          }
          if (!--v11) {
            goto LABEL_10;
          }
        }
        LODWORD(v11) = 1;
      }
      else
      {
        LODWORD(v11) = 0;
      }
LABEL_10:
      *(_DWORD *)a2 = v11;
      return 1;
    case 0xE:
      if (v10 != 2) {
        return 0;
      }
      int v16 = *(unsigned __int8 *)(a1 + 5);
      if (a4)
      {
        uint64_t v17 = *a2;
        if (*a2)
        {
          if (v17 != *(void *)(v4 + 40)) {
            (*(void (**)(void))(a3 + 8))(*(void *)(a3 + 16));
          }
        }
      }
      size_t v18 = (v9 - v16);
      uint64_t result = (*(uint64_t (**)(void, void))a3)(*(void *)(a3 + 16), (v18 + 1));
      *a2 = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, &v8[v16], v18);
      *(unsigned char *)(*a2 + v18) = 0;
      return 1;
    case 0xF:
      if (v10 != 2) {
        return 0;
      }
      int v20 = *(unsigned __int8 *)(a1 + 5);
      if (a4)
      {
        uint64_t v21 = a2[1];
        if (v21)
        {
          uint64_t v22 = *(void *)(v4 + 40);
          if (!v22 || v21 != *(void *)(v22 + 8)) {
            (*(void (**)(void))(a3 + 8))(*(void *)(a3 + 16));
          }
        }
      }
      size_t v23 = (v9 - v20);
      if (v23)
      {
        uint64_t result = (*(uint64_t (**)(void, size_t))a3)(*(void *)(a3 + 16), v23);
        a2[1] = result;
        if (!result) {
          return result;
        }
        memcpy((void *)result, &v8[v20], v23);
      }
      else
      {
        a2[1] = 0;
      }
      *a2 = v23;
      return 1;
    case 0x10:
      if (v10 != 2) {
        return 0;
      }
      unsigned int v24 = *(void **)(v4 + 40);
      unint64_t v25 = (uint64_t *)sub_23984DF34(*(void *)(v4 + 32), a3, v9 - *(unsigned __int8 *)(a1 + 5), &v8[*(unsigned __int8 *)(a1 + 5)]);
      if (a4)
      {
        unint64_t v26 = (void *)*a2;
        int v27 = 1;
        if (*a2 && v26 != v24)
        {
          if (v25)
          {
            int v27 = sub_23985002C((uint64_t)v26, v25, a3);
            unint64_t v26 = (void *)*a2;
          }
          sub_23984F10C(v26, (uint64_t (**)(int, size_t))a3);
        }
      }
      else
      {
        int v27 = 1;
      }
      *a2 = v25;
      if (v25) {
        BOOL v28 = v27 == 0;
      }
      else {
        BOOL v28 = 1;
      }
      return !v28;
    default:
      return 0;
  }
}

unint64_t sub_23984FF98(unsigned int a1, unsigned char *a2)
{
  LODWORD(result) = *a2 & 0x7F;
  if (a1 > 4)
  {
    unint64_t result = *a2 & 0x7F | (unint64_t)(((a2[1] & 0x7F) << 7) & 0x3FFF) | ((unint64_t)(a2[2] & 0x7F) << 14) & 0xFFFFFFFFF01FFFFFLL | ((unint64_t)(a2[3] & 0x7F) << 21);
    uint64_t v4 = a2 + 4;
    uint64_t v5 = 7 * a1;
    uint64_t v6 = 28;
    do
    {
      char v7 = *v4++;
      result |= (unint64_t)(v7 & 0x7F) << v6;
      v6 += 7;
    }
    while (v5 != v6);
  }
  else
  {
    if (a1 >= 2)
    {
      LODWORD(result) = *a2 & 0x7F | ((a2[1] & 0x7F) << 7);
      if (a1 != 2)
      {
        LODWORD(result) = *a2 & 0x7F | ((a2[1] & 0x7F) << 7) & 0x3FFF | ((a2[2] & 0x7F) << 14);
        if (a1 >= 4) {
          LODWORD(result) = *a2 & 0x7F | ((a2[1] & 0x7F) << 7) & 0x3FFF | ((a2[2] & 0x7F) << 14) & 0xF01FFFFF | ((a2[3] & 0x7F) << 21);
        }
      }
    }
    return result;
  }
  return result;
}

uint64_t sub_23985002C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if (*(_DWORD *)(*a2 + 48))
  {
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)(v3 + 56);
    do
    {
      int v9 = *(_DWORD *)(v8 + 72 * v7 + 12);
      if (v9 == 1)
      {
        uint64_t v19 = v8 + 72 * v7;
        uint64_t v20 = *(unsigned int *)(v19 + 20);
        if ((*(unsigned char *)(v19 + 48) & 4) != 0)
        {
          if (*(_DWORD *)((char *)a2 + v20)) {
            goto LABEL_21;
          }
          unsigned int v21 = *(_DWORD *)(v3 + 72);
          if (!v21) {
            goto LABEL_31;
          }
          uint64_t v22 = *(void *)(v3 + 80);
          int v23 = *(_DWORD *)(a1 + v20);
          if (v21 == 1)
          {
            unsigned int v24 = 0;
          }
          else
          {
            unsigned int v24 = 0;
            do
            {
              uint64_t v25 = v24 + (v21 >> 1);
              int v26 = *(_DWORD *)(v22 + 8 * v25);
              if (v23 >= v26)
              {
                int v27 = *(_DWORD *)(v22 + 8 * v25 + 4);
                if (*(_DWORD *)(v22 + 8 * (v25 + 1) + 4) + v26 - v27 > v23)
                {
                  int v30 = v23 - v26 + v27;
                  goto LABEL_36;
                }
                v21 += v24 + ~v25;
                unsigned int v24 = v25 + 1;
              }
              else
              {
                v21 >>= 1;
              }
            }
            while (v21 > 1);
            if (!v21) {
              goto LABEL_31;
            }
          }
          BOOL v28 = (int *)(v22 + 8 * v24);
          int v29 = *v28;
          if (*v28 <= v23)
          {
            int v31 = v28[1];
            int v32 = v29 - v31 + *(_DWORD *)(v22 + 8 * (v24 + 1) + 4);
            int v33 = v31 + v23 - v29;
            if (v32 > v23) {
              int v30 = v33;
            }
            else {
              int v30 = -1;
            }
          }
          else
          {
LABEL_31:
            int v30 = -1;
          }
LABEL_36:
          uint64_t v19 = *(void *)(v3 + 56) + 72 * v30;
        }
        uint64_t v34 = *(unsigned int *)(v19 + 24);
        int v35 = (void *)(a1 + v34);
        uint64_t v36 = (uint64_t *)((char *)a2 + v34);
        uint64_t v37 = *(void *)(v19 + 40);
        unsigned int v38 = *(_DWORD *)(v19 + 16);
        switch(v38)
        {
          case 0xEu:
            if (*v35 != v37 && *v36 == v37)
            {
LABEL_49:
              size_t v40 = 8;
              goto LABEL_65;
            }
            break;
          case 0xFu:
            uint64_t v41 = v35[1];
            if (v41)
            {
              uint64_t v42 = v36[1];
              if (v37)
              {
                uint64_t v43 = *(void *)(v37 + 8);
                if (v41 != v43 && (!v42 || v42 == v43))
                {
LABEL_64:
                  size_t v40 = 16;
LABEL_65:
                  memcpy(v36, v35, v40);
                  bzero(v35, v40);
                  if (*(_DWORD *)(v19 + 20))
                  {
                    *(_DWORD *)((char *)a2 + v20) = *(_DWORD *)(a1 + v20);
                    *(_DWORD *)(a1 + v20) = 0;
                  }
                }
              }
              else if (!v42)
              {
                goto LABEL_64;
              }
            }
            break;
          case 0x10u:
            if (*v35)
            {
              if (!*v36) {
                goto LABEL_49;
              }
              uint64_t result = sub_23985002C(*v35, *v36, a3);
              if (!result) {
                return result;
              }
            }
            break;
          default:
            if (*(_DWORD *)(a1 + v20) && !*(_DWORD *)((char *)a2 + v20))
            {
              if (v38 >= 0xE) {
                sub_239898F9C();
              }
              size_t v40 = qword_23989E810[v38];
              goto LABEL_65;
            }
            break;
        }
      }
      else if (v9 == 2)
      {
        uint64_t v10 = v8 + 72 * v7;
        uint64_t v11 = *(unsigned int *)(v10 + 20);
        uint64_t v12 = *(void *)(a1 + v11);
        if (v12)
        {
          uint64_t v13 = *(unsigned int *)(v10 + 24);
          uint64_t v14 = *(uint64_t *)((char *)a2 + v11);
          if (v14)
          {
            uint64_t v15 = *(int *)(v8 + 72 * v7 + 16);
            if (v15 >= 0x11) {
              sub_239898F9C();
            }
            uint64_t v16 = qword_23989E788[v15];
            uint64_t result = (*(uint64_t (**)(void, uint64_t))a3)(*(void *)(a3 + 16), v16 * (v14 + v12));
            if (!result) {
              return result;
            }
            uint64_t v18 = result;
            memcpy((void *)result, *(const void **)(a1 + v13), *(void *)(a1 + v11) * v16);
            memcpy((void *)(v18 + *(void *)(a1 + v11) * v16), *(const void **)((char *)a2 + v13), *(uint64_t *)((char *)a2 + v11) * v16);
            if (*(uint64_t *)((char *)a2 + v13)) {
              (*(void (**)(void))(a3 + 8))(*(void *)(a3 + 16));
            }
            if (*(void *)(a1 + v13)) {
              (*(void (**)(void))(a3 + 8))(*(void *)(a3 + 16));
            }
            *(uint64_t *)((char *)a2 + v13) = v18;
            *(uint64_t *)((char *)a2 + v11) += *(void *)(a1 + v11);
          }
          else
          {
            *(uint64_t *)((char *)a2 + v11) = v12;
            *(uint64_t *)((char *)a2 + v13) = *(void *)(a1 + v13);
          }
          *(void *)(a1 + v11) = 0;
          *(void *)(a1 + v13) = 0;
        }
      }
LABEL_21:
      ++v7;
      uint64_t v3 = *a2;
    }
    while (v7 < *(unsigned int *)(*a2 + 48));
  }
  return 1;
}

void *sub_239850378(void *a1, id a2, size_t a3)
{
  IndexedIvars = object_getIndexedIvars(a2);
  uint64_t v6 = object_getIndexedIvars(a1);
  return memmove(IndexedIvars, v6, a3);
}

void *sub_2398503D4(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v6 = (const void *)*((void *)object_getIndexedIvars(a1) + a2);
  if (v6) {
    CFRelease(v6);
  }
  if (a3) {
    CFRetain(a3);
  }
  uint64_t result = object_getIndexedIvars(a1);
  result[a2] = a3;
  return result;
}

uint64_t sub_23985042C(void *a1, uint64_t a2)
{
  return *((void *)object_getIndexedIvars(a1) + a2);
}

uint64_t sub_2398505E0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  unint64_t v2 = (void *)qword_268A05798;
  qword_268A05798 = (uint64_t)v1;

  objc_msgSend_setSubviews_((void *)qword_268A05798, v3, v4, MEMORY[0x263EFFA68]);
  uint64_t v6 = qword_268A05798;
  return MEMORY[0x270F9A6D0](v6, sel_setConstraints_, v5);
}

void sub_239850AB0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  unint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v3, v5, v6, v4);
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)TMLUITraitCollection;
  objc_msgSendSuper2(&v8, sel_setTMLValue_forKeyPath_, v7, v4);
}

uint64_t sub_239850E1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  double v6 = objc_msgSend_preferredContentSizeCategories(v3, v4, v5);

  if (v6)
  {
    int v9 = objc_msgSend_preferredContentSizeCategories(v3, v7, v8);
    uint64_t v12 = objc_msgSend_preferredContentSizeCategory(*(void **)(a1 + 32), v10, v11);
    int v15 = objc_msgSend_containsObject_(v9, v13, v14, v12);

    if (v15)
    {
      uint64_t v18 = objc_msgSend_preferredContentSizeCategory(*(void **)(a1 + 32), v16, v17);
      objc_msgSend_setPreferredContentSizeCategory_(v3, v19, v20, v18);

      goto LABEL_5;
    }
LABEL_6:
    uint64_t v25 = 0;
    goto LABEL_7;
  }
LABEL_5:
  unsigned int v21 = *(void **)(a1 + 32);
  uint64_t v22 = objc_msgSend_traitCollection(v3, v7, v8);
  uint64_t v25 = objc_msgSend_containsTraitsInCollection_(v21, v23, v24, v22);

LABEL_7:
  return v25;
}

uint64_t sub_239850F1C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_specificity(a2, v5, v6);
  uint64_t v10 = objc_msgSend_specificity(v4, v8, v9);

  if (v7 == v10) {
    return 0;
  }
  else {
    return ((v7 - v10) >> 63) | 1;
  }
}

const CGPath *sub_23985114C(CGFloat a1, CGFloat a2, uint64_t a3, void *a4, void *a5, CGLineCap a6, CGLineJoin a7)
{
  uint64_t v12 = a4;
  id v13 = a5;
  objc_opt_class();
  int v15 = v12;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = v12;
    int v15 = (const CGPath *)objc_msgSend_CGPath(v16, v17, v18);
  }
  memset(&v23, 0, sizeof(v23));
  if (v13) {
    objc_msgSend_transform(v13, v14, 0.0);
  }
  CGAffineTransform v22 = v23;
  if (CGAffineTransformIsIdentity(&v22)) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = &v23;
  }
  double v20 = CGPathCreateCopyByStrokingPath(v15, v19, a1, a6, a7, a2);

  return v20;
}

id sub_239851768(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v7 = objc_alloc(*(Class *)(a1 + 32));
  CATransform3DMakeTranslation(&v12, a2, a3, a4);
  uint64_t v10 = objc_msgSend_initWithTransform3D_(v7, v8, v9, &v12);
  return v10;
}

id sub_2398517E4(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v7 = objc_alloc(*(Class *)(a1 + 32));
  CATransform3DMakeScale(&v12, a2, a3, a4);
  uint64_t v10 = objc_msgSend_initWithTransform3D_(v7, v8, v9, &v12);
  return v10;
}

id sub_239851860(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = objc_alloc(*(Class *)(a1 + 32));
  CATransform3DMakeRotation(&v14, a2, a3, a4, a5);
  CATransform3D v12 = objc_msgSend_initWithTransform3D_(v9, v10, v11, &v14);
  return v12;
}

id sub_2398518E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = objc_alloc(*(Class *)(a1 + 32));
  if (v5)
  {
    objc_msgSend_transform(v5, v7, v9);
    if (v6)
    {
LABEL_3:
      objc_msgSend_transform(v6, v7, v10);
      goto LABEL_6;
    }
  }
  else
  {
    double v10 = 0.0;
    memset(&a, 0, sizeof(a));
    if (v6) {
      goto LABEL_3;
    }
  }
  memset(&v15, 0, sizeof(v15));
LABEL_6:
  CATransform3DConcat(&v17, &a, &v15);
  id v13 = objc_msgSend_initWithTransform3D_(v8, v11, v12, &v17);

  return v13;
}

id sub_2398519C0(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a2;
  id v11 = objc_alloc(*(Class *)(a1 + 32));
  if (v9) {
    objc_msgSend_transform(v9, v10, v12);
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CATransform3DTranslate(&v18, &v17, a3, a4, a5);
  CATransform3D v15 = objc_msgSend_initWithTransform3D_(v11, v13, v14, &v18);

  return v15;
}

id sub_239851A88(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a2;
  id v11 = objc_alloc(*(Class *)(a1 + 32));
  if (v9) {
    objc_msgSend_transform(v9, v10, v12);
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CATransform3DScale(&v18, &v17, a3, a4, a5);
  CATransform3D v15 = objc_msgSend_initWithTransform3D_(v11, v13, v14, &v18);

  return v15;
}

id sub_239851B50(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  id v13 = objc_alloc(*(Class *)(a1 + 32));
  if (v11) {
    objc_msgSend_transform(v11, v12, v14);
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CATransform3DRotate(&v20, &v19, a3, a4, a5, a6);
  CATransform3D v17 = objc_msgSend_initWithTransform3D_(v13, v15, v16, &v20);

  return v17;
}

id sub_239851C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  if (v3) {
    objc_msgSend_transform(v3, v4, v6);
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CATransform3DInvert(&v12, &v11);
  id v9 = objc_msgSend_initWithTransform3D_(v5, v7, v8, &v12);

  return v9;
}

id sub_239851CC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  if (v3) {
    objc_msgSend_transform(v3, v4, v6);
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CATransform3DMakeAffineTransform(&v12, &v11);
  id v9 = objc_msgSend_initWithTransform3D_(v5, v7, v8, &v12);

  return v9;
}

uint64_t sub_239851F14(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = sub_2398520F4();
  uint64_t v10 = objc_msgSend_initWithImage_style_target_action_(a1, v8, v9, v6, a4, v7, sel_action_);

  return v10;
}

uint64_t sub_239851F80(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = sub_2398520F4();
  uint64_t v10 = objc_msgSend_initWithTitle_style_target_action_(a1, v8, v9, v6, a4, v7, sel_action_);

  return v10;
}

uint64_t sub_239851FEC(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = sub_2398520F4();
  uint64_t v8 = objc_msgSend_initWithBarButtonSystemItem_target_action_(a1, v6, v7, a3, v5, sel_action_);

  return v8;
}

uint64_t sub_239852048(void *a1)
{
  unint64_t v2 = sub_2398520F4();
  objc_msgSend_setTarget_(a1, v3, v4, v2);

  return MEMORY[0x270F9A6D0](a1, sel_setAction_, v5);
}

uint64_t sub_2398520A0(void *a1, const char *a2, double a3)
{
  objc_msgSend_setTarget_(a1, a2, a3, 0);
  return MEMORY[0x270F9A6D0](a1, sel_setAction_, v4);
}

id sub_2398520F4()
{
  if (qword_268A057B0 != -1) {
    dispatch_once(&qword_268A057B0, &unk_26ECEBF78);
  }
  id v0 = (void *)qword_268A057A8;
  return v0;
}

uint64_t sub_239852148()
{
  id v0 = objc_alloc_init(TMLUIBarButtonItemActionTarget);
  uint64_t v1 = qword_268A057A8;
  qword_268A057A8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_239852204(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], a3, a1, @"array");
  uint64_t v4 = qword_268A057B8;
  qword_268A057B8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

id sub_239852918(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v9 = objc_alloc(*(Class *)(a1 + 32));
  CGAffineTransform v11 = objc_msgSend_initWithInsets_(v9, v10, a2, a3, a4, a5);
  return v11;
}

BOOL sub_239852978(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_UIEdgeInsets(a2, v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  objc_msgSend_UIEdgeInsets(v4, v15, v7);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  BOOL v24 = v10 == v19;
  if (v8 != v17) {
    BOOL v24 = 0;
  }
  if (v14 != v23) {
    BOOL v24 = 0;
  }
  return v12 == v21 && v24;
}

double sub_239852AD4(uint64_t a1)
{
  *(_OWORD *)(a1 + 64) = xmmword_264DAC6B8;
  *(_OWORD *)(a1 + 80) = unk_264DAC6C8;
  *(void *)(a1 + 96) = 0;
  *(_OWORD *)a1 = xmmword_264DAC678;
  *(_OWORD *)(a1 + 16) = unk_264DAC688;
  double result = dbl_264DAC6A8[0];
  *(_OWORD *)(a1 + 32) = xmmword_264DAC698;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)dbl_264DAC6A8;
  return result;
}

uint64_t sub_239852B00(void **a1)
{
  if (*a1 != &unk_26ECEBFD8) {
    sub_239899288();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_239852B3C(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEBFD8) {
    sub_2398992B4();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_239852B78(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEBFD8) {
    sub_2398992E0();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_239852BB4(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEBFD8, a1, a2, a3);
}

void *sub_239852BCC(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEBFD8) {
    sub_23989930C();
  }
  return sub_23984F10C(a1, a2);
}

double sub_239852C08(_OWORD *a1)
{
  a1[4] = xmmword_264DAC720;
  a1[5] = unk_264DAC730;
  a1[6] = xmmword_264DAC740;
  a1[7] = unk_264DAC750;
  *a1 = xmmword_264DAC6E0;
  a1[1] = *(_OWORD *)algn_264DAC6F0;
  double result = 0.0;
  a1[2] = xmmword_264DAC700;
  a1[3] = unk_264DAC710;
  return result;
}

uint64_t sub_239852C34(void **a1)
{
  if (*a1 != &unk_26ECEC050) {
    sub_239899338();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_239852C70(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC050) {
    sub_239899364();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_239852CAC(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC050) {
    sub_239899390();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_239852CE8(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC050, a1, a2, a3);
}

void *sub_239852D00(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC050) {
    sub_2398993BC();
  }
  return sub_23984F10C(a1, a2);
}

double sub_239852D3C(uint64_t a1)
{
  *(_OWORD *)(a1 + 32) = xmmword_264DAC780;
  *(_OWORD *)(a1 + 48) = unk_264DAC790;
  *(void *)(a1 + 64) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = xmmword_264DAC760;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)algn_264DAC770;
  return result;
}

uint64_t sub_239852D60(void **a1)
{
  if (*a1 != &unk_26ECEC0C8) {
    sub_2398993E8();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_239852D9C(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC0C8) {
    sub_239899414();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_239852DD8(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC0C8) {
    sub_239899440();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_239852E14(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC0C8, a1, a2, a3);
}

void *sub_239852E2C(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC0C8) {
    sub_23989946C();
  }
  return sub_23984F10C(a1, a2);
}

double sub_239852E68(_OWORD *a1)
{
  *a1 = xmmword_264DAC7A8;
  a1[1] = unk_264DAC7B8;
  double result = 0.0;
  a1[2] = xmmword_264DAC7C8;
  return result;
}

uint64_t sub_239852E84(void **a1)
{
  if (*a1 != &unk_26ECEC140) {
    sub_239899498();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_239852EC0(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC140) {
    sub_2398994C4();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_239852EFC(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC140) {
    sub_2398994F0();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_239852F38(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC140, a1, a2, a3);
}

void *sub_239852F50(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC140) {
    sub_23989951C();
  }
  return sub_23984F10C(a1, a2);
}

double sub_239852F8C(uint64_t a1)
{
  *(_OWORD *)(a1 + 32) = xmmword_264DAC7F8;
  *(_OWORD *)(a1 + 48) = unk_264DAC808;
  *(void *)(a1 + 64) = 0;
  double result = dbl_264DAC7E8[0];
  *(_OWORD *)a1 = xmmword_264DAC7D8;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)dbl_264DAC7E8;
  return result;
}

uint64_t sub_239852FB0(void **a1)
{
  if (*a1 != &unk_26ECEC1B8) {
    sub_239899548();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_239852FEC(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC1B8) {
    sub_239899574();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_239853028(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC1B8) {
    sub_2398995A0();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_239853064(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC1B8, a1, a2, a3);
}

void *sub_23985307C(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC1B8) {
    sub_2398995CC();
  }
  return sub_23984F10C(a1, a2);
}

double sub_2398530B8(uint64_t a1)
{
  *(_OWORD *)(a1 + 32) = xmmword_264DAC840;
  *(_OWORD *)(a1 + 48) = unk_264DAC850;
  *(_OWORD *)(a1 + 64) = xmmword_264DAC860;
  *(void *)(a1 + 80) = 0;
  *(void *)&double result = 0x26ECEC230;
  *(_OWORD *)a1 = xmmword_264DAC820;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)algn_264DAC830;
  return result;
}

double sub_2398530E4(_OWORD *a1)
{
  a1[6] = xmmword_264DAC8D8;
  a1[7] = unk_264DAC8E8;
  a1[8] = xmmword_264DAC8F8;
  a1[9] = unk_264DAC908;
  a1[2] = xmmword_264DAC898;
  a1[3] = unk_264DAC8A8;
  a1[4] = xmmword_264DAC8B8;
  a1[5] = unk_264DAC8C8;
  *(void *)&double result = 0x26ECEC2A8;
  *a1 = xmmword_264DAC878;
  a1[1] = unk_264DAC888;
  return result;
}

uint64_t sub_239853118(void **a1)
{
  if (*a1 != &unk_26ECEC2A8) {
    sub_2398995F8();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_239853154(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC2A8) {
    sub_239899624();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_239853190(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC2A8) {
    sub_239899650();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_2398531CC(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC2A8, a1, a2, a3);
}

void *sub_2398531E4(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC2A8) {
    sub_23989967C();
  }
  return sub_23984F10C(a1, a2);
}

double sub_239853220(uint64_t a1)
{
  *(void *)&double result = 0x26ECEC320;
  *(_OWORD *)a1 = xmmword_264DAC918;
  *(_OWORD *)(a1 + 16) = unk_264DAC928;
  *(void *)(a1 + 32) = 0;
  return result;
}

uint64_t sub_23985323C(void **a1)
{
  if (*a1 != &unk_26ECEC320) {
    sub_2398996A8();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_239853278(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC320) {
    sub_2398996D4();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_2398532B4(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC320) {
    sub_239899700();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_2398532F0(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC320, a1, a2, a3);
}

void *sub_239853308(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC320) {
    sub_23989972C();
  }
  return sub_23984F10C(a1, a2);
}

double sub_239853344(uint64_t a1)
{
  *(_OWORD *)a1 = xmmword_264DAC940;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)algn_264DAC950;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = xmmword_264DAC960;
  *(void *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_239853368(void **a1)
{
  if (*a1 != &unk_26ECEC398) {
    sub_239899758();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_2398533A4(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC398) {
    sub_239899784();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_2398533E0(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC398) {
    sub_2398997B0();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_23985341C(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC398, a1, a2, a3);
}

void *sub_239853434(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC398) {
    sub_2398997DC();
  }
  return sub_23984F10C(a1, a2);
}

double sub_239853470(_OWORD *a1)
{
  *a1 = xmmword_264DAC978;
  a1[1] = unk_264DAC988;
  double result = 0.0;
  a1[2] = xmmword_264DAC998;
  return result;
}

uint64_t sub_23985348C(void **a1)
{
  if (*a1 != &unk_26ECEC410) {
    sub_239899808();
  }
  return sub_23984B99C((uint64_t)a1);
}

uint64_t sub_2398534C8(void **a1, uint64_t a2)
{
  if (*a1 != &unk_26ECEC410) {
    sub_239899834();
  }
  return sub_23984C3A0((uint64_t)a1, a2);
}

uint64_t sub_239853504(void **a1, void (**a2)(void, void, void))
{
  if (*a1 != &unk_26ECEC410) {
    sub_239899860();
  }
  return sub_23984CF58((uint64_t)a1, a2);
}

void *sub_239853540(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_23984DF34((uint64_t)&unk_26ECEC410, a1, a2, a3);
}

void *sub_239853558(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_26ECEC410) {
    sub_23989988C();
  }
  return sub_23984F10C(a1, a2);
}

void sub_2398538B0(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  double v6 = (void *)MEMORY[0x263F08AE8];
  objc_msgSend_objectForKeyedSubscript_(a2, (const char *)a2, a4, @"regex");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = objc_msgSend_regularExpressionWithPattern_options_error_(v6, v7, v8, v12, 0, 0);
  objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v10, v11, v9, a3);
}

void sub_239854008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_239854048(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_239854058(uint64_t a1)
{
}

uint64_t sub_239854060(uint64_t a1, void *a2, char a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2398540E0;
  v5[3] = &unk_264DADA30;
  char v9 = a3;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  long long v7 = v3;
  return objc_msgSend_enumerateObjectsUsingBlock_(a2, (const char *)a2, *(double *)&v6, v5);
}

void sub_2398540E0(uint64_t a1, void *a2)
{
  id v24 = a2;
  double v5 = objc_msgSend_replacestring_usingRule_atIndex_additonalRules_(*(void **)(a1 + 32), v3, v4, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if ((objc_msgSend_isEqualToString_(v5, v6, v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) & 1) == 0)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      double v10 = objc_msgSend_objectForKeyedSubscript_(v24, v8, v9, @"tag");
      if (objc_msgSend_intValue(v10, v11, v12) == 5)
      {
        CATransform3D v15 = objc_msgSend_objectForKey_(**(void ***)(a1 + 64), v13, v14, @"sup");

        if (!v15)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          objc_msgSend_addEntriesFromDictionary_(*(void **)(*(void *)(a1 + 32) + 24), v8, v9, &unk_26ED1B350);
        }
      }
      else
      {
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      double v16 = objc_msgSend_objectForKeyedSubscript_(v24, v8, v9, @"tag");
      if (objc_msgSend_intValue(v16, v17, v18) == 6)
      {
        double v21 = objc_msgSend_objectForKey_(**(void ***)(a1 + 64), v19, v20, @"sub");

        if (!v21)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          objc_msgSend_addEntriesFromDictionary_(*(void **)(*(void *)(a1 + 32) + 24), v22, v23, &unk_26ED1B3A0);
        }
      }
      else
      {
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
}

void sub_239854C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_239854C34(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v18 = a3;
  id v6 = a2;
  objc_msgSend_setObject_forKeyedSubscript_(v5, v7, v8, MEMORY[0x263EFFA88], @"open");
  double v11 = objc_msgSend_objectForKeyedSubscript_(v6, v9, v10, @"tag");

  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 32), v12, v13, v11, @"type");
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 32), v14, v15, &unk_26ED19A48, @"count");
  objc_msgSend_insertString_atIndex_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v16, v17, v18, 0);
}

void sub_239854FF8(uint64_t a1, void *a2)
{
  void v19[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, @"replace");
  double v9 = objc_msgSend_objectForKeyedSubscript_(v3, v7, v8, @"regex");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend_count(v6, v10, v11))
      {
        double v14 = *(void **)(a1 + 32);
        v18[0] = @"regex";
        v18[1] = @"tag";
        v19[0] = v9;
        v19[1] = &unk_26ED19A60;
        v18[2] = @"replace";
        v19[2] = v6;
        double v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, v13, v19, v18, 3);
        objc_msgSend_addObject_(v14, v16, v17, v15);
      }
    }
  }
}

uint64_t sub_239855BBC(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], a3, a1, @"rawJSON");
  uint64_t v4 = qword_268A057C8;
  qword_268A057C8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t sub_239855DDC(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_internalValidateJSON_completion_(*(void **)(a1 + 32), a2, a3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t sub_239856004(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4 = objc_msgSend_internalSetJSON_(*(void **)(a1 + 32), a2, a3, *(void *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

void sub_23985618C(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
  id v9 = 0;
  double v5 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], a2, a3, v4, 1, &v9);
  id v6 = v9;
  objc_msgSend_validateJSON_completion_(*(void **)(a1 + 32), v7, v8, v5, &unk_26ECEC4A8);
}

void sub_2398564A0(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v5, v6, v18, a3);
  }
  else
  {
    double v7 = objc_msgSend_stringWithFormat_(NSString, v5, v6, @"%@.@%lu", *(void *)(a1 + 40), a3);
    double v11 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 48) + 16), v8, v9, v7);
    if (!v11)
    {
      double v13 = [TMLJSONObjectDerived alloc];
      double v11 = objc_msgSend_initWithParent_keyPath_(v13, v14, v15, *(void *)(a1 + 48), v7);
      objc_msgSend_setObject_forKey_(*(void **)(*(void *)(a1 + 48) + 16), v16, v17, v11, v7);
    }
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v10, v12, v11, a3);
  }
}

void sub_239856834(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v5, v6, v18, a3);
  }
  else
  {
    double v7 = objc_msgSend_stringWithFormat_(NSString, v5, v6, @"%@.@%lu", *(void *)(a1 + 40), a3);
    double v11 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 48) + 16), v8, v9, v7);
    if (!v11)
    {
      double v13 = [TMLJSONObjectDerived alloc];
      double v11 = objc_msgSend_initWithParent_keyPath_(v13, v14, v15, *(void *)(a1 + 48), v7);
      objc_msgSend_setObject_forKey_(*(void **)(*(void *)(a1 + 48) + 16), v16, v17, v11, v7);
    }
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v10, v12, v11, a3);
  }
}

uint64_t sub_239856B84(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], a3, a1, @"@");
  uint64_t v4 = (void *)qword_268A057D8;
  qword_268A057D8 = v3;

  uint64_t v7 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v5, v6, @".");
  uint64_t v8 = qword_268A057E0;
  qword_268A057E0 = v7;
  return MEMORY[0x270F9A758](v7, v8);
}

void sub_239856E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_239856E40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_239856E50(uint64_t a1)
{
}

void sub_239856E58(void *a1, void *a2, unsigned char *a3)
{
  id v16 = a2;
  uint64_t v8 = objc_msgSend_targetUnsafe(v16, v6, v7);
  double v11 = v8;
  if (v8 == (void *)a1[4])
  {
    double v12 = objc_msgSend_keyPath(v16, v9, v10);
    int isEqualToString = objc_msgSend_isEqualToString_(v12, v13, v14, a1[5]);

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
      *a3 = 1;
    }
  }
  else
  {
  }
}

void sub_239857668(uint64_t a1)
{
  size_t v2 = strlen(a838477761ygsql);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a838477761ygsql, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_239858B2C(double a1, uint64_t a2, const char *a3)
{
  v177[58] = *MEMORY[0x263EF8340];
  v176[0] = @"optional";
  v177[0] = &unk_26ECEC528;
  uint64_t v175 = objc_msgSend_stringWithUTF8String_(NSString, a3, a1, "v");
  v176[1] = v175;
  v177[1] = &unk_26ECEC548;
  int v174 = objc_msgSend_stringWithFormat_(NSString, v3, v4, @"%s%s", "v", "@");
  v176[2] = v174;
  v177[2] = &unk_26ECEC568;
  unsigned int v173 = objc_msgSend_stringWithFormat_(NSString, v5, v6, @"%s%s", "v", "B");
  v176[3] = v173;
  v177[3] = &unk_26ECEC588;
  unsigned int v172 = objc_msgSend_stringWithFormat_(NSString, v7, v8, @"%s%s", "v", "f");
  v176[4] = v172;
  v177[4] = &unk_26ECEC5A8;
  uint64_t v171 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"%s%s", "v", "d");
  v176[5] = v171;
  v177[5] = &unk_26ECEC5C8;
  unsigned int v170 = objc_msgSend_stringWithFormat_(NSString, v11, v12, @"%s%s", "v", "q");
  v176[6] = v170;
  v177[6] = &unk_26ECEC5E8;
  uint64_t v169 = objc_msgSend_stringWithFormat_(NSString, v13, v14, @"%s%s", "v", "Q");
  v176[7] = v169;
  v177[7] = &unk_26ECEC608;
  v168 = objc_msgSend_stringWithFormat_(NSString, v15, v16, @"%s%s", "v", "I");
  v176[8] = v168;
  v177[8] = &unk_26ECEC628;
  int v167 = objc_msgSend_stringWithFormat_(NSString, v17, v18, @"%s%s", "v", "{CGSize=dd}");
  v176[9] = v167;
  v177[9] = &unk_26ECEC648;
  v166 = objc_msgSend_stringWithFormat_(NSString, v19, v20, @"%s%s", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v176[10] = v166;
  v177[10] = &unk_26ECEC668;
  unsigned int v165 = objc_msgSend_stringWithFormat_(NSString, v21, v22, @"%s%s", "v", "{CGPoint=dd}");
  v176[11] = v165;
  v177[11] = &unk_26ECEC688;
  v164 = objc_msgSend_stringWithFormat_(NSString, v23, v24, @"%s%s", "v", "{CGAffineTransform=dddddd}");
  v176[12] = v164;
  v177[12] = &unk_26ECEC6A8;
  unsigned int v163 = objc_msgSend_stringWithFormat_(NSString, v25, v26, @"%s%s", "v", "{CATransform3D=dddddddddddddddd}");
  v176[13] = v163;
  v177[13] = &unk_26ECEC6C8;
  v162 = objc_msgSend_stringWithFormat_(NSString, v27, v28, @"%s%s", "v", "{UIEdgeInsets=dddd}");
  v176[14] = v162;
  v177[14] = &unk_26ECEC6E8;
  v161 = objc_msgSend_stringWithFormat_(NSString, v29, v30, @"%s%s", "v", "{_NSRange=QQ}");
  v176[15] = v161;
  v177[15] = &unk_26ECEC708;
  v160 = objc_msgSend_stringWithFormat_(NSString, v31, v32, @"%s%s", "v", "{?=qiIq}");
  v176[16] = v160;
  v177[16] = &unk_26ECEC728;
  v159 = objc_msgSend_stringWithFormat_(NSString, v33, v34, @"%s%s%s", "v", "@", "@");
  v176[17] = v159;
  v177[17] = &unk_26ECEC748;
  unsigned int v158 = objc_msgSend_stringWithFormat_(NSString, v35, v36, @"%s%s%s%s", "v", "@", "@", "@");
  v176[18] = v158;
  v177[18] = &unk_26ECEC768;
  unsigned int v157 = objc_msgSend_stringWithFormat_(NSString, v37, v38, @"%s%s%s%s", "v", "@", "B", "@");
  v176[19] = v157;
  v177[19] = &unk_26ECEC788;
  uint64_t v156 = objc_msgSend_stringWithFormat_(NSString, v39, v40, @"%s%s%s%s", "v", "{?=qiIq}", "{?=qiIq}", "{?=qiIq}");
  v176[20] = v156;
  v177[20] = &unk_26ECEC7A8;
  unsigned int v155 = objc_msgSend_stringWithFormat_(NSString, v41, v42, @"%s%s%s%s%s", "v", "@", "@", "@", "@");
  v176[21] = v155;
  v177[21] = &unk_26ECEC7C8;
  unsigned int v154 = objc_msgSend_stringWithFormat_(NSString, v43, v44, @"%s%s%s", "v", "f", "q");
  v176[22] = v154;
  v177[22] = &unk_26ECEC7E8;
  uint64_t v153 = objc_msgSend_stringWithFormat_(NSString, v45, v46, @"%s%s%s", "v", "@", "I");
  v176[23] = v153;
  v177[23] = &unk_26ECEC808;
  uint64_t v152 = objc_msgSend_stringWithFormat_(NSString, v47, v48, @"%s%s%s", "v", "Q", "@");
  v176[24] = v152;
  v177[24] = &unk_26ECEC828;
  uint64_t v151 = objc_msgSend_stringWithFormat_(NSString, v49, v50, @"%s%s%s", "v", "q", "@");
  v176[25] = v151;
  v177[25] = &unk_26ECEC848;
  unint64_t v150 = objc_msgSend_stringWithFormat_(NSString, v51, v52, @"%s%s%s", "v", "d", "B");
  v176[26] = v150;
  v177[26] = &unk_26ECEC868;
  unsigned int v149 = objc_msgSend_stringWithUTF8String_(NSString, v53, v54, "@");
  v176[27] = v149;
  v177[27] = &unk_26ECEC888;
  uint64_t v148 = objc_msgSend_stringWithFormat_(NSString, v55, v56, @"%s%s", "@", "@");
  v176[28] = v148;
  v177[28] = &unk_26ECEC8A8;
  uint64_t v147 = objc_msgSend_stringWithFormat_(NSString, v57, v58, @"%s%s", "@", "B");
  v176[29] = v147;
  v177[29] = &unk_26ECEC8C8;
  uint64_t v146 = objc_msgSend_stringWithFormat_(NSString, v59, v60, @"%s%s", "@", "f");
  v176[30] = v146;
  v177[30] = &unk_26ECEC8E8;
  unsigned int v145 = objc_msgSend_stringWithFormat_(NSString, v61, v62, @"%s%s", "@", "d");
  v176[31] = v145;
  v177[31] = &unk_26ECEC908;
  unsigned int v144 = objc_msgSend_stringWithFormat_(NSString, v63, v64, @"%s%s", "@", "q");
  v176[32] = v144;
  v177[32] = &unk_26ECEC928;
  uint64_t v143 = objc_msgSend_stringWithFormat_(NSString, v65, v66, @"%s%s", "@", "Q");
  v176[33] = v143;
  v177[33] = &unk_26ECEC948;
  uint64_t v142 = objc_msgSend_stringWithFormat_(NSString, v67, v68, @"%s%s", "@", "I");
  v176[34] = v142;
  v177[34] = &unk_26ECEC968;
  uint64_t v141 = objc_msgSend_stringWithFormat_(NSString, v69, v70, @"%s%s", "@", "{CGSize=dd}");
  v176[35] = v141;
  v177[35] = &unk_26ECEC988;
  size_t v140 = objc_msgSend_stringWithFormat_(NSString, v71, v72, @"%s%s", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v176[36] = v140;
  v177[36] = &unk_26ECEC9A8;
  uint64_t v139 = objc_msgSend_stringWithFormat_(NSString, v73, v74, @"%s%s", "@", "{CGPoint=dd}");
  v176[37] = v139;
  v177[37] = &unk_26ECEC9C8;
  uint64_t v138 = objc_msgSend_stringWithFormat_(NSString, v75, v76, @"%s%s", "@", "{CGAffineTransform=dddddd}");
  v176[38] = v138;
  v177[38] = &unk_26ECEC9E8;
  v137 = objc_msgSend_stringWithFormat_(NSString, v77, v78, @"%s%s", "@", "{CATransform3D=dddddddddddddddd}");
  v176[39] = v137;
  v177[39] = &unk_26ECECA08;
  long long v136 = objc_msgSend_stringWithFormat_(NSString, v79, v80, @"%s%s", "@", "{UIEdgeInsets=dddd}");
  v176[40] = v136;
  v177[40] = &unk_26ECECA28;
  unsigned int v135 = objc_msgSend_stringWithFormat_(NSString, v81, v82, @"%s%s", "@", "{_NSRange=QQ}");
  v176[41] = v135;
  v177[41] = &unk_26ECECA48;
  long long v134 = objc_msgSend_stringWithFormat_(NSString, v83, v84, @"%s%s", "@", "^{CGPath=}");
  v176[42] = v134;
  v177[42] = &unk_26ECECA68;
  unsigned int v133 = objc_msgSend_stringWithFormat_(NSString, v85, v86, @"%s%s%s", "@", "@", "@");
  v176[43] = v133;
  v177[43] = &unk_26ECECA88;
  uint64_t v132 = objc_msgSend_stringWithFormat_(NSString, v87, v88, @"%s%s%s", "@", "@", "d");
  v176[44] = v132;
  v177[44] = &unk_26ECECAA8;
  int v131 = objc_msgSend_stringWithFormat_(NSString, v89, v90, @"%s%s%s%s", "@", "@", "@", "@");
  v176[45] = v131;
  v177[45] = &unk_26ECECAC8;
  uint64_t v130 = objc_msgSend_stringWithFormat_(NSString, v91, v92, @"%s%s%s%s%s", "@", "@", "@", "@", "@");
  v176[46] = v130;
  v177[46] = &unk_26ECECAE8;
  unsigned int v129 = objc_msgSend_stringWithFormat_(NSString, v93, v94, @"%s%s%s%s%s%s", "@", "{CGPoint=dd}", "d", "d", "d", "B");
  v176[47] = v129;
  v177[47] = &unk_26ECECB08;
  uint64_t v128 = objc_msgSend_stringWithFormat_(NSString, v95, v96, @"%s%s%s", "@", "Q", "@");
  v176[48] = v128;
  v177[48] = &unk_26ECECB28;
  uint64_t v127 = objc_msgSend_stringWithUTF8String_(NSString, v97, v98, "^{CGPath=}");
  v176[49] = v127;
  v177[49] = &unk_26ECECB48;
  char v101 = objc_msgSend_stringWithUTF8String_(NSString, v99, v100, "^{CGColor=}");
  v176[50] = v101;
  v177[50] = &unk_26ECECB68;
  uint64_t v104 = objc_msgSend_stringWithUTF8String_(NSString, v102, v103, "^{CGImage=}");
  v176[51] = v104;
  v177[51] = &unk_26ECECB88;
  uint64_t v107 = objc_msgSend_stringWithUTF8String_(NSString, v105, v106, "{CGSize=dd}");
  v176[52] = v107;
  v177[52] = &unk_26ECECBA8;
  unsigned int v110 = objc_msgSend_stringWithUTF8String_(NSString, v108, v109, "B");
  v176[53] = v110;
  v177[53] = &unk_26ECECBC8;
  int v113 = objc_msgSend_stringWithFormat_(NSString, v111, v112, @"%s%s", "{CGSize=dd}", "{CGSize=dd}");
  v176[54] = v113;
  v177[54] = &unk_26ECECBE8;
  int v116 = objc_msgSend_stringWithFormat_(NSString, v114, v115, @"%s%s", "B", "d");
  v176[55] = v116;
  v177[55] = &unk_26ECECC08;
  int v119 = objc_msgSend_stringWithFormat_(NSString, v117, v118, @"%s%s", "d", "@");
  v176[56] = v119;
  v177[56] = &unk_26ECECC28;
  uint64_t v122 = objc_msgSend_stringWithFormat_(NSString, v120, v121, @"%s%s%s", "d", "d", "@");
  v176[57] = v122;
  v177[57] = &unk_26ECECC48;
  uint64_t v125 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v123, v124, v177, v176, 58);
  uint64_t v126 = (void *)qword_268A057F8;
  qword_268A057F8 = v125;
}

uint64_t sub_2398597DC()
{
  return 0;
}

uint64_t sub_2398597E4(int a1, id a2, SEL a3)
{
  return 0;
}

uint64_t sub_239859808(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v14)
  {
    objc_msgSend(v6, a3, 0);
  }
  else
  {
    double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    objc_msgSend(v6, a3, v16);
  }
  return 0;
}

uint64_t sub_2398598C8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend(v6, a3, objc_msgSend_BOOLValue(v9, v10, v11));

  return 0;
}

uint64_t sub_239859930(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_floatValue(v9, v10, v11);
  [v6 a3];

  return 0;
}

uint64_t sub_239859994(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_doubleValue(v9, v10, v11);
  [v6 a3];

  return 0;
}

uint64_t sub_2398599F8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend(v6, a3, objc_msgSend_integerValue(v9, v10, v11));

  return 0;
}

uint64_t sub_239859A60(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend(v6, a3, objc_msgSend_unsignedIntegerValue(v9, v10, v11));

  return 0;
}

uint64_t sub_239859AC8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend(v6, a3, objc_msgSend_unsignedIntValue(v9, v10, v11));

  return 0;
}

uint64_t sub_239859B30(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_CGSizeValue(v9, v10, v11);
  [v6 a3];

  return 0;
}

uint64_t sub_239859B94(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_CGRectValue(v9, v10, v11);
  [v6 a3];

  return 0;
}

uint64_t sub_239859BF8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_CGPointValue(v9, v10, v11);
  [v6 a3];

  return 0;
}

uint64_t sub_239859C5C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = v9;
  if (v9) {
    objc_msgSend_CGAffineTransformValue(v9, v10, v11);
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  objc_msgSend(v6, a3, v14);

  return 0;
}

uint64_t sub_239859CE8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = v9;
  if (v9) {
    objc_msgSend_CATransform3DValue(v9, v10, v11);
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  objc_msgSend(v6, a3, v14);

  return 0;
}

uint64_t sub_239859D7C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_UIEdgeInsetsValue(v9, v10, v11);
  [v6 a3];

  return 0;
}

uint64_t sub_239859DE0(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  uint64_t v12 = objc_msgSend_rangeValue(v9, v10, v11);
  objc_msgSend(v6, a3, v12, v13);

  return 0;
}

uint64_t sub_239859E4C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  uint64_t v12 = v9;
  if (v9) {
    objc_msgSend_CMTimeValue(v9, v10, v11);
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  objc_msgSend(v6, a3, v14);

  return 0;
}

uint64_t sub_239859ED4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v14)
  {
    double v16 = 0;
  }
  else
  {
    double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
  }
  double v17 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 2);
  double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19);
  if (v17 == v21)
  {
    objc_msgSend(v6, a3, v16, 0);
  }
  else
  {
    double v23 = objc_msgSend_objectAtIndexedSubscript_(v7, v20, v22, 2);
    objc_msgSend(v6, a3, v16, v23);
  }
  if (v10 != v14) {

  }
  return 0;
}

uint64_t sub_23985A008(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v32 = a2;
  id v5 = a4;
  double v8 = objc_msgSend_objectAtIndexedSubscript_(v5, v6, v7, 1);
  double v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v10);
  if (v8 == v12)
  {
    double v14 = 0;
  }
  else
  {
    double v14 = objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 1);
  }
  double v15 = objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 2, a3);
  double v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);
  if (v15 == v19)
  {
    double v21 = 0;
  }
  else
  {
    double v21 = objc_msgSend_objectAtIndexedSubscript_(v5, v18, v20, 2);
  }
  double v22 = objc_msgSend_objectAtIndexedSubscript_(v5, v18, v20, 3);
  double v26 = objc_msgSend_null(MEMORY[0x263EFF9D0], v23, v24);
  if (v22 == v26)
  {
    objc_msgSend(v32, v31, v14, v21, 0);
  }
  else
  {
    double v28 = objc_msgSend_objectAtIndexedSubscript_(v5, v25, v27, 3);
    objc_msgSend(v32, v31, v14, v21, v28);
  }
  if (v15 != v19) {

  }
  if (v8 != v12) {
  return 0;
  }
}

uint64_t sub_23985A1A4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, v8, 1);
  double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11);
  if (v9 == v13)
  {
    double v15 = 0;
  }
  else
  {
    double v15 = objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 1);
  }
  double v16 = objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 2);
  uint64_t v19 = objc_msgSend_BOOLValue(v16, v17, v18);
  double v22 = objc_msgSend_objectAtIndexedSubscript_(v6, v20, v21, 3);
  double v26 = objc_msgSend_null(MEMORY[0x263EFF9D0], v23, v24);
  if (v22 == v26)
  {
    objc_msgSend(v5, a3, v15, v19, 0);
  }
  else
  {
    double v28 = objc_msgSend_objectAtIndexedSubscript_(v6, v25, v27, 3);
    objc_msgSend(v5, a3, v15, v19, v28);
  }
  if (v9 != v13) {

  }
  return 0;
}

uint64_t sub_23985A308(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  double v13 = v10;
  if (v10) {
    objc_msgSend_CMTimeValue(v10, v11, v12);
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  double v14 = objc_msgSend_objectAtIndexedSubscript_(v7, v11, v12, 2);
  double v17 = v14;
  if (v14) {
    objc_msgSend_CMTimeValue(v14, v15, v16);
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  double v18 = objc_msgSend_objectAtIndexedSubscript_(v7, v15, v16, 3);
  double v21 = v18;
  if (v18) {
    objc_msgSend_CMTimeValue(v18, v19, v20);
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  objc_msgSend(v6, a3, v25, v24, v23);

  return 0;
}

uint64_t sub_23985A410(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v44 = a2;
  id v6 = a4;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, v8, 1);
  double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11);
  if (v9 == v13)
  {
    uint64_t v43 = 0;
  }
  else
  {
    uint64_t v43 = objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 1);
  }
  double v15 = objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 2);
  uint64_t v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);
  if (v15 == (void *)v19)
  {
    double v42 = 0;
  }
  else
  {
    double v42 = objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20, 2);
  }
  double v21 = objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20, 3, v19);
  uint64_t v25 = objc_msgSend_null(MEMORY[0x263EFF9D0], v22, v23);
  if (v21 == v25)
  {
    double v27 = 0;
  }
  else
  {
    double v27 = objc_msgSend_objectAtIndexedSubscript_(v6, v24, v26, 3);
  }
  double v28 = objc_msgSend_objectAtIndexedSubscript_(v6, v24, v26, 4);
  id v32 = objc_msgSend_null(MEMORY[0x263EFF9D0], v29, v30);
  if (v28 == v32)
  {
    objc_msgSend(v44, a3, v43, v42, v27, 0);
  }
  else
  {
    uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v6, v31, v33, 4);
    int v35 = a3;
    double v36 = v15;
    uint64_t v37 = v13;
    double v38 = v9;
    unint64_t v39 = (void *)v34;
    objc_msgSend(v44, v35, v43, v42, v27, v34);

    double v9 = v38;
    double v13 = v37;
    double v15 = v36;
  }

  if (v21 != v25) {
  if (v15 != v41)
  }

  if (v9 != v13) {
  return 0;
  }
}

uint64_t sub_23985A638(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  objc_msgSend_floatValue(v10, v11, v12);
  int v14 = LODWORD(v13);
  double v16 = objc_msgSend_objectAtIndexedSubscript_(v6, v15, v13, 2);

  uint64_t v19 = objc_msgSend_integerValue(v16, v17, v18);
  LODWORD(v20) = v14;
  objc_msgSend(v7, a3, v19, v20);

  return 0;
}

uint64_t sub_23985A6E4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  int v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v14)
  {
    double v16 = 0;
  }
  else
  {
    double v16 = objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 1);
  }
  double v17 = objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 2);
  objc_msgSend(v7, a3, v16, objc_msgSend_unsignedIntValue(v17, v18, v19));

  if (v10 != v14) {
  return 0;
  }
}

uint64_t sub_23985A7CC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  uint64_t v13 = objc_msgSend_unsignedIntValue(v10, v11, v12);
  double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v14, v15, 2);
  double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18);
  if (v16 == v20)
  {
    objc_msgSend(v6, a3, v13, 0);
  }
  else
  {
    double v22 = objc_msgSend_objectAtIndexedSubscript_(v7, v19, v21, 2);
    objc_msgSend(v6, a3, v13, v22);
  }
  return 0;
}

uint64_t sub_23985A8BC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  uint64_t v13 = objc_msgSend_unsignedIntValue(v10, v11, v12);
  double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v14, v15, 2);
  double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18);
  if (v16 == v20)
  {
    objc_msgSend(v6, a3, v13, 0);
  }
  else
  {
    double v22 = objc_msgSend_objectAtIndexedSubscript_(v7, v19, v21, 2);
    objc_msgSend(v6, a3, v13, v22);
  }
  return 0;
}

uint64_t sub_23985A9AC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  objc_msgSend_doubleValue(v10, v11, v12);
  double v14 = v13;
  double v16 = objc_msgSend_objectAtIndexedSubscript_(v6, v15, v13, 2);

  objc_msgSend(v7, a3, objc_msgSend_BOOLValue(v16, v17, v18), v14);
  return 0;
}

id sub_23985AA58(int a1, id a2, SEL a3)
{
  return [a2 a3];
}

id sub_23985AA64(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v14)
  {
    double v17 = objc_msgSend(v6, a3, 0);
  }
  else
  {
    double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    double v17 = objc_msgSend(v6, a3, v16);
  }
  return v17;
}

id sub_23985AB44(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = objc_msgSend(v6, a3, objc_msgSend_BOOLValue(v9, v10, v11));

  return v12;
}

id sub_23985ABC4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_floatValue(v9, v10, v11);
  double v12 = [v6 a3];

  return v12;
}

id sub_23985AC40(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_doubleValue(v9, v10, v11);
  double v12 = [v6 a3];

  return v12;
}

id sub_23985ACBC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = objc_msgSend(v6, a3, objc_msgSend_integerValue(v9, v10, v11));

  return v12;
}

id sub_23985AD3C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = objc_msgSend(v6, a3, objc_msgSend_unsignedIntegerValue(v9, v10, v11));

  return v12;
}

id sub_23985ADBC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = objc_msgSend(v6, a3, objc_msgSend_unsignedIntValue(v9, v10, v11));

  return v12;
}

id sub_23985AE3C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_CGSizeValue(v9, v10, v11);
  double v12 = [v6 a3];

  return v12;
}

id sub_23985AEB8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_CGRectValue(v9, v10, v11);
  double v12 = [v6 a3];

  return v12;
}

id sub_23985AF34(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_CGPointValue(v9, v10, v11);
  double v12 = [v6 a3];

  return v12;
}

id sub_23985AFB0(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = v9;
  if (v9) {
    objc_msgSend_CGAffineTransformValue(v9, v10, v11);
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  double v13 = objc_msgSend(v6, a3, v15);

  return v13;
}

id sub_23985B054(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  double v12 = v9;
  if (v9) {
    objc_msgSend_CATransform3DValue(v9, v10, v11);
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  double v13 = objc_msgSend(v6, a3, v15);

  return v13;
}

id sub_23985B100(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  objc_msgSend_UIEdgeInsetsValue(v9, v10, v11);
  double v12 = [v6 a3];

  return v12;
}

id sub_23985B17C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  uint64_t v12 = objc_msgSend_rangeValue(v9, v10, v11);
  double v14 = objc_msgSend(v6, a3, v12, v13);

  return v14;
}

id sub_23985B200(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v14)
  {
    double v17 = objc_msgSend(v6, a3, 0);
  }
  else
  {
    double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    double v17 = objc_msgSend(v6, a3, v16);
  }
  return v17;
}

id sub_23985B2E0(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v14)
  {
    double v16 = 0;
  }
  else
  {
    double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
  }
  double v17 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 2);
  double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19);
  if (v17 == v21)
  {
    double v24 = objc_msgSend(v6, a3, v16, 0);
  }
  else
  {
    double v23 = objc_msgSend_objectAtIndexedSubscript_(v7, v20, v22, 2);
    double v24 = objc_msgSend(v6, a3, v16, v23);
  }
  if (v10 != v14) {

  }
  return v24;
}

id sub_23985B434(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v14)
  {
    double v16 = 0;
  }
  else
  {
    double v16 = objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 1);
  }
  double v17 = objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 2);
  objc_msgSend_doubleValue(v17, v18, v19);
  double v20 = objc_msgSend(v7, a3, v16);

  if (v10 != v14) {
  return v20;
  }
}

id sub_23985B530(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v35 = a2;
  id v6 = a4;
  double v9 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, v8, 1);
  uint64_t v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11);
  if (v9 == v13)
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 2, 0);
  }
  else
  {
    uint64_t v33 = objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 1);
    objc_msgSend_objectAtIndexedSubscript_(v6, v15, v16, 2, v33);
  double v17 = };
  double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19);
  if (v17 == v21)
  {
    double v23 = 0;
  }
  else
  {
    double v23 = objc_msgSend_objectAtIndexedSubscript_(v6, v20, v22, 2);
  }
  double v24 = objc_msgSend_objectAtIndexedSubscript_(v6, v20, v22, 3);
  double v28 = objc_msgSend_null(MEMORY[0x263EFF9D0], v25, v26);
  if (v24 == v28)
  {
    int v31 = objc_msgSend(v35, a3, v34, v23, 0);
  }
  else
  {
    double v30 = objc_msgSend_objectAtIndexedSubscript_(v6, v27, v29, 3);
    int v31 = objc_msgSend(v35, a3, v34, v23, v30);
  }
  if (v17 != v21) {

  }
  if (v9 != v13) {
  return v31;
  }
}

id sub_23985B6F0(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v42 = a2;
  id v5 = a4;
  double v8 = objc_msgSend_objectAtIndexedSubscript_(v5, v6, v7, 1);
  double v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v10);
  if (v8 == v12)
  {
    uint64_t v41 = 0;
  }
  else
  {
    uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 1);
  }
  double v14 = objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 2);
  double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v15, v16);
  if (v14 == v18)
  {
    double v40 = 0;
  }
  else
  {
    double v40 = objc_msgSend_objectAtIndexedSubscript_(v5, v17, v19, 2);
  }
  double v20 = objc_msgSend_objectAtIndexedSubscript_(v5, v17, v19, 3);
  double v24 = objc_msgSend_null(MEMORY[0x263EFF9D0], v21, v22);
  if (v20 == v24)
  {
    unint64_t v39 = 0;
  }
  else
  {
    unint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v5, v23, v25, 3);
  }
  double v26 = objc_msgSend_objectAtIndexedSubscript_(v5, v23, v25, 4);
  double v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28);
  if (v26 == v30)
  {
    objc_msgSend(v42, a3, v41, v40, v39, 0);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v29, v31, 4);
    id v32 = v14;
    uint64_t v33 = v12;
    v35 = uint64_t v34 = v8;
    objc_msgSend(v42, a3, v41, v40, v39, v35);
    id v38 = (id)objc_claimAutoreleasedReturnValue();

    double v8 = v34;
    double v12 = v33;
    double v14 = v32;
  }

  if (v20 != v24) {
  if (v14 != v18)
  }

  if (v8 != v12) {
  return v38;
  }
}

id sub_23985B92C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  objc_msgSend_CGPointValue(v10, v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = objc_msgSend_objectAtIndexedSubscript_(v6, v17, v13, 2);
  objc_msgSend_floatValue(v18, v19, v20);
  double v22 = *(float *)&v21;
  double v24 = objc_msgSend_objectAtIndexedSubscript_(v6, v23, v21, 3);
  objc_msgSend_floatValue(v24, v25, v26);
  double v28 = *(float *)&v27;
  double v30 = objc_msgSend_objectAtIndexedSubscript_(v6, v29, v27, 4);
  objc_msgSend_floatValue(v30, v31, v32);
  double v34 = *(float *)&v33;
  double v36 = objc_msgSend_objectAtIndexedSubscript_(v6, v35, v33, 5);

  unint64_t v39 = objc_msgSend(v7, a3, objc_msgSend_BOOLValue(v36, v37, v38), v14, v16, v22, v28, v34);

  return v39;
}

id sub_23985BA7C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  uint64_t v13 = objc_msgSend_unsignedIntegerValue(v10, v11, v12);
  double v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v14, v15, 2);
  double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18);
  if (v16 == v20)
  {
    double v23 = objc_msgSend(v6, a3, v13, 0);
  }
  else
  {
    double v22 = objc_msgSend_objectAtIndexedSubscript_(v7, v19, v21, 2);
    double v23 = objc_msgSend(v6, a3, v13, v22);
  }
  return v23;
}

id sub_23985BB8C(int a1, id a2, SEL a3)
{
  return [a2 a3];
}

id sub_23985BB98(int a1, id a2, SEL a3)
{
  return [a2 a3];
}

id sub_23985BBA4(int a1, id a2, SEL a3)
{
  return [a2 a3];
}

uint64_t sub_23985BBB0(int a1, id a2, SEL a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  [a2 a3];
  return objc_msgSend_valueWithCGSize_(v3, v4, v5);
}

uint64_t sub_23985BBF4(int a1, id a2, SEL a3)
{
  uint64_t v3 = NSNumber;
  id v5 = [a2 a3];
  return objc_msgSend_numberWithBool_(v3, v4, v6, v5);
}

id sub_23985BC3C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  double v6 = (void *)MEMORY[0x263F08D40];
  id v7 = a2;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(a4, v8, v9, 1);
  objc_msgSend_CGSizeValue(v10, v11, v12);
  [v7 a3];
  double v14 = v13;
  double v16 = v15;

  double v18 = objc_msgSend_valueWithCGSize_(v6, v17, v14, v16);

  return v18;
}

id sub_23985BCE0(uint64_t a1, void *a2, const char *a3, void *a4)
{
  double v6 = NSNumber;
  id v7 = a2;
  double v10 = objc_msgSend_objectAtIndexedSubscript_(a4, v8, v9, 1);
  objc_msgSend_doubleValue(v10, v11, v12);
  id v13 = [v7 a3];

  double v16 = objc_msgSend_numberWithBool_(v6, v14, v15, v13);

  return v16;
}

id sub_23985BD74(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v8 = NSNumber;
  double v11 = objc_msgSend_objectAtIndexedSubscript_(v7, v9, v10, 1);
  double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13);
  if (v11 == v15)
  {
    double v17 = 0;
  }
  else
  {
    double v17 = objc_msgSend_objectAtIndexedSubscript_(v7, v14, v16, 1);
  }
  objc_msgSend(v6, a3, v17);
  double v20 = objc_msgSend_numberWithDouble_(v8, v18, v19);
  if (v11 != v15) {

  }
  return v20;
}

id sub_23985BE60(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v8 = NSNumber;
  double v11 = objc_msgSend_objectAtIndexedSubscript_(v7, v9, v10, 1);
  objc_msgSend_doubleValue(v11, v12, v13);
  double v15 = v14;
  double v17 = objc_msgSend_objectAtIndexedSubscript_(v7, v16, v14, 2);
  double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19);
  if (v17 == v21)
  {
    double v23 = 0;
  }
  else
  {
    double v23 = objc_msgSend_objectAtIndexedSubscript_(v7, v20, v22, 2);
  }
  objc_msgSend(v6, a3, v23, v15);
  double v26 = objc_msgSend_numberWithDouble_(v8, v24, v25);
  if (v17 != v21) {

  }
  return v26;
}

char *sub_23985D448(uint64_t a1, id a2, uint64_t a3)
{
  id v5 = a2;
  double v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  uint64_t result = strdup(v8);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8 * a3) = result;
  return result;
}

void sub_23985D488(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 64) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_23985D9E0(Class cls)
{
  if (qword_268A05810 != -1) {
    dispatch_once(&qword_268A05810, &unk_26ECECC68);
  }
  size_t v2 = NSString;
  Name = class_getName(cls);
  objc_msgSend_stringWithUTF8String_(v2, v4, v5, Name);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_((void *)qword_268A05808, v6, v7) & 1) == 0)
  {
    if ((objc_msgSend_hasPrefix_(v12, v8, v9, @"__NSCF") & 1) == 0) {
      class_addProtocol(cls, (Protocol *)&unk_26ED4EE90);
    }
    objc_msgSend_addObject_((void *)qword_268A05808, v10, v11, v12);
  }
}

uint64_t sub_23985DAAC()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 256);
  uint64_t v4 = qword_268A05808;
  qword_268A05808 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t sub_23985DAF0(void *a1)
{
  Class Class = object_getClass(a1);
  return objc_msgSend_tmlMakeJSObjectClass(Class, v2, v3);
}

uint64_t sub_23985DB18(void *a1, const char *a2, double a3)
{
  return objc_msgSend_conformsToProtocol_(a1, a2, a3, &unk_26ED4EE90);
}

id sub_23985DB24(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  double v10 = objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v8, v9, v7, 19);
  double v13 = objc_msgSend_tmlEmitSignalOrCallMethod_withArguments_(a1, v11, v12, v6, v10);

  return v13;
}

id sub_23985DC04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = [TMLJSValueProxy alloc];
  id v8 = objc_msgSend_initWithTarget_keyPath_(v5, v6, v7, a1, v4);

  return v8;
}

void sub_23985E280(uint64_t a1, void *a2, unsigned char *a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_object(v15, v5, v6);

    id v8 = (void *)v7;
    if (!v7) {
      goto LABEL_9;
    }
  }
  else
  {
    id v8 = v15;
  }
  id v16 = v8;
  if (objc_msgSend_hasTMLOwnerContext_(v8, v5, v6, *(void *)(a1 + 32)))
  {
    objc_msgSend_emitTMLSignal_withArguments_(v16, v9, v10, @"finalize", 0);
    objc_msgSend_removeReactiveValuesForTarget_(TMLReactiveValue, v11, v12, v16);
    objc_msgSend_tmlDispose(v16, v13, v14);
    if (!*(void *)(*(void *)(a1 + 32) + 24)) {
      *a3 = 1;
    }
  }
  id v8 = v16;
LABEL_9:
}

void sub_23985E7D4()
{
}

uint64_t sub_23985EE04(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_23985EE84(void *a1)
{
}

void sub_23985F214(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  double v5 = *(void **)(a1 + 32);
  id v8 = objc_msgSend_type(a3, v6, v7);
  LODWORD(v5) = objc_msgSend_isEqualToString_(v5, v9, v10, v8);

  if (v5)
  {
    double v14 = objc_msgSend_objectWithIdentifier_(*(void **)(a1 + 40), v11, v12, v16);
    if (v14) {
      objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v13, v15, v14, v16);
    }
  }
}

id sub_23985F8A0(uint64_t a1, const char *a2, double a3)
{
  double v3 = objc_msgSend_processValue_ofType_selfValue_(*(void **)(a1 + 32), a2, a3, *(void *)(a1 + 40), 16, a2);
  double v6 = objc_msgSend_value(v3, v4, v5);

  return v6;
}

void sub_23985F8FC(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v20 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_registerProperty_forObject_(TMLRuntime, v3, v4, v20, *(void *)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v7 = (void *)MEMORY[0x263EFF940];
      id v8 = NSString;
      uint64_t v9 = objc_opt_class();
      double v12 = objc_msgSend_stringWithFormat_(v8, v10, v11, @"Unsupported declaration type %@", v9);
      uint64_t v13 = *(void *)(a1 + 40);
      double v21 = @"identifier";
      v22[0] = v13;
      id v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, v15, v22, &v21, 1);
      objc_msgSend_exceptionWithName_reason_userInfo_(v7, v17, v18, @"TMLRuntimeException", v12, v16);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v19);
    }
    objc_msgSend_registerSignal_forObject_(TMLRuntime, v5, v6, v20, *(void *)(a1 + 32));
  }
}

id sub_23985FA78(uint64_t a1, const char *a2, double a3)
{
  return (id)objc_msgSend_createObjectFromMetaObject_parent_(*(void **)(a1 + 32), a2, a3, a2, *(void *)(a1 + 40));
}

void sub_23985FAA4(uint64_t a1, void *a2, void *a3)
{
  v134[1] = *MEMORY[0x263EF8340];
  id v132 = a2;
  id v5 = a3;
  id v8 = objc_msgSend_signalName(v5, v6, v7);
  id v9 = *(id *)(a1 + 32);
  uint64_t v12 = objc_msgSend_length(v132, v10, v11);
  if (objc_msgSend_rangeOfString_options_range_(v132, v13, v14, @".", 4, 0, v12) != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v17 = objc_msgSend_substringToIndex_(v132, v15, v16);
    uint64_t v20 = objc_msgSend_tmlValueForKeyPath_(v9, v18, v19, v17);

    id v9 = (id)v20;
  }
  double v22 = objc_msgSend_signal_forObject_(TMLRuntime, v15, v16, v8, v9);
  if (!v22 && (objc_msgSend_hasSuffix_(v132, v21, v23, @"Changed") & 1) == 0)
  {
    int v116 = (void *)MEMORY[0x263EFF940];
    int v117 = NSString;
    double v118 = objc_msgSend_type(*(void **)(a1 + 40), v24, v23);
    double v121 = objc_msgSend_stringWithFormat_(v117, v119, v120, @"Undeclared signal %@ for type %@", v132, v118);
    uint64_t v122 = *(void *)(a1 + 48);
    unsigned int v133 = @"identifier";
    v134[0] = v122;
    uint64_t v125 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v123, v124, v134, &v133, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v116, v126, v127, @"TMLRuntimeException", v121, v125);
    id v128 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v128);
  }
  double v25 = NSString;
  double v26 = *(void **)(a1 + 48);
  double v27 = v26;
  double v28 = v132;
  if (!v26)
  {
    uint64_t v29 = objc_msgSend_stringWithFormat_(NSString, (const char *)v132, v23, @"obj_%p", *(void *)(a1 + 32));
    double v28 = v132;
    double v27 = (void *)v29;
  }
  double v30 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v28, (const char *)v28, v23, @".", @"_dot_");
  double v33 = objc_msgSend_stringWithFormat_(v25, v31, v32, @"$%@_%@", v27, v30);

  if (!v26) {
  uint64_t v130 = objc_msgSend_stringWithFormat_(NSString, v34, v35, @"_%@", v33);
  }
  double v38 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 56) + 72), v36, v37);
  int v131 = v38;
  if (!v38 || (uint64_t v41 = v38, objc_msgSend_isUndefined(v38, v39, v40)))
  {
    if (v22)
    {
      id v42 = objc_msgSend_parameters(v22, v39, v40);
      uint64_t v45 = objc_msgSend_valueForKey_(v42, v43, v44, @"propertyName");
      double v48 = objc_msgSend_componentsJoinedByString_(v45, v46, v47, @",");
    }
    else
    {
      double v48 = 0;
    }
    id v129 = v5;
    double v50 = objc_msgSend_functionBody(v5, v39, v40);
    if (qword_268A05820 != -1) {
      dispatch_once(&qword_268A05820, &unk_26ECECC88);
    }
    double v52 = (void *)qword_268A05818;
    uint64_t v53 = objc_msgSend_length(v50, v49, v51);
    double v56 = objc_msgSend_firstMatchInString_options_range_(v52, v54, v55, v50, 0, 0, v53);
    unsigned int v59 = v56;
    if (v56 && objc_msgSend_range(v56, v57, v58) != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v60 = objc_msgSend_rangeAtIndex_(v59, v57, v58, 1);
      uint64_t v63 = objc_msgSend_substringWithRange_(v50, v61, v62, v60, v61);

      uint64_t v66 = objc_msgSend_range(v59, v64, v65);
      objc_msgSend_range(v59, v67, v68);
      uint64_t v71 = objc_msgSend_substringFromIndex_(v50, v69, v70, &v69[v66]);

      double v50 = (void *)v71;
      double v48 = (void *)v63;
    }
    if (objc_msgSend_length(v48, v57, v58))
    {
      objc_msgSend_stringByAppendingString_(@",", v72, v73, v48);
      double v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v74 = &stru_26ECF02A8;
    }

    unsigned int v77 = objc_msgSend_stringWithFormat_(NSString, v75, v76, @"%@._%@ = function ($self%@)%@", *(void *)(*(void *)(a1 + 56) + 80), v33, v74, v50);

    id v80 = (id)objc_msgSend_evaluateScript_(*(void **)(*(void *)(a1 + 56) + 48), v78, v79, v77);
    uint64_t v83 = objc_msgSend_stringWithFormat_(NSString, v81, v82, @"%1$@.%2$@ = %1$@._%2$@.bind(%1$@)", *(void *)(*(void *)(a1 + 56) + 80), v33);
    id v86 = (id)objc_msgSend_evaluateScript_(*(void **)(*(void *)(a1 + 56) + 48), v84, v85, v83);

    id v5 = v129;
    uint64_t v41 = v131;
  }
  if (v22)
  {
    uint64_t v87 = [TMLScriptSignalHandler alloc];
    uint64_t v90 = objc_msgSend_returnType(v22, v88, v89);
    uint64_t v93 = objc_msgSend_initWithFunctionName_returnType_target_context_(v87, v91, v92, v33, v90, v9, *(void *)(a1 + 56));
    objc_msgSend_setTMLHandler_forSignal_(v9, v94, v95, v93, v8);
  }
  else
  {
    uint64_t v98 = objc_msgSend_length(v8, v39, v40);
    char v101 = objc_msgSend_substringToIndex_(v8, v99, v100, v98 - 7);
    id v104 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v102, v103, v101, v9, 0);
    uint64_t v105 = [TMLPropertyChangedScriptSignalHandler alloc];
    uint64_t v106 = *(void *)(a1 + 56);
    objc_msgSend_bindingForTarget_withKeyPath_(TMLBinding, v107, v108, v9, v101);
    double v109 = v8;
    v111 = id v110 = v5;
    uint64_t v93 = objc_msgSend_initWithFunctionName_context_binding_(v105, v112, v113, v33, v106, v111);

    id v5 = v110;
    id v8 = v109;

    uint64_t v41 = v131;
    objc_msgSend_setTMLHandler_forSignal_(v9, v114, v115, v93, v109);
  }
  objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 56) + 40), v96, v97, v93);
}

uint64_t sub_239860094(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], a3, a1, @"^function[\\s\\w\\d_]*\\(([^\\)]*)\\"), 0, 0);
  uint64_t v4 = qword_268A05818;
  qword_268A05818 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

void sub_239860260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_239860278(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_239860288(uint64_t a1)
{
}

void sub_239860290(uint64_t a1, void *a2)
{
  v40[2] = *MEMORY[0x263EF8340];
  id v38 = a2;
  id v5 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v3, v4, v38);
  double v6 = *(void **)(a1 + 40);
  id v9 = objc_msgSend_propertyWithKeyPath_forObject_(TMLRuntime, v7, v8, v38, *(void *)(a1 + 48));
  uint64_t v12 = objc_msgSend_type(v9, v10, v11);
  double v15 = objc_msgSend_processValue_ofType_selfValue_(v6, v13, v14, v5, v12, *(void *)(a1 + 48));

  if (!v15)
  {
    double v25 = (void *)MEMORY[0x263EFF940];
    double v26 = NSString;
    uint64_t v27 = objc_opt_class();
    double v30 = objc_msgSend_stringWithFormat_(v26, v28, v29, @"Unsupported value type %@", v27);
    uint64_t v31 = *(void *)(a1 + 48);
    v39[0] = @"object";
    v39[1] = @"property";
    v40[0] = v31;
    v40[1] = v38;
    double v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, v33, v40, v39, 2);
    objc_msgSend_exceptionWithName_reason_userInfo_(v25, v35, v36, @"TMLRuntimeException", v30, v34);
    id v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v37);
  }
  double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);

  if (v15 == v18)
  {

    double v15 = 0;
  }
  objc_msgSend_setValue_forKeyPath_(*(void **)(a1 + 56), v19, v20, v15, v38);
  objc_msgSend_setTMLValue_forKeyPath_(*(void **)(a1 + 48), v21, v22, v15, v38);
  if (objc_msgSend_isEqualToString_(v38, v23, v24, @"tmlState")) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v15);
  }
}

void sub_239860C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_239860C9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = objc_msgSend_rangeOfString_(v3, v4, v5, @".");
  uint64_t v8 = v7;
  id v9 = v3;
  uint64_t v12 = v9;
  id v13 = v9;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend_substringToIndex_(v9, v10, v11, v6),
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        objc_msgSend_substringFromIndex_(v12, v14, v15, v6 + v8),
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v25 = *(void **)(a1 + 40);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    void v36[2] = sub_239860E88;
    v36[3] = &unk_264DADCD8;
    id v13 = v13;
    id v37 = v13;
    objc_copyWeak(&v38, (id *)(a1 + 48));
    objc_copyWeak(&v39, (id *)(a1 + 56));
    double v28 = objc_msgSend_referenceWithBlock_(TMLReference, v26, v27, v36);
    objc_msgSend_addObject_(v25, v29, v30, v28);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v38);
    double v19 = v37;
  }
  else
  {
    double v19 = (void *)v16;
    if (objc_msgSend_isEqualToString_(v13, v17, v18, @"self"))
    {
      uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 48));
    }
    else
    {
      uint64_t WeakRetained = objc_msgSend_objectWithIdentifier_(*(void **)(a1 + 32), v20, v21, v13);
    }
    uint64_t v31 = (void *)WeakRetained;
    double v32 = *(void **)(a1 + 40);
    double v33 = objc_msgSend_bindingForTarget_withKeyPath_(TMLBinding, v23, v24, WeakRetained, v19);
    objc_msgSend_addObject_(v32, v34, v35, v33);
  }
}

void sub_239860E6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_239860E88(void **a1, const char *a2, double a3)
{
  if (objc_msgSend_isEqualToString_(a1[4], a2, a3, @"self"))
  {
    uint64_t WeakRetained = objc_loadWeakRetained(a1 + 5);
  }
  else
  {
    id v5 = objc_loadWeakRetained(a1 + 6);
    uint64_t WeakRetained = objc_msgSend_objectWithIdentifier_unwrapWeak_(v5, v6, v7, a1[4], 0);
  }
  return WeakRetained;
}

void sub_2398611DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raiseJSException_(v8, v6, v7, v3);
}

uint64_t sub_239861240(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_requireModule_forJSContext_(TMLJSEnvironment, a2, a3, a2, *(void *)(*(void *)(a1 + 32) + 48));
}

id sub_239861340(double a1, uint64_t a2, const char *a3)
{
  uint64_t v4 = objc_msgSend_validCurrentContext(TMLJSEnvironment, a3, a1);
  double v7 = (void *)v4;
  if (v4)
  {
    id v8 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(v4 + 56), v5, v6, a3);
    double v11 = objc_msgSend_convertTmlValue_(TMLJSEnvironment, v9, v10, v8);
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

void sub_239861418()
{
}

id sub_239861428(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v5 = objc_msgSend_validCurrentContext(TMLJSEnvironment, v3, v4);
  id v8 = objc_msgSend_objectWithIdentifier_(v5, v6, v7, v2);

  return v8;
}

id sub_2398614F4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v6, v7);
  id v8 = (void **)objc_claimAutoreleasedReturnValue();
  double v11 = objc_msgSend_objectAtIndexedSubscript_(v8[7], v9, v10, 0);
  double v14 = objc_msgSend_convertTmlValue_(TMLJSEnvironment, v12, v13, v11);

  Class Class = object_getClass(v14);
  if (class_isMetaClass(Class))
  {
    double v18 = objc_msgSend_tmlGetMethod_(v14, v16, v17, v4);
    char v21 = objc_msgSend_classMethod(v18, v19, v20);

    if ((v21 & 1) == 0)
    {
      id v22 = objc_alloc((Class)v14);

      double v14 = v22;
    }
  }
  double v23 = objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v16, v17, v5, 16);
  double v26 = objc_msgSend_tmlCallMethod_withArguments_(v14, v24, v25, v4, v23);

  return v26;
}

id sub_239861680(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  double v13 = objc_msgSend_validCurrentContext(TMLJSEnvironment, v11, v12);
  if (objc_msgSend_length(v9, v14, v15) && (objc_msgSend_isEqualToString_(v9, v16, v17, @"init") & 1) == 0)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_239861844;
    void v23[3] = &unk_264DADC10;
    id v4 = &v24;
    id v24 = v9;
    id v5 = &v25;
    id v25 = v10;
    char v18 = 1;
    objc_msgSend_createObjectWithIdentifier_ofType_initializer_(TMLRuntime, v19, v20, @"$new$", v8, v23);
  }
  else
  {
    char v18 = 0;
    objc_msgSend_createObjectWithIdentifier_ofType_initializer_(TMLRuntime, v16, v17, @"$new$", v8, 0);
  char v21 = };
  if (v18)
  {
  }
  return v21;
}

id sub_239861844(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v6 = objc_msgSend_tmlGetMethod_(v3, v4, v5, *(void *)(a1 + 32));
  char v9 = objc_msgSend_classMethod(v6, v7, v8);

  if ((v9 & 1) == 0)
  {
    id v12 = objc_alloc((Class)v3);

    id v3 = v12;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v10, v11, *(void *)(a1 + 40), 16);
  double v17 = objc_msgSend_tmlCallMethod_withArguments_(v3, v15, v16, v13, v14);

  return v17;
}

id sub_2398618F8(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v5 = objc_msgSend_validCurrentContext(TMLJSEnvironment, v3, v4);
  objc_msgSend_resetException(v5, v6, v7);

  return v2;
}

id sub_23986194C(double a1, uint64_t a2, const char *a3)
{
  objc_msgSend_validCurrentContext(TMLJSEnvironment, a3, a1);
  id v3 = (id *)objc_claimAutoreleasedReturnValue();
  id v4 = v3[9];

  return v4;
}

id sub_239861C20(double a1, uint64_t a2, const char *a3)
{
  return (id)objc_msgSend_requireModule_(TMLRuntime, a3, a1, a3);
}

uint64_t sub_239861C4C(double a1)
{
  return MEMORY[0x270F9A6D0](TMLRuntime, sel_registerProtocol_, a1);
}

uint64_t sub_239861C58(double a1, uint64_t a2, const char *a3)
{
  return objc_msgSend_registerClass_(TMLRuntime, a3, a1);
}

void sub_239861C64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = sub_239861D34;
  v12[3] = &unk_264DAB8B8;
  v12[4] = v7;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  objc_msgSend_runInContext_block_(TMLJSEnvironment, v10, v11, v7, v12);
}

void sub_239861D34(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v4 + 48);
  uint64_t v7 = NSString;
  uint64_t v8 = *(void *)(v4 + 80);
  id v9 = objc_msgSend_functionBody(*(void **)(a1 + 48), a2, a3);
  id v12 = objc_msgSend_stringWithFormat_(v7, v10, v11, @"%@._%@ = %@", v8, v5, v9);
  id v15 = (id)objc_msgSend_evaluateScript_(v6, v13, v14, v12);

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  char v18 = *(void **)(v16 + 48);
  objc_msgSend_stringWithFormat_(NSString, v19, v20, @"%1$@.%2$@ = %1$@._%2$@.bind(%1$@)", *(void *)(v16 + 80), v17);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = (id)objc_msgSend_evaluateScript_(v18, v21, v22, v24);
}

void sub_239861E24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v14 = v3;
  uint64_t v7 = objc_msgSend_identifier(v3, v5, v6);
  id v10 = objc_msgSend_existingObjectWithIdentifier_(v4, v8, v9, v7);

  if (v10) {
    id v13 = (id)objc_msgSend_createObjectFromMetaObject_parent_(*(void **)(a1 + 32), v11, v12, v14, 0);
  }
}

void sub_239861EB8(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x263EF8340];
  id v30 = a2;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_classForObject_(TMLRuntime, v6, v7, v5);

  if (!v8)
  {
    char v18 = (void *)MEMORY[0x263EFF940];
    double v19 = NSString;
    uint64_t v20 = objc_opt_class();
    id v23 = objc_msgSend_stringWithFormat_(v19, v21, v22, @"Attempt to add object of undeclared class %@", v20);
    uint64_t v31 = @"object";
    v32[0] = v5;
    double v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, v25, v32, &v31, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v18, v27, v28, @"TMLRuntimeException", v23, v26);
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v29);
  }
  double v11 = objc_msgSend_objects(*(void **)(*(void *)(a1 + 32) + 8), v9, v10);
  id v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, v13, v30);

  if (v14) {
    id v17 = (id)objc_msgSend_createObjectFromMetaObject_parent_(*(void **)(a1 + 32), v15, v16, v14, 0);
  }
}

void sub_239862200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23986221C(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_msgSend_stringWithFormat_(NSString, v3, v4, @"var _tmlF=function() { var _tmlResult=%@; return _tmlResult; }; var _tmlResult = _tmlF.call(this.%@); _tmlResult;",
    *(void *)(a1 + 48),
    *(void *)(*(void *)(a1 + 32) + 80));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_evaluateScript_(*(void **)(*(void *)(a1 + 32) + 48), v5, v6, v12);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v2;
}

void sub_2398624A4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    objc_msgSend_raiseException_(TMLExceptionHandler, v13, v14, v12);
    objc_end_catch();
    JUMPOUT(0x239862468);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_239862500(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4 = objc_msgSend_callWithArguments_(*(void **)(a1 + 32), a2, a3, *(void *)(a1 + 40));
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x270F9A758](v4, v6);
}

uint64_t sub_239862638(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](a1, sel_initWithName_, a2);
}

uint64_t sub_239862644(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = sub_239862770();
  uint64_t v8 = objc_msgSend_initWithName_target_selector_(a1, v6, v7, v4, v5, sel_action_);

  return v8;
}

uint64_t sub_2398626A8(void *a1)
{
  id v2 = sub_239862770();
  objc_msgSend_setTarget_(a1, v3, v4, v2);

  return objc_msgSend_setSelector_(a1, v5, v6, sel_action_);
}

uint64_t sub_239862700(void *a1, const char *a2, double a3)
{
  return objc_msgSend_setTarget_(a1, a2, a3, 0);
}

id sub_239862770()
{
  if (qword_268A05830 != -1) {
    dispatch_once(&qword_268A05830, &unk_26ECECDE8);
  }
  id v0 = (void *)qword_268A05828;
  return v0;
}

uint64_t sub_2398627C4()
{
  id v0 = objc_alloc_init(TMLUIAccessibilityCustomActionTarget);
  uint64_t v1 = qword_268A05828;
  qword_268A05828 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_2398628C4(uint64_t a1)
{
  size_t v2 = strlen(a83847776m7ulqb);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776m7ulqb, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_239862AFC(double a1, uint64_t a2, void *a3)
{
  uint64_t v3 = objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  v10[0] = MEMORY[0x23ECA7530](v3);
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  uint64_t v8 = objc_msgSend_value_withObjCType_(MEMORY[0x263F08D40], v7, v10[0], v10, "{?={CLLocationCoordinate2D=dd}{?=dd}}");
  return v8;
}

id sub_239862B70(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v7 = objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  id v8 = objc_alloc(MEMORY[0x263F109E0]);
  objc_msgSend_MKCoordinateValue(v4, v9, v10);
  double v12 = v11;
  double v14 = v13;

  double v16 = objc_msgSend_initWithCoordinate_addressDictionary_(v8, v15, v12, v7, v14);
  return v16;
}

id sub_239862C18(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v7 = objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  id v8 = objc_alloc(MEMORY[0x263F109E0]);
  objc_msgSend_MKCoordinateValue(v4, v9, v10);
  double v12 = v11;
  double v14 = v13;

  double v16 = objc_msgSend_initWithCoordinate_addressDictionary_(v8, v15, v12, v7, v14);
  id v17 = objc_alloc(MEMORY[0x263F10960]);
  uint64_t v20 = objc_msgSend_initWithPlacemark_(v17, v18, v19, v16);

  return v20;
}

id sub_239862CE0(double a1, uint64_t a2, void *a3)
{
  objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  MKMapPoint v6 = MKMapPointForCoordinate(v8);
  id v4 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v3, v6.x, &v6, "{?=dd}");
  return v4;
}

id sub_239862D38(double a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  v8.x = 0.0;
  v8.y = 0.0;
  objc_msgSend_getValue_(a3, (const char *)a3, a1, &v8);
  CLLocationCoordinate2D v4 = MKCoordinateForMapPoint(v8);
  MKMapPoint v6 = objc_msgSend_valueWithMKCoordinate_(v3, v5, v4.latitude, v4.longitude);
  return v6;
}

void sub_239862D98(uint64_t a1, void *a2, void *a3)
{
  v11.double x = 0.0;
  v11.double y = 0.0;
  id v4 = a3;
  objc_msgSend_getValue_(a2, v5, v6, &v11);
  double x = v11.x;
  double y = v11.y;
  v11.double x = 0.0;
  v11.double y = 0.0;
  objc_msgSend_getValue_(v4, v9, v10, &v11);

  v12.double x = x;
  v12.double y = y;
  MKMetersBetweenMapPoints(v12, v11);
}

id sub_239862E08(uint64_t a1, void *a2)
{
  memset(&v5, 0, sizeof(v5));
  objc_msgSend_getValue_(a2, (const char *)a2, 0.0, &v5);
  MKCoordinateRegion v7 = MKCoordinateRegionForMapRect(v5);
  MKMapRect v5 = (MKMapRect)v7;
  uint64_t v3 = objc_msgSend_value_withObjCType_(MEMORY[0x263F08D40], v2, v7.center.latitude, &v5, "{?={CLLocationCoordinate2D=dd}{?=dd}}");
  return v3;
}

id sub_239862E78()
{
  id v0 = objc_alloc_init(MEMORY[0x263F109E8]);
  return v0;
}

id sub_239862EA8(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  MKCoordinateRegion v7 = objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  if (objc_msgSend_conformsToProtocol_(v4, v8, v9, &unk_26ED4F078))
  {
    id v10 = objc_alloc(MEMORY[0x263F109D0]);
    double v13 = objc_msgSend_initWithAnnotation_reuseIdentifier_(v10, v11, v12, v4, v7);
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

id sub_239862F44(uint64_t a1, void *a2, void *a3)
{
  memset(&v13, 0, sizeof(v13));
  id v4 = a3;
  objc_msgSend_getValue_(a2, v5, v6, &v13);
  MKMapPoint origin = v13.origin;
  MKMapSize size = v13.size;
  memset(&v13, 0, sizeof(v13));
  objc_msgSend_getValue_(v4, v9, 0.0, &v13);

  v15.MKMapPoint origin = origin;
  v15.MKMapSize size = size;
  MKMapRect v16 = MKMapRectUnion(v15, v13);
  MKMapRect v13 = v16;
  MKMapPoint v11 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v10, v16.origin.x, &v13, "{?={?=dd}{?=dd}}");
  return v11;
}

id sub_239863008(double a1, double a2, uint64_t a3, const char *a4)
{
  *(double *)double v6 = a1;
  *(double *)&v6[1] = a2;
  id v4 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], a4, a1, v6, "{?=dd}");
  return v4;
}

id sub_239863054(uint64_t a1, void *a2, void *a3)
{
  v11[0] = 0uLL;
  id v4 = a3;
  objc_msgSend_getValue_(a2, v5, v6, v11);
  long long v12 = 0uLL;
  objc_msgSend_getValue_(v4, v7, *(double *)v11, &v12);

  v11[1] = v12;
  double v9 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v8, *(double *)&v12, v11, "{?={?=dd}{?=dd}}");
  return v9;
}

id sub_2398630E4(uint64_t a1, void *a2)
{
  size_t v2 = (objc_class *)MEMORY[0x263F10910];
  id v3 = a2;
  id v4 = [v2 alloc];
  MKCoordinateRegion v7 = objc_msgSend_initWithRequest_(v4, v5, v6, v3);

  return v7;
}

void sub_2398638C8(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_bind_(v5, v3, v4, *(void *)(a1 + 32));
  }
}

void sub_239863A24(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_unbind_(v5, v3, v4, *(void *)(a1 + 32));
  }
}

uint64_t sub_239863C18()
{
  id v0 = (void *)MEMORY[0x263EFFA08];
  Class v1 = NSClassFromString(&cfstr_Nsparagraphsty.isa);
  Class v2 = NSClassFromString(&cfstr_Nsmutableparag.isa);
  Class v3 = NSClassFromString(&cfstr_Nshashtable.isa);
  Class v4 = NSClassFromString(&cfstr_Nsmaptable.isa);
  uint64_t v7 = objc_msgSend_setWithObjects_(v0, v5, v6, v1, v2, v3, v4, 0);
  uint64_t v8 = qword_268A05840;
  qword_268A05840 = v7;
  return MEMORY[0x270F9A758](v7, v8);
}

uint64_t sub_239863F1C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_object(a2, v5, v6);
  id v10 = objc_msgSend_object(v4, v8, v9);

  uint64_t v13 = objc_msgSend_bindingOrder(v7, v11, v12);
  uint64_t v16 = objc_msgSend_bindingOrder(v10, v14, v15);
  uint64_t v17 = 1;
  if (v13 <= v16) {
    uint64_t v17 = -1;
  }
  if (v13 == v16) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v17;
  }

  return v18;
}

void sub_239864138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_239864154(uint64_t a1, void *a2, void *a3, void *a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (id *)(a1 + 32);
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  uint64_t v18 = *MEMORY[0x263F081B8];
  double v14 = v7;
  if (!v7)
  {
    double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v19[0] = v14;
  double v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, v13, v19, &v18, 1);
  objc_msgSend_tmlObserveValueForKeyPath_ofObject_change_context_(WeakRetained, v16, v17, v9, v10, v15, 0);

  if (!v7) {
}
  }

void sub_239864628(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    atomic_fetch_and_explicit((atomic_uchar *volatile)(v2 + 36), 0xBFu, memory_order_relaxed);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_23986466C(uint64_t a1, void *a2, double a3)
{
  objc_msgSend_object(a2, (const char *)a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindingValueChanged_(v6, v4, v5, *(void *)(a1 + 32));
}

void sub_239864858(uint64_t a1)
{
  size_t v2 = strlen("83847776s0j3!zkfK-)2h:2TV^mQjh-G}KngWNH+.Gu1*uAUK{S<zKD.Y(/7H5Dk##p*b^zByvCIFz=5L:hb*?He2J3Q)h^3EyS#ZwuYr&2.QuiXhOcL$TbCzbb8&QVFp1V@#D.^+4{jk{z4l[3:&+D8U^>LBGd+Y}pF?v(L3to+LnLR&{By/uia@}15x(n37zGFoTB7ol8Acb/jzw0d{BAh8kxbyT[bmkrfB.tt#B97#7nP5Y&v{%E[z/ex+A::325^AA0A+PA7a@gH)x>g^)Bzku3wPwy/B98CpzF6^!nc67z0sxocpdYtBwPzi?BzkVha%471wmoN>nP5SYA=$(c5!mVnl$7gGnP5SYA=$(ca}$v*x(n37zGDG%nLR&{By/ui7Y+*a3jZ=/By/uiqE%]*z/fSc5!ESfnP5SYzGF=/B8V5nB7Df?a@HZ#xl4{kA7KOKzGGP8x>qq$26j)bx(mMc6BCgYwmYU2x>z6<AUnN$BAh8kxcFu66LRDbwO#PXvqYQ(x(mMZByxolA$ON?zGDY@a}L7/wnc6}v@#B6zw04=zGFzI3yp=23q0#>xM4{kv%8(qapnK1B7GwTv@#Bdx([Rk4O/@5B7GwTv@#Bdx([Rq0u@i+25d%%wO#P52Uv=.zGGDcBqL3lpym!IzFsh]x([2*B7GwTv@#Bdx([Ri5e(O%40uS5A:-E1x)aijC[HPZq=N)IAZshSx)aijC{i#qzFsh]x([2*B7GwTv@#Bdx([RYnc66c3j/Z6r=qXZwM9nXA=+/lBrRXi5nu39z!0i$x(v(=xMvK5wFbh*BAh8kxbyT[7ZZK&xM4{kv%8(a3q0#>xM4{kv%8(g0u@o^3tB3ZzGGP8x>qq$22n8%ry]N}0z0kv1YXb!x(>*imSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776s0j3!zkfK-)2h:2TV^mQjh-G}KngWNH+.Gu1*uAUK{S<zKD.Y(/7H5Dk##p*b^zByvCIFz=5L:hb*?He2J3Q)h^3EyS#ZwuYr&2.QuiXhOcL$TbCzbb8&QVFp1V@#D.^+4{jk{z4l[3:&+D8U^>LBGd+Y}pF?v(L3to+LnLR&{By/uia@}15x(n37zGFoTB7ol8Acb/jzw0d{BAh8kxbyT[bmkrfB.tt#B97#7nP5Y&v{%E[z/ex+A::325^AA0A+PA7a@gH)x>g^)Bzku3wPwy/B98CpzF6^!nc67z0sxocpdYtBwPzi?BzkVha%471wmoN>nP5SYA=$(c5!mVnl$7gGnP5SYA=$(ca}$v*x(n37zGDG%nLR&{By/ui7Y+*a3jZ=/By/uiqE%]*z/fSc5!ESfnP5SYzGF=/B8V5nB7Df?a@HZ#xl4{kA7KOKzGGP8x>qq$26j)bx(mMc6BCgYwmYU2x>z6<AUnN$BAh8kxcFu66LRDbwO#PXvqYQ(x(mMZByxolA$ON?zGDY@a}L7/wnc6}v@#B6zw04=zGFzI3yp=23q0#>xM4{kv%8(qapnK1B7GwTv@#Bdx([Rk4O/@5B7GwTv@#Bdx([Rq0u@i+25d%%wO#P52Uv=.zGGDcBqL3lpym!IzFsh]x([2*B7GwTv@#Bdx([Ri5e(O%40uS5A:-E1x)aijC[HPZq=N)IAZshSx)aijC{i#qzFsh]x([2*B7GwTv@#Bdx([RYnc66c3j/Z6r=qXZwM9nXA=+/lBrRXi5nu39z!0i$x(v(=xMvK5wFbh*BAh8kxbyT[7ZZK&xM4{kv%8(a3q0#>xM4{kv%8(g0u@o^3tB3ZzGGP8x>qq$22n8%ry]N}0z0kv1YXb!x(>*imSiA!wmoN]z/b", v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_2398649B4(uint64_t a1)
{
  size_t v2 = strlen("83847776lM1]&opQk-ot+%a[y-rx5FY!sq9Tgl^}zO0MZP4w<vIG3</-=ocvnGzt^xkPzSl>1y#=Pd1p{Y(!Ynr]&ezW+ypta+55xlq1SZD&CMeW%nU:k!!nHyzcE}rm%b.K:l(0!pnlQysWG[Hn??6VmId3}-UVK8$4!Zd73CcrC5(8v]CYWImB7]MglVl<:wQ5qvc<?bwx>g</Bwca-xjVdal3uWJy**^?wKHlNAbn%do(BMN5^8&=BrR?m7K6O7xjVfJv@#BdwKHlNAbn%do(BMN5^8&=BqL3lsQDl{x>g</Bwlg*x(e0fq!ZL?mSirnx(!lfvr>N=wmVqT8wiw+wnca7y*?P-z!9z(18hT{a%q8zwm]E}o<@oXzfoX]x)KtWz/OlWB8U@7C$&i/wJzpFmSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776lM1]&opQk-ot+%a[y-rx5FY!sq9Tgl^}zO0MZP4w<vIG3</-=ocvnGzt^xkPzSl>1y#=Pd1p{Y(!Ynr]&ezW+ypta+55xlq1SZD&CMeW%nU:k!!nHyzcE}rm%b.K:l(0!pnlQysWG[Hn??6VmId3}-UVK8$4!Zd73CcrC5(8v]CYWImB7]MglVl<:wQ5qvc<?bwx>g</Bwca-xjVdal3uWJy**^?wKHlNAbn%do(BMN5^8&=BrR?m7K6O7xjVfJv@#BdwKHlNAbn%do(BMN5^8&=BqL3lsQDl{x>g</Bwlg*x(e0fq!ZL?mSirnx(!lfvr>N=wmVqT8wiw+wnca7y*?P-z!9z(18hT{a%q8zwm]E}o<@oXzfoX]x)KtWz/OlWB8U@7C$&i/wJzpFmSiA!wmoN]z/b", v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_239864EA4(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  id v7 = a3;
  if (objc_msgSend_isObject(v7, v8, v9))
  {
    double v12 = objc_msgSend_blockWithFunction_(TMLBlock, v10, INFINITY, v7);
    id v13 = objc_alloc_init(*(Class *)(a1 + 32));
    objc_msgSend_setInterval_(v13, v14, a4);
    objc_msgSend_setRepeats_(v13, v15, v16, a2);
    objc_msgSend_setBlock_(v13, v17, v18, v12);
    objc_msgSend_start(v13, v19, v20);
    id v23 = objc_msgSend_currentContext(TMLJSEnvironment, v21, v22);
    objc_msgSend_addObjectReference_(v23, v24, v25, v13);
  }
  else
  {
    double v26 = (void *)MEMORY[0x263F10390];
    double v12 = objc_msgSend_currentContext(MEMORY[0x263F10378], v10, v11);
    id v23 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v26, v27, v28, @"Callback is not a function", v12);
    uint64_t v31 = objc_msgSend_currentContext(MEMORY[0x263F10378], v29, v30);
    objc_msgSend_setException_(v31, v32, v33, v23);

    id v13 = 0;
  }

  return v13;
}

void sub_23986514C(uint64_t a1)
{
  size_t v2 = strlen(a83847776srsnls);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776srsnls, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

uint64_t sub_2398652F0(CLLocationDegrees a1, CLLocationDegrees a2)
{
  CLLocationCoordinate2D v3 = CLLocationCoordinate2DMake(a1, a2);
  double v4 = (void *)MEMORY[0x263F08D40];
  return objc_msgSend_valueWithMKCoordinate_(v4, v2, v3.latitude, v3.longitude);
}

BOOL sub_239865320(double a1, uint64_t a2, void *a3)
{
  objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  return CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v3);
}

uint64_t sub_23986534C(double a1, uint64_t a2, void *a3)
{
  return objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
}

double sub_239865354(double a1, uint64_t a2, void *a3)
{
  objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  return v3;
}

id sub_239865374(double a1, double a2)
{
  id v4 = objc_alloc(MEMORY[0x263F00A50]);
  double v6 = objc_msgSend_initWithLatitude_longitude_(v4, v5, a1, a2);
  return v6;
}

id sub_2398658FC(uint64_t a1, double a2, double a3)
{
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  id v7 = objc_msgSend_initWithOffset_(v5, v6, a2, a3);
  return v7;
}

void sub_239865A28(uint64_t a1)
{
  size_t v2 = strlen("83847776mNu(HMmlbiO6480e205OuNWA?Nxhd!&R4v:lC[YEW$c@h]mIfrlK(]u)amC*jJ&5zsBiAn+6i4o>C?Pz@H+5Ku>&9wqL7)EIADu:SK:26cy>{OKTXF}E5%9/m{V[8gyVDsthot>7N}Bdv.@RnO2gLRmnRhv*J}ef3xk5[b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btu5/5nu2@Bxrf#xJ5O.A=+/lBpY04777s*xM4{kv%8(a3q0#>xM4{kv%8(q5OVb%Bxrf#xJ5O.A=+/lBuh}[3zELdbs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$c3j7fNy?ml/By=6?z^)D)v@%F83kEn)x()A<BzaY[x>7ZMxM4{kv%8(85e(U#4r=V7v}xZ{z/P@fB-XlbnLSr8x>7ZMxM4{kv%8(q7hmV2Bxrf#xJx4=v}wOLz/P@fB-YVn0sCj}3k#Ghry]F!wl9R.v}wOLz/P@fB-Y@)BAzCs5^RGeluNx(z/c:f3i+G)D2d481A!A@BqL355^![PwO+{<vru5[25^%=wN/*a777s*xM4{kv%8(a3q0#>xM4{kv%8(Gg71F8zFsh]x([2!BA}Xl5d/-?3i+G)D2d481A!A@BrRiezFsh]x([2!BA}XliW+520v37@3mXRxry]F!wl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6l$HgCxjk)[bff=(9:@O&r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mR#0u9T03s!0(BAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9apnN3z!SY)q!Q8&ByPDn5!vMer=qXZwM9nXA=+/lBq+R@1.zZ{z/MD]mriA!AW0+SwmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN-BwjyoJx(^@?x([2?z!SY)q!Q8&ByPDni+rtLz/N(.t).@/wmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AZTRLlT:>xwO.[U8zzH9v@DmbA=k=gwPwzcnLSnSl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPw#$1putApe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzBw5LwOkB[wG(^e3o@GIwPIB2Bvx.OBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6mSirkwmO.Vx>7ZMxM4{kv%8(WB-..zzv=*!mHykGwncdez!SY)B7/GjByPDnC4>Jiv@DmbA=k=gwPwzdnLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.w=A+fr6zGFrTx()x]x>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN/JAZskDr=qXZwM9nXA=+/lBv7a(Bz(4Tb7G.4k5+KNB7Glhl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPymUAZskDr=qXZwM9nXA=+/lBv7a(Bz(4d0uauk9:@O&C5I88wPIK6A=+/lBARwfCvLMeBAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.t+A+fr6zGFfPwl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+AqJl1BIbz!SY)q!Q8&ByPDnluNx(z/dPW=JBO9nLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSPwO+{<vru68uKwh)wncc^z!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPygMwj6^yv}xD/0u9W13s!0(BAhqoy?mS1bs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6bi]mplUf!xBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6l"
         "${g1wO+}1wMA.-v}wOLz/P@fB-ZY0BzalRwO#Q7w[+*%5ciX73jpoYzGG]qy&0W65*G$yry]R&x()x]x>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AV"
         "ctk9+n?#wPRG]C5I88wPIK6A=+/lBzkn%zGGP8x>qq$22n8%ry]O5mp*1zBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+h@nl$HgCBy!G>x>7"
         "ZMxM4{kv%8({x([2WwmYU2x>z6<AYLz>0syk^wncc^z!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPygMwl0OVvru5(0u9W13s!0(BAhqoy?mS1bs$T"
         "gnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W68xYv@C5I88wM9nXA=+/lBp]9Qpf8pEv}wOLz/P@fB-XJi3i+0YA=k$h1X0DLz/N3+wN]H%"
         "r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSFwnbNOAaAy0wMA.-v}wOLz/P@fB-YVQA=M8siW$qknLr=tdHFT-B-7.#BzkVh");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776mNu(HMmlbiO6480e205OuNWA?Nxhd!&R4v:lC[YEW$c@h]mIfrlK(]u)amC*jJ&5zsBiAn+6i4o>C?Pz@H+5Ku>&9wqL7)EIADu:SK:26cy>{OKTXF}E5%9/m{V[8gyVDsthot>7N}Bdv.@RnO2gLRmnRhv*J}ef3xk5[b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btu5/5nu2@Bxrf#xJ5O.A=+/lBpY04777s*xM4{kv%8(a3q0#>xM4{kv%8(q5OVb%Bxrf#xJ5O.A=+/lBuh}[3zELdbs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$c3j7fNy?ml/By=6?z^)D)v@%F83kEn)x()A<BzaY[x>7ZMxM4{kv%8(85e(U#4r=V7v}xZ{z/P@fB-XlbnLSr8x>7ZMxM4{kv%8(q7hmV2Bxrf#xJx4=v}wOLz/P@fB-YVn0sCj}3k#Ghry]F!wl9R.v}wOLz/P@fB-Y@)BAzCs5^RGeluNx(z/c:f3i+G)D2d481A!A@BqL355^![PwO+{<vru5[25^%=wN/*a777s*xM4{kv%8(a3q0#>xM4{kv%8(Gg71F8zFsh]x([2!BA}Xl5d/-?3i+G)D2d481A!A@BrRiezFsh]x([2!BA}XliW+520v37@3mXRxry]F!wl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6l$HgCxjk)[bff=(9:@O&r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mR#0u9T03s!0(BAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9apnN3z!SY)q!Q8&ByPDn5!vMer=qXZwM9nXA=+/lBq+R@1.zZ{z/MD]mriA!AW0+SwmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN-BwjyoJx(^@?x([2?z!SY)q!Q8&ByPDni+rtLz/N(.t).@/wmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AZTRLlT:>xwO.[U8zzH9v@DmbA=k=gwPwzcnLSnSl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPw#$1putApe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzBw5LwOkB[wG(^e3o@GIwPIB2Bvx.OBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6mSirkwmO.Vx>7ZMxM4{kv%8(WB-..zzv=*!mHykGwncdez!SY)B7/GjByPDnC4>Jiv@DmbA=k=gwPwzdnLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.w=A+fr6zGFrTx()x]x>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN/JAZskDr=qXZwM9nXA=+/lBv7a(Bz(4Tb7G.4k5+KNB7Glhl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPymUAZskDr=qXZwM9nXA=+/lBv7a(Bz(4d0uauk9:@O&C5I88wPIK6A=+/lBARwfCvLMeBAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.t+A+fr6zGFfPwl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+AqJl1B"
    "Ibz!SY)q!Q8&ByPDnluNx(z/dPW=JBO9nLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSPwO+{<vru68uKwh)wncc^z!SY)q!Q8&ByPDnr+Vb"
    "?lVl<:A=k=gwPygMwj6^yv}xD/0u9W13s!0(BAhqoy?mS1bs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6bi]mplUf!xBxir]v}wOLz/P@f"
    "B-ZU#wP{HWzGG]qy&0W6l${g1wO+}1wMA.-v}wOLz/P@fB-ZY0BzalRwO#Q7w[+*%5ciX73jpoYzGG]qy&0W65*G$yry]R&x()x]x>7ZMxM4{kv%8(]x"
    ">qGQz/fVqz!%l3AVctk9+n?#wPRG]C5I88wPIK6A=+/lBzkn%zGGP8x>qq$22n8%ry]O5mp*1zBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+h@nl$"
    "HgCBy!G>x>7ZMxM4{kv%8({x([2WwmYU2x>z6<AYLz>0syk^wncc^z!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPygMwl0OVvru5(0u9W13s!0(BAhqoy?m"
    "S1bs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W68xYv@C5I88wM9nXA=+/lBp]9Qpf8pEv}wOLz/P@fB-XJi3i+0YA=k$h1X0DLz/N3+wN]H"
    "%r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSFwnbNOAaAy0wMA.-v}wOLz/P@fB-YVQA=M8siW$qknLr=tdHFT-B-7.#BzkVh",
    v2,
    0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_239865C88(uint64_t a1)
{
  size_t v2 = strlen(a83847776niad86);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776niad86, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_2398663E4(uint64_t a1, const char *a2, double a3)
{
  double v3 = *(void **)(a1 + 32);
  objc_msgSend_rootClassDescriptor(v3, a2, a3);
  id v5 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerClass_(v3, v5, v4, v5);
}

void sub_2398664F8()
{
  v45[1] = *MEMORY[0x263EF8340];
  id v0 = [TMLClassDescriptor alloc];
  uint64_t v3 = objc_msgSend_initWithName_superClassName_initializer_optional_(v0, v1, v2, @"_NSObject", 0, 0, 0);
  double v4 = (void *)qword_268A05898;
  qword_268A05898 = v3;

  id v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  objc_msgSend_setObjcClassName_((void *)qword_268A05898, v7, v8, v6);

  double v9 = (void *)qword_268A05898;
  id v10 = [TMLPropertyDescriptor alloc];
  id v13 = objc_msgSend_initWithName_type_attributes_(v10, v11, v12, @"tmlState", 17, 0);
  objc_msgSend_addProperty_(v9, v14, v15, v13);

  double v16 = (void *)qword_268A05898;
  double v17 = [TMLSignalDescriptor alloc];
  double v20 = objc_msgSend_initWithName_parameters_(v17, v18, v19, @"initialize", 0);
  objc_msgSend_addSignal_(v16, v21, v22, v20);

  id v23 = (void *)qword_268A05898;
  id v24 = [TMLSignalDescriptor alloc];
  double v27 = objc_msgSend_initWithName_parameters_(v24, v25, v26, @"finalize", 0);
  objc_msgSend_addSignal_(v23, v28, v29, v27);

  double v30 = (void *)qword_268A05898;
  uint64_t v31 = [TMLMethodDescriptor alloc];
  double v32 = [TMLPropertyDescriptor alloc];
  double v35 = objc_msgSend_initWithName_type_attributes_(v32, v33, v34, @"signal", 17, 0);
  v45[0] = v35;
  id v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v36, v37, v45, 1);
  id v39 = NSStringFromSelector(sel_tmlHasSignal_);
  id v42 = objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v31, v40, v41, @"tmlHasSignal", 2, v38, v39, 0);
  objc_msgSend_addMethod_(v30, v43, v44, v42);
}

uint64_t sub_239866868()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 8);
  uint64_t v4 = qword_268A058A8;
  qword_268A058A8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

void sub_239866FA8(uint64_t a1, const char *a2, unsigned char *a3, double a4)
{
  double v6 = objc_msgSend_protocolForName_(*(void **)(a1 + 40), a2, a4, a2);
  if (v6)
  {
    id v18 = v6;
    double v9 = objc_msgSend_implementsProtocols(v6, v7, v8);
    if (objc_msgSend_count(v9, v10, v11))
    {
      double v14 = *(void **)(a1 + 32);
      double v15 = objc_msgSend_allObjects(v9, v12, v13);
      objc_msgSend_addObjectsFromArray_(v14, v16, v17, v15);

      *a3 = 1;
    }

    double v6 = v18;
  }
}

void sub_23986704C(uint64_t a1, void *a2)
{
  double v20 = a2;
  id v5 = objc_msgSend_protocolForName_(*(void **)(a1 + 48), v3, v4);
  if (!v5)
  {
    double v15 = (void *)MEMORY[0x263EFF940];
    double v16 = objc_msgSend_stringWithFormat_(NSString, v20, v7, @"Cannot implement undeclared protocol %@", v20);
    objc_msgSend_exceptionWithName_reason_userInfo_(v15, v17, v18, @"TMLRuntimeException", v16, 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }
  double v8 = v5;
  double v9 = *(void **)(a1 + 32);
  id v10 = objc_msgSend_objcProtocol(v5, v6, v7);
  LOBYTE(v9) = objc_msgSend_conformsToProtocol_(v9, v11, v12, v10);

  if ((v9 & 1) == 0) {
    objc_msgSend_addObject_(*(void **)(a1 + 40), v13, v14, v8);
  }
}

void sub_239867144(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v6 = objc_msgSend_signals(v3, v4, v5);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  double v17 = sub_23986721C;
  double v18 = &unk_264DAE0F8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v19 = v3;
  uint64_t v20 = v7;
  id v8 = v3;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v9, v10, &v15);

  double v11 = *(objc_class **)(a1 + 32);
  objc_msgSend_objcProtocol(v8, v12, v13, v15, v16, v17, v18);
  double v14 = (Protocol *)objc_claimAutoreleasedReturnValue();
  class_addProtocol(v11, v14);
}

void sub_23986721C(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if ((objc_msgSend_isOptional(v11, v4, v5) & 1) == 0)
  {
    id v8 = objc_msgSend_objcProtocol(*(void **)(a1 + 32), v6, v7);
    objc_msgSend_addSignalMethod_forProtocol_toClass_(TMLSignalMethods, v9, v10, v11, v8, *(void *)(a1 + 40));
  }
}

uint64_t sub_239867C2C(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_verifyProperty_withClass_, a2);
}

uint64_t sub_239867C38(uint64_t a1, double a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_registerMethod_forObject_, a2);
}

uint64_t sub_239867C44(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_registerSignal_forObject_(*(void **)(a1 + 32), a2, a4, a3, *(void *)(a1 + 40));
}

uint64_t sub_239867C50()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 64);
  double v4 = (void *)qword_268A05878;
  qword_268A05878 = v3;

  id v5 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v5, v6, v7, 16);
  uint64_t v9 = qword_268A05888;
  qword_268A05888 = v8;
  return MEMORY[0x270F9A758](v8, v9);
}

void sub_239867CB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  double v6 = objc_msgSend_superClassName(v12, v4, v5);
  int isEqualToString = objc_msgSend_isEqualToString_(v6, v7, v8, *(void *)(a1 + 32));

  if (isEqualToString) {
    objc_msgSend_setSuperClass_(v12, v10, v11, *(void *)(a1 + 40));
  }
}

void sub_239867D30(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  if (objc_msgSend_isControlStateClass_(TMLUIControlState, v4, v5)) {
    objc_msgSend_registerControlState_forClass_(TMLUIControlState, v6, v7, v12, *(void *)(a1 + 32));
  }
  double v8 = *(void **)(a1 + 40);
  uint64_t v9 = objc_msgSend_objcClassName(v12, v6, v7);
  objc_msgSend_registerClass_className_(v8, v10, v11, v12, v9);
}

uint64_t sub_239867DC0(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addProperty_(*(void **)(a1 + 32), a2, a3);
}

void sub_239867DC8(uint64_t a1, void *a2)
{
  id v14 = a2;
  double v5 = objc_msgSend_superClassName(v14, v3, v4);
  double v8 = objc_msgSend_className(*(void **)(a1 + 32), v6, v7);
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v9, v10, v8);

  if (isEqualToString) {
    objc_msgSend_registerClass_(*(void **)(a1 + 40), v12, v13, v14);
  }
}

void sub_239867F94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  id v10 = a3;
  objc_msgSend_verifyMethod_forProtocol_(v4, v6, v7, v10, v5);
  objc_msgSend_verifySignalMethod_forProtocol_(TMLSignalMethods, v8, v9, v10, *(void *)(a1 + 32));
}

uint64_t sub_239868008()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 16);
  uint64_t v4 = qword_268A05880;
  qword_268A05880 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

void sub_239868648(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2398686A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2398686B4(uint64_t a1)
{
}

id sub_2398686BC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  Superclass = *(objc_class **)(a1 + 40);
  v13.receiver = v7;
  if (!Superclass)
  {
    Class Class = object_getClass(v7);
    Superclass = class_getSuperclass(Class);
  }
  v13.super_class = Superclass;
  double v11 = objc_msgSendSuper(&v13, *(SEL *)(a1 + 48), a3, v8);

  sub_23986876C(v11, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return v11;
}

void sub_23986876C(void *a1, void *a2)
{
  v28[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  objc_setAssociatedObject(v3, "cppmsc", v5, 0);
  double v27 = @"owner";
  id v8 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v6, v7, v3);
  v28[0] = v8;
  double v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, v10, v28, &v27, 1);
  id v14 = objc_msgSend_cloneContext_objects_(TMLContext, v12, v13, v4, v11);

  objc_setAssociatedObject(v3, "c", v14, (void *)1);
  objc_initWeak(&location, v14);
  double v17 = objc_msgSend_currentContext(TMLJSEnvironment, v15, v16);
  double v18 = [TMLDisposeBlock alloc];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_23986BB74;
  void v24[3] = &unk_264DAC1D0;
  objc_copyWeak(&v25, &location);
  char v21 = objc_msgSend_initWithBlock_(v18, v19, v20, v24);
  objc_msgSend_addObjectReference_(v17, v22, v23, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void sub_23986894C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_239868978(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  Superclass = *(objc_class **)(a1 + 40);
  v11.receiver = v5;
  if (!Superclass)
  {
    Class Class = object_getClass(v5);
    Superclass = class_getSuperclass(Class);
  }
  v11.super_class = Superclass;
  double v9 = objc_msgSendSuper(&v11, *(SEL *)(a1 + 48), v6);

  sub_23986876C(v9, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return v9;
}

id sub_239868A20(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  Superclass = *(objc_class **)(a1 + 40);
  v16.receiver = v11;
  if (!Superclass)
  {
    Class Class = object_getClass(v11);
    Superclass = class_getSuperclass(Class);
  }
  v16.super_class = Superclass;
  id v14 = objc_msgSendSuper(&v16, *(SEL *)(a1 + 48), a3, a4, a5, a6);

  sub_23986876C(v14, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return v14;
}

id sub_239868AE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  Superclass = *(objc_class **)(a1 + 40);
  v8.receiver = v3;
  if (!Superclass)
  {
    Class Class = object_getClass(v3);
    Superclass = class_getSuperclass(Class);
  }
  v8.super_class = Superclass;
  id v6 = objc_msgSendSuper(&v8, *(SEL *)(a1 + 48));

  sub_23986876C(v6, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return v6;
}

void sub_239868B78(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_239868C18;
  v8[3] = &unk_264DAE300;
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  id v5 = v3;
  objc_msgSend_addGCCallback_(TMLJSEnvironment, v6, v7, v8);
}

void sub_239868C18(uint64_t a1)
{
  objc_removeAssociatedObjects(*(id *)(a1 + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_239868C60(uint64_t a1, const char *a2, unsigned char *a3, double a4)
{
  id v6 = objc_msgSend_protocolForName_(*(void **)(a1 + 40), a2, a4, a2);
  if (v6)
  {
    id v18 = v6;
    id v9 = objc_msgSend_implementsProtocols(v6, v7, v8);
    if (objc_msgSend_count(v9, v10, v11))
    {
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = objc_msgSend_allObjects(v9, v12, v13);
      objc_msgSend_addObjectsFromArray_(v14, v16, v17, v15);

      *a3 = 1;
    }

    id v6 = v18;
  }
}

void sub_239868D04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = objc_msgSend_protocolForName_(*(void **)(a1 + 32), v4, v5, v3);
  if (!v6)
  {
    id v19 = (void *)MEMORY[0x263EFF940];
    double v20 = objc_msgSend_stringWithFormat_(NSString, v7, v8, @"Cannot implement undeclared protocol %@", v3);
    objc_msgSend_exceptionWithName_reason_userInfo_(v19, v21, v22, @"TMLRuntimeException", v20, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
  id v9 = v6;
  uint64_t v10 = objc_msgSend_signals(v6, v7, v8);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_239868E50;
  void v24[3] = &unk_264DAE0F8;
  uint64_t v11 = *(void *)(a1 + 40);
  id v25 = v9;
  uint64_t v26 = v11;
  id v12 = v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, v14, v24);

  uint64_t v15 = *(objc_class **)(a1 + 40);
  objc_msgSend_objcProtocol(v12, v16, v17);
  id v18 = (Protocol *)objc_claimAutoreleasedReturnValue();
  class_addProtocol(v15, v18);
}

void sub_239868E50(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if ((objc_msgSend_isOptional(v11, v4, v5) & 1) == 0)
  {
    double v8 = objc_msgSend_objcProtocol(*(void **)(a1 + 32), v6, v7);
    objc_msgSend_addSignalMethod_forProtocol_toClass_(TMLSignalMethods, v9, v10, v11, v8, *(void *)(a1 + 40));
  }
}

uint64_t sub_2398694AC(objc_property *a1)
{
  Attributes = property_getAttributes(a1);
  if (Attributes)
  {
    uint64_t v4 = Attributes;
    id v5 = [NSString alloc];
    size_t v6 = strlen(v4);
    id v9 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v5, v7, v8, v4, v6, 1, 0);
    uint64_t v12 = objc_msgSend_rangeOfString_(v9, v10, v11, @",");
  }
  else
  {
    id v9 = @"T ,";
    uint64_t v12 = objc_msgSend_rangeOfString_(@"T ,", v2, v3, @",");
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_hasPrefix_(v9, v13, v14, @"Tr")) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    uint64_t v18 = objc_msgSend_length(v9, v15, v16) - v17;
    objc_msgSend_substringWithRange_(v9, v19, v20, v17, v18);
  }
  else
  {
    uint64_t v21 = v12;
    if (!objc_msgSend_hasPrefix_(v9, v13, v14, @"T"))
    {
      uint64_t v27 = 0;
      goto LABEL_13;
    }
    objc_msgSend_substringWithRange_(v9, v22, v23, 1, v21 - 1);
  uint64_t v24 = };

  uint64_t v27 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v25, v26, v24);
  id v9 = (__CFString *)v24;
LABEL_13:

  return v27;
}

uint64_t sub_239869824()
{
  return 0;
}

void sub_23986AD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23986ADB4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v20 = a2;
  double v7 = objc_msgSend_signals(v20, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, v9, *(void *)(a1 + 32));
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v15)
  {
    double v16 = objc_msgSend_objcProtocol(v20, v13, v14);
    uint64_t v17 = objc_getAssociatedObject(*(id *)(a1 + 40), "cppmsc");
    objc_msgSend_addSignalMethod_forProtocol_toClass_(TMLSignalMethods, v18, v19, v15, v16, v17);

    *a3 = 1;
  }
}

void sub_23986B10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23986B124(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  if (objc_msgSend_isEqualToString_(a2, v8, v9, *(void *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

uint64_t sub_23986B5B4()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 64);
  uint64_t v4 = qword_268A058D8;
  qword_268A058D8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

void sub_23986BB74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);
}

void sub_23986BC78(uint64_t a1)
{
  size_t v2 = strlen(a83847776wu1idv);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776wu1idv, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_23986BE08(int a1, int32_t preferredTimescale, Float64 a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  CMTimeMakeWithSeconds(&v8, a3, preferredTimescale);
  double v6 = objc_msgSend_valueWithCMTime_(v3, v4, v5, &v8);
  return v6;
}

id sub_23986BE60(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v6 = a3;
  memset(&v16[1], 0, sizeof(CMTime));
  if (v4) {
    objc_msgSend_CMTimeValue(v4, v5, v7);
  }
  memset(v16, 0, 24);
  if (v6) {
    objc_msgSend_CMTimeValue(v6, v5, v7);
  }
  CMTime v8 = (void *)MEMORY[0x263F08D40];
  CMTime lhs = v16[1];
  CMTime v13 = v16[0];
  CMTimeAdd(&v15, &lhs, &v13);
  uint64_t v11 = objc_msgSend_valueWithCMTime_(v8, v9, v10, &v15);

  return v11;
}

id sub_23986BF38(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CMTime v8 = v5;
  double v9 = (void *)MEMORY[0x263F08D40];
  if (v4)
  {
    objc_msgSend_CMTimeValue(v4, v6, v7);
    if (v8)
    {
LABEL_3:
      objc_msgSend_CMTimeValue(v8, v6, v7);
      goto LABEL_6;
    }
  }
  else
  {
    memset(&start, 0, sizeof(start));
    if (v5) {
      goto LABEL_3;
    }
  }
  memset(&v14, 0, sizeof(v14));
LABEL_6:
  CMTimeRangeMake(&v16, &start, &v14);
  uint64_t v12 = objc_msgSend_valueWithCMTimeRange_(v9, v10, v11, &v16);

  return v12;
}

id sub_23986BFF8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CMTime v8 = v5;
  double v9 = (void *)MEMORY[0x263F08D40];
  if (v4)
  {
    objc_msgSend_CMTimeValue(v4, v6, v7);
    if (v8)
    {
LABEL_3:
      objc_msgSend_CMTimeValue(v8, v6, v7);
      goto LABEL_6;
    }
  }
  else
  {
    memset(&start, 0, sizeof(start));
    if (v5) {
      goto LABEL_3;
    }
  }
  memset(&v14, 0, sizeof(v14));
LABEL_6:
  CMTimeRangeFromTimeToTime(&v16, &start, &v14);
  uint64_t v12 = objc_msgSend_valueWithCMTimeRange_(v9, v10, v11, &v16);

  return v12;
}

Float64 sub_23986C0B8(double a1, uint64_t a2, void *a3)
{
  if (a3) {
    objc_msgSend_CMTimeValue(a3, (const char *)a3, a1);
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

id sub_23986C0F8(double a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263F08D40];
  if (a3) {
    objc_msgSend_CMTimeValue(a3, (const char *)a3, a1);
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  CMTimeMultiplyByFloat64(&v10, &v9, a1);
  double v7 = objc_msgSend_valueWithCMTime_(v4, v5, v6, &v10);
  return v7;
}

uint64_t sub_23986C17C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CMTime v8 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v11, 0, sizeof(v11));
    goto LABEL_6;
  }
  objc_msgSend_CMTimeValue(v4, v6, v7);
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  objc_msgSend_CMTimeValue(v8, v6, v7);
LABEL_6:
  uint64_t v9 = CMTimeCompare(&time1, &v11);

  return v9;
}

void sub_23986D2A0(uint64_t a1)
{
  size_t v2 = strlen("83847776br%J}44V[oHGYAX<9%FYjO7682Rf1wSZ4E&ZA]FFl$q*r+8k.T0iTN}-Rav!N$0Uu+6iBI>[>6!{%REXl$s3?KTV7gKr^)yu<Jjf.BEyvY.&IKJ8L#4(/amOpgo3nK6MRR-#qbPz5=yG7+W2B*:&o>Mr*WF{URvO3Jf#j6h.C1A+fAdwP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$o3kc&>A=L-eBwN0?C4>JinPXJX5^An-ygQ)%7Y+/{3jprLByw9^B-H#65^An-ygQ)%a}+j*wmYN*xjk)[5^An-ygQ)%gb]QUA+e<6wPIJLB-IIlzGFY}wP?^0Cs=)/z4DZ(8ffq2A+fr9lV)A&wO#P^A+fAdwP{Z/wO<gV3jZMOzCUv+C4>JinPXJX5cr:W3iU6+wO&4:z^)D)v@@[ad}r19p&Zb<x>qGWBy/qIg8ZGbA+f69vpR=mBytZYa{@v4y&r-)l$7gCbie!j8=op9A+fAdwP{HWzGG]qy&0W6l$HgCxjk)[b1&mZAb]Jkx>qGQz/fVqz!%l3AZTRLl${ZVx(!tb0u9u[5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mSn0WsPA3m{dpwP?^0Cscp^BAhqoy?mS=xM53fwkveQzDfOdmSirzA+fAdwP{Z/wO?$W8yL}8Ab]Jkx>qGQz/fVqz!%l3AUo3.oI/+vC4>JilVl<:A=k=gwPwW@3iKpaoCdCIA+(T73iU6+wO&4:z^)D)v@@[FAb]Jkx>qGQz/fVqz!%l3AYOnPz/](bpJf(.rz(HKw]zY^A+fAdwP{Z/wO<ER0WpqB9b]}fC4>JilVl<:A=k=gwPy<^y?#HNB8tSjA$wu<c<*M9A+fAdwP{HWzGG]qy&0W65!!bop&Zb<x>qGQz/fVqz!%l3AWQ#k)eWLmqa%/bwP?^0Cscp^BAhqoy?mSPvrt{Rz/{8gwG(m75].(5C4>JinPXJXl3bXowmY#%5e(@75Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mS93<)eLzE^s65^8&=BrS2IA+fAdwP{HWzGG]qy&0W6i=GaJC4>JinPXJXl3bXowmZ0Db2[%$zGP/9wPyNUp&Zb<x>qGWBy/rgnP4vBwP?^0Cscp^BAhqoy?mR#1@X(%5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mR");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776br%J}44V[oHGYAX<9%FYjO7682Rf1wSZ4E&ZA]FFl$q*r+8k.T0iTN}-Rav!N$0Uu+6iBI>[>6!{%REXl$s3?KTV7gKr^)yu<Jjf.BEyvY.&IKJ8L#4(/amOpgo3nK6MRR-#qbPz5=yG7+W2B*:&o>Mr*WF{URvO3Jf#j6h.C1A+fAdwP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$o3kc&>A=L-eBwN0?C4>JinPXJX5^An-ygQ)%7Y+/{3jprLByw9^B-H#65^An-ygQ)%a}+j*wmYN*xjk)[5^An-ygQ)%gb]QUA+e<6wPIJLB-IIlzGFY}wP?^0Cs=)/z4DZ(8ffq2A+fr9lV)A&wO#P^A+fAdwP{Z/wO<gV3jZMOzCUv+C4>JinPXJX5cr:W3iU6+wO&4:z^)D)v@@[ad}r19p&Zb<x>qGWBy/qIg8ZGbA+f69vpR=mBytZYa{@v4y&r-)l$7gCbie!j8=op9A+fAdwP{HWzGG]qy&0W6l$HgCxjk)[b1&mZAb]Jkx>qGQz/fVqz!%l3AZTRLl${ZVx(!tb0u9u[5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mSn0WsPA3m{dpwP?^0Cscp^BAhqoy?mS=xM53fwkveQzDfOdmSirzA+fAdwP{Z/wO?$W8yL}8Ab]Jkx>qGQz/fVqz!%l3AUo3.oI/+vC4>JilVl<:A=k=gwPwW@3iKpaoCdCIA+(T73iU6+wO&4:z^)D)v@@[FAb]Jkx>qGQz/fVqz!%l3AYOnPz/](bpJf(.rz(HKw]zY^A+fAdwP{Z/wO<ER0WpqB9b]}fC4>JilVl<:A=k=gwPy<^y?#HNB8tSjA$wu<c<*M9A+fAdwP{HWzGG]qy&0W65!!bop&Zb<x>qGQz/fVqz!%l3AWQ#k)eWLmqa%/bwP?^0Cscp^BAhqoy?mSPvrt{Rz/{8gwG(m75].(5C4>JinPXJXl3bXowmY#%5e(@75Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mS93<)eLzE^s65^8&=BrS2IA+fAdwP{HWzGG]qy&0W6i=GaJC4>JinPXJXl3bXowmZ0Db2[%$zGP/9wPyNUp&Zb<x>qGWBy/rgnP4vBwP?^0Cscp^BAhqoy?mR#1@X(%5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mR", v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

id sub_23986D8AC(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v7, v9, v10))
  {
    uint64_t v12 = objc_msgSend_fontDescriptorWithName_size_(MEMORY[0x263F81720], v11, a4, v7);
  }
  else
  {
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();
    CMTimeRange v16 = (void *)MEMORY[0x263F81708];
    if (isKindOfClass)
    {
      objc_msgSend_floatValue(v8, v14, v15);
      objc_msgSend_systemFontOfSize_weight_(v16, v18, a4, v17);
    }
    else
    {
      objc_msgSend_systemFontOfSize_(MEMORY[0x263F81708], v14, a4);
    double v19 = };
    uint64_t v12 = objc_msgSend_fontDescriptor(v19, v20, v21);
  }
  id v22 = objc_alloc(*(Class *)(a1 + 32));
  id v25 = objc_msgSend_initWithFontDescriptor_(v22, v23, v24, v12);

  return v25;
}

CGFont *sub_23986D9E0(uint64_t a1, void *a2)
{
  CFDataRef v2 = a2;
  CFDataRef v3 = v2;
  if (!v2) {
    goto LABEL_11;
  }
  double v4 = CGDataProviderCreateWithCFData(v2);
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = CGFontCreateWithDataProvider(v4);
  double v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  CFErrorRef error = 0;
  if (!CTFontManagerRegisterGraphicsFont(v5, &error))
  {
    CFStringRef v9 = CFErrorCopyDescription(error);
    CFRelease(v9);
  }
  double v10 = objc_msgSend_familyNames(MEMORY[0x263F81708], v7, v8);
  double v6 = (CGFont *)CGFontCopyPostScriptName(v6);
  if ((int)objc_msgSend_count(v10, v11, v12) < 1)
  {
LABEL_10:

LABEL_11:
    double v6 = 0;
    goto LABEL_12;
  }
  uint64_t v15 = 0;
  while (1)
  {
    CMTimeRange v16 = (void *)MEMORY[0x263F81708];
    uint64_t v17 = objc_msgSend_objectAtIndex_(v10, v13, v14, v15);
    id v20 = objc_msgSend_fontNamesForFamilyName_(v16, v18, v19, v17);

    LOBYTE(v17) = objc_msgSend_containsObject_(v20, v21, v22, v6);
    if (v17) {
      break;
    }
    if (++v15 >= (int)objc_msgSend_count(v10, v23, v24)) {
      goto LABEL_10;
    }
  }

LABEL_12:
  return v6;
}

void sub_23986DB1C(double a1, uint64_t a2, const char *a3)
{
  v11[5] = *MEMORY[0x263EF8340];
  CFDataRef v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = *MEMORY[0x263F1D148];
  v11[0] = *MEMORY[0x263F1D150];
  v11[1] = v4;
  uint64_t v5 = *MEMORY[0x263F1D138];
  _OWORD v11[2] = *MEMORY[0x263F1D140];
  v11[3] = v5;
  void v11[4] = *MEMORY[0x263F1D130];
  double v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a3, a1, v11, 5);
  uint64_t v9 = objc_msgSend_setWithArray_(v3, v7, v8, v6);
  double v10 = (void *)qword_268A058F8;
  qword_268A058F8 = v9;
}

id sub_23986DBFC(uint64_t a1, void *a2, void *a3, int a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc(MEMORY[0x263F1C668]);
  CMTime v11 = objc_msgSend_initForTextStyle_(v8, v9, v10, v6);
  double v14 = objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F81708], v12, v13, v6);
  uint64_t v15 = (void *)MEMORY[0x263F81720];
  uint64_t v18 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F1CB00], v16, v17, *MEMORY[0x263F1D180]);
  double v21 = objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v15, v19, v20, v6, v18);

  objc_opt_class();
  isKindOfClass Class = objc_opt_isKindOfClass();
  id v25 = (void *)MEMORY[0x263F81708];
  if (isKindOfClass)
  {
    objc_msgSend_pointSize(v21, v23, v24);
    double v27 = v26;
    objc_msgSend_floatValue(v7, v28, v26);
    uint64_t v31 = objc_msgSend_systemFontOfSize_weight_(v25, v30, v27, v29);
  }
  else
  {
    uint64_t v32 = objc_msgSend_fontDescriptor(v14, v23, v24);
    objc_msgSend_pointSize(v21, v33, v34);
    uint64_t v31 = objc_msgSend_fontWithDescriptor_size_(v25, v35, v36, v32);

    double v14 = (void *)v32;
  }

  if (a4)
  {
    id v39 = (void *)MEMORY[0x263F81720];
    double v40 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F1CB00], v37, v38, *MEMORY[0x263F1D160]);
    uint64_t v43 = objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v39, v41, v42, v6, v40);

    objc_msgSend_pointSize(v43, v44, v45);
    double v48 = objc_msgSend_scaledFontForFont_maximumPointSize_(v11, v46, v47, v31);
    double v21 = v43;
  }
  else
  {
    double v48 = objc_msgSend_scaledFontForFont_(v11, v37, v38, v31);
  }

  id v49 = objc_alloc(*(Class *)(a1 + 32));
  double v52 = objc_msgSend_initWithFont_(v49, v50, v51, v48);

  return v52;
}

double sub_23986DE20(double a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F1C668];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v9 = objc_msgSend_initForTextStyle_(v6, v7, v8, v5);

  objc_msgSend_scaledValueForValue_(v9, v10, a1);
  double v12 = v11;

  return v12;
}

double sub_23986DE88(double a1, uint64_t a2, const char *a3)
{
  uint64_t v4 = objc_msgSend_defaultMetrics(MEMORY[0x263F1C668], a3, a1);
  objc_msgSend_scaledValueForValue_(v4, v5, a1);
  double v7 = v6;

  return v7;
}

double sub_23986EAFC(void *a1, const char *a2, double a3)
{
  uint64_t v4 = objc_msgSend_view(a1, a2, a3);
  objc_msgSend_translationInView_(a1, v5, v6, v4);
  double v8 = v7;

  return v8;
}

double sub_23986EB50(void *a1, const char *a2, double a3)
{
  uint64_t v4 = objc_msgSend_view(a1, a2, a3);
  objc_msgSend_velocityInView_(a1, v5, v6, v4);
  double v8 = v7;

  return v8;
}

id sub_23986EE24(uint64_t a1, double a2, double a3)
{
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  double v7 = objc_msgSend_initWithPoint_(v5, v6, a2, a3);
  return v7;
}

BOOL sub_23986EE6C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_point(a2, v5, v6);
  double v8 = v7;
  double v10 = v9;
  objc_msgSend_point(v4, v11, v7);
  double v13 = v12;
  double v15 = v14;

  return v10 == v15 && v8 == v13;
}

id sub_23986EED8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  double v6 = *(objc_class **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 alloc];
  objc_msgSend_point(v7, v9, v10);
  long long v21 = v12;
  double v22 = v11;

  if (v5)
  {
    objc_msgSend_transform(v5, v13, v14, v21);
    float64x2_t v15 = v23;
    float64x2_t v16 = v24;
    float64x2_t v17 = v25;
  }
  else
  {
    float64x2_t v17 = 0uLL;
    float64x2_t v15 = 0uLL;
    float64x2_t v16 = 0uLL;
  }
  float64x2_t v18 = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, *(double *)&v21), v15, v22));
  double v19 = objc_msgSend_initWithPoint_(v8, v13, v18.f64[0], v18.f64[1], (void)v21);

  return v19;
}

id sub_23986EFA8(uint64_t a1, CFDictionaryRef dict)
{
  CGPoint v7 = (CGPoint)*MEMORY[0x263F00148];
  if (CGPointMakeWithDictionaryRepresentation(dict, &v7))
  {
    id v3 = objc_alloc(*(Class *)(a1 + 32));
    id v5 = objc_msgSend_initWithPoint_(v3, v4, v7.x, v7.y);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void sub_23986F6C4(uint64_t a1)
{
  size_t v2 = strlen("83847776h1!jvbf5d^2Ija%0E}O4-Ndp]ymr-Hf#w3#P(Lm/JOCOvoFTwRQlC<qzDHY!E}7[30(5VH/Vx?[HdP+d7CUpyLzPm#hp=v%:TEbD7b*$%m.($O]jpHau[4ppQ6:E!NXlUc4cSR.B-4E)oW?Uwg%Z8zIzadx?r$!P3rNSJrzDqcBzku3v{%E[z/eD:B8V5nB7DKr3jH/<Bzku3v{%E[z/cf$rzDqcBzku3v{%E[z/cx)a@*}3vpKy[z/ecSwO#Q7w[+*%5^AA0A+PA77Y:#t0TYVxpek.Hx>z6?vruj4zC>4=B.bSoa%Ev0v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGDY@a%Ev0BAh8dxjV8@6&!17z//Y9x>7N[x(v(*A+Pf0wPwQ*a@gH)x>g^)Bzku3wPwy/B98CpzF6^!go7uZbxvvnB.bSos7#+&nN#yIBzku3wPydRzGGDcBx0o{xj>^@5d/-]3jpGTwO#Q7w[+*%5^AA0A+PA78xYv(v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGD^t3i$V[x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a$1)YwPq<7B97F$BzalRwO#Q7w[+*%i+98CBy/uii=]yRxj>^@iTRwU3li5vo)7L^vR/QJz//Y9x>7N[x(v(Rz/fVdzGDHarzDqcBzku3v{%E[z/d{XzGGDcBrRt82Y>b$Bzk&kwFbh*BAh8kxcFi24@tV%zEWuKzdd6*pgn0J5^AA0A+PA7a}C1:vQS!WwFbh=vRPE:BrRRg5oIPawNPavwmYU2x>z6<AUnN$BAh8kxcE&[1:1E2y?jj-B98CpzF7dk3i+G?B-7.56id!5z//Y9x>7N[x(v(/z/]@da}$v(vruQ1v}YZ<zGG}j1Z#B(vr<4b3iT*Rwo!^(B98CpzF7dk3kc&SBy/96A^pk!wO#Q7w[+*%5^AA0A+PA7a@gH>B-RbmnP5cU5^&e-v@#B6zEENh3HE<39At<4vqGH)wmoHNz//Y9x>7N[x(v(*A+Pf0wPwy#rzDqcBzku3v{%E[z/eJ{x>I6&AV#+o4Rf0&wKyxMAbPS9zGG}j5kDd(vru6Fz/6DizE)ZcA#j{kJSxFnBAh8dxjV9+x([2Rvru6Pvru0)x(mMJz/6DizE)ZcB5DN*wNPX45d/:73jZPPBy!%2ze:AhwO#Qh5!E/pl$7gGlVl*Xz/fc7BAnuh3i$P.AaJE1A$OQ+z/oCod>tZZx>I6&A-V%%xHDoJwLDPPv}YN]xg3POAbPS9zGG}XA+fi3vruMK3s<FSrzDqcBzku3v{%E[z/eG(B-7.B9%@A!wObv[y&&P]B-7.35f.MlwmYvYB.(d#z/]@dgaS+tB8MhswklMIwN(t-8v^8SzEEx[5^AA0A+PA7a}b#yz/]@dpgn0Jwi75[3lJnyraQq@nP5G&Bwu:@x>z6?vruj4zC>4!AbPSnwFb+Upek.Hx>z6?vruj4zC>4!AbPSnwG?/}2Z7i1A-uQ{Bp[!0BAh8kxbyTRR2Z]zrzDkav{%E[z/er*Bzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a}$v*A+e($z/cf[lRHx?xk8p47Y=x[3k4x2x>I6&A-V%%xI@zOx(v(25e(e*26ao/x(v(42T.o-wOkZ}zw<2)2xBx{wNPX45^hVZz!{Qpd%b/Cxj>^@s7#+&qE%GPz/dQRwPhi?BAoFImHxS9pek.Hx>z6?vruj4zxYS01y$}.wFbhxq:+5owF+B(a{[M}wPq<7B953frzDqcBzku3v{%E[z/eD:ADL&lBqL2=g71[0peD7OxIJF/x>z6?vruj4zD7T<xj>^@5/1zwph+k*w[+:-BzkVhrb#X=xjV8<.#Qh*rzDIczdMpRBy/GovqFXSBzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a@yT}BzkP6nP5SYA=$(c5^z(+BZ/e#7Y=yf3lBqfx>I6&A-V%%xJeX.wL3=YwPz%5y/j?-wNPX45d/-}3jI2<zdNB0By/GovqDLXwn=Q1y?jH}3i$P.AaJE1A$OQ+z/oCoa"
         "UdUPx>I6&A-V%%xJeX.wL3=YwPz%5y=VPFAaJE1B2<U>0TYVxpek.Hx>z6?vruj4zBntWBy/uia}$v&B9g@lx([f55^AA0A+PA77Y+*13j*@YB-"
         "7Y5nO})GwLMVJwFbh*BAh8kxbyT[5EFXJvpT1Z5^An-ygQ)%7Y+*23j}q)A+eV&nN#yIBzku3wPwy/B98CpzF6^!a}Ud=Bzk&kwFbh*BAh8kxby"
         "T[9TS6(z/]@d5!!nuph+k*w[+:-BzkVhq/u!@weCs>777BTBAy@3xL?r#BAn5#vrcx%C]cMa5deLHz!aba26j)bx(mM20u@M(5[tu(wOk}4C$zK"
         "TzGGP8x>qq$26j)bx(mM20u@u/2Z7i1A.gdXzXry/x>8m0z/f07C]cL?dHD[<pek.Hx>z6?vruj4zD7T<xj>^@a}Ud!A+fi3vruM61y=p/y-0g53pX@RzE^f$x(v>");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "83847776h1!jvbf5d^2Ija%0E}O4-Ndp]ymr-Hf#w3#P(Lm/JOCOvoFTwRQlC<qzDHY!E}7[30(5VH/Vx?[HdP+d7CUpyLzPm#hp=v%:TEbD7b*$%m.($O]jpHau[4ppQ6:E!NXlUc4cSR.B-4E)oW?Uwg%Z8zIzadx?r$!P3rNSJrzDqcBzku3v{%E[z/eD:B8V5nB7DKr3jH/<Bzku3v{%E[z/cf$rzDqcBzku3v{%E[z/cx)a@*}3vpKy[z/ecSwO#Q7w[+*%5^AA0A+PA77Y:#t0TYVxpek.Hx>z6?vruj4zC>4=B.bSoa%Ev0v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGDY@a%Ev0BAh8dxjV8@6&!17z//Y9x>7N[x(v(*A+Pf0wPwQ*a@gH)x>g^)Bzku3wPwy/B98CpzF6^!go7uZbxvvnB.bSos7#+&nN#yIBzku3wPydRzGGDcBx0o{xj>^@5d/-]3jpGTwO#Q7w[+*%5^AA0A+PA78xYv(v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGD^t3i$V[x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a$1)YwPq<7B97F$BzalRwO#Q7w[+*%i+98CBy/uii=]yRxj>^@iTRwU3li5vo)7L^vR/QJz//Y9x>7N[x(v(Rz/fVdzGDHarzDqcBzku3v{%E[z/d{XzGGDcBrRt82Y>b$Bzk&kwFbh*BAh8kxcFi24@tV%zEWuKzdd6*pgn0J5^AA0A+PA7a}C1:vQS!WwFbh=vRPE:BrRRg5oIPawNPavwmYU2x>z6<AUnN$BAh8kxcE&[1:1E2y?jj-B98CpzF7dk3i+G?B-7.56id!5z//Y9x>7N[x(v(/z/]@da}$v(vruQ1v}YZ<zGG}j1Z#B(vr<4b3iT*Rwo!^(B98CpzF7dk3kc&SBy/96A^pk!wO#Q7w[+*%5^AA0A+PA7a@gH>B-RbmnP5cU5^&e-v@#B6zEENh3HE<39At<4vqGH)wmoHNz//Y9x>7N[x(v(*A+Pf0wPwy#rzDqcBzku3v{%E[z/eJ{x>I6&AV#+o4Rf0&wKyxMAbPS9zGG}j5kDd(vru6Fz/6DizE)ZcA#j{kJSxFnBAh8dxjV9+x([2Rvru6Pvru0)x(mMJz/6DizE)ZcB5DN*wNPX45d/:73jZPPBy!%2ze:AhwO#Qh5!E/pl$7gGlVl*Xz/fc7BAnuh3i$P.AaJE1A$OQ+z/oCod>tZZx>I6&A-V%%xHDoJwLDPPv}YN]xg3POAbPS9zGG}XA+fi3vruMK3s<FSrzDqcBzku3v{%E[z/eG(B-7.B9%@A!wObv[y&&P]B-7.35f.MlwmYvYB.(d#z/]@dgaS+tB8MhswklMIwN(t-8v^8SzEEx[5^AA0A+PA7a}b#yz/]@dpgn0Jwi75[3lJnyraQq@nP5G&Bwu:@x>z6?vruj4zC>4!AbPSnwFb+Upek.Hx>z6?vruj4zC>4!AbPSnwG?/}2Z7i1A-uQ{Bp[!0BAh8kxbyTRR2Z]zrzDkav{%E[z/er*Bzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a}$v*A+e($z/cf[lRHx?xk8p47Y=x[3k4x2x>I6&A-V%%xI@zOx(v(25e(e*26ao/x(v(42T.o-wOkZ}zw<2)2xBx{wNPX45^hVZz!{Qpd%b/Cxj>^@s7#+&qE%GPz/dQRwPhi?BAoFImHxS9pek.Hx>z6?vruj4zxYS01y$}.wFbhxq:+5owF+B(a{[M}wPq<7B953frzDqcBzku3v{%E[z/eD:ADL&lBqL2=g71[0peD7OxIJF/x>z"
    "6?vruj4zD7T<xj>^@5/1zwph+k*w[+:-BzkVhrb#X=xjV8<.#Qh*rzDIczdMpRBy/GovqFXSBzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T"
    "<xj>^@a@yT}BzkP6nP5SYA=$(c5^z(+BZ/e#7Y=yf3lBqfx>I6&A-V%%xJeX.wL3=YwPz%5y/j?-wNPX45d/-}3jI2<zdNB0By/GovqDLXwn=Q1y?jH}"
    "3i$P.AaJE1A$OQ+z/oCoaUdUPx>I6&A-V%%xJeX.wL3=YwPz%5y=VPFAaJE1B2<U>0TYVxpek.Hx>z6?vruj4zBntWBy/uia}$v&B9g@lx([f55^AA0A"
    "+PA77Y+*13j*@YB-7Y5nO})GwLMVJwFbh*BAh8kxbyT[5EFXJvpT1Z5^An-ygQ)%7Y+*23j}q)A+eV&nN#yIBzku3wPwy/B98CpzF6^!a}Ud=Bzk&kwF"
    "bh*BAh8kxbyT[9TS6(z/]@d5!!nuph+k*w[+:-BzkVhq/u!@weCs>777BTBAy@3xL?r#BAn5#vrcx%C]cMa5deLHz!aba26j)bx(mM20u@M(5[tu(wOk"
    "}4C$zKTzGGP8x>qq$26j)bx(mM20u@u/2Z7i1A.gdXzXry/x>8m0z/f07C]cL?dHD[<pek.Hx>z6?vruj4zD7T<xj>^@a}Ud!A+fi3vruM61y=p/y-0g53pX@RzE^f$x(v>",
    v2,
    0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_23986FA90(uint64_t a1)
{
  uint64_t v2 = 0;
  void v12[2] = *MEMORY[0x263EF8340];
  v12[0] = a83847776euNPyO;
  v12[1] = a83847776gduK53;
  for (char i = 1; ; char i = 0)
  {
    char v4 = i;
    id v5 = (const char *)v12[v2];
    size_t v6 = strlen(v5);
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v7, v8, v5, v6, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_loadClasses_(TMLContext, v9, v10) & 1) == 0) {
      break;
    }

    uint64_t v2 = 1;
    if ((v4 & 1) == 0) {
      return;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

id sub_23986FF6C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    size_t v6 = objc_msgSend_initWithBase64EncodedString_options_(v3, v4, v5, v2, 0);
  }
  else
  {
    id v7 = objc_msgSend_string(NSString, v4, v5);
    size_t v6 = objc_msgSend_initWithBase64EncodedString_options_(v3, v8, v9, v7, 0);
  }
  return v6;
}

id sub_23987001C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = objc_msgSend_base64EncodedStringWithOptions_(v2, v3, v4, 0);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

id sub_239870090(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [NSString alloc];
    double v8 = objc_msgSend_initWithData_encoding_(v5, v6, v7, v4, a3);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

id sub_239870110(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = objc_msgSend_dataUsingEncoding_(v4, v5, v6, a3);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

id sub_239870188(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = NSNumber;
    uint64_t v6 = objc_msgSend_length(v2, v3, v4);
    double v9 = objc_msgSend_numberWithUnsignedInteger_(v5, v7, v8, v6);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

uint64_t sub_23987020C(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263EFF910], sel_date, a1);
}

void sub_239870218(double a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  if (objc_msgSend_isObject(v19, v4, v5))
  {
    double v8 = objc_msgSend_blockWithFunction_(TMLBlock, v6, v7, v19);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
    dispatch_after(v9, MEMORY[0x263EF83A0], v8);
  }
  else
  {
    double v10 = (void *)MEMORY[0x263F10390];
    double v8 = objc_msgSend_currentContext(MEMORY[0x263F10378], v6, v7);
    double v13 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v10, v11, v12, @"Callback is not a function", v8);
    float64x2_t v16 = objc_msgSend_currentContext(MEMORY[0x263F10378], v14, v15);
    objc_msgSend_setException_(v16, v17, v18, v13);
  }
}

uint64_t sub_239870314(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F08C38], sel_UUID, a1);
}

uint64_t sub_239870320()
{
  uint64_t v0 = MEMORY[0x263EF83A0];
  id v1 = MEMORY[0x263EF83A0];
  return v0;
}

uint64_t sub_239870350(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    uint64_t v5 = objc_msgSend_intValue(v2, v3, v4);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

float sub_2398703C8(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), float v5 = 0.0, (objc_opt_isKindOfClass()))
  {
    objc_msgSend_floatValue(v2, v3, v4);
    float v5 = v6;
  }

  return v5;
}

double sub_239870444(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), double v5 = 0.0, (objc_opt_isKindOfClass()))
  {
    objc_msgSend_doubleValue(v2, v3, v4);
    double v5 = v6;
  }

  return v5;
}

uint64_t sub_2398704C0(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    uint64_t v5 = objc_msgSend_BOOLValue(v2, v3, v4);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

id sub_239870538(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_stringValue(v2, v4, v5);
    }
    else {
      objc_msgSend_string(NSString, v4, v5);
    }
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v6 = v3;

  return v6;
}

id sub_2398705D4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id sub_23987062C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t sub_239870684(double a1, uint64_t a2, void *a3)
{
  return objc_msgSend_isEqual_(a3, (const char *)a3, a1);
}

id sub_23987068C(double a1, uint64_t a2, const char *a3, int a4)
{
  double v5 = objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);
  if ((objc_msgSend_conformsToProtocol_(v5, v6, v7, &unk_26ED1D888) & 1) == 0)
  {
    double v14 = (void *)MEMORY[0x263F10390];
    double v15 = objc_msgSend_currentContext(MEMORY[0x263F10378], v8, v9);
    double v18 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v14, v16, v17, @"Object cannot be cloned", v15);
    long long v21 = objc_msgSend_currentContext(MEMORY[0x263F10378], v19, v20);
    objc_msgSend_setException_(v21, v22, v23, v18);

    float64x2_t v24 = 0;
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = objc_alloc(NSDictionary);
      uint64_t v13 = objc_msgSend_initWithDictionary_copyItems_(v25, v26, v27, v5, 1);
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v13 = objc_msgSend_copyWithZone_(v5, v8, v9, 0);
    goto LABEL_9;
  }
  id v10 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v13 = objc_msgSend_initWithArray_copyItems_(v10, v11, v12, v5, 1);
LABEL_9:
  float64x2_t v24 = (void *)v13;
LABEL_10:

  return v24;
}

void sub_2398707D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_unwrap_(TMLJSNil, v5, v6, a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unwrap_(TMLJSNil, v7, v8, v4);
  double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v9 || objc_msgSend_isEqualToString_(v9, v10, v11, @"undefined"))
  {

    double v9 = @"_";
  }
}

void sub_23987087C(double a1, uint64_t a2, const char *a3)
{
  id v3 = objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);
}

uint64_t sub_2398708B4(double a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](a3, sel_tmlValueForKey_, a1);
}

uint64_t sub_2398708BC(double a1, uint64_t a2, void *a3)
{
  return objc_msgSend_tmlValueForKeyPath_(a3, (const char *)a3, a1);
}

id sub_2398708C4(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v5 = objc_msgSend_currentContext(TMLContext, v3, v4);
  double v8 = objc_msgSend_objectWithIdentifierNoCreate_(v5, v6, v7, v2);

  return v8;
}

id sub_239870934(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = v5;
  double v7 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = objc_msgSend_objectWithIdentifier_(v6, v8, v9, v4);
    }
    else
    {
      double v7 = 0;
    }
  }

  return v7;
}

id sub_2398709CC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = v5;
  double v7 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = objc_msgSend_objectWithIdentifierNoCreate_(v6, v8, v9, v4);
    }
    else
    {
      double v7 = 0;
    }
  }

  return v7;
}

BOOL sub_239870A64(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  double v8 = objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  if (v8)
  {
    id v10 = objc_msgSend_tmlSignalHandlerForSignal_(v4, v7, v9, v8);
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

id sub_239870AE0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  BOOL v11 = objc_msgSend_unwrap_(TMLJSNil, v8, v9, a3);
  if (v11)
  {
    objc_msgSend_tmlSignalHandlerForSignal_(v6, v10, v12, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      id v17 = 0;
      objc_msgSend_emitTMLSignal_withArguments_returnValue_(v6, v14, v15, v11, v7, &v17);
      id v13 = v17;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id sub_239870BA8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = objc_msgSend_ensureClass_(TMLRuntime, v3, v4, v2);
  double v8 = objc_msgSend_objcClass(v5, v6, v7);

  return v8;
}

uint64_t sub_239870CC4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v8 = objc_msgSend_ensureClass_(TMLRuntime, v6, v7, v5);
  objc_msgSend_objcClass(v8, v9, v10);
  isKindOfClass Class = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_239870DF0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char isNil = objc_msgSend_isNil_(TMLJSNil, v6, v7, v4);
  BOOL v11 = 1;
  if (v4 && (isNil & 1) == 0)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v11 = v12 == v4;
  }
  char v13 = objc_msgSend_isNil_(TMLJSNil, v9, v10, v5);
  BOOL v20 = 0;
  if (v5 && (v13 & 1) == 0)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    char v17 = v16 == v5 || v11;
    if ((v17 & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (v4 == v5 || (objc_msgSend_isEqualToDictionary_(v4, v18, v19, v5) & 1) != 0))
        {
          BOOL v20 = 1;
        }
      }
    }
  }

  return v20;
}

uint64_t sub_239870F00(double a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](a3, sel_boundingRectWithSize_options_attributes_context_, a1);
}

void sub_23987299C(uint64_t a1)
{
  size_t v2 = strlen(a838477763loe1q);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a838477763loe1q, v2, 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend_stringWithFormat_(NSString, v7, v8, @"%@%@IndexPath", @"UI", @"Mutable");
    double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    Class v10 = NSClassFromString(v9);
    objc_msgSend_tmlMakeJSObjectClass(v10, v11, v12);
  }
}

void sub_239872F38(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_description(a2, v5, v6);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = objc_msgSend_description(v4, v7, v8);

  id v10 = objc_alloc(MEMORY[0x263F1C400]);
  id v13 = objc_msgSend_description(v22, v11, v12);
  id v16 = objc_msgSend_description(v9, v14, v15);
  double v19 = objc_msgSend_initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles_(v10, v17, v18, v13, v16, 0, @"OK", 0);

  objc_msgSend_show(v19, v20, v21);
}

double sub_239873014(double a1, uint64_t a2, const char *a3)
{
  id v3 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a3, a1);
  double v6 = objc_msgSend_systemVersion(v3, v4, v5);
  objc_msgSend_doubleValue(v6, v7, v8);
  double v10 = v9;

  return v10;
}

id sub_23987306C(double a1, uint64_t a2, const char *a3)
{
  double v5 = objc_msgSend_unwrap_(TMLJSNil, a3, a1);
  id v6 = objc_alloc(MEMORY[0x263F816F0]);
  double v8 = objc_msgSend_initWithTextAlignment_location_options_(v6, v7, a1, a3, v5);

  return v8;
}

uint64_t sub_2398730E4(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F088C8], sel_indexPathForRow_inSection_, a1);
}

uint64_t sub_2398730F8(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F088C8], sel_indexPathForItem_inSection_, a1);
}

uint64_t sub_23987310C(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F088D0], sel_indexSetWithIndex_, a1);
}

id sub_23987311C(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v46 = a3;
  id v7 = a2;
  id v8 = a4;
  objc_msgSend_unwrap_(TMLJSNil, v9, v10, a5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();
    double v15 = v7;
    if (isKindOfClass)
    {
      double v15 = objc_msgSend_componentsJoinedByString_(v7, v12, v14, @"-");
    }
    id v16 = objc_msgSend_currentContext(TMLJSEnvironment, v12, v14, v46);
    id v17 = v15;
    id v18 = v16;
    if (qword_268A05928 != -1) {
      dispatch_once(&qword_268A05928, &unk_26ECEDC08);
    }
    id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v22 = objc_msgSend_initWithCapacity_(v19, v20, v21, 16);
    double v23 = (void *)qword_268A05920;
    uint64_t v26 = objc_msgSend_length(v17, v24, v25);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = sub_23987CE60;
    v52[3] = &unk_264DAEA78;
    id v53 = v17;
    id v54 = v18;
    id v27 = v22;
    id v55 = v27;
    id v28 = v18;
    id v29 = v17;
    objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v23, v30, v31, v29, 0, 0, v26, v52);
    uint64_t v32 = v55;
    id v11 = v27;

    if (isKindOfClass) {
  }
    }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = objc_alloc(MEMORY[0x263EFF980]);
    double v36 = objc_msgSend_initWithCapacity_(v33, v34, v35, 64);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = sub_2398734DC;
    v47[3] = &unk_264DAE850;
    id v37 = v36;
    id v48 = v37;
    uint64_t v51 = v46;
    id v49 = v8;
    id v38 = v11;
    id v50 = v38;
    objc_msgSend_enumerateObjectsUsingBlock_(v7, v39, v40, v47);
    double v41 = v50;
    id v42 = v37;

    id v11 = v38;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(MEMORY[0x263F08938], v43, v44, v7, v46, v8, v11);
    }
    else {
      objc_msgSend_array(MEMORY[0x263EFF8C0], v43, v44);
    }
    id v42 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v42;
}

void sub_239873468(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    double v5 = objc_msgSend_currentContext(TMLJSEnvironment, v3, v4);
    objc_msgSend_raiseException_(v5, v6, v7, v2);

    objc_msgSend_array(MEMORY[0x263EFF8C0], v8, v9);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x239873410);
  }
  _Unwind_Resume(exception_object);
}

void sub_2398734DC(void *a1, const char *a2, double a3)
{
  id v3 = (void *)a1[4];
  objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(MEMORY[0x263F08938], a2, a3, a2, a1[7], a1[5], a1[6]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v3, v4, v5, v6);
}

id sub_239873544(double a1, double a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9)
{
  id v16 = a8;
  id v19 = objc_msgSend_unwrap_(TMLJSNil, v17, v18, a5);
  id v22 = objc_msgSend_unwrap_(TMLJSNil, v20, v21, v16);

  float64x2_t v24 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v23, a1, v19, a6, a7, v22, a9, a2);
  id v27 = v24;
  if (a3 > 0.0)
  {
    *(float *)&double v26 = a3;
    objc_msgSend_setPriority_(v24, v25, v26);
  }

  return v27;
}

id sub_2398736A0(float a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a1 > 0.0)
    {
      *(float *)&double v6 = a1;
      objc_msgSend_setPriority_(v4, v5, v6);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      void v9[2] = sub_239873790;
      v9[3] = &unk_264DAE8B0;
      float v10 = a1;
      objc_msgSend_enumerateObjectsUsingBlock_(v4, v7, COERCE_DOUBLE(3221225472), v9);
    }
  }
  return v4;
}

void sub_239873790(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 32);
    if (*(float *)&v4 > 0.0) {
      objc_msgSend_setPriority_(v5, v3, v4);
    }
  }
}

id sub_239873804(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = UIImagePNGRepresentation(v2);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_239873874(CGFloat a1, uint64_t a2, void *a3)
{
  double v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = UIImageJPEGRepresentation(v4, a1);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

BOOL sub_2398738F4(double a1, uint64_t a2, void *a3)
{
  return (unint64_t)(objc_msgSend_integerValue(a3, (const char *)a3, a1) - 3) < 2;
}

BOOL sub_23987391C(double a1, uint64_t a2, void *a3)
{
  return (unint64_t)(objc_msgSend_integerValue(a3, (const char *)a3, a1) - 1) < 2;
}

BOOL sub_239873944(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_horizontalSizeClass(v2, v3, v4) != 0;

  return v5;
}

BOOL sub_2398739A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_verticalSizeClass(v2, v3, v4) != 0;

  return v5;
}

void sub_239873A04(double a1, double a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v34 = a5;
  id v10 = a6;
  if (objc_msgSend_isObject(v34, v11, v12))
  {
    double v15 = objc_msgSend_blockWithFunction_(TMLBlock, v13, v14, v34);
    if (objc_msgSend_isObject(v10, v16, v17))
    {
      BOOL v20 = objc_msgSend_stringWithUTF8String_(NSString, v18, v19, "B");
      double v23 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v21, v22, v10, v20);
      float64x2_t v24 = (void *)MEMORY[0x23ECA7DD0]();

      objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], v25, a1, a4, v15, v24, a2);
    }
    else
    {
      float64x2_t v24 = 0;
      objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], v18, a1, a4, v15, 0, a2);
    }
  }
  else
  {
    double v26 = (void *)MEMORY[0x263F10390];
    double v15 = objc_msgSend_currentContext(MEMORY[0x263F10378], v13, v14);
    float64x2_t v24 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v26, v27, v28, @"Animations is not a function", v15);
    double v31 = objc_msgSend_currentContext(MEMORY[0x263F10378], v29, v30);
    objc_msgSend_setException_(v31, v32, v33, v24);
  }
}

void sub_239873B78(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v38 = a7;
  id v14 = a8;
  if (objc_msgSend_isObject(v38, v15, v16))
  {
    double v19 = objc_msgSend_blockWithFunction_(TMLBlock, v17, v18, v38);
    if (objc_msgSend_isObject(v14, v20, v21))
    {
      float64x2_t v24 = objc_msgSend_stringWithUTF8String_(NSString, v22, v23, "B");
      id v27 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v25, v26, v14, v24);
      double v28 = (void *)MEMORY[0x23ECA7DD0]();

      objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(MEMORY[0x263F1CB60], v29, a1, a6, v19, v28, a2, a3, a4);
    }
    else
    {
      double v28 = 0;
      objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(MEMORY[0x263F1CB60], v22, a1, a6, v19, 0, a2, a3, a4);
    }
  }
  else
  {
    double v30 = (void *)MEMORY[0x263F10390];
    double v19 = objc_msgSend_currentContext(MEMORY[0x263F10378], v17, v18);
    double v28 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v30, v31, v32, @"Animations is not a function", v19);
    double v35 = objc_msgSend_currentContext(MEMORY[0x263F10378], v33, v34);
    objc_msgSend_setException_(v35, v36, v37, v28);
  }
}

void sub_239873D04(double a1, double a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v34 = a5;
  id v10 = a6;
  if (objc_msgSend_isObject(v34, v11, v12))
  {
    double v15 = objc_msgSend_blockWithFunction_(TMLBlock, v13, v14, v34);
    if (objc_msgSend_isObject(v10, v16, v17))
    {
      BOOL v20 = objc_msgSend_stringWithUTF8String_(NSString, v18, v19, "B");
      double v23 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v21, v22, v10, v20);
      float64x2_t v24 = (void *)MEMORY[0x23ECA7DD0]();

      objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], v25, a1, a4, v15, v24, a2);
    }
    else
    {
      float64x2_t v24 = 0;
      objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], v18, a1, a4, v15, 0, a2);
    }
  }
  else
  {
    double v26 = (void *)MEMORY[0x263F10390];
    double v15 = objc_msgSend_currentContext(MEMORY[0x263F10378], v13, v14);
    float64x2_t v24 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v26, v27, v28, @"Animations is not a function", v15);
    double v31 = objc_msgSend_currentContext(MEMORY[0x263F10378], v29, v30);
    objc_msgSend_setException_(v31, v32, v33, v24);
  }
}

void sub_239873E78(double a1, double a2, uint64_t a3, void *a4)
{
  id v21 = a4;
  if (objc_msgSend_isObject(v21, v6, v7))
  {
    id v10 = objc_msgSend_blockWithFunction_(TMLBlock, v8, v9, v21);
    objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F1CB60], v11, a1, v10, a2);
  }
  else
  {
    double v12 = (void *)MEMORY[0x263F10390];
    id v10 = objc_msgSend_currentContext(MEMORY[0x263F10378], v8, v9);
    double v15 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v12, v13, v14, @"Animations is not a function", v10);
    double v18 = objc_msgSend_currentContext(MEMORY[0x263F10378], v16, v17);
    objc_msgSend_setException_(v18, v19, v20, v15);
  }
}

void sub_239873F68(double a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v35 = a3;
  id v10 = a5;
  id v11 = a6;
  if (objc_msgSend_isObject(v10, v12, v13))
  {
    double v16 = objc_msgSend_blockWithFunction_(TMLBlock, v14, v15, v10);
    if (objc_msgSend_isObject(v11, v17, v18))
    {
      id v21 = objc_msgSend_stringWithUTF8String_(NSString, v19, v20, "B");
      float64x2_t v24 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v22, v23, v11, v21);
      double v25 = (void *)MEMORY[0x23ECA7DD0]();

      objc_msgSend_transitionWithView_duration_options_animations_completion_(MEMORY[0x263F1CB60], v26, a1, v35, a4, v16, v25);
    }
    else
    {
      double v25 = 0;
      objc_msgSend_transitionWithView_duration_options_animations_completion_(MEMORY[0x263F1CB60], v19, a1, v35, a4, v16, 0);
    }
  }
  else
  {
    id v27 = (void *)MEMORY[0x263F10390];
    double v16 = objc_msgSend_currentContext(MEMORY[0x263F10378], v14, v15);
    double v25 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v27, v28, v29, @"Animations is not a function", v16);
    double v32 = objc_msgSend_currentContext(MEMORY[0x263F10378], v30, v31);
    objc_msgSend_setException_(v32, v33, v34, v25);
  }
}

void sub_2398740F0(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  id v11 = a4;
  objc_msgSend_unwrap_(TMLJSNil, v12, v13, a3);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  double v16 = objc_msgSend_unwrap_(TMLJSNil, v14, v15, v11);

  if (objc_msgSend_isObject(v10, v17, v18))
  {
    id v21 = objc_msgSend_stringWithUTF8String_(NSString, v19, v20, "B");
    float64x2_t v24 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v22, v23, v10, v21);
    double v25 = (void *)MEMORY[0x23ECA7DD0]();
  }
  else
  {
    double v25 = 0;
  }
  objc_msgSend_transitionFromView_toView_duration_options_completion_(MEMORY[0x263F1CB60], v19, a1, v26, v16, a5, v25);
}

void sub_239874228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a5;
  id v11 = a6;
  objc_msgSend_unwrap_(TMLJSNil, v12, v13, a3);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isObject(v10, v14, v15))
  {
    double v18 = objc_msgSend_blockWithFunction_(TMLBlock, v16, v17, v10);
    if (objc_msgSend_isObject(v11, v19, v20))
    {
      double v23 = objc_msgSend_stringWithUTF8String_(NSString, v21, v22, "B");
      id v26 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v24, v25, v11, v23);
      id v27 = (void *)MEMORY[0x23ECA7DD0]();

      objc_msgSend_performSystemAnimation_onViews_options_animations_completion_(MEMORY[0x263F1CB60], v28, v29, a2, v38, a4, v18, v27);
    }
    else
    {
      id v27 = 0;
      objc_msgSend_performSystemAnimation_onViews_options_animations_completion_(MEMORY[0x263F1CB60], v21, v22, a2, v38, a4, v18, 0);
    }
  }
  else
  {
    double v30 = (void *)MEMORY[0x263F10390];
    double v18 = objc_msgSend_currentContext(MEMORY[0x263F10378], v16, v17);
    id v27 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v30, v31, v32, @"Animations is not a function", v18);
    id v35 = objc_msgSend_currentContext(MEMORY[0x263F10378], v33, v34);
    objc_msgSend_setException_(v35, v36, v37, v27);
  }
}

void sub_2398743B8(uint64_t a1, void *a2)
{
  id v18 = a2;
  if (objc_msgSend_isObject(v18, v2, v3))
  {
    double v6 = objc_msgSend_blockWithFunction_(TMLBlock, v4, v5, v18);
    objc_msgSend_performWithoutAnimation_(MEMORY[0x263F1CB60], v7, v8, v6);
  }
  else
  {
    double v9 = (void *)MEMORY[0x263F10390];
    double v6 = objc_msgSend_currentContext(MEMORY[0x263F10378], v4, v5);
    double v12 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v9, v10, v11, @"Animations is not a function", v6);
    double v15 = objc_msgSend_currentContext(MEMORY[0x263F10378], v13, v14);
    objc_msgSend_setException_(v15, v16, v17, v12);
  }
}

uint64_t sub_239874490(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1CB60], sel_setAnimationsEnabled_, a1);
}

void sub_2398744D4(double a1, uint64_t a2, const char *a3)
{
  UIAccessibilityNotifications v3 = a3;
  objc_msgSend_unwrap_(TMLJSNil, a3, a1);
  id argument = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = objc_msgSend_attributedString(argument, v4, v5);
    UIAccessibilityPostNotification(v3, v6);
  }
  else
  {
    UIAccessibilityPostNotification(v3, argument);
  }
}

BOOL sub_239874570(int a1, UIContentSizeCategory category)
{
  return UIContentSizeCategoryIsAccessibilityCategory(category);
}

id sub_239874578(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    UIAccessibilityNotifications v3 = v2;
  }
  else {
    UIAccessibilityNotifications v3 = 0;
  }
  double v4 = UIAccessibilityFocusedElement(v3);

  return v4;
}

id sub_2398745E4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (objc_msgSend_isObject(v7, v8, v9))
  {
    double v12 = objc_msgSend_stringWithUTF8String_(NSString, v10, v11, "@");
    double v15 = objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v13, v14, v7, v12);
    double v16 = (void *)MEMORY[0x23ECA7DD0]();
  }
  else
  {
    double v16 = 0;
  }
  double v17 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F1C3F0], v10, v11, v6, a3, v16);

  return v17;
}

uint64_t sub_23987CE10(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], a3, a1, @"\\[(\\w+)[^\\]]*\\]", 0, 0);
  uint64_t v4 = qword_268A05920;
  qword_268A05920 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

void sub_23987CE60(uint64_t a1, void *a2, double a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_msgSend_rangeAtIndex_(a2, (const char *)a2, a3, 1);
  objc_msgSend_substringWithRange_(v4, v6, v7, v5, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = objc_msgSend_objectWithIdentifier_(*(void **)(a1 + 40), v8, v9, v13);
  objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v11, v12, v10, v13);
}

void sub_23987CEEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, v5, &unk_26ECEDC28, @"image");
  double v8 = objc_msgSend_objectForKeyedSubscript_(v3, v6, v7, @"image");
  objc_msgSend_setObject_forKeyedSubscript_(v8, v9, v10, &unk_26ECEDC48, @"systemImageNamed");

  objc_msgSend_objectForKeyedSubscript_(v3, v11, v12, @"image");
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v15, v13, v14, &unk_26ECEDC68, @"withdata");
}

uint64_t sub_23987CFA8(double a1, uint64_t a2, const char *a3)
{
  return objc_msgSend_imageNamed_(MEMORY[0x263F1C6B0], a3, a1, a3);
}

id sub_23987CFB8(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v5 = objc_msgSend_systemImageNamed_(MEMORY[0x263F1C6B0], v3, v4, v2);
  double v8 = v5;
  if (v5)
  {
    id v9 = v5;
  }
  else
  {
    objc_msgSend_imageNamed_(MEMORY[0x263F1C6B0], v6, v7, v2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v10 = v9;

  return v10;
}

id sub_23987D038(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc(MEMORY[0x263F1C6B0]);
    id v6 = objc_msgSend_initWithData_(v3, v4, v5, v2);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t sub_23987D0B0(void *a1)
{
  id v1 = a1;
  return objc_msgSend_CGImage(v1, v2, v3);
}

id sub_23987D0E4(void *a1, const char *a2, double a3)
{
  objc_msgSend_size(a1, a2, a3);
  if (v4 <= 4.0) {
    double v6 = v4 * 64.0;
  }
  else {
    double v6 = v4;
  }
  if (v5 <= 4.0) {
    double v7 = v5 * 64.0;
  }
  else {
    double v7 = v5;
  }
  id v8 = a1;
  objc_msgSend_size(v8, v9, v10);
  if (v6 != v12 || v7 != v13)
  {
    v20.width = v6;
    v20.height = v7;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    objc_msgSend_drawAsPatternInRect_(v8, v15, 0.0, 0.0, v6, v7);
    uint64_t v16 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    id v8 = (id)v16;
  }
  double v17 = objc_msgSend_colorWithPatternImage_(MEMORY[0x263F1C550], v11, v12, v8);

  return v17;
}

uint64_t sub_23987D1C0(uint64_t a1, const char *a2, void *a3, double a4)
{
  objc_msgSend_UIEdgeInsets(a3, a2, a4);
  return MEMORY[0x270F9A6D0](a1, sel_resizableImageWithCapInsets_resizingMode_, v5);
}

id sub_23987D204(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a1;
  double v12 = (CGImage *)objc_msgSend_CGImage(v9, v10, v11);
  v19.origin.double x = a2;
  v19.origin.double y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  double v13 = CGImageCreateWithImageInRect(v12, v19);
  uint64_t v16 = objc_msgSend_imageWithCGImage_(MEMORY[0x263F1C6B0], v14, v15, v13);
  CGImageRelease(v13);
  return v16;
}

id sub_23987D294(void *a1, const char *a2, double a3)
{
  objc_msgSend_size(a1, a2, a3);
  double v4 = v3;
  double v6 = v5;
  double v7 = [TMLRect alloc];
  id v9 = objc_msgSend_initWithRect_(v7, v8, 0.0, 0.0, v4, v6);
  return v9;
}

double sub_23987D2EC(void *a1, const char *a2, double a3)
{
  objc_msgSend_size(a1, a2, a3);
  double result = v3 / v4;
  if (v4 <= 0.0) {
    return 1.0;
  }
  return result;
}

double sub_23987D314(void *a1, const char *a2, double a3)
{
  objc_msgSend_size(a1, a2, a3);
  return v3;
}

void sub_23987DC8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_23987DCAC(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v15 = a3;
  id v9 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v7, v8, a2);
  double v12 = v9;
  if (v9
    && (objc_msgSend_isEqual_(v9, v10, v11, v15) & 1) == 0
    && (objc_msgSend_canMergeFromPropertyDescriptor_(v12, v13, v14, v15) & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_23987DD50(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v13 = a3;
  id v9 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v7, v8, a2);
  double v12 = v9;
  if (v9 && (objc_msgSend_isEqual_(v9, v10, v11, v13) & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_23987DDE4(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v13 = a3;
  id v9 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v7, v8, a2);
  double v12 = v9;
  if (v9 && (objc_msgSend_isEqual_(v9, v10, v11, v13) & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_23987E104(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = objc_msgSend_objectForKey_(v5, v7, v8, v15);
  int isEqual = objc_msgSend_isEqual_(v9, v10, v11, v6);

  if (isEqual) {
    objc_msgSend_removeObjectForKey_(*(void **)(a1 + 32), v13, v14, v15);
  }
}

uint64_t sub_23987E198(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addProperty_(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_23987E1A0(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addMethod_(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_23987E1A8(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addSignal_(*(void **)(a1 + 32), a2, a3);
}

void sub_23987E494(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  double v5 = malloc_type_malloc(0x30uLL, 0x10700407919B52CuLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 56) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_23987E50C(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  double v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_23987E584(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  double v5 = malloc_type_malloc(0x80uLL, 0x10F0040B03B4CD9uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 104) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_23987E5FC(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  double v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 88) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_23987E9DC(objc_class *a1)
{
  InstanceMethod = class_getInstanceMethod(a1, sel_loadView);
  double v3 = class_getInstanceMethod(a1, sel_tmlLoadViewOverride);
  method_exchangeImplementations(InstanceMethod, v3);
  double v4 = class_getInstanceMethod(a1, sel_viewDidLoad);
  double v5 = class_getInstanceMethod(a1, sel_tmlViewDidLoad);
  method_exchangeImplementations(v4, v5);
  id v6 = class_getInstanceMethod(a1, sel_viewWillAppear_);
  double v7 = class_getInstanceMethod(a1, sel_tmlViewWillAppear_);
  method_exchangeImplementations(v6, v7);
  id v8 = class_getInstanceMethod(a1, sel_viewDidAppear_);
  id v9 = class_getInstanceMethod(a1, sel_tmlViewDidAppear_);
  method_exchangeImplementations(v8, v9);
  double v10 = class_getInstanceMethod(a1, sel_viewWillDisappear_);
  double v11 = class_getInstanceMethod(a1, sel_tmlViewWillDisappear_);
  method_exchangeImplementations(v10, v11);
  double v12 = class_getInstanceMethod(a1, sel_viewDidDisappear_);
  id v13 = class_getInstanceMethod(a1, sel_tmlViewDidDisappear_);
  method_exchangeImplementations(v12, v13);
  double v14 = class_getInstanceMethod(a1, sel_viewWillLayoutSubviews);
  id v15 = class_getInstanceMethod(a1, sel_tmlViewWillLayoutSubviews);
  method_exchangeImplementations(v14, v15);
  uint64_t v16 = class_getInstanceMethod(a1, sel_viewDidLayoutSubviews);
  double v17 = class_getInstanceMethod(a1, sel_tmlViewDidLayoutSubviews);
  method_exchangeImplementations(v16, v17);
  id v18 = class_getInstanceMethod(a1, sel_willMoveToParentViewController_);
  CGRect v19 = class_getInstanceMethod(a1, sel_tmlWillMoveToParentViewController_);
  method_exchangeImplementations(v18, v19);
  CGSize v20 = class_getInstanceMethod(a1, sel_updateViewConstraints);
  id v21 = class_getInstanceMethod(a1, sel_tmlUpdateViewConstraints);
  method_exchangeImplementations(v20, v21);
  double v22 = class_getInstanceMethod(a1, sel_encodeRestorableStateWithCoder_);
  double v23 = class_getInstanceMethod(a1, sel_tmlEncodeRestorableStateWithCoder_);
  method_exchangeImplementations(v22, v23);
  float64x2_t v24 = class_getInstanceMethod(a1, sel_decodeRestorableStateWithCoder_);
  double v25 = class_getInstanceMethod(a1, sel_tmlDecodeRestorableStateWithCoder_);
  method_exchangeImplementations(v24, v25);
  id v26 = class_getInstanceMethod(a1, sel_viewWillTransitionToSize_withTransitionCoordinator_);
  id v27 = class_getInstanceMethod(a1, sel_tmlViewWillTransitionToSize_withTransitionCoordinator_);
  method_exchangeImplementations(v26, v27);
  double v28 = class_getInstanceMethod(a1, sel_willTransitionToTraitCollection_withTransitionCoordinator_);
  double v29 = class_getInstanceMethod(a1, sel_tmlWillTransitionToTraitCollection_withTransitionCoordinator_);
  method_exchangeImplementations(v28, v29);
  double v30 = class_getInstanceMethod(a1, sel_previewActionItems);
  double v31 = class_getInstanceMethod(a1, sel_tmlPreviewActionItems);
  method_exchangeImplementations(v30, v31);
  double v32 = class_getInstanceMethod(a1, sel_traitCollectionDidChange_);
  double v33 = class_getInstanceMethod(a1, sel_tmlTraitCollectionDidChange_);
  method_exchangeImplementations(v32, v33);
  double v34 = class_getInstanceMethod(a1, sel_accessibilityPerformEscape);
  id v35 = class_getInstanceMethod(a1, sel_tmlAccessibilityPerformEscape);
  method_exchangeImplementations(v34, v35);
  double v36 = class_getInstanceMethod(a1, sel_accessibilityPerformMagicTap);
  double v37 = class_getInstanceMethod(a1, sel_tmlAccessibilityPerformMagicTap);
  method_exchangeImplementations(v36, v37);
  id v38 = class_getInstanceMethod(a1, sel_preferredStatusBarStyle);
  id v39 = class_getInstanceMethod(a1, sel_tmlPreferredStatusBarStyle);
  method_exchangeImplementations(v38, v39);
  double v40 = class_getInstanceMethod(a1, sel_prefersStatusBarHidden);
  double v41 = class_getInstanceMethod(a1, sel_tmlPrefersStatusBarHidden);
  method_exchangeImplementations(v40, v41);
  id v42 = class_getInstanceMethod(a1, sel_preferredStatusBarUpdateAnimation);
  uint64_t v43 = class_getInstanceMethod(a1, sel_tmlPreferredStatusBarUpdateAnimation);
  method_exchangeImplementations(v42, v43);
  double v44 = class_getInstanceMethod(a1, sel_childViewControllerForStatusBarStyle);
  double v45 = class_getInstanceMethod(a1, sel_tmlChildViewControllerForStatusBarStyle);
  method_exchangeImplementations(v44, v45);
  uint64_t v46 = class_getInstanceMethod(a1, sel_childViewControllerForStatusBarHidden);
  double v47 = class_getInstanceMethod(a1, sel_tmlChildViewControllerForStatusBarHidden);
  method_exchangeImplementations(v46, v47);
  id v48 = class_getInstanceMethod(a1, sel_shouldAutorotate);
  id v49 = class_getInstanceMethod(a1, sel_tmlShouldAutorotate);
  method_exchangeImplementations(v48, v49);
  id v50 = class_getInstanceMethod(a1, sel_supportedInterfaceOrientations);
  uint64_t v51 = class_getInstanceMethod(a1, sel_tmlSupportedInterfaceOrientations);
  method_exchangeImplementations(v50, v51);
  double v52 = class_getInstanceMethod(a1, sel_preferredInterfaceOrientationForPresentation);
  id v53 = class_getInstanceMethod(a1, sel_tmlPreferredInterfaceOrientationForPresentation);
  method_exchangeImplementations(v52, v53);
}

id sub_23987EEE4(void *a1)
{
  return objc_getAssociatedObject(a1, "covpshashpc");
}

id sub_23987EEF0()
{
  uint64_t v0 = NSString;
  uint64_t v1 = (objc_class *)objc_opt_class();
  Name = class_getName(v1);
  double v5 = objc_msgSend_stringWithUTF8String_(v0, v3, v4, Name);
  id v8 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v6, v7);
  double v11 = objc_msgSend_pathForResource_ofType_(v8, v9, v10, v5, @"tml");

  return v11;
}

void sub_23987EF80(void *a1, uint64_t a2, void *a3)
{
}

id sub_23987EF90(void *a1)
{
  return objc_getAssociatedObject(a1, "ovpshashpc");
}

TMLContext *sub_23987EF9C(void *a1)
{
  objc_getAssociatedObject(a1, "covpshashpc");
  id v2 = (TMLContext *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    double v3 = objc_alloc_init(TMLContext);
    id v6 = objc_msgSend_tmlObjects(a1, v4, v5);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = sub_23987F170;
    v20[3] = &unk_264DAC1A8;
    id v2 = v3;
    id v21 = v2;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, v8, v20);

    double v11 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v9, v10, a1);
    objc_msgSend_addObject_withIdentifier_(v2, v12, v13, v11, @"owner");

    objc_setAssociatedObject(a1, "covpshashpc", v2, (void *)1);
    objc_initWeak(&location, v2);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_23987F17C;
    v17[3] = &unk_264DAC1D0;
    objc_copyWeak(&v18, &location);
    objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v14, v15, v17, a1);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void sub_23987F154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_23987F170(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_23987F17C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);
}

void sub_23987F1BC(void *a1)
{
  double v2 = objc_getAssociatedObject(a1, "covpshashpc");
  objc_msgSend_dispose(v2, v3, v4);

  objc_setAssociatedObject(a1, "covpshashpc", 0, (void *)1);
}

uint64_t sub_23987F224(void *a1, const char *a2, double a3)
{
  int isViewLoaded = objc_msgSend_isViewLoaded(a1, a2, a3);
  double v7 = objc_msgSend_tmlViewPath(a1, v5, v6);
  uint64_t ViewControllerFromPath = objc_msgSend_tmlLoadViewControllerFromPath_(a1, v8, v9, v7);

  if (ViewControllerFromPath && isViewLoaded)
  {
    double v13 = objc_msgSend_view(a1, v11, v12);
    objc_msgSend_bounds(v13, v14, v15);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    double v24 = *MEMORY[0x263F001A8];
    double v25 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v26 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v27 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v30 = objc_msgSend_view(a1, v28, v29);
    objc_msgSend_setBounds_(v30, v31, v24, v25, v26, v27);

    double v34 = objc_msgSend_view(a1, v32, v33);
    objc_msgSend_setBounds_(v34, v35, v17, v19, v21, v23);

    id v38 = objc_msgSend_view(a1, v36, v37);
    objc_msgSend_layoutIfNeeded(v38, v39, v40);
  }
  return ViewControllerFromPath;
}

uint64_t sub_23987F344(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int isViewLoaded = objc_msgSend_isViewLoaded(a1, v5, v6);
  uint64_t ViewControllerWithSource = objc_msgSend_tmlLoadViewControllerWithSource_(a1, v8, v9, v4);

  if (ViewControllerWithSource && isViewLoaded)
  {
    double v13 = objc_msgSend_view(a1, v11, v12);
    objc_msgSend_bounds(v13, v14, v15);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    double v24 = *MEMORY[0x263F001A8];
    double v25 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v26 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v27 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v30 = objc_msgSend_view(a1, v28, v29);
    objc_msgSend_setBounds_(v30, v31, v24, v25, v26, v27);

    double v34 = objc_msgSend_view(a1, v32, v33);
    objc_msgSend_setBounds_(v34, v35, v17, v19, v21, v23);

    id v38 = objc_msgSend_view(a1, v36, v37);
    objc_msgSend_layoutIfNeeded(v38, v39, v40);
  }
  return ViewControllerWithSource;
}

id sub_23987F460(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  double v9 = objc_msgSend__tmlEnsureContext(a1, v7, v8);
  objc_msgSend_loadSource_(v9, v10, v11, v4);

  double v14 = objc_msgSend__tmlEnsureContext(a1, v12, v13);
  double v17 = objc_msgSend_rootObject(v14, v15, v16);

  return v17;
}

id sub_23987F4EC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  double v9 = objc_msgSend__tmlEnsureContext(a1, v7, v8);
  objc_msgSend_loadSourceFromPath_(v9, v10, v11, v4);

  double v14 = objc_msgSend__tmlEnsureContext(a1, v12, v13);
  double v17 = objc_msgSend_rootObject(v14, v15, v16);

  return v17;
}

uint64_t sub_23987F578(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  double v9 = objc_msgSend__tmlEnsureContext(a1, v7, v8);
  objc_msgSend_loadSourceFromPath_(v9, v10, v11, v4);

  double v14 = objc_msgSend__tmlEnsureContext(a1, v12, v13);
  double v17 = objc_msgSend_rootObject(v14, v15, v16);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_setView_(a1, v18, v19, v17);
  }
  else if ((objc_msgSend_isEqual_(v17, v18, v19, a1) & 1) == 0)
  {
    double v23 = (void *)MEMORY[0x263EFF940];
    double v24 = objc_msgSend_stringWithFormat_(NSString, v20, v21, @"Expected to load UIViewController or UIView for %@", v17);
    double v27 = objc_msgSend_exceptionWithName_reason_userInfo_(v23, v25, v26, @"TMLRuntimeException", v24, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v28, v29, v27);

    uint64_t v22 = 0;
    goto LABEL_6;
  }
  uint64_t v22 = 1;
LABEL_6:

  return v22;
}

uint64_t sub_23987F6BC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  double v9 = objc_msgSend__tmlEnsureContext(a1, v7, v8);
  objc_msgSend_loadSource_(v9, v10, v11, v4);

  double v14 = objc_msgSend__tmlEnsureContext(a1, v12, v13);
  double v17 = objc_msgSend_rootObject(v14, v15, v16);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_setView_(a1, v18, v19, v17);
  }
  else if ((objc_msgSend_isEqual_(v17, v18, v19, a1) & 1) == 0)
  {
    double v23 = (void *)MEMORY[0x263EFF940];
    double v24 = objc_msgSend_stringWithFormat_(NSString, v20, v21, @"Expected to load UIViewController or UIView for %@", v17);
    double v27 = objc_msgSend_exceptionWithName_reason_userInfo_(v23, v25, v26, @"TMLRuntimeException", v24, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v28, v29, v27);

    uint64_t v22 = 0;
    goto LABEL_6;
  }
  uint64_t v22 = 1;
LABEL_6:

  return v22;
}

void sub_23987F800(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_isEqualToString_(v7, v8, v9, @"view")
    && (objc_msgSend_isViewLoaded(a1, v10, v11) & 1) == 0)
  {
    objc_setAssociatedObject(a1, "vpshashpc", v6, (void *)1);
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_26ED45A98;
    objc_msgSendSuper2(&v12, sel_setTMLValue_forKeyPath_, v6, v7);
  }
}

void sub_23987F8A8(void *a1)
{
  double v3 = objc_getAssociatedObject(a1, "vpshashpc");
  if (v3)
  {
    objc_setAssociatedObject(a1, "vpshashpc", 0, (void *)1);
    v5.receiver = a1;
    v5.super_class = (Class)&off_26ED45A98;
    objc_msgSendSuper2(&v5, sel_setTMLValue_forKeyPath_, v3, @"view");
  }
  else
  {
    objc_msgSend_tmlLoadViewOverride(a1, v2, v4);
  }
}

uint64_t sub_23987F938(void *a1, const char *a2, double a3)
{
  objc_msgSend_tmlViewDidLoad(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, @"viewDidLoad", 0);
}

void sub_23987F97C(void *a1, const char *a2, uint64_t a3, double a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_msgSend_tmlViewWillAppear_(a1, a2, a4);
  double v8 = objc_msgSend_numberWithBool_(NSNumber, v6, v7, a3);
  v14[0] = v8;
  double v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v14, 1);
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, @"viewWillAppear", v11);
}

void sub_23987FA34(void *a1, const char *a2, uint64_t a3, double a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_msgSend_tmlViewDidAppear_(a1, a2, a4);
  double v8 = objc_msgSend_numberWithBool_(NSNumber, v6, v7, a3);
  v14[0] = v8;
  double v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v14, 1);
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, @"viewDidAppear", v11);
}

void sub_23987FAEC(void *a1, const char *a2, uint64_t a3, double a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_msgSend_tmlViewWillDisappear_(a1, a2, a4);
  double v8 = objc_msgSend_numberWithBool_(NSNumber, v6, v7, a3);
  v14[0] = v8;
  double v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v14, 1);
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, @"viewWillDisappear", v11);
}

void sub_23987FBA4(void *a1, const char *a2, uint64_t a3, double a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_msgSend_tmlViewDidDisappear_(a1, a2, a4);
  double v8 = objc_msgSend_numberWithBool_(NSNumber, v6, v7, a3);
  v14[0] = v8;
  double v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v10, v14, 1);
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, @"viewDidDisappear", v11);
}

uint64_t sub_23987FC5C(void *a1, const char *a2, double a3)
{
  objc_msgSend_tmlViewWillLayoutSubviews(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, @"viewWillLayoutSubviews", 0);
}

uint64_t sub_23987FCA0(void *a1, const char *a2, double a3)
{
  objc_msgSend_tmlViewDidLayoutSubviews(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, @"viewDidLayoutSubviews", 0);
}

uint64_t sub_23987FCE4(void *a1, const char *a2, double a3)
{
  objc_msgSend_tmlUpdateViewConstraints(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, @"updateViewConstraints", 0);
}

void sub_23987FD28(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_tmlEncodeRestorableStateWithCoder_(a1, v5, v6, v4);
  id v13 = 0;
  int v9 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v7, v8, @"saveRestorableState", 0, &v13);
  id v10 = v13;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_encodeObject_forKey_(v4, v11, v12, v10, @"TML.RestorableState");
    }
  }
}

void sub_23987FDD4(void *a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_tmlDecodeRestorableStateWithCoder_(a1, v5, v6, v4);
  int v9 = objc_msgSend_decodeObjectForKey_(v4, v7, v8, @"TML.RestorableState");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15[0] = v9;
    double v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, v11, v15, 1);
    objc_msgSend_emitTMLSignal_withArguments_(a1, v13, v14, @"loadRestorableState", v12);
  }
}

void sub_23987FEB8(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  objc_msgSend_tmlViewWillTransitionToSize_withTransitionCoordinator_(a1, v9, a2, v8, a3);
  objc_initWeak(&location, a1);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = sub_239880018;
  void v14[3] = &unk_264DAEBD0;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&a2;
  void v15[2] = *(id *)&a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = sub_2398800D8;
  void v12[3] = &unk_264DAEBD0;
  objc_copyWeak(v13, &location);
  v13[1] = *(id *)&a2;
  void v13[2] = *(id *)&a3;
  objc_msgSend_animateAlongsideTransition_completion_(v8, v10, v11, v14, v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void sub_23987FFF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_239880018(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_msgSend_convertSize_(TMLTypes, v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v10[0] = v4;
  double v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, v6, v10, 1);
  objc_msgSend_emitTMLSignal_withArguments_(WeakRetained, v8, v9, @"viewWillTransitionToSize", v7);
}

void sub_2398800D8(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_msgSend_convertSize_(TMLTypes, v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v10[0] = v4;
  double v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, v6, v10, 1);
  objc_msgSend_emitTMLSignal_withArguments_(WeakRetained, v8, v9, @"viewDidTransitionToSize", v7);
}

void sub_239880198(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v8, v9, a1, v6, 0);
  objc_msgSend_tmlWillTransitionToTraitCollection_withTransitionCoordinator_(a1, v11, v12, v6, v7);
  objc_initWeak(&location, a1);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_239880334;
  v21[3] = &unk_264DAEBF8;
  id v13 = v10;
  id v22 = v13;
  double v23 = a1;
  id v14 = v6;
  id v24 = v14;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2398803D8;
  void v18[3] = &unk_264DAEC20;
  objc_copyWeak(&v20, &location);
  id v15 = v14;
  id v19 = v15;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v16, v17, v21, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void sub_239880318(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_239880334(uint64_t a1, const char *a2, double a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  objc_msgSend_emitTMLSignal_withArguments_(*(void **)(a1 + 32), a2, a3, @"enter", 0);
  id v4 = *(void **)(a1 + 40);
  v10[0] = *(void *)(a1 + 48);
  id v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, v6, v10, 1);
  objc_msgSend_emitTMLSignal_withArguments_(v4, v8, v9, @"willTransitionToTraitCollection", v7);
}

void sub_2398803D8(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = *(void *)(a1 + 32);
  double v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v3, v4, v8, 1);
  objc_msgSend_emitTMLSignal_withArguments_(WeakRetained, v6, v7, @"didTransitionToTraitCollection", v5);
}

void sub_239880478(void *a1, const char *a2, uint64_t a3, double a4)
{
  objc_msgSend_tmlTraitCollectionDidChange_(a1, a2, a4);
  if (!a3)
  {
    id v8 = objc_msgSend_traitCollection(a1, v6, v7);
    objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v9, v10, a1, v8, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_emitTMLSignal_withArguments_(v13, v11, v12, @"enter", 0);
  }
}

void sub_239880528(void *a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_tmlWillMoveToParentViewController_(a1, v5, v6, a1);
  double v9 = v4;
  if (!v4)
  {
    double v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v7, v8);
  }
  v13[0] = v9;
  double v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v7, v8, v13, 1);
  objc_msgSend_emitTMLSignal_withArguments_(a1, v11, v12, @"willMoveToParentViewController", v10);

  if (!v4) {
}
  }

id sub_2398805F8(void *a1)
{
  return objc_getAssociatedObject(a1, "pshashpc");
}

void sub_239880604(void *a1, uint64_t a2, void *a3)
{
}

uint64_t sub_239880614(void *a1)
{
  uint64_t v2 = objc_getAssociatedObject(a1, "shashpc");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = objc_msgSend_integerValue(v2, v3, v4);
  }
  else {
    uint64_t v5 = objc_msgSend_tmlPreferredStatusBarStyle(a1, v3, v4);
  }
  uint64_t v6 = v5;

  return v6;
}

uint64_t sub_239880684(void *a1, const char *a2, double a3)
{
  double v4 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3);
  objc_setAssociatedObject(a1, "shashpc", v4, (void *)3);

  return MEMORY[0x270F9A6D0](a1, sel_setNeedsStatusBarAppearanceUpdate, v5);
}

uint64_t sub_2398806E8(void *a1)
{
  uint64_t v2 = objc_getAssociatedObject(a1, "hashpc");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = objc_msgSend_BOOLValue(v2, v3, v4);
  }
  else {
    uint64_t v5 = objc_msgSend_tmlPrefersStatusBarHidden(a1, v3, v4);
  }
  uint64_t v6 = v5;

  return v6;
}

uint64_t sub_239880758(void *a1, const char *a2, double a3)
{
  double v4 = objc_msgSend_numberWithBool_(NSNumber, a2, a3);
  objc_setAssociatedObject(a1, "hashpc", v4, (void *)3);

  return MEMORY[0x270F9A6D0](a1, sel_setNeedsStatusBarAppearanceUpdate, v5);
}

uint64_t sub_2398807BC(void *a1)
{
  uint64_t v2 = objc_getAssociatedObject(a1, "ashpc");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t updated = objc_msgSend_integerValue(v2, v3, v4);
  }
  else {
    uint64_t updated = objc_msgSend_tmlPreferredStatusBarUpdateAnimation(a1, v3, v4);
  }
  uint64_t v6 = updated;

  return v6;
}

uint64_t sub_23988082C(void *a1, const char *a2, double a3)
{
  double v4 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3);
  objc_setAssociatedObject(a1, "ashpc", v4, (void *)3);

  return MEMORY[0x270F9A6D0](a1, sel_setNeedsStatusBarAppearanceUpdate, v5);
}

id sub_239880890(void *a1)
{
  uint64_t v2 = objc_getAssociatedObject(a1, "shpc");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v2;
  }
  else
  {
    objc_msgSend_tmlChildViewControllerForStatusBarStyle(a1, v3, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return v6;
}

uint64_t sub_239880910(void *a1, uint64_t a2, void *a3)
{
  objc_setAssociatedObject(a1, "shpc", a3, (void *)1);
  return MEMORY[0x270F9A6D0](a1, sel_setNeedsStatusBarAppearanceUpdate, v4);
}

id sub_239880954(void *a1)
{
  uint64_t v2 = objc_getAssociatedObject(a1, "hpc");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v2;
  }
  else
  {
    objc_msgSend_tmlChildViewControllerForStatusBarHidden(a1, v3, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return v6;
}

uint64_t sub_2398809D4(void *a1, uint64_t a2, void *a3)
{
  objc_setAssociatedObject(a1, "hpc", a3, (void *)1);
  return MEMORY[0x270F9A6D0](a1, sel_setNeedsStatusBarAppearanceUpdate, v4);
}

uint64_t sub_239880A18(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v12 = 0;
  int v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v2, v3, @"accessibilityPerformEscape", 0, &v12);
  id v5 = v12;
  double v8 = v5;
  if (v4) {
    uint64_t v9 = objc_msgSend_BOOLValue(v5, v6, v7);
  }
  else {
    uint64_t v9 = objc_msgSend_tmlAccessibilityPerformEscape(a1, v6, v7);
  }
  uint64_t v10 = v9;

  return v10;
}

uint64_t sub_239880ABC(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v12 = 0;
  int v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v2, v3, @"accessibilityPerformMagicTap", 0, &v12);
  id v5 = v12;
  double v8 = v5;
  if (v4) {
    uint64_t v9 = objc_msgSend_BOOLValue(v5, v6, v7);
  }
  else {
    uint64_t v9 = objc_msgSend_tmlAccessibilityPerformMagicTap(a1, v6, v7);
  }
  uint64_t v10 = v9;

  return v10;
}

uint64_t sub_239880B60(void *a1, const char *a2, double a3)
{
  id v12 = 0;
  int v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, @"shouldAutorotate", 0, &v12);
  id v5 = v12;
  double v8 = v5;
  if (v4) {
    uint64_t ShouldAutorotate = objc_msgSend_BOOLValue(v5, v6, v7);
  }
  else {
    uint64_t ShouldAutorotate = objc_msgSend_tmlShouldAutorotate(a1, v6, v7);
  }
  uint64_t v10 = ShouldAutorotate;

  return v10;
}

uint64_t sub_239880BDC(void *a1, const char *a2, double a3)
{
  id v12 = 0;
  int v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, @"supportedInterfaceOrientations", 0, &v12);
  id v5 = v12;
  double v8 = v5;
  if (v4) {
    uint64_t v9 = objc_msgSend_unsignedIntegerValue(v5, v6, v7);
  }
  else {
    uint64_t v9 = objc_msgSend_tmlSupportedInterfaceOrientations(a1, v6, v7);
  }
  uint64_t v10 = v9;

  return v10;
}

uint64_t sub_239880C58(void *a1, const char *a2, double a3)
{
  id v12 = 0;
  int v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, @"preferredInterfaceOrientationForPresentation", 0, &v12);
  id v5 = v12;
  double v8 = v5;
  if (v4) {
    uint64_t v9 = objc_msgSend_integerValue(v5, v6, v7);
  }
  else {
    uint64_t v9 = objc_msgSend_tmlPreferredInterfaceOrientationForPresentation(a1, v6, v7);
  }
  uint64_t v10 = v9;

  return v10;
}

void sub_239880DE4(uint64_t a1)
{
  size_t v2 = strlen("838477767]=UmQ@}HaPU+O2M#[CdLI77HUO8/fVwcY?)S>in3bn9F]0u$V0!r6Rw:-KjjJoT@U/IAkJS:lrLvql%6UkvOi@k6r2e#W]H#(Rr?@[HxF=}$2*Vl>YM&8P@h+Kj5d8tEG}@=@#nnc)!KlA$.XtSIt7sS*{88/ps3Hv^27c$$$y*?Q2A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b625[x!D1z1e2TIG/y*?Q2AV#?q9:@(3z*cn0x>8mcA+d*Wp?:AYB-I4&y*?P#vpK6=1y=p/y:6]c5[t&$By/uipJ*q&y*?P&x>qG3231k}x>qG90u@J>6)15bCxlO%vr(r<v@1CIzGG]qy&Zi(vScg3a}+j*wmYN*xjk)[5^An-ygQ)%a@HZ#A+eV&C$8Z)l${ZYy*?P41y=p/y-0f%777E[x>g^[m@&3Yx([Rk26j)bx(mL<VipNPk#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6a%470Abn%dwPyEMD1z1e4ma2>y*?Q2A.G[!wPwQ*a}+j*wmYN*xjk)[5^An-ygQ)%a%EvhAa@*7B-I4+zCU4SBAIRnp&yz@x<$)&5^hVZz!{l>a%NBjAa@*7B-I4+zCU4SBAIRnq*0e2wO#3&wd/2Oz/oCe0u@S[7i0$$BAIRnnP4vsv@#<lwKf*Fx)a521y=p/y-0gdfBwLoByxiip?:AYB-I4+zCU4SBAIRn5ci%&B97&hBwMWYBAIRnnP4vsv@#<lwIL>B6MXwmA8pmUBAIRnnP4vsv@#<lwE[>^6MXwmA8pmUBAIRnnP4vsv@#<lwIQg+3o-uxv@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(27AaLa4%h&2x((ZXy&0V)BzkVh5!Obnrb#zYBvf$.y?m9#x(v(kkpZX!v@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(IgnU6VjAb1ABAIRnnP4vsv@#<lwKpJYBz(4}Bz(a&zdd6*lVl*Xvrui)y?lWZBzaS]vqf*Jz!%l3v@#B6zv^Q5bNL67A:-W7lVl^SwN/*@z/cg1ry{egvqf*Jz!%l3v@#B6zx.m{Aa@*7B-I4+zCU4SBAIRnluNx(z/eG}z/wo+vp%dsz/6D4Bzki2wMJO/xJf1Xx((ZXy&0V)BzkVhiX&&98!<v&x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(65cs3}d}%63x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(6bh0bbbTCEcx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AZTFPwOkB[wG(j6gh{@qBAIRnnP4vsv@#<lwKyxNBAhqoy?mS*x(4P:Bz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#kBQx{zx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3A-V%>y/tB:A=+b(v@#<lwL3=ox>8mcA+b^.8AFizAa@*7B-I5czG6r1BAIRnv@DmbA=k=gwPwz6k#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6c&$Pl3nDHlv@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggBz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#k/z#sAAa@*7B-I4+zCU4SBAIRnlVl<:A=k=gwPymGx(4u>rbUYSvrcD^x>8mcA+d*Wp?:AYB-I4{x([2SA=M8s5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy&0W65/:hrp?:AYB-I4+zCU4SBAIRnlVl<:A=k=gwPwX23i+0YA=k$h2tOh^A=M8sb0{l.v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6i+z/my?mcRz=p:^A=+b(v@#<lwL3=ox>8mcA+er^Bza9-A=k$Vc&$Pm3nMNmv"
         "@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggByxiip?:AYB-I4+zCU4SBAIRn5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy&0W65/:hrp?:AYB-"
         "I4+zCU4SBAIRnlVl<:A=k=gwPxg2dHXQzmSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, "838477767]=UmQ@}HaPU+O2M#[CdLI77HUO8/fVwcY?)S>in3bn9F]0u$V0!r6Rw:-KjjJoT@U/IAkJS:lrLvql%6UkvOi@k6r2e#W]H#(Rr?@[HxF=}$2*Vl>YM&8P@h+Kj5d8tEG}@=@#nnc)!KlA$.XtSIt7sS*{88/ps3Hv^27c$$$y*?Q2A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b625[x!D1z1e2TIG/y*?Q2AV#?q9:@(3z*cn0x>8mcA+d*Wp?:AYB-I4&y*?P#vpK6=1y=p/y:6]c5[t&$By/uipJ*q&y*?P&x>qG3231k}x>qG90u@J>6)15bCxlO%vr(r<v@1CIzGG]qy&Zi(vScg3a}+j*wmYN*xjk)[5^An-ygQ)%a@HZ#A+eV&C$8Z)l${ZYy*?P41y=p/y-0f%777E[x>g^[m@&3Yx([Rk26j)bx(mL<VipNPk#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6a%470Abn%dwPyEMD1z1e4ma2>y*?Q2A.G[!wPwQ*a}+j*wmYN*xjk)[5^An-ygQ)%a%EvhAa@*7B-I4+zCU4SBAIRnp&yz@x<$)&5^hVZz!{l>a%NBjAa@*7B-I4+zCU4SBAIRnq*0e2wO#3&wd/2Oz/oCe0u@S[7i0$$BAIRnnP4vsv@#<lwKf*Fx)a521y=p/y-0gdfBwLoByxiip?:AYB-I4+zCU4SBAIRn5ci%&B97&hBwMWYBAIRnnP4vsv@#<lwIL>B6MXwmA8pmUBAIRnnP4vsv@#<lwE[>^6MXwmA8pmUBAIRnnP4vsv@#<lwIQg+3o-uxv@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(27AaLa4%h&2x((ZXy&0V)BzkVh5!Obnrb#zYBvf$.y?m9#x(v(kkpZX!v@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(IgnU6VjAb1ABAIRnnP4vsv@#<lwKpJYBz(4}Bz(a&zdd6*lVl*Xvrui)y?lWZBzaS]vqf*Jz!%l3v@#B6zv^Q5bNL67A:-W7lVl^SwN/*@z/cg1ry{egvqf*Jz!%l3v@#B6zx.m{Aa@*7B-I4+zCU4SBAIRnluNx(z/eG}z/wo+vp%dsz/6D4Bzki2wMJO/xJf1Xx((ZXy&0V)BzkVhiX&&98!<v&x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(65cs3}d}%63x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(6bh0bbbTCEcx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AZTFPwOkB[wG(j6gh{@qBAIRnnP4vsv@#<lwKyxNBAhqoy?mS*x(4P:Bz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#kBQx{zx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3A-V%>y/tB:A=+b(v@#<lwL3=ox>8mcA+b^.8AFizAa@*7B-I5czG6r1BAIRnv@DmbA=k=gwPwz6k#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6c&$Pl3nDHlv@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggBz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#k/z#sAAa@*7B-I4+zCU4SBAIRnlVl"
    "<:A=k=gwPymGx(4u>rbUYSvrcD^x>8mcA+d*Wp?:AYB-I4{x([2SA=M8s5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy&0W65/:hrp?:AYB-I4+zCU4"
    "SBAIRnlVl<:A=k=gwPwX23i+0YA=k$h2tOh^A=M8sb0{l.v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6i+z/my?mcRz=p:^A=+b(v@#<lwL3=ox>8mcA+er^"
    "Bza9-A=k$Vc&$Pm3nMNmv@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggByxiip?:AYB-I4+zCU4SBAIRn5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy"
    "&0W65/:hrp?:AYB-I4+zCU4SBAIRnlVl<:A=k=gwPxg2dHXQzmSiA!wmoN]z/b",
    v2,
    0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

uint64_t sub_23988175C(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addDeclaration_(*(void **)(a1 + 32), a2, a3, a2);
}

uint64_t sub_239881768(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addSignalHandler_signalTarget_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_239881774(uint64_t a1, void *a2)
{
  size_t v2 = *(void **)(a1 + 32);
  double v3 = *(void **)(a1 + 40);
  id v4 = a2;
  objc_msgSend_objectForKeyedSubscript_(v3, v5, v6, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_(v2, v7, v8, v4, v9);
}

uint64_t sub_2398817E8(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, a3, a2);
}

void sub_239881908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_239881920(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_239881930(uint64_t a1)
{
}

void sub_239881938(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = objc_msgSend_propertyName(v13, v7, v8);
    int isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, *(void *)(a1 + 32));

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void sub_239881B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239881B1C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = objc_msgSend_signalName(v13, v7, v8);
    int isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, *(void *)(a1 + 32));

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

uint64_t sub_239882010(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = malloc_type_malloc(0x58uLL, 0x1070040EA06F8A7uLL);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 48) + 8 * a3) = v6;
  sub_2398530B8((uint64_t)v6);
  id v7 = v5;
  uint64_t v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
  v6[3] = strdup(v10);
  objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 16), v11, v12, v7);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *((_DWORD *)v6 + 8) = 1;
    id v13 = v30;
    double v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    isKindOfClass Class = (uint64_t)strdup(v16);
    v6[5] = isKindOfClass;
LABEL_11:
    id v21 = v30;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFNumberType Type = CFNumberGetType((CFNumberRef)v30);
    if ((unint64_t)Type > kCFNumberCGFloatType) {
      goto LABEL_19;
    }
    if (((1 << Type) & 0x13060) != 0)
    {
      *((_DWORD *)v6 + 8) = 3;
      isKindOfClass Class = objc_msgSend_floatValue(v30, v19, v20);
      id v21 = v30;
      *((_DWORD *)v6 + 17) = v22;
      *((_DWORD *)v6 + 16) = 1;
      goto LABEL_12;
    }
    if (Type == kCFNumberCharType)
    {
      *((_DWORD *)v6 + 8) = 4;
      isKindOfClass Class = objc_msgSend_BOOLValue(v30, v19, v20);
      id v21 = v30;
      *((_DWORD *)v6 + 14) = 1;
      *((_DWORD *)v6 + 15) = isKindOfClass;
    }
    else
    {
LABEL_19:
      *((_DWORD *)v6 + 8) = 2;
      isKindOfClass Class = objc_msgSend_integerValue(v30, v19, v20);
      id v21 = v30;
      *((_DWORD *)v6 + 12) = 1;
      *((_DWORD *)v6 + 13) = isKindOfClass;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *((_DWORD *)v6 + 8) = 5;
      double v23 = malloc_type_malloc(0x30uLL, 0x10F004065BF17CFuLL);
      v6[9] = v23;
      isKindOfClass Class = objc_msgSend_encode_(v30, v24, v25, v23);
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *((_DWORD *)v6 + 8) = 6;
      double v26 = malloc_type_malloc(0xA0uLL, 0x10F0040C95C2125uLL);
      v6[10] = v26;
      isKindOfClass Class = objc_msgSend_encode_(v30, v27, v28, v26);
      goto LABEL_11;
    }
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();
    id v21 = v30;
    if (isKindOfClass) {
      *((_DWORD *)v6 + 8) = 0;
    }
  }
LABEL_12:
  return MEMORY[0x270F9A758](isKindOfClass, v21);
}

void sub_239882264(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0xA0uLL, 0x10F0040C95C2125uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 128) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_2398822DC(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v5, v3, v5);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_addObject_(*(void **)(a1 + 40), v5, v4, v5);
    }
  }
}

void sub_239882378(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0x30uLL, 0x10700407919B52CuLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_2398823F0(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_239882468(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = a2;
  objc_msgSend_objectForKeyedSubscript_(v5, v7, v8, v6);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = malloc_type_malloc(0x38uLL, 0x107004014DBB691uLL);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 8 * a3) = v9;
  objc_msgSend_encode_(v16, v10, v11, v9);
  id v12 = v6;
  double v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);

  v9[6] = strdup(v15);
}

char *sub_23988252C(uint64_t a1, id a2, uint64_t a3)
{
  id v5 = a2;
  double v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  double result = strdup(v8);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 152) + 8 * a3) = result;
  return result;
}

void sub_239882D54(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);
  id v17 = v5;
  double v9 = objc_msgSend_identifier(v5, v7, v8);
  id v12 = objc_msgSend_objectForKeyedSubscript_(v6, v10, v11, v9);

  if (v12)
  {
    objc_msgSend_applyCategory_(v12, v13, v14, v17);
    objc_msgSend_addIndex_(*(void **)(a1 + 40), v15, v16, a3);
  }
}

void sub_239882FD0(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_addProperty_(*(void **)(a1 + 32), v3, v4, v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_addSignal_(*(void **)(a1 + 32), v5, v6, v9);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_addMethod_(*(void **)(a1 + 32), v7, v8, v9);
      }
    }
  }
}

void sub_2398831B4(uint64_t a1, void *a2)
{
  id v35 = a2;
  id v5 = objc_msgSend_type(v35, v3, v4);
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, v7, @"Class");

  if (isEqualToString)
  {
    id v9 = objc_opt_class();
    id v12 = objc_msgSend_convertObject_toClass_(v9, v10, v11, v35, 0);
    double v15 = objc_msgSend_objcClassName(*(void **)(a1 + 40), v13, v14);
    uint64_t v19 = objc_msgSend_length(v15, v16, v17);
    id v21 = *(void **)(a1 + 40);
    if (v19) {
      objc_msgSend_objcClassName(v21, v18, v20);
    }
    else {
    int v22 = objc_msgSend_className(v21, v18, v20);
    }

    double v23 = NSString;
    double v26 = objc_msgSend_identifier(v35, v24, v25);
    double v29 = objc_msgSend_stringWithFormat_(v23, v27, v28, @"%@_%@", v22, v26);

    double v32 = objc_msgSend_objcClassName(v12, v30, v31);

    if (!v32) {
      objc_msgSend_setObjcClassName_(v12, v33, v34, v29);
    }
    objc_msgSend_addChildClass_(*(void **)(a1 + 40), v33, v34, v12);
  }
}

void sub_239883450(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_addSignal_(*(void **)(a1 + 32), v3, v4, v5);
  }
}

void sub_2398838B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2398838CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2398838DC(uint64_t a1)
{
}

void sub_2398838E4(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v9 = objc_msgSend_objects(v6, v7, v8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = sub_2398839D0;
  id v15[3] = &unk_264DAECC8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v16 = v10;
  uint64_t v18 = v11;
  id v12 = v6;
  id v17 = v12;
  uint64_t v19 = a4;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v13, v14, v15);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void sub_2398839D0(uint64_t a1, void *a2, double a3)
{
  double v4 = objc_msgSend_identifier(a2, (const char *)a2, a3);
  int isEqualToString = objc_msgSend_isEqualToString_(v4, v5, v6, *(void *)(a1 + 32));

  if (isEqualToString)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    **(unsigned char **)(a1 + 56) = 1;
  }
}

void sub_239883D9C(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0x80uLL, 0x10F0040B03B4CD9uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_239883E14(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0xA0uLL, 0x10F0040C95C2125uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 48) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_239883E8C(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0x28uLL, 0x1070040084410A6uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 64) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

void sub_239883F04(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = malloc_type_malloc(0x48uLL, 0x10F00406F9DE22FuLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);
}

char *sub_239883F7C(uint64_t a1, id a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  double result = strdup(v8);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 8 * a3) = result;
  return result;
}

id sub_239884A20()
{
  if (qword_268A05940 != -1) {
    dispatch_once(&qword_268A05940, &unk_26ECEDC88);
  }
  uint64_t v0 = (void *)qword_268A05938;
  return v0;
}

void sub_239884A74(double a1, uint64_t a2, const char *a3)
{
  v195[62] = *MEMORY[0x263EF8340];
  char v193 = objc_msgSend_stringWithUTF8String_(NSString, a3, a1, "v");
  v194[0] = v193;
  v195[0] = &unk_26ECEDCA8;
  long long v192 = objc_msgSend_stringWithFormat_(NSString, v3, v4, @"%s%s", "v", "@");
  v194[1] = v192;
  v195[1] = &unk_26ECEDCC8;
  long long v191 = objc_msgSend_stringWithFormat_(NSString, v5, v6, @"%s%s%s", "v", "@", "@");
  v194[2] = v191;
  v195[2] = &unk_26ECEDCE8;
  long long v190 = objc_msgSend_stringWithFormat_(NSString, v7, v8, @"%s%s%s%s", "v", "@", "@", "@");
  v194[3] = v190;
  v195[3] = &unk_26ECEDD08;
  long long v189 = objc_msgSend_stringWithFormat_(NSString, v9, v10, @"%s%s%s%s", "v", "@", "@", "@");
  long long v188 = objc_msgSend_stringByAppendingString_(v189, v11, v12, @"?");
  v194[4] = v188;
  v195[4] = &unk_26ECEDD28;
  long long v187 = objc_msgSend_stringWithFormat_(NSString, v13, v14, "v", "@", "@", "@", "@");
  v194[5] = v187;
  v195[5] = &unk_26ECEDD48;
  long long v186 = objc_msgSend_stringWithFormat_(NSString, v15, v16, @"%s%s", "v", "B");
  v194[6] = v186;
  v195[6] = &unk_26ECEDD68;
  long long v185 = objc_msgSend_stringWithFormat_(NSString, v17, v18, @"%s%s%s", "v", "@", "B");
  v194[7] = v185;
  v195[7] = &unk_26ECEDD88;
  long long v184 = objc_msgSend_stringWithFormat_(NSString, v19, v20, @"%s%s%s%s", "v", "@", "@", "B");
  v194[8] = v184;
  v195[8] = &unk_26ECEDDA8;
  long long v183 = objc_msgSend_stringWithFormat_(NSString, v21, v22, @"%s%s%s%s", "v", "@", "@", "f");
  v194[9] = v183;
  v195[9] = &unk_26ECEDDC8;
  long long v182 = objc_msgSend_stringWithFormat_(NSString, v23, v24, @"%s%s%s%s", "v", "@", "@", "d");
  v194[10] = v182;
  v195[10] = &unk_26ECEDDE8;
  v181 = objc_msgSend_stringWithFormat_(NSString, v25, v26, @"%s%s%s", "v", "@", "q");
  v194[11] = v181;
  v195[11] = &unk_26ECEDE08;
  v180 = objc_msgSend_stringWithFormat_(NSString, v27, v28, @"%s%s%s%s", "v", "@", "@", "q");
  v194[12] = v180;
  v195[12] = &unk_26ECEDE28;
  unsigned int v179 = objc_msgSend_stringWithFormat_(NSString, v29, v30, @"%s%s%s%s", "v", "@", "q", "q");
  v194[13] = v179;
  v195[13] = &unk_26ECEDE48;
  v178 = objc_msgSend_stringWithFormat_(NSString, v31, v32, @"%s%s%s", "v", "@", "i");
  v194[14] = v178;
  v195[14] = &unk_26ECEDE68;
  v177 = objc_msgSend_stringWithFormat_(NSString, v33, v34, @"%s%s%sN%s", "v", "@", "{CGPoint=dd}", "^{CGPoint=dd}");
  v194[15] = v177;
  v195[15] = &unk_26ECEDE88;
  uint64_t v176 = objc_msgSend_stringWithFormat_(NSString, v35, v36, @"%s%sN%sN^%s", "v", "@", "^{CGRect={CGPoint=dd}{CGSize=dd}}", "@");
  v194[16] = v176;
  v195[16] = &unk_26ECEDEA8;
  uint64_t v175 = objc_msgSend_stringWithFormat_(NSString, v37, v38, @"%s%s%s%s", "v", "@", "q", "B");
  v194[17] = v175;
  v195[17] = &unk_26ECEDEC8;
  int v174 = objc_msgSend_stringWithFormat_(NSString, v39, v40, @"%s%s%s%s", "v", "@", "q", "@");
  v194[18] = v174;
  v195[18] = &unk_26ECEDEE8;
  unsigned int v173 = objc_msgSend_stringWithFormat_(NSString, v41, v42, @"%s%s%s%s%s", "v", "@", "@", "Q", "Q");
  v194[19] = v173;
  v195[19] = &unk_26ECEDF08;
  unsigned int v172 = objc_msgSend_stringWithFormat_(NSString, v43, v44, @"%s%s%s%s%s", "v", "@", "B", "@", "B");
  v194[20] = v172;
  v195[20] = &unk_26ECEDF28;
  uint64_t v171 = objc_msgSend_stringWithFormat_(NSString, v45, v46, @"%s%s%s%s%s%s", "v", "@", "@", "@", "@", "@");
  v194[21] = v171;
  v195[21] = &unk_26ECEDF48;
  unsigned int v170 = objc_msgSend_stringWithFormat_(NSString, v47, v48, @"%s%s%s%s", "{CGSize=dd}", "@", "@", "@");
  v194[22] = v170;
  v195[22] = &unk_26ECEDF68;
  uint64_t v169 = objc_msgSend_stringWithFormat_(NSString, v49, v50, @"%s%s%s%s", "v", "@", "{_NSRange=QQ}", "@");
  v194[23] = v169;
  v195[23] = &unk_26ECEDF88;
  v168 = objc_msgSend_stringWithUTF8String_(NSString, v51, v52, "@");
  v194[24] = v168;
  v195[24] = &unk_26ECEDFA8;
  int v167 = objc_msgSend_stringWithUTF8String_(NSString, v53, v54, "d");
  v194[25] = v167;
  v195[25] = &unk_26ECEDFC8;
  v166 = objc_msgSend_stringWithUTF8String_(NSString, v55, v56, "q");
  v194[26] = v166;
  v195[26] = &unk_26ECEDFE8;
  unsigned int v165 = objc_msgSend_stringWithFormat_(NSString, v57, v58, @"%s%s", "@", "@");
  v194[27] = v165;
  v195[27] = &unk_26ECEE008;
  v164 = objc_msgSend_stringWithFormat_(NSString, v59, v60, @"%s%s%s", "@", "@", "@");
  v194[28] = v164;
  v195[28] = &unk_26ECEE028;
  unsigned int v163 = objc_msgSend_stringWithFormat_(NSString, v61, v62, @"%s%s%s%s", "@", "@", "@", "@");
  v194[29] = v163;
  v195[29] = &unk_26ECEE048;
  v162 = objc_msgSend_stringWithFormat_(NSString, v63, v64, @"%s%s%s", "@", "@", "q");
  v194[30] = v162;
  v195[30] = &unk_26ECEE068;
  v161 = objc_msgSend_stringWithFormat_(NSString, v65, v66, @"%s%s%s%s", "@", "@", "q", "q");
  v194[31] = v161;
  v195[31] = &unk_26ECEE088;
  v160 = objc_msgSend_stringWithFormat_(NSString, v67, v68, @"%s%s%s%s%s", "@", "@", "@", "@", "@");
  v194[32] = v160;
  v195[32] = &unk_26ECEE0A8;
  v159 = objc_msgSend_stringWithFormat_(NSString, v69, v70, @"%s%s%s%s%s", "@", "@", "q", "q", "@");
  v194[33] = v159;
  v195[33] = &unk_26ECEE0C8;
  unsigned int v158 = objc_msgSend_stringWithFormat_(NSString, v71, v72, @"%s%s%s%s%s", "@", "@", "q", "@", "@");
  v194[34] = v158;
  v195[34] = &unk_26ECEE0E8;
  unsigned int v157 = objc_msgSend_stringWithFormat_(NSString, v73, v74, @"%s%s%s", "v", "q", "q");
  v194[35] = v157;
  v195[35] = &unk_26ECEE108;
  uint64_t v156 = objc_msgSend_stringWithFormat_(NSString, v75, v76, @"%s%s", "q", "@");
  v194[36] = v156;
  v195[36] = &unk_26ECEE128;
  unsigned int v155 = objc_msgSend_stringWithFormat_(NSString, v77, v78, @"%s%s", "Q", "@");
  v194[37] = v155;
  v195[37] = &unk_26ECEE148;
  unsigned int v154 = objc_msgSend_stringWithFormat_(NSString, v79, v80, @"%s%s", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@");
  v194[38] = v154;
  v195[38] = &unk_26ECEE168;
  uint64_t v153 = objc_msgSend_stringWithFormat_(NSString, v81, v82, @"%s%s%s", "q", "@", "q");
  v194[39] = v153;
  v195[39] = &unk_26ECEE188;
  uint64_t v152 = objc_msgSend_stringWithFormat_(NSString, v83, v84, @"%s%s%s", "B", "@", "q");
  v194[40] = v152;
  v195[40] = &unk_26ECEE1A8;
  uint64_t v151 = objc_msgSend_stringWithFormat_(NSString, v85, v86, @"%s%s", "B", "@");
  v194[41] = v151;
  v195[41] = &unk_26ECEE1C8;
  unint64_t v150 = objc_msgSend_stringWithFormat_(NSString, v87, v88, @"%s%s", "d", "@");
  v194[42] = v150;
  v195[42] = &unk_26ECEE1E8;
  unsigned int v149 = objc_msgSend_stringWithFormat_(NSString, v89, v90, @"%s%s%s", "{CGPoint=dd}", "@", "{CGPoint=dd}");
  v194[43] = v149;
  v195[43] = &unk_26ECEE208;
  uint64_t v148 = objc_msgSend_stringWithFormat_(NSString, v91, v92, @"%s%s%s%s", "B", "@", "{_NSRange=QQ}", "@");
  v194[44] = v148;
  v195[44] = &unk_26ECEE228;
  uint64_t v147 = objc_msgSend_stringWithFormat_(NSString, v93, v94, @"%s%s%s%s", "B", "@", "@", "{_NSRange=QQ}");
  v194[45] = v147;
  v195[45] = &unk_26ECEE248;
  uint64_t v146 = objc_msgSend_stringWithFormat_(NSString, v95, v96, @"%s%s%s%s", "q", "@", "@", "q");
  v194[46] = v146;
  v195[46] = &unk_26ECEE268;
  unsigned int v145 = objc_msgSend_stringWithFormat_(NSString, v97, v98, @"%s%s%s%s", "B", "@", "@", "q");
  v194[47] = v145;
  v195[47] = &unk_26ECEE288;
  unsigned int v144 = objc_msgSend_stringWithFormat_(NSString, v99, v100, @"%s%s%s%s", "B", "@", "@", "q");
  v194[48] = v144;
  v195[48] = &unk_26ECEE2A8;
  uint64_t v143 = objc_msgSend_stringWithFormat_(NSString, v101, v102, @"%s%s%s%s", "B", "@", "@", "@");
  v194[49] = v143;
  v195[49] = &unk_26ECEE2C8;
  uint64_t v142 = objc_msgSend_stringWithFormat_(NSString, v103, v104, @"%s%s%s%s", "d", "@", "@", "q");
  v194[50] = v142;
  v195[50] = &unk_26ECEE2E8;
  uint64_t v141 = objc_msgSend_stringWithFormat_(NSString, v105, v106, @"%s%s%s%s", "{UIEdgeInsets=dddd}", "@", "@", "q");
  v194[51] = v141;
  v195[51] = &unk_26ECEE308;
  size_t v140 = objc_msgSend_stringWithFormat_(NSString, v107, v108, @"%s%s%s", "d", "@", "@");
  v194[52] = v140;
  v195[52] = &unk_26ECEE328;
  uint64_t v139 = objc_msgSend_stringWithFormat_(NSString, v109, v110, @"%s%s%s", "q", "@", "@");
  v194[53] = v139;
  v195[53] = &unk_26ECEE348;
  uint64_t v138 = objc_msgSend_stringWithFormat_(NSString, v111, v112, @"%s%s%s", "B", "@", "@");
  v194[54] = v138;
  v195[54] = &unk_26ECEE368;
  v137 = objc_msgSend_stringWithFormat_(NSString, v113, v114, @"%s%s%s", "d", "@", "q");
  v194[55] = v137;
  v195[55] = &unk_26ECEE388;
  int v117 = objc_msgSend_stringWithFormat_(NSString, v115, v116, @"%s%s", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v194[56] = v117;
  v195[56] = &unk_26ECEE3A8;
  double v120 = objc_msgSend_stringWithFormat_(NSString, v118, v119, @"%s%s%s", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v194[57] = v120;
  v195[57] = &unk_26ECEE3C8;
  unsigned int v123 = objc_msgSend_stringWithFormat_(NSString, v121, v122, @"%s%s%s%s", "{CGSize=dd}", "@", "@", "q");
  v194[58] = v123;
  v195[58] = &unk_26ECEE3E8;
  uint64_t v126 = objc_msgSend_stringWithFormat_(NSString, v124, v125, @"%s%s%s%s", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v194[59] = v126;
  v195[59] = &unk_26ECEE408;
  id v129 = objc_msgSend_stringWithFormat_(NSString, v127, v128, @"%s%s%s%s%s", "B", "@", "@", "@", "B");
  v194[60] = v129;
  v195[60] = &unk_26ECEE428;
  id v132 = objc_msgSend_stringWithFormat_(NSString, v130, v131, @"%s%s%s%s%s", "B", "@", "@", "{_NSRange=QQ}", "q");
  v194[61] = v132;
  v195[61] = &unk_26ECEE448;
  uint64_t v135 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v133, v134, v195, v194, 62);
  long long v136 = (void *)qword_268A05938;
  qword_268A05938 = v135;
}

IMP sub_239885870(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239885918;
  v7[3] = &unk_264DAED78;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_239885918(uint64_t a1, void *a2, double a3)
{
  return objc_msgSend_emitTMLSignal_withArguments_(a2, (const char *)a2, a3, *(void *)(a1 + 32), 0);
}

IMP sub_239885928(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398859D0;
  v7[3] = &unk_264DAEDA0;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_2398859D0(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = v7;
  if (!v7)
  {
    double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v8);
  }
  v14[0] = v10;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v8, v14, 1);
  objc_msgSend_emitTMLSignal_withArguments_(v5, v12, v13, v9, v11);

  if (!v7) {
}
  }

IMP sub_239885AAC(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239885B54;
  v7[3] = &unk_264DAEDC8;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239885B54(uint64_t a1, void *a2, void *a3, void *a4)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = v8;
  if (!v8)
  {
    double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v18[0] = v13;
  double v14 = v10;
  if (!v10)
  {
    double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v18[1] = v14;
  double v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v11, v18, 2);
  objc_msgSend_emitTMLSignal_withArguments_(v7, v16, v17, v12, v15);

  if (!v10)
  {

    if (v8) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_7:
}

IMP sub_239885C78(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239885D20;
  v7[3] = &unk_264DAEDF0;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239885D20(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v22[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  uint64_t v15 = *(void *)(a1 + 32);
  double v16 = v10;
  if (!v10)
  {
    double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v22[0] = v16;
  double v17 = v11;
  if (!v11)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14, v22[0]);
  }
  v22[1] = v17;
  double v18 = v13;
  if (!v13)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  void v22[2] = v18;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, v14, v22, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v20, v21, v15, v19);

  if (v13)
  {
    if (v11) {
      goto LABEL_9;
    }
LABEL_12:

    if (v10) {
      goto LABEL_10;
    }
LABEL_13:

    goto LABEL_10;
  }

  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  if (!v10) {
    goto LABEL_13;
  }
LABEL_10:
}

IMP sub_239885E88(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239885F30;
  v7[3] = &unk_264DAEE18;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239885F30(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void v24[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  uint64_t v15 = *(void *)(a1 + 32);
  double v16 = v10;
  if (!v10)
  {
    double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v24[0] = v16;
  double v17 = v11;
  if (!v11)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14, v24[0]);
  }
  double v18 = objc_msgSend_copy(v13, v12, v14, v24[0], v17);
  v24[2] = v18;
  double v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, v20, v24, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v15, v21);

  if (!v11)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
}

IMP sub_239886080(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239886128;
  v7[3] = &unk_264DAEE40;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239886128(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v27[4] = *MEMORY[0x263EF8340];
  id v25 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v15 = a6;
  uint64_t v17 = *(void *)(a1 + 32);
  double v18 = v11;
  if (!v11)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v27[0] = v18;
  uint64_t v19 = v12;
  if (!v12)
  {
    uint64_t v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v27[1] = v19;
  double v20 = v13;
  if (!v13)
  {
    double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v27[2] = v20;
  double v21 = v15;
  if (!v15)
  {
    double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v27[3] = v21;
  double v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v16, v27, 4, v25);
  objc_msgSend_emitTMLSignal_withArguments_(v26, v23, v24, v17, v22);

  if (v15)
  {
    if (v13) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v13)
    {
LABEL_11:
      if (v12) {
        goto LABEL_12;
      }
LABEL_16:

      if (v11) {
        goto LABEL_13;
      }
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v12) {
    goto LABEL_16;
  }
LABEL_12:
  if (!v11) {
    goto LABEL_17;
  }
LABEL_13:
}

IMP sub_2398862D0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239886378;
  v7[3] = &unk_264DAEE68;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239886378(uint64_t a1, void *a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  IMP v5 = NSNumber;
  id v6 = a2;
  id v9 = objc_msgSend_numberWithBool_(v5, v7, v8, a3);
  v15[0] = v9;
  id v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, v11, v15, 1);
  objc_msgSend_emitTMLSignal_withArguments_(v6, v13, v14, v4, v12);
}

IMP sub_239886438(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398864E0;
  v7[3] = &unk_264DAEE90;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_2398864E0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void v19[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v9 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v9;
  if (!v9)
  {
    id v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v19[0] = v12;
  id v13 = objc_msgSend_numberWithBool_(NSNumber, v8, v10, a4);
  v19[1] = v13;
  double v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v19, 2);
  objc_msgSend_emitTMLSignal_withArguments_(v7, v17, v18, v11, v16);

  if (!v9) {
}
  }

IMP sub_2398865E0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239886688;
  v7[3] = &unk_264DAEEB8;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239886688(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  void v23[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v23[0] = v15;
  double v16 = v12;
  if (!v12)
  {
    double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13, v23[0]);
  }
  uint64_t v17 = objc_msgSend_numberWithBool_(NSNumber, v11, v13, a5, v23[0], v16);
  v23[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v23, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
}

IMP sub_2398867D0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239886878;
  v7[3] = &unk_264DAEEE0;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239886878(uint64_t a1, void *a2, void *a3, void *a4, float a5)
{
  void v23[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v23[0] = v15;
  double v16 = v12;
  if (!v12)
  {
    double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13, v23[0]);
  }
  *(float *)&double v13 = a5;
  uint64_t v17 = objc_msgSend_numberWithFloat_(NSNumber, v11, v13, v23[0], v16);
  v23[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v23, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
}

IMP sub_2398869C8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239886A70;
  v7[3] = &unk_264DAEF08;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239886A70(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  void v23[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v23[0] = v15;
  double v16 = v12;
  if (!v12)
  {
    double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13, v23[0]);
  }
  uint64_t v17 = objc_msgSend_numberWithDouble_(NSNumber, v11, a5, v23[0], v16);
  v23[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v23, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
}

IMP sub_239886BC0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239886C68;
  v7[3] = &unk_264DAEF30;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239886C68(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void v19[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v9 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v9;
  if (!v9)
  {
    id v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v19[0] = v12;
  double v13 = objc_msgSend_numberWithInteger_(NSNumber, v8, v10, a4);
  v19[1] = v13;
  double v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v19, 2);
  objc_msgSend_emitTMLSignal_withArguments_(v7, v17, v18, v11, v16);

  if (!v9) {
}
  }

IMP sub_239886D68(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239886E10;
  v7[3] = &unk_264DAEF58;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239886E10(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  void v23[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v23[0] = v15;
  double v16 = v12;
  if (!v12)
  {
    double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13, v23[0]);
  }
  uint64_t v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a5, v23[0], v16);
  v23[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v23, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
}

IMP sub_239886F58(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239887000;
  v7[3] = &unk_264DAEF80;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239887000(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void v24[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v11 = a3;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = v11;
  if (!v11)
  {
    uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  double v15 = objc_msgSend_numberWithInteger_(NSNumber, v10, v12, a4, v14);
  v24[1] = v15;
  double v18 = objc_msgSend_numberWithInteger_(NSNumber, v16, v17, a5);
  v24[2] = v18;
  double v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, v20, v24, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v13, v21);

  if (!v11) {
}
  }

IMP sub_239887128(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398871D0;
  v7[3] = &unk_264DAEFA8;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_2398871D0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void v19[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v9 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = v9;
  if (!v9)
  {
    double v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v19[0] = v12;
  uint64_t v13 = objc_msgSend_numberWithInt_(NSNumber, v8, v10, a4);
  v19[1] = v13;
  double v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v19, 2);
  objc_msgSend_emitTMLSignal_withArguments_(v7, v17, v18, v11, v16);

  if (!v9) {
}
  }

IMP sub_2398872D0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239887378;
  v7[3] = &unk_264DAEFD0;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239887378(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5, double a6)
{
  v26[3] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v13 = a3;
  uint64_t v15 = *(void *)(a1 + 32);
  double v16 = v13;
  if (!v13)
  {
    double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  double v17 = objc_msgSend_convertPoint_(TMLTypes, v12, a5, a6, v16);
  v26[1] = v17;
  double v20 = objc_msgSend_valueWithPointer_(MEMORY[0x263F08D40], v18, v19, a4);
  v26[2] = v20;
  double v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, v22, v26, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v11, v24, v25, v15, v23);

  if (!v13) {
}
  }

IMP sub_2398874B4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988755C;
  v7[3] = &unk_264DAF058;
  id v8 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_23988755C(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v28[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v11 = a3;
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = v11;
  if (!v11)
  {
    double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  v28[0] = v14;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_239887798;
  v27[3] = &unk_264DAEFF0;
  v27[4] = a4;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2398877B4;
  v26[3] = &unk_264DAF010;
  void v26[4] = a4;
  uint64_t v15 = objc_msgSend_pointerWithReadBlock_writeBlock_(TMLPointer, v10, v12, v27, v26);
  v28[1] = v15;
  void v24[4] = a5;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_239887838;
  void v25[3] = &unk_264DAEFF0;
  void v25[4] = a5;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_239887844;
  void v24[3] = &unk_264DAF030;
  double v18 = objc_msgSend_pointerWithReadBlock_writeBlock_(TMLPointer, v16, v17, v25, v24);
  void v28[2] = v18;
  double v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, v20, v28, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v13, v21);

  if (!v11) {
}
  }

uint64_t sub_239887798(uint64_t a1, const char *a2)
{
  return objc_msgSend_convertRect_(TMLTypes, a2, **(double **)(a1 + 32), *(double *)(*(void *)(a1 + 32) + 8), *(double *)(*(void *)(a1 + 32) + 16), *(double *)(*(void *)(a1 + 32) + 24));
}

void sub_2398877B4(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    IMP v5 = *(void **)(a1 + 32);
    id v6 = objc_msgSend_CGRectValue(v13, v3, v4);
    objc_msgSend_CGRectValue(v6, v7, v8);
    *IMP v5 = v9;
    v5[1] = v10;
    v5[2] = v11;
    v5[3] = v12;
  }
}

id sub_239887838(uint64_t a1)
{
  return **(id **)(a1 + 32);
}

void sub_239887844(uint64_t a1, void *a2)
{
}

IMP sub_23988784C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398878F4;
  v7[3] = &unk_264DAF080;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_2398878F4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void v24[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v11 = a3;
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = v11;
  if (!v11)
  {
    double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  uint64_t v15 = objc_msgSend_numberWithInteger_(NSNumber, v10, v12, a4, v14);
  v24[1] = v15;
  double v18 = objc_msgSend_numberWithBool_(NSNumber, v16, v17, a5);
  v24[2] = v18;
  double v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, v20, v24, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v13, v21);

  if (!v11) {
}
  }

IMP sub_239887A1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239887AC4;
  v7[3] = &unk_264DAF0A8;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239887AC4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  void v23[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a5;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = v10;
  if (!v10)
  {
    uint64_t v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  double v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a4, v15);
  v23[1] = v17;
  double v19 = v12;
  if (!v12)
  {
    double v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v18);
  }
  v23[2] = v19;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, v18, v23, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12) {
  if (!v10)
  }
}

IMP sub_239887C04(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239887CAC;
  v7[3] = &unk_264DAF0D0;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239887CAC(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  void v28[4] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v14 = a4;
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = v12;
  if (!v12)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v28[0] = v17;
  double v18 = v14;
  if (!v14)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v28[1] = v18;
  double v19 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v13, v15, a5);
  void v28[2] = v19;
  double v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, v21, a6);
  v28[3] = v22;
  double v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v23, v24, v28, 4);
  objc_msgSend_emitTMLSignal_withArguments_(v11, v26, v27, v16, v25);

  if (!v14)
  {

    if (v12) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v12) {
    goto LABEL_9;
  }
LABEL_7:
}

IMP sub_239887E1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239887EC4;
  v7[3] = &unk_264DAF0F8;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239887EC4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6)
{
  void v28[4] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v14 = a5;
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = v12;
  if (!v12)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v28[0] = v17;
  double v19 = objc_msgSend_numberWithBool_(NSNumber, v13, v15, a4);
  v28[1] = v19;
  double v21 = v14;
  if (!v14)
  {
    double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v20);
  }
  void v28[2] = v21;
  double v22 = objc_msgSend_numberWithBool_(NSNumber, v18, v20, a6);
  v28[3] = v22;
  double v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v23, v24, v28, 4);
  objc_msgSend_emitTMLSignal_withArguments_(v11, v26, v27, v16, v25);

  if (!v14) {
  if (!v12)
  }
}

IMP sub_23988802C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398880D4;
  v7[3] = &unk_264DAF120;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_2398880D4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  v31[5] = *MEMORY[0x263EF8340];
  id v30 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v18 = a7;
  uint64_t v29 = *(void *)(a1 + 32);
  uint64_t v20 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v19);
  }
  double v28 = (void *)v20;
  v31[0] = v20;
  double v21 = v14;
  if (!v14)
  {
    double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v19);
  }
  v31[1] = v21;
  double v22 = v15;
  if (!v15)
  {
    double v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v19);
  }
  v31[2] = v22;
  double v23 = v16;
  if (!v16)
  {
    double v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v19);
  }
  v31[3] = v23;
  double v24 = v18;
  if (!v18)
  {
    double v24 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v19);
  }
  void v31[4] = v24;
  double v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v17, v19, v31, 5);
  objc_msgSend_emitTMLSignal_withArguments_(v30, v26, v27, v29, v25);

  if (v18)
  {
    if (v16) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v16)
    {
LABEL_13:
      if (v15) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
  }

  if (v15)
  {
LABEL_14:
    if (v14) {
      goto LABEL_15;
    }
LABEL_20:

    if (v13) {
      goto LABEL_16;
    }
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v14) {
    goto LABEL_20;
  }
LABEL_15:
  if (!v13) {
    goto LABEL_21;
  }
LABEL_16:
}

IMP sub_2398882BC(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239888364;
  v7[3] = &unk_264DAF148;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_239888364(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v29[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v10;
  if (!v10)
  {
    id v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v29[0] = v16;
  double v17 = v11;
  if (!v11)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v29[1] = v17;
  id v18 = v13;
  if (!v13)
  {
    id v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v29[2] = v18;
  double v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, v14, v29, 3);
  id v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v20, v21, v15, v19, &v28);
  id v22 = v28;

  if (v13)
  {
    if (v11) {
      goto LABEL_9;
    }
LABEL_12:

    if (v10) {
      goto LABEL_10;
    }
LABEL_13:

    goto LABEL_10;
  }

  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  if (!v10) {
    goto LABEL_13;
  }
LABEL_10:
  objc_msgSend_CGSizeValue(v22, v23, v24);
  double v26 = v25;

  return v26;
}

IMP sub_239888504(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398885AC;
  v7[3] = &unk_264DAF170;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_2398885AC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  void v25[3] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v14 = a6;
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = v12;
  if (!v12)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  double v19 = objc_msgSend_convertRange_(TMLTypes, v13, v15, a4, a5, v17);
  v25[1] = v19;
  double v21 = v14;
  if (!v14)
  {
    double v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v20);
  }
  v25[2] = v21;
  id v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v20, v25, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v11, v23, v24, v16, v22);

  if (!v14) {
  if (!v12)
  }
}

IMP sub_2398886F4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988879C;
  v7[3] = &unk_264DAF198;
  id v8 = v2;
  id v3 = v2;
  double v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_23988879C(uint64_t a1, void *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(a2, (const char *)a2, a3, v3, 0, &v6);
  id v4 = v6;
  return v4;
}

IMP sub_2398887E8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239888890;
  v7[3] = &unk_264DAF1C0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_239888890(uint64_t a1, void *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v10 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(a2, (const char *)a2, a3, v3, 0, &v10);
  id v4 = v10;
  objc_msgSend_doubleValue(v4, v5, v6);
  double v8 = v7;

  return v8;
}

IMP sub_2398888F0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239888998;
  v7[3] = &unk_264DAF1C0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_239888998(uint64_t a1, void *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(a2, (const char *)a2, a3, v3, 0, &v9);
  id v4 = v9;
  double v7 = (double)objc_msgSend_integerValue(v4, v5, v6);

  return v7;
}

IMP sub_2398889F8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239888AA0;
  v7[3] = &unk_264DAF1E8;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_239888AA0(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v7;
  if (!v7)
  {
    id v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v8);
  }
  v17[0] = v10;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v8, v17, 1);
  id v16 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v16);
  id v14 = v16;

  if (!v7) {
  return v14;
  }
}

IMP sub_239888BA4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239888C4C;
  v7[3] = &unk_264DAF210;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_239888C4C(uint64_t a1, void *a2, void *a3, void *a4)
{
  v21[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = v8;
  if (!v8)
  {
    double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v21[0] = v13;
  id v14 = v10;
  if (!v10)
  {
    id v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v21[1] = v14;
  double v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v11, v21, 2);
  id v20 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v20);
  id v18 = v20;

  if (v10)
  {
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v8) {
      goto LABEL_7;
    }
  }

LABEL_7:
  return v18;
}

IMP sub_239888D98(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239888E40;
  v7[3] = &unk_264DAF238;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_239888E40(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void v25[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v10;
  if (!v10)
  {
    id v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v25[0] = v16;
  double v17 = v11;
  if (!v11)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v25[1] = v17;
  id v18 = v13;
  if (!v13)
  {
    id v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v25[2] = v18;
  double v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, v14, v25, 3);
  id v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v20, v21, v15, v19, &v24);
  id v22 = v24;

  if (v13)
  {
    if (v11) {
      goto LABEL_9;
    }
LABEL_14:

    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v11) {
    goto LABEL_14;
  }
LABEL_9:
  if (v10) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:
  return v22;
}

IMP sub_239888FD0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239889078;
  v7[3] = &unk_264DAF260;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_239889078(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void v22[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v9 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = v9;
  if (!v9)
  {
    uint64_t v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v22[0] = v12;
  id v13 = objc_msgSend_numberWithInteger_(NSNumber, v8, v10, a4);
  v22[1] = v13;
  id v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v22, 2);
  id v21 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v21);
  id v19 = v21;

  if (!v9) {
  return v19;
  }
}

IMP sub_2398891A0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239889248;
  v7[3] = &unk_264DAF288;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_239889248(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v27[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v11 = a3;
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = v11;
  if (!v11)
  {
    double v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  v27[0] = v14;
  double v15 = objc_msgSend_numberWithInteger_(NSNumber, v10, v12, a4);
  v27[1] = v15;
  double v18 = objc_msgSend_numberWithInteger_(NSNumber, v16, v17, a5);
  v27[2] = v18;
  id v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, v20, v27, 3);
  id v26 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v22, v23, v13, v21, &v26);
  id v24 = v26;

  if (!v11) {
  return v24;
  }
}

IMP sub_239889398(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239889440;
  v7[3] = &unk_264DAF2B0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_239889440(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void v29[4] = *MEMORY[0x263EF8340];
  id v27 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v15 = a6;
  uint64_t v17 = *(void *)(a1 + 32);
  double v18 = v11;
  if (!v11)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v29[0] = v18;
  id v19 = v12;
  if (!v12)
  {
    id v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v29[1] = v19;
  double v20 = v13;
  if (!v13)
  {
    double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v29[2] = v20;
  id v21 = v15;
  if (!v15)
  {
    id v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v29[3] = v21;
  id v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v16, v29, 4);
  id v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v27, v23, v24, v17, v22, &v28);
  id v25 = v28;

  if (v15)
  {
    if (v13) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v13)
    {
LABEL_11:
      if (v12) {
        goto LABEL_12;
      }
LABEL_18:

      if (v11) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v12) {
    goto LABEL_18;
  }
LABEL_12:
  if (v11) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:
  return v25;
}

IMP sub_239889610(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398896B8;
  v7[3] = &unk_264DAF2D8;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_2398896B8(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  void v31[4] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v14 = a6;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = v12;
  if (!v12)
  {
    uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v31[0] = v17;
  double v18 = objc_msgSend_numberWithInteger_(NSNumber, v13, v15, a4);
  v31[1] = v18;
  id v22 = objc_msgSend_numberWithInteger_(NSNumber, v19, v20, a5);
  v31[2] = v22;
  double v24 = v14;
  if (!v14)
  {
    double v24 = objc_msgSend_null(MEMORY[0x263EFF9D0], v21, v23);
  }
  v31[3] = v24;
  id v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, v23, v31, 4);
  id v30 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v26, v27, v16, v25, &v30);
  id v28 = v30;

  if (!v14) {
  if (!v12)
  }

  return v28;
}

IMP sub_239889848(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2398898F0;
  v7[3] = &unk_264DAF300;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_2398898F0(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  v30[4] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v15 = a6;
  uint64_t v17 = *(void *)(a1 + 32);
  double v18 = v12;
  if (!v12)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v16);
  }
  v30[0] = v18;
  double v20 = objc_msgSend_numberWithInteger_(NSNumber, v14, v16, a4);
  v30[1] = v20;
  id v22 = v13;
  if (!v13)
  {
    id v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v21);
  }
  v30[2] = v22;
  double v23 = v15;
  if (!v15)
  {
    double v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v21);
  }
  v30[3] = v23;
  double v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, v21, v30, 4);
  id v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v25, v26, v17, v24, &v29);
  id v27 = v29;

  if (v15)
  {
    if (v13) {
      goto LABEL_9;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_9;
    }
  }

LABEL_9:
  if (!v12) {

  }
  return v27;
}

IMP sub_239889AA0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239889B48;
  v7[3] = &unk_264DAEF80;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_239889B48(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void v24[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v11 = a3;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v11;
  if (!v11)
  {
    id v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  id v15 = objc_msgSend_numberWithInteger_(NSNumber, v10, v12, a4, v14);
  v24[1] = v15;
  double v18 = objc_msgSend_numberWithInteger_(NSNumber, v16, v17, a5);
  v24[2] = v18;
  double v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, v20, v24, 3);
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v13, v21);

  if (!v11) {
}
  }

IMP sub_239889C70(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239889D18;
  v7[3] = &unk_264DAF328;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_239889D18(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = v7;
  if (!v7)
  {
    double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v8);
  }
  v20[0] = v10;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v8, v20, 1);
  id v19 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v19);
  id v14 = v19;

  if (!v7) {
  uint64_t v17 = objc_msgSend_integerValue(v14, v15, v16);
  }

  return v17;
}

IMP sub_239889E1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239889EC4;
  v7[3] = &unk_264DAF350;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_239889EC4(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = v7;
  if (!v7)
  {
    double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v8);
  }
  v20[0] = v10;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v8, v20, 1);
  id v19 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v19);
  id v14 = v19;

  if (!v7) {
  uint64_t v17 = objc_msgSend_unsignedIntegerValue(v14, v15, v16);
  }

  return v17;
}

IMP sub_239889FC8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988A070;
  v7[3] = &unk_264DAF378;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988A070(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = v7;
  if (!v7)
  {
    double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v8);
  }
  v21[0] = v10;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v8, v21, 1);
  id v20 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v20);
  id v14 = v20;

  if (!v7) {
  objc_msgSend_CGRectValue(v14, v15, v16);
  }
  double v18 = v17;

  return v18;
}

IMP sub_23988A19C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988A244;
  v7[3] = &unk_264DAF3A0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988A244(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v9 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = v9;
  if (!v9)
  {
    double v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v25[0] = v12;
  double v13 = objc_msgSend_numberWithInteger_(NSNumber, v8, v10, a4);
  v25[1] = v13;
  double v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v25, 2);
  id v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v24);
  id v19 = v24;

  if (!v9) {
  uint64_t v22 = objc_msgSend_integerValue(v19, v20, v21);
  }

  return v22;
}

IMP sub_23988A36C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988A414;
  v7[3] = &unk_264DAF3C8;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988A414(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v9 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = v9;
  if (!v9)
  {
    double v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v25[0] = v12;
  double v13 = objc_msgSend_numberWithInteger_(NSNumber, v8, v10, a4);
  v25[1] = v13;
  double v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v25, 2);
  id v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v24);
  id v19 = v24;

  if (!v9) {
  uint64_t v22 = objc_msgSend_BOOLValue(v19, v20, v21);
  }

  return v22;
}

IMP sub_23988A53C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988A5E4;
  v7[3] = &unk_264DAF3F0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988A5E4(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = v7;
  if (!v7)
  {
    double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v8);
  }
  v20[0] = v10;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v8, v20, 1);
  id v19 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v19);
  id v14 = v19;

  if (!v7) {
  uint64_t v17 = objc_msgSend_BOOLValue(v14, v15, v16);
  }

  return v17;
}

IMP sub_23988A6E8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988A790;
  v7[3] = &unk_264DAF418;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988A790(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = v7;
  if (!v7)
  {
    double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v8);
  }
  v21[0] = v10;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v8, v21, 1);
  id v20 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v20);
  id v14 = v20;

  if (!v7) {
  objc_msgSend_doubleValue(v14, v15, v16);
  }
  double v18 = v17;

  return v18;
}

IMP sub_23988A89C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988A944;
  v7[3] = &unk_264DAF440;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988A944(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  void v28[2] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v11 = a3;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v11;
  if (!v11)
  {
    id v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v12);
  }
  v28[0] = v14;
  double v15 = objc_msgSend_convertPoint_(TMLTypes, v10, a4, a5);
  v28[1] = v15;
  double v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, v17, v28, 2);
  id v27 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v19, v20, v13, v18, &v27);
  id v21 = v27;

  if (!v11) {
  objc_msgSend_CGPointValue(v21, v22, v23);
  }
  double v25 = v24;

  return v25;
}

IMP sub_23988AA84(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988AB2C;
  v7[3] = &unk_264DAF468;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988AB2C(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  v31[3] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v14 = a6;
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = v12;
  if (!v12)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v31[0] = v17;
  id v19 = objc_msgSend_convertRange_(TMLTypes, v13, v15, a4, a5);
  v31[1] = v19;
  id v21 = v14;
  if (!v14)
  {
    id v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v20);
  }
  v31[2] = v21;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v20, v31, 3);
  id v30 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v23, v24, v16, v22, &v30);
  id v25 = v30;

  if (!v14) {
  if (!v12)
  }

  unsigned int v28 = objc_msgSend_BOOLValue(v25, v26, v27);
  return v28;
}

IMP sub_23988AC9C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988AD44;
  v7[3] = &unk_264DAF490;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988AD44(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  v31[3] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v14 = a4;
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = v12;
  if (!v12)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v31[0] = v17;
  double v18 = v14;
  if (!v14)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v31[1] = v18;
  id v19 = objc_msgSend_convertRange_(TMLTypes, v13, v15, a5, a6);
  v31[2] = v19;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v20, v21, v31, 3);
  id v30 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v23, v24, v16, v22, &v30);
  id v25 = v30;

  if (!v14)
  {

    if (v12) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v12) {
    goto LABEL_9;
  }
LABEL_7:
  unsigned int v28 = objc_msgSend_BOOLValue(v25, v26, v27);

  return v28;
}

IMP sub_23988AEBC(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988AF64;
  v7[3] = &unk_264DAF4B8;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988AF64(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v29[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v29[0] = v15;
  uint64_t v16 = v12;
  if (!v12)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v29[1] = v16;
  double v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a5);
  v29[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v29, 3);
  id v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v28);
  id v23 = v28;

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v26 = objc_msgSend_integerValue(v23, v24, v25);

  return v26;
}

IMP sub_23988B0D4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988B17C;
  v7[3] = &unk_264DAF4E0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988B17C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v29[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v29[0] = v15;
  uint64_t v16 = v12;
  if (!v12)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v29[1] = v16;
  double v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a5);
  v29[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v29, 3);
  id v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v28);
  id v23 = v28;

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v26 = objc_msgSend_BOOLValue(v23, v24, v25);

  return v26;
}

IMP sub_23988B2EC(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988B394;
  v7[3] = &unk_264DAF4E0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988B394(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v29[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v29[0] = v15;
  uint64_t v16 = v12;
  if (!v12)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v29[1] = v16;
  double v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a5);
  v29[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v29, 3);
  id v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v28);
  id v23 = v28;

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v26 = objc_msgSend_BOOLValue(v23, v24, v25);

  return v26;
}

IMP sub_23988B504(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988B5AC;
  v7[3] = &unk_264DAF508;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988B5AC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void v28[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = v10;
  if (!v10)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v28[0] = v16;
  double v17 = v11;
  if (!v11)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  v28[1] = v17;
  double v18 = v13;
  if (!v13)
  {
    double v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v14);
  }
  void v28[2] = v18;
  double v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, v14, v28, 3);
  id v27 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v20, v21, v15, v19, &v27);
  id v22 = v27;

  if (v13)
  {
    if (v11) {
      goto LABEL_9;
    }
LABEL_12:

    if (v10) {
      goto LABEL_10;
    }
LABEL_13:

    goto LABEL_10;
  }

  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  if (!v10) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v25 = objc_msgSend_BOOLValue(v22, v23, v24);

  return v25;
}

IMP sub_23988B73C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988B7E4;
  v7[3] = &unk_264DAF530;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988B7E4(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v30[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = v10;
  if (!v10)
  {
    uint64_t v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v30[0] = v15;
  uint64_t v16 = v12;
  if (!v12)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v30[1] = v16;
  double v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a5);
  v30[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v30, 3);
  id v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v29);
  id v23 = v29;

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
  objc_msgSend_doubleValue(v23, v24, v25);
  double v27 = v26;

  return v27;
}

IMP sub_23988B95C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988BA04;
  v7[3] = &unk_264DAF558;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988BA04(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v30[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = v10;
  if (!v10)
  {
    uint64_t v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v30[0] = v15;
  uint64_t v16 = v12;
  if (!v12)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v30[1] = v16;
  double v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a5);
  v30[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v30, 3);
  id v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v29);
  id v23 = v29;

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
  objc_msgSend_UIEdgeInsetsValue(v23, v24, v25);
  double v27 = v26;

  return v27;
}

IMP sub_23988BB9C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988BC44;
  v7[3] = &unk_264DAF580;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988BC44(uint64_t a1, void *a2, void *a3, void *a4)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = v8;
  if (!v8)
  {
    double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v25[0] = v13;
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v25[1] = v14;
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v11, v25, 2);
  id v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v24);
  id v18 = v24;

  if (!v10)
  {

    if (v8) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_7:
  objc_msgSend_doubleValue(v18, v19, v20);
  double v22 = v21;

  return v22;
}

IMP sub_23988BD98(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988BE40;
  v7[3] = &unk_264DAF5A8;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988BE40(uint64_t a1, void *a2, void *a3, void *a4)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = v8;
  if (!v8)
  {
    double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v24[0] = v13;
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v24[1] = v14;
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v11, v24, 2);
  id v23 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v23);
  id v18 = v23;

  if (!v10)
  {

    if (v8) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v21 = objc_msgSend_integerValue(v18, v19, v20);

  return v21;
}

IMP sub_23988BF8C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988C034;
  v7[3] = &unk_264DAF5D0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988C034(uint64_t a1, void *a2, void *a3, void *a4)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = v8;
  if (!v8)
  {
    double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v24[0] = v13;
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v11);
  }
  v24[1] = v14;
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, v11, v24, 2);
  id v23 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v23);
  id v18 = v23;

  if (!v10)
  {

    if (v8) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v21 = objc_msgSend_BOOLValue(v18, v19, v20);

  return v21;
}

IMP sub_23988C180(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988C228;
  v7[3] = &unk_264DAF5F8;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988C228(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v26[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v9 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = v9;
  if (!v9)
  {
    uint64_t v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
  }
  v26[0] = v12;
  double v13 = objc_msgSend_numberWithInteger_(NSNumber, v8, v10, a4);
  v26[1] = v13;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v26, 2);
  id v25 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v25);
  id v19 = v25;

  if (!v9) {
  objc_msgSend_doubleValue(v19, v20, v21);
  }
  double v23 = v22;

  return v23;
}

IMP sub_23988C358(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988C400;
  v7[3] = &unk_264DAF620;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988C400(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = a2;
  double v13 = objc_msgSend_convertRect_(TMLTypes, v12, a3, a4, a5, a6);
  v26[0] = v13;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, v15, v26, 1);
  id v25 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v17, v18, v10, v16, &v25);

  id v19 = v25;
  objc_msgSend_CGRectValue(v19, v20, v21);
  double v23 = v22;

  return v23;
}

IMP sub_23988C528(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988C5D0;
  v7[3] = &unk_264DAF648;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988C5D0(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  void v36[2] = *MEMORY[0x263EF8340];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = a2;
  double v21 = objc_msgSend_convertRect_(TMLTypes, v20, a3, a4, a5, a6);
  v36[0] = v21;
  double v23 = objc_msgSend_convertRect_(TMLTypes, v22, a7, a8, a9, a10);
  v36[1] = v23;
  double v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v24, v25, v36, 2);
  id v35 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v19, v27, v28, v18, v26, &v35);

  id v29 = v35;
  objc_msgSend_CGRectValue(v29, v30, v31);
  double v33 = v32;

  return v33;
}

IMP sub_23988C748(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988C7F0;
  v7[3] = &unk_264DAF670;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988C7F0(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v30[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v12 = a4;
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v10;
  if (!v10)
  {
    double v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v30[0] = v15;
  uint64_t v16 = v12;
  if (!v12)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v13);
  }
  v30[1] = v16;
  double v17 = objc_msgSend_numberWithInteger_(NSNumber, v11, v13, a5);
  v30[2] = v17;
  double v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v30, 3);
  id v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v29);
  id v23 = v29;

  if (!v12)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_9;
  }
LABEL_7:
  objc_msgSend_CGSizeValue(v23, v24, v25);
  double v27 = v26;

  return v27;
}

IMP sub_23988C970(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988CA18;
  v7[3] = &unk_264DAF698;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_23988CA18(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  v42[3] = *MEMORY[0x263EF8340];
  id v21 = a2;
  id v23 = a3;
  uint64_t v25 = *(void *)(a1 + 32);
  double v26 = v23;
  if (!v23)
  {
    double v26 = objc_msgSend_null(MEMORY[0x263EFF9D0], v22, v24);
  }
  v42[0] = v26;
  double v27 = objc_msgSend_convertRect_(TMLTypes, v22, a4, a5, a6, a7);
  v42[1] = v27;
  id v29 = objc_msgSend_convertRect_(TMLTypes, v28, a8, a9, a10, a11);
  v42[2] = v29;
  double v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v30, v31, v42, 3);
  id v41 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v21, v33, v34, v25, v32, &v41);
  id v35 = v41;

  if (!v23) {
  objc_msgSend_CGRectValue(v35, v36, v37);
  }
  double v39 = v38;

  return v39;
}

IMP sub_23988CBD0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988CC78;
  v7[3] = &unk_264DAF6C0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988CC78(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  v33[4] = *MEMORY[0x263EF8340];
  id v31 = a2;
  id v11 = a3;
  id v12 = a4;
  id v14 = a5;
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = v11;
  if (!v11)
  {
    double v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v33[0] = v17;
  uint64_t v18 = v12;
  if (!v12)
  {
    uint64_t v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v33[1] = v18;
  double v19 = v14;
  if (!v14)
  {
    double v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
  }
  v33[2] = v19;
  double v20 = objc_msgSend_numberWithBool_(NSNumber, v13, v15, a6);
  v33[3] = v20;
  id v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, v22, v33, 4);
  id v32 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v31, v24, v25, v16, v23, &v32);
  id v26 = v32;

  if (v14)
  {
    if (v12) {
      goto LABEL_9;
    }
LABEL_12:

    if (v11) {
      goto LABEL_10;
    }
LABEL_13:

    goto LABEL_10;
  }

  if (!v12) {
    goto LABEL_12;
  }
LABEL_9:
  if (!v11) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v29 = objc_msgSend_BOOLValue(v26, v27, v28);

  return v29;
}

IMP sub_23988CE30(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23988CED8;
  v7[3] = &unk_264DAF6E8;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  IMP v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_23988CED8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v36[4] = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a3;
  id v16 = a4;
  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = v14;
  if (!v14)
  {
    double v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v15, v17);
  }
  v36[0] = v19;
  double v20 = v16;
  if (!v16)
  {
    double v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v15, v17);
  }
  v36[1] = v20;
  id v21 = objc_msgSend_convertRange_(TMLTypes, v15, v17, a5, a6);
  void v36[2] = v21;
  double v24 = objc_msgSend_numberWithInteger_(NSNumber, v22, v23, a7);
  void v36[3] = v24;
  double v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v25, v26, v36, 4);
  id v35 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v13, v28, v29, v18, v27, &v35);
  id v30 = v35;

  if (!v16)
  {

    if (v14) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v14) {
    goto LABEL_9;
  }
LABEL_7:
  unsigned int v33 = objc_msgSend_BOOLValue(v30, v31, v32);

  return v33;
}

char *sub_23988D2BC(uint64_t a1, id a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  double result = strdup(v8);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8 * a3) = result;
  return result;
}

void sub_23988D884(uint64_t a1)
{
  size_t v2 = strlen(a83847776gUj32C);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v3, v4, a83847776gUj32C, v2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);
}

void sub_23988F558(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x263EF8340];
  id v24 = a2;
  id v5 = a3;
  if (objc_msgSend_isEqualToString_(v24, v6, v7, @"state"))
  {
    if (objc_msgSend_type(v5, v8, v9) != 5)
    {
      id v12 = (void *)MEMORY[0x263EFF940];
      id v13 = NSString;
      id v14 = objc_msgSend_description(v5, v10, v11);
      double v17 = objc_msgSend_stringWithFormat_(v13, v15, v16, @"State property type is unexpected %@", v14);
      double v25 = @"property";
      v26[0] = v5;
      double v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, v19, v26, &v25, 1);
      objc_msgSend_exceptionWithName_reason_userInfo_(v12, v21, v22, @"TMLRuntimeException", v17, v20);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v23);
    }
  }
  else
  {
    objc_msgSend_verifyStateProperty_withClass_(*(void **)(a1 + 32), v8, v9, v5, *(void *)(a1 + 40));
  }
}

void sub_23988F6C0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((objc_msgSend_isEqualToString_(a2, v6, v7, @"state") & 1) == 0)
  {
    objc_property_attribute_t attributes = (objc_property_attribute_t)xmmword_264DAF708;
    long long v95 = xmmword_264DAF718;
    double v9 = *(objc_class **)(a1 + 32);
    objc_msgSend_propertyName(v5, v8, COERCE_DOUBLE(0x2398C59A3));
    id v10 = objc_claimAutoreleasedReturnValue();
    id v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
    class_addProperty(v9, v13, &attributes, 2u);

    id v14 = NSString;
    double v17 = objc_msgSend_propertyName(v5, v15, v16);
    objc_msgSend_stringWithFormat_(v14, v18, v19, @"%@ForState:", v17);
    double v20 = (NSString *)objc_claimAutoreleasedReturnValue();

    SEL v21 = NSSelectorFromString(v20);
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3221225472;
    v93[2] = sub_23988FABC;
    v93[3] = &unk_264DAF728;
    v93[4] = v21;
    double v22 = (void *)MEMORY[0x23ECA7DD0](v93);
    id v23 = imp_implementationWithBlock(v22);

    id v24 = NSString;
    double v27 = objc_msgSend_propertyName(v5, v25, v26);
    id v30 = objc_msgSend_substringToIndex_(v27, v28, v29, 1);
    unsigned int v33 = objc_msgSend_capitalizedString(v30, v31, v32);
    double v36 = objc_msgSend_propertyName(v5, v34, v35);
    double v39 = objc_msgSend_substringFromIndex_(v36, v37, v38, 1);
    objc_msgSend_stringWithFormat_(v24, v40, v41, @"get%@%@", v33, v39);
    double v42 = (NSString *)objc_claimAutoreleasedReturnValue();

    uint64_t v43 = *(objc_class **)(a1 + 32);
    double v44 = NSSelectorFromString(v42);
    class_addMethod(v43, v44, v23, "@@:");
    double v45 = NSString;
    double v48 = objc_msgSend_propertyName(v5, v46, v47);
    uint64_t v51 = objc_msgSend_substringToIndex_(v48, v49, v50, 1);
    double v54 = objc_msgSend_capitalizedString(v51, v52, v53);
    unint64_t v57 = objc_msgSend_propertyName(v5, v55, v56);
    double v60 = objc_msgSend_substringFromIndex_(v57, v58, v59, 1);
    objc_msgSend_stringWithFormat_(v45, v61, v62, @"%@%@", v54, v60);
    uint64_t v63 = v91 = a1;
    objc_msgSend_stringWithFormat_(v45, v64, v65, @"set%@:forState:", v63);
    double v66 = (NSString *)objc_claimAutoreleasedReturnValue();

    SEL v67 = NSSelectorFromString(v66);
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = sub_23988FB58;
    v92[3] = &unk_264DAF748;
    v92[4] = v67;
    double v68 = (void *)MEMORY[0x23ECA7DD0](v92);
    uint64_t v69 = imp_implementationWithBlock(v68);

    double v70 = NSString;
    double v73 = objc_msgSend_propertyName(v5, v71, v72);
    double v76 = objc_msgSend_substringToIndex_(v73, v74, v75, 1);
    double v79 = objc_msgSend_capitalizedString(v76, v77, v78);
    double v82 = objc_msgSend_propertyName(v5, v80, v81);
    double v85 = objc_msgSend_substringFromIndex_(v82, v83, v84, 1);
    objc_msgSend_stringWithFormat_(v70, v86, v87, @"set%@%@:", v79, v85);
    double v88 = (NSString *)objc_claimAutoreleasedReturnValue();

    double v89 = *(objc_class **)(v91 + 32);
    double v90 = NSSelectorFromString(v88);
    class_addMethod(v89, v90, v69, "v@:@");
  }
}

id sub_23988FABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v6 = objc_msgSend_tmlParent(v3, v4, v5);
  if (v6)
  {
    double v7 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v7, *(SEL *)(a1 + 32));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v12 = objc_msgSend_state(v3, v10, v11);
    id v13 = ((void (*)(void *, uint64_t, uint64_t))MethodImplementation)(v6, v9, v12);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void sub_23988FB58(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v8 = objc_msgSend_tmlParent(v15, v6, v7);
  if (v8)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v9, *(SEL *)(a1 + 32));
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v14 = objc_msgSend_state(v15, v12, v13);
    ((void (*)(void *, uint64_t, id, uint64_t))MethodImplementation)(v8, v11, v5, v14);
  }
}

id sub_239890148(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  double v4 = objc_alloc_init(TMLContext);
  objc_msgSend_loadSourceFromPath_(v4, v5, v6, v3);
  uint64_t v9 = objc_msgSend_rootObject(v4, v7, v8);
  uint64_t v12 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v10, v11, v9);
  id v15 = objc_msgSend_tmlIdentifier(v9, v13, v14);
  objc_msgSend_addObject_withIdentifier_(v4, v16, v17, v12, v15);

  objc_setAssociatedObject(v9, "c", v4, (void *)1);
  objc_initWeak(&location, v4);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = sub_2398902C4;
  void v21[3] = &unk_264DAC1D0;
  objc_copyWeak(&v22, &location);
  objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v18, v19, v21, v9);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v9;
}

void sub_2398902A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2398902C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);
}

void sub_239890304(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, v5, &unk_26ECEE468, @"url");
  objc_msgSend_objectForKeyedSubscript_(v3, v6, v7, @"url");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v10, v8, v9, &unk_26ECEE488, @"components");
}

id sub_23989038C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v2, v3, v4))
  {
    double v7 = objc_msgSend_URLWithString_(NSURL, v5, v6, v2);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

id sub_239890410(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v2, v3, v4))
  {
    double v7 = objc_msgSend_componentsWithString_(MEMORY[0x263F08BA0], v5, v6, v2);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

id sub_239890494(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F08BA0]);
  double v5 = objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v2, v3, v4, a1, 1);
  double v8 = objc_msgSend_queryItems(v5, v6, v7);
  if (objc_msgSend_count(v8, v9, v10))
  {
    double v13 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v14 = objc_msgSend_count(v8, v11, v12);
    double v17 = objc_msgSend_dictionaryWithCapacity_(v13, v15, v16, v14);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v18 = v8;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, v20, &v43, v47, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v18);
          }
          double v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          double v28 = objc_msgSend_value(v27, v22, v23, (void)v43);
          id v31 = objc_msgSend_stringByRemovingPercentEncoding(v28, v29, v30);

          if (v31)
          {
            double v34 = objc_msgSend_name(v27, v32, v33);
            objc_msgSend_setObject_forKeyedSubscript_(v17, v35, v36, v31, v34);
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, v23, &v43, v47, 16);
      }
      while (v24);
    }

    if (objc_msgSend_count(v17, v37, v38))
    {
      double v41 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v39, v40, v17);
    }
    else
    {
      double v41 = 0;
    }
  }
  else
  {
    double v41 = 0;
  }

  return v41;
}

id sub_239890680(void *a1, uint64_t a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  double v16 = a3;
  v17[0] = a4;
  double v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  double v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v6, v9, v10, v17, &v16, 1);

  uint64_t v14 = objc_msgSend_withQueryParameters_(a1, v12, v13, v11);

  return v14;
}

id sub_23989074C(uint64_t a1, uint64_t a2, void *a3)
{
  v69[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (qword_268A05958 != -1) {
    dispatch_once(&qword_268A05958, &unk_26ECEE4A8);
  }
  id v5 = objc_alloc(MEMORY[0x263F08B30]);
  id v8 = objc_msgSend_initWithKey_ascending_(v5, v6, v7, @"name", 1);
  id v9 = objc_alloc(MEMORY[0x263F08BA0]);
  double v12 = objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v9, v10, v11, a1, 0);
  id v15 = objc_msgSend_percentEncodedQuery(v12, v13, v14);
  objc_msgSend_setQuery_(v12, v16, v17, v15);

  double v20 = objc_msgSend_queryItems(v12, v18, v19);
  double v23 = objc_msgSend_mutableCopy(v20, v21, v22);

  if (v23)
  {
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = sub_239890AD8;
    v66[3] = &unk_264DAC1A8;
    id v24 = v23;
    id v67 = v24;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v25, v26, v66);
    if (objc_msgSend_count(v24, v27, v28))
    {
      v69[0] = v8;
      id v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, v30, v69, 1);
      objc_msgSend_sortUsingDescriptors_(v24, v32, v33, v31);

      objc_msgSend_setQueryItems_(v12, v34, v35, v24);
    }
    id v36 = v67;
  }
  else
  {
    id v37 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v40 = objc_msgSend_count(v4, v38, v39);
    long long v43 = objc_msgSend_initWithCapacity_(v37, v41, v42, v40);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = sub_239890D48;
    v64[3] = &unk_264DAC1A8;
    id v36 = v43;
    id v65 = v36;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v44, v45, v64);
    if (objc_msgSend_count(v36, v46, v47))
    {
      double v68 = v8;
      double v50 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v48, v49, &v68, 1);
      objc_msgSend_sortUsingDescriptors_(v36, v51, v52, v50);

      objc_msgSend_setQueryItems_(v12, v53, v54, v36);
    }
  }
  unint64_t v57 = objc_msgSend_query(v12, v55, v56);
  objc_msgSend_setPercentEncodedQuery_(v12, v58, v59, v57);

  double v62 = objc_msgSend_URL(v12, v60, v61);

  return v62;
}

void sub_239890A44(double a1, uint64_t a2, const char *a3)
{
  id v3 = (void *)MEMORY[0x263F089C0];
  id v4 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], a3, a1);
  double v7 = objc_msgSend_bitmapRepresentation(v4, v5, v6);
  double v10 = objc_msgSend_characterSetWithBitmapRepresentation_(v3, v8, v9, v7);

  objc_msgSend_removeCharactersInString_(v10, v11, v12, @"!*'();:@&=+$,/?%#[]");
  double v13 = (void *)qword_268A05950;
  qword_268A05950 = (uint64_t)v10;
}

void sub_239890AD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend_stringValue(v6, v7, v8);

    id v6 = (id)v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v12 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v5, v10, v11, qword_268A05950);

    uint64_t v15 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v6, v13, v14, qword_268A05950);

    id v16 = objc_alloc(MEMORY[0x263F08BD0]);
    double v19 = objc_msgSend_initWithName_value_(v16, v17, v18, v12, v15);
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v38 = objc_msgSend_count(*(void **)(a1 + 32), v20, COERCE_DOUBLE(0x2020000000));
    uint64_t v21 = *(void **)(a1 + 32);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_239890CE0;
    v31[3] = &unk_264DAF7D0;
    id v5 = v12;
    id v32 = v5;
    id v33 = *(id *)(a1 + 32);
    double v34 = &v35;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v21, v22, v23, 2, v31);
    unint64_t v24 = v36[3];
    unint64_t v28 = objc_msgSend_count(*(void **)(a1 + 32), v25, v26);
    double v30 = *(void **)(a1 + 32);
    if (v24 >= v28) {
      objc_msgSend_addObject_(v30, v27, v29, v19);
    }
    else {
      objc_msgSend_insertObject_atIndex_(v30, v27, v29, v19, v36[3]);
    }

    _Block_object_dispose(&v35, 8);
    id v6 = (id)v15;
  }
}

void sub_239890CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239890CE0(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v6 = objc_msgSend_name(a2, (const char *)a2, a4);
  int isEqualToString = objc_msgSend_isEqualToString_(v6, v7, v8, *(void *)(a1 + 32));

  if (isEqualToString)
  {
    objc_msgSend_removeObjectAtIndex_(*(void **)(a1 + 40), v10, v11, a3);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
}

void sub_239890D48(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_stringValue(v5, v6, v7);

    id v5 = (id)v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v21, v9, v10, qword_268A05950);

    uint64_t v14 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v5, v12, v13, qword_268A05950);

    id v15 = objc_alloc(MEMORY[0x263F08BD0]);
    double v18 = objc_msgSend_initWithName_value_(v15, v16, v17, v11, v14);
    objc_msgSend_addObject_(*(void **)(a1 + 32), v19, v20, v18);

    id v5 = (id)v14;
    id v21 = (id)v11;
  }
}

id sub_239890E60(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend_isObject(v4, v5, v6))
  {
    id v9 = objc_alloc(MEMORY[0x263F08BA0]);
    double v12 = objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v9, v10, v11, a1, 0);
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v16 = objc_msgSend_queryItems(v12, v14, v15);
    uint64_t v46 = MEMORY[0x263EF8330];
    uint64_t v47 = 3221225472;
    uint64_t v48 = sub_239891040;
    double v49 = &unk_264DAF7F8;
    id v50 = v4;
    id v17 = v13;
    id v51 = v17;
    objc_msgSend_enumerateObjectsUsingBlock_(v16, v18, v19, &v46);

    uint64_t v22 = objc_msgSend_count(v17, v20, v21, v46, v47, v48, v49);
    uint64_t v25 = objc_msgSend_queryItems(v12, v23, v24);
    uint64_t v28 = objc_msgSend_count(v25, v26, v27);

    if (v22 == v28)
    {
      id v31 = a1;
    }
    else
    {
      objc_msgSend_setQueryItems_(v12, v29, v30, v17);
      objc_msgSend_URL(v12, v43, v44);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v42 = v31;
  }
  else
  {
    id v32 = (void *)MEMORY[0x263F10390];
    id v33 = objc_msgSend_currentContext(MEMORY[0x263F10378], v7, v8);
    id v36 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v32, v34, v35, @"Callback is not a function", v33);
    double v39 = objc_msgSend_currentContext(MEMORY[0x263F10378], v37, v38);
    objc_msgSend_setException_(v39, v40, v41, v36);

    id v42 = a1;
  }

  return v42;
}

void sub_239891040(uint64_t a1, void *a2)
{
  void v22[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  double v7 = objc_msgSend_name(v3, v5, v6);
  v22[0] = v7;
  double v10 = objc_msgSend_value(v3, v8, v9);
  v22[1] = v10;
  id v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, v12, v22, 2);
  id v16 = objc_msgSend_callWithArguments_(v4, v14, v15, v13);
  int v19 = objc_msgSend_toBool(v16, v17, v18);

  if (v19) {
    objc_msgSend_addObject_(*(void **)(a1 + 40), v20, v21, v3);
  }
}

id sub_239891138(void *a1, const char *a2, uint64_t a3, double a4)
{
  if (a3)
  {
    objc_msgSend_URLByAppendingPathComponent_(a1, a2, a4);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = a1;
  }
  return v4;
}

void sub_23989120C(uint64_t a1, CFIndex length, UInt8 *bytes)
{
}

void sub_239891714()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v3 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v1, v2, "MIICWDCCAcGgAwIBAgIJAKX2XHbzG9CnMA0GCSqGSIb3DQEBBQUAMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwHhcNMTUwNzAyMjEzODM4WhcNMjUwNjI5MjEzODM4WjBFMQswCQYDVQQGEwJBVTETMBEGA1UECAwKU29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCZNZ0LmFnyWOH1tqI2VRx4NxonFgBtCqYaSlEzooXvbBw7fGPMqSfUeD6NtPFQ1PLH98wtU2I45MARnaE3kyjXiqfwIc0woZps/DbjMlzzYsNhONAunYidUnOheLF3GBjK5BcHM6800t6V+X+dc0q6TRz35vI+ixe8tAPxp97dEwIDAQABo1AwTjAdBgNVHQ4EFgQUezHNL2J1JcWuVBeBheXDzFewGzswHwYDVR0jBBgwFoAUezHNL2J1JcWuVBeBheXDzFewGzswDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCBgmi6awOQgNJ1uUbQfFLuAgt2IqjnD9hfe/JNoadqeU5tCfp/UkwVvN8sQTnz6bM+yaTvQqQXs62a/b1P7DVMWbCkehLBrZpsZnAq3eLd2s2yF4ywhOEjDBR1zTrG0XhRxMoqNk84SAvSrauK295Wj3DObQDpS92itymTc/iR1Q==", 808, 0);
  CFDataRef v6 = (const __CFData *)objc_msgSend_initWithBase64EncodedData_options_(v0, v4, v5, v3, 0);

  SecCertificateRef v7 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v6);
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  SecPolicyRef v9 = BasicX509;
  if (v7) {
    BOOL v10 = BasicX509 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    SecTrustRef trust = 0;
    if (!SecTrustCreateWithCertificates(v7, BasicX509, &trust))
    {
      int v11 = 0;
      if (!MEMORY[0x23ECA7690](trust, &v11)) {
        qword_268A05960 = MEMORY[0x23ECA7670](trust);
      }
    }
    CFRelease(trust);
LABEL_14:
    CFRelease(v9);
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (BasicX509) {
    goto LABEL_14;
  }
  if (v7) {
LABEL_8:
  }
    CFRelease(v7);
LABEL_9:
}

void sub_2398918F0()
{
  id v0 = (void *)qword_268A05970;
  qword_268A05970 = (uint64_t)&unk_26ED1B3C8;
}

void sub_239891A7C(double a1, uint64_t a2, const char *a3)
{
  v87[36] = *MEMORY[0x263EF8340];
  double v85 = objc_msgSend_stringWithUTF8String_(NSString, a3, a1, "B");
  v86[0] = v85;
  v87[0] = &unk_26ED1AE40;
  double v84 = objc_msgSend_stringWithUTF8String_(NSString, v3, v4, "f");
  v86[1] = v84;
  v87[1] = &unk_26ED1AE58;
  uint64_t v83 = objc_msgSend_stringWithUTF8String_(NSString, v5, v6, "d");
  v86[2] = v83;
  v87[2] = &unk_26ED1AE70;
  double v82 = objc_msgSend_stringWithUTF8String_(NSString, v7, v8, "q");
  v86[3] = v82;
  v87[3] = &unk_26ED1AE88;
  double v81 = objc_msgSend_stringWithUTF8String_(NSString, v9, v10, "i");
  v86[4] = v81;
  v87[4] = &unk_26ED1AE88;
  double v80 = objc_msgSend_stringWithUTF8String_(NSString, v11, v12, "q");
  v86[5] = v80;
  v87[5] = &unk_26ED1AE88;
  double v79 = objc_msgSend_stringWithUTF8String_(NSString, v13, v14, "Q");
  v86[6] = v79;
  v87[6] = &unk_26ED1AEA0;
  double v78 = objc_msgSend_stringWithUTF8String_(NSString, v15, v16, "I");
  v86[7] = v78;
  v87[7] = &unk_26ED1AEA0;
  unsigned int v77 = objc_msgSend_stringWithUTF8String_(NSString, v17, v18, "Q");
  v86[8] = v77;
  v87[8] = &unk_26ED1AEB8;
  double v76 = objc_msgSend_stringWithUTF8String_(NSString, v19, v20, "Q");
  v86[9] = v76;
  v87[9] = &unk_26ED1AEA0;
  double v75 = objc_msgSend_stringWithUTF8String_(NSString, v21, v22, "{CGSize=dd}");
  v86[10] = v75;
  v87[10] = &unk_26ED1AF48;
  double v74 = objc_msgSend_stringWithUTF8String_(NSString, v23, v24, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v86[11] = v74;
  v87[11] = &unk_26ED1AF60;
  double v73 = objc_msgSend_stringWithUTF8String_(NSString, v25, v26, "{CGPoint=dd}");
  v86[12] = v73;
  v87[12] = &unk_26ED1AF78;
  double v72 = objc_msgSend_stringWithUTF8String_(NSString, v27, v28, "{CGVector=dd}");
  v86[13] = v72;
  v87[13] = &unk_26ED1AF90;
  uint64_t v71 = objc_msgSend_stringWithUTF8String_(NSString, v29, v30, "{UIOffset=dd}");
  v86[14] = v71;
  v87[14] = &unk_26ED1B0E0;
  double v70 = objc_msgSend_stringWithUTF8String_(NSString, v31, v32, "{CGAffineTransform=dddddd}");
  v86[15] = v70;
  v87[15] = &unk_26ED1AFA8;
  uint64_t v69 = objc_msgSend_stringWithUTF8String_(NSString, v33, v34, "{CATransform3D=dddddddddddddddd}");
  v86[16] = v69;
  v87[16] = &unk_26ED1AFC0;
  uint64_t v37 = objc_msgSend_stringWithUTF8String_(NSString, v35, v36, "{UIEdgeInsets=dddd}");
  v86[17] = v37;
  v87[17] = &unk_26ED1AFD8;
  uint64_t v40 = objc_msgSend_stringWithUTF8String_(NSString, v38, v39, "{NSDirectionalEdgeInsets=dddd}");
  v86[18] = v40;
  v87[18] = &unk_26ED1AFF0;
  long long v43 = objc_msgSend_stringWithUTF8String_(NSString, v41, v42, "{_NSRange=QQ}");
  v86[19] = v43;
  v87[19] = &unk_26ED1B008;
  uint64_t v46 = objc_msgSend_stringWithUTF8String_(NSString, v44, v45, "@");
  v86[20] = v46;
  v87[20] = &unk_26ED1B0C8;
  double v49 = objc_msgSend_stringWithUTF8String_(NSString, v47, v48, "#");
  v86[21] = v49;
  v87[21] = &unk_26ED1B0C8;
  double v52 = objc_msgSend_stringWithUTF8String_(NSString, v50, v51, "^v");
  v86[22] = v52;
  v87[22] = &unk_26ED1AED0;
  id v55 = objc_msgSend_stringWithUTF8String_(NSString, v53, v54, "^{CGColor=}");
  v86[23] = v55;
  v87[23] = &unk_26ED1AED0;
  double v58 = objc_msgSend_stringWithUTF8String_(NSString, v56, v57, "^{CGPath=}");
  v86[24] = v58;
  v87[24] = &unk_26ED1AED0;
  double v61 = objc_msgSend_stringWithUTF8String_(NSString, v59, v60, "^@");
  v86[25] = v61;
  v87[25] = &unk_26ED1B098;
  double v64 = objc_msgSend_stringWithUTF8String_(NSString, v62, v63, "v");
  v86[26] = v64;
  v86[27] = @"@\"NSString\"";
  v87[26] = &unk_26ED1AE28;
  v87[27] = &unk_26ED1AEE8;
  v86[28] = @"@\"NSAttributedString\"";
  v86[29] = @"@\"NSURL\"";
  v87[28] = &unk_26ED1AF00;
  v87[29] = &unk_26ED1B038;
  v86[30] = @"@\"NSArray\"";
  v86[31] = @"@\"NSDictionary\"";
  v87[30] = &unk_26ED1B050;
  v87[31] = &unk_26ED1B068;
  v86[32] = @"@\"TMLBlock\"";
  v86[33] = @"@\"UIColor\"";
  v87[32] = &unk_26ED1B050;
  v87[33] = &unk_26ED1AF18;
  v86[34] = @"@\"UIFont\"";
  v86[35] = @"@\"UIImage\"";
  v87[34] = &unk_26ED1AF30;
  v87[35] = &unk_26ED1B020;
  uint64_t v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v65, v66, v87, v86, 36);
  double v68 = (void *)qword_268A05980;
  qword_268A05980 = v67;
}

void sub_239892114(double a1, uint64_t a2, const char *a3)
{
  v93[29] = *MEMORY[0x263EF8340];
  v92[0] = &unk_26ED1AE28;
  uint64_t v91 = objc_msgSend_stringWithUTF8String_(NSString, a3, a1, "v");
  v93[0] = v91;
  v92[1] = &unk_26ED1AE40;
  double v90 = objc_msgSend_stringWithUTF8String_(NSString, v3, v4, "B");
  v93[1] = v90;
  v92[2] = &unk_26ED1AE58;
  double v89 = objc_msgSend_stringWithUTF8String_(NSString, v5, v6, "f");
  v93[2] = v89;
  v92[3] = &unk_26ED1AE70;
  double v88 = objc_msgSend_stringWithUTF8String_(NSString, v7, v8, "d");
  v93[3] = v88;
  v92[4] = &unk_26ED1AE88;
  double v87 = objc_msgSend_stringWithUTF8String_(NSString, v9, v10, "q");
  v93[4] = v87;
  void v92[5] = &unk_26ED1AEA0;
  double v86 = objc_msgSend_stringWithUTF8String_(NSString, v11, v12, "Q");
  void v93[5] = v86;
  v92[6] = &unk_26ED1AEB8;
  double v85 = objc_msgSend_stringWithUTF8String_(NSString, v13, v14, "Q");
  v93[6] = v85;
  v92[7] = &unk_26ED1AF48;
  double v84 = objc_msgSend_stringWithUTF8String_(NSString, v15, v16, "{CGSize=dd}");
  v93[7] = v84;
  v92[8] = &unk_26ED1AF60;
  uint64_t v83 = objc_msgSend_stringWithUTF8String_(NSString, v17, v18, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v93[8] = v83;
  v92[9] = &unk_26ED1AF78;
  double v82 = objc_msgSend_stringWithUTF8String_(NSString, v19, v20, "{CGPoint=dd}");
  v93[9] = v82;
  v92[10] = &unk_26ED1AF90;
  double v81 = objc_msgSend_stringWithUTF8String_(NSString, v21, v22, "{CGVector=dd}");
  v93[10] = v81;
  v92[11] = &unk_26ED1B0E0;
  double v80 = objc_msgSend_stringWithUTF8String_(NSString, v23, v24, "{UIOffset=dd}");
  v93[11] = v80;
  v92[12] = &unk_26ED1AFA8;
  double v79 = objc_msgSend_stringWithUTF8String_(NSString, v25, v26, "{CGAffineTransform=dddddd}");
  v93[12] = v79;
  v92[13] = &unk_26ED1AFC0;
  double v78 = objc_msgSend_stringWithUTF8String_(NSString, v27, v28, "{CATransform3D=dddddddddddddddd}");
  v93[13] = v78;
  v92[14] = &unk_26ED1AFD8;
  unsigned int v77 = objc_msgSend_stringWithUTF8String_(NSString, v29, v30, "{UIEdgeInsets=dddd}");
  v93[14] = v77;
  v92[15] = &unk_26ED1AFF0;
  double v76 = objc_msgSend_stringWithUTF8String_(NSString, v31, v32, "{NSDirectionalEdgeInsets=dddd}");
  v93[15] = v76;
  v92[16] = &unk_26ED1B008;
  double v75 = objc_msgSend_stringWithUTF8String_(NSString, v33, v34, "{_NSRange=QQ}");
  v93[16] = v75;
  v92[17] = &unk_26ED1AED0;
  double v74 = objc_msgSend_stringWithUTF8String_(NSString, v35, v36, "^v");
  v93[17] = v74;
  v92[18] = &unk_26ED1B0C8;
  double v73 = objc_msgSend_stringWithUTF8String_(NSString, v37, v38, "@");
  v93[18] = v73;
  v92[19] = &unk_26ED1AEE8;
  double v72 = objc_msgSend_stringWithUTF8String_(NSString, v39, v40, "@");
  v93[19] = v72;
  v92[20] = &unk_26ED1AF00;
  long long v43 = objc_msgSend_stringWithUTF8String_(NSString, v41, v42, "@");
  unsigned char v93[20] = v43;
  v92[21] = &unk_26ED1B050;
  uint64_t v46 = objc_msgSend_stringWithUTF8String_(NSString, v44, v45, "@");
  v93[21] = v46;
  v92[22] = &unk_26ED1B068;
  double v49 = objc_msgSend_stringWithUTF8String_(NSString, v47, v48, "@");
  v93[22] = v49;
  v92[23] = &unk_26ED1B080;
  double v52 = objc_msgSend_stringWithUTF8String_(NSString, v50, v51, "@?");
  v93[23] = v52;
  v92[24] = &unk_26ED1AF18;
  id v55 = objc_msgSend_stringWithUTF8String_(NSString, v53, v54, "@");
  v93[24] = v55;
  v92[25] = &unk_26ED1AF30;
  double v58 = objc_msgSend_stringWithUTF8String_(NSString, v56, v57, "@");
  v93[25] = v58;
  v92[26] = &unk_26ED1B020;
  double v61 = objc_msgSend_stringWithUTF8String_(NSString, v59, v60, "@");
  v93[26] = v61;
  v92[27] = &unk_26ED1B098;
  double v64 = objc_msgSend_stringWithUTF8String_(NSString, v62, v63, "^@");
  v93[27] = v64;
  v92[28] = &unk_26ED1B038;
  uint64_t v67 = objc_msgSend_stringWithUTF8String_(NSString, v65, v66, "@");
  v93[28] = v67;
  uint64_t v70 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v68, v69, v93, v92, 29);
  uint64_t v71 = (void *)qword_268A05990;
  qword_268A05990 = v70;
}

id sub_239892BDC(uint64_t a1, double a2, double a3)
{
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  SecCertificateRef v7 = objc_msgSend_initWithVector_(v5, v6, a2, a3);
  return v7;
}

void sub_239892CDC(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___TMLJSNil;
  id v1 = objc_msgSendSuper2(&v6, sel_allocWithZone_, 0);
  uint64_t v4 = objc_msgSend_init(v1, v2, v3);
  id v5 = (void *)qword_268A059A0;
  qword_268A059A0 = v4;
}

BOOL sub_239892E74(int a1, int a2, JSStringRef a)
{
  return !JSStringIsEqualToUTF8CString(a, "Symbol.toPrimitive");
}

uint64_t sub_239892E9C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_239892EA4()
{
  return 1;
}

uint64_t sub_239892EB0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_239892EB8()
{
  return 0;
}

JSValueRef sub_239892EC0(const OpaqueJSContext *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
      return JSValueMakeNull(a1);
    case 2:
      return JSValueMakeBoolean(a1, 0);
    case 3:
      return JSValueMakeNumber(a1, 0.0);
  }
  return JSValueMakeUndefined(a1);
}

uint64_t sub_2398932A8(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], a3, a1, @"dictionary");
  uint64_t v4 = qword_268A059B8;
  qword_268A059B8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

void sub_23989367C(uint64_t a1, uint64_t a2, void *a3)
{
  id v21 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v21, v3, v4, &unk_26ECEE568, @"rgb");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v5, v6, &unk_26ECEE588, @"rgba");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v7, v8, &unk_26ECEE5A8, @"hsb");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v9, v10, &unk_26ECEE5C8, @"hsba");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v11, v12, &unk_26ECEE5E8, @"color");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v13, v14, &unk_26ECEE608, @"colorWithAlpha");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v15, v16, &unk_26ECEE628, @"colorWithWhite");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v17, v18, &unk_26ECEE648, @"invertedColor");
  objc_msgSend_setObject_forKeyedSubscript_(v21, v19, v20, &unk_26ECEE668, @"dynamicColor");
}

uint64_t sub_239893788(double a1, double a2, double a3, uint64_t a4, const char *a5)
{
  return objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a5, a1 / 255.0, a2 / 255.0, a3 / 255.0, 1.0);
}

uint64_t sub_2398937AC(double a1, double a2, double a3, uint64_t a4, const char *a5)
{
  return objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a5, a1 / 255.0, a2 / 255.0, a3 / 255.0);
}

uint64_t sub_2398937CC(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_colorWithHue_saturation_brightness_alpha_, a1 / 360.0);
}

uint64_t sub_2398937E8(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_colorWithHue_saturation_brightness_alpha_, a1 / 360.0);
}

id sub_239893800(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_239893E0C();
  double v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, v2);

  if (!v6)
  {
    double v6 = sub_239893878(v2);
  }

  return v6;
}

id sub_239893878(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3) == 4)
  {
    id v6 = v1;
    uint64_t v9 = objc_msgSend_UTF8String(v6, v7, v8);
    unint64_t v10 = strtol((const char *)(v9 + 1), 0, 16);
    LODWORD(v10) = ((v10 & 0xF00) << 12) & 0xFFF00FF0 | ((v10 >> 4) << 12) | (16 * v10) | v10 & 0xF;
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v11, (float)((float)BYTE2(v10) / 255.0), (float)((float)BYTE1(v10) / 255.0), (float)((float)v10 / 255.0), 1.0);
  }
  else
  {
    if (objc_msgSend_length(v1, v4, v5) == 7)
    {
      id v13 = v1;
      uint64_t v16 = objc_msgSend_UTF8String(v13, v14, v15);
      uint64_t v17 = strtol((const char *)(v16 + 1), 0, 16);
    }
    else
    {
      LODWORD(v17) = 0;
    }
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v12, (float)((float)BYTE2(v17) / 255.0), (float)((float)BYTE1(v17) / 255.0), (float)((float)v17 / 255.0), 1.0);
  double v18 = };

  return v18;
}

id sub_239893994(double a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = sub_239893E0C();
  double v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);

  if (!v8)
  {
    double v8 = sub_239893878(v4);
  }
  unint64_t v10 = objc_msgSend_colorWithAlphaComponent_(v8, v9, a1);

  return v10;
}

uint64_t sub_239893A30(double a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_colorWithWhite_alpha_, a1);
}

id sub_239893A3C(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = sub_239893E0C();
  id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, v2);

  if (!v6)
  {
    id v6 = sub_239893878(v2);
  }
  double v14 = 0.0;
  double v15 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_(v6, v7, v8, &v15, &v14, &v13, &v12);
  unint64_t v10 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v9, 1.0 - v15, 1.0 - v14, 1.0 - v13, v12);

  return v10;
}

id sub_239893B10(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = sub_239893E0C();
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, v8, v4);

  if (!v9)
  {
    uint64_t v9 = sub_239893878(v4);
  }
  unint64_t v10 = sub_239893E0C();
  double v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, v12, v5);

  if (!v13)
  {
    double v13 = sub_239893878(v5);
  }
  double v14 = (void *)MEMORY[0x263F1C550];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = sub_239893C68;
  void v21[3] = &unk_264DAF9B0;
  id v22 = v13;
  id v23 = v9;
  id v15 = v9;
  id v16 = v13;
  int v19 = objc_msgSend_colorWithDynamicProvider_(v14, v17, v18, v21);

  return v19;
}

id sub_239893C68(uint64_t a1, void *a2, double a3)
{
  uint64_t v4 = objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3);
  uint64_t v5 = 40;
  if (v4 == 2) {
    uint64_t v5 = 32;
  }
  id v6 = *(void **)(a1 + v5);
  return v6;
}

uint64_t sub_239893CB4(void *a1)
{
  id v1 = a1;
  return objc_msgSend_CGColor(v1, v2, v3);
}

id sub_239893CDC(void *a1, const char *a2, double a3)
{
  if (qword_268A059D0 != -1) {
    dispatch_once(&qword_268A059D0, &unk_26ECEE688);
  }
  uint64_t v4 = objc_msgSend_objectForKey_((void *)qword_268A059C8, a2, a3, a1);
  if (!v4)
  {
    v14.width = 1.0;
    v14.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v14, 1, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    id v6 = a1;
    uint64_t v9 = (CGColor *)objc_msgSend_CGColor(v6, v7, v8);
    CGContextSetFillColorWithColor(CurrentContext, v9);
    v15.origin.double x = 0.0;
    v15.origin.double y = 0.0;
    v15.size.width = 1.0;
    v15.size.height = 1.0;
    CGContextFillRect(CurrentContext, v15);
    uint64_t v4 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    objc_msgSend_setObject_forKey_((void *)qword_268A059C8, v10, v11, v4, v6);
  }
  return v4;
}

uint64_t sub_239893DCC(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x263F08968], a3, a1);
  uint64_t v4 = qword_268A059C8;
  qword_268A059C8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

id sub_239893E0C()
{
  if (qword_268A059E0 != -1) {
    dispatch_once(&qword_268A059E0, &unk_26ECEE6A8);
  }
  id v0 = (void *)qword_268A059D8;
  return v0;
}

void sub_239893E60(double a1, uint64_t a2, const char *a3)
{
  v434[156] = *MEMORY[0x263EF8340];
  v426 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a3, a1);
  v433[0] = @"aliceblue";
  v400 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v3, 0.941176474, 0.972549021, 1.0, 1.0);
  v434[0] = v400;
  v433[1] = @"antiquewhite";
  v398 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v4, 0.980392158, 0.921568632);
  v434[1] = v398;
  v433[2] = @"aqua";
  v396 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v5, 0.0, 1.0, 1.0, 1.0);
  v434[2] = v396;
  v433[3] = @"aquamarine";
  v395 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v6, 0.498039216, 1.0, 0.831372559, 1.0);
  v434[3] = v395;
  v433[4] = @"azure";
  v394 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v7, 0.941176474, 1.0, 1.0, 1.0);
  v434[4] = v394;
  v433[5] = @"beige";
  v393 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v8, 0.960784316, 0.960784316, 0.862745106, 1.0);
  v434[5] = v393;
  v433[6] = @"bisque";
  v392 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v9, 1.0);
  v434[6] = v392;
  v433[7] = @"blanchedalmond";
  v391 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v10, 1.0, 0.921568632);
  v434[7] = v391;
  v433[8] = @"blueviolet";
  v390 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v11, 0.541176498, 0.168627456, 0.886274517, 1.0);
  v434[8] = v390;
  v433[9] = @"burlywood";
  v389 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v12, 0.870588243, 0.721568644);
  v434[9] = v389;
  v433[10] = @"cadetblue";
  v388 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v13, 0.372549027, 0.619607866);
  v434[10] = v388;
  v433[11] = @"chartreuse";
  v387 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v14, 0.498039216, 1.0, 0.0, 1.0);
  v434[11] = v387;
  v433[12] = @"chocolate";
  v386 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v15, 0.823529422, 0.411764711);
  v434[12] = v386;
  v433[13] = @"coral";
  v385 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v16, 1.0, 0.498039216, 0.313725501, 1.0);
  v434[13] = v385;
  v433[14] = @"cornflowerblue";
  v384 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v17, 0.392156869, 0.58431375, 0.929411769, 1.0);
  v434[14] = v384;
  v433[15] = @"cornsilk";
  v383 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v18, 1.0, 0.972549021, 0.862745106, 1.0);
  v434[15] = v383;
  v433[16] = @"crimson";
  v382 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v19, 0.862745106, 0.0784313753);
  v434[16] = v382;
  v433[17] = @"darkblue";
  v381 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v20, 0.0, 0.0, 0.545098066, 1.0);
  v434[17] = v381;
  v433[18] = @"darkcyan";
  v380 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v21, 0.0, 0.545098066, 0.545098066, 1.0);
  v434[18] = v380;
  v433[19] = @"darkgoldenrod";
  v379 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v22, 0.721568644, 0.525490224, 0.0431372561, 1.0);
  v434[19] = v379;
  v433[20] = @"darkgreen";
  v378 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v23, 0.0, 0.392156869, 0.0, 1.0);
  v434[20] = v378;
  v433[21] = @"darkgrey";
  v377 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v24, 0.662745118, 0.662745118, 0.662745118, 1.0);
  v434[21] = v377;
  v433[22] = @"darkkhaki";
  v376 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v25, 0.741176486, 0.717647076, 0.419607848, 1.0);
  v434[22] = v376;
  v433[23] = @"darkmagenta";
  v375 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v26, 0.545098066, 0.0, 0.545098066, 1.0);
  v434[23] = v375;
  v433[24] = @"darkolivegreen";
  v374 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v27, 0.333333343, 0.419607848, 0.184313729, 1.0);
  v434[24] = v374;
  v433[25] = @"darkorange";
  v373 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v28, 1.0);
  v434[25] = v373;
  v433[26] = @"darkorchid";
  v372 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v29, 0.600000024);
  v434[26] = v372;
  v433[27] = @"darkred";
  v371 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v30, 0.545098066, 0.0, 0.0, 1.0);
  v434[27] = v371;
  v433[28] = @"darksalmon";
  v370 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v31, 0.913725495, 0.588235319);
  v434[28] = v370;
  v433[29] = @"darkseagreen";
  v369 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v32, 0.56078434);
  v434[29] = v369;
  v433[30] = @"darkslateblue";
  v368 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v33, 0.282352954, 0.239215687, 0.545098066, 1.0);
  v434[30] = v368;
  v433[31] = @"darkslategray";
  v367 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v34, 0.184313729, 0.309803933, 0.309803933, 1.0);
  v434[31] = v367;
  v433[32] = @"darkslategrey";
  v366 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v35, 0.184313729, 0.309803933, 0.309803933, 1.0);
  v434[32] = v366;
  v433[33] = @"darkturquoise";
  v365 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v36, 0.0);
  v434[33] = v365;
  v433[34] = @"darkviolet";
  v364 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v37, 0.580392182, 0.0);
  v434[34] = v364;
  v433[35] = @"deeppink";
  v363 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v38, 1.0, 0.0784313753);
  v434[35] = v363;
  v433[36] = @"deepskyblue";
  v362 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v39, 0.0);
  v434[36] = v362;
  v433[37] = @"dimgray";
  v361 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v40, 0.411764711, 0.411764711, 0.411764711, 1.0);
  v434[37] = v361;
  v433[38] = @"dimgrey";
  v360 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v41, 0.411764711, 0.411764711, 0.411764711, 1.0);
  v434[38] = v360;
  v433[39] = @"dodgerblue";
  v359 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v42, 0.117647059);
  v434[39] = v359;
  v433[40] = @"firebrick";
  v358 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v43, 0.698039234, 0.13333334, 0.13333334, 1.0);
  v434[40] = v358;
  v433[41] = @"floralwhite";
  v357 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v44, 1.0, 0.980392158, 0.941176474, 1.0);
  v434[41] = v357;
  v433[42] = @"forestgreen";
  v356 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v45, 0.13333334, 0.545098066, 0.13333334, 1.0);
  v434[42] = v356;
  v433[43] = @"fuchsia";
  v355 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v46, 1.0, 0.0, 1.0, 1.0);
  v434[43] = v355;
  v433[44] = @"gainsboro";
  v354 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v47, 0.862745106, 0.862745106, 0.862745106, 1.0);
  v434[44] = v354;
  v433[45] = @"ghostwhite";
  v353 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v48, 0.972549021, 0.972549021, 1.0, 1.0);
  v434[45] = v353;
  v433[46] = @"gold";
  v352 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v49, 1.0, 0.843137264, 0.0, 1.0);
  v434[46] = v352;
  v433[47] = @"goldenrod";
  v351 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v50, 0.854901969, 0.647058845);
  v434[47] = v351;
  v433[48] = @"greenyellow";
  v350 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v51, 0.678431392, 1.0, 0.184313729, 1.0);
  v434[48] = v350;
  v433[49] = @"grey";
  v349 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v52, 0.501960814, 0.501960814, 0.501960814, 1.0);
  v434[49] = v349;
  v433[50] = @"honeydew";
  v348 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v53, 0.941176474, 1.0, 0.941176474, 1.0);
  v434[50] = v348;
  v433[51] = @"hotpink";
  v347 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v54, 1.0, 0.411764711);
  v434[51] = v347;
  v433[52] = @"indianred";
  v346 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v55, 0.80392158, 0.360784322, 0.360784322, 1.0);
  v434[52] = v346;
  v433[53] = @"indigo";
  v345 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v56, 0.294117659, 0.0);
  v434[53] = v345;
  v433[54] = @"ivory";
  v344 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v57, 1.0, 1.0, 0.941176474, 1.0);
  v434[54] = v344;
  v433[55] = @"khaki";
  v343 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v58, 0.941176474, 0.90196079, 0.549019635, 1.0);
  v434[55] = v343;
  v433[56] = @"lavender";
  v342 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v59, 0.90196079, 0.90196079, 0.980392158, 1.0);
  v434[56] = v342;
  v433[57] = @"lavenderblush";
  v341 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v60, 1.0, 0.941176474, 0.960784316, 1.0);
  v434[57] = v341;
  v433[58] = @"lawngreen";
  v340 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v61, 0.486274511, 0.988235295, 0.0, 1.0);
  v434[58] = v340;
  v433[59] = @"lemonchiffon";
  v339 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v62, 1.0, 0.980392158, 0.80392158, 1.0);
  v434[59] = v339;
  v433[60] = @"lightblue";
  v338 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v63, 0.678431392);
  v434[60] = v338;
  v433[61] = @"lightcoral";
  v336 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v64, 0.941176474, 0.501960814, 0.501960814, 1.0);
  v434[61] = v336;
  v433[62] = @"lightcyan";
  v335 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v65, 0.87843138, 1.0, 1.0, 1.0);
  v434[62] = v335;
  v433[63] = @"lightgoldenrodyellow";
  v333 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v66, 0.980392158, 0.980392158, 0.823529422, 1.0);
  v434[63] = v333;
  v433[64] = @"lightgreen";
  v332 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v67, 0.564705908);
  v434[64] = v332;
  v433[65] = @"lightgrey";
  v331 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v68, 0.827450991, 0.827450991, 0.827450991, 1.0);
  v434[65] = v331;
  v433[66] = @"lightpink";
  v330 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v69, 1.0, 0.713725507, 0.75686276, 1.0);
  v434[66] = v330;
  v433[67] = @"lightsalmon";
  v329 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v70, 1.0, 0.627451003, 0.478431374, 1.0);
  v434[67] = v329;
  v433[68] = @"lightseagreen";
  v328 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v71, 0.125490203, 0.698039234, 0.666666687, 1.0);
  v434[68] = v328;
  v433[69] = @"lightskyblue";
  v327 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v72, 0.529411793, 0.807843149, 0.980392158, 1.0);
  v434[69] = v327;
  v433[70] = @"lightslategray";
  v326 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v73, 0.466666669, 0.533333361, 0.600000024, 1.0);
  v434[70] = v326;
  v433[71] = @"lightslategrey";
  v325 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v74, 0.466666669, 0.533333361, 0.600000024, 1.0);
  v434[71] = v325;
  v433[72] = @"lightsteelblue";
  v324 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v75, 0.690196097, 0.768627465, 0.870588243, 1.0);
  v434[72] = v324;
  v433[73] = @"lightyellow";
  v323 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v76, 1.0, 1.0, 0.87843138, 1.0);
  v434[73] = v323;
  v433[74] = @"lime";
  v322 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v77, 0.0, 1.0, 0.0, 1.0);
  v434[74] = v322;
  v433[75] = @"limegreen";
  v321 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v78, 0.196078435, 0.80392158, 0.196078435, 1.0);
  v434[75] = v321;
  v433[76] = @"linen";
  v320 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v79, 0.980392158, 0.941176474, 0.90196079, 1.0);
  v434[76] = v320;
  v433[77] = @"maroon";
  v319 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v80, 0.501960814, 0.0, 0.0, 1.0);
  v434[77] = v319;
  v433[78] = @"mediumaquamarine";
  v318 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v81, 0.400000006, 0.80392158, 0.666666687, 1.0);
  v434[78] = v318;
  v433[79] = @"mediumblue";
  v317 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v82, 0.0, 0.0, 0.80392158, 1.0);
  v434[79] = v317;
  v433[80] = @"mediumorchid";
  v402 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v83, 0.729411781, 0.333333343, 0.827450991, 1.0);
  v434[80] = v402;
  v433[81] = @"mediumpurple";
  v315 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v84, 0.576470613, 0.43921569);
  v434[81] = v315;
  v433[82] = @"mediumseagreen";
  v314 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v85, 0.235294119);
  v434[82] = v314;
  v433[83] = @"mediumslateblue";
  v312 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v86, 0.482352942, 0.407843143, 0.933333337, 1.0);
  v434[83] = v312;
  v433[84] = @"mediumspringgreen";
  v311 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v87, 0.0, 0.980392158);
  v434[84] = v311;
  v433[85] = @"mediumturquoise";
  v310 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v88, 0.282352954, 0.819607854, 0.800000012, 1.0);
  v434[85] = v310;
  v433[86] = @"mediumvioletred";
  v309 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v89, 0.78039217, 0.0823529437);
  v434[86] = v309;
  v433[87] = @"midnightblue";
  v308 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v90, 0.0980392173, 0.0980392173, 0.43921569, 1.0);
  v434[87] = v308;
  v433[88] = @"mintcream";
  v305 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v91, 0.960784316, 1.0, 0.980392158, 1.0);
  v434[88] = v305;
  v433[89] = @"mistyrose";
  v304 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v92, 1.0, 0.894117653);
  v434[89] = v304;
  v433[90] = @"moccasin";
  v313 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v93, 1.0, 0.894117653, 0.709803939, 1.0);
  v434[90] = v313;
  v433[91] = @"navajowhite";
  v303 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v94, 1.0, 0.870588243, 0.678431392, 1.0);
  v434[91] = v303;
  v433[92] = @"navy";
  v302 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v95, 0.0, 0.0, 0.501960814, 1.0);
  v434[92] = v302;
  v433[93] = @"oldlace";
  v300 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v96, 0.992156863, 0.960784316, 0.90196079, 1.0);
  v434[93] = v300;
  v433[94] = @"olive";
  v298 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v97, 0.501960814, 0.501960814, 0.0, 1.0);
  v434[94] = v298;
  v433[95] = @"olivedrab";
  v299 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v98, 0.419607848, 0.556862772, 0.137254909, 1.0);
  v434[95] = v299;
  v433[96] = @"orangered";
  v296 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v99, 1.0, 0.270588249, 0.0, 1.0);
  v434[96] = v296;
  v433[97] = @"orchid";
  v294 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v100, 0.854901969, 0.43921569, 0.839215696, 1.0);
  v434[97] = v294;
  v433[98] = @"palegoldenrod";
  v292 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v101, 0.933333337, 0.909803927, 0.666666687, 1.0);
  v434[98] = v292;
  v433[99] = @"palegreen";
  v291 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v102, 0.596078455, 0.984313726, 0.596078455, 1.0);
  v434[99] = v291;
  v433[100] = @"paleturquoise";
  v290 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v103, 0.686274529, 0.933333337, 0.933333337, 1.0);
  v434[100] = v290;
  v433[101] = @"palevioletred";
  v414 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v104, 0.858823538, 0.43921569, 0.576470613, 1.0);
  v434[101] = v414;
  v433[102] = @"papayawhip";
  v289 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v105, 1.0, 0.937254906, 0.835294127, 1.0);
  v434[102] = v289;
  v433[103] = @"peachpuff";
  v288 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v106, 1.0, 0.854901969, 0.725490212, 1.0);
  v434[103] = v288;
  v433[104] = @"peru";
  v286 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v107, 0.80392158, 0.521568656, 0.247058824, 1.0);
  v434[104] = v286;
  v433[105] = @"pink";
  v285 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v108, 1.0, 0.752941191, 0.796078444, 1.0);
  v434[105] = v285;
  v433[106] = @"plum";
  v284 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v109, 0.866666675, 0.627451003, 0.866666675, 1.0);
  v434[106] = v284;
  v433[107] = @"powderblue";
  v283 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v110, 0.690196097, 0.87843138, 0.90196079, 1.0);
  v434[107] = v283;
  v433[108] = @"rosybrown";
  v307 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v111, 0.737254918, 0.56078434, 0.56078434, 1.0);
  v434[108] = v307;
  v433[109] = @"royalblue";
  v306 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v112, 0.254901975, 0.411764711, 0.882352948, 1.0);
  v434[109] = v306;
  v433[110] = @"saddlebrown";
  v287 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v113, 0.545098066, 0.270588249, 0.0745098069, 1.0);
  v434[110] = v287;
  v433[111] = @"salmon";
  v282 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v114, 0.980392158, 0.501960814, 0.447058827, 1.0);
  v434[111] = v282;
  v433[112] = @"sandybrown";
  v279 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v115, 0.956862748, 0.643137276, 0.376470596, 1.0);
  v434[112] = v279;
  v433[113] = @"seagreen";
  v295 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v116, 0.180392161, 0.545098066, 0.34117648, 1.0);
  v434[113] = v295;
  v433[114] = @"seashell";
  v278 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v117, 1.0, 0.960784316, 0.933333337, 1.0);
  v434[114] = v278;
  v433[115] = @"sienna";
  v418 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v118, 0.627451003, 0.321568638, 0.176470593, 1.0);
  v434[115] = v418;
  v433[116] = @"silver";
  v277 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v119, 0.752941191, 0.752941191, 0.752941191, 1.0);
  v434[116] = v277;
  v433[117] = @"skyblue";
  v422 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v120, 0.529411793, 0.807843149, 0.921568632, 1.0);
  v434[117] = v422;
  v433[118] = @"slateblue";
  v416 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v121, 0.41568628, 0.352941185, 0.80392158, 1.0);
  v434[118] = v416;
  v433[119] = @"slategray";
  v337 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v122, 0.43921569, 0.501960814, 0.564705908, 1.0);
  v434[119] = v337;
  v433[120] = @"slategrey";
  v408 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v123, 0.43921569, 0.501960814, 0.564705908, 1.0);
  v434[120] = v408;
  v433[121] = @"snow";
  v404 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v124, 1.0, 0.980392158, 0.980392158, 1.0);
  v434[121] = v404;
  v433[122] = @"springgreen";
  v334 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v125, 0.0, 1.0, 0.498039216, 1.0);
  v434[122] = v334;
  v433[123] = @"steelblue";
  v276 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v126, 0.274509817, 0.509803951, 0.70588237, 1.0);
  v434[123] = v276;
  v433[124] = @"tan";
  v424 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v127, 0.823529422, 0.70588237, 0.549019635, 1.0);
  v434[124] = v424;
  v433[125] = @"teal";
  v420 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v128, 0.0, 0.501960814, 0.501960814, 1.0);
  v434[125] = v420;
  v433[126] = @"thistle";
  v316 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v129, 0.847058833, 0.749019623, 0.847058833, 1.0);
  v434[126] = v316;
  v433[127] = @"tomato";
  v301 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v130, 1.0, 0.388235301, 0.278431386, 1.0);
  v434[127] = v301;
  v433[128] = @"turquoise";
  v406 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v131, 0.250980407, 0.87843138, 0.815686285, 1.0);
  v434[128] = v406;
  v433[129] = @"violet";
  v297 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v132, 0.933333337, 0.509803951, 0.933333337, 1.0);
  v434[129] = v297;
  v433[130] = @"wheat";
  v412 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v133, 0.960784316, 0.870588243, 0.701960802, 1.0);
  v434[130] = v412;
  v433[131] = @"whitesmoke";
  v429 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v134, 0.960784316, 0.960784316, 0.960784316, 1.0);
  v434[131] = v429;
  v433[132] = @"yellowgreen";
  v427 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v135, 0.603921592, 0.80392158, 0.196078435, 1.0);
  v434[132] = v427;
  v433[133] = @"transparent";
  v410 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v136, v137);
  v434[133] = v410;
  v433[134] = @"black";
  v293 = objc_msgSend_blackColor(MEMORY[0x263F1C550], v138, v139);
  v434[134] = v293;
  v433[135] = @"darkGray";
  v281 = objc_msgSend_darkGrayColor(MEMORY[0x263F1C550], v140, v141);
  v434[135] = v281;
  v433[136] = @"lightGray";
  v280 = objc_msgSend_lightGrayColor(MEMORY[0x263F1C550], v142, v143);
  v434[136] = v280;
  v433[137] = @"white";
  v275 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v144, v145);
  v434[137] = v275;
  v433[138] = @"gray";
  v274 = objc_msgSend_grayColor(MEMORY[0x263F1C550], v146, v147);
  v434[138] = v274;
  v433[139] = @"red";
  v273 = objc_msgSend_redColor(MEMORY[0x263F1C550], v148, v149);
  v434[139] = v273;
  v433[140] = @"green";
  v272 = objc_msgSend_greenColor(MEMORY[0x263F1C550], v150, v151);
  v434[140] = v272;
  v433[141] = @"blue";
  v271 = objc_msgSend_blueColor(MEMORY[0x263F1C550], v152, v153);
  v434[141] = v271;
  v433[142] = @"cyan";
  v270 = objc_msgSend_cyanColor(MEMORY[0x263F1C550], v154, v155);
  v434[142] = v270;
  v433[143] = @"yellow";
  v269 = objc_msgSend_yellowColor(MEMORY[0x263F1C550], v156, v157);
  v434[143] = v269;
  v433[144] = @"magenta";
  v268 = objc_msgSend_magentaColor(MEMORY[0x263F1C550], v158, v159);
  v434[144] = v268;
  v433[145] = @"orange";
  v267 = objc_msgSend_orangeColor(MEMORY[0x263F1C550], v160, v161);
  v434[145] = v267;
  v433[146] = @"purple";
  v266 = objc_msgSend_purpleColor(MEMORY[0x263F1C550], v162, v163);
  v434[146] = v266;
  v433[147] = @"brown";
  v265 = objc_msgSend_brownColor(MEMORY[0x263F1C550], v164, v165);
  v434[147] = v265;
  v433[148] = @"clear";
  v168 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v166, v167);
  v434[148] = v168;
  v433[149] = @"systemBlue";
  uint64_t v171 = objc_msgSend_systemBlueColor(MEMORY[0x263F1C550], v169, v170);
  v434[149] = v171;
  v433[150] = @"systemIndigo";
  int v174 = objc_msgSend_systemIndigoColor(MEMORY[0x263F1C550], v172, v173);
  v434[150] = v174;
  v433[151] = @"systemGreen";
  v177 = objc_msgSend_systemGreenColor(MEMORY[0x263F1C550], v175, v176);
  v434[151] = v177;
  v433[152] = @"systemOrange";
  v180 = objc_msgSend_systemOrangeColor(MEMORY[0x263F1C550], v178, v179);
  v434[152] = v180;
  v433[153] = @"systemRed";
  long long v183 = objc_msgSend_systemRedColor(MEMORY[0x263F1C550], v181, v182);
  v434[153] = v183;
  v433[154] = @"systemTeal";
  long long v186 = objc_msgSend_systemTealColor(MEMORY[0x263F1C550], v184, v185);
  v434[154] = v186;
  v433[155] = @"systemGray";
  long long v189 = objc_msgSend_systemGrayColor(MEMORY[0x263F1C550], v187, v188);
  v434[155] = v189;
  long long v192 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v190, v191, v434, v433, 156);
  objc_msgSend_addEntriesFromDictionary_(v426, v193, v194, v192);

  v431[0] = @"label";
  v430 = objc_msgSend_labelColor(MEMORY[0x263F1C550], v195, v196);
  v432[0] = v430;
  v431[1] = @"secondaryLabel";
  v428 = objc_msgSend_secondaryLabelColor(MEMORY[0x263F1C550], v197, v198);
  v432[1] = v428;
  v431[2] = @"tertiaryLabel";
  v425 = objc_msgSend_tertiaryLabelColor(MEMORY[0x263F1C550], v199, v200);
  v432[2] = v425;
  v431[3] = @"quaternaryLabel";
  v423 = objc_msgSend_quaternaryLabelColor(MEMORY[0x263F1C550], v201, v202);
  v432[3] = v423;
  v431[4] = @"link";
  v421 = objc_msgSend_linkColor(MEMORY[0x263F1C550], v203, v204);
  v432[4] = v421;
  v431[5] = @"placeholderText";
  v419 = objc_msgSend_placeholderTextColor(MEMORY[0x263F1C550], v205, v206);
  v432[5] = v419;
  v431[6] = @"separator";
  v417 = objc_msgSend_separatorColor(MEMORY[0x263F1C550], v207, v208);
  v432[6] = v417;
  v431[7] = @"opaqueSeparator";
  v415 = objc_msgSend_opaqueSeparatorColor(MEMORY[0x263F1C550], v209, v210);
  v432[7] = v415;
  v431[8] = @"systemBackground";
  v413 = objc_msgSend_systemBackgroundColor(MEMORY[0x263F1C550], v211, v212);
  v432[8] = v413;
  v431[9] = @"secondarySystemBackground";
  v411 = objc_msgSend_secondarySystemBackgroundColor(MEMORY[0x263F1C550], v213, v214);
  v432[9] = v411;
  v431[10] = @"tertiarySystemBackground";
  v409 = objc_msgSend_tertiarySystemBackgroundColor(MEMORY[0x263F1C550], v215, v216);
  v432[10] = v409;
  v431[11] = @"systemGroupedBackground";
  v407 = objc_msgSend_systemGroupedBackgroundColor(MEMORY[0x263F1C550], v217, v218);
  v432[11] = v407;
  v431[12] = @"secondarySystemGroupedBackground";
  v405 = objc_msgSend_secondarySystemGroupedBackgroundColor(MEMORY[0x263F1C550], v219, v220);
  v432[12] = v405;
  v431[13] = @"tertiarySystemGroupedBackground";
  v403 = objc_msgSend_tertiarySystemGroupedBackgroundColor(MEMORY[0x263F1C550], v221, v222);
  v432[13] = v403;
  v431[14] = @"lightText";
  v401 = objc_msgSend_lightTextColor(MEMORY[0x263F1C550], v223, v224);
  v432[14] = v401;
  v431[15] = @"darkText";
  v399 = objc_msgSend_darkTextColor(MEMORY[0x263F1C550], v225, v226);
  v432[15] = v399;
  v431[16] = @"groupTableViewBackground";
  v397 = objc_msgSend_groupTableViewBackgroundColor(MEMORY[0x263F1C550], v227, v228);
  v432[16] = v397;
  v431[17] = @"systemFill";
  v231 = objc_msgSend_systemFillColor(MEMORY[0x263F1C550], v229, v230);
  v432[17] = v231;
  v431[18] = @"secondarySystemFill";
  v234 = objc_msgSend_secondarySystemFillColor(MEMORY[0x263F1C550], v232, v233);
  v432[18] = v234;
  v431[19] = @"tertiarySystemFill";
  v237 = objc_msgSend_tertiarySystemFillColor(MEMORY[0x263F1C550], v235, v236);
  v432[19] = v237;
  v431[20] = @"quaternarySystemFill";
  v240 = objc_msgSend_quaternarySystemFillColor(MEMORY[0x263F1C550], v238, v239);
  v432[20] = v240;
  v431[21] = @"systemGray2";
  v243 = objc_msgSend_systemGray2Color(MEMORY[0x263F1C550], v241, v242);
  v432[21] = v243;
  v431[22] = @"systemGray3";
  v246 = objc_msgSend_systemGray3Color(MEMORY[0x263F1C550], v244, v245);
  v432[22] = v246;
  v431[23] = @"systemGray4";
  v249 = objc_msgSend_systemGray4Color(MEMORY[0x263F1C550], v247, v248);
  v432[23] = v249;
  v431[24] = @"systemGray5";
  v252 = objc_msgSend_systemGray5Color(MEMORY[0x263F1C550], v250, v251);
  v432[24] = v252;
  v431[25] = @"systemGray6";
  v255 = objc_msgSend_systemGray6Color(MEMORY[0x263F1C550], v253, v254);
  v432[25] = v255;
  v258 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v256, v257, v432, v431, 26);

  objc_msgSend_addEntriesFromDictionary_(v426, v259, v260, v258);
  uint64_t v263 = objc_msgSend_copy(v426, v261, v262);
  v264 = (void *)qword_268A059D8;
  qword_268A059D8 = v263;
}

void sub_239896AD0(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  double v7 = NSStringFromSelector(a2);
  double v8 = NSString;
  double v11 = objc_msgSend_substringWithRange_(v7, v9, v10, 3, 1);
  CGSize v14 = objc_msgSend_lowercaseString(v11, v12, v13);
  uint64_t v17 = objc_msgSend_length(v7, v15, v16);
  double v20 = objc_msgSend_substringWithRange_(v7, v18, v19, 4, v17 - 5);
  objc_msgSend_stringWithFormat_(v8, v21, v22, @"%@%@", v14, v20);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  id v23 = (void *)v6[1];
  objc_msgSend_setObject_forKey_(v23, v24, v25, v5, v26);
}

id sub_239896BD8(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  id v5 = (void *)v3[1];

  double v8 = objc_msgSend_objectForKey_(v5, v6, v7, v4);

  return v8;
}

void sub_239896C4C(void *a1, const char *a2, double a3, double a4)
{
  double v7 = a1;
  double v8 = NSStringFromSelector(a2);
  uint64_t v9 = NSString;
  double v12 = objc_msgSend_substringWithRange_(v8, v10, v11, 3, 1);
  CGRect v15 = objc_msgSend_lowercaseString(v12, v13, v14);
  uint64_t v18 = objc_msgSend_length(v8, v16, v17);
  id v21 = objc_msgSend_substringWithRange_(v8, v19, v20, 4, v18 - 5);
  objc_msgSend_stringWithFormat_(v9, v22, v23, @"%@%@", v15, v21);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  double v24 = (void *)v7[1];
  id v26 = objc_msgSend_valueWithCGPoint_(MEMORY[0x263F08D40], v25, a3, a4);
  objc_msgSend_setObject_forKey_(v24, v27, v28, v26, v29);
}

double sub_239896D6C(uint64_t a1, SEL aSelector)
{
  id v2 = *(void **)(a1 + 8);
  uint64_t v3 = NSStringFromSelector(aSelector);
  id v6 = objc_msgSend_objectForKey_(v2, v4, v5, v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_CGPointValue(v6, v7, v8);
    double v10 = v9;
  }
  else
  {
    double v10 = *MEMORY[0x263F00148];
  }

  return v10;
}

void sub_239896E04(void *a1, const char *a2, double a3, double a4)
{
  double v7 = a1;
  double v8 = NSStringFromSelector(a2);
  double v9 = NSString;
  double v12 = objc_msgSend_substringWithRange_(v8, v10, v11, 3, 1);
  CGRect v15 = objc_msgSend_lowercaseString(v12, v13, v14);
  uint64_t v18 = objc_msgSend_length(v8, v16, v17);
  id v21 = objc_msgSend_substringWithRange_(v8, v19, v20, 4, v18 - 5);
  objc_msgSend_stringWithFormat_(v9, v22, v23, @"%@%@", v15, v21);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  double v24 = (void *)v7[1];
  id v26 = objc_msgSend_valueWithCGSize_(MEMORY[0x263F08D40], v25, a3, a4);
  objc_msgSend_setObject_forKey_(v24, v27, v28, v26, v29);
}

double sub_239896F24(uint64_t a1, SEL aSelector)
{
  id v2 = *(void **)(a1 + 8);
  uint64_t v3 = NSStringFromSelector(aSelector);
  id v6 = objc_msgSend_objectForKey_(v2, v4, v5, v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_CGSizeValue(v6, v7, v8);
    double v10 = v9;
  }
  else
  {
    double v10 = *MEMORY[0x263F001B0];
  }

  return v10;
}

void sub_239896FBC(void *a1, const char *a2, double a3, double a4, double a5, double a6)
{
  double v11 = a1;
  double v12 = NSStringFromSelector(a2);
  double v13 = NSString;
  double v16 = objc_msgSend_substringWithRange_(v12, v14, v15, 3, 1);
  double v19 = objc_msgSend_lowercaseString(v16, v17, v18);
  uint64_t v22 = objc_msgSend_length(v12, v20, v21);
  double v25 = objc_msgSend_substringWithRange_(v12, v23, v24, 4, v22 - 5);
  objc_msgSend_stringWithFormat_(v13, v26, v27, @"%@%@", v19, v25);
  id v33 = (id)objc_claimAutoreleasedReturnValue();

  double v28 = (void *)v11[1];
  double v30 = objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v29, a3, a4, a5, a6);
  objc_msgSend_setObject_forKey_(v28, v31, v32, v30, v33);
}

double sub_2398970F4(uint64_t a1, SEL aSelector)
{
  id v2 = *(void **)(a1 + 8);
  uint64_t v3 = NSStringFromSelector(aSelector);
  id v6 = objc_msgSend_objectForKey_(v2, v4, v5, v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_CGRectValue(v6, v7, v8);
    double v10 = v9;
  }
  else
  {
    double v10 = *MEMORY[0x263F001A8];
  }

  return v10;
}

void sub_2398971A8(void *a1, const char *a2, double a3)
{
  double v5 = a1;
  id v6 = NSStringFromSelector(a2);
  double v7 = NSString;
  double v10 = objc_msgSend_substringWithRange_(v6, v8, v9, 3, 1);
  double v13 = objc_msgSend_lowercaseString(v10, v11, v12);
  uint64_t v16 = objc_msgSend_length(v6, v14, v15);
  double v19 = objc_msgSend_substringWithRange_(v6, v17, v18, 4, v16 - 5);
  objc_msgSend_stringWithFormat_(v7, v20, v21, @"%@%@", v13, v19);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v22 = (void *)v5[1];
  double v24 = objc_msgSend_numberWithDouble_(NSNumber, v23, a3);
  objc_msgSend_setObject_forKey_(v22, v25, v26, v24, v27);
}

double sub_2398972C0(uint64_t a1, SEL aSelector)
{
  id v2 = *(void **)(a1 + 8);
  uint64_t v3 = NSStringFromSelector(aSelector);
  id v6 = objc_msgSend_objectForKey_(v2, v4, v5, v3);

  objc_opt_class();
  double v9 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_doubleValue(v6, v7, v8);
    double v9 = v10;
  }

  return v9;
}

void sub_239897344(void *a1, const char *a2, uint64_t a3)
{
  double v5 = a1;
  id v6 = NSStringFromSelector(a2);
  double v7 = NSString;
  double v10 = objc_msgSend_substringWithRange_(v6, v8, v9, 3, 1);
  double v13 = objc_msgSend_lowercaseString(v10, v11, v12);
  uint64_t v16 = objc_msgSend_length(v6, v14, v15);
  double v19 = objc_msgSend_substringWithRange_(v6, v17, v18, 4, v16 - 5);
  objc_msgSend_stringWithFormat_(v7, v20, v21, @"%@%@", v13, v19);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v22 = (void *)v5[1];
  double v25 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v23, v24, a3);
  objc_msgSend_setObject_forKey_(v22, v26, v27, v25, v28);
}

uint64_t sub_23989745C(uint64_t a1, SEL aSelector)
{
  id v2 = *(void **)(a1 + 8);
  uint64_t v3 = NSStringFromSelector(aSelector);
  id v6 = objc_msgSend_objectForKey_(v2, v4, v5, v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = objc_msgSend_unsignedIntegerValue(v6, v7, v8);
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t sub_2398974F0(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 80))
  {
    *(_DWORD *)(a1 + 80) = 1;
    if (!*(_DWORD *)(a1 + 84)) {
      *(_DWORD *)(a1 + 84) = 1;
    }
    if (!*(void *)(a1 + 8)) {
      *(void *)(a1 + 8) = *MEMORY[0x263EF8350];
    }
    if (!*(void *)(a1 + 16)) {
      *(void *)(a1 + 16) = *MEMORY[0x263EF8358];
    }
    uint64_t v2 = *(void *)(a1 + 40);
    if (!v2 || (v3 = *(void *)(a1 + 24), (uint64_t v4 = *(void *)(v2 + 8 * v3)) == 0))
    {
      sub_23989837C((void *)a1);
      uint64_t v5 = sub_239898420(*(FILE **)(a1 + 8), 0x4000, a1);
      uint64_t v3 = *(void *)(a1 + 24);
      *(void *)(*(void *)(a1 + 40) + 8 * v3) = v5;
      uint64_t v2 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(v2 + 8 * v3);
    }
    *(void *)(a1 + 56) = *(void *)(v4 + 32);
    id v6 = *(unsigned char **)(v4 + 16);
    *(void *)(a1 + 72) = v6;
    *(void *)(a1 + 136) = v6;
    *(void *)(a1 + 8) = **(void **)(v2 + 8 * v3);
    *(unsigned char *)(a1 + 48) = *v6;
  }
  uint64_t v7 = *(void *)a1;
  uint64_t v88 = *(void *)a1;
LABEL_13:
  *(_DWORD *)(a1 + 148) = 0;
  double v8 = *(unsigned char **)(a1 + 72);
  if (*(_DWORD *)(a1 + 144))
  {
    int v9 = v8 - *(_DWORD *)(a1 + 136);
    *(_DWORD *)(a1 + 144) = 0;
    *(_DWORD *)(a1 + 148) = v9;
  }
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  *double v8 = v10;
  int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) + *(_DWORD *)(a1 + 84);
  double v12 = v8;
LABEL_16:
  int v13 = dword_23989F2C8[256 * (uint64_t)v11 + v10];
  if (v13 >= 1)
  {
    do
    {
      if (dword_2398BEEC8[v13])
      {
        *(_DWORD *)(a1 + 112) = v13;
        *(void *)(a1 + 120) = v8;
      }
      unsigned int v14 = *++v8;
      int v13 = dword_23989F2C8[256 * (unint64_t)v13 + v14];
    }
    while (v13 > 0);
  }
  int v15 = -v13;
LABEL_21:
  int v16 = dword_2398BEEC8[v15];
  double v17 = &v12[-*(int *)(a1 + 148)];
  *(void *)(a1 + 136) = v17;
  *(void *)(a1 + 64) = v8 - v17;
  *(unsigned char *)(a1 + 48) = *v8;
  *double v8 = 0;
  *(void *)(a1 + 72) = v8;
  if (v15 != 5 && ((0x29FEFFF5uLL >> v16) & 1) == 0)
  {
    unint64_t v18 = *(int *)(a1 + 148);
    unint64_t v19 = *(void *)(a1 + 64);
    BOOL v20 = v19 > v18;
    unint64_t v21 = v19 - v18;
    if (v20)
    {
      uint64_t v22 = (unsigned __int8 *)(*(void *)(a1 + 136) + v18);
      do
      {
        int v23 = *v22++;
        if (v23 == 10)
        {
          uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24));
          *(void *)(v24 + 52) = (*(_DWORD *)(v24 + 52) + 1);
        }
        --v21;
      }
      while (v21);
    }
  }
  while (1)
  {
    switch(v16)
    {
      case 0:
        *double v8 = *(unsigned char *)(a1 + 48);
        double v8 = (unsigned char *)(*(void *)(a1 + 120) + 1);
        int v15 = *(_DWORD *)(a1 + 112);
        goto LABEL_21;
      case 1:
        uint64_t v57 = *(void *)(a1 + 64);
        if (v57) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v57 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_13;
      case 2:
        uint64_t v58 = *(void *)(a1 + 64);
        if (v58) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v58 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 3:
        uint64_t v59 = *(void *)(a1 + 64);
        if (v59) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v59 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 4:
        uint64_t v60 = *(void *)(a1 + 64);
        if (v60) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v60 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 5:
        uint64_t v61 = *(void *)(a1 + 64);
        if (v61) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v61 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 6:
        uint64_t v62 = *(void *)(a1 + 64);
        if (v62) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v62 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 7:
        uint64_t v63 = *(void *)(a1 + 64);
        if (v63) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v63 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 8:
        uint64_t v64 = *(void *)(a1 + 64);
        if (v64) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v64 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 9:
        uint64_t v65 = *(void *)(a1 + 64);
        if (v65) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v65 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 10:
        uint64_t v66 = *(void *)(a1 + 64);
        if (v66) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v66 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 11:
        uint64_t v67 = *(void *)(a1 + 64);
        if (v67) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v67 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 12:
        uint64_t v68 = *(void *)(a1 + 64);
        if (v68) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v68 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 13:
        uint64_t v69 = *(void *)(a1 + 64);
        if (v69) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v69 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 14:
        uint64_t v70 = *(void *)(a1 + 64);
        if (v70) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v70 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 15:
        uint64_t v71 = *(void *)(a1 + 64);
        if (v71) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v71 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 16:
        uint64_t v72 = *(void *)(a1 + 64);
        if (v72) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v72 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 17:
        uint64_t v73 = *(void *)(a1 + 64);
        if (v73) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v73 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 18:
        uint64_t v74 = *(void *)(a1 + 64);
        if (v74) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v74 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 19:
        uint64_t v75 = *(void *)(a1 + 64);
        if (v75) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v75 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 20:
        uint64_t v76 = *(void *)(a1 + 64);
        if (v76) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v76 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 21:
        uint64_t v77 = *(void *)(a1 + 64);
        if (v77) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v77 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 22:
        uint64_t v78 = *(void *)(a1 + 64);
        if (v78) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v78 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 23:
        uint64_t v79 = *(void *)(a1 + 64);
        if (v79) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v79 + *(void *)(a1 + 136) - 1) == 10;
        }
        goto LABEL_138;
      case 24:
        uint64_t v80 = *(void *)(a1 + 64);
        if (v80) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v80 + *(void *)(a1 + 136) - 1) == 10;
        }
LABEL_138:
        if ((*(unsigned int (**)(uint64_t))(v7 + 16))(v7)) {
          return 0;
        }
        goto LABEL_13;
      case 25:
        uint64_t v81 = *(void *)(a1 + 64);
        if (v81) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v81 + *(void *)(a1 + 136) - 1) == 10;
        }
        *(_DWORD *)(a1 + 84) = 3;
        goto LABEL_134;
      case 26:
        uint64_t v82 = *(void *)(a1 + 64);
        if (v82) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v82 + *(void *)(a1 + 136) - 1) == 10;
        }
        if ((*(unsigned int (**)(uint64_t))(v7 + 16))(v7)) {
          return 0;
        }
        *(_DWORD *)(a1 + 84) = 1;
        goto LABEL_13;
      case 27:
        *double v8 = *(unsigned char *)(a1 + 48);
        uint64_t v83 = &v12[-*(int *)(a1 + 148)];
        *(void *)(a1 + 136) = v83;
        *(void *)(a1 + 64) = v8 - 1 - v83;
        *(void *)(a1 + 72) = v8 - 1;
        *(unsigned char *)(a1 + 48) = *(v8 - 1);
        *(v8 - 1) = 0;
        *(void *)(a1 + 72) = v8 - 1;
        goto LABEL_132;
      case 28:
LABEL_132:
        uint64_t v84 = *(void *)(a1 + 64);
        if (v84) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v84 + *(void *)(a1 + 136) - 1) == 10;
        }
LABEL_134:
        *(_DWORD *)(a1 + 144) = 1;
        goto LABEL_13;
      case 29:
        size_t v85 = *(void *)(a1 + 64);
        double v86 = *(char **)(a1 + 136);
        if (v85) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48) = v86[v85 - 1] == 10;
        }
        fwrite(v86, v85, 1uLL, *(FILE **)(a1 + 16));
        goto LABEL_13;
      case 30:
        uint64_t v25 = *(void *)(a1 + 136);
        *double v8 = *(unsigned char *)(a1 + 48);
        uint64_t v26 = *(void *)(a1 + 40);
        uint64_t v27 = *(void *)(a1 + 24);
        uint64_t v28 = *(void *)(v26 + 8 * v27);
        if (*(_DWORD *)(v28 + 64))
        {
          uint64_t v29 = *(void *)(a1 + 56);
        }
        else
        {
          uint64_t v29 = *(void *)(v28 + 32);
          *(void *)(a1 + 56) = v29;
          *(void *)uint64_t v28 = *(void *)(a1 + 8);
          uint64_t v28 = *(void *)(v26 + 8 * v27);
          *(_DWORD *)(v28 + 64) = 1;
        }
        unint64_t v30 = *(void *)(a1 + 72);
        id v31 = *(unsigned char **)(v28 + 8);
        if (v30 <= (unint64_t)&v31[v29])
        {
          *(void *)(a1 + 72) = *(void *)(a1 + 136) + ~v25 + (int)v8;
          int v15 = sub_2398984B0(a1);
          double v8 = *(unsigned char **)(a1 + 72);
          int v11 = dword_2398BF0C4[v15];
          if (!v11) {
            goto LABEL_72;
          }
          if (dword_2398BEEC8[v11])
          {
            *(_DWORD *)(a1 + 112) = v11;
            *(void *)(a1 + 120) = v8;
          }
          double v12 = (unsigned char *)(*(void *)(a1 + 136) + *(int *)(a1 + 148));
          *(void *)(a1 + 72) = ++v8;
LABEL_74:
          uint64_t v10 = *v8;
          goto LABEL_16;
        }
        if (v30 > (unint64_t)&v31[v29 + 1]) {
          sub_23989853C("fatal flex scanner internal error--end of buffer missed");
        }
        double v32 = *(char **)(a1 + 136);
        if (!*(_DWORD *)(v28 + 60))
        {
          uint64_t v36 = *(int *)(a1 + 148);
          if (v30 - (void)&v32[v36] != 1) {
            goto LABEL_69;
          }
          goto LABEL_64;
        }
        int v33 = ~v32 + v30;
        if (v33 >= 1)
        {
          int v34 = ~v32 + v30;
          do
          {
            char v35 = *v32++;
            *v31++ = v35;
            --v34;
          }
          while (v34);
          uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24));
        }
        int v89 = v25;
        if (*(_DWORD *)(v28 + 64) == 2)
        {
          *(void *)(a1 + 56) = 0;
          *(void *)(v28 + 32) = 0;
        }
        else
        {
          int v37 = ~v33;
          int v38 = *(_DWORD *)(v28 + 24);
          LODWORD(v39) = v38 + ~v33;
          if (!v39)
          {
            double v40 = *(char **)(a1 + 72);
            do
            {
              if (!*(_DWORD *)(v28 + 40))
              {
                *(void *)(v28 + 8) = 0;
LABEL_144:
                sub_23989853C("fatal error - scanner input buffer overflow");
              }
              size_t v39 = *(void *)(v28 + 8);
              int v41 = 2 * v38;
              *(_DWORD *)(v28 + 24) = v41;
              double v42 = (char *)malloc_type_realloc((void *)v39, v41 + 2, 0x7C354E6CuLL);
              *(void *)(v28 + 8) = v42;
              if (!v42) {
                goto LABEL_144;
              }
              double v40 = &v42[(int)v40 - (int)v39];
              *(void *)(a1 + 72) = v40;
              uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24));
              int v38 = *(_DWORD *)(v28 + 24);
              LODWORD(v39) = v38 + v37;
            }
            while (!(v38 + v37));
            uint64_t v7 = v88;
          }
          *__error() = 0;
          if (v39 >= 0x2000) {
            size_t v39 = 0x2000;
          }
          else {
            size_t v39 = v39;
          }
          int v43 = fileno(*(FILE **)(a1 + 8));
          ssize_t v44 = read(v43, (void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 8) + v33), v39);
          unint64_t v45 = (int)v44;
          *(void *)(a1 + 56) = (int)v44;
          uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24));
          *(void *)(v28 + 32) = (int)v44;
          if (v44 << 32)
          {
            int v46 = 0;
            goto LABEL_58;
          }
        }
        if (*(_DWORD *)(a1 + 148) == v33)
        {
          sub_239898574(*(FILE **)(a1 + 8), a1);
          unint64_t v45 = *(void *)(a1 + 56);
          uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24));
          int v46 = 1;
        }
        else
        {
          unint64_t v45 = 0;
          int v46 = 2;
          *(_DWORD *)(v28 + 64) = 2;
        }
LABEL_58:
        unint64_t v47 = v45 + v33;
        if (v47 <= *(int *)(v28 + 24))
        {
          uint64_t v53 = *(void *)(v28 + 8);
        }
        else
        {
          size_t v48 = v47 + (v45 >> 1);
          double v49 = malloc_type_realloc(*(void **)(v28 + 8), v48, 0x7C354E6CuLL);
          uint64_t v50 = *(void *)(a1 + 40);
          uint64_t v51 = *(void *)(a1 + 24);
          *(void *)(*(void *)(v50 + 8 * v51) + 8) = v49;
          uint64_t v52 = *(void *)(v50 + 8 * v51);
          uint64_t v53 = *(void *)(v52 + 8);
          if (!v53) {
            sub_23989853C("out of dynamic memory in yy_get_next_buffer()");
          }
          *(_DWORD *)(v52 + 24) = v48 - 2;
          unint64_t v47 = *(void *)(a1 + 56) + v33;
        }
        *(void *)(a1 + 56) = v47;
        *(unsigned char *)(v53 + v47) = 0;
        *(unsigned char *)(*(void *)(a1 + 56)
                 + *(void *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 8)
                 + 1) = 0;
        uint64_t v54 = *(void *)(a1 + 40);
        uint64_t v55 = *(void *)(a1 + 24);
        double v32 = *(char **)(*(void *)(v54 + 8 * v55) + 8);
        *(void *)(a1 + 136) = v32;
        if (v46 != 1)
        {
          if (v46)
          {
            id v31 = *(unsigned char **)(*(void *)(v54 + 8 * v55) + 8);
            uint64_t v29 = *(void *)(a1 + 56);
LABEL_69:
            *(void *)(a1 + 72) = &v31[v29];
            int v15 = sub_2398984B0(a1);
            double v8 = *(unsigned char **)(a1 + 72);
LABEL_72:
            double v12 = (unsigned char *)(*(void *)(a1 + 136) + *(int *)(a1 + 148));
            goto LABEL_21;
          }
          *(void *)(a1 + 72) = &v32[~v89 + (int)v8];
          int v11 = sub_2398984B0(a1);
          double v8 = *(unsigned char **)(a1 + 72);
          double v12 = (unsigned char *)(*(void *)(a1 + 136) + *(int *)(a1 + 148));
          goto LABEL_74;
        }
        uint64_t v36 = *(int *)(a1 + 148);
LABEL_64:
        *(_DWORD *)(a1 + 88) = 0;
        *(void *)(a1 + 72) = &v32[v36];
        int v56 = *(_DWORD *)(a1 + 84);
        if (v56 >= 1) {
          --v56;
        }
        int v16 = (v56 >> 1) + 31;
        break;
      case 31:
      case 32:
        return 0;
      default:
        sub_23989853C("fatal flex scanner internal error--no action found");
    }
  }
}

double sub_23989837C(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    uint64_t v3 = a1[4];
    if (a1[3] >= (unint64_t)(v3 - 1))
    {
      uint64_t v4 = v3 + 8;
      uint64_t v5 = (char *)malloc_type_realloc(v2, 8 * (v3 + 8), 0x7C354E6CuLL);
      a1[5] = v5;
      if (v5)
      {
        id v6 = &v5[8 * a1[4]];
        double result = 0.0;
        *((_OWORD *)v6 + 2) = 0u;
        *((_OWORD *)v6 + 3) = 0u;
        *(_OWORD *)id v6 = 0u;
        *((_OWORD *)v6 + 1) = 0u;
        a1[4] = v4;
        return result;
      }
LABEL_8:
      sub_23989853C("out of dynamic memory in yyensure_buffer_stack()");
    }
  }
  else
  {
    double v8 = malloc_type_malloc(8uLL, 0x28D39929uLL);
    a1[5] = v8;
    if (!v8) {
      goto LABEL_8;
    }
    *double v8 = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 3) = xmmword_23989F2B0;
  }
  return result;
}

uint64_t sub_239898420(FILE *a1, int a2, uint64_t a3)
{
  id v6 = malloc_type_malloc(0x48uLL, 0x28D39929uLL);
  if (!v6
    || (uint64_t v7 = (uint64_t)v6, v6[6] = a2, v8 = malloc_type_malloc(a2 + 2, 0x28D39929uLL), (*(void *)(v7 + 8) = v8) == 0))
  {
    sub_23989853C("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v7 + 40) = 1;
  sub_239898624(v7, a1, a3);
  return v7;
}

uint64_t sub_2398984B0(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) + 48)
                    + *(_DWORD *)(a1 + 84));
  uint64_t v2 = (unsigned char *)(*(void *)(a1 + 136) + *(int *)(a1 + 148));
  for (unint64_t i = *(void *)(a1 + 72); (unint64_t)v2 < i; ++v2)
  {
    uint64_t v4 = (char *)&unk_23989F2C8 + 1024 * (uint64_t)(int)v1 + 4 * *v2;
    uint64_t v5 = (int *)((char *)&unk_2398BF0C4 + 4 * (int)v1);
    if (*v2) {
      uint64_t v5 = (int *)v4;
    }
    uint64_t v1 = *v5;
    if (dword_2398BEEC8[v1])
    {
      *(_DWORD *)(a1 + 112) = v1;
      *(void *)(a1 + 120) = v2;
    }
  }
  return v1;
}

void sub_23989853C(const char *a1)
{
}

int *sub_239898574(FILE *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 40);
  if (v4 && (uint64_t v5 = *(void *)(a2 + 24), *(void *)(v4 + 8 * v5))
    || (sub_23989837C((void *)a2),
        uint64_t v6 = sub_239898420(*(FILE **)(a2 + 8), 0x4000, a2),
        uint64_t v5 = *(void *)(a2 + 24),
        *(void *)(*(void *)(a2 + 40) + 8 * v5) = v6,
        (uint64_t v4 = *(void *)(a2 + 40)) != 0))
  {
    uint64_t v7 = *(void *)(v4 + 8 * v5);
  }
  else
  {
    uint64_t v7 = 0;
  }
  double result = sub_239898624(v7, a1, a2);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(v9 + 8 * v10);
  *(void *)(a2 + 56) = *(void *)(v11 + 32);
  double v12 = *(unsigned char **)(v11 + 16);
  *(void *)(a2 + 72) = v12;
  *(void *)(a2 + 136) = v12;
  *(void *)(a2 + 8) = **(void **)(v9 + 8 * v10);
  *(unsigned char *)(a2 + 48) = *v12;
  return result;
}

int *sub_239898624(uint64_t a1, FILE *a2, uint64_t a3)
{
  int v6 = *__error();
  sub_2398987F8(a1, a3);
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 60) = 1;
  uint64_t v7 = *(void *)(a3 + 40);
  if (v7) {
    uint64_t v7 = *(void *)(v7 + 8 * *(void *)(a3 + 24));
  }
  if (v7 != a1) {
    *(void *)(a1 + 52) = 1;
  }
  if (a2)
  {
    int v8 = fileno(a2);
    BOOL v9 = isatty(v8) > 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  *(_DWORD *)(a1 + 44) = v9;
  double result = __error();
  *double result = v6;
  return result;
}

void sub_2398986C4(uint64_t a1, uint64_t a2)
{
  sub_23989837C((void *)a2);
  uint64_t v4 = *(void *)(a2 + 40);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 24);
    uint64_t v6 = *(void *)(v4 + 8 * v5);
    if (v6 != a1)
    {
      if (v6)
      {
        **(unsigned char **)(a2 + 72) = *(unsigned char *)(a2 + 48);
        uint64_t v4 = *(void *)(a2 + 40);
        uint64_t v5 = *(void *)(a2 + 24);
        *(void *)(*(void *)(v4 + 8 * v5) + 16) = *(void *)(a2 + 72);
        *(void *)(*(void *)(v4 + 8 * v5) + 32) = *(void *)(a2 + 56);
      }
      *(void *)(v4 + 8 * v5) = a1;
      uint64_t v7 = *(void *)(a2 + 40);
      uint64_t v8 = *(void *)(v7 + 8 * v5);
      *(void *)(a2 + 56) = *(void *)(v8 + 32);
      BOOL v9 = *(unsigned char **)(v8 + 16);
      *(void *)(a2 + 72) = v9;
      *(void *)(a2 + 136) = v9;
      *(void *)(a2 + 8) = **(void **)(v7 + 8 * v5);
      *(unsigned char *)(a2 + 48) = *v9;
      *(_DWORD *)(a2 + 88) = 1;
    }
  }
}

void *sub_239898774(size_t a1)
{
  return malloc_type_malloc(a1, 0x28D39929uLL);
}

void sub_239898780(void **a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a2 + 40);
    if (v3) {
      uint64_t v4 = *(void ***)(v3 + 8 * *(void *)(a2 + 24));
    }
    else {
      uint64_t v4 = 0;
    }
    if (v4 == a1) {
      *(void *)(v3 + 8 * *(void *)(a2 + 24)) = 0;
    }
    if (*((_DWORD *)a1 + 10)) {
      free(a1[1]);
    }
    free(a1);
  }
}

uint64_t sub_2398987F8(uint64_t result, uint64_t a2)
{
  if (result)
  {
    *(void *)(result + 32) = 0;
    **(unsigned char **)(result + 8) = 0;
    *(unsigned char *)(*(void *)(result + 8) + 1) = 0;
    *(void *)(result + 16) = *(void *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    uint64_t v2 = *(void *)(a2 + 40);
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 8 * *(void *)(a2 + 24));
    }
    else {
      uint64_t v3 = 0;
    }
    if (v3 == result)
    {
      uint64_t v4 = *(void *)(a2 + 24);
      uint64_t v5 = *(void *)(v2 + 8 * v4);
      *(void *)(a2 + 56) = *(void *)(v5 + 32);
      uint64_t v6 = *(unsigned char **)(v5 + 16);
      *(void *)(a2 + 72) = v6;
      *(void *)(a2 + 136) = v6;
      *(void *)(a2 + 8) = **(void **)(v2 + 8 * v4);
      *(unsigned char *)(a2 + 48) = *v6;
    }
  }
  return result;
}

void sub_23989887C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    sub_23989837C((void *)a2);
    uint64_t v4 = *(void *)(a2 + 40);
    uint64_t v5 = *(void *)(a2 + 24);
    if (*(void *)(v4 + 8 * v5))
    {
      **(unsigned char **)(a2 + 72) = *(unsigned char *)(a2 + 48);
      uint64_t v4 = *(void *)(a2 + 40);
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(*(void *)(v4 + 8 * v6) + 16) = *(void *)(a2 + 72);
      *(void *)(*(void *)(v4 + 8 * v6) + 32) = *(void *)(a2 + 56);
      uint64_t v5 = v6 + 1;
      *(void *)(a2 + 24) = v6 + 1;
    }
    *(void *)(v4 + 8 * v5) = a1;
    uint64_t v7 = *(void *)(a2 + 40);
    uint64_t v8 = *(void *)(v7 + 8 * v5);
    *(void *)(a2 + 56) = *(void *)(v8 + 32);
    BOOL v9 = *(unsigned char **)(v8 + 16);
    *(void *)(a2 + 72) = v9;
    *(void *)(a2 + 136) = v9;
    *(void *)(a2 + 8) = **(void **)(v7 + 8 * v5);
    *(unsigned char *)(a2 + 48) = *v9;
    *(_DWORD *)(a2 + 88) = 1;
  }
}

void sub_239898930(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = *(void ***)(v1 + 8 * *(void *)(a1 + 24));
    if (v3)
    {
      sub_239898780(v3, a1);
      uint64_t v4 = *(void *)(a1 + 24);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = 0;
      if (v4) {
        *(void *)(a1 + 24) = --v4;
      }
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 8 * v4);
        if (v6)
        {
          *(void *)(a1 + 56) = *(void *)(v6 + 32);
          uint64_t v7 = *(unsigned char **)(v6 + 16);
          *(void *)(a1 + 72) = v7;
          *(void *)(a1 + 136) = v7;
          *(void *)(a1 + 8) = **(void **)(v5 + 8 * v4);
          *(unsigned char *)(a1 + 48) = *v7;
          *(_DWORD *)(a1 + 88) = 1;
        }
      }
    }
  }
}

char *sub_2398989C4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = a2 - 2;
  if (a2 < 2 || *(unsigned char *)(a1 + v3) || *(unsigned char *)(a2 + a1 - 1)) {
    return 0;
  }
  uint64_t v8 = (char *)malloc_type_malloc(0x48uLL, 0x28D39929uLL);
  if (!v8) {
    sub_23989853C("out of dynamic memory in yy_scan_buffer()");
  }
  uint64_t v5 = v8;
  *((_DWORD *)v8 + 6) = v3;
  *((void *)v8 + 1) = a1;
  *((void *)v8 + 2) = a1;
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 4) = (int)v3;
  *((void *)v8 + 5) = 0;
  *((_DWORD *)v8 + 12) = 1;
  *(void *)(v8 + 60) = 0;
  sub_2398986C4((uint64_t)v8, a3);
  return v5;
}

char *sub_239898A6C(char *a1, uint64_t a2)
{
  uint64_t v4 = (int)strlen(a1);
  return sub_239898AB0(a1, v4, a2);
}

char *sub_239898AB0(char *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = a2 + 2;
  uint64_t v7 = malloc_type_malloc(a2 + 2, 0x28D39929uLL);
  if (!v7) {
    sub_23989853C("out of dynamic memory in yy_scan_bytes()");
  }
  if (a2)
  {
    uint64_t v8 = v7;
    uint64_t v9 = a2;
    do
    {
      char v10 = *a1++;
      *v8++ = v10;
      --v9;
    }
    while (v9);
  }
  *(_WORD *)&v7[a2] = 0;
  double result = sub_2398989C4((uint64_t)v7, v6, a3);
  if (!result) {
    sub_23989853C("bad buffer in yy_scan_bytes()");
  }
  *((_DWORD *)result + 10) = 1;
  return result;
}

uint64_t sub_239898B48(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_239898B50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 && (uint64_t v2 = *(void *)(v1 + 8 * *(void *)(a1 + 24))) != 0) {
    return *(unsigned int *)(v2 + 52);
  }
  else {
    return 0;
  }
}

uint64_t sub_239898B74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 && (uint64_t v2 = *(void *)(v1 + 8 * *(void *)(a1 + 24))) != 0) {
    return *(unsigned int *)(v2 + 56);
  }
  else {
    return 0;
  }
}

uint64_t sub_239898B98(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_239898BA0(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_239898BA8(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t sub_239898BB0(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t sub_239898BB8(uint64_t result, void *a2)
{
  *a2 = result;
  return result;
}

uint64_t sub_239898BC0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if (!v2 || (uint64_t v3 = *(void *)(v2 + 8 * *(void *)(a2 + 24))) == 0) {
    sub_23989853C("yyset_lineno called with no buffer");
  }
  *(_DWORD *)(v3 + 52) = result;
  return result;
}

uint64_t sub_239898BF8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if (!v2 || (uint64_t v3 = *(void *)(v2 + 8 * *(void *)(a2 + 24))) == 0) {
    sub_23989853C("yyset_column called with no buffer");
  }
  *(_DWORD *)(v3 + 56) = result;
  return result;
}

uint64_t sub_239898C30(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 8) = result;
  return result;
}

uint64_t sub_239898C38(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 16) = result;
  return result;
}

uint64_t sub_239898C40(uint64_t a1)
{
  return *(unsigned int *)(a1 + 132);
}

uint64_t sub_239898C48(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 132) = result;
  return result;
}

uint64_t sub_239898C50(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = malloc_type_malloc(0x98uLL, 0x28D39929uLL);
    *a1 = (uint64_t)v2;
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t result = 0;
      v3[18] = 0;
      *((_OWORD *)v3 + 7) = 0u;
      *((_OWORD *)v3 + 8) = 0u;
      *((_OWORD *)v3 + 5) = 0u;
      *((_OWORD *)v3 + 6) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((_OWORD *)v3 + 4) = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      *((_OWORD *)v3 + 2) = 0u;
      *(_OWORD *)uint64_t v3 = 0u;
      uint64_t v5 = *a1;
      *(_DWORD *)(v5 + 92) = 0;
      *(_DWORD *)(v5 + 96) = 0;
      *(void *)(v5 + 104) = 0;
      *(_OWORD *)(v5 + 8) = 0u;
      *(_OWORD *)(v5 + 24) = 0u;
      *(void *)(v5 + 40) = 0;
      *(void *)(v5 + 72) = 0;
      *(void *)(v5 + 80) = 0;
      return result;
    }
    unint64_t v6 = __error();
    int v7 = 12;
  }
  else
  {
    unint64_t v6 = __error();
    int v7 = 22;
  }
  *unint64_t v6 = v7;
  return 1;
}

uint64_t sub_239898CEC(uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v4 = malloc_type_malloc(0x98uLL, 0x28D39929uLL);
    *a2 = (uint64_t)v4;
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t result = 0;
      v5[18] = 0;
      *((_OWORD *)v5 + 7) = 0u;
      *((_OWORD *)v5 + 8) = 0u;
      *((_OWORD *)v5 + 5) = 0u;
      *((_OWORD *)v5 + 6) = 0u;
      *((_OWORD *)v5 + 3) = 0u;
      *((_OWORD *)v5 + 4) = 0u;
      *((_OWORD *)v5 + 1) = 0u;
      *((_OWORD *)v5 + 2) = 0u;
      *(_OWORD *)uint64_t v5 = 0u;
      uint64_t v7 = *a2;
      *(void *)uint64_t v7 = a1;
      *(_DWORD *)(v7 + 92) = 0;
      *(_DWORD *)(v7 + 96) = 0;
      *(void *)(v7 + 104) = 0;
      *(_OWORD *)(v7 + 8) = 0u;
      *(_OWORD *)(v7 + 24) = 0u;
      *(void *)(v7 + 40) = 0;
      *(void *)(v7 + 72) = 0;
      *(void *)(v7 + 80) = 0;
      return result;
    }
    uint64_t v8 = __error();
    int v9 = 12;
  }
  else
  {
    uint64_t v8 = __error();
    int v9 = 22;
  }
  *uint64_t v8 = v9;
  return 1;
}

uint64_t sub_239898D90(uint64_t a1)
{
  for (unint64_t i = *(void **)(a1 + 40); i; unint64_t i = *(void **)(a1 + 40))
  {
    if (!i[*(void *)(a1 + 24)]) {
      break;
    }
    sub_239898780((void **)i[*(void *)(a1 + 24)], a1);
    *(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) = 0;
    sub_239898930(a1);
  }
  free(i);
  *(void *)(a1 + 40) = 0;
  free(*(void **)(a1 + 104));
  free((void *)a1);
  return 0;
}

void *sub_239898E08(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x7C354E6CuLL);
}

uint64_t sub_239898E14(const char *a1, uint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v3 = fopen(a1, "r");
  if (!v3) {
    return *__error();
  }
  uint64_t v4 = v3;
  if (sub_239898CEC(a2, &v7)) {
    return 1;
  }
  uint64_t v6 = v7;
  *(void *)(v7 + 8) = v4;
  sub_2398974F0(v6);
  sub_239898D90(v7);
  fclose(v4);
  return 0;
}

uint64_t sub_239898E98(char *a1, uint64_t a2)
{
  uint64_t v9 = 0;
  if (sub_239898CEC(a2, &v9)) {
    return 1;
  }
  int v4 = strlen(a1);
  uint64_t v5 = sub_239898AB0(a1, v4, v9);
  uint64_t v6 = v9;
  uint64_t v7 = *(void *)(v9 + 40);
  if (!v7 || (uint64_t v8 = *(void *)(v7 + 8 * *(void *)(v9 + 24))) == 0) {
    sub_23989853C("yyset_lineno called with no buffer");
  }
  *(_DWORD *)(v8 + 52) = 0;
  sub_2398974F0(v6);
  sub_239898780((void **)v5, v9);
  sub_239898D90(v9);
  return 0;
}

void sub_239898F44()
{
  __assert_rtn("protobuf_c_message_get_packed_size", "protobuf-c.c", 643, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_239898F70()
{
}

void sub_239898F9C()
{
}

void sub_239898FC8()
{
}

void sub_239898FF4()
{
  __assert_rtn("repeated_field_pack", "protobuf-c.c", 1334, "actual_length_size == length_size_min + 1");
}

void sub_239899020()
{
  __assert_rtn("protobuf_c_message_pack", "protobuf-c.c", 1372, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_23989904C()
{
}

void sub_239899078()
{
}

void sub_2398990A4()
{
}

void sub_2398990D0()
{
  __assert_rtn("repeated_field_pack_to_buffer", "protobuf-c.c", 1788, "tmp == payload_len");
}

void sub_2398990FC()
{
  __assert_rtn("protobuf_c_message_pack_to_buffer", "protobuf-c.c", 1827, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_239899128()
{
}

void sub_239899154()
{
}

void sub_239899180()
{
}

void sub_2398991AC()
{
  __assert_rtn("protobuf_c_message_unpack", "protobuf-c.c", 3074, "rv->descriptor != NULL");
}

void sub_2398991D8()
{
  __assert_rtn("protobuf_c_message_unpack", "protobuf-c.c", 2889, "(desc)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_239899204()
{
  __assert_rtn("protobuf_c_message_free_unpacked", "protobuf-c.c", 3161, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_239899230()
{
}

void sub_23989925C()
{
  __assert_rtn("protobuf_c_service_generated_init", "protobuf-c.c", 3360, "(descriptor)->magic == PROTOBUF_C__SERVICE_DESCRIPTOR_MAGIC");
}

void sub_239899288()
{
  __assert_rtn("tmlmodel__context__get_packed_size", "tmlmodel.pb-c.c", 19, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_2398992B4()
{
  __assert_rtn("tmlmodel__context__pack", "tmlmodel.pb-c.c", 26, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_2398992E0()
{
  __assert_rtn("tmlmodel__context__pack_to_buffer", "tmlmodel.pb-c.c", 33, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_23989930C()
{
  __assert_rtn("tmlmodel__context__free_unpacked", "tmlmodel.pb-c.c", 50, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_239899338()
{
  __assert_rtn("tmlmodel__class_descriptor__get_packed_size", "tmlmodel.pb-c.c", 62, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_239899364()
{
  __assert_rtn("tmlmodel__class_descriptor__pack", "tmlmodel.pb-c.c", 69, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_239899390()
{
  __assert_rtn("tmlmodel__class_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 76, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_2398993BC()
{
  __assert_rtn("tmlmodel__class_descriptor__free_unpacked", "tmlmodel.pb-c.c", 93, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_2398993E8()
{
  __assert_rtn("tmlmodel__protocol_descriptor__get_packed_size", "tmlmodel.pb-c.c", 105, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_239899414()
{
  __assert_rtn("tmlmodel__protocol_descriptor__pack", "tmlmodel.pb-c.c", 112, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_239899440()
{
  __assert_rtn("tmlmodel__protocol_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 119, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_23989946C()
{
  __assert_rtn("tmlmodel__protocol_descriptor__free_unpacked", "tmlmodel.pb-c.c", 136, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_239899498()
{
  __assert_rtn("tmlmodel__property_descriptor__get_packed_size", "tmlmodel.pb-c.c", 148, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_2398994C4()
{
  __assert_rtn("tmlmodel__property_descriptor__pack", "tmlmodel.pb-c.c", 155, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_2398994F0()
{
  __assert_rtn("tmlmodel__property_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 162, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_23989951C()
{
  __assert_rtn("tmlmodel__property_descriptor__free_unpacked", "tmlmodel.pb-c.c", 179, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_239899548()
{
  __assert_rtn("tmlmodel__method_descriptor__get_packed_size", "tmlmodel.pb-c.c", 191, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_239899574()
{
  __assert_rtn("tmlmodel__method_descriptor__pack", "tmlmodel.pb-c.c", 198, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_2398995A0()
{
  __assert_rtn("tmlmodel__method_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 205, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_2398995CC()
{
  __assert_rtn("tmlmodel__method_descriptor__free_unpacked", "tmlmodel.pb-c.c", 222, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_2398995F8()
{
  __assert_rtn("tmlmodel__object__get_packed_size", "tmlmodel.pb-c.c", 240, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_239899624()
{
  __assert_rtn("tmlmodel__object__pack", "tmlmodel.pb-c.c", 247, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_239899650()
{
  __assert_rtn("tmlmodel__object__pack_to_buffer", "tmlmodel.pb-c.c", 254, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_23989967C()
{
  __assert_rtn("tmlmodel__object__free_unpacked", "tmlmodel.pb-c.c", 271, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_2398996A8()
{
  __assert_rtn("tmlmodel__function__get_packed_size", "tmlmodel.pb-c.c", 283, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_2398996D4()
{
  __assert_rtn("tmlmodel__function__pack", "tmlmodel.pb-c.c", 290, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_239899700()
{
  __assert_rtn("tmlmodel__function__pack_to_buffer", "tmlmodel.pb-c.c", 297, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_23989972C()
{
  __assert_rtn("tmlmodel__function__free_unpacked", "tmlmodel.pb-c.c", 314, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_239899758()
{
  __assert_rtn("tmlmodel__signal_function__get_packed_size", "tmlmodel.pb-c.c", 326, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_239899784()
{
  __assert_rtn("tmlmodel__signal_function__pack", "tmlmodel.pb-c.c", 333, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_2398997B0()
{
  __assert_rtn("tmlmodel__signal_function__pack_to_buffer", "tmlmodel.pb-c.c", 340, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_2398997DC()
{
  __assert_rtn("tmlmodel__signal_function__free_unpacked", "tmlmodel.pb-c.c", 357, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_239899808()
{
  __assert_rtn("tmlmodel__value_expression__get_packed_size", "tmlmodel.pb-c.c", 369, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

void sub_239899834()
{
  __assert_rtn("tmlmodel__value_expression__pack", "tmlmodel.pb-c.c", 376, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

void sub_239899860()
{
  __assert_rtn("tmlmodel__value_expression__pack_to_buffer", "tmlmodel.pb-c.c", 383, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

void sub_23989988C()
{
  __assert_rtn("tmlmodel__value_expression__free_unpacked", "tmlmodel.pb-c.c", 400, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x270EFB908](retstr, t);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x270EFB918](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x270EFB930](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB960](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB978](retstr, t, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B68](data, *(void *)&len, md);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE6408](font);
}

CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider)
{
  return (CGFontRef)MEMORY[0x270EE6430](provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x270EE6FF0](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x270EE7E68](retstr, time, multiplier);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x270EE7EB8](retstr, start, end);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

BOOL CTFontManagerRegisterGraphicsFont(CGFontRef font, CFErrorRef *error)
{
  return MEMORY[0x270EE9CE0](font, error);
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return (JSClassRef)MEMORY[0x270EF52F0](definition);
}

void JSGarbageCollect(JSContextRef ctx)
{
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return (JSObjectRef)MEMORY[0x270EF5378](ctx, jsClass, data);
}

BOOL JSStringIsEqualToUTF8CString(JSStringRef a, const char *b)
{
  return MEMORY[0x270EF53F8](a, b);
}

JSValueRef JSValueMakeBoolean(JSContextRef ctx, BOOL BOOLean)
{
  return (JSValueRef)MEMORY[0x270EF5458](ctx, BOOLean);
}

JSValueRef JSValueMakeNull(JSContextRef ctx)
{
  return (JSValueRef)MEMORY[0x270EF5468](ctx);
}

JSValueRef JSValueMakeNumber(JSContextRef ctx, double number)
{
  return (JSValueRef)MEMORY[0x270EF5470](ctx, number);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return (JSValueRef)MEMORY[0x270EF5480](ctx);
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  MEMORY[0x270EF58A8]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  MEMORY[0x270EF58B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.span.longitudeDeltCATransform3D a = v4;
  result.span.latitudeDeltCATransform3D a = v3;
  result.center.longitude = v2;
  result.center.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x270EF58B8]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDeltCATransform3D a = v6;
  result.span.latitudeDeltCATransform3D a = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.double y = v2;
  result.double x = v1;
  return result;
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x270EF5928]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  MEMORY[0x270EF5930]((__n128)a, *(__n128 *)&a.y, (__n128)b, *(__n128 *)&b.y);
  return result;
}

CGFloat MKRoadWidthAtZoomScale(MKZoomScale zoomScale)
{
  MEMORY[0x270EF5938](zoomScale);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x270EF2B98](namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromUIOffset(UIOffset offset)
{
  return (NSString *)MEMORY[0x270F05EC0]((__n128)offset, *(__n128 *)&offset.vertical);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.id location = v2;
  return result;
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x270EFDAB8](key, *(void *)&padding, signedData, signedDataLen, sig, sigLen);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD30](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x270F05EF0](assistiveTechnologyIdentifier);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x270F05F00]();
}

BOOL UIAccessibilityIsClosedCaptioningEnabled(void)
{
  return MEMORY[0x270F05F08]();
}

BOOL UIAccessibilityIsGuidedAccessEnabled(void)
{
  return MEMORY[0x270F05F10]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x270F05F18]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

BOOL UIAccessibilityIsShakeToUndoEnabled(void)
{
  return MEMORY[0x270F05F30]();
}

BOOL UIAccessibilityIsSpeakScreenEnabled(void)
{
  return MEMORY[0x270F05F38]();
}

BOOL UIAccessibilityIsSpeakSelectionEnabled(void)
{
  return MEMORY[0x270F05F40]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

BOOL class_addProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
{
  return MEMORY[0x270F9A410](cls, name, attributes, *(void *)&attributeCount);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A418](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x270F9A430](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x270F9A440](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x270F9A468](cls);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x270F9A478](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x270F9A488](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x270F9A4A0](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x270F9A4A8](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x270F9A4C0](block);
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x270F9A4D8](m, *(void *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x270F9A4E0](m);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x270F9A4F8](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x270F9A500](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x270F9A550](superclass, name, extraBytes);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x270F9A6B8](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D8](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_registerClassPair(Class cls)
{
}

void objc_release(id a1)
{
}

void objc_removeAssociatedObjects(id object)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x270F9AA50](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x270F9AA70](a1, a2);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA90](property);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x270F9AAC8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x270F9AAD0](p);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}