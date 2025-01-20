@interface CryptexRemoteServiceNonceAttr
- (CryptexRemoteServiceNonceAttr)init;
- (unint64_t)getNonceDomainIndex;
- (unint64_t)image_type;
- (unint64_t)persistence;
- (unsigned)ndom_handle;
- (void)getNonceDomainIndex;
- (void)setImage_type:(unint64_t)a3;
- (void)setNdom_handle:(unsigned int)a3;
- (void)setPersistence:(unint64_t)a3;
@end

@implementation CryptexRemoteServiceNonceAttr

- (CryptexRemoteServiceNonceAttr)init
{
  v3.receiver = self;
  v3.super_class = (Class)CryptexRemoteServiceNonceAttr;
  result = [(CryptexRemoteServiceNonceAttr *)&v3 init];
  *(_OWORD *)&result->_image_type = xmmword_21DB1A450;
  result->_ndom_handle = -1;
  return result;
}

- (unint64_t)getNonceDomainIndex
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(CryptexRemoteServiceNonceAttr *)self image_type];
  if (!v3) {
    return 3;
  }
  if (v3 != 1) {
    [(CryptexRemoteServiceNonceAttr *)&v5 getNonceDomainIndex];
  }
  if ([(CryptexRemoteServiceNonceAttr *)self persistence]) {
    return 4;
  }
  else {
    return 2;
  }
}

- (unsigned)ndom_handle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(CryptexRemoteServiceNonceAttr *)self image_type] != 2) {
    [(CryptexRemoteServiceNonceAttr *)&v4 getNonceDomainIndex];
  }
  return self->_ndom_handle;
}

- (unint64_t)image_type
{
  return self->_image_type;
}

- (void)setImage_type:(unint64_t)a3
{
  self->_image_type = a3;
}

- (unint64_t)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(unint64_t)a3
{
  self->_persistence = a3;
}

- (void)setNdom_handle:(unsigned int)a3
{
  self->_ndom_handle = a3;
}

- (void)getNonceDomainIndex
{
}

@end