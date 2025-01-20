@interface COSiCloudAuthController
+ (id)DSIDForiCloudAccount:(id)a3;
+ (id)altDSIDForiCloudAccount:(id)a3;
+ (id)iCloudAccountInAccountStore;
+ (id)usernameForiCloudAccount:(id)a3;
@end

@implementation COSiCloudAuthController

+ (id)usernameForiCloudAccount:(id)a3
{
  return [a3 username];
}

+ (id)DSIDForiCloudAccount:(id)a3
{
  id v3 = a3;
  v4 = sub_100031C7C();
  v5 = [v4 DSIDForAccount:v3 service:AIDAServiceTypeCloud];

  return v5;
}

+ (id)altDSIDForiCloudAccount:(id)a3
{
  id v3 = a3;
  v4 = sub_100031C7C();
  v5 = [v4 altDSIDForAccount:v3 service:AIDAServiceTypeCloud];

  return v5;
}

+ (id)iCloudAccountInAccountStore
{
  v2 = sub_100031C7C();
  id v3 = [v2 accountForService:AIDAServiceTypeCloud];

  return v3;
}

@end