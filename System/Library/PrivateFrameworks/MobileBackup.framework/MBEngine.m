@interface MBEngine
+ (id)stringForEngineMode:(int)a3;
+ (id)stringForEngineType:(int)a3;
+ (id)stringForRestoreType:(int)a3;
- (BOOL)backsUpPrimaryAccount;
- (BOOL)cancel;
- (BOOL)cancelWithError:(id)a3;
- (BOOL)cancelWithReason:(int64_t)a3;
- (BOOL)encrypted;
- (BOOL)fetchDeviceToDeviceEncryptionSupportedByAccount:(BOOL *)a3 error:(id *)a4;
- (BOOL)isBackgroundRestore;
- (BOOL)isBackupEngine;
- (BOOL)isCanceled;
- (BOOL)isCloudKitEngine;
- (BOOL)isDeviceTransferEngine;
- (BOOL)isDriveEngine;
- (BOOL)isForegroundRestore;
- (BOOL)isRestoreEngine;
- (BOOL)isServiceEngine;
- (MBAnalyticsEvent)analyticsEvent;
- (MBAppManager)appManager;
- (MBDebugContext)debugContext;
- (MBDomainManager)domainManager;
- (MBEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5;
- (MBPersona)persona;
- (MBProperties)preflightProperties;
- (MBProperties)properties;
- (MBSettingsContext)settingsContext;
- (MBWatchdog)watchdog;
- (NSError)cancelError;
- (NSString)engineModeString;
- (NSString)restoreTypeString;
- (OS_voucher)clientVoucher;
- (int)engineMode;
- (int)engineType;
- (int)restoreType;
- (int64_t)backupPolicy;
- (unint64_t)enginePolicy;
- (void)setAnalyticsEvent:(id)a3;
- (void)setCancelError:(id)a3;
- (void)setClientVoucher:(id)a3;
- (void)setEncrypted:(BOOL)a3;
- (void)setWatchdog:(id)a3;
@end

@implementation MBEngine

+ (id)stringForEngineType:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return off_100416660[a3 - 1];
  }
}

+ (id)stringForEngineMode:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_100416680[a3 - 1];
  }
}

+ (id)stringForRestoreType:(int)a3
{
  CFStringRef v3 = @"Background";
  if (a3 != 2) {
    CFStringRef v3 = 0;
  }
  if (a3 == 1) {
    return @"Foreground";
  }
  else {
    return (id)v3;
  }
}

- (MBEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MBEngine;
  v13 = [(MBEngine *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_settingsContext, a3);
    objc_storeStrong((id *)&v14->_debugContext, a4);
    objc_storeStrong((id *)&v14->_domainManager, a5);
    uint64_t v15 = voucher_copy();
    clientVoucher = v14->_clientVoucher;
    v14->_clientVoucher = (OS_voucher *)v15;

    id v22 = 0;
    uint64_t v17 = +[MBPersona personalPersonaWithError:&v22];
    id v18 = v22;
    personalPersona = v14->_personalPersona;
    v14->_personalPersona = (MBPersona *)v17;

    if (!v14->_personalPersona)
    {
      v21 = +[NSAssertionHandler currentHandler];
      [v21 handleFailureInMethod:a2, v14, @"MBEngine.m", 109, @"Unable to obtain personal persona: %@", v18 object file lineNumber description];
    }
  }

  return v14;
}

- (MBPersona)persona
{
  return self->_personalPersona;
}

- (int)engineType
{
  return 0;
}

- (BOOL)isDriveEngine
{
  unsigned int v3 = [(MBEngine *)self engineType];
  if (v3 != 1) {
    LOBYTE(v3) = [(MBEngine *)self engineType] == 4;
  }
  return v3;
}

- (BOOL)isServiceEngine
{
  return [(MBEngine *)self engineType] == 2 || [(MBEngine *)self engineType] == 3;
}

- (BOOL)isCloudKitEngine
{
  return [(MBEngine *)self engineType] == 3;
}

- (BOOL)isDeviceTransferEngine
{
  return [(MBEngine *)self engineType] == 4;
}

- (int)engineMode
{
  return 0;
}

- (NSString)engineModeString
{
  uint64_t v2 = [(MBEngine *)self engineMode];
  return (NSString *)+[MBEngine stringForEngineMode:v2];
}

- (BOOL)isBackupEngine
{
  return [(MBEngine *)self engineMode] == 1;
}

- (BOOL)isRestoreEngine
{
  return [(MBEngine *)self engineMode] == 2;
}

