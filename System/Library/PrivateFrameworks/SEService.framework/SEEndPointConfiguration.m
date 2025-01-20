@interface SEEndPointConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationWithOpt1:(unsigned __int8)a3 opt2:(unsigned __int8)a4;
+ (id)homeDefaults;
+ (id)hydraDefaults;
+ (id)lyonHomeDefaults;
+ (id)lyonHydraDefaults;
- (BOOL)authorizeEndPointAllowed;
- (BOOL)authorizeEndPointWithAuthorizeAllowed;
- (BOOL)compressedKeysAllowed;
- (BOOL)confidentialDataAllowed;
- (BOOL)enabledOnContactless;
- (BOOL)enabledOnWire;
- (BOOL)exchangeAllowedInFastFlow;
- (BOOL)exchangeAllowedOnWire;
- (BOOL)exportEraseConfidentialMailBox;
- (BOOL)fastFlowAllowedOnContactless;
- (BOOL)fastFlowAllowedOnWire;
- (BOOL)fleetVehicle;
- (BOOL)nfcExpressOnlyInLPM;
- (BOOL)serverIssuedKey;
- (BOOL)signAllowed;
- (BOOL)standardFlowAllowedOnContactless;
- (BOOL)standardFlowAllowedOnWire;
- (BOOL)terminationNotPersisted;
- (SEEndPointConfiguration)init;
- (SEEndPointConfiguration)initWithCoder:(id)a3;
- (id)description;
- (unsigned)lengthConfidentialMailBox;
- (unsigned)lengthPrivateMailBox;
- (unsigned)offsetConfidentialMailBox;
- (unsigned)offsetPrivateMailBox;
- (unsigned)opt1;
- (unsigned)opt2;
- (unsigned)optA;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizeEndPointAllowed:(BOOL)a3;
- (void)setAuthorizeEndPointWithAuthorizeAllowed:(BOOL)a3;
- (void)setCompressedKeysAllowed:(BOOL)a3;
- (void)setConfidentialDataAllowed:(BOOL)a3;
- (void)setEnabledOnContactless:(BOOL)a3;
- (void)setEnabledOnWire:(BOOL)a3;
- (void)setExchangeAllowedInFastFlow:(BOOL)a3;
- (void)setExchangeAllowedOnWire:(BOOL)a3;
- (void)setExportEraseConfidentialMailBox:(BOOL)a3;
- (void)setFastFlowAllowedOnContactless:(BOOL)a3;
- (void)setFastFlowAllowedOnWire:(BOOL)a3;
- (void)setFleetVehicle:(BOOL)a3;
- (void)setLengthConfidentialMailBox:(unsigned __int16)a3;
- (void)setLengthPrivateMailBox:(unsigned __int16)a3;
- (void)setNfcExpressOnlyInLPM:(BOOL)a3;
- (void)setOffsetConfidentialMailBox:(unsigned __int16)a3;
- (void)setOffsetPrivateMailBox:(unsigned __int16)a3;
- (void)setServerIssuedKey:(BOOL)a3;
- (void)setSignAllowed:(BOOL)a3;
- (void)setStandardFlowAllowedOnContactless:(BOOL)a3;
- (void)setStandardFlowAllowedOnWire:(BOOL)a3;
- (void)setTerminationNotPersisted:(BOOL)a3;
@end

@implementation SEEndPointConfiguration

