@interface SUCoreActivity
+ (BOOL)supportsSecureCoding;
+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4;
+ (id)backlightOnPredicate:(BOOL)a3;
+ (id)batteryLevelPredicateGreaterThan:(id)a3;
+ (id)batteryLevelPredicateLessThan:(id)a3;
+ (id)carplayPredicate:(BOOL)a3;
+ (id)mediaPlayingPredicate:(BOOL)a3;
+ (id)networkPredicate:(BOOL)a3;
+ (id)phoneCallPredicate:(BOOL)a3;
+ (id)pluggedInPredicate:(BOOL)a3;
+ (id)systemDatePredicate:(id)a3;
+ (id)wifiAvailablePredicate:(BOOL)a3;
- (BOOL)_BOOLForTriState:(int)a3 defaultValue:(BOOL)a4;
- (BOOL)_mustWake;
- (BOOL)isEqual:(id)a3;
- (NSDate)runDate;
- (NSNumber)batteryLevelGreaterThan;
- (NSNumber)batteryLevelLessThan;
- (NSString)UUID;
- (NSString)activityName;
- (SUCoreActivity)initWithActivityName:(id)a3 options:(id)a4;
- (SUCoreActivity)initWithCoder:(id)a3;
- (id)_clientIdentifier;
- (id)_dismissalPredicate;
- (id)_stringForTriState:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createContextualPredicate;
- (id)createRegistrationWithHandler:(id)a3;
- (id)description;
- (int)carplayState;
- (int)mediaPlayingState;
- (int)networkState;
- (int)phoneCallState;
- (int)plugInState;
- (int)screenOnState;
- (int)waking;
- (int)wifiState;
- (unint64_t)_deviceSet;
- (unsigned)_qualityOfService;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityName:(id)a3;
- (void)setBatteryLevelGreaterThan:(id)a3;
- (void)setBatteryLevelLessThan:(id)a3;
- (void)setCarplayState:(int)a3;
- (void)setMediaPlayingState:(int)a3;
- (void)setNetworkState:(int)a3;
- (void)setPhoneCallState:(int)a3;
- (void)setPlugInState:(int)a3;
- (void)setRunDate:(id)a3;
- (void)setScreenOnState:(int)a3;
- (void)setUUID:(id)a3;
- (void)setWaking:(int)a3;
- (void)setWifiState:(int)a3;
@end

@implementation SUCoreActivity

- (SUCoreActivity)initWithActivityName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SUCoreActivity;
  v9 = [(SUCoreActivity *)&v24 init];
  if (v9)
  {
    if (objc_opt_class())
    {
      objc_storeStrong((id *)&v9->_activityName, a3);
      v10 = [MEMORY[0x263F08C38] UUID];
      uint64_t v11 = [v10 UUIDString];
      UUID = v9->_UUID;
      v9->_UUID = (NSString *)v11;

      uint64_t v13 = [v8 runDate];
      runDate = v9->_runDate;
      v9->_runDate = (NSDate *)v13;

      uint64_t v15 = [v8 batteryLevelGreaterThan];
      batteryLevelGreaterThan = v9->_batteryLevelGreaterThan;
      v9->_batteryLevelGreaterThan = (NSNumber *)v15;

      uint64_t v17 = [v8 batteryLevelLessThan];
      batteryLevelLessThan = v9->_batteryLevelLessThan;
      v9->_batteryLevelLessThan = (NSNumber *)v17;

      if (v8)
      {
        v9->_plugInState = [v8 plugInState];
        v9->_screenOnState = [v8 screenOnState];
        v9->_networkState = [v8 networkState];
        v9->_wifiState = [v8 wifiState];
        v9->_phoneCallState = [v8 phoneCallState];
        v9->_carplayState = [v8 carplayState];
        v9->_mediaPlayingState = [v8 mediaPlayingState];
        int v19 = [v8 waking];
      }
      else
      {
        int v19 = 0;
        *(void *)&v9->_plugInState = 0;
        *(void *)&v9->_networkState = 0;
        v9->_mediaPlayingState = 0;
        *(void *)&v9->_phoneCallState = 0;
      }
      v9->_waking = v19;
    }
    else
    {
      v20 = [MEMORY[0x263F77DE8] sharedLogger];
      v21 = [v20 oslog];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_20C8EA000, v21, OS_LOG_TYPE_DEFAULT, "CoreDuet Context Store symbols not recognized. Returning null SUCoreActivity", v23, 2u);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (id)createRegistrationWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F351E0];
  id v5 = a3;
  v6 = [(SUCoreActivity *)self activityName];
  id v7 = [(SUCoreActivity *)self createContextualPredicate];
  id v8 = [(SUCoreActivity *)self _dismissalPredicate];
  unint64_t v9 = [(SUCoreActivity *)self _deviceSet];
  v10 = [(SUCoreActivity *)self _clientIdentifier];
  BOOL v11 = [(SUCoreActivity *)self _mustWake];
  LODWORD(v16) = [(SUCoreActivity *)self _qualityOfService];
  v12 = [v4 registrationWithIdentifier:v6 contextualPredicate:v7 dismissalPolicy:v8 deviceSet:v9 clientIdentifier:v10 mustWake:v11 qualityOfService:v16 callback:v5];

  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x263F77DE8] sharedLogger];
    v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create registration", buf, 2u);
    }
  }

  return v12;
}

