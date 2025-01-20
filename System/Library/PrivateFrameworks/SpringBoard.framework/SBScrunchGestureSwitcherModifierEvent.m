@interface SBScrunchGestureSwitcherModifierEvent
- (CGPoint)centroid;
- (CGPoint)initialCentroid;
- (CGPoint)translationWithoutScale;
- (double)absoluteScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)setAbsoluteScale:(double)a3;
- (void)setCentroid:(CGPoint)a3;
- (void)setInitialCentroid:(CGPoint)a3;
- (void)setTranslationWithoutScale:(CGPoint)a3;
@end

@implementation SBScrunchGestureSwitcherModifierEvent

- (int64_t)type
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBScrunchGestureSwitcherModifierEvent;
  id result = [(SBGestureSwitcherModifierEvent *)&v5 copyWithZone:a3];
  *((_OWORD *)result + 10) = self->_initialCentroid;
  *((_OWORD *)result + 11) = self->_centroid;
  *((void *)result + 19) = *(void *)&self->_absoluteScale;
  *((_OWORD *)result + 12) = self->_translationWithoutScale;
  return result;
}

- (CGPoint)initialCentroid
{
  double x = self->_initialCentroid.x;
  double y = self->_initialCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCentroid:(CGPoint)a3
{
  self->_initialCentroid = a3;
}

- (CGPoint)centroid
{
  double x = self->_centroid.x;
  double y = self->_centroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (double)absoluteScale
{
  return self->_absoluteScale;
}

- (void)setAbsoluteScale:(double)a3
{
  self->_absoluteScale = a3;
}

- (CGPoint)translationWithoutScale
{
  double x = self->_translationWithoutScale.x;
  double y = self->_translationWithoutScale.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslationWithoutScale:(CGPoint)a3
{
  self->_translationWithoutScale = a3;
}

@end