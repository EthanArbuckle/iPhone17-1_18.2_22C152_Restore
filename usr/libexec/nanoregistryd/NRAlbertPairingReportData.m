@interface NRAlbertPairingReportData
+ (BOOL)supportsSecureCoding;
+ (id)getStringProperty:(id)a3 fromDevice:(id)a4 store:(id)a5;
+ (id)stringValue:(id)a3;
+ (unsigned)_albertPairingModeForDevice:(id)a3;
- (NRAlbertPairingReportData)initWithCoder:(id)a3;
- (NRAlbertPairingReportData)initWithDevice:(id)a3 andSecurePropertyStore:(id)a4;
- (NSDictionary)xmlDictionary;
- (NSNumber)watchPairedMode;
- (NSString)phoneIMEI;
- (NSString)phoneIMEI2;
- (NSString)phoneMEID;
- (NSString)phoneSerial;
- (NSString)phoneUDID;
- (NSString)phoneVersion;
- (NSString)watchIMEI;
- (NSString)watchIMEI2;
- (NSString)watchMEID;
- (NSString)watchSerial;
- (NSString)watchUDID;
- (NSString)watchVersion;
- (void)_initDeviceInfoFromDevice:(id)a3 andSecurePropertyStore:(id)a4;
- (void)_initLocalDeviceInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setPhoneIMEI2:(id)a3;
- (void)setPhoneIMEI:(id)a3;
- (void)setPhoneMEID:(id)a3;
- (void)setPhoneSerial:(id)a3;
- (void)setPhoneUDID:(id)a3;
- (void)setPhoneVersion:(id)a3;
- (void)setWatchIMEI2:(id)a3;
- (void)setWatchIMEI:(id)a3;
- (void)setWatchMEID:(id)a3;
- (void)setWatchPairedMode:(id)a3;
- (void)setWatchSerial:(id)a3;
- (void)setWatchUDID:(id)a3;
- (void)setWatchVersion:(id)a3;
- (void)setXmlDictionary:(id)a3;
@end

@implementation NRAlbertPairingReportData

- (NRAlbertPairingReportData)initWithDevice:(id)a3 andSecurePropertyStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NRAlbertPairingReportData *)self init];
  v9 = v8;
  if (v8)
  {
    [(NRAlbertPairingReportData *)v8 _initLocalDeviceInfo];
    [(NRAlbertPairingReportData *)v9 _initDeviceInfoFromDevice:v6 andSecurePropertyStore:v7];
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRAlbertPairingReportData)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  watchUDID = self->_watchUDID;
  id v5 = a3;
  [v5 encodeObject:watchUDID forKey:@"UniqueDeviceID"];
  [v5 encodeObject:self->_watchSerial forKey:@"SerialNumber"];
  [v5 encodeObject:self->_watchVersion forKey:@"SystemVersion"];
  [v5 encodeObject:self->_watchIMEI forKey:@"InternationalMobileEquipmentIdentity"];
  [v5 encodeObject:self->_watchMEID forKey:@"MobileEquipmentIdentifier"];
  [v5 encodeObject:self->_watchIMEI2 forKey:@"InternationalMobileEquipmentIdentity2"];
  [v5 encodeObject:self->_watchPairedMode forKey:@"pairedMode"];
  [v5 encodeObject:self->_phoneUDID forKey:@"CompanionUniqueDeviceID"];
  [v5 encodeObject:self->_phoneSerial forKey:@"CompanionSerialNumber"];
  [v5 encodeObject:self->_phoneIMEI forKey:@"CompanionInternationalMobileEquipmentIdentity"];
  [v5 encodeObject:self->_phoneMEID forKey:@"CompanionMobileEquipmentIdentifier"];
  [v5 encodeObject:self->_phoneIMEI2 forKey:@"CompanionInternationalMobileEquipmentIdentity2"];
  [v5 encodeObject:self->_phoneVersion forKey:@"CompanionSystemVersion"];
}

