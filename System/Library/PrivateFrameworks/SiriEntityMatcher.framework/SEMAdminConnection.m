@interface SEMAdminConnection
- (BOOL)_isCustomerInstall:(id)a3;
- (SEMAdminConnection)initWithSettings:(id)a3 indexSiteManager:(id)a4 queue:(id)a5;
- (void)beginEvaluation:(id)a3 completion:(id)a4;
- (void)endEvaluation:(id)a3;
- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4;
@end

@implementation SEMAdminConnection

- (SEMAdminConnection)initWithSettings:(id)a3 indexSiteManager:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SEMAdminConnection;
  v12 = [(SEMAdminConnection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_settings, a3);
    objc_storeStrong((id *)&v13->_manager, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7DFF6C;
  block[3] = &unk_2654DDE58;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)endEvaluation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_25C7E0230;
  v7[3] = &unk_2654DDE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7E043C;
  block[3] = &unk_2654DDEA8;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (BOOL)_isCustomerInstall:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void (**)(id, uint64_t))a3;
  int isCustomerInstall = objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v4, v5, v6);
  if (isCustomerInstall)
  {
    id v8 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      BOOL v11 = "-[SEMAdminConnection _isCustomerInstall:]";
      _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v10, 0xCu);
    }
    if (v3) {
      v3[2](v3, 2);
    }
  }

  return isCustomerInstall;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end