@interface CRFeaturesAvailabilityAgent
- (BOOL)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4;
- (BOOL)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5;
- (CRCarPlayPreferences)preferencesManager;
- (CRFeaturesAvailabilityAgent)initWithPreferencesManager:(id)a3 vehicleStore:(id)a4;
- (CRVehicleStore)vehicleStore;
- (id)_BOOLValueInCarPlayDomainForKey:(__CFString *)a3;
- (unint64_t)_deviceFeatures;
- (unint64_t)_disabledCarPlayFeaturesForVehicle:(id)a3;
- (unint64_t)_supportedCarPlayFeaturesForVehicle:(id)a3;
- (unint64_t)deviceSupportedCarPlayFeatures;
- (unint64_t)supportedCarPlayFeaturesForCertificateSerial:(id)a3;
- (unint64_t)supportedCarPlayFeaturesForVehicleIdentifier:(id)a3;
@end

@implementation CRFeaturesAvailabilityAgent

- (CRFeaturesAvailabilityAgent)initWithPreferencesManager:(id)a3 vehicleStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRFeaturesAvailabilityAgent;
  v9 = [(CRFeaturesAvailabilityAgent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferencesManager, a3);
    objc_storeStrong((id *)&v10->_vehicleStore, a4);
  }

  return v10;
}

- (unint64_t)_deviceFeatures
{
  v3 = (const void *)MGCopyAnswer();
  unint64_t v4 = (unint64_t)v3;
  if (v3)
  {
    int v5 = CFEqual(v3, @"t7000");
    BOOL v6 = CFEqual((CFTypeRef)v4, @"s8000")
      || CFEqual((CFTypeRef)v4, @"s8001")
      || CFEqual((CFTypeRef)v4, @"s8003") != 0;
    BOOL v7 = CFEqual((CFTypeRef)v4, @"t8010")
      || CFEqual((CFTypeRef)v4, @"t8011")
      || CFEqual((CFTypeRef)v4, @"t8012") != 0;
    if (v5) {
      char v8 = 1;
    }
    else {
      char v8 = v6;
    }
    char v9 = v8 | v7;
    char v10 = (v8 | v7) ^ 1;
    int v11 = MGGetBoolAnswer();
    if ((v11 & 1) == 0)
    {
      objc_super v12 = CarGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "device doesn't support HEVC", (uint8_t *)&v22, 2u);
      }
    }
    CFRelease((CFTypeRef)v4);
    uint64_t v13 = 7;
    if (v9) {
      uint64_t v13 = 4;
    }
    uint64_t v14 = 3;
    if (v9) {
      uint64_t v14 = 0;
    }
    if (v11) {
      unint64_t v4 = v13;
    }
    else {
      unint64_t v4 = v14;
    }
  }
  else
  {
    char v10 = 0;
    int v11 = 0;
  }
  v15 = [(CRFeaturesAvailabilityAgent *)self preferencesManager];
  v16 = [v15 isCarPlayThemeSupportEnabled];

  if ([v16 BOOLValue])
  {
    uint64_t v17 = v4 | 0x38;
    if (!v11) {
      uint64_t v17 = v4;
    }
    if (v10) {
      unint64_t v4 = v17;
    }
  }
  else
  {
    v18 = CarGeneralLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "features disabled because global preference is disabled", (uint8_t *)&v22, 2u);
    }
  }
  v19 = CarGeneralLogging();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CRCarPlayFeaturesName();
    int v22 = 138412290;
    v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device supported features: %@", (uint8_t *)&v22, 0xCu);
  }
  return v4;
}

