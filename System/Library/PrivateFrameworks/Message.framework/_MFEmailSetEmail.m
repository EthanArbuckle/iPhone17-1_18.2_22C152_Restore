@interface _MFEmailSetEmail
- (BOOL)isEqualToEmail:(id)a3;
- (NSString)address;
- (NSString)commentedAddress;
- (_MFEmailSetEmail)initWithAddress:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAddress:(id)a3;
@end

@implementation _MFEmailSetEmail

- (_MFEmailSetEmail)initWithAddress:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MFEmailSetEmail;
  v4 = [(_MFEmailSetEmail *)&v6 init];
  [(_MFEmailSetEmail *)v4 setAddress:a3];
  if (!v4->_encodedAddress)
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MFEmailSetEmail;
  [(_MFEmailSetEmail *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%lu) %@", -[_MFEmailSetEmail hash](self, "hash"), -[_MFEmailSetEmail address](self, "address")];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqualToEmail:(id)a3
{
  return [(NSString *)self->_encodedAddress mf_isEqualToAddress:*((void *)a3 + 2)];
}

- (void)setAddress:(id)a3
{
  self->_encodedAddress = 0;
  id v6 = (id)objc_msgSend(a3, "mf_copyUncommentedAddress");
  v5 = objc_msgSend(v6, "mf_copyIDNAEncodedEmailAddress");
  if ([objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v5])
  {
    self->_hash = CFHash((CFTypeRef)[v5 lowercaseString]);
    self->_encodedAddress = (NSString *)v5;
    self->_comment = (NSString *)objc_msgSend(a3, "mf_copyAddressComment");
  }
}

- (NSString)address
{
  v2 = (void *)[(NSString *)self->_encodedAddress mf_copyIDNADecodedEmailAddress];
  return (NSString *)v2;
}

- (NSString)commentedAddress
{
  v2 = objc_msgSend((id)objc_msgSend(NSString, "mf_formattedAddressWithName:email:useQuotes:", self->_comment, self->_encodedAddress, 1), "mf_copyIDNADecodedEmailAddress");
  return (NSString *)v2;
}

@end