@interface STSCHWiFiAwareAlternativeCarrier
+ (BOOL)supportsSecureCoding;
+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)serviceIdentifier;
- (STSCHWiFiAwareAlternativeCarrier)initWithCoder:(id)a3;
- (STSCHWiFiAwareAlternativeCarrier)initWithNdefRecordBundle:(id)a3;
- (STSCHWiFiAwareAlternativeCarrier)initWithSecurityInfo:(id)a3 discoveryChannelInfo:(id)a4 powerState:(unint64_t)a5 auxiliaryRecords:(id)a6;
- (STSCHWiFiAwareDiscoveryChannelInfo)discoveryChannelInfo;
- (STSCHWiFiAwareSecurityInfo)securityInfo;
- (id)_createCarrierConfigurationRecord;
- (id)description;
- (void)_initWithCarrierConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscoveryChannelInfo:(id)a3;
- (void)setSecurityInfo:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation STSCHWiFiAwareAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  id v4 = a3;
  [(STSCHAlternativeCarrier *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_securityInfo, @"securityInfos", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_discoveryChannelInfo forKey:@"discoveryChannelInfo"];
}

- (STSCHWiFiAwareAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  objc_super v5 = [(STSCHAlternativeCarrier *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"securityInfos"];
    securityInfo = v5->_securityInfo;
    v5->_securityInfo = (STSCHWiFiAwareSecurityInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveryChannelInfo"];
    discoveryChannelInfo = v5->_discoveryChannelInfo;
    v5->_discoveryChannelInfo = (STSCHWiFiAwareDiscoveryChannelInfo *)v10;
  }
  return v5;
}

- (void)_initWithCarrierConfiguration:(id)a3
{
  id v43 = a3;
  if (([v43 isWiFiAwareConfigurationRecord] & 1) == 0)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSCHWiFiAwareAlternativeCarrier _initWithCarrierConfiguration:]", 313, self, @"Not WiFi Aware Carrier Configuration record", v4, v5, v37);
    goto LABEL_47;
  }
  id v6 = [v43 payload];
  v7 = (unsigned __int8 *)[v6 bytes];

  uint64_t v8 = [v43 payload];
  uint64_t v9 = (uint64_t)[v8 length];

  uint64_t v10 = +[NSMutableArray array];
  objc_super v13 = +[NSMutableArray array];
  if (v9 < 1)
  {
    v30 = 0;
    v14 = 0;
    v29 = 0;
    goto LABEL_39;
  }
  v38 = self;
  v14 = 0;
  int v39 = -1;
  int v40 = -1;
  v15 = &AnalyticsSendEventLazy_ptr;
  int v41 = -1;
  do
  {
    uint64_t v16 = *v7;
    int v17 = v7[1];
    v18 = v7 + 2;
    switch(v17)
    {
      case 3:
        if (v16 >= 2)
        {
          uint64_t v25 = [v15[203] dataWithBytes:v7 + 2 length:(v16 - 1)];

          v14 = (void *)v25;
        }
        break;
      case 2:
        v26 = objc_alloc_init(STSDiffieHellmanParameter);
        [(STSDiffieHellmanParameter *)v26 setPublicKeyGroup:__rev16(*((unsigned __int16 *)v7 + 1))];
        if (v16 >= 4)
        {
          v27 = [v15[203] dataWithBytes:v7 + 4 length:(v16 - 3)];
          [(STSDiffieHellmanParameter *)v26 setPublicKey:v27];
        }
        [v13 addObject:v26];

        break;
      case 1:
        if (v16 >= 2)
        {
          v42 = v14;
          v19 = v13;
          v20 = v15;
          uint64_t v21 = (v16 - 1);
          v22 = v18;
          do
          {
            unsigned int v23 = *v22++;
            v24 = +[NSNumber numberWithUnsignedChar:v23];
            [v10 addObject:v24];

            --v21;
          }
          while (v21);
          v15 = v20;
          objc_super v13 = v19;
          v14 = v42;
        }
        break;
      default:
        if (v17 == 4 && v16 == 2)
        {
          int v41 = *v18;
        }
        else if (v17 == 5 && v16 == 3)
        {
          int v39 = v7[2];
          int v40 = v7[3];
        }
        else if (v17 != 221)
        {
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSCHWiFiAwareAlternativeCarrier _initWithCarrierConfiguration:]", 359, v38, @"Unknown tag:%d", v11, v12, v7[1]);
        }
        break;
    }
    v7 = &v18[v16 - 1];
    uint64_t v9 = v9 - 2 - (v16 - 1);
  }
  while (v9 > 0);
  if (v41 < 0)
  {
    v29 = 0;
  }
  else
  {
    v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  }
  if (v39 < 0)
  {
    v30 = 0;
  }
  else
  {
    v30 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  }
  self = v38;
  if (v40 < 0)
  {
LABEL_39:
    v31 = 0;
    if (v29) {
      goto LABEL_44;
    }
    goto LABEL_40;
  }
  v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  if (v29) {
    goto LABEL_44;
  }
