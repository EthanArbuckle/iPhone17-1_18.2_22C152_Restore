@interface WPDPersistence
- (BOOL)isRangingEnabled;
- (BOOL)needsInit;
- (BOOL)readBoolPropertyValue:(id)a3;
- (BOOL)systemFirstUnlocked;
- (NSString)bootUUID;
- (WPDPersistence)init;
- (id)currentBootSessionUUID;
- (id)readStringPropertyValue:(id)a3;
- (void)dealloc;
- (void)deletePropertyValue:(id)a3;
- (void)firstUnlockedWithEvent:(BOOL)a3;
- (void)setBootUUID:(id)a3;
- (void)setIsRangingEnabled:(BOOL)a3;
- (void)setNeedsInit:(BOOL)a3;
- (void)setSystemFirstUnlocked:(BOOL)a3;
- (void)synchronisePrefs;
- (void)writeBoolProperty:(id)a3 Value:(BOOL)a4;
- (void)writeStringProperty:(id)a3 Value:(id)a4;
@end

@implementation WPDPersistence

- (WPDPersistence)init
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)WPDPersistence;
  v2 = [(WPDPersistence *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isRangingEnabled = 256;
    v2->_systemFirstUnlocked = 0;
    uint64_t v4 = [(WPDPersistence *)v2 currentBootSessionUUID];
    bootUUID = v3->_bootUUID;
    v3->_bootUUID = (NSString *)v4;

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_3);
    }
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v3->_bootUUID;
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "WPDPersistence initialized with BootUUID %{public}@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)dealloc
{
  [(WPDPersistence *)self synchronisePrefs];
  v3.receiver = self;
  v3.super_class = (Class)WPDPersistence;
  [(WPDPersistence *)&v3 dealloc];
}

- (BOOL)isRangingEnabled
{
  return self->_isRangingEnabled;
}

- (void)setIsRangingEnabled:(BOOL)a3
{
  self->_needsInit = 0;
  self->_isRangingEnabled = a3;
  if (self->_systemFirstUnlocked)
  {
    [(WPDPersistence *)self writeBoolProperty:@"WPRangingEnabled" Value:a3];
    bootUUID = self->_bootUUID;
    [(WPDPersistence *)self writeStringProperty:@"WPBootUUID" Value:bootUUID];
  }
}

- (id)currentBootSessionUUID
{
  size_t size = 0;
  if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    v2 = (char *)malloc_type_malloc(size, 0x593B2B58uLL);
    if (!sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0))
    {
      v5 = strdup(v2);
      currentBootSessionUUID_bootSessionUUIDStr = (uint64_t)v5;
      free(v2);
      if (v5)
      {
        v6 = [NSString stringWithUTF8String:v5];
        v7 = (void *)currentBootSessionUUID_bootSessionUUIDStr;
      }
      else
      {
        v7 = 0;
        v6 = @"fake BootUUID";
      }
      free(v7);
      objc_super v3 = v6;
      goto LABEL_5;
    }
    free(v2);
  }
  objc_super v3 = @"fake BootUUID";
LABEL_5:

  return v3;
}

- (void)firstUnlockedWithEvent:(BOOL)a3
{
  BOOL v3 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_12);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDPersistence firstUnlockedWithEvent:](v3, v5);
  }
  [(WPDPersistence *)self setSystemFirstUnlocked:1];
  if (v3) {
    [(WPDPersistence *)self setNeedsInit:0];
  }
  if ([(WPDPersistence *)self needsInit])
  {
    v6 = [(WPDPersistence *)self readStringPropertyValue:@"WPBootUUID"];
    if (v6)
    {
      v7 = [(WPDPersistence *)self bootUUID];
      int v8 = [v7 isEqual:v6];

      if (v8)
      {
        [(WPDPersistence *)self setIsRangingEnabled:[(WPDPersistence *)self readBoolPropertyValue:@"WPRangingEnabled"]];
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_15);
        }
        objc_super v9 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPDPersistence firstUnlockedWithEvent:](v9, self);
        }
      }
    }
  }
  [(WPDPersistence *)self setIsRangingEnabled:self->_isRangingEnabled];
}

