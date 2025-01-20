@interface PUCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (CGPoint)edgeParallaxOffset;
- (CGPoint)parallaxOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEdgeParallaxOffset:(CGPoint)a3;
- (void)setParallaxOffset:(CGPoint)a3;
@end

@implementation PUCollectionViewLayoutAttributes

- (void)setEdgeParallaxOffset:(CGPoint)a3
{
  self->_edgeParallaxOffset = a3;
}

- (CGPoint)edgeParallaxOffset
{
  double x = self->_edgeParallaxOffset.x;
  double y = self->_edgeParallaxOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setParallaxOffset:(CGPoint)a3
{
  self->_parallaxOffset = a3;
}

- (CGPoint)parallaxOffset
{
  double x = self->_parallaxOffset.x;
  double y = self->_parallaxOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUCollectionViewLayoutAttributes;
  if (![(UICollectionViewLayoutAttributes *)&v13 isEqual:v4]) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = 1;
    goto LABEL_12;
  }
  [v4 parallaxOffset];
  if (self->_parallaxOffset.x == v6 && self->_parallaxOffset.y == v5)
  {
    p_edgeParallaxOffset = &self->_edgeParallaxOffset;
    [v4 edgeParallaxOffset];
    BOOL v8 = p_edgeParallaxOffset->y == v11 && p_edgeParallaxOffset->x == v10;
  }
  else
  {
LABEL_7:
    BOOL v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUCollectionViewLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setParallaxOffset:", self->_parallaxOffset.x, self->_parallaxOffset.y);
  objc_msgSend(v4, "setEdgeParallaxOffset:", self->_edgeParallaxOffset.x, self->_edgeParallaxOffset.y);
  return v4;
}

@end