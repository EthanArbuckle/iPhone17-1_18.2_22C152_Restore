@interface SEMAdministrator
+ (id)sharedQueue;
+ (void)initialize;
- (SEMAdministrator)init;
- (SEMAdministrator)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5;
- (unsigned)_synchronouslyWrapRequest:(id)a3;
- (unsigned)beginEvaluation:(id)a3;
- (unsigned)beginEvaluationWithSerializedSets:(id)a3;
- (unsigned)endEvaluation;
- (void)beginEvaluation:(id)a3 completion:(id)a4;
- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4;
- (void)endEvaluation:(id)a3;
- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4;
@end

@implementation SEMAdministrator

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

+ (id)sharedQueue
{
  if (qword_26B354A00 != -1) {
    dispatch_once(&qword_26B354A00, &unk_2709E0178);
  }
  v2 = (void *)qword_26B3549F8;
  return v2;
}

- (SEMAdministrator)init
{
  v3 = objc_alloc_init(SEMAdminXPCClient);
  v4 = objc_opt_class();
  v8 = objc_msgSend_sharedQueue(v4, v5, v6, v7);
  v10 = (SEMAdministrator *)objc_msgSend_initWithAdminService_timeout_queue_(self, v9, (uint64_t)v3, (uint64_t)v8, 30.0);

  return v10;
}

- (SEMAdministrator)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SEMAdministrator;
  v11 = [(SEMAdministrator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_adminService, a3);
    v12->_timeout = a4;
    objc_storeStrong((id *)&v12->_queue, a5);
  }

  return v12;
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v7, v8, v9))
  {
    id v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SEMAdministrator triggerMaintenance:completion:]";
      _os_log_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v6) {
      v6[2](v6, 3);
    }
  }
  else
  {
    adminService = self->_adminService;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_25C7E09C4;
    v13[3] = &unk_2654DDED0;
    objc_super v14 = v6;
    objc_msgSend_triggerMaintenance_completion_(adminService, v12, v4, (uint64_t)v13);
  }
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v8, v9, v10))
  {
    v11 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SEMAdministrator beginEvaluation:completion:]";
      _os_log_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v12 = qword_26B3549D8;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[SEMAdministrator beginEvaluation:completion:]";
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Submitting request to begin evaluation with serializedSets: %@", buf, 0x16u);
      }
      adminService = self->_adminService;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = sub_25C7E0C00;
      v15[3] = &unk_2654DDED0;
      id v16 = v7;
      objc_msgSend_beginEvaluation_completion_(adminService, v14, (uint64_t)v6, (uint64_t)v15);

      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SEMAdministrator beginEvaluation:completion:]";
      _os_log_error_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_ERROR, "%s serializedSets cannot be nil.", buf, 0xCu);
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  if (v7) {
LABEL_11:
  }
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 3);
LABEL_12:
}

- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v33 = a4;
  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v10 = objc_msgSend_count(v5, v7, v8, v9);
  v13 = objc_msgSend_initWithCapacity_(v6, v11, v10, v12);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v5;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v35, (uint64_t)v45, 16);
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = 0;
    uint64_t v19 = *(void *)v36;
    while (2)
    {
      uint64_t v20 = 0;
      uint64_t v21 = v18;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * v20);
        id v23 = objc_alloc(MEMORY[0x263F31768]);
        id v34 = v21;
        v25 = objc_msgSend_initWithData_error_(v23, v24, v22, (uint64_t)&v34);
        id v18 = v34;

        if (!v25)
        {
          v29 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v40 = "-[SEMAdministrator beginEvaluationWithSerializedSets:completion:]";
            __int16 v41 = 2112;
            uint64_t v42 = v22;
            __int16 v43 = 2112;
            id v44 = v18;
            _os_log_error_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_ERROR, "%s Failed to initialize serialized set from data: %@ error: %@", buf, 0x20u);
          }
          v30 = v33;
          if (v33) {
            (*((void (**)(id, uint64_t))v33 + 2))(v33, 3);
          }

          goto LABEL_17;
        }
        objc_msgSend_addObject_(v13, v26, (uint64_t)v25, v27);

        ++v20;
        uint64_t v21 = v18;
      }
      while (v17 != v20);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v28, (uint64_t)&v35, (uint64_t)v45, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v18 = 0;
  }

  v30 = v33;
  objc_msgSend_beginEvaluation_completion_(self, v31, (uint64_t)v13, (uint64_t)v33);
LABEL_17:
}

- (unsigned)beginEvaluation:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_25C7E0FD0;
  v9[3] = &unk_2654DDEF8;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  LOBYTE(self) = objc_msgSend__synchronouslyWrapRequest_(self, v6, (uint64_t)v9, v7);

  return self;
}

- (unsigned)beginEvaluationWithSerializedSets:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_25C7E107C;
  v9[3] = &unk_2654DDEF8;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  LOBYTE(self) = objc_msgSend__synchronouslyWrapRequest_(self, v6, (uint64_t)v9, v7);

  return self;
}

- (void)endEvaluation:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  int isCustomerInstall = objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v5, v6, v7);
  uint64_t v9 = qword_26B3549D8;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
  if (isCustomerInstall)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[SEMAdministrator endEvaluation:]";
      _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 3);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[SEMAdministrator endEvaluation:]";
      _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Submitting request to end evaluation", buf, 0xCu);
    }
    adminService = self->_adminService;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_25C7E121C;
    v14[3] = &unk_2654DDED0;
    v15 = v4;
    objc_msgSend_endEvaluation_(adminService, v12, (uint64_t)v14, v13);
  }
}

- (unsigned)endEvaluation
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_25C7E1380;
  v4[3] = &unk_2654DDF20;
  v4[4] = self;
  return objc_msgSend__synchronouslyWrapRequest_(self, a2, (uint64_t)v4, v2);
}

- (unsigned)_synchronouslyWrapRequest:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  dispatch_group_t v5 = dispatch_group_create();
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_25C7E1588;
  v17[3] = &unk_2654DDF48;
  uint64_t v19 = &v20;
  v17[4] = self;
  uint64_t v6 = v5;
  uint64_t v18 = v6;
  uint64_t v7 = (void *)MEMORY[0x2611949C0](v17);
  dispatch_group_enter(v6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_25C7E16B4;
  v15[3] = &unk_2654DDF98;
  void v15[4] = self;
  id v8 = v7;
  id v16 = v8;
  v4[2](v4, v15);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  if (dispatch_group_wait(v6, v9))
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_25C7E1764;
    v13[3] = &unk_2654DDFC0;
    id v14 = v8;
    dispatch_sync(queue, v13);
  }
  unsigned __int8 v11 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_adminService, 0);
}

@end