@interface SiriUICollectionViewFlowLayout
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (void)finalizeAnimatedBoundsChange;
- (void)prepareForAnimatedBoundsChange:(CGRect)a3;
@end

@implementation SiriUICollectionViewFlowLayout

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  self->_animatesBoundsChanges = 1;
}

- (void)finalizeAnimatedBoundsChange
{
  self->_animatesBoundsChanges = 0;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  if (self->_animatesBoundsChanges)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SiriUICollectionViewFlowLayout;
    v3 = [(SiriUICollectionViewFlowLayout *)&v5 initialLayoutAttributesForAppearingItemAtIndexPath:a3];
  }
  return v3;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  if (self->_animatesBoundsChanges)
  {
    v3 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:a3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SiriUICollectionViewFlowLayout;
    v3 = [(SiriUICollectionViewFlowLayout *)&v5 finalLayoutAttributesForDisappearingItemAtIndexPath:a3];
  }
  return v3;
}

@end