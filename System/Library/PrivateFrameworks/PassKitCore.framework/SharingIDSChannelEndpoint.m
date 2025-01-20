@interface SharingIDSChannelEndpoint
+ (id)_properties;
+ (id)databaseTable;
- (SharingIDSChannelEndpoint)initWithIDSEndpoint:(id)a3 inDatabase:(id)a4;
@end

@implementation SharingIDSChannelEndpoint

- (SharingIDSChannelEndpoint)initWithIDSEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v6 deviceIdentifier];
  [v8 setObjectOrNull:v9 forKey:@"ia"];

  id v10 = [v6 isDeviceOnSameIDSAccount];
  CFStringRef v11 = @"true";
  if (v10 != (id)1) {
    CFStringRef v11 = 0;
  }
  if (v10 == (id)2) {
    CFStringRef v12 = @"false";
  }
  else {
    CFStringRef v12 = v11;
  }
  [v8 setObjectOrNull:v12 forKey:@"ib"];
  v13 = [v6 idsCorrelationIdentifier];
  [v8 setObjectOrNull:v13 forKey:@"ic"];

  v14 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v7];
  return v14;
}

+ (id)databaseTable
{
  return @"breakfast_burrito";
}

+ (id)_properties
{
  v4[0] = @"ia";
  v4[1] = @"ib";
  v4[2] = @"ic";
  v2 = +[NSArray arrayWithObjects:v4 count:3];
  return v2;
}

@end