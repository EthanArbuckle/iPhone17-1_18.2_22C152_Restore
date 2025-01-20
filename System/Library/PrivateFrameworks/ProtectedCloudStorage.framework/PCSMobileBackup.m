@interface PCSMobileBackup
+ (id)defaultMobileBackup;
- (BOOL)isBackupEnabled;
- (MBManager)backupManager;
- (PCSMobileBackup)init;
- (void)setBackupManager:(id)a3;
@end

@implementation PCSMobileBackup

+ (id)defaultMobileBackup
{
  if (defaultMobileBackup_onceToken != -1) {
    dispatch_once(&defaultMobileBackup_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)defaultMobileBackup_mb;
  return v2;
}

uint64_t __38__PCSMobileBackup_defaultMobileBackup__block_invoke()
{
  defaultMobileBackup_mb = objc_alloc_init(PCSMobileBackup);
  return MEMORY[0x1F41817F8]();
}

- (PCSMobileBackup)init
{
  v10.receiver = self;
  v10.super_class = (Class)PCSMobileBackup;
  v2 = [(PCSMobileBackup *)&v10 init];
  if (v2)
  {
    if (dlopen("/System/Library/PrivateFrameworks/MobileBackup.framework/MobileBackup", 2)
      && (objc_getClass("MBManager"), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = (void *)v3;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Monitoring backup status with MBManager", v9, 2u);
      }
      uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "alloc"), "initWithDelegate:", v2);
      backupManager = v2->_backupManager;
      v2->_backupManager = (MBManager *)v5;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to use MBManager", v9, 2u);
    }
    v7 = v2;
  }

  return v2;
}

- (BOOL)isBackupEnabled
{
  if (_PCSMobileBackupOverride == -1)
  {
    int v3 = [(MBManager *)self->_backupManager isBackupEnabled];
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v2)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Mobile backup is enabled", buf, 2u);
      }
      LOBYTE(v2) = 1;
    }
    else if (v2)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Mobile backup is disabled", v5, 2u);
      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = _PCSMobileBackupOverride != 0;
  }
  return v2;
}

- (MBManager)backupManager
{
  return (MBManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBackupManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end