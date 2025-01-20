@interface SFContactInfo
+ (BOOL)supportsSecureCoding;
- (NSString)contactIdentifier;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (SFContactInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation SFContactInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFContactInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFContactInfo;
  v5 = [(SFContactInfo *)&v11 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  contactIdentifier = self->_contactIdentifier;
  id v8 = v4;
  if (contactIdentifier)
  {
    [v4 encodeObject:contactIdentifier forKey:@"cnID"];
    id v4 = v8;
  }
  emailAddress = self->_emailAddress;
  if (emailAddress)
  {
    [v8 encodeObject:emailAddress forKey:@"email"];
    id v4 = v8;
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    [v8 encodeObject:phoneNumber forKey:@"phone"];
    id v4 = v8;
  }
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end