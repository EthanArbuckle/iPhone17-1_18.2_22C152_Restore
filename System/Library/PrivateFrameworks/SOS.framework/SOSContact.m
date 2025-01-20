@interface SOSContact
- (NSString)name;
- (NSString)nameContactIdentifier;
- (NSString)phoneNumber;
- (NSString)phoneNumberContactIdentifier;
- (void)setName:(id)a3;
- (void)setNameContactIdentifier:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumberContactIdentifier:(id)a3;
@end

@implementation SOSContact

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)nameContactIdentifier
{
  return self->_nameContactIdentifier;
}

- (void)setNameContactIdentifier:(id)a3
{
}

- (NSString)phoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier;
}

- (void)setPhoneNumberContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberContactIdentifier, 0);
  objc_storeStrong((id *)&self->_nameContactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end