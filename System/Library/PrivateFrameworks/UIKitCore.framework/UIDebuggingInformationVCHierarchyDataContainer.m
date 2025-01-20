@interface UIDebuggingInformationVCHierarchyDataContainer
- (UIDebuggingInformationVCHierarchyDataContainer)initWithViewController:(id)a3 atLevel:(int64_t)a4;
- (UIViewController)viewController;
- (int64_t)level;
- (void)setLevel:(int64_t)a3;
- (void)setViewController:(id)a3;
@end

@implementation UIDebuggingInformationVCHierarchyDataContainer

- (UIDebuggingInformationVCHierarchyDataContainer)initWithViewController:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingInformationVCHierarchyDataContainer;
  v7 = [(UIDebuggingInformationVCHierarchyDataContainer *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewController, v6);
    v8->_level = a4;
  }

  return v8;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (void).cxx_destruct
{
}

@end