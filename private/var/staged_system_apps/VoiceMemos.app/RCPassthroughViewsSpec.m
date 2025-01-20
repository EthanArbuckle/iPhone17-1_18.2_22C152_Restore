@interface RCPassthroughViewsSpec
+ (id)passthroughViewsSpecWithTopLevelView:(id)a3 includeTopLevelView:(BOOL)a4;
- (BOOL)includeTopLevelView;
- (UIView)topLevelView;
- (void)setIncludeTopLevelView:(BOOL)a3;
- (void)setTopLevelView:(id)a3;
@end

@implementation RCPassthroughViewsSpec

+ (id)passthroughViewsSpecWithTopLevelView:(id)a3 includeTopLevelView:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setTopLevelView:v5];

  [v6 setIncludeTopLevelView:v4];

  return v6;
}

- (UIView)topLevelView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topLevelView);

  return (UIView *)WeakRetained;
}

- (void)setTopLevelView:(id)a3
{
}

- (BOOL)includeTopLevelView
{
  return self->_includeTopLevelView;
}

- (void)setIncludeTopLevelView:(BOOL)a3
{
  self->_includeTopLevelView = a3;
}

- (void).cxx_destruct
{
}

@end