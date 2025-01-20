@interface PXSharedAlbumsActivityEntryAvatarConfiguration
- (NSString)email;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)phone;
- (PXSharedAlbumsActivityEntryAvatarConfiguration)initWithEmail:(id)a3 phone:(id)a4 firstName:(id)a5 lastName:(id)a6;
@end

@implementation PXSharedAlbumsActivityEntryAvatarConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)phone
{
  return self->_phone;
}

- (NSString)email
{
  return self->_email;
}

- (PXSharedAlbumsActivityEntryAvatarConfiguration)initWithEmail:(id)a3 phone:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXSharedAlbumsActivityEntryAvatarConfiguration;
  v14 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    email = v14->_email;
    v14->_email = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    phone = v14->_phone;
    v14->_phone = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    firstName = v14->_firstName;
    v14->_firstName = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    lastName = v14->_lastName;
    v14->_lastName = (NSString *)v21;
  }
  return v14;
}

@end