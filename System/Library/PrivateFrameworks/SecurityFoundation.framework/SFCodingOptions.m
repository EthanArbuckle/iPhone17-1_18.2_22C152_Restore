@interface SFCodingOptions
- (NSString)encryptionPassphrase;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)encoding;
- (void)setEncoding:(int64_t)a3;
- (void)setEncryptionPassphrase:(id)a3;
@end

@implementation SFCodingOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setEncoding:*((void *)self->_codingOptionsInternal + 1)];
  [v4 setEncryptionPassphrase:*((void *)self->_codingOptionsInternal + 2)];
  return v4;
}

- (int64_t)encoding
{
  return *((void *)self->_codingOptionsInternal + 1);
}

- (void)setEncoding:(int64_t)a3
{
  *((void *)self->_codingOptionsInternal + 1) = a3;
}

- (NSString)encryptionPassphrase
{
  v2 = (void *)[*((id *)self->_codingOptionsInternal + 2) copy];
  return (NSString *)v2;
}

- (void)setEncryptionPassphrase:(id)a3
{
  *((void *)self->_codingOptionsInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end