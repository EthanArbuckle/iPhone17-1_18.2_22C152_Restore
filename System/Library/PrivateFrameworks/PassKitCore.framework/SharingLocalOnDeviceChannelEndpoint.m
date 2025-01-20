@interface SharingLocalOnDeviceChannelEndpoint
+ (id)_properties;
+ (id)databaseTable;
- (SharingLocalOnDeviceChannelEndpoint)initWithLocalEndpoint:(id)a3 inDatabase:(id)a4;
@end

@implementation SharingLocalOnDeviceChannelEndpoint

- (SharingLocalOnDeviceChannelEndpoint)initWithLocalEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v7 sourceTransportIdentifier];
  [v8 setObjectOrNull:v9 forKey:@"la"];

  v10 = [v7 destinationTransportIdentifier];

  [v8 setObjectOrNull:v10 forKey:@"lb"];
  v11 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];

  return v11;
}

+ (id)databaseTable
{
  return @"green_eggs_ham";
}

+ (id)_properties
{
  v4[0] = @"la";
  v4[1] = @"lb";
  v2 = +[NSArray arrayWithObjects:v4 count:2];
  return v2;
}

@end