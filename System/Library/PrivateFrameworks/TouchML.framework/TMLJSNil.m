@interface TMLJSNil
+ (BOOL)isNil:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)jsValueInContext:(id)a3;
+ (id)sharedInstance;
+ (id)unwrap:(id)a3;
- (TMLJSNil)init;
- (id)jsValueInContext:(id)a3;
@end

@implementation TMLJSNil

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239892CDC;
  block[3] = &unk_264DAB680;
  block[4] = a1;
  if (qword_268A059A8 != -1) {
    dispatch_once(&qword_268A059A8, block);
  }
  v2 = (void *)qword_268A059A0;
  return v2;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend_sharedInstance(a1, a2, v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (TMLJSNil)init
{
  v9.receiver = self;
  v9.super_class = (Class)TMLJSNil;
  v2 = [(TMLJSNil *)&v9 init];
  double v3 = (TMLJSNil *)v2;
  if (v2)
  {
    v4 = (_OWORD *)MEMORY[0x263F103A8];
    long long v5 = *(_OWORD *)(MEMORY[0x263F103A8] + 16);
    *((_OWORD *)v2 + 1) = *MEMORY[0x263F103A8];
    *((_OWORD *)v2 + 2) = v5;
    long long v6 = v4[3];
    *((_OWORD *)v2 + 3) = v4[2];
    *((_OWORD *)v2 + 4) = v6;
    long long v7 = v4[5];
    *((_OWORD *)v2 + 5) = v4[4];
    *((_OWORD *)v2 + 6) = v7;
    *((_DWORD *)v2 + 5) = 2;
    *((void *)v2 + 3) = "Nil";
    *((void *)v2 + 4) = 0;
    *((void *)v2 + 7) = nullsub_5;
    *((void *)v2 + 8) = nullsub_6;
    *((void *)v2 + 9) = sub_239892E74;
    *((void *)v2 + 10) = sub_239892E9C;
    *((void *)v2 + 11) = sub_239892EA4;
    *((void *)v2 + 15) = j__JSValueMakeUndefined;
    *((void *)v2 + 14) = sub_239892EB0;
    *((void *)v2 + 16) = sub_239892EB8;
    *((void *)v2 + 17) = sub_239892EC0;
    *((void *)v2 + 1) = JSClassCreate((const JSClassDefinition *)(v2 + 16));
  }
  return v3;
}

+ (id)jsValueInContext:(id)a3
{
  id v4 = a3;
  long long v7 = objc_msgSend_sharedInstance(a1, v5, v6);
  v10 = objc_msgSend_jsValueInContext_(v7, v8, v9, v4);

  return v10;
}

+ (id)unwrap:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isNil_(a1, v5, v6, v4)) {
    long long v7 = 0;
  }
  else {
    long long v7 = v4;
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)isNil:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = objc_msgSend_objectForKey_(v3, v4, v5, @"$__tml_nil__$");
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)jsValueInContext:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, v6, @"Nil");
  v10 = v7;
  if (!v7 || objc_msgSend_isUndefined(v7, v8, v9))
  {
    v11 = (const OpaqueJSContext *)objc_msgSend_JSGlobalContextRef(v4, v8, v9);
    JSObjectRef v12 = JSObjectMake(v11, self->_jsClassRef, 0);
    v15 = objc_msgSend_valueWithJSValueRef_inContext_(MEMORY[0x263F10390], v13, v14, v12, v4);

    uint64_t v16 = *MEMORY[0x263F10370];
    v26[0] = *MEMORY[0x263F10350];
    v26[1] = v16;
    v27[0] = MEMORY[0x263EFFA88];
    v27[1] = MEMORY[0x263EFFA80];
    v26[2] = *MEMORY[0x263F10368];
    v27[2] = @"$__tml_nil__$";
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, v18, v27, v26, 3);
    objc_msgSend_defineProperty_descriptor_(v15, v20, v21, @"$__tml_nil__$", v19);

    objc_msgSend_setObject_forKeyedSubscript_(v4, v22, v23, v15, @"Nil");
    v10 = v15;
  }
  id v24 = v10;

  return v24;
}

@end