@interface PSUIDevicePasscodeState
+ (id)sharedInstance;
- (BOOL)isPasscodeSet;
- (PSUIDevicePasscodeState)init;
- (id)getLogger;
- (id)initPrivate;
@end

@implementation PSUIDevicePasscodeState

+ (id)sharedInstance
{
  if (qword_26AC32268 != -1) {
    dispatch_once(&qword_26AC32268, &__block_literal_global_6);
  }
  v2 = (void *)_MergedGlobals_59;
  return v2;
}

uint64_t __41__PSUIDevicePasscodeState_sharedInstance__block_invoke()
{
  _MergedGlobals_59 = [[PSUIDevicePasscodeState alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)PSUIDevicePasscodeState;
  return [(PSUIDevicePasscodeState *)&v3 init];
}

- (PSUIDevicePasscodeState)init
{
  v2 = [(PSUIDevicePasscodeState *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (BOOL)isPasscodeSet
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned int v3 = MKBGetDeviceLockState();
  v4 = [(PSUIDevicePasscodeState *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 67109120;
    LODWORD(v9) = v3;
    _os_log_debug_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEBUG, "MKBGetDeviceLockState : %d", (uint8_t *)&v8, 8u);
  }

  v5 = [(PSUIDevicePasscodeState *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = "OFF";
    if (v3 < 3) {
      v7 = "ON";
    }
    int v8 = 136315138;
    v9 = v7;
    _os_log_debug_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEBUG, "Passcode : %s", (uint8_t *)&v8, 0xCu);
  }

  return v3 < 3;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"keybag.st"];
}

@end