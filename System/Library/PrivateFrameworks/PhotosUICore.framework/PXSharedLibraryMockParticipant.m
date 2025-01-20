@interface PXSharedLibraryMockParticipant
- (BOOL)isCurrentUser;
- (NSPersonNameComponents)nameComponents;
- (NSString)description;
- (NSString)emailAddress;
- (NSString)localIdentifier;
- (NSString)phoneNumber;
- (PXPerson)person;
- (PXSharedLibraryMockParticipant)init;
- (int64_t)requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 completionHandler:(id)a6;
- (int64_t)status;
- (void)setEmailAddress:(id)a3;
- (void)setIsCurrentUser:(BOOL)a3;
- (void)setNameComponents:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation PXSharedLibraryMockParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setPerson:(id)a3
{
}

- (PXPerson)person
{
  return self->_person;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setNameComponents:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (int64_t)requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 completionHandler:(id)a6
{
  id v6 = a6;
  PXSizeIsEmpty();
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  emailAddress = self->_emailAddress;
  nameComponents = self->_nameComponents;
  unint64_t status = self->_status;
  if (status > 4) {
    v8 = @"Invalid";
  }
  else {
    v8 = off_1E5DBCCE0[status];
  }
  v9 = v8;
  v10 = [v3 stringWithFormat:@"<%@:%p, emailAddress: \"%@\", nameComponents: \"%@\", status: \"%@\">", v4, self, emailAddress, nameComponents, v9];

  return (NSString *)v10;
}

- (PXSharedLibraryMockParticipant)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryMockParticipant;
  v2 = [(PXSharedLibraryMockParticipant *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    localIdentifier = v2->_localIdentifier;
    v2->_localIdentifier = (NSString *)v4;
  }
  return v2;
}

@end