@interface CNContactStore
- (id)w_meContact;
@end

@implementation CNContactStore

- (id)w_meContact
{
  id v2 = objc_alloc_init((Class)CNContactStore);
  id v9 = 0;
  v3 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:&__NSArray0__struct error:&v9];
  id v4 = v9;
  v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    v7 = os_log_create("com.apple.weather", "LocationsOfInterest");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100C11C28(v5, v7);
    }
  }

  return v3;
}

@end