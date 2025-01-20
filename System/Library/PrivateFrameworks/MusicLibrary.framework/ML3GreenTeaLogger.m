@interface ML3GreenTeaLogger
+ (void)logOnceForAccessor:(id)a3;
- (ML3GreenTeaLogger)initWithAccessorName:(id)a3;
- (void)beginLogAccessInterval;
- (void)dealloc;
- (void)endLogAccessInterval;
- (void)logAccess;
@end

@implementation ML3GreenTeaLogger

- (void)logAccess
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  os_unfair_lock_lock(&self->_lock);
  double lastLogTime = self->_lastLogTime;
  os_unfair_lock_unlock(&self->_lock);
  if (v4 - lastLogTime > 0.1)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_double lastLogTime = v4;
    os_unfair_lock_unlock(&self->_lock);
    v6 = getCTGreenTeaOsLogHandle();
    v7 = v6;
    if (v6)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = [(NSString *)self->_accessor UTF8String];
        int v9 = 136315138;
        v10 = v8;
        _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_INFO, "MediaLibrary accessed by %s", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (ML3GreenTeaLogger)initWithAccessorName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v6 = [v7 bundleIdentifier];
  }
  if (ML3GreenTeaIsLoggableBundleIdentifier(v6))
  {
    v11.receiver = self;
    v11.super_class = (Class)ML3GreenTeaLogger;
    v8 = [(ML3GreenTeaLogger *)&v11 init];
    if (v8)
    {
      v8->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
      objc_storeStrong((id *)&v8->_accessor, v6);
      v8->_lock._os_unfair_lock_opaque = 0;
      v8->_double lastLogTime = 0.0;
    }
    self = v8;
    int v9 = self;
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ML3GreenTeaLogger;
  [(ML3GreenTeaLogger *)&v3 dealloc];
}

- (void)endLogAccessInterval
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = getCTGreenTeaOsLogHandle();
  id v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = [(NSString *)self->_accessor UTF8String];
    int v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_INFO, "MediaLibrary accessed ended by %s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)beginLogAccessInterval
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = getCTGreenTeaOsLogHandle();
  id v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = [(NSString *)self->_accessor UTF8String];
    int v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_INFO, "MediaLibrary accessed begun by %s", (uint8_t *)&v6, 0xCu);
  }
}

+ (void)logOnceForAccessor:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v6 bundleIdentifier];
  }
  if (ML3GreenTeaIsLoggableBundleIdentifier(v5))
  {
    ct_green_tea_logger_create();
    v7 = getCTGreenTeaOsLogHandle();
    uint64_t v8 = v7;
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = [v5 UTF8String];
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_INFO, "MediaLibrary accessed by %s", (uint8_t *)&v9, 0xCu);
    }

    ct_green_tea_logger_destroy();
  }
}

@end