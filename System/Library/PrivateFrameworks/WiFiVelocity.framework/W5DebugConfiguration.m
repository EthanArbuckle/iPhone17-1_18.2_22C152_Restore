@interface W5DebugConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDebugConfiguration:(id)a3;
- (W5DebugConfiguration)initWithCoder:(id)a3;
- (W5DiagnosticsMode)diagnosticsMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initDiagnosticsMode:(id)a3 wifiState:(int64_t)a4 megaWiFiProfileState:(int64_t)a5 noLoggingWiFiProfileState:(int64_t)a6 eapolState:(int64_t)a7 bluetoothState:(int64_t)a8;
- (id)initDiagnosticsMode:(id)a3 wifiState:(int64_t)a4 megaWiFiProfileState:(int64_t)a5 noLoggingWiFiProfileState:(int64_t)a6 eapolState:(int64_t)a7 bluetoothState:(int64_t)a8 stbcState:(int64_t)a9;
- (int64_t)bluetooth;
- (int64_t)eapol;
- (int64_t)megaWiFiProfile;
- (int64_t)noLoggingWiFiProfile;
- (int64_t)stbc;
- (int64_t)wifi;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetooth:(int64_t)a3;
- (void)setDiagnosticsMode:(id)a3;
- (void)setEapol:(int64_t)a3;
- (void)setMegaWiFiProfile:(int64_t)a3;
- (void)setNoLoggingWiFiProfile:(int64_t)a3;
- (void)setStbc:(int64_t)a3;
- (void)setWifi:(int64_t)a3;
@end

@implementation W5DebugConfiguration

- (id)initDiagnosticsMode:(id)a3 wifiState:(int64_t)a4 megaWiFiProfileState:(int64_t)a5 noLoggingWiFiProfileState:(int64_t)a6 eapolState:(int64_t)a7 bluetoothState:(int64_t)a8
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)W5DebugConfiguration;
  v15 = [(W5DebugConfiguration *)&v20 init];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    diagnosticsMode = v15->_diagnosticsMode;
    v15->_diagnosticsMode = (W5DiagnosticsMode *)v16;

    v15->_wifi = a4;
    v15->_megaWiFiProfile = a5;
    v15->_noLoggingWiFiProfile = a6;
    v15->_eapol = a7;
    v15->_bluetooth = a8;
    v15->_stbc = 0;
  }
  else
  {
    v19 = W5GetOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[W5DebugConfiguration initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolSta"
            "te:bluetoothState:]";
      __int16 v23 = 2080;
      v24 = "W5DebugConfiguration.m";
      __int16 v25 = 1024;
      int v26 = 31;
      _os_log_send_and_compose_impl();
    }
  }
  return v15;
}

- (id)initDiagnosticsMode:(id)a3 wifiState:(int64_t)a4 megaWiFiProfileState:(int64_t)a5 noLoggingWiFiProfileState:(int64_t)a6 eapolState:(int64_t)a7 bluetoothState:(int64_t)a8 stbcState:(int64_t)a9
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)W5DebugConfiguration;
  uint64_t v16 = [(W5DebugConfiguration *)&v21 init];
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    diagnosticsMode = v16->_diagnosticsMode;
    v16->_diagnosticsMode = (W5DiagnosticsMode *)v17;

    v16->_wifi = a4;
    v16->_megaWiFiProfile = a5;
    v16->_noLoggingWiFiProfile = a6;
    v16->_eapol = a7;
    v16->_bluetooth = a8;
    v16->_stbc = a9;
  }
  else
  {
    objc_super v20 = W5GetOSLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315650;
      __int16 v23 = "-[W5DebugConfiguration initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolSta"
            "te:bluetoothState:stbcState:]";
      __int16 v24 = 2080;
      __int16 v25 = "W5DebugConfiguration.m";
      __int16 v26 = 1024;
      int v27 = 55;
      _os_log_send_and_compose_impl();
    }
  }
  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  v4 = W5DescriptionForLogState(self->_wifi);
  [v3 appendFormat:@"WiFi: %@\n", v4];

  v5 = W5DescriptionForLogState(self->_megaWiFiProfile);
  [v3 appendFormat:@"Mega WiFi Profile: %@\n", v5];

  v6 = W5DescriptionForLogState(self->_noLoggingWiFiProfile);
  [v3 appendFormat:@"No Logging WiFi Profile: %@\n", v6];

  v7 = W5DescriptionForLogState(self->_eapol);
  [v3 appendFormat:@"EAPOL: %@\n", v7];

  v8 = W5DescriptionForLogState(self->_bluetooth);
  [v3 appendFormat:@"Bluetooth: %@\n", v8];

  v9 = W5DescriptionForDiagnosticsState([(W5DiagnosticsMode *)self->_diagnosticsMode state]);
  [v3 appendFormat:@"STBC: %@\n", v9];

  v10 = W5DescriptionForDiagnosticsState([(W5DiagnosticsMode *)self->_diagnosticsMode state]);
  [v3 appendFormat:@"Diagnostics Mode: %@\n", v10];

  v11 = (void *)[v3 copy];
  return v11;
}

