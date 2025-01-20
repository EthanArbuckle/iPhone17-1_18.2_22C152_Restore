@interface TIPreferencesControllerClient
+ (id)serviceInterface;
+ (id)sharedPreferencesController;
- (BOOL)isValid;
- (NSString)machName;
- (TIPreferencesControllerClient)init;
- (void)_disconnect;
- (void)_pushValue:(id)a3 toPreference:(id)a4 domain:(id)a5;
- (void)createConnectionIfNecessary;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)performWithWriteability:(BOOL)a3 operations:(id)a4;
- (void)setIsValid:(BOOL)a3;
- (void)setMachName:(id)a3;
- (void)updateInputModes:(id)a3;
@end

@implementation TIPreferencesControllerClient

- (void)forwardInvocation:(id)a3
{
  id v8 = a3;
  v4 = &unk_1EDC4A120;
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)v4, (SEL)[v8 selector], 1, 1);
  if (MethodDescription.name && *MethodDescription.types == 118)
  {
    [(TIPreferencesControllerClient *)self createConnectionIfNecessary];
    v6 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    if (v6)
    {
      [(TIPreferencesController *)self setIgnoreNextSyncNotification:1];
      v7 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
      [v8 invokeWithTarget:v7];
    }
  }
  [v8 invokeWithTarget:self];
}

+ (id)sharedPreferencesController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TIPreferencesControllerClient_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once_732 != -1) {
    dispatch_once(&sharedPreferencesController_once_732, block);
  }
  v2 = (void *)sharedPreferencesController_sharedController_733;

  return v2;
}

uint64_t __60__TIPreferencesControllerClient_sharedPreferencesController__block_invoke()
{
  sharedPreferencesController_sharedController_733 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (TIPreferencesControllerClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIPreferencesControllerClient;
  v2 = [(TIPreferencesController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [@"com.apple.TextInput.preferences" copy];
    machName = v2->_machName;
    v2->_machName = (NSString *)v3;

    v2->_isValid = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setMachName:(id)a3
{
}

- (NSString)machName
{
  return self->_machName;
}

- (void)updateInputModes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__TIPreferencesControllerClient_updateInputModes___block_invoke;
  v6[3] = &unk_1E555A4A0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(TIPreferencesControllerClient *)self performWithWriteability:1 operations:v6];
}

id __50__TIPreferencesControllerClient_updateInputModes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TIPreferencesControllerClient;
  return objc_msgSendSuper2(&v3, sel_updateInputModes_, v1);
}

- (void)performWithWriteability:(BOOL)a3 operations:(id)a4
{
  BOOL writeable = self->_writeable;
  self->_BOOL writeable = a3;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  self->_BOOL writeable = writeable;
}

- (void)_pushValue:(id)a3 toPreference:(id)a4 domain:(id)a5
{
  if (self->_writeable)
  {
    v5.receiver = self;
    v5.super_class = (Class)TIPreferencesControllerClient;
    [(TIPreferencesController *)&v5 _pushValue:a3 toPreference:a4 domain:a5];
  }
}

- (void)createConnectionIfNecessary
{
  if (!self->_isValid)
  {
    [(NSXPCConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;

    self->_isValid = 1;
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_machName options:4096];
    objc_super v5 = self->_connection;
    self->_connection = v4;

    objc_super v6 = +[TIPreferencesControllerClient serviceInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    id v7 = self->_connection;
    if (_preferencesClientDispatchQueue_onceToken != -1) {
      dispatch_once(&_preferencesClientDispatchQueue_onceToken, &__block_literal_global_852);
    }
    [(NSXPCConnection *)v7 _setQueue:_preferencesClientDispatchQueue___xpc_queue];
    id v8 = self;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke;
    v17[3] = &unk_1E555A428;
    v9 = v8;
    v18 = v9;
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v17];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke_2;
    v15 = &unk_1E555A428;
    v16 = v9;
    v10 = self->_connection;
    v11 = v9;
    [(NSXPCConnection *)v10 setInvalidationHandler:&v12];
    [(NSXPCConnection *)self->_connection resume];
  }
}

uint64_t __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsValid:0];
}

uint64_t __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsValid:0];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TIPreferencesControllerClient;
  [(TIPreferencesController *)&v3 dealloc];
}

- (void)_disconnect
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  self->_isValid = 0;
}

+ (id)serviceInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC4A120];
}

@end