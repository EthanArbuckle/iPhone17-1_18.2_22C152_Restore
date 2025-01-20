@interface TVRCSiriRemoteInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)connected;
- (BOOL)isEqualToRemoteInfo:(id)a3;
- (BOOL)supportsFindMy;
- (CBOOBKeyInfo)cbKeyInfo;
- (NSData)btAddressData;
- (NSData)irkData;
- (NSString)firmwareVersion;
- (NSString)identifier;
- (NSString)name;
- (NSString)serialNumber;
- (NSString)tvModel;
- (NSString)tvName;
- (NSUUID)uuid;
- (TVRCSiriRemoteInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBtAddressData:(id)a3;
- (void)setCbKeyInfo:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIrkData:(id)a3;
- (void)setName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSupportsFindMy:(BOOL)a3;
- (void)setTvModel:(id)a3;
- (void)setTvName:(id)a3;
@end

@implementation TVRCSiriRemoteInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCSiriRemoteInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TVRCSiriRemoteInfo;
  v5 = [(TVRCSiriRemoteInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tvName"];
    tvName = v5->_tvName;
    v5->_tvName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tvModel"];
    tvModel = v5->_tvModel;
    v5->_tvModel = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v14;

    v5->_supportsFindMy = [v4 decodeBoolForKey:@"supportsFindMy"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"btAddressData"];
    btAddressData = v5->_btAddressData;
    v5->_btAddressData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"irkData"];
    irkData = v5->_irkData;
    v5->_irkData = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareVersion"];
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v20;

    v5->_connected = [v4 decodeBoolForKey:@"connected"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_tvName forKey:@"tvName"];
  [v5 encodeObject:self->_tvModel forKey:@"tvModel"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeBool:self->_supportsFindMy forKey:@"supportsFindMy"];
  [v5 encodeObject:self->_btAddressData forKey:@"btAddressData"];
  [v5 encodeObject:self->_irkData forKey:@"irkData"];
  [v5 encodeObject:self->_firmwareVersion forKey:@"firmwareVersion"];
  [v5 encodeBool:self->_connected forKey:@"connected"];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(TVRCSiriRemoteInfo *)self name];
  [v3 appendString:v4 withName:@"name" skipIfEmpty:1];

  id v5 = [(TVRCSiriRemoteInfo *)self tvModel];
  [v3 appendString:v5 withName:@"tvModel" skipIfEmpty:1];

  uint64_t v6 = [(TVRCSiriRemoteInfo *)self tvName];
  [v3 appendString:v6 withName:@"tvName" skipIfEmpty:1];

  v7 = [(TVRCSiriRemoteInfo *)self identifier];
  [v3 appendString:v7 withName:@"identifier" skipIfEmpty:1];

  uint64_t v8 = [(TVRCSiriRemoteInfo *)self serialNumber];
  [v3 appendString:v8 withName:@"serialNumber" skipIfEmpty:1];

  v9 = [(TVRCSiriRemoteInfo *)self firmwareVersion];
  [v3 appendString:v9 withName:@"firmwareVersion" skipIfEmpty:0];

  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCSiriRemoteInfo supportsFindMy](self, "supportsFindMy"), @"supportsFindMy");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCSiriRemoteInfo connected](self, "connected"), @"connected");
  uint64_t v12 = [(TVRCSiriRemoteInfo *)self btAddressData];
  v13 = CUPrintNSDataAddress();
  [v3 appendString:v13 withName:@"btAddressData" skipIfEmpty:1];

  uint64_t v14 = [(TVRCSiriRemoteInfo *)self irkData];
  v15 = CUPrintNSDataHex();
  [v3 appendString:v15 withName:@"irkData" skipIfEmpty:1];

  uint64_t v16 = [v3 build];

  return v16;
}

- (BOOL)isEqualToRemoteInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRCSiriRemoteInfo *)self identifier];
  uint64_t v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TVRCSiriRemoteInfo);
  id v5 = (void *)[(NSString *)self->_name copy];
  [(TVRCSiriRemoteInfo *)v4 setName:v5];

  uint64_t v6 = (void *)[(NSString *)self->_tvModel copy];
  [(TVRCSiriRemoteInfo *)v4 setTvModel:v6];

  v7 = (void *)[(NSString *)self->_tvName copy];
  [(TVRCSiriRemoteInfo *)v4 setTvName:v7];

  uint64_t v8 = (void *)[(NSString *)self->_identifier copy];
  [(TVRCSiriRemoteInfo *)v4 setIdentifier:v8];

  v9 = (void *)[(NSString *)self->_serialNumber copy];
  [(TVRCSiriRemoteInfo *)v4 setSerialNumber:v9];

  [(TVRCSiriRemoteInfo *)v4 setSupportsFindMy:self->_supportsFindMy];
  id v10 = (void *)[(NSData *)self->_btAddressData copy];
  [(TVRCSiriRemoteInfo *)v4 setBtAddressData:v10];

  id v11 = (void *)[(NSData *)self->_irkData copy];
  [(TVRCSiriRemoteInfo *)v4 setIrkData:v11];

  uint64_t v12 = (void *)[(NSString *)self->_firmwareVersion copy];
  [(TVRCSiriRemoteInfo *)v4 setFirmwareVersion:v12];

  [(TVRCSiriRemoteInfo *)v4 setConnected:self->_connected];
  return v4;
}

- (NSUUID)uuid
{
  v2 = [(TVRCSiriRemoteInfo *)self identifier];
  v3 = [v2 dataUsingEncoding:4];

  id v4 = [MEMORY[0x263EFF990] dataWithLength:32];
  id v5 = v3;
  uint64_t v6 = (const void *)[v5 bytes];
  CC_LONG v7 = [v5 length];
  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);
  v9 = objc_msgSend(v8, "subdataWithRange:", 0, 16);
  id v10 = objc_alloc(MEMORY[0x263F08C38]);
  id v11 = v9;
  uint64_t v12 = objc_msgSend(v10, "initWithUUIDBytes:", objc_msgSend(v11, "bytes"));

  return (NSUUID *)v12;
}

- (CBOOBKeyInfo)cbKeyInfo
{
  cbKeyInfo = self->_cbKeyInfo;
  if (!cbKeyInfo)
  {
    id v4 = (CBOOBKeyInfo *)objc_alloc_init(MEMORY[0x263EFEF50]);
    id v5 = self->_cbKeyInfo;
    self->_cbKeyInfo = v4;

    uint64_t v6 = [(TVRCSiriRemoteInfo *)self btAddressData];
    [(CBOOBKeyInfo *)self->_cbKeyInfo setBtAddressData:v6];

    CC_LONG v7 = [(TVRCSiriRemoteInfo *)self irkData];
    [(CBOOBKeyInfo *)self->_cbKeyInfo setIrkData:v7];

    cbKeyInfo = self->_cbKeyInfo;
  }

  return cbKeyInfo;
}

- (void)setTvName:(id)a3
{
}

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (void)setBtAddressData:(id)a3
{
}

- (NSString)tvModel
{
  return self->_tvModel;
}

- (void)setTvModel:(id)a3
{
}

- (NSString)tvName
{
  return self->_tvName;
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (BOOL)supportsFindMy
{
  return self->_supportsFindMy;
}

- (void)setSupportsFindMy:(BOOL)a3
{
  self->_supportsFindMy = a3;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void)setCbKeyInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbKeyInfo, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_tvName, 0);
  objc_storeStrong((id *)&self->_tvModel, 0);

  objc_storeStrong((id *)&self->_btAddressData, 0);
}

@end