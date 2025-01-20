@interface OpenOfflineMapsManagementActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation OpenOfflineMapsManagementActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v13;
    v7 = [v6 downloadRegion];

    if (v7)
    {
      v8 = [v5 appCoordinator];
      v9 = [v6 downloadRegion];
      v10 = [v6 downloadRegionName];
      [v8 showOfflineMapRegionSelectorForRegion:v9 name:v10 pushDataManagementFirst:1];
    }
    else
    {
      id v11 = [v6 path];
      v12 = [v5 appCoordinator];
      v8 = v12;
      if (v11 == (id)1) {
        [v12 viewControllerShowExpiredOfflineMaps:0];
      }
      else {
        [v12 viewControllerShowOfflineMaps:0];
      }
    }
  }
}

@end