- (BOOL)_mustWake
{
  uint64_t v3 = [(SUCoreActivity *)self waking];

  return [(SUCoreActivity *)self _BOOLForTriState:v3 defaultValue:0];
}

- (unsigned)_qualityOfService
{
  v2 = [(SUCoreActivity *)self runDate];
  if (v2) {
    unsigned int v3 = 25;
  }
  else {
    unsigned int v3 = 9;
  }

  return v3;
}

- (unint64_t)_deviceSet
{
  return 0;
}

- (id)_dismissalPredicate
{
  return 0;
}

- (id)_clientIdentifier
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  unsigned int v3 = [v2 bundleIdentifier];

  return v3;
}

- (BOOL)_BOOLForTriState:(int)a3 defaultValue:(BOOL)a4
{
  if (a3 == 1) {
    a4 = 0;
  }
  return a3 == 2 || a4;
}

- (id)createContextualPredicate
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SUCoreActivity *)self runDate];

  if (v4)
  {
    id v5 = [(SUCoreActivity *)self runDate];
    v6 = +[SUCoreActivity systemDatePredicate:v5];
    [v3 addObject:v6];
  }
  id v7 = [(SUCoreActivity *)self batteryLevelGreaterThan];

  if (v7)
  {
    id v8 = [(SUCoreActivity *)self batteryLevelGreaterThan];
    unint64_t v9 = +[SUCoreActivity batteryLevelPredicateGreaterThan:v8];
    [v3 addObject:v9];
  }
  v10 = [(SUCoreActivity *)self batteryLevelLessThan];

  if (v10)
  {
    BOOL v11 = [(SUCoreActivity *)self batteryLevelLessThan];
    v12 = +[SUCoreActivity batteryLevelPredicateLessThan:v11];
    [v3 addObject:v12];
  }
  if ([(SUCoreActivity *)self plugInState])
  {
    uint64_t v13 = +[SUCoreActivity pluggedInPredicate:[(SUCoreActivity *)self plugInState] == 2];
    [v3 addObject:v13];
  }
  if ([(SUCoreActivity *)self screenOnState])
  {
    v14 = +[SUCoreActivity backlightOnPredicate:[(SUCoreActivity *)self screenOnState] != 0];
    [v3 addObject:v14];
  }
  if ([(SUCoreActivity *)self networkState])
  {
    uint64_t v15 = +[SUCoreActivity networkPredicate:[(SUCoreActivity *)self networkState] != 0];
    [v3 addObject:v15];
  }
  if ([(SUCoreActivity *)self wifiState])
  {
    uint64_t v16 = +[SUCoreActivity wifiAvailablePredicate:[(SUCoreActivity *)self wifiState] != 0];
    [v3 addObject:v16];
  }
  if ([(SUCoreActivity *)self phoneCallState])
  {
    uint64_t v17 = +[SUCoreActivity phoneCallPredicate:[(SUCoreActivity *)self phoneCallState] != 0];
    [v3 addObject:v17];
  }
  if ([(SUCoreActivity *)self carplayState])
  {
    v18 = +[SUCoreActivity carplayPredicate:[(SUCoreActivity *)self carplayState] != 0];
    [v3 addObject:v18];
  }
  if ([(SUCoreActivity *)self mediaPlayingState])
  {
    int v19 = +[SUCoreActivity mediaPlayingPredicate:[(SUCoreActivity *)self mediaPlayingState] != 0];
    [v3 addObject:v19];
  }
  v20 = [MEMORY[0x263F35200] andPredicateWithSubpredicates:v3];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    v23 = [MEMORY[0x263F77DE8] sharedLogger];
    objc_super v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      v27 = self;
      _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "Failed to create _CDContextualPredicate for SUActivity: %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }

  return v21;
}

