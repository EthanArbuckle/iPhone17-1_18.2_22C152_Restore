@interface MSDServiceResolutionHelper
+ (id)createMSResolutionInfoObject:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5;
@end

@implementation MSDServiceResolutionHelper

+ (id)createMSResolutionInfoObject:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[MSDPublicDBManager getCachedPublicInfoForBundleID:v9];
  id v11 = objc_alloc((Class)MSServiceAppInfo);
  v12 = [v10 serviceName];
  id v13 = [v11 initWithServiceName:v12 serviceBundleID:v9];

  v14 = [v10 bundleIDS];
  id v15 = [v14 copy];
  [v13 setAlternateBundleIDS:v15];

  id v16 = [objc_alloc((Class)MSUserAccountInfo) initWithHomeUserID:v8 sharedUserID:v7];
  id v17 = [objc_alloc((Class)MSServiceResolutionInfo) initWithServiceAppInfo:v13 userAccountInfo:v16];

  return v17;
}

@end