- (BOOL)isEqualToDebugConfiguration:(id)a3
{
  id v4 = a3;
  int64_t wifi = self->_wifi;
  if (wifi == [v4 wifi]
    && (int64_t megaWiFiProfile = self->_megaWiFiProfile, megaWiFiProfile == [v4 megaWiFiProfile])
    && (int64_t noLoggingWiFiProfile = self->_noLoggingWiFiProfile,
        noLoggingWiFiProfile == [v4 noLoggingWiFiProfile])
    && (int64_t eapol = self->_eapol, eapol == [v4 eapol])
    && (int64_t bluetooth = self->_bluetooth, bluetooth == [v4 bluetooth]))
  {
    int64_t stbc = self->_stbc;
    BOOL v11 = stbc == [v4 stbc];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (W5DebugConfiguration *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(W5DebugConfiguration *)self isEqualToDebugConfiguration:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_wifi];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithInteger:self->_megaWiFiProfile];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [NSNumber numberWithInteger:self->_noLoggingWiFiProfile];
  uint64_t v8 = [v7 hash];
  v9 = [NSNumber numberWithInteger:self->_eapol];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  BOOL v11 = [NSNumber numberWithInteger:self->_bluetooth];
  uint64_t v12 = [v11 hash];
  v13 = [NSNumber numberWithInteger:self->_stbc];
  uint64_t v14 = v12 ^ [v13 hash];
  unint64_t v15 = v10 ^ v14 ^ [(W5DiagnosticsMode *)self->_diagnosticsMode hash];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[W5DebugConfiguration allocWithZone:a3] init];
  [(W5DebugConfiguration *)v4 setWifi:self->_wifi];
  [(W5DebugConfiguration *)v4 setMegaWiFiProfile:self->_megaWiFiProfile];
  [(W5DebugConfiguration *)v4 setNoLoggingWiFiProfile:self->_noLoggingWiFiProfile];
  [(W5DebugConfiguration *)v4 setEapol:self->_eapol];
  [(W5DebugConfiguration *)v4 setBluetooth:self->_bluetooth];
  [(W5DebugConfiguration *)v4 setDiagnosticsMode:self->_diagnosticsMode];
  [(W5DebugConfiguration *)v4 setStbc:self->_stbc];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t wifi = self->_wifi;
  id v5 = a3;
  [v5 encodeInteger:wifi forKey:@"_wifi"];
  [v5 encodeInteger:self->_megaWiFiProfile forKey:@"_megaWiFiProfile"];
  [v5 encodeInteger:self->_noLoggingWiFiProfile forKey:@"_noLoggingWiFiProfile"];
  [v5 encodeInteger:self->_eapol forKey:@"_eapol"];
  [v5 encodeInteger:self->_bluetooth forKey:@"_bluetooth"];
  [v5 encodeInteger:self->_stbc forKey:@"_stbc"];
  [v5 encodeObject:self->_diagnosticsMode forKey:@"_diagnosticsMode"];
}

- (W5DebugConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)W5DebugConfiguration;
  id v5 = [(W5DebugConfiguration *)&v16 init];
  if (v5)
  {
    v5->_int64_t wifi = [v4 decodeIntegerForKey:@"_wifi"];
    v5->_int64_t megaWiFiProfile = [v4 decodeIntegerForKey:@"_megaWiFiProfile"];
    v5->_int64_t noLoggingWiFiProfile = [v4 decodeIntegerForKey:@"_noLoggingWiFiProfile"];
    v5->_int64_t eapol = [v4 decodeIntegerForKey:@"_eapol"];
    v5->_int64_t bluetooth = [v4 decodeIntegerForKey:@"_bluetooth"];
    v5->_int64_t stbc = [v4 decodeIntegerForKey:@"_stbc"];
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_diagnosticsMode"];
    diagnosticsMode = v5->_diagnosticsMode;
    v5->_diagnosticsMode = (W5DiagnosticsMode *)v13;
  }
  return v5;
}

- (int64_t)wifi
{
  return self->_wifi;
}

- (void)setWifi:(int64_t)a3
{
  self->_int64_t wifi = a3;
}

- (int64_t)megaWiFiProfile
{
  return self->_megaWiFiProfile;
}

- (void)setMegaWiFiProfile:(int64_t)a3
{
  self->_int64_t megaWiFiProfile = a3;
}

- (int64_t)noLoggingWiFiProfile
{
  return self->_noLoggingWiFiProfile;
}

- (void)setNoLoggingWiFiProfile:(int64_t)a3
{
  self->_int64_t noLoggingWiFiProfile = a3;
}

- (int64_t)eapol
{
  return self->_eapol;
}

- (void)setEapol:(int64_t)a3
{
  self->_int64_t eapol = a3;
}

- (int64_t)bluetooth
{
  return self->_bluetooth;
}

- (void)setBluetooth:(int64_t)a3
{
  self->_int64_t bluetooth = a3;
}

- (int64_t)stbc
{
  return self->_stbc;
}

- (void)setStbc:(int64_t)a3
{
  self->_int64_t stbc = a3;
}

- (W5DiagnosticsMode)diagnosticsMode
{
  return self->_diagnosticsMode;
}

- (void)setDiagnosticsMode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end