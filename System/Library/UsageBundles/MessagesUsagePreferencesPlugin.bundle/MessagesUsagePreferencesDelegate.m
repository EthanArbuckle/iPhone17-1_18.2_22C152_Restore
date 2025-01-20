@interface MessagesUsagePreferencesDelegate
- (BOOL)allowDeletionForCategory:(id)a3;
- (float)sizeForCategory:(id)a3;
- (id)usageBundleApps;
@end

@implementation MessagesUsagePreferencesDelegate

- (id)usageBundleApps
{
  id v3 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.MobileSMS" withTotalSize:0.0];
  uint64_t v9 = IMSharedHelperMessagesRootFolderPath();
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1), "count"));
  IMSharedHelperMessagesRootFolderPath();
  IMLegacyCalculateFileSizeForPath();
  self->_totalSize = IMRoundFileSize();
  v6 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"Messages (Saved)" value:&stru_40C8 table:@"MessagesUsagePreferences"];
  objc_msgSend(v4, "addObject:", +[PSUsageBundleCategory categoryNamed:withIdentifier:forUsageBundleApp:](PSUsageBundleCategory, "categoryNamed:withIdentifier:forUsageBundleApp:", v6, IMSharedHelperMessagesRootFolderPath(), v3));
  *(float *)&double v7 = (float)self->_totalSize;
  [v3 setTotalSize:v7];
  [v3 setCategories:v4];

  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, 0);
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 0;
}

- (float)sizeForCategory:(id)a3
{
  id v3 = +[NSNumber numberWithUnsignedLongLong:self->_totalSize];

  [(NSNumber *)v3 floatValue];
  return result;
}

@end