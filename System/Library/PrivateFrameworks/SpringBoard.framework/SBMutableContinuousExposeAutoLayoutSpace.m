@interface SBMutableContinuousExposeAutoLayoutSpace
- (id)autoLayoutItemForDisplayItem:(id)a3;
- (id)autoLayoutItemForDisplayItemIfExists:(id)a3;
@end

@implementation SBMutableContinuousExposeAutoLayoutSpace

- (id)autoLayoutItemForDisplayItemIfExists:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMutableContinuousExposeAutoLayoutSpace;
  v3 = [(SBContinuousExposeAutoLayoutSpace *)&v5 autoLayoutItemForDisplayItemIfExists:a3];
  return v3;
}

- (id)autoLayoutItemForDisplayItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMutableContinuousExposeAutoLayoutSpace;
  v3 = [(SBContinuousExposeAutoLayoutSpace *)&v5 autoLayoutItemForDisplayItem:a3];
  return v3;
}

@end