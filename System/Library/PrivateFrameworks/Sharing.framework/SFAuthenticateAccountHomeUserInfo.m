@interface SFAuthenticateAccountHomeUserInfo
- (BOOL)isRMVEnabled;
- (NSUUID)homeUniqueIdentifier;
- (NSUUID)userUniqueIdentifier;
- (SFAuthenticateAccountHomeUserInfo)initWithHomeUUID:(id)a3 userUUID:(id)a4 isRMVEnabled:(BOOL)a5;
@end

@implementation SFAuthenticateAccountHomeUserInfo

- (SFAuthenticateAccountHomeUserInfo)initWithHomeUUID:(id)a3 userUUID:(id)a4 isRMVEnabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFAuthenticateAccountHomeUserInfo;
  v11 = [(SFAuthenticateAccountHomeUserInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeUniqueIdentifier, a3);
    objc_storeStrong((id *)&v12->_userUniqueIdentifier, a4);
    v12->_isRMVEnabled = a5;
  }

  return v12;
}

- (NSUUID)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (NSUUID)userUniqueIdentifier
{
  return self->_userUniqueIdentifier;
}

- (BOOL)isRMVEnabled
{
  return self->_isRMVEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
}

@end