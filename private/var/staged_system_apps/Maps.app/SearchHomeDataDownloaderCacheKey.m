@interface SearchHomeDataDownloaderCacheKey
- ($C79183323B9A0D5602617FF3BE5395AC)mapRect;
- (NSString)lprPowerType;
- (SearchHomeDataDownloaderCacheKey)initWithMapRect:(id)a3 mapType:(unint64_t)a4 time:(double)a5 lprPowerType:(id)a6;
- (double)timestamp;
- (unint64_t)mapType;
- (void)setLprPowerType:(id)a3;
- (void)setMapRect:(id)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SearchHomeDataDownloaderCacheKey

- (SearchHomeDataDownloaderCacheKey)initWithMapRect:(id)a3 mapType:(unint64_t)a4 time:(double)a5 lprPowerType:(id)a6
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v11 = a3.var0.var1;
  double v12 = a3.var0.var0;
  v14.receiver = self;
  v14.super_class = (Class)SearchHomeDataDownloaderCacheKey;
  result = [(SearchHomeDataDownloaderCacheKey *)&v14 init];
  if (result)
  {
    result->_mapRect.origin.x = v12;
    result->_mapRect.origin.y = v11;
    result->_mapRect.size.width = var0;
    result->_mapRect.size.height = var1;
    result->_mapType = a4;
    result->_timestamp = a5;
    result->_lprPowerType = (NSString *)a6;
  }
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRect
{
  double x = self->_mapRect.origin.x;
  double y = self->_mapRect.origin.y;
  double width = self->_mapRect.size.width;
  double height = self->_mapRect.size.height;
  result.var1.double var1 = height;
  result.var1.double var0 = width;
  result.var0.double var1 = y;
  result.var0.double var0 = x;
  return result;
}

- (void)setMapRect:(id)a3
{
  self->_mapRect = ($AF866507483A7485D187EE11486BA295)a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSString)lprPowerType
{
  return self->_lprPowerType;
}

- (void)setLprPowerType:(id)a3
{
  self->_lprPowerType = (NSString *)a3;
}

@end