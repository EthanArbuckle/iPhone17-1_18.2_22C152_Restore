@interface TMLAspect
+ (id)aspectForObjectsImplementingProtocolNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6;
+ (id)aspectForObjectsWithClassNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6;
+ (id)aspectForRegistrationKey:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6;
+ (id)aspectForTarget:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6;
+ (id)jsConvertedBlock:(id)a3;
+ (id)tmlAspectForObjectsImplementingProtocolNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5;
+ (id)tmlAspectForObjectsWithClassNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5;
+ (id)tmlAspectForTarget:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5;
- (NSObject)target;
- (NSString)registrationKey;
- (NSString)signalName;
- (id)block;
- (id)unregisterBlock;
- (int)advice;
- (void)activateWithObject:(id)a3 arguments:(id)a4 returnValue:(id)a5 newArguments:(id *)a6 newReturnValue:(id *)a7;
- (void)dealloc;
- (void)setAdvice:(int)a3;
- (void)setBlock:(id)a3;
- (void)setSignalName:(id)a3;
- (void)setTarget:(id)a3;
- (void)setUnregisterBlock:(id)a3;
- (void)unregister;
@end

@implementation TMLAspect

+ (id)aspectForRegistrationKey:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = objc_alloc_init(TMLAspect);
  objc_msgSend_setAdvice_(v12, v13, v14, v7);
  objc_msgSend_setBlock_(v12, v15, v16, v11);
  objc_msgSend_setSignalName_(v12, v17, v18, v10);
  v21 = objc_msgSend_shared(TMLAspectsRegistration, v19, v20);
  objc_msgSend_registerAspect_withKey_(v21, v22, v23, v12, v9);

  objc_initWeak(&location, v12);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_23983C34C;
  v28[3] = &unk_264DABEE8;
  objc_copyWeak(&v30, &location);
  id v24 = v9;
  id v29 = v24;
  objc_msgSend_setUnregisterBlock_(v12, v25, v26, v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v12;
}

+ (id)aspectForObjectsImplementingProtocolNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a6;
  id v10 = a4;
  v13 = objc_msgSend_keyForProtocolNamed_signalName_advice_(TMLAspectsRegistration, v11, v12, a3, v10, v6);
  double v14 = objc_opt_class();
  v17 = objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v14, v15, v16, v13, v10, v6, v9);

  return v17;
}

+ (id)aspectForObjectsWithClassNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a6;
  id v10 = a4;
  v13 = objc_msgSend_keyForClassNamed_signalName_advice_(TMLAspectsRegistration, v11, v12, a3, v10, v6);
  double v14 = objc_opt_class();
  v17 = objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v14, v15, v16, v13, v10, v6, v9);

  return v17;
}

+ (id)aspectForTarget:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  double v12 = objc_alloc_init(TMLAspect);
  objc_msgSend_setAdvice_(v12, v13, v14, v7);
  objc_msgSend_setBlock_(v12, v15, v16, v11);
  objc_msgSend_setSignalName_(v12, v17, v18, v10);
  objc_msgSend_registerAspect_(v9, v19, v20, v12);
  objc_initWeak(&location, v9);
  objc_initWeak(&from, v12);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_23983C6E0;
  v24[3] = &unk_264DABF10;
  objc_copyWeak(&v25, &location);
  objc_copyWeak(&v26, &from);
  objc_msgSend_setUnregisterBlock_(v12, v21, v22, v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

+ (id)jsConvertedBlock:(id)a3
{
  objc_initWeak(&location, a3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_23983C844;
  v5[3] = &unk_264DABF38;
  objc_copyWeak(&v6, &location);
  v3 = (void *)MEMORY[0x23ECA7DD0](v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

+ (id)tmlAspectForObjectsImplementingProtocolNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v10 = objc_msgSend_keyForProtocolNamed_signalName_advice_(TMLAspectsRegistration, v8, v9, a3, v7, v5);
  id v11 = objc_opt_class();
  double v14 = objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v11, v12, v13, v10, v7, v5, 0);

  v15 = objc_opt_class();
  double v18 = objc_msgSend_jsConvertedBlock_(v15, v16, v17, v14);
  objc_msgSend_setBlock_(v14, v19, v20, v18);

  return v14;
}

+ (id)tmlAspectForObjectsWithClassNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v10 = objc_msgSend_keyForClassNamed_signalName_advice_(TMLAspectsRegistration, v8, v9, a3, v7, v5);
  id v11 = objc_opt_class();
  double v14 = objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v11, v12, v13, v10, v7, v5, 0);

  v15 = objc_opt_class();
  double v18 = objc_msgSend_jsConvertedBlock_(v15, v16, v17, v14);
  objc_msgSend_setBlock_(v14, v19, v20, v18);

  return v14;
}

+ (id)tmlAspectForTarget:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  double v9 = objc_opt_class();
  double v12 = objc_msgSend_aspectForTarget_signalOrMethodName_advice_block_(v9, v10, v11, v8, v7, v5, 0);

  double v13 = objc_opt_class();
  double v16 = objc_msgSend_jsConvertedBlock_(v13, v14, v15, v12);
  objc_msgSend_setBlock_(v12, v17, v18, v16);

  return v12;
}

- (void)dealloc
{
  objc_msgSend_unregister(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)TMLAspect;
  [(TMLAspect *)&v4 dealloc];
}

- (void)activateWithObject:(id)a3 arguments:(id)a4 returnValue:(id)a5 newArguments:(id *)a6 newReturnValue:(id *)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    block = (void (**)(id, id, void *, id, id, id *, id *))self->_block;
    if (block)
    {
      double v17 = objc_msgSend_currentContext(TMLContext, v14, v15);
      block[2](block, v18, v17, v12, v13, a6, a7);
    }
  }
}

- (void)unregister
{
  unregisterBlock = (void (**)(void))self->_unregisterBlock;
  if (unregisterBlock) {
    unregisterBlock[2]();
  }
}

- (NSObject)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (int)advice
{
  return self->_advice;
}

- (void)setAdvice:(int)a3
{
  self->_advice = a3;
}

- (NSString)signalName
{
  return self->_signalName;
}

- (void)setSignalName:(id)a3
{
}

- (NSString)registrationKey
{
  return self->_registrationKey;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_registrationKey, 0);
  objc_storeStrong((id *)&self->_signalName, 0);
  objc_destroyWeak((id *)&self->_target);
}

@end