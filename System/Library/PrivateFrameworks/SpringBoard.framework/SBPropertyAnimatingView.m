@interface SBPropertyAnimatingView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (NSArray)animatedLayerProperties;
- (void)setAnimatedLayerProperties:(id)a3;
@end

@implementation SBPropertyAnimatingView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(SBPropertyAnimatingView *)self animatedLayerProperties];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPropertyAnimatingView;
    BOOL v7 = [(SBPropertyAnimatingView *)&v9 _shouldAnimatePropertyWithKey:v4];
  }

  return v7;
}

- (NSArray)animatedLayerProperties
{
  return self->animatedLayerProperties;
}

- (void)setAnimatedLayerProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end