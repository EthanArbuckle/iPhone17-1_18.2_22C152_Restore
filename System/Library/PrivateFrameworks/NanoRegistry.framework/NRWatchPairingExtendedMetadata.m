@interface NRWatchPairingExtendedMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isCellularEnabled;
- (BOOL)postFailsafeObliteration;
- (NRWatchPairingExtendedMetadata)initWithCoder:(id)a3;
- (NSString)productType;
- (id)description;
- (int64_t)chipID;
- (int64_t)pairingVersion;
- (unint64_t)encodedSystemVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setChipID:(int64_t)a3;
- (void)setEncodedSystemVersion:(unint64_t)a3;
- (void)setIsCellularEnabled:(BOOL)a3;
- (void)setPairingVersion:(int64_t)a3;
- (void)setPostFailsafeObliteration:(BOOL)a3;
- (void)setProductType:(id)a3;
@end

@implementation NRWatchPairingExtendedMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = "YES";
  if (self->_postFailsafeObliteration) {
    v3 = "YES";
  }
  else {
    v3 = "NO";
  }
  if (!self->_isCellularEnabled) {
    v2 = "NO";
  }
  return (id)[NSString stringWithFormat:@"{ chipID = %ld pairingVersion = %ld productType = \"%@\" postFailsafeObliteration = \"%s\" isCellularEnabled = \"%s\" encodedSystemVersion = \"%ld\" }", *(_OWORD *)&self->_chipID, self->_productType, v3, v2, self->_encodedSystemVersion];
}

- (NRWatchPairingExtendedMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRWatchPairingExtendedMetadata;
  v5 = [(NRWatchPairingExtendedMetadata *)&v9 init];
  if (v5)
  {
    v5->_chipID = [v4 decodeIntegerForKey:@"chipID"];
    v5->_pairingVersion = [v4 decodeIntegerForKey:@"pairingVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v6;

    v5->_postFailsafeObliteration = [v4 decodeBoolForKey:@"postFailsafeObliteration"];
    v5->_isCellularEnabled = [v4 decodeBoolForKey:@"isCellularEnabled"];
    v5->_encodedSystemVersion = [v4 decodeIntegerForKey:@"encodedSystemVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t chipID = self->_chipID;
  id v5 = a3;
  [v5 encodeInteger:chipID forKey:@"chipID"];
  [v5 encodeInteger:self->_pairingVersion forKey:@"pairingVersion"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
  [v5 encodeBool:self->_postFailsafeObliteration forKey:@"postFailsafeObliteration"];
  [v5 encodeBool:self->_isCellularEnabled forKey:@"isCellularEnabled"];
  [v5 encodeInteger:self->_encodedSystemVersion forKey:@"encodedSystemVersion"];
}

- (int64_t)chipID
{
  return self->_chipID;
}

- (void)setChipID:(int64_t)a3
{
  self->_int64_t chipID = a3;
}

- (int64_t)pairingVersion
{
  return self->_pairingVersion;
}

- (void)setPairingVersion:(int64_t)a3
{
  self->_pairingVersion = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (BOOL)postFailsafeObliteration
{
  return self->_postFailsafeObliteration;
}

- (void)setPostFailsafeObliteration:(BOOL)a3
{
  self->_postFailsafeObliteration = a3;
}

- (BOOL)isCellularEnabled
{
  return self->_isCellularEnabled;
}

- (void)setIsCellularEnabled:(BOOL)a3
{
  self->_isCellularEnabled = a3;
}

- (unint64_t)encodedSystemVersion
{
  return self->_encodedSystemVersion;
}

- (void)setEncodedSystemVersion:(unint64_t)a3
{
  self->_encodedSystemVersion = a3;
}

- (void).cxx_destruct
{
}

@end