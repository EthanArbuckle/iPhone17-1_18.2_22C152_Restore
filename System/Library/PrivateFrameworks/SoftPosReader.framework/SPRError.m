@interface SPRError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 reason:(id)a4;
+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 underlyingError:(id)a5;
+ (id)failureForCode:(int64_t)a3;
@end

@implementation SPRError

+ (id)failureForCode:(int64_t)a3
{
  if (qword_267F494D0 != -1) {
    dispatch_once(&qword_267F494D0, &unk_26D31D7A8);
  }
  v7 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4, v5);
  v16 = objc_msgSend_objectForKeyedSubscript_((void *)qword_267F494D8, v8, (uint64_t)v7, v9, v10, v11);
  if (!v16)
  {
    v16 = objc_msgSend_stringWithFormat_(NSString, v12, @"SPRError#%ld", v13, v14, v15, a3);
  }

  return v16;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, int64_t, void, void))MEMORY[0x270F9A6D0])(SPRError, sel_errorWithCode_reason_underlyingError_, a3, 0, 0);
}

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4
{
  return (id)((uint64_t (*)(__objc2_class *, char *, int64_t, id, void))MEMORY[0x270F9A6D0])(SPRError, sel_errorWithCode_reason_underlyingError_, a3, a4, 0);
}

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  uint64_t v14 = objc_msgSend_failureForCode_(SPRError, v10, a3, v11, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v9, v15, (uint64_t)v14, *MEMORY[0x263F08328], v16, v17);

  objc_msgSend_setObject_forKeyedSubscript_(v9, v18, (uint64_t)v8, *MEMORY[0x263F08338], v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v9, v21, (uint64_t)v7, *MEMORY[0x263F08608], v22, v23);

  v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v24, @"SoftPosReader", a3, (uint64_t)v9, v25);

  return v26;
}

@end