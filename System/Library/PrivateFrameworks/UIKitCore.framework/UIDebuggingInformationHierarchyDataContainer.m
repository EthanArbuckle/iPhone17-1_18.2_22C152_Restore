@interface UIDebuggingInformationHierarchyDataContainer
- (BOOL)collapsed;
- (UIDebuggingInformationHierarchyDataContainer)initWithView:(id)a3 atLevel:(int64_t)a4;
- (UIView)view;
- (int64_t)level;
- (void)setCollapsed:(BOOL)a3;
- (void)setLevel:(int64_t)a3;
- (void)setView:(id)a3;
@end

@implementation UIDebuggingInformationHierarchyDataContainer

- (UIDebuggingInformationHierarchyDataContainer)initWithView:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingInformationHierarchyDataContainer;
  v7 = [(UIDebuggingInformationHierarchyDataContainer *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(UIDebuggingInformationHierarchyDataContainer *)v7 setView:v6];
    [(UIDebuggingInformationHierarchyDataContainer *)v8 setLevel:a4];
  }

  return v8;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
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

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (void).cxx_destruct
{
}

@end