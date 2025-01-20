@interface MRSlideInfo
- (BOOL)isMain;
- (CGPoint)center;
- (NSString)assetPath;
- (double)aspectRatio;
- (double)rotation;
- (double)scale;
- (double)time;
- (id)description;
- (id)player;
- (unint64_t)index;
- (void)dealloc;
- (void)setAspectRatio:(double)a3;
- (void)setAssetPath:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setIsMain:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setTime:(double)a3;
@end

@implementation MRSlideInfo

- (void)dealloc
{
  self->_assetPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRSlideInfo;
  [(MRSlideInfo *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"'%@': index %d, aspectRatio %f, time %f, center (%f,%f), scale %f, rotation %f, player %p, isMain %d", self->_assetPath, self->_index, *(void *)&self->_aspectRatio, *(void *)&self->_time, *(void *)&self->_center.x, *(void *)&self->_center.y, *(void *)&self->_scale, *(void *)&self->_rotation, self->_player, self->_isMain];
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (id)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  self->_player = a3;
}

- (BOOL)isMain
{
  return self->_isMain;
}

- (void)setIsMain:(BOOL)a3
{
  self->_isMain = a3;
}

@end