- (id)_stringForTriState:(int)a3
{
  if (a3 > 2) {
    return @"UNKNOWN";
  }
  else {
    return off_2640DD7C8[a3];
  }
}

- (id)description
{
  id v15 = (id)NSString;
  v20 = [(SUCoreActivity *)self activityName];
  int v19 = [(SUCoreActivity *)self UUID];
  unsigned int v3 = (void *)MEMORY[0x263F08790];
  uint64_t v17 = [(SUCoreActivity *)self runDate];
  v18 = [v3 localizedStringFromDate:v17 dateStyle:1 timeStyle:2];
  v4 = [(SUCoreActivity *)self batteryLevelLessThan];
  v14 = [(SUCoreActivity *)self batteryLevelLessThan];
  id v5 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self plugInState]];
  v6 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self screenOnState]];
  id v7 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self networkState]];
  id v8 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self wifiState]];
  unint64_t v9 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self phoneCallState]];
  v10 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self carplayState]];
  BOOL v11 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self mediaPlayingState]];
  v12 = [(SUCoreActivity *)self _stringForTriState:[(SUCoreActivity *)self waking]];
  id v16 = [v15 stringWithFormat:@"\n            ActivityName:       %@\n            UUID:               %@\n            runDate:            %@\n            batteryLevelGT:     %@\n            batteryLevelLT:     %@\n            plugInState:        %@\n            screenOnState:      %@\n            networkState:       %@\n            wifiState:          %@\n            phonecallState:     %@\n            carplayState:       %@\n            mediaPlayingState:  %@\n            waking:             %@\n", v20, v19, v18, v4, v14, v5, v6, v7, v8, v9, v10, v11, v12];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUCoreActivity *)a3;
  if (v4 == self)
  {
    BOOL v34 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = (void *)MEMORY[0x263F77D78];
      id v7 = [(SUCoreActivity *)self activityName];
      id v8 = [(SUCoreActivity *)v5 activityName];
      if (![v6 stringIsEqual:v7 to:v8])
      {
        BOOL v34 = 0;
LABEL_29:

        goto LABEL_30;
      }
      unint64_t v9 = (void *)MEMORY[0x263F77D78];
      v10 = [(SUCoreActivity *)self UUID];
      BOOL v11 = [(SUCoreActivity *)v5 UUID];
      if (![v9 stringIsEqual:v10 to:v11])
      {
        BOOL v34 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v12 = (void *)MEMORY[0x263F77D78];
      uint64_t v13 = [(SUCoreActivity *)self runDate];
      uint64_t v14 = [(SUCoreActivity *)v5 runDate];
      id v15 = v12;
      id v16 = (void *)v14;
      if (!objc_msgSend(v15, "dateIsEqual:to:", v13))
      {
        BOOL v34 = 0;
        v25 = v16;
LABEL_27:

        goto LABEL_28;
      }
      v40 = v10;
      v38 = v13;
      uint64_t v17 = (void *)MEMORY[0x263F77D78];
      uint64_t v18 = [(SUCoreActivity *)self batteryLevelGreaterThan];
      uint64_t v19 = [(SUCoreActivity *)v5 batteryLevelGreaterThan];
      v39 = (void *)v18;
      uint64_t v20 = v18;
      v21 = (void *)v19;
      if (!objc_msgSend(v17, "numberIsEqual:to:", v20))
      {
        BOOL v34 = 0;
        uint64_t v13 = v38;
        v25 = v16;
LABEL_26:

        v10 = v40;
        goto LABEL_27;
      }
      id v22 = (void *)MEMORY[0x263F77D78];
      uint64_t v23 = [(SUCoreActivity *)self batteryLevelLessThan];
      [(SUCoreActivity *)v5 batteryLevelLessThan];
      v37 = v36 = (void *)v23;
      if (objc_msgSend(v22, "numberIsEqual:to:", v23))
      {
        int v24 = [(SUCoreActivity *)self plugInState];
        v25 = v16;
        if (v24 == [(SUCoreActivity *)v5 plugInState])
        {
          int v26 = [(SUCoreActivity *)self screenOnState];
          if (v26 == [(SUCoreActivity *)v5 screenOnState])
          {
            int v27 = [(SUCoreActivity *)self networkState];
            uint64_t v28 = v36;
            if (v27 == [(SUCoreActivity *)v5 networkState]
              && (int v29 = [(SUCoreActivity *)self wifiState],
                  v29 == [(SUCoreActivity *)v5 wifiState])
              && (int v30 = [(SUCoreActivity *)self waking], v30 == [(SUCoreActivity *)v5 waking])
              && (int v31 = [(SUCoreActivity *)self phoneCallState],
                  v31 == [(SUCoreActivity *)v5 phoneCallState])
              && (int v32 = [(SUCoreActivity *)self carplayState],
                  v32 == [(SUCoreActivity *)v5 carplayState]))
            {
              int v33 = [(SUCoreActivity *)self mediaPlayingState];
              BOOL v34 = v33 == [(SUCoreActivity *)v5 mediaPlayingState];
            }
            else
            {
              BOOL v34 = 0;
            }
            uint64_t v13 = v38;
            goto LABEL_25;
          }
        }
        BOOL v34 = 0;
        uint64_t v13 = v38;
      }
      else
      {
        BOOL v34 = 0;
        uint64_t v13 = v38;
        v25 = v16;
      }
      uint64_t v28 = v36;
LABEL_25:

      goto LABEL_26;
    }
    BOOL v34 = 0;
  }
