@interface _UIRefreshControlSeedView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_UIRefreshControlSeedView)init;
@end

@implementation _UIRefreshControlSeedView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 0;
}

- (_UIRefreshControlSeedView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRefreshControlSeedView;
  v2 = [(UIView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UIView *)v2 _setShouldAdaptToMaterials:0];
  }
  return v3;
}

@end