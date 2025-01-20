@interface _PXMomentShareMockParticipant
- (NSString)emailAddressString;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)localizedName;
- (NSString)phoneNumberString;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation _PXMomentShareMockParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->phoneNumberString, 0);
  objc_storeStrong((id *)&self->emailAddressString, 0);
}

- (void)setLastName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)phoneNumberString
{
  return self->phoneNumberString;
}

- (NSString)emailAddressString
{
  return self->emailAddressString;
}

@end