LABEL_30:

  return v34;
}

+ (id)pluggedInPredicate:(BOOL)a3
{
  unsigned int v3 = [MEMORY[0x263F351C8] predicateForPluginStatus:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [MEMORY[0x263F77DE8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create plugged in _CDContextualPredicate", v9, 2u);
    }
  }

  return v4;
}

+ (id)networkPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  v14[2] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263F351C8], "predicateForCellConnectionAvailability:");
  id v5 = [MEMORY[0x263F351C8] predicateForWiFiConnectionAvailability:v3];
  v6 = (void *)MEMORY[0x263F35200];
  v14[0] = v4;
  v14[1] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  id v8 = [v6 orPredicateWithSubpredicates:v7];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x263F77DE8] sharedLogger];
    BOOL v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create network available _CDContextualPredicate", v13, 2u);
    }
  }

  return v8;
}

+ (id)wifiAvailablePredicate:(BOOL)a3
{
  BOOL v3 = [MEMORY[0x263F351C8] predicateForWiFiConnectionAvailability:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [MEMORY[0x263F77DE8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create wifi available _CDContextualPredicate", v9, 2u);
    }
  }

  return v4;
}

+ (id)backlightOnPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F351C8] keyPathForBacklightOnStatus];
  v6 = [NSNumber numberWithBool:v3];
  id v7 = [a1 _predicateForKeyPath:v5 equalToValue:v6];

  return v7;
}

+ (id)phoneCallPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F351C8] keyPathForCallInProgressStatus];
  v6 = [NSNumber numberWithBool:v3];
  id v7 = [a1 _predicateForKeyPath:v5 equalToValue:v6];

  id v8 = [MEMORY[0x263F351C8] keyPathForCallInProgressStatus];
  id v9 = [MEMORY[0x263EFF9D0] null];
  v10 = [a1 _predicateForKeyPath:v8 equalToValue:v9];

  BOOL v11 = (void *)MEMORY[0x263F35200];
  v19[0] = v7;
  v19[1] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  uint64_t v13 = [v11 orPredicateWithSubpredicates:v12];

  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x263F77DE8] sharedLogger];
    id v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create call in progress _CDContextualPredicate", v18, 2u);
    }
  }

  return v13;
}