- (id)_BOOLValueInCarPlayDomainForKey:(__CFString *)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(a3, CRPreferencesNotMigratedDomain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID())
    {
      BOOL v6 = +[NSNumber numberWithUnsignedChar:CFBooleanGetValue(v4)];
    }
    else
    {
      BOOL v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)_disabledCarPlayFeaturesForVehicle:(id)a3
{
  CFBooleanRef v3 = [a3 disabledFeaturesPreference];
  CFBooleanRef v4 = v3;
  if (v3) {
    id v5 = [v3 unsignedIntegerValue];
  }
  else {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (unint64_t)_supportedCarPlayFeaturesForVehicle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRFeaturesAvailabilityAgent *)self deviceSupportedCarPlayFeatures];
  if (!v4)
  {
    uint64_t v8 = CRCarPlayFeaturesAllFerriteFeatures() & v5;
    goto LABEL_14;
  }
  unint64_t v6 = [(CRFeaturesAvailabilityAgent *)self _disabledCarPlayFeaturesForVehicle:v4] & v5;
  if (v6)
  {
    BOOL v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v16 = 134349056;
      unint64_t v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: features disabled by preference: %{public}lu", (uint8_t *)&v16, 0xCu);
    }

    v5 ^= v6;
  }
  uint64_t v8 = CRCarPlayFeaturesAllFerriteFeatures() & v5;
  uint64_t v9 = [v4 supportsThemeAssets];
  if (!v9) {
    goto LABEL_14;
  }
  char v10 = (void *)v9;
  int v11 = [v4 supportsThemeAssets];
  unsigned int v12 = [v11 BOOLValue];

  if (!v8 || !v12)
  {
    if (v12)
    {
LABEL_17:
      v5 ^= v8;
      goto LABEL_18;
    }
LABEL_14:
    uint64_t v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 134349056;
      unint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: vehicle doesn't support features requiring asset: %{public}lu", (uint8_t *)&v16, 0xCu);
    }

    goto LABEL_17;
  }
  uint64_t v13 = CarGeneralLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 134349056;
    unint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: device and vehicle support features requiring asset: %{public}lu", (uint8_t *)&v16, 0xCu);
  }

LABEL_18:
  return v5;
}

- (unint64_t)deviceSupportedCarPlayFeatures
{
  CFBooleanRef v3 = [(CRFeaturesAvailabilityAgent *)self preferencesManager];
  unsigned int v4 = [v3 isCarPlayAllowed];

  if (!v4) {
    return 0;
  }

  return [(CRFeaturesAvailabilityAgent *)self _deviceFeatures];
}

- (BOOL)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CRFeaturesAvailabilityAgent *)self vehicleStore];
  uint64_t v8 = [v7 vehicleForIdentifier:v6];

  if (v8)
  {
    unint64_t v9 = [(CRFeaturesAvailabilityAgent *)self _disabledCarPlayFeaturesForVehicle:v8] & a3;
    BOOL v10 = v9 != 0;
    int v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = @"NO";
      if (v9) {
        CFStringRef v12 = @"YES";
      }
      int v14 = 134349314;
      unint64_t v15 = a3;
      __int16 v16 = 2114;
      CFStringRef v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "disables CarPlay features %{public}lu: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    int v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10006FB58(v6);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  unint64_t v9 = [(CRFeaturesAvailabilityAgent *)self vehicleStore];
  BOOL v10 = [v9 vehicleForIdentifier:v8];

  if (v10)
  {
    uint64_t v11 = [v10 disabledFeaturesPreference];
    CFStringRef v12 = v11;
    if (v11) {
      uint64_t v11 = (uint64_t)[(id)v11 unsignedIntegerValue];
    }
    if (v5) {
      unint64_t v13 = v11 | a3;
    }
    else {
      unint64_t v13 = v11 & ~a3;
    }
    int v14 = +[NSNumber numberWithUnsignedInteger:v13];
    [v10 setDisabledFeaturesPreference:v14];

    unint64_t v15 = [(CRFeaturesAvailabilityAgent *)self vehicleStore];
    id v16 = [v15 saveVehicle:v10];

    CFStringRef v17 = CarGeneralLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v8 UUIDString];
      int v20 = 134349314;
      unint64_t v21 = v13;
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "set disabled CarPlay features to %{public}lu for vehicleID: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    CFStringRef v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006FB58(v8);
    }
  }

  return v10 != 0;
}

- (unint64_t)supportedCarPlayFeaturesForCertificateSerial:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRFeaturesAvailabilityAgent *)self vehicleStore];
  id v6 = [v5 vehicleForCertificateSerial:v4];

  unint64_t v7 = [(CRFeaturesAvailabilityAgent *)self _supportedCarPlayFeaturesForVehicle:v6];
  return v7;
}

- (unint64_t)supportedCarPlayFeaturesForVehicleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRFeaturesAvailabilityAgent *)self vehicleStore];
  id v6 = [v5 vehicleForIdentifier:v4];

  unint64_t v7 = [(CRFeaturesAvailabilityAgent *)self _supportedCarPlayFeaturesForVehicle:v6];
  return v7;
}

- (CRCarPlayPreferences)preferencesManager
{
  return self->_preferencesManager;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleStore, 0);

  objc_storeStrong((id *)&self->_preferencesManager, 0);
}

@end