- (void)synchronisePrefs
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = a1;
  v6[0] = 67109376;
  v6[1] = a3;
  __int16 v7 = 1024;
  int v8 = [a2 systemFirstUnlocked];
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "WPDPersistence synchronised: %d (firstUnlocked: %d)", (uint8_t *)v6, 0xEu);
}

- (void)deletePropertyValue:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  uint64_t v4 = (void *)MEMORY[0x223CB05A0]();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_22);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDPersistence deletePropertyValue:]((uint64_t)v3, v5);
  }
  CFPreferencesSetAppValue(v3, 0, @"com.apple.BTServer");
}

- (BOOL)readBoolPropertyValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = (__CFString *)a3;
  uint64_t v4 = (void *)MEMORY[0x223CB05A0]();
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, @"com.apple.BTServer", &keyExistsAndHasValidFormat);
  int v6 = AppBooleanValue;
  if (keyExistsAndHasValidFormat) {
    BOOL v7 = AppBooleanValue == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_24);
  }
  uint64_t v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v13 = v3;
    __int16 v14 = 1024;
    BOOL v15 = v8;
    __int16 v16 = 1024;
    int v17 = keyExistsAndHasValidFormat;
    __int16 v18 = 1024;
    int v19 = v6;
    _os_log_debug_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEBUG, "WPDPersistence read %@ : %d (found:%d got:%d)", buf, 0x1Eu);
  }

  return v8;
}

- (void)writeBoolProperty:(id)a3 Value:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = (__CFString *)a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_26);
  }
  BOOL v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDPersistence writeBoolProperty:Value:]((uint64_t)v6, v4, v7);
  }
  BOOL v8 = (void *)MEMORY[0x223CB05A0]();
  uint64_t v9 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!v4) {
    uint64_t v9 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(v6, *v9, @"com.apple.BTServer");
  [(WPDPersistence *)self synchronisePrefs];
}

- (id)readStringPropertyValue:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  BOOL v4 = (void *)MEMORY[0x223CB05A0]();
  CFPropertyListRef v5 = CFPreferencesCopyAppValue(v3, @"com.apple.BTServer");
  if (v5)
  {
    int v6 = (void *)v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFStringGetTypeID()) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    id v8 = 0;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_28);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDPersistence readStringPropertyValue:]();
  }

  return v8;
}

- (void)writeStringProperty:(id)a3 Value:(id)a4
{
  int v6 = (__CFString *)a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_30);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDPersistence writeStringProperty:Value:]();
  }
  id v8 = (void *)MEMORY[0x223CB05A0]();
  CFPreferencesSetAppValue(v6, v7, @"com.apple.BTServer");
  [(WPDPersistence *)self synchronisePrefs];
}

- (BOOL)needsInit
{
  return self->_needsInit;
}

- (void)setNeedsInit:(BOOL)a3
{
  self->_needsInit = a3;
}

- (BOOL)systemFirstUnlocked
{
  return self->_systemFirstUnlocked;
}

- (void)setSystemFirstUnlocked:(BOOL)a3
{
  self->_systemFirstUnlocked = a3;
}

- (NSString)bootUUID
{
  return self->_bootUUID;
}

- (void)setBootUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)firstUnlockedWithEvent:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 isRangingEnabled];
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "WPDPersistence restored isRangingEnabled: %d", (uint8_t *)v4, 8u);
}

- (void)firstUnlockedWithEvent:(char)a1 .cold.2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "WPDPersistence firstUnlockedWithEvent: %d", (uint8_t *)v2, 8u);
}

- (void)deletePropertyValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "WPDPersistence delete %@", (uint8_t *)&v2, 0xCu);
}

- (void)writeBoolProperty:(os_log_t)log Value:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPDPersistence write %@: %d", (uint8_t *)&v3, 0x12u);
}

- (void)readStringPropertyValue:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22316D000, v0, v1, "WPDPersistence read %@ : %@");
}

- (void)writeStringProperty:Value:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22316D000, v0, v1, "WPDPersistence write %@: %@");
}

@end