+ (id)batteryLevelPredicateGreaterThan:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F35200];
  v4 = (void *)MEMORY[0x263F351C8];
  id v5 = a3;
  v6 = [v4 keyPathForBatteryLevel];
  id v7 = [MEMORY[0x263F351C8] keyPathForBatteryLevel];
  id v8 = [v3 predicateForKeyPath:v6, @"self.%@.value > %@", v7, v5 withFormat];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x263F77DE8] sharedLogger];
    BOOL v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create battery level greater than _CDContextualPredicate", buf, 2u);
    }
  }

  return v8;
}

+ (id)batteryLevelPredicateLessThan:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F35200];
  v4 = (void *)MEMORY[0x263F351C8];
  id v5 = a3;
  v6 = [v4 keyPathForBatteryLevel];
  id v7 = [MEMORY[0x263F351C8] keyPathForBatteryLevel];
  id v8 = [v3 predicateForKeyPath:v6, @"self.%@.value < %@", v7, v5 withFormat];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x263F77DE8] sharedLogger];
    BOOL v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create battery level less than _CDContextualPredicate", buf, 2u);
    }
  }

  return v8;
}

+ (id)carplayPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F351C8] keyPathForCarplayConnectedStatus];
  v6 = [NSNumber numberWithBool:v3];
  id v7 = [a1 _predicateForKeyPath:v5 equalToValue:v6];

  return v7;
}

+ (id)systemDatePredicate:(id)a3
{
  BOOL v3 = [MEMORY[0x263F351C8] predicateForSystemTime:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [MEMORY[0x263F77DE8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create system date _CDContextualPredicate", v9, 2u);
    }
  }

  return v4;
}

+ (id)mediaPlayingPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F351C8] keyPathForMediaPlayingStatus];
  v6 = [NSNumber numberWithBool:v3];
  id v7 = [a1 _predicateForKeyPath:v5 equalToValue:v6];

  return v7;
}