- (SEEndPointConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SEEndPointConfiguration;
  v2 = [(SEEndPointConfiguration *)&v6 init];
  if (v2)
  {
    v3 = SESDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_DEBUG, "Init SEEndPointConfiguration with default values", v5, 2u);
    }

    [(SEEndPointConfiguration *)v2 setEnabledOnWire:1];
    [(SEEndPointConfiguration *)v2 setEnabledOnContactless:1];
    [(SEEndPointConfiguration *)v2 setStandardFlowAllowedOnWire:0];
    [(SEEndPointConfiguration *)v2 setStandardFlowAllowedOnContactless:1];
    [(SEEndPointConfiguration *)v2 setFastFlowAllowedOnWire:0];
    [(SEEndPointConfiguration *)v2 setFastFlowAllowedOnContactless:0];
    [(SEEndPointConfiguration *)v2 setExchangeAllowedOnWire:1];
    [(SEEndPointConfiguration *)v2 setExchangeAllowedInFastFlow:0];
    [(SEEndPointConfiguration *)v2 setAuthorizeEndPointAllowed:0];
    [(SEEndPointConfiguration *)v2 setAuthorizeEndPointWithAuthorizeAllowed:0];
    [(SEEndPointConfiguration *)v2 setSignAllowed:0];
    [(SEEndPointConfiguration *)v2 setExportEraseConfidentialMailBox:0];
    [(SEEndPointConfiguration *)v2 setCompressedKeysAllowed:0];
    [(SEEndPointConfiguration *)v2 setConfidentialDataAllowed:0];
    [(SEEndPointConfiguration *)v2 setServerIssuedKey:0];
    [(SEEndPointConfiguration *)v2 setFleetVehicle:0];
    [(SEEndPointConfiguration *)v2 setNfcExpressOnlyInLPM:0];
    [(SEEndPointConfiguration *)v2 setTerminationNotPersisted:0];
    [(SEEndPointConfiguration *)v2 setLengthConfidentialMailBox:0];
    [(SEEndPointConfiguration *)v2 setOffsetConfidentialMailBox:0];
    [(SEEndPointConfiguration *)v2 setLengthPrivateMailBox:0];
    [(SEEndPointConfiguration *)v2 setOffsetPrivateMailBox:0];
  }
  return v2;
}

+ (id)configurationWithOpt1:(unsigned __int8)a3 opt2:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((a4 & 0x30) != 0)
  {
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v12 = 67109120;
      unsigned int v13 = v4;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_ERROR, "Option group 2 value has some RFU bits set 0x%02X", (uint8_t *)&v12, 8u);
    }
    objc_super v6 = 0;
LABEL_5:

    goto LABEL_6;
  }
  unsigned int v8 = a3;
  objc_super v6 = objc_opt_new();
  if (v6)
  {
    v9 = SESDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 67109376;
      unsigned int v13 = v8;
      __int16 v14 = 1024;
      unsigned int v15 = v4;
      _os_log_impl(&dword_2146ED000, v9, OS_LOG_TYPE_DEBUG, "Creating SEEndPointConfiguration with Opt1 %02X and Opt2 %02X", (uint8_t *)&v12, 0xEu);
    }

    [v6 setStandardFlowAllowedOnContactless:v8 & 1];
    [v6 setFastFlowAllowedOnContactless:(v8 >> 1) & 1];
    [v6 setStandardFlowAllowedOnWire:(v8 >> 2) & 1];
    [v6 setFastFlowAllowedOnWire:(v8 >> 3) & 1];
    [v6 setAuthorizeEndPointAllowed:(v8 >> 4) & 1];
    [v6 setAuthorizeEndPointWithAuthorizeAllowed:(v8 >> 5) & 1];
    [v6 setExchangeAllowedOnWire:(v8 >> 6) & 1];
    [v6 setExchangeAllowedInFastFlow:v8 >> 7];
    [v6 setSignAllowed:v4 & 1];
    [v6 setExportEraseConfidentialMailBox:(v4 >> 1) & 1];
    [v6 setServerIssuedKey:(v4 >> 2) & 1];
    [v6 setFleetVehicle:(v4 >> 3) & 1];
    [v6 setCompressedKeysAllowed:(v4 >> 6) & 1];
    [v6 setConfidentialDataAllowed:v4 >> 7];
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unsigned int v10 = [v6 opt1];
      unsigned int v11 = [v6 opt2];
      int v12 = 67109376;
      unsigned int v13 = v10;
      __int16 v14 = 1024;
      unsigned int v15 = v11;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "SEEndPointConfiguration created with Opt1 %02X and Opt2 %02X", (uint8_t *)&v12, 0xEu);
    }
    goto LABEL_5;
  }
LABEL_6:
  return v6;
}

