@interface _UINavigationControllerVisualStyleFactory
+ (id)sharedInstance;
- (_UINavigationControllerVisualStyleFactory)init;
- (_UINavigationControllerVisualStyleProviding)visualStyleProvider;
- (id)styleForNavigationController:(id)a3;
- (void)setVisualStyleProvider:(id)a3;
@end

@implementation _UINavigationControllerVisualStyleFactory

- (id)styleForNavigationController:(id)a3
{
  id v4 = a3;
  v5 = [(_UINavigationControllerVisualStyleFactory *)self visualStyleProvider];
  v6 = [v5 styleForNavigationController:v4];

  return v6;
}

- (_UINavigationControllerVisualStyleProviding)visualStyleProvider
{
  return self->_visualStyleProvider;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_1087 != -1) {
    dispatch_once(&_MergedGlobals_1087, &__block_literal_global_274);
  }
  v2 = (void *)qword_1EB260D50;
  return v2;
}

- (_UINavigationControllerVisualStyleFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationControllerVisualStyleFactory;
  v2 = [(_UINavigationControllerVisualStyleFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    visualStyleProvider = v2->_visualStyleProvider;
    v2->_visualStyleProvider = (_UINavigationControllerVisualStyleProviding *)v3;
  }
  return v2;
}

- (void)setVisualStyleProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end