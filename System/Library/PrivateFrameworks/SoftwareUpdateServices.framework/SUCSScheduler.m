@interface SUCSScheduler
+ (BOOL)_callInProgress;
+ (BOOL)_getBoolForKeyPath:(id)a3;
+ (BOOL)_hasNetworkConnection;
+ (id)batteryLevelPredicate:(id)a3;
+ (id)carplayPredicate:(BOOL)a3;
+ (id)networkPredicate:(BOOL)a3;
+ (id)phoneCallPredicate:(BOOL)a3;
+ (int)_batteryLevel;
+ (int)_getIntForKeyPath:(id)a3;
- (SUCSScheduler)init;
- (void)dealloc;
- (void)registerInstallAlertConditionsWithHandler:(id)a3;
- (void)unregisterInstallationAlertAction;
@end

@implementation SUCSScheduler

- (SUCSScheduler)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUCSScheduler;
  v2 = [(SUCSScheduler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F351B8] userContext];
    context = v2->_context;
    v2->_context = (_CDContext *)v3;

    registration = v2->_registration;
    v2->_registration = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(SUCSScheduler *)self unregisterInstallationAlertAction];
  v3.receiver = self;
  v3.super_class = (Class)SUCSScheduler;
  [(SUCSScheduler *)&v3 dealloc];
}

- (void)registerInstallAlertConditionsWithHandler:(id)a3
{
  v23[4] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, __CFString *))a3;
  v5 = (void *)MEMORY[0x263F351F8];
  v6 = +[SUCSScheduler batteryLevelPredicate:&unk_26CEBD1C8];
  v23[0] = v6;
  objc_super v7 = +[SUCSScheduler phoneCallPredicate:0];
  v23[1] = v7;
  v8 = +[SUCSScheduler networkPredicate:1];
  v23[2] = v8;
  v9 = +[SUCSScheduler carplayPredicate:0];
  v23[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  v11 = [v5 andPredicateWithSubpredicates:v10];

  v12 = [MEMORY[0x263F351B8] userContext];
  LODWORD(v7) = [v12 evaluatePredicate:v11];

  if (v7)
  {
    SULogInfo(@"Installation alert predicate conditions met", v13, v14, v15, v16, v17, v18, v19, v22);
    v4[2](v4, @"com.apple.softwareupdateservicesd.installAlert");
  }
  else
  {
    v20 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.softwareupdateservicesd.installAlert" contextualPredicate:v11 callback:v4];
    registration = self->_registration;
    self->_registration = v20;

    [(_CDContext *)self->_context registerCallback:self->_registration];
  }
}

- (void)unregisterInstallationAlertAction
{
  if (self->_registration)
  {
    context = self->_context;
    if (context) {
      -[_CDContext deregisterCallback:](context, "deregisterCallback:");
    }
    self->_registration = 0;
    MEMORY[0x270F9A790]();
  }
}

+ (id)networkPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  v10[2] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263F351D0], "predicateForCellConnectionAvailability:");
  v5 = [MEMORY[0x263F351D0] predicateForWiFiConnectionAvailability:v3];
  v6 = (void *)MEMORY[0x263F351F8];
  v10[0] = v4;
  v10[1] = v5;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v8 = [v6 orPredicateWithSubpredicates:v7];

  return v8;
}

+ (id)phoneCallPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  v16[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F351F8];
  v5 = [MEMORY[0x263F351D0] keyPathForCallInProgressStatus];
  v6 = [NSNumber numberWithBool:v3];
  objc_super v7 = [v4 predicateForKeyPath:v5 equalToValue:v6];

  v8 = (void *)MEMORY[0x263F351F8];
  v9 = [MEMORY[0x263F351D0] keyPathForCallInProgressStatus];
  v10 = [MEMORY[0x263EFF9D0] null];
  v11 = [v8 predicateForKeyPath:v9 equalToValue:v10];

  v12 = (void *)MEMORY[0x263F351F8];
  v16[0] = v7;
  v16[1] = v11;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  uint64_t v14 = [v12 orPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)batteryLevelPredicate:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F351F8];
  v4 = (void *)MEMORY[0x263F351D0];
  id v5 = a3;
  v6 = [v4 keyPathForBatteryLevel];
  uint64_t v17 = [MEMORY[0x263F351D0] keyPathForBatteryLevel];
  objc_super v7 = [v3 predicateForKeyPath:v6 withFormat:@"self.%@.value >= %@"];

  if (v7) {
    id v15 = v7;
  }
  else {
    SULogInfo(@"Failed to create battery level _CDContextualPredicate", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v17);
  }

  return v7;
}

+ (id)carplayPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)MEMORY[0x263F351F8];
  id v5 = [MEMORY[0x263F351D0] keyPathForCarplayConnectedStatus];
  v6 = [NSNumber numberWithBool:v3];
  objc_super v7 = [v4 predicateForKeyPath:v5 equalToValue:v6];

  if (v7) {
    id v15 = v7;
  }
  else {
    SULogInfo(@"Failed to create carplay _CDContextualPredicate", v8, v9, v10, v11, v12, v13, v14, v17);
  }

  return v7;
}

+ (BOOL)_getBoolForKeyPath:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F351B8];
  id v4 = a3;
  id v5 = [v3 userContext];
  v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v5) = [v6 BOOLValue];
  return (char)v5;
}

+ (int)_getIntForKeyPath:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F351B8];
  id v4 = a3;
  id v5 = [v3 userContext];
  v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v5) = [v6 intValue];
  return (int)v5;
}

+ (int)_batteryLevel
{
  BOOL v3 = [MEMORY[0x263F351D0] keyPathForBatteryLevel];
  LODWORD(a1) = [a1 _getIntForKeyPath:v3];

  return (int)a1;
}

+ (BOOL)_callInProgress
{
  BOOL v3 = [MEMORY[0x263F351D0] keyPathForCallInProgressStatus];
  LOBYTE(a1) = [a1 _getBoolForKeyPath:v3];

  return (char)a1;
}

+ (BOOL)_hasNetworkConnection
{
  BOOL v3 = [MEMORY[0x263F351D0] keyPathForWiFiConnectionQuality];
  int v4 = [a1 _getIntForKeyPath:v3];

  id v5 = [MEMORY[0x263F351D0] keyPathForCellConnectionQuality];
  LODWORD(a1) = [a1 _getIntForKeyPath:v5];

  return (v4 & a1 & 0x80000000) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end