+ (id)homeDefaults
{
  v2 = objc_opt_new();
  [v2 setEnabledOnWire:1];
  [v2 setEnabledOnContactless:1];
  [v2 setStandardFlowAllowedOnWire:1];
  [v2 setStandardFlowAllowedOnContactless:1];
  [v2 setFastFlowAllowedOnWire:1];
  [v2 setFastFlowAllowedOnContactless:1];
  [v2 setExchangeAllowedOnWire:1];
  [v2 setExchangeAllowedInFastFlow:1];
  [v2 setAuthorizeEndPointAllowed:0];
  [v2 setAuthorizeEndPointWithAuthorizeAllowed:0];
  [v2 setSignAllowed:1];
  [v2 setExportEraseConfidentialMailBox:0];
  [v2 setConfidentialDataAllowed:1];
  return v2;
}

+ (id)lyonHomeDefaults
{
  v2 = objc_opt_new();
  [v2 setNfcExpressOnlyInLPM:0];
  [v2 setTerminationNotPersisted:1];
  [v2 setEnabledOnWire:0];
  [v2 setEnabledOnContactless:0];
  return v2;
}

+ (id)lyonHydraDefaults
{
  v2 = objc_opt_new();
  [v2 setNfcExpressOnlyInLPM:0];
  [v2 setTerminationNotPersisted:0];
  [v2 setEnabledOnWire:0];
  [v2 setEnabledOnContactless:0];
  return v2;
}