- (int)restoreType
{
  return 0;
}

- (NSString)restoreTypeString
{
  uint64_t v2 = [(MBEngine *)self restoreType];
  return (NSString *)+[MBEngine stringForRestoreType:v2];
}

- (BOOL)isForegroundRestore
{
  BOOL v3 = [(MBEngine *)self isRestoreEngine];
  if (v3) {
    LOBYTE(v3) = [(MBEngine *)self restoreType] == 1;
  }
  return v3;
}

- (BOOL)isBackgroundRestore
{
  BOOL v3 = [(MBEngine *)self isRestoreEngine];
  if (v3) {
    LOBYTE(v3) = [(MBEngine *)self restoreType] == 2;
  }
  return v3;
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v2 & 1;
}

- (BOOL)cancelWithError:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@: %{public}@", buf, 0x16u);
      v13 = self;
      id v14 = v4;
      _MBLog();
    }

    v7 = [(MBEngine *)self cancelError];

    if (!v7)
    {
      if (!v4)
      {
        v8 = [(MBEngine *)self engineModeString];
        id v4 = +[MBError errorWithCode:202, @"%@ cancelled", v8 format];
      }
      -[MBEngine setCancelError:](self, "setCancelError:", v4, v13, v14);
    }
    unsigned __int8 v9 = atomic_exchange((atomic_uchar *volatile)&self->_canceled, 1u);
    id v10 = [(MBEngine *)self cancelError];
    if (!v10) {
      __assert_rtn("-[MBEngine cancelWithError:]", "MBEngine.m", 186, "self.cancelError");
    }

    BOOL v11 = v9 & 1;
  }

  return v11;
}

- (BOOL)cancelWithReason:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(MBEngine *)self engineModeString];
    +[MBError errorWithCode:202, @"%@ cancelled (XPC connection invalidated)", v4 format];
  }
  else
  {
    if (a3)
    {
      unsigned __int8 v5 = 0;
      goto LABEL_7;
    }
    id v4 = [(MBEngine *)self engineModeString];
    +[MBError errorWithCode:202, @"%@ cancelled", v4 format];
  unsigned __int8 v5 = };

LABEL_7:
  BOOL v6 = [(MBEngine *)self cancelWithError:v5];

  return v6;
}

- (BOOL)cancel
{
  return [(MBEngine *)self cancelWithError:0];
}

- (BOOL)fetchDeviceToDeviceEncryptionSupportedByAccount:(BOOL *)a3 error:(id *)a4
{
}

- (BOOL)backsUpPrimaryAccount
{
  if ([(MBEngine *)self isDriveEngine]) {
    return 1;
  }
  return [(MBEngine *)self isServiceEngine];
}

- (int64_t)backupPolicy
{
  return [(MBSettingsContext *)self->_settingsContext backupPolicy];
}

- (unint64_t)enginePolicy
{
  unint64_t v3 = [(MBEngine *)self isCloudKitEngine];
  if ([(MBEngine *)self isDriveEngine]) {
    v3 |= 2uLL;
  }
  if ([(MBEngine *)self isDeviceTransferEngine]) {
    v3 |= 4uLL;
  }
  if ([(MBEngine *)self encrypted]) {
    v3 |= 0x10uLL;
  }
  if ([(MBEngine *)self isServiceEngine]) {
    v3 |= 8uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(MBEngine *)self shouldCommitIfPossible])
  {
    v3 |= 0x40uLL;
  }
  if ((id)[(MBEngine *)self backupPolicy] == (id)1) {
    v3 |= 0x20uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(MBEngine *)self isRestoringToSameDevice])
  {
    v3 |= 0x80uLL;
  }
  return v3;
}

- (MBSettingsContext)settingsContext
{
  return self->_settingsContext;
}

- (MBDebugContext)debugContext
{
  return self->_debugContext;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (MBProperties)preflightProperties
{
  return self->_preflightProperties;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void)setEncrypted:(BOOL)a3
{
  self->_encrypted = a3;
}

- (NSError)cancelError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCancelError:(id)a3
{
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (MBAppManager)appManager
{
  return self->_appManager;
}

- (MBWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (MBAnalyticsEvent)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
}

- (OS_voucher)clientVoucher
{
  return self->_clientVoucher;
}

- (void)setClientVoucher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVoucher, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_personalPersona, 0);
  objc_storeStrong((id *)&self->_appManager, 0);
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_preflightProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_debugContext, 0);
  objc_storeStrong((id *)&self->_settingsContext, 0);
}

@end