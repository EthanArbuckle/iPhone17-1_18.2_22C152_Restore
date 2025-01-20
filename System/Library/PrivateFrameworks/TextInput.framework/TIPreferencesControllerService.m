@interface TIPreferencesControllerService
+ (id)sharedPreferencesController;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TIPreferencesControllerService)init;
- (void)dealloc;
@end

@implementation TIPreferencesControllerService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(TIPreferencesControllerServiceHandler);
  [v5 setExportedObject:v6];

  v7 = +[TIPreferencesControllerClient serviceInterface];
  [v5 setExportedInterface:v7];

  v8 = [(TIPreferencesControllerService *)self dispatchQueue];
  [v5 _setQueue:v8];

  [v5 resume];
  return 1;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TIPreferencesControllerService;
  [(TIPreferencesControllerService *)&v3 dealloc];
}

- (TIPreferencesControllerService)init
{
  v9.receiver = self;
  v9.super_class = (Class)TIPreferencesControllerService;
  v2 = [(TIPreferencesControllerService *)&v9 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.preferences-service", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.TextInput.preferences"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener _setQueue:v2->_dispatchQueue];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

+ (id)sharedPreferencesController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__TIPreferencesControllerService_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once_769 != -1) {
    dispatch_once(&sharedPreferencesController_once_769, block);
  }
  v2 = (void *)sharedPreferencesController_sharedController_770;

  return v2;
}

uint64_t __61__TIPreferencesControllerService_sharedPreferencesController__block_invoke()
{
  sharedPreferencesController_sharedController_770 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end