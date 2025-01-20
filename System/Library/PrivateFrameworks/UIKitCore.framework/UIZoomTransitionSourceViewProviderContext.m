@interface UIZoomTransitionSourceViewProviderContext
+ (id)_contextWithSource:(id)a3 zoomed:(id)a4;
- (UIViewController)sourceViewController;
- (UIViewController)zoomedViewController;
@end

@implementation UIZoomTransitionSourceViewProviderContext

+ (id)_contextWithSource:(id)a3 zoomed:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (UIViewController)zoomedViewController
{
  return self->_zoomedViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomedViewController, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
}

@end