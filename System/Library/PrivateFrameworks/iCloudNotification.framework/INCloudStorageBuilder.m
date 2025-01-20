@interface INCloudStorageBuilder
+ (id)_backupDevice;
+ (id)_backupDeviceGroup;
+ (id)_backupInfo;
+ (id)_imageURL;
+ (id)_mockMediaStorage;
+ (id)_specifiersInfo;
+ (id)_subscriptionInfo;
+ (id)mockAppCloudStorage;
+ (id)mockCloudStorageSummary;
@end

@implementation INCloudStorageBuilder

+ (id)mockCloudStorageSummary
{
  id v3 = objc_alloc_init((Class)ICQCloudStorageSummary);
  [v3 setDisplayLabel:@"iCloud"];
  [v3 setTotalStorage:&off_1000441D0];
  [v3 setUsedStorage:&off_1000441E8];
  [v3 setFreeStorage:&off_100044200];
  [v3 setCommerceStorage:&off_1000441D0];
  v4 = [a1 _mockMediaStorage];
  v10 = v4;
  v5 = +[NSArray arrayWithObjects:&v10 count:1];
  [v3 setMediaStorage:v5];

  v6 = [a1 _backupInfo];
  [v3 setBackupInfo:v6];

  v7 = [a1 _subscriptionInfo];
  [v3 setSubscriptionInfo:v7];

  v8 = +[NSURL URLWithString:@"https://p109-quota.icloud.com:443/quotaservice/external/ios/17118882597/00008020-001554E43E63002E/getManageCloudStorage"];
  [v3 setManageStorageURL:v8];

  [v3 setManageStorageTitle:@"Manage Plan"];
  return v3;
}

+ (id)mockAppCloudStorage
{
  id v2 = objc_alloc_init((Class)ICQAppCloudStorage);
  [v2 setBundleID:@"com.apple.mobileslideshow"];
  [v2 setStorageUsed:&off_100044218];
  id v3 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v2 setRuiURL:v3];

  v4 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v2 setLiftUIURL:v4];

  return v2;
}

+ (id)_mockMediaStorage
{
  id v2 = objc_alloc_init((Class)ICQMediaCloudStorage);
  [v2 setMediaType:@"photos"];
  [v2 setDisplayLabel:@"Photos and Videos"];
  [v2 setDisplayColor:@"FFCC00"];
  [v2 setDisplayColorDark:@"CD9F00"];
  [v2 setStorageUsed:&off_1000441E8];
  return v2;
}

+ (id)_backupInfo
{
  id v3 = objc_alloc_init((Class)ICQBackupInfo);
  [v3 setNoOfBackupDevices:&off_100044230];
  v4 = [a1 _backupDeviceGroup];
  v7 = v4;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [v3 setDeviceGroups:v5];

  return v3;
}

+ (id)_backupDeviceGroup
{
  id v3 = objc_alloc_init((Class)ICQBackupDeviceGroup);
  [v3 setSectionHeader:@"All Device Backups"];
  [v3 setSectionFooter:@"Some footer text"];
  v4 = [a1 _backupDevice];
  v7 = v4;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [v3 setBackupDevices:v5];

  return v3;
}

+ (id)_backupDevice
{
  id v3 = objc_alloc_init((Class)ICQBackupDevice);
  [v3 setDeviceName:@"iPhone"];
  [v3 setDeviceSubtitle:@"This iPhone"];
  [v3 setDeviceUDID:@"0123456789"];
  [v3 setStorageUsed:&off_1000441E8];
  [v3 setStorageUsedLabel:@"50 GB"];
  v4 = [a1 _imageURL];
  [v3 setImageURL:v4];

  [v3 setIsActive:1];
  return v3;
}

+ (id)_subscriptionInfo
{
  id v3 = objc_alloc_init((Class)ICQSubscriptionInfo);
  [v3 setICloudPlusSubscriber:1];
  v4 = [a1 _specifiersInfo];
  [v3 setSpecifiersInfo:v4];

  return v3;
}

+ (id)_specifiersInfo
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)ICQSpecifierInfo);
  [v4 setType:@"LINK_CELL"];
  [v4 setIdentifier:@"FAMILY_SHARING"];
  [v4 setTitle:@"Share with Family"];
  [v4 setSubTitle:&stru_1000438D8];
  v5 = [a1 _imageURL];
  [v4 setIconURL:v5];

  v6 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v4 setActionURL:v6];

  [v3 addObject:v4];
  id v7 = objc_alloc_init((Class)ICQSpecifierInfo);
  [v7 setType:@"SUBTITLE_CELL"];
  [v7 setIdentifier:@"STORAGE_UPGRADE"];
  [v7 setTitle:@"Manage Plan"];
  [v7 setSubTitle:@"iCloud+ with 50 GB"];
  v8 = [a1 _imageURL];
  [v7 setIconURL:v8];

  v9 = +[NSURL URLWithString:@"https://p110-quota.icloud.com:443/quotaservice/external/ios/17118882597/00008020-001554E43E63002E/upsellUI?context=VXBncmFkZVN0b3JhZ2VfbWFuYWdlU3RvcmFnZV9zZXR0aW5nc01hbmFnZVN0b3JhZ2VfbWFuYWdlU3RvcmFnZV9udWxsX251bGw="];
  [v7 setActionURL:v9];

  [v3 addObject:v7];
  id v10 = [v3 copy];

  return v10;
}

+ (id)_imageURL
{
  id v2 = objc_alloc_init((Class)ICQImageURL);
  id v3 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v2 setURL1x:v3];

  id v4 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v2 setURL2x:v4];

  v5 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v2 setURL3x:v5];

  return v2;
}

@end