@interface SEMProvisionalResourceManager
- (BOOL)isActive;
- (NSDate)expirationDate;
- (SEMProvisionalResourceManager)init;
- (SEMProvisionalResourceManager)initWithResourceName:(id)a3 lifespan:(double)a4 activationBlock:(id)a5 deactivationBlock:(id)a6 serializeOperations:(BOOL)a7;
- (int64_t)activateWithError:(id *)a3 operationBlock:(id)a4;
- (int64_t)deactivateWithError:(id *)a3;
- (void)_setExpirationTimer;
- (void)activateAsyncWithCompletion:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation SEMProvisionalResourceManager

- (SEMProvisionalResourceManager)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMProvisionalResourceManager)initWithResourceName:(id)a3 lifespan:(double)a4 activationBlock:(id)a5 deactivationBlock:(id)a6 serializeOperations:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v52.receiver = self;
  v52.super_class = (Class)SEMProvisionalResourceManager;
  v18 = [(SEMProvisionalResourceManager *)&v52 init];
  if (!v18)
  {
LABEL_20:
    v47 = v18;
    goto LABEL_21;
  }
  uint64_t v19 = objc_msgSend_copy(v12, v15, v16, v17);
  resourceName = v18->_resourceName;
  v18->_resourceName = (NSString *)v19;

  if (!objc_msgSend_length(v18->_resourceName, v21, v22, v23))
  {
    v36 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
      __int16 v55 = 2112;
      id v56 = v12;
      _os_log_error_impl(&dword_25C7CA000, v36, OS_LOG_TYPE_ERROR, "%s Resource name must be nonempty. Received: %@", buf, 0x16u);
    }
    goto LABEL_17;
  }
  v18->_expirationInterval = a4;
  if (a4 <= 0.0)
  {
    v37 = (void *)qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v38 = NSNumber;
    v39 = v37;
    v43 = objc_msgSend_numberWithDouble_(v38, v40, v41, v42, a4);
    *(_DWORD *)buf = 136315394;
    v54 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
    __int16 v55 = 2112;
    id v56 = v43;
    v44 = "%s Lifespan must be greater than 0. Received: %@";
LABEL_16:
    _os_log_error_impl(&dword_25C7CA000, v39, OS_LOG_TYPE_ERROR, v44, buf, 0x16u);

    goto LABEL_17;
  }
  uint64_t v24 = MEMORY[0x2611949C0](v13);
  id activationBlock = v18->_activationBlock;
  v18->_id activationBlock = (id)v24;

  if (!v18->_activationBlock)
  {
    v45 = (void *)qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v39 = v45;
    v43 = (void *)MEMORY[0x2611949C0](0);
    *(_DWORD *)buf = 136315394;
    v54 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
    __int16 v55 = 2112;
    id v56 = v43;
    v44 = "%s Invalid activation block: %@";
    goto LABEL_16;
  }
  uint64_t v26 = MEMORY[0x2611949C0](v14);
  deid activationBlock = v18->_deactivationBlock;
  v18->_deid activationBlock = (id)v26;

  if (v18->_deactivationBlock)
  {
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create("activation", v28);
    activationQueue = v18->_activationQueue;
    v18->_activationQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v33 = dispatch_queue_create("expiration", v32);
    expirationQueue = v18->_expirationQueue;
    v18->_expirationQueue = (OS_dispatch_queue *)v33;

    if (v7) {
      v35 = 0;
    }
    else {
      v35 = MEMORY[0x263EF83A8];
    }
    v48 = dispatch_queue_attr_make_with_autorelease_frequency(v35, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v49 = dispatch_queue_create("operation", v48);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = (OS_dispatch_queue *)v49;

    v18->_isActive = 0;
    v18->_operationsInProgress = 0;
    goto LABEL_20;
  }
  v46 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    v39 = v46;
    v43 = (void *)MEMORY[0x2611949C0](0);
    *(_DWORD *)buf = 136315394;
    v54 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
    __int16 v55 = 2112;
    id v56 = v43;
    v44 = "%s Invalid deactivation block: %@";
    goto LABEL_16;
  }
LABEL_17:
  v47 = 0;
LABEL_21:

  return v47;
}

- (void)activateAsyncWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C804EA0;
  block[3] = &unk_2654DECD0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(activationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)activateWithError:(id *)a3 operationBlock:(id)a4
{
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C8051F0;
  block[3] = &unk_2654DECF8;
  block[5] = &v16;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(activationQueue, block);
  int64_t v8 = v17[3];
  if ((v8 | 2) == 3)
  {
    operationQueue = self->_operationQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_25C805318;
    v13[3] = &unk_2654DDFC0;
    id v14 = v6;
    dispatch_sync(operationQueue, v13);
    v10 = self->_activationQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_25C805328;
    v12[3] = &unk_2654DE398;
    v12[4] = self;
    dispatch_sync(v10, v12);

    int64_t v8 = v17[3];
  }
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (int64_t)deactivateWithError:(id *)a3
{
  uint64_t v7 = 0;
  int64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C8053F0;
  block[3] = &unk_2654DECF8;
  void block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(activationQueue, block);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_setExpirationTimer
{
  v5 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], a2, v2, v3, self->_expirationInterval);
  objc_msgSend_setExpirationDate_(self, v6, (uint64_t)v5, v7);

  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(self->_expirationInterval * 1000000000.0));
  expirationQueue = self->_expirationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C805694;
  block[3] = &unk_2654DE398;
  void block[4] = self;
  dispatch_after(v8, expirationQueue, block);
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  activationQueue = self->_activationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_25C805960;
  v5[3] = &unk_2654DE430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong(&self->_deactivationBlock, 0);
  objc_storeStrong(&self->_activationBlock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_expirationQueue, 0);
  objc_storeStrong((id *)&self->_activationQueue, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end