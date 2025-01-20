@interface _UITabSidebarBottomBarWrapperView
- (BOOL)layoutWithinSafeArea;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIView)view;
- (_UITabSidebarBottomBarWrapperView)initWithView:(id)a3 intrinsicContentSizeInvalidationHandler:(id)a4;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)layoutSubviews;
- (void)setLayoutWithinSafeArea:(BOOL)a3;
@end

@implementation _UITabSidebarBottomBarWrapperView

- (_UITabSidebarBottomBarWrapperView)initWithView:(id)a3 intrinsicContentSizeInvalidationHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UITabSidebarBottomBarWrapperView.m", 20, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"_UITabSidebarBottomBarWrapperView.m", 21, @"Invalid parameter not satisfying: %@", @"invalidationHandler != nil" object file lineNumber description];

LABEL_3:
  [v8 frame];
  v18.receiver = self;
  v18.super_class = (Class)_UITabSidebarBottomBarWrapperView;
  v11 = -[UIView initWithFrame:](&v18, sel_initWithFrame_);
  v12 = v11;
  if (v11)
  {
    [(UIView *)v11 bounds];
    objc_msgSend(v8, "setFrame:");
    [(UIView *)v12 addSubview:v8];
    objc_storeStrong((id *)&v12->_view, a3);
    uint64_t v13 = [v10 copy];
    id intrinsicContentSizeInvalidationHandler = v12->_intrinsicContentSizeInvalidationHandler;
    v12->_id intrinsicContentSizeInvalidationHandler = (id)v13;
  }
  return v12;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_UITabSidebarBottomBarWrapperView;
  [(UIView *)&v16 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(_UITabSidebarBottomBarWrapperView *)self layoutWithinSafeArea])
  {
    [(UIView *)self safeAreaInsets];
    double v4 = v4 + v11;
    double v6 = v6 + v12;
    double v8 = v8 - (v11 + v13);
    double v10 = v10 - (v12 + v14);
  }
  v15 = [(_UITabSidebarBottomBarWrapperView *)self view];
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_view, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITabSidebarBottomBarWrapperView;
  [(UIView *)&v4 _intrinsicContentSizeInvalidatedForChildView:a3];
  (*((void (**)(void))self->_intrinsicContentSizeInvalidationHandler + 2))();
}

- (UIView)view
{
  return self->_view;
}

- (BOOL)layoutWithinSafeArea
{
  return self->_layoutWithinSafeArea;
}

- (void)setLayoutWithinSafeArea:(BOOL)a3
{
  self->_layoutWithinSafeArea = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong(&self->_intrinsicContentSizeInvalidationHandler, 0);
}

@end