+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F35200] predicateForKeyPath:v5 equalToValue:a4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [v5 description];
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create _CDContextualPredicate for keyPath: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUCoreActivity;
  id v5 = [(SUCoreActivity *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"activityKey"];
    [(SUCoreActivity *)v5 setActivityName:v6];

    id v7 = [v4 decodeObjectForKey:@"uuid"];
    [(SUCoreActivity *)v5 setUUID:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runDate"];
    [(SUCoreActivity *)v5 setRunDate:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryLessThan"];
    [(SUCoreActivity *)v5 setBatteryLevelGreaterThan:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryGreaterThan"];
    [(SUCoreActivity *)v5 setBatteryLevelLessThan:v10];

    -[SUCoreActivity setWaking:](v5, "setWaking:", [v4 decodeIntegerForKey:@"waking"]);
    -[SUCoreActivity setPlugInState:](v5, "setPlugInState:", [v4 decodeIntegerForKey:@"plugInState"]);
    -[SUCoreActivity setScreenOnState:](v5, "setScreenOnState:", [v4 decodeIntegerForKey:@"screenOn"]);
    -[SUCoreActivity setNetworkState:](v5, "setNetworkState:", [v4 decodeIntegerForKey:@"network"]);
    -[SUCoreActivity setWifiState:](v5, "setWifiState:", [v4 decodeIntegerForKey:@"wifi"]);
    -[SUCoreActivity setPhoneCallState:](v5, "setPhoneCallState:", [v4 decodeIntegerForKey:@"phoneCall"]);
    -[SUCoreActivity setCarplayState:](v5, "setCarplayState:", [v4 decodeIntegerForKey:@"carplay"]);
    -[SUCoreActivity setMediaPlayingState:](v5, "setMediaPlayingState:", [v4 decodeIntegerForKey:@"media"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(SUCoreActivity *)self activityName];
  [v9 encodeObject:v4 forKey:@"activityKey"];

  id v5 = [(SUCoreActivity *)self UUID];
  [v9 encodeObject:v5 forKey:@"uuid"];

  v6 = [(SUCoreActivity *)self runDate];
  [v9 encodeObject:v6 forKey:@"runDate"];

  id v7 = [(SUCoreActivity *)self batteryLevelGreaterThan];
  [v9 encodeObject:v7 forKey:@"batteryGreaterThan"];

  id v8 = [(SUCoreActivity *)self batteryLevelLessThan];
  [v9 encodeObject:v8 forKey:@"batteryLessThan"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity waking](self, "waking"), @"waking");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity plugInState](self, "plugInState"), @"plugInState");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity screenOnState](self, "screenOnState"), @"screenOn");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity networkState](self, "networkState"), @"network");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity wifiState](self, "wifiState"), @"wifi");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity phoneCallState](self, "phoneCallState"), @"phoneCall");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity carplayState](self, "carplayState"), @"carplay");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"), @"media");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(SUCoreActivity *)self activityName];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setActivityName:v7];

  id v8 = [(SUCoreActivity *)self UUID];
  id v9 = (void *)[v8 copyWithZone:a3];
  [v5 setUUID:v9];

  v10 = [(SUCoreActivity *)self runDate];
  BOOL v11 = (void *)[v10 copyWithZone:a3];
  [v5 setRunDate:v11];

  objc_super v12 = [(SUCoreActivity *)self batteryLevelGreaterThan];
  int v13 = (void *)[v12 copyWithZone:a3];
  [v5 setBatteryLevelGreaterThan:v13];

  id v14 = [(SUCoreActivity *)self batteryLevelLessThan];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [v5 setBatteryLevelLessThan:v15];

  objc_msgSend(v5, "setWaking:", -[SUCoreActivity waking](self, "waking"));
  objc_msgSend(v5, "setPlugInState:", -[SUCoreActivity plugInState](self, "plugInState"));
  objc_msgSend(v5, "setScreenOnState:", -[SUCoreActivity screenOnState](self, "screenOnState"));
  objc_msgSend(v5, "setNetworkState:", -[SUCoreActivity networkState](self, "networkState"));
  objc_msgSend(v5, "setWifiState:", -[SUCoreActivity wifiState](self, "wifiState"));
  objc_msgSend(v5, "setPhoneCallState:", -[SUCoreActivity phoneCallState](self, "phoneCallState"));
  objc_msgSend(v5, "setCarplayState:", -[SUCoreActivity carplayState](self, "carplayState"));
  objc_msgSend(v5, "setMediaPlayingState:", -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"));
  return v5;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSDate)runDate
{
  return self->_runDate;
}

- (void)setRunDate:(id)a3
{
}

- (NSNumber)batteryLevelGreaterThan
{
  return self->_batteryLevelGreaterThan;
}

- (void)setBatteryLevelGreaterThan:(id)a3
{
}

- (NSNumber)batteryLevelLessThan
{
  return self->_batteryLevelLessThan;
}

- (void)setBatteryLevelLessThan:(id)a3
{
}

- (int)plugInState
{
  return self->_plugInState;
}

- (void)setPlugInState:(int)a3
{
  self->_plugInState = a3;
}

- (int)screenOnState
{
  return self->_screenOnState;
}

- (void)setScreenOnState:(int)a3
{
  self->_screenOnState = a3;
}

- (int)networkState
{
  return self->_networkState;
}

- (void)setNetworkState:(int)a3
{
  self->_networkState = a3;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(int)a3
{
  self->_wifiState = a3;
}

- (int)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(int)a3
{
  self->_phoneCallState = a3;
}

- (int)carplayState
{
  return self->_carplayState;
}

- (void)setCarplayState:(int)a3
{
  self->_carplayState = a3;
}

- (int)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setMediaPlayingState:(int)a3
{
  self->_mediaPlayingState = a3;
}

- (int)waking
{
  return self->_waking;
}

- (void)setWaking:(int)a3
{
  self->_waking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelLessThan, 0);
  objc_storeStrong((id *)&self->_batteryLevelGreaterThan, 0);
  objc_storeStrong((id *)&self->_runDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_activityName, 0);
}

@end