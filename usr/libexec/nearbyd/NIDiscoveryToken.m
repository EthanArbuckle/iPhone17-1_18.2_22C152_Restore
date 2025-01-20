@interface NIDiscoveryToken
+ (BOOL)supportsSecureCoding;
+ (id)_identifyingSequenceFromBytes:(id)a3;
+ (id)deserialize:(id)a3;
+ (id)generateFindingTokenWithIRK:(id)a3;
+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4;
+ (id)serialize:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NIDiscoveryToken)initWithBytes:(id)a3;
- (NIDiscoveryToken)initWithCoder:(id)a3;
- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3;
- (NSData)rawToken;
- (NSString)rawTokenAsString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)deviceCapabilities;
- (id)getIRK;
- (id)getSessionIdentifier;
- (id)objectInRawTokenOPACKDictForKey:(id)a3;
- (id)shortDeviceAddress;
- (int64_t)tokenVariant;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIDiscoveryToken

- (NIDiscoveryToken)initWithBytes:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 58, @"Invalid parameter not satisfying: %@", @"bytes" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)NIDiscoveryToken;
  v7 = [(NIDiscoveryToken *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rawToken, a3);
    uint64_t v9 = +[NIDiscoveryToken _identifyingSequenceFromBytes:v6];
    identifyingSequence = v8->_identifyingSequence;
    v8->_identifyingSequence = (NSData *)v9;
  }
  return v8;
}

+ (id)_identifyingSequenceFromBytes:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    __assert_rtn("+[NIDiscoveryToken _identifyingSequenceFromBytes:]", "NIConfiguration.mm", 68, "bytes");
  }
  id v5 = [v3 copy];
  id v6 = (void *)OPACKDecodeData();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_1001C4478;
    v18 = sub_1001C4488;
    id v19 = (id)objc_opt_new();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001C4490;
    v11[3] = &unk_100857998;
    id v12 = v6;
    objc_super v13 = &v14;
    [&off_100878508 enumerateObjectsUsingBlock:v11];
    id v7 = [(id)v15[5] length];
    v8 = v5;
    if (v7) {
      v8 = (void *)v15[5];
    }
    id v9 = v8;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (id)objectInRawTokenOPACKDictForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 111, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  id v6 = (void *)OPACKDecodeData();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 objectForKey:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)tokenVariant
{
  v2 = [(NIDiscoveryToken *)self objectInRawTokenOPACKDictForKey:&off_100878760];
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v2 integerValue] <= 1)
  {
    id v3 = [v2 integerValue];
  }
  else
  {
    id v3 = 0;
  }

  return (int64_t)v3;
}

- (id)deviceCapabilities
{
  v2 = [(NIDiscoveryToken *)self objectInRawTokenOPACKDictForKey:&off_100878778];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = -[NIDeviceCapabilities initWithBitmap:]([NIDeviceCapabilities alloc], "initWithBitmap:", [v2 unsignedCharValue]);
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)getIRK
{
  v2 = [(NIDiscoveryToken *)self rawToken];
  id v3 = (void *)OPACKDecodeData();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [v3 objectForKey:&off_100878700];
    id v5 = v4;
    if (v4 && [v4 length] == (id)16) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)getSessionIdentifier
{
  v2 = [(NIDiscoveryToken *)self rawToken];
  id v3 = (void *)OPACKDecodeData();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [v3 objectForKey:&off_1008786E8];
    id v5 = v4;
    if (v4 && [v4 length] == (id)3) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)serialize:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 0x3E8)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = sub_1001C4478;
    v11 = sub_1001C4488;
    id v12 = (id)objc_opt_new();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001C4ACC;
    v6[3] = &unk_1008579C0;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)deserialize:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] <= 0xF4240)
  {
    id v4 = objc_opt_new();
    unint64_t v5 = 0;
    do
    {
      if (v5 >= (unint64_t)[v3 length]) {
        break;
      }
      id v6 = v3;
      uint64_t v7 = [v6 bytes];
      uint64_t v8 = v7[v5];
      unint64_t v9 = v5 + 1;
      if (v7[v5])
      {
        if (v5 + v8 >= (unint64_t)[v6 length]) {
          break;
        }
        v10 = [v6 subdataWithRange:NSMakeRange(v5 + 1, v8)];
        v11 = [[NIDiscoveryToken alloc] initWithBytes:v10];
        [v4 addObject:v11];
        v9 += v8;
      }
      unint64_t v5 = v9;
    }
    while (v9 < 0xF4240);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)rawTokenAsString
{
  return (NSString *)sub_10002D648(self->_rawToken, 0);
}

- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3
{
  unsigned __int16 v9 = a3;
  id v4 = +[NSData dataWithBytes:&v9 length:2];
  unint64_t v5 = [[NIDiscoveryToken alloc] initWithBytes:v4];

  if (v5)
  {
    uint64_t v6 = +[NSNumber numberWithUnsignedShort:v9];
    shortDeviceAddress = v5->_shortDeviceAddress;
    v5->_shortDeviceAddress = (NSNumber *)v6;
  }
  return v5;
}

- (id)shortDeviceAddress
{
  return self->_shortDeviceAddress;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  shortDeviceAddress = self->_shortDeviceAddress;
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  if (shortDeviceAddress)
  {
    uint64_t v7 = (unsigned __int16)[(NSNumber *)self->_shortDeviceAddress intValue];
    return [v6 initWithDeviceAddress:v7];
  }
  else
  {
    rawToken = self->_rawToken;
    return [v5 initWithBytes:rawToken];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_rawToken forKey:@"rawToken"];
  [v4 encodeObject:self->_shortDeviceAddress forKey:@"shortDeviceAddress"];
}

- (NIDiscoveryToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawToken"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortDeviceAddress"];
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = 0;
          goto LABEL_10;
        }
        uint64_t v7 = -[NIDiscoveryToken initWithDeviceAddress:](self, "initWithDeviceAddress:", (unsigned __int16)[v6 intValue]);
      }
      else
      {
        uint64_t v7 = [(NIDiscoveryToken *)self initWithBytes:v5];
      }
      self = v7;
      uint64_t v8 = self;
LABEL_10:

      goto LABEL_11;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NIDiscoveryToken *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 == self) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = [(NSData *)self->_identifyingSequence isEqualToData:v4->_identifyingSequence];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_identifyingSequence hash];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NIDiscoveryToken *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  return (id)CUPrintNSObjectMasked();
}

- (NSData)rawToken
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyingSequence, 0);
  objc_storeStrong((id *)&self->_shortDeviceAddress, 0);

  objc_storeStrong((id *)&self->_rawToken, 0);
}

+ (id)generateFindingTokenWithIRK:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 29, @"Invalid parameter not satisfying: %@", @"IRK" object file lineNumber description];
  }
  if ([v5 length] != (id)16)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 30, @"Invalid parameter not satisfying: %@", @"IRK.length == NIDiscoveryTokenIRKLengthBytes" object file lineNumber description];
  }
  v14[0] = &off_100878A90;
  v14[1] = &off_100878AC0;
  v15[0] = &off_100878AA8;
  v15[1] = v5;
  v14[2] = &off_100878AD8;
  uint64_t v6 = +[NSData dataWithBytes:&unk_1004C0FF8 length:3];
  v15[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  Data = (void *)OPACKEncoderCreateData();
  if (!Data)
  {
    objc_super v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 38, @"Invalid parameter not satisfying: %@", @"tokenData" object file lineNumber description];
  }
  unsigned __int16 v9 = [[NIDiscoveryToken alloc] initWithBytes:Data];

  return v9;
}

+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4
{
  id v4 = +[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", a3, a4);

  return v4;
}

@end