+ (id)hydraDefaults
{
  v2 = objc_opt_new();
  [v2 setEnabledOnWire:1];
  [v2 setEnabledOnContactless:1];
  [v2 setStandardFlowAllowedOnWire:1];
  [v2 setStandardFlowAllowedOnContactless:1];
  [v2 setFastFlowAllowedOnWire:1];
  [v2 setFastFlowAllowedOnContactless:1];
  [v2 setExchangeAllowedOnWire:1];
  [v2 setExchangeAllowedInFastFlow:1];
  [v2 setAuthorizeEndPointAllowed:0];
  [v2 setAuthorizeEndPointWithAuthorizeAllowed:0];
  [v2 setSignAllowed:1];
  [v2 setExportEraseConfidentialMailBox:0];
  [v2 setConfidentialDataAllowed:1];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"{\n"];
  unsigned int v4 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tenabledOnWire : %d\n", -[SEEndPointConfiguration enabledOnWire](self, "enabledOnWire"));
  v5 = [v3 stringByAppendingString:v4];

  objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tenabledOnContactless : %d\n", -[SEEndPointConfiguration enabledOnContactless](self, "enabledOnContactless"));
  v7 = [v5 stringByAppendingString:v6];

  unsigned int v8 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tstandardFlowAllowedOnWire : %d\n", -[SEEndPointConfiguration standardFlowAllowedOnWire](self, "standardFlowAllowedOnWire"));
  v9 = [v7 stringByAppendingString:v8];

  unsigned int v10 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tstandardFlowAllowedOnContactless : %d\n", -[SEEndPointConfiguration standardFlowAllowedOnContactless](self, "standardFlowAllowedOnContactless"));
  unsigned int v11 = [v9 stringByAppendingString:v10];

  int v12 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tfastFlowAllowedOnWire : %d\n", -[SEEndPointConfiguration fastFlowAllowedOnWire](self, "fastFlowAllowedOnWire"));
  unsigned int v13 = [v11 stringByAppendingString:v12];

  __int16 v14 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tfastFlowAllowedOnContactless : %d\n", -[SEEndPointConfiguration fastFlowAllowedOnContactless](self, "fastFlowAllowedOnContactless"));
  unsigned int v15 = [v13 stringByAppendingString:v14];

  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"\t\texchangeAllowedOnWire : %d\n", -[SEEndPointConfiguration exchangeAllowedOnWire](self, "exchangeAllowedOnWire"));
  v17 = [v15 stringByAppendingString:v16];

  v18 = objc_msgSend(NSString, "stringWithFormat:", @"\t\texchangeAllowedInFastFlow : %d\n", -[SEEndPointConfiguration exchangeAllowedInFastFlow](self, "exchangeAllowedInFastFlow"));
  v19 = [v17 stringByAppendingString:v18];

  v20 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tauthorizeEndPointAllowed : %d\n", -[SEEndPointConfiguration authorizeEndPointAllowed](self, "authorizeEndPointAllowed"));
  v21 = [v19 stringByAppendingString:v20];

  v22 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tauthorizeEndPointWithAuthorizeAllowed : %d\n", -[SEEndPointConfiguration authorizeEndPointWithAuthorizeAllowed](self, "authorizeEndPointWithAuthorizeAllowed"));
  v23 = [v21 stringByAppendingString:v22];

  v24 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tsignAllowed : %d\n", -[SEEndPointConfiguration signAllowed](self, "signAllowed"));
  v25 = [v23 stringByAppendingString:v24];

  v26 = objc_msgSend(NSString, "stringWithFormat:", @"\t\texportEraseConfidentialMailBox : %d\n", -[SEEndPointConfiguration exportEraseConfidentialMailBox](self, "exportEraseConfidentialMailBox"));
  v27 = [v25 stringByAppendingString:v26];

  v28 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tcompressedKeysAllowed : %d\n", -[SEEndPointConfiguration compressedKeysAllowed](self, "compressedKeysAllowed"));
  v29 = [v27 stringByAppendingString:v28];

  v30 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tconfidentialDataAllowed : %d\n", -[SEEndPointConfiguration confidentialDataAllowed](self, "confidentialDataAllowed"));
  v31 = [v29 stringByAppendingString:v30];

  v32 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tserverIssuedKey : %d\n", -[SEEndPointConfiguration serverIssuedKey](self, "serverIssuedKey"));
  v33 = [v31 stringByAppendingString:v32];

  v34 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tfleetVehicle : %d\n", -[SEEndPointConfiguration fleetVehicle](self, "fleetVehicle"));
  v35 = [v33 stringByAppendingString:v34];

  v36 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tnfcExpressOnlyInLPM : %d\n", -[SEEndPointConfiguration nfcExpressOnlyInLPM](self, "nfcExpressOnlyInLPM"));
  v37 = [v35 stringByAppendingString:v36];

  v38 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tterminationNotPersisted : %d\n", -[SEEndPointConfiguration terminationNotPersisted](self, "terminationNotPersisted"));
  v39 = [v37 stringByAppendingString:v38];

  v40 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tlengthConfidentialMailBox : %d\n", -[SEEndPointConfiguration lengthConfidentialMailBox](self, "lengthConfidentialMailBox"));
  v41 = [v39 stringByAppendingString:v40];

  v42 = objc_msgSend(NSString, "stringWithFormat:", @"\t\toffsetConfidentialMailBox : %d\n", -[SEEndPointConfiguration offsetConfidentialMailBox](self, "offsetConfidentialMailBox"));
  v43 = [v41 stringByAppendingString:v42];

  v44 = objc_msgSend(NSString, "stringWithFormat:", @"\t\tlengthPrivateMailBox : %d\n", -[SEEndPointConfiguration lengthPrivateMailBox](self, "lengthPrivateMailBox"));
  v45 = [v43 stringByAppendingString:v44];

  v46 = objc_msgSend(NSString, "stringWithFormat:", @"\t\toffsetPrivateMailBox : %d\n", -[SEEndPointConfiguration offsetPrivateMailBox](self, "offsetPrivateMailBox"));
  v47 = [v45 stringByAppendingString:v46];

  v48 = [NSString stringWithFormat:@"\t}"];
  v49 = [v47 stringByAppendingString:v48];

  return v49;
}

