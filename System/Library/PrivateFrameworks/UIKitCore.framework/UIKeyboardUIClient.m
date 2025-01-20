@interface UIKeyboardUIClient
+ (id)serviceInterface;
+ (id)sharedInstance;
- (UIKeyboardUIClient)init;
- (id)snapshotViewForOptions:(unint64_t)a3;
- (void)_initConnectionIfNeeded;
- (void)dealloc;
- (void)setKeyboardAlpha:(double)a3 force:(BOOL)a4;
@end

@implementation UIKeyboardUIClient

+ (id)serviceInterface
{
  if (qword_1EB261EE0 != -1) {
    dispatch_once(&qword_1EB261EE0, &__block_literal_global_4_14);
  }
  v2 = (void *)qword_1EB261ED8;
  return v2;
}

void __38__UIKeyboardUIClient_serviceInterface__block_invoke()
{
  id v4 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:0x1ED16DA20];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED6578B0];
  [v4 setServer:v0];

  v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED701180];
  [v4 setClient:v1];

  [v4 setClientMessagingExpectation:1];
  uint64_t v2 = [v4 copy];
  v3 = (void *)qword_1EB261ED8;
  qword_1EB261ED8 = v2;
}

+ (id)sharedInstance
{
  if (qword_1EB261EE8 != -1) {
    dispatch_once(&qword_1EB261EE8, &__block_literal_global_12_6);
  }
  uint64_t v2 = (void *)qword_1EB261EF0;
  return v2;
}

void __36__UIKeyboardUIClient_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardUIClient);
  v1 = (void *)qword_1EB261EF0;
  qword_1EB261EF0 = (uint64_t)v0;
}

- (UIKeyboardUIClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardUIClient;
  uint64_t v2 = [(UIKeyboardUIClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UIKeyboardUIClient *)v2 _initConnectionIfNeeded];
  }
  return v3;
}

- (void)dealloc
{
  [(BSServiceConnectionClient *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardUIClient;
  [(UIKeyboardUIClient *)&v4 dealloc];
}

- (void)_initConnectionIfNeeded
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (!self->_connection)
  {
    v3 = [MEMORY[0x1E4F62888] endpointForMachName:0x1ED16DA20 service:0x1ED16DA20 instance:0];
    if (v3)
    {
      objc_super v4 = [(id)objc_opt_class() serviceInterface];
      objc_initWeak(location, self);
      objc_super v5 = KeyboardUIClientLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Trying to establish BSServiceConnection to keyboard UI service.", buf, 2u);
      }

      v6 = [MEMORY[0x1E4F62880] connectionWithEndpoint:v3];
      connection = self->_connection;
      self->_connection = v6;

      v8 = self->_connection;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke;
      v15[3] = &unk_1E52FE8D0;
      v9 = v4;
      v16 = v9;
      v17 = self;
      objc_copyWeak(&v18, location);
      [(BSServiceConnectionClient *)v8 configureConnection:v15];
      [(BSServiceConnectionClient *)self->_connection activate];
      v10 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
      v11 = self->_connection;
      v20 = v10;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      v13 = [(BSServiceConnectionClient *)v11 remoteTargetWithLaunchingAssertionAttributes:v12];
      remoteTarget = self->_remoteTarget;
      self->_remoteTarget = v13;

      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
    }
    else
    {
      v9 = KeyboardUIClientLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = @"com.apple.inputservice.keyboardui";
        _os_log_error_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Failed to create endpoint for %@", (uint8_t *)location, 0xCu);
      }
    }
  }
}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetQueue:MEMORY[0x1E4F14428]];
  objc_super v4 = [MEMORY[0x1E4F628B0] userInteractive];
  [v3 setServiceQuality:v4];

  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  [v3 setActivationHandler:&__block_literal_global_22_1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_23;
  v7[3] = &unk_1E52FE8A8;
  a1 += 48;
  objc_copyWeak(&v8, (id *)a1);
  [v3 setInterruptionHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_24;
  v5[3] = &unk_1E52FE8A8;
  objc_copyWeak(&v6, (id *)a1);
  [v3 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = KeyboardUIClientLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "BSServiceConnection for keyboard UI is activated: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = KeyboardUIClientLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "BSServiceConnection for keyboard UI was interrupted: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 1) invalidate];
    v7 = (void *)v6[1];
    v6[1] = 0;

    id v8 = (void *)v6[2];
    v6[2] = 0;
  }
}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = KeyboardUIClientLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "BSServiceConnection for keyboard UI was invalidated: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 1) invalidate];
    v7 = (void *)v6[1];
    v6[1] = 0;

    id v8 = (void *)v6[2];
    v6[2] = 0;
  }
}

- (id)snapshotViewForOptions:(unint64_t)a3
{
  [(UIKeyboardUIClient *)self _initConnectionIfNeeded];
  remoteTarget = self->_remoteTarget;
  if (remoteTarget
    && ([NSNumber numberWithUnsignedInteger:a3],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [(UIKeyboardUIServiceProtocol *)remoteTarget snapshotForOptions:v6],
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    id v8 = [UIKeyboardUISnapshotView alloc];
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v7 size];
    v13 = -[UIView initWithFrame:](v8, "initWithFrame:", v9, v10, v11, v12);
    [(UIKeyboardUISnapshotView *)v13 setSnapshot:v7];
    v14 = KeyboardUIClientLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "Received keyboard snapshot", buf, 2u);
    }
  }
  else
  {
    v15 = KeyboardUIClientLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "Failed to retrieve snapshot.", v18, 2u);
    }

    v16 = [UIView alloc];
    v13 = -[UIView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  return v13;
}

- (void)setKeyboardAlpha:(double)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v7 = KeyboardUIClientLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218240;
    double v13 = a3;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Setting keyboard alpha: %f, force=%d", (uint8_t *)&v12, 0x12u);
  }

  remoteTarget = self->_remoteTarget;
  double v9 = [NSNumber numberWithDouble:a3];
  double v10 = [NSNumber numberWithBool:v4];
  double v11 = [NSNumber numberWithInt:getpid()];
  [(UIKeyboardUIServiceProtocol *)remoteTarget setKeyboardAlpha:v9 force:v10 processId:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTarget, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end