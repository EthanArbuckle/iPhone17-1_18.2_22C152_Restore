@interface COSiMessageFaceTimeAuthController
+ (id)DSIDForIDSAccount:(id)a3;
+ (id)altDSIDForIDSAccount:(id)a3;
+ (id)faceTimeAccountInAccountStore;
+ (id)iMessageAccountInAccountStore;
+ (id)usernameForIDSAccount:(id)a3;
@end

@implementation COSiMessageFaceTimeAuthController

+ (id)usernameForIDSAccount:(id)a3
{
  return [a3 username];
}

+ (id)DSIDForIDSAccount:(id)a3
{
  id v3 = a3;
  v4 = sub_100031C7C();
  v5 = [v4 DSIDForAccount:v3 service:AIDAServiceTypeMessages];

  return v5;
}

+ (id)altDSIDForIDSAccount:(id)a3
{
  return 0;
}

+ (id)iMessageAccountInAccountStore
{
  v2 = sub_100031C7C();
  id v3 = [v2 accountForService:AIDAServiceTypeMessages];

  return v3;
}

+ (id)faceTimeAccountInAccountStore
{
  v2 = sub_100031C7C();
  id v3 = [v2 accountForService:AIDAServiceTypeFaceTime];

  return v3;
}

@end