- (SEEndPointConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SEEndPointConfiguration;
  v5 = [(SEEndPointConfiguration *)&v7 init];
  if (v5)
  {
    v5->_enabledOnWire = [v4 decodeIntForKey:@"enabledOnWire"] != 0;
    v5->_enabledOnContactless = [v4 decodeIntForKey:@"enabledOnContactless"] != 0;
    v5->_standardFlowAllowedOnWire = [v4 decodeIntForKey:@"standardFlowAllowedOnWire"] != 0;
    v5->_standardFlowAllowedOnContactless = [v4 decodeIntForKey:@"standardFlowAllowedOnContactless"] != 0;
    v5->_fastFlowAllowedOnWire = [v4 decodeIntForKey:@"fastFlowAllowedOnWire"] != 0;
    v5->_fastFlowAllowedOnContactless = [v4 decodeIntForKey:@"fastFlowAllowedOnContactless"] != 0;
    v5->_exchangeAllowedOnWire = [v4 decodeIntForKey:@"exchangeAllowedOnWire"] != 0;
    v5->_exchangeAllowedInFastFlow = [v4 decodeIntForKey:@"exchangeAllowedInFastFlow"] != 0;
    v5->_authorizeEndPointAllowed = [v4 decodeIntForKey:@"authorizeEndPointAllowed"] != 0;
    v5->_authorizeEndPointWithAuthorizeAllowed = [v4 decodeIntForKey:@"authorizeEndPointWithAuthorizeAllowed"] != 0;
    v5->_signAllowed = [v4 decodeIntForKey:@"signAllowed"] != 0;
    v5->_exportEraseConfidentialMailBox = [v4 decodeIntForKey:@"exportEraseConfidentialMailBox"] != 0;
    v5->_compressedKeysAllowed = [v4 decodeIntForKey:@"compressedKeysAllowed"] != 0;
    v5->_confidentialDataAllowed = [v4 decodeIntForKey:@"confidentialDataAllowed"] != 0;
    v5->_serverIssuedKey = [v4 decodeIntForKey:@"serverIssuedKey"] != 0;
    v5->_fleetVehicle = [v4 decodeIntForKey:@"fleetVehicle"] != 0;
    v5->_nfcExpressOnlyInLPM = [v4 decodeIntForKey:@"nfcExpressOnlyInLPM"] != 0;
    v5->_terminationNotPersisted = [v4 decodeIntForKey:@"terminationNotPersisted"] != 0;
    v5->_lengthConfidentialMailBox = [v4 decodeIntForKey:@"lengthConfidentialMailBox"];
    v5->_offsetConfidentialMailBox = [v4 decodeIntForKey:@"offsetConfidentialMailBox"];
    v5->_lengthPrivateMailBox = [v4 decodeIntForKey:@"lengthPrivateMailBox"];
    v5->_offsetPrivateMailBox = [v4 decodeIntForKey:@"offsetPrivateMailBox"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration enabledOnWire](self, "enabledOnWire"), @"enabledOnWire");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration enabledOnContactless](self, "enabledOnContactless"), @"enabledOnContactless");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration standardFlowAllowedOnWire](self, "standardFlowAllowedOnWire"), @"standardFlowAllowedOnWire");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration standardFlowAllowedOnContactless](self, "standardFlowAllowedOnContactless"), @"standardFlowAllowedOnContactless");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration fastFlowAllowedOnWire](self, "fastFlowAllowedOnWire"), @"fastFlowAllowedOnWire");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration fastFlowAllowedOnContactless](self, "fastFlowAllowedOnContactless"), @"fastFlowAllowedOnContactless");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration exchangeAllowedOnWire](self, "exchangeAllowedOnWire"), @"exchangeAllowedOnWire");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration exchangeAllowedInFastFlow](self, "exchangeAllowedInFastFlow"), @"exchangeAllowedInFastFlow");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration authorizeEndPointAllowed](self, "authorizeEndPointAllowed"), @"authorizeEndPointAllowed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration authorizeEndPointWithAuthorizeAllowed](self, "authorizeEndPointWithAuthorizeAllowed"), @"authorizeEndPointWithAuthorizeAllowed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration signAllowed](self, "signAllowed"), @"signAllowed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration exportEraseConfidentialMailBox](self, "exportEraseConfidentialMailBox"), @"exportEraseConfidentialMailBox");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration compressedKeysAllowed](self, "compressedKeysAllowed"), @"compressedKeysAllowed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration confidentialDataAllowed](self, "confidentialDataAllowed"), @"confidentialDataAllowed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration serverIssuedKey](self, "serverIssuedKey"), @"serverIssuedKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration fleetVehicle](self, "fleetVehicle"), @"fleetVehicle");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration nfcExpressOnlyInLPM](self, "nfcExpressOnlyInLPM"), @"nfcExpressOnlyInLPM");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration terminationNotPersisted](self, "terminationNotPersisted"), @"terminationNotPersisted");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration lengthConfidentialMailBox](self, "lengthConfidentialMailBox"), @"lengthConfidentialMailBox");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration offsetConfidentialMailBox](self, "offsetConfidentialMailBox"), @"offsetConfidentialMailBox");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration lengthPrivateMailBox](self, "lengthPrivateMailBox"), @"lengthPrivateMailBox");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration offsetPrivateMailBox](self, "offsetPrivateMailBox"), @"offsetPrivateMailBox");
}

