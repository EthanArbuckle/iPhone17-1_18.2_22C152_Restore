@interface PUCurationGeoHashContainer
- (NSArray)assetUUIDs;
- (NSString)cityName;
- (NSString)geoHash;
- (PUCurationGeoHashContainer)initWithGeoHash:(id)a3 assetUUIDs:(id)a4 cityName:(id)a5;
- (int64_t)assetCount;
@end

@implementation PUCurationGeoHashContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityName, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_geoHash, 0);
}

- (NSString)cityName
{
  return self->_cityName;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (NSString)geoHash
{
  return self->_geoHash;
}

- (PUCurationGeoHashContainer)initWithGeoHash:(id)a3 assetUUIDs:(id)a4 cityName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PUCurationGeoHashContainer;
  v12 = [(PUCurationGeoHashContainer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_geoHash, a3);
    objc_storeStrong((id *)&v13->_assetUUIDs, a4);
    v13->_assetCount = [(NSArray *)v13->_assetUUIDs count];
    objc_storeStrong((id *)&v13->_cityName, a5);
  }

  return v13;
}

@end