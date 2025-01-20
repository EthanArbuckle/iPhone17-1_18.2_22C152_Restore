@interface NTKDComplicationStoreComplicationDescriptorMigrator
- (NTKDComplicationStoreComplicationDescriptorMigrator)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4;
- (void)run;
@end

@implementation NTKDComplicationStoreComplicationDescriptorMigrator

- (NTKDComplicationStoreComplicationDescriptorMigrator)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKDComplicationStoreComplicationDescriptorMigrator;
  v8 = [(NTKDComplicationStoreComplicationDescriptorMigrator *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    collectionIdentifier = v8->_collectionIdentifier;
    v8->_collectionIdentifier = v9;

    objc_storeStrong((id *)&v8->_deviceUUID, a4);
  }

  return v8;
}

- (void)run
{
  deviceUUID = self->_deviceUUID;
  if (deviceUUID) {
    sub_100028BF8(deviceUUID);
  }
  else {
    sub_10002F41C();
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v7 stringByAppendingString:@"RemoteComplications"];
  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    [v6 removeItemAtPath:v3 error:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end