- (unsigned)opt1
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unsigned __int8 v3 = [(SEEndPointConfiguration *)self standardFlowAllowedOnContactless];
  if ([(SEEndPointConfiguration *)self fastFlowAllowedOnContactless]) {
    v3 |= 2u;
  }
  if ([(SEEndPointConfiguration *)self standardFlowAllowedOnWire]) {
    v3 |= 4u;
  }
  if ([(SEEndPointConfiguration *)self fastFlowAllowedOnWire]) {
    v3 |= 8u;
  }
  if ([(SEEndPointConfiguration *)self authorizeEndPointAllowed]) {
    v3 |= 0x10u;
  }
  if ([(SEEndPointConfiguration *)self authorizeEndPointWithAuthorizeAllowed]) {
    v3 |= 0x20u;
  }
  if ([(SEEndPointConfiguration *)self exchangeAllowedOnWire]) {
    v3 |= 0x40u;
  }
  if ([(SEEndPointConfiguration *)self exchangeAllowedInFastFlow]) {
    v3 |= 0x80u;
  }
  id v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_INFO, "Returning SEEndPointConfiguration Opt1 %02X", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (unsigned)opt2
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unsigned __int8 v3 = [(SEEndPointConfiguration *)self signAllowed];
  if ([(SEEndPointConfiguration *)self exportEraseConfidentialMailBox]) {
    v3 |= 2u;
  }
  if ([(SEEndPointConfiguration *)self serverIssuedKey]) {
    v3 |= 4u;
  }
  if ([(SEEndPointConfiguration *)self fleetVehicle]) {
    v3 |= 8u;
  }
  if ([(SEEndPointConfiguration *)self compressedKeysAllowed]) {
    v3 |= 0x40u;
  }
  if ([(SEEndPointConfiguration *)self confidentialDataAllowed]) {
    v3 |= 0x80u;
  }
  id v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_INFO, "Returning SEEndPointConfiguration Opt2 %02X", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (unsigned)optA
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SEEndPointConfiguration *)self nfcExpressOnlyInLPM];
  if ([(SEEndPointConfiguration *)self terminationNotPersisted]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "Returning SEEndPointConfiguration OptA %02X", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (BOOL)enabledOnWire
{
  return self->_enabledOnWire;
}

- (void)setEnabledOnWire:(BOOL)a3
{
  self->_enabledOnWire = a3;
}

- (BOOL)enabledOnContactless
{
  return self->_enabledOnContactless;
}

- (void)setEnabledOnContactless:(BOOL)a3
{
  self->_enabledOnContactless = a3;
}

- (BOOL)standardFlowAllowedOnWire
{
  return self->_standardFlowAllowedOnWire;
}

- (void)setStandardFlowAllowedOnWire:(BOOL)a3
{
  self->_standardFlowAllowedOnWire = a3;
}

- (BOOL)standardFlowAllowedOnContactless
{
  return self->_standardFlowAllowedOnContactless;
}

- (void)setStandardFlowAllowedOnContactless:(BOOL)a3
{
  self->_standardFlowAllowedOnContactless = a3;
}

- (BOOL)fastFlowAllowedOnWire
{
  return self->_fastFlowAllowedOnWire;
}

- (void)setFastFlowAllowedOnWire:(BOOL)a3
{
  self->_fastFlowAllowedOnWire = a3;
}

- (BOOL)fastFlowAllowedOnContactless
{
  return self->_fastFlowAllowedOnContactless;
}

- (void)setFastFlowAllowedOnContactless:(BOOL)a3
{
  self->_fastFlowAllowedOnContactless = a3;
}

- (BOOL)exchangeAllowedOnWire
{
  return self->_exchangeAllowedOnWire;
}

- (void)setExchangeAllowedOnWire:(BOOL)a3
{
  self->_exchangeAllowedOnWire = a3;
}

- (BOOL)exchangeAllowedInFastFlow
{
  return self->_exchangeAllowedInFastFlow;
}

- (void)setExchangeAllowedInFastFlow:(BOOL)a3
{
  self->_exchangeAllowedInFastFlow = a3;
}

- (BOOL)authorizeEndPointAllowed
{
  return self->_authorizeEndPointAllowed;
}

- (void)setAuthorizeEndPointAllowed:(BOOL)a3
{
  self->_authorizeEndPointAllowed = a3;
}

- (BOOL)authorizeEndPointWithAuthorizeAllowed
{
  return self->_authorizeEndPointWithAuthorizeAllowed;
}

- (void)setAuthorizeEndPointWithAuthorizeAllowed:(BOOL)a3
{
  self->_authorizeEndPointWithAuthorizeAllowed = a3;
}

- (BOOL)signAllowed
{
  return self->_signAllowed;
}

- (void)setSignAllowed:(BOOL)a3
{
  self->_signAllowed = a3;
}

- (BOOL)exportEraseConfidentialMailBox
{
  return self->_exportEraseConfidentialMailBox;
}

- (void)setExportEraseConfidentialMailBox:(BOOL)a3
{
  self->_exportEraseConfidentialMailBox = a3;
}

- (BOOL)serverIssuedKey
{
  return self->_serverIssuedKey;
}

- (void)setServerIssuedKey:(BOOL)a3
{
  self->_serverIssuedKey = a3;
}

- (BOOL)fleetVehicle
{
  return self->_fleetVehicle;
}

- (void)setFleetVehicle:(BOOL)a3
{
  self->_fleetVehicle = a3;
}

- (BOOL)compressedKeysAllowed
{
  return self->_compressedKeysAllowed;
}

- (void)setCompressedKeysAllowed:(BOOL)a3
{
  self->_compressedKeysAllowed = a3;
}

- (BOOL)confidentialDataAllowed
{
  return self->_confidentialDataAllowed;
}

- (void)setConfidentialDataAllowed:(BOOL)a3
{
  self->_confidentialDataAllowed = a3;
}

- (BOOL)nfcExpressOnlyInLPM
{
  return self->_nfcExpressOnlyInLPM;
}

- (void)setNfcExpressOnlyInLPM:(BOOL)a3
{
  self->_nfcExpressOnlyInLPM = a3;
}

- (BOOL)terminationNotPersisted
{
  return self->_terminationNotPersisted;
}

- (void)setTerminationNotPersisted:(BOOL)a3
{
  self->_terminationNotPersisted = a3;
}

- (unsigned)lengthConfidentialMailBox
{
  return self->_lengthConfidentialMailBox;
}

- (void)setLengthConfidentialMailBox:(unsigned __int16)a3
{
  self->_lengthConfidentialMailBox = a3;
}

- (unsigned)offsetConfidentialMailBox
{
  return self->_offsetConfidentialMailBox;
}

- (void)setOffsetConfidentialMailBox:(unsigned __int16)a3
{
  self->_offsetConfidentialMailBox = a3;
}

- (unsigned)lengthPrivateMailBox
{
  return self->_lengthPrivateMailBox;
}

- (void)setLengthPrivateMailBox:(unsigned __int16)a3
{
  self->_lengthPrivateMailBox = a3;
}

- (unsigned)offsetPrivateMailBox
{
  return self->_offsetPrivateMailBox;
}

- (void)setOffsetPrivateMailBox:(unsigned __int16)a3
{
  self->_offsetPrivateMailBox = a3;
}

@end