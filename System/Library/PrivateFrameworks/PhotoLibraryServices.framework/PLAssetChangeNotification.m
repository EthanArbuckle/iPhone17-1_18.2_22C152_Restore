@interface PLAssetChangeNotification
+ (id)notificationWithChangedAssets:(id)a3;
- (NSSet)updatedAssets;
- (id)_initWithChangedObjects:(id)a3;
- (id)description;
- (id)name;
- (id)object;
- (id)userInfo;
- (void)setUpdatedAssets:(id)a3;
@end

@implementation PLAssetChangeNotification

- (void).cxx_destruct
{
}

- (void)setUpdatedAssets:(id)a3
{
}

- (NSSet)updatedAssets
{
  return self->_updatedAssets;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLAssetChangeNotification;
  v3 = [(PLAssetChangeNotification *)&v8 description];
  v4 = [(PLAssetChangeNotification *)self updatedAssets];
  v5 = [v4 valueForKey:@"objectID"];
  v6 = [v3 stringByAppendingFormat:@" updatedAssets %@", v5];

  return v6;
}

- (id)userInfo
{
  return 0;
}

- (id)object
{
  return 0;
}

- (id)name
{
  v2 = @"PLAssetsDidChangeNotification";
  return @"PLAssetsDidChangeNotification";
}

- (id)_initWithChangedObjects:(id)a3
{
  id v4 = a3;
  v5 = [(PLAssetChangeNotification *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

+ (id)notificationWithChangedAssets:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithChangedObjects:v4];

  return v5;
}

@end