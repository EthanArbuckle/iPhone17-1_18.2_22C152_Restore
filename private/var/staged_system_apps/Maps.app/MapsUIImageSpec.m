@interface MapsUIImageSpec
- (BOOL)isRTL;
- (BOOL)nightMode;
- (BOOL)useSearchImageFallback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4;
- (void)setIsRTL:(BOOL)a3;
- (void)setNightMode:(BOOL)a3;
@end

@implementation MapsUIImageSpec

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (BOOL)useSearchImageFallback
{
  return 0;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end