- (NSDictionary)xmlDictionary
{
  v3 = objc_opt_new();
  v4 = v3;
  watchUDID = self->_watchUDID;
  if (watchUDID)
  {
    [v3 setObject:watchUDID forKeyedSubscript:@"UniqueDeviceID"];
  }
  else
  {
    id v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F856C();
      }
    }
  }
  watchSerial = self->_watchSerial;
  if (watchSerial)
  {
    [v4 setObject:watchSerial forKeyedSubscript:@"SerialNumber"];
  }
  else
  {
    v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000F8538();
      }
    }
  }
  watchVersion = self->_watchVersion;
  if (watchVersion) {
    [v4 setObject:watchVersion forKeyedSubscript:@"SystemVersion"];
  }
  watchIMEI = self->_watchIMEI;
  if (watchIMEI) {
    [v4 setObject:watchIMEI forKeyedSubscript:@"InternationalMobileEquipmentIdentity"];
  }
  watchMEID = self->_watchMEID;
  if (watchMEID) {
    [v4 setObject:watchMEID forKeyedSubscript:@"MobileEquipmentIdentifier"];
  }
  watchIMEI2 = self->_watchIMEI2;
  if (watchIMEI2) {
    [v4 setObject:watchIMEI2 forKeyedSubscript:@"InternationalMobileEquipmentIdentity2"];
  }
  watchPairedMode = self->_watchPairedMode;
  if (watchPairedMode) {
    [v4 setObject:watchPairedMode forKeyedSubscript:@"pairedMode"];
  }
  phoneUDID = self->_phoneUDID;
  if (phoneUDID)
  {
    [v4 setObject:phoneUDID forKeyedSubscript:@"CompanionUniqueDeviceID"];
  }
  else
  {
    v19 = nr_daemon_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      v21 = nr_daemon_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000F8504();
      }
    }
  }
  phoneSerial = self->_phoneSerial;
  if (phoneSerial)
  {
    [v4 setObject:phoneSerial forKeyedSubscript:@"CompanionSerialNumber"];
  }
  else
  {
    v23 = nr_daemon_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      v25 = nr_daemon_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000F84D0();
      }
    }
  }
  phoneIMEI = self->_phoneIMEI;
  if (phoneIMEI) {
    [v4 setObject:phoneIMEI forKeyedSubscript:@"CompanionInternationalMobileEquipmentIdentity"];
  }
  phoneMEID = self->_phoneMEID;
  if (phoneMEID && [(NSString *)phoneMEID caseInsensitiveCompare:@"unknown"])
  {
    [v4 setObject:self->_phoneMEID forKeyedSubscript:@"CompanionMobileEquipmentIdentifier"];
  }
  else
  {
    v28 = nr_daemon_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v29)
    {
      v30 = nr_daemon_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1000F845C((uint64_t *)&self->_phoneMEID, v30, v31);
      }
    }
  }
  phoneIMEI2 = self->_phoneIMEI2;
  if (phoneIMEI2) {
    [v4 setObject:phoneIMEI2 forKeyedSubscript:@"CompanionInternationalMobileEquipmentIdentity2"];
  }
  phoneVersion = self->_phoneVersion;
  if (phoneVersion) {
    [v4 setObject:phoneVersion forKeyedSubscript:@"CompanionSystemVersion"];
  }

  return (NSDictionary *)v4;
}

+ (id)stringValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  if ([v4 isEqual:@"Unknown"]) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

+ (id)getStringProperty:(id)a3 fromDevice:(id)a4 store:(id)a5
{
  id v7 = a5;
  v8 = [a4 objectForKeyedSubscript:a3];
  v9 = [v8 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
LABEL_5:
    BOOL v11 = v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v7 securePropertyForID:v9];
    goto LABEL_5;
  }
  BOOL v11 = 0;
LABEL_7:
  if ([v11 isEqual:@"Unknown"]) {
    id v12 = 0;
  }
  else {
    id v12 = v11;
  }

  return v12;
}

- (void)_initDeviceInfoFromDevice:(id)a3 andSecurePropertyStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() getStringProperty:NRDevicePropertyUDID fromDevice:v6 store:v7];
  watchUDID = self->_watchUDID;
  self->_watchUDID = v8;

  id v10 = [(id)objc_opt_class() getStringProperty:NRDevicePropertySerialNumber fromDevice:v6 store:v7];
  watchSerial = self->_watchSerial;
  self->_watchSerial = v10;

  id v12 = [(id)objc_opt_class() getStringProperty:NRDevicePropertyIMEI fromDevice:v6 store:v7];
  watchIMEI = self->_watchIMEI;
  self->_watchIMEI = v12;

  v14 = [(id)objc_opt_class() getStringProperty:NRDevicePropertyMEID fromDevice:v6 store:v7];
  watchMEID = self->_watchMEID;
  self->_watchMEID = v14;

  v16 = [(id)objc_opt_class() getStringProperty:NRDevicePropertyIMEI2 fromDevice:v6 store:v7];
  watchIMEI2 = self->_watchIMEI2;
  self->_watchIMEI2 = v16;

  v18 = [(id)objc_opt_class() getStringProperty:NRDevicePropertySystemVersion fromDevice:v6 store:v7];

  watchVersion = self->_watchVersion;
  self->_watchVersion = v18;

  BOOL v20 = +[NRFeatureFlags sharedInstance];
  LODWORD(v18) = [v20 albertReportPairingMode];

  if (v18)
  {
    v21 = (NSNumber *)[objc_alloc((Class)NSNumber) initWithUnsignedInt:[NRAlbertPairingReportData _albertPairingModeForDevice:](NRAlbertPairingReportData, "_albertPairingModeForDevice:", v6)];
    watchPairedMode = self->_watchPairedMode;
    self->_watchPairedMode = v21;
  }
  v23 = nr_daemon_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    v25 = nr_daemon_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_watchUDID;
      v27 = self->_watchSerial;
      int v28 = 138478083;
      BOOL v29 = v26;
      __int16 v30 = 2113;
      uint64_t v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Albert report from device: UUID: %{private}@ serial: %{private}@", (uint8_t *)&v28, 0x16u);
    }
  }
}

