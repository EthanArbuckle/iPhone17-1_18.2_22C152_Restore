@interface PSUIDeviceCellularState
+ (id)sharedInstance;
- (BOOL)isConnectedOverCellular;
- (PSUIDeviceCellularState)init;
- (id)getLogger;
- (id)initPrivate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PSUIDeviceCellularState

+ (id)sharedInstance
{
  if (qword_26AC322A8 != -1) {
    dispatch_once(&qword_26AC322A8, &__block_literal_global_10);
  }
  v2 = (void *)_MergedGlobals_62;
  return v2;
}

uint64_t __41__PSUIDeviceCellularState_sharedInstance__block_invoke()
{
  _MergedGlobals_62 = [[PSUIDeviceCellularState alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v5.receiver = self;
  v5.super_class = (Class)PSUIDeviceCellularState;
  v2 = [(PSUIDeviceCellularState *)&v5 init];
  v3 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  [v3 addObserver:v2 forKeyPath:@"path" options:5 context:0];

  return v2;
}

- (PSUIDeviceCellularState)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSUIDeviceCellularState *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[PSUIDeviceCellularState init]";
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  [v3 removeObserver:self forKeyPath:@"path"];

  v4.receiver = self;
  v4.super_class = (Class)PSUIDeviceCellularState;
  [(PSUIDeviceCellularState *)&v4 dealloc];
}

- (BOOL)isConnectedOverCellular
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  objc_super v4 = [v3 path];

  if (!v4)
  {
    v6 = [(PSUIDeviceCellularState *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "[NWPathEvaluator path] empty", (uint8_t *)&v9, 2u);
    }
    goto LABEL_11;
  }
  if ([v4 status] != 1)
  {
    v6 = [(PSUIDeviceCellularState *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Network path is not available", (uint8_t *)&v9, 2u);
    }
LABEL_11:
    LOBYTE(v5) = 0;
    goto LABEL_12;
  }
  int v5 = [v4 usesInterfaceType:2];
  v6 = [(PSUIDeviceCellularState *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "OFF";
    if (v5) {
      v7 = "ON";
    }
    int v9 = 136315138;
    v10 = v7;
    _os_log_debug_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEBUG, "Cellular : %s", (uint8_t *)&v9, 0xCu);
  }
LABEL_12:

  return v5;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"cellular.st"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__PSUIDeviceCellularState_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__PSUIDeviceCellularState_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    objc_super v4 = "-[PSUIDeviceCellularState observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    __int16 v5 = 2112;
    v6 = @"PSCellularConnectivityChanged";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"PSCellularConnectivityChanged" object:0];
}

@end