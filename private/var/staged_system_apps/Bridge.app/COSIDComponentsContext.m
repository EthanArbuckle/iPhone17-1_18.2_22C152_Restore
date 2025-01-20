@interface COSIDComponentsContext
- (NSString)osVersionString;
- (NSString)pairingVersionString;
- (unint64_t)material;
- (unint64_t)size;
- (void)setMaterial:(unint64_t)a3;
- (void)setOsVersionString:(id)a3;
- (void)setPairingVersionString:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation COSIDComponentsContext

- (NSString)pairingVersionString
{
  return self->_pairingVersionString;
}

- (void)setPairingVersionString:(id)a3
{
}

- (NSString)osVersionString
{
  return self->_osVersionString;
}

- (void)setOsVersionString:(id)a3
{
}

- (unint64_t)material
{
  return self->_material;
}

- (void)setMaterial:(unint64_t)a3
{
  self->_material = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersionString, 0);

  objc_storeStrong((id *)&self->_pairingVersionString, 0);
}

@end