- (void)_initLocalDeviceInfo
{
  id v3 = objc_opt_new();
  id v4 = [v3 properties];
  id v5 = objc_opt_class();
  id v6 = [v4 objectForKeyedSubscript:NRDevicePropertyUDID];
  id v7 = [v5 stringValue:v6];
  phoneUDID = self->_phoneUDID;
  self->_phoneUDID = v7;

  v9 = objc_opt_class();
  id v10 = [v4 objectForKeyedSubscript:NRDevicePropertySerialNumber];
  BOOL v11 = [v9 stringValue:v10];
  phoneSerial = self->_phoneSerial;
  self->_phoneSerial = v11;

  v13 = objc_opt_class();
  v14 = [v4 objectForKeyedSubscript:NRDevicePropertyIMEI];
  v15 = [v13 stringValue:v14];
  phoneIMEI = self->_phoneIMEI;
  self->_phoneIMEI = v15;

  v17 = objc_opt_class();
  v18 = [v4 objectForKeyedSubscript:NRDevicePropertyMEID];
  v19 = [v17 stringValue:v18];
  phoneMEID = self->_phoneMEID;
  self->_phoneMEID = v19;

  v21 = objc_opt_class();
  v22 = [v4 objectForKeyedSubscript:NRDevicePropertyIMEI2];
  v23 = [v21 stringValue:v22];
  phoneIMEI2 = self->_phoneIMEI2;
  self->_phoneIMEI2 = v23;

  v25 = (void *)_CFCopySystemVersionDictionary();
  v26 = [v25 objectForKeyedSubscript:_kCFSystemVersionProductVersionKey];
  phoneVersion = self->_phoneVersion;
  self->_phoneVersion = v26;

  int v28 = nr_daemon_log();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

  if (v29)
  {
    __int16 v30 = nr_daemon_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = self->_phoneUDID;
      v32 = self->_phoneSerial;
      int v33 = 138478083;
      v34 = v31;
      __int16 v35 = 2113;
      v36 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Albert report from phone: UUID: %{private}@ serial: %{private}@", (uint8_t *)&v33, 0x16u);
    }
  }
}

+ (unsigned)_albertPairingModeForDevice:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:NRDevicePropertyIsAltAccount];
  id v4 = [v3 value];

  if (v4 && ([v4 BOOLValue] & 1) != 0) {
    unsigned __int16 v5 = 2;
  }
  else {
    unsigned __int16 v5 = 1;
  }

  return v5;
}

- (NSString)watchUDID
{
  return self->_watchUDID;
}

- (void)setWatchUDID:(id)a3
{
}

- (NSString)watchSerial
{
  return self->_watchSerial;
}

- (void)setWatchSerial:(id)a3
{
}

- (NSString)watchVersion
{
  return self->_watchVersion;
}

- (void)setWatchVersion:(id)a3
{
}

- (NSString)watchIMEI
{
  return self->_watchIMEI;
}

- (void)setWatchIMEI:(id)a3
{
}

- (NSString)watchMEID
{
  return self->_watchMEID;
}

- (void)setWatchMEID:(id)a3
{
}

- (NSString)watchIMEI2
{
  return self->_watchIMEI2;
}

- (void)setWatchIMEI2:(id)a3
{
}

- (NSNumber)watchPairedMode
{
  return self->_watchPairedMode;
}

- (void)setWatchPairedMode:(id)a3
{
}

- (NSString)phoneUDID
{
  return self->_phoneUDID;
}

- (void)setPhoneUDID:(id)a3
{
}

- (NSString)phoneSerial
{
  return self->_phoneSerial;
}

- (void)setPhoneSerial:(id)a3
{
}

- (NSString)phoneIMEI
{
  return self->_phoneIMEI;
}

- (void)setPhoneIMEI:(id)a3
{
}

- (NSString)phoneMEID
{
  return self->_phoneMEID;
}

- (void)setPhoneMEID:(id)a3
{
}

- (NSString)phoneIMEI2
{
  return self->_phoneIMEI2;
}

- (void)setPhoneIMEI2:(id)a3
{
}

- (NSString)phoneVersion
{
  return self->_phoneVersion;
}

- (void)setPhoneVersion:(id)a3
{
}

- (void)setXmlDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmlDictionary, 0);
  objc_storeStrong((id *)&self->_phoneVersion, 0);
  objc_storeStrong((id *)&self->_phoneIMEI2, 0);
  objc_storeStrong((id *)&self->_phoneMEID, 0);
  objc_storeStrong((id *)&self->_phoneIMEI, 0);
  objc_storeStrong((id *)&self->_phoneSerial, 0);
  objc_storeStrong((id *)&self->_phoneUDID, 0);
  objc_storeStrong((id *)&self->_watchPairedMode, 0);
  objc_storeStrong((id *)&self->_watchIMEI2, 0);
  objc_storeStrong((id *)&self->_watchMEID, 0);
  objc_storeStrong((id *)&self->_watchIMEI, 0);
  objc_storeStrong((id *)&self->_watchVersion, 0);
  objc_storeStrong((id *)&self->_watchSerial, 0);

  objc_storeStrong((id *)&self->_watchUDID, 0);
}

@end