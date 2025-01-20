@interface PDRPairingExtendedMetadata
- (BOOL)isCellularEnabled;
- (BOOL)postFailsafeObliteration;
- (NSString)productType;
- (int64_t)chipID;
- (int64_t)pairingVersion;
- (unint64_t)encodedSystemVersion;
- (void)setChipID:(int64_t)a3;
- (void)setEncodedSystemVersion:(unint64_t)a3;
- (void)setIsCellularEnabled:(BOOL)a3;
- (void)setPairingVersion:(int64_t)a3;
- (void)setPostFailsafeObliteration:(BOOL)a3;
- (void)setProductType:(id)a3;
@end

@implementation PDRPairingExtendedMetadata

- (int64_t)chipID
{
  return self->_chipID;
}

- (void)setChipID:(int64_t)a3
{
  self->_chipID = a3;
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