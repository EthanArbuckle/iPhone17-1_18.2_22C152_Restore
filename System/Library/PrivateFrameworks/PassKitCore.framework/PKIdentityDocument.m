@interface PKIdentityDocument
- (DIIdentityDocument)wrapped;
- (NSData)encryptedData;
- (PKIdentityDocument)initWithDIIdentityDocument:(id)a3;
- (id)description;
- (void)setWrapped:(id)a3;
@end

@implementation PKIdentityDocument

- (PKIdentityDocument)initWithDIIdentityDocument:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIdentityDocument;
  v6 = [(PKIdentityDocument *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrapped, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [(PKIdentityDocument *)self encryptedData];
  [v3 appendFormat:@"encryptedData: %@ ", v4];

  [v3 appendFormat:@">"];
  id v5 = (void *)[v3 copy];

  return v5;
}

- (NSData)encryptedData
{
  return (NSData *)[(DIIdentityDocument *)self->_wrapped encryptedData];
}

- (DIIdentityDocument)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end