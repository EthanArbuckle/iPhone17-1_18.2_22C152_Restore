@interface ATXHeroEntry
- (ATXHeroEntry)initWithAdamId:(unint64_t)a3 urlHash:(id)a4 location:(CLLocationCoordinate2D)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8 poiCategory:(id)a9 poiMuid:(id)a10;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppAndClipEntry:(id)a3;
- (BOOL)isTouristApp;
- (CLLocationCoordinate2D)location;
- (NSNumber)poiMuid;
- (NSString)poiCategory;
- (NSString)urlHash;
- (id)heroDataForLocation:(id)a3;
- (unint64_t)adamId;
- (unint64_t)radiusInMeters;
- (unint64_t)rank;
@end

@implementation ATXHeroEntry

- (ATXHeroEntry)initWithAdamId:(unint64_t)a3 urlHash:(id)a4 location:(CLLocationCoordinate2D)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8 poiCategory:(id)a9 poiMuid:(id)a10
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  id v18 = a4;
  id v19 = a9;
  id v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)ATXHeroEntry;
  v21 = [(ATXHeroEntry *)&v25 init];
  v22 = v21;
  if (v21)
  {
    v21->_adamId = a3;
    objc_storeStrong((id *)&v21->_urlHash, a4);
    v22->_location.CLLocationDegrees latitude = latitude;
    v22->_location.CLLocationDegrees longitude = longitude;
    v22->_radiusInMeters = a6;
    v22->_rank = a7;
    v22->_isTouristApp = a8;
    objc_storeStrong((id *)&v22->_poiCategory, a9);
    objc_storeStrong((id *)&v22->_poiMuid, a10);
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXHeroEntry *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHeroEntry *)self isEqualToAppAndClipEntry:v5];

  return v6;
}

- (BOOL)isEqualToAppAndClipEntry:(id)a3
{
  id v4 = a3;
  unint64_t adamId = self->_adamId;
  if (adamId != [v4 adamId])
  {
    char v8 = 0;
    goto LABEL_6;
  }
  urlHash = self->_urlHash;
  v7 = [v4 urlHash];
  if (urlHash == v7
    && (double latitude = self->_location.latitude, [v4 location], latitude == v11)
    && (double longitude = self->_location.longitude, [v4 location], longitude == v13)
    && (unint64_t radiusInMeters = self->_radiusInMeters, radiusInMeters == [v4 radiusInMeters])
    && (unint64_t rank = self->_rank, rank == [v4 rank])
    && (uint64_t isTouristApp = self->_isTouristApp, isTouristApp == [v4 isTouristApp]))
  {
    poiCategory = self->_poiCategory;
    if (!poiCategory)
    {
      uint64_t isTouristApp = [v4 poiCategory];
      if (!isTouristApp)
      {
        char v8 = 1;
LABEL_20:

        goto LABEL_4;
      }
    }
    uint64_t v18 = [v4 poiCategory];
    if (v18)
    {
      id v19 = (void *)v18;
      id v20 = self->_poiCategory;
      v21 = [v4 poiCategory];
      char v8 = [(NSString *)v20 isEqualToString:v21];

      if (!poiCategory) {
        goto LABEL_20;
      }
    }
    else
    {
      char v8 = 0;
      if (!poiCategory) {
        goto LABEL_20;
      }
    }
  }
  else
  {
    char v8 = 0;
  }
LABEL_4:

LABEL_6:
  return v8;
}

- (id)heroDataForLocation:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F477D8]);
  v5 = (void *)[v4 initWithPredictedAdamId:self->_adamId bundleId:*MEMORY[0x263F47818] latitude:self->_radiusInMeters longitude:self->_rank radiusInMeters:self->_isTouristApp rank:self->_urlHash isTouristApp:self->_location.latitude score:self->_location.longitude urlHash:(double)(unint64_t)*MEMORY[0x263F47808] clipMetadata:0 poiCategory:self->_poiCategory poiMuid:self->_poiMuid];

  return v5;
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (CLLocationCoordinate2D)location
{
  double latitude = self->_location.latitude;
  double longitude = self->_location.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (unint64_t)radiusInMeters
{
  return self->_radiusInMeters;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (BOOL)isTouristApp
{
  return self->_isTouristApp;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (NSNumber)poiMuid
{
  return self->_poiMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiMuid, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);

  objc_storeStrong((id *)&self->_urlHash, 0);
}

@end