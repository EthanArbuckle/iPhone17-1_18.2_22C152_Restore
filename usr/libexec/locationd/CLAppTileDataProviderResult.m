@interface CLAppTileDataProviderResult
- (BOOL)touristApp;
- (double)latitude;
- (double)longitude;
- (double)spanLat;
- (double)spanLon;
- (unsigned)adamId;
- (unsigned)ageRating;
- (unsigned)effectiveRadiusMetersIfInstalled;
- (unsigned)heroAppRankInstalled;
- (unsigned)heroAppRankUnInstalled;
- (void)setAdamId:(unsigned int)a3;
- (void)setAgeRating:(unsigned int)a3;
- (void)setEffectiveRadiusMetersIfInstalled:(unsigned int)a3;
- (void)setHeroAppRankInstalled:(unsigned int)a3;
- (void)setHeroAppRankUnInstalled:(unsigned int)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setSpanLat:(double)a3;
- (void)setSpanLon:(double)a3;
- (void)setTouristApp:(BOOL)a3;
@end

@implementation CLAppTileDataProviderResult

- (unsigned)ageRating
{
  return self->_ageRating;
}

- (void)setAgeRating:(unsigned int)a3
{
  self->_ageRating = a3;
}

- (BOOL)touristApp
{
  return self->_touristApp;
}

- (void)setTouristApp:(BOOL)a3
{
  self->_touristApp = a3;
}

- (unsigned)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(unsigned int)a3
{
  self->_adamId = a3;
}

- (unsigned)effectiveRadiusMetersIfInstalled
{
  return self->_effectiveRadiusMetersIfInstalled;
}

- (void)setEffectiveRadiusMetersIfInstalled:(unsigned int)a3
{
  self->_effectiveRadiusMetersIfInstalled = a3;
}

- (unsigned)heroAppRankInstalled
{
  return self->_heroAppRankInstalled;
}

- (void)setHeroAppRankInstalled:(unsigned int)a3
{
  self->_heroAppRankInstalled = a3;
}

- (unsigned)heroAppRankUnInstalled
{
  return self->_heroAppRankUnInstalled;
}

- (void)setHeroAppRankUnInstalled:(unsigned int)a3
{
  self->_heroAppRankUnInstalled = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)spanLat
{
  return self->_spanLat;
}

- (void)setSpanLat:(double)a3
{
  self->_spanLat = a3;
}

- (double)spanLon
{
  return self->_spanLon;
}

- (void)setSpanLon:(double)a3
{
  self->_spanLon = a3;
}

@end