LABEL_40:
  if (v30 || v31)
  {
LABEL_44:
    v33 = [[STSCHWiFiAwareDiscoveryChannelInfo alloc] initWithSupportedBands:v29 operatingClass:v30 channelNumber:v31];
    discoveryChannelInfo = self->_discoveryChannelInfo;
    self->_discoveryChannelInfo = v33;

    if (!v14) {
      goto LABEL_45;
    }
    goto LABEL_43;
  }
  if (!v14)
  {
LABEL_45:
    id v32 = 0;
    goto LABEL_46;
  }
LABEL_43:
  id v32 = [objc_alloc((Class)NSString) initWithData:v14 encoding:4];
LABEL_46:
  v35 = [[STSCHWiFiAwareSecurityInfo alloc] initWithCipherSuites:v10 dhInfo:v13 passphrase:v32];
  securityInfo = self->_securityInfo;
  self->_securityInfo = v35;

LABEL_47:
}

- (STSCHWiFiAwareAlternativeCarrier)initWithSecurityInfo:(id)a3 discoveryChannelInfo:(id)a4 powerState:(unint64_t)a5 auxiliaryRecords:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  v14 = [(STSCHWiFiAwareAlternativeCarrier *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_securityInfo, a3);
    objc_storeStrong((id *)&v15->_discoveryChannelInfo, a4);
    [(STSCHAlternativeCarrier *)v15 setType:1];
    if (a5 >= 3) {
      unint64_t v16 = 3;
    }
    else {
      unint64_t v16 = a5;
    }
    [(STSCHAlternativeCarrier *)v15 setPowerState:v16];
    [(STSCHAlternativeCarrier *)v15 setAuxiliaryRecords:v13];
    int v17 = [(STSCHWiFiAwareAlternativeCarrier *)v15 _createCarrierConfigurationRecord];
    [(STSCHAlternativeCarrier *)v15 setCarrierRecord:v17];
  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  if ([(STSCHAlternativeCarrier *)&v12 isEqual:v4])
  {
    uint64_t v5 = v4;
    securityInfo = self->_securityInfo;
    uint64_t v7 = v5[5];
    if (securityInfo)
    {
      if (!v7 || !-[STSCHWiFiAwareSecurityInfo isEqual:](securityInfo, "isEqual:")) {
        goto LABEL_13;
      }
    }
    else if (v7)
    {
      goto LABEL_13;
    }
    discoveryChannelInfo = self->_discoveryChannelInfo;
    uint64_t v10 = v5[6];
    if (discoveryChannelInfo)
    {
      if (v10 && -[STSCHWiFiAwareDiscoveryChannelInfo isEqual:](discoveryChannelInfo, "isEqual:")) {
        goto LABEL_11;
      }
    }
    else if (!v10)
    {
LABEL_11:
      BOOL v8 = 1;
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (id)description
{
  unint64_t v3 = [(STSCHAlternativeCarrier *)self powerState];
  id v4 = [(STSCHWiFiAwareSecurityInfo *)self->_securityInfo description];
  uint64_t v5 = [(STSCHWiFiAwareDiscoveryChannelInfo *)self->_discoveryChannelInfo description];
  id v6 = [(STSCHAlternativeCarrier *)self auxiliaryRecords];
  uint64_t v7 = [v6 description];
  BOOL v8 = +[NSString stringWithFormat:@"{ type=wifi,powerState=%lu,securityInfo={%@},discoveryInfo={%@},aux=%@ }", v3, v4, v5, v7];

  return v8;
}

- (STSCHWiFiAwareAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  uint64_t v5 = [(STSCHAlternativeCarrier *)&v8 initWithNdefRecordBundle:v4];
  if (v5)
  {
    id v6 = [v4 configurationRecord];
    [(STSCHWiFiAwareAlternativeCarrier *)v5 _initWithCarrierConfiguration:v6];
  }
  return v5;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 configurationRecord];
  unsigned int v6 = [v5 isWiFiAwareConfigurationRecord];

  if (v6) {
    id v7 = [objc_alloc((Class)a1) initWithNdefRecordBundle:v4];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_createCarrierConfigurationRecord
{
  unint64_t v3 = +[NSData dataWithBytes:"application/vnd.wfa.naniso.org:18013:nfc" length:23];
  id v4 = [@"W" dataUsingEncoding:4];
  uint64_t v5 = +[NSMutableData data];
  unsigned int v6 = [(STSCHWiFiAwareSecurityInfo *)self->_securityInfo asData];
  [v5 appendData:v6];

  id v7 = [(STSCHWiFiAwareAlternativeCarrier *)self discoveryChannelInfo];
  objc_super v8 = [v7 asData];
  [v5 appendData:v8];

  uint64_t v9 = [[STSNDEFRecord alloc] initWithFormat:2 type:v3 identifier:v4 payload:v5];

  return v9;
}

- (STSCHWiFiAwareSecurityInfo)securityInfo
{
  return self->_securityInfo;
}

- (void)setSecurityInfo:(id)a3
{
}

- (STSCHWiFiAwareDiscoveryChannelInfo)discoveryChannelInfo
{
  return self->_discoveryChannelInfo;
}

- (void)setDiscoveryChannelInfo:(id)a3
{
}

- (NSData)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_discoveryChannelInfo, 0);

  objc_storeStrong((id *)&self->_securityInfo, 0);
}

@end