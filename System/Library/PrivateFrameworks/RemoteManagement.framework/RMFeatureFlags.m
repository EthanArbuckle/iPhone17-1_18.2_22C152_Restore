@interface RMFeatureFlags
+ (BOOL)isAllowedDeclarationType:(id)a3;
+ (BOOL)isAllowedStatusItem:(id)a3;
+ (BOOL)isAllowedXPCServiceName:(id)a3;
@end

@implementation RMFeatureFlags

+ (BOOL)isAllowedXPCServiceName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DiskManagementSubscriber"])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isDiskManagementSubscriberEnabled];
  }
  else if ([v3 isEqualToString:@"ManagedAppsSubscriber"])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isManagedAppsEnabled];
  }
  else if ([v3 isEqualToString:@"NetworkEAPSubscriber"])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isNetworkEAPConfigurationEnabled];
  }
  else
  {
    if (![v3 isEqualToString:@"NetworkWiFiSubscriber"])
    {
      BOOL v5 = 1;
      goto LABEL_10;
    }
    unsigned __int8 v4 = +[RMFeatureFlags isNetworkWiFiConfigurationEnabled];
  }
  BOOL v5 = v4;
LABEL_10:

  return v5;
}

+ (BOOL)isAllowedDeclarationType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[RMModelAppManagedDeclaration registeredIdentifier];
  unsigned int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    unsigned __int8 v6 = +[RMFeatureFlags isManagedAppsEnabled];
  }
  else
  {
    v7 = +[RMModelAppMarketplaceDeclaration registeredIdentifier];
    unsigned int v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      unsigned __int8 v6 = +[RMFeatureFlags isAppDistributionPVEnabled];
    }
    else
    {
      v9 = +[RMModelNetworkEAPDeclaration registeredIdentifier];
      unsigned int v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        unsigned __int8 v6 = +[RMFeatureFlags isNetworkEAPConfigurationEnabled];
      }
      else
      {
        v11 = +[RMModelNetworkWiFiDeclaration registeredIdentifier];
        unsigned int v12 = [v3 isEqualToString:v11];

        if (!v12)
        {
          BOOL v13 = 1;
          goto LABEL_10;
        }
        unsigned __int8 v6 = +[RMFeatureFlags isNetworkWiFiConfigurationEnabled];
      }
    }
  }
  BOOL v13 = v6;
LABEL_10:

  return v13;
}

+ (BOOL)isAllowedStatusItem:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:RMModelStatusItemAppManagedList])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isManagedAppsEnabled];
  }
  else
  {
    if (![v3 isEqualToString:RMModelStatusItemDiskManagementFileVaultEnabled])
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
    unsigned __int8 v4 = +[RMFeatureFlags isDiskManagementSubscriberEnabled];
  }
  BOOL v5 = v4;
LABEL_7:

  return v5;
}

@end