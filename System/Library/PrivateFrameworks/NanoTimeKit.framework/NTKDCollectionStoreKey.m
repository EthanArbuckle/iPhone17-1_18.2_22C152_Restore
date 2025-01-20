@interface NTKDCollectionStoreKey
+ (id)keyWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)collectionIdentifier;
- (NSUUID)deviceUUID;
- (id)description;
- (id)plistRepresentation;
- (unint64_t)hash;
@end

@implementation NTKDCollectionStoreKey

+ (id)keyWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[1];
  v8[1] = v6;
  id v10 = v6;

  v11 = (void *)v8[2];
  v8[2] = v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    v4 = [v3 collectionIdentifier];
    if (NTKEqualStrings())
    {
      v5 = [v3 deviceUUID];
      char v6 = NTKEqualObjects();
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_collectionIdentifier hash];
  return (unint64_t)[(NSUUID *)self->_deviceUUID hash] + v3;
}

- (id)plistRepresentation
{
  collectionIdentifier = self->_collectionIdentifier;
  deviceUUID = self->_deviceUUID;
  if (deviceUUID)
  {
    v4 = [(NSUUID *)deviceUUID UUIDString];
    v5 = +[NSString stringWithFormat:@"%@:%@", collectionIdentifier, v4];
  }
  else
  {
    v5 = +[NSString stringWithFormat:@"%@:%@", collectionIdentifier, @"global"];
  }

  return v5;
}

- (id)description
{
  return [(NTKDCollectionStoreKey *)self plistRepresentation];
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end