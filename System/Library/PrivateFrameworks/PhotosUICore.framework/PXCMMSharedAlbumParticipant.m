@interface PXCMMSharedAlbumParticipant
- (NSString)description;
- (NSString)emailAddressString;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)localizedName;
- (NSString)phoneNumberString;
- (PXCMMSharedAlbumParticipant)initWithRecord:(id)a3;
@end

@implementation PXCMMSharedAlbumParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_phoneNumberString, 0);
  objc_storeStrong((id *)&self->_emailAddressString, 0);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)phoneNumberString
{
  return self->_phoneNumberString;
}

- (NSString)emailAddressString
{
  return self->_emailAddressString;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PXCMMSharedAlbumParticipant *)self emailAddressString];
  v6 = [(PXCMMSharedAlbumParticipant *)self phoneNumberString];
  v7 = [v3 stringWithFormat:@"<%@: %p, email: \"%@\", phone: \"%@\">", v4, self, v5, v6];

  return (NSString *)v7;
}

- (PXCMMSharedAlbumParticipant)initWithRecord:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXCMMSharedAlbumParticipant;
  v5 = [(PXCMMSharedAlbumParticipant *)&v22 init];
  if (v5)
  {
    v6 = [v4 inviteeEmails];
    uint64_t v7 = [v6 firstObject];
    v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = @"bob@bob.com";
    }
    objc_storeStrong((id *)&v5->_emailAddressString, v9);

    v10 = [v4 inviteePhones];
    uint64_t v11 = [v10 firstObject];
    phoneNumberString = v5->_phoneNumberString;
    v5->_phoneNumberString = (NSString *)v11;

    uint64_t v13 = [v4 inviteeFirstName];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"Bob";
    }
    objc_storeStrong((id *)&v5->_localizedName, v15);

    uint64_t v16 = [v4 inviteeFirstName];
    v17 = (void *)v16;
    if (v16) {
      v18 = (__CFString *)v16;
    }
    else {
      v18 = @"Bob";
    }
    objc_storeStrong((id *)&v5->_firstName, v18);

    uint64_t v19 = [v4 inviteeLastName];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v19;
  }
  return v5;
}

@end