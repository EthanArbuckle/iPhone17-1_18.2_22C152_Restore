@interface _UIDocumentUnavailablePageBackgroundAccessoryView
- (_UIDocumentUnavailablePageBackgroundAccessoryView)initWithFrame:(CGRect)a3;
- (unsigned)_layoutPageViews;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation _UIDocumentUnavailablePageBackgroundAccessoryView

- (_UIDocumentUnavailablePageBackgroundAccessoryView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UIDocumentUnavailablePageView);
    leftView = v3->_leftView;
    v3->_leftView = v4;

    v6 = objc_alloc_init(_UIDocumentUnavailablePageView);
    rightView = v3->_rightView;
    v3->_rightView = v6;

    [(UIView *)v3 addSubview:v3->_leftView];
    [(UIView *)v3 addSubview:v3->_rightView];
  }
  return v3;
}

- (unsigned)_layoutPageViews
{
  if (result)
  {
    v1 = result;
    [result bounds];
    CGFloat v3 = v2;
    CGFloat v5 = v4;
    CGFloat v42 = v7;
    CGFloat v43 = v6;
    double v8 = *((double *)v1 + 54);
    double v41 = *((double *)v1 + 55);
    objc_super v9 = [v1 traitCollection];
    uint64_t v10 = [v9 horizontalSizeClass];

    [v1 safeAreaInsets];
    double v12 = v11;
    double v14 = v13;
    [v1 layoutMargins];
    double v17 = v16;
    double v19 = v18;
    int v20 = v1[424];
    if (v10 == 1) {
      double v21 = 12.0;
    }
    else {
      double v21 = 24.0;
    }
    CGFloat v39 = v3;
    CGFloat v40 = v5;
    if (v10 == 1)
    {
      v45.origin.x = v3;
      v45.origin.y = v5;
      double v22 = v15;
      v45.size.height = v42;
      v45.size.width = v43;
      double v38 = v12;
      double v23 = v17;
      double Width = CGRectGetWidth(v45);
      double v17 = v23;
      double v15 = v22;
      int v26 = v1[424];
      double v25 = 30.0;
    }
    else
    {
      double Width = 100.0;
      double v25 = 56.0;
      int v26 = v1[424];
    }
    double v27 = v19 - v21 - v12;
    if (v27 >= Width) {
      double v27 = Width;
    }
    double v28 = v15;
    double v29 = v15 - v21 - v14;
    if (v29 < Width) {
      double Width = v29;
    }
    if (v20)
    {
      double v30 = Width;
    }
    else
    {
      double v27 = 0.0;
      double v30 = 0.0;
    }
    double v31 = 0.4;
    if (v26) {
      double v31 = 1.0;
    }
    double v32 = v25 * v31;
    double v33 = v8 * 0.5 + v19 - v27;
    double v34 = v41 * 0.5 + v17 + v32;
    objc_msgSend(*((id *)v1 + 51), "setCenter:", v33, v34, *(void *)&v38);
    double v35 = *MEMORY[0x1E4F1DAD8];
    double v36 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(*((id *)v1 + 51), "setBounds:", *MEMORY[0x1E4F1DAD8], v36, v8, v41);
    v46.origin.x = v39;
    v46.origin.y = v40;
    v46.size.height = v42;
    v46.size.width = v43;
    objc_msgSend(*((id *)v1 + 52), "setCenter:", v8 * 0.5 + v30 + CGRectGetWidth(v46) - v28 - v8, v34);
    v37 = (void *)*((void *)v1 + 52);
    return (unsigned __int8 *)objc_msgSend(v37, "setBounds:", v35, v36, v8, v41);
  }
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  [(UIView *)&v3 layoutSubviews];
  -[_UIDocumentUnavailablePageBackgroundAccessoryView _layoutPageViews]((unsigned __int8 *)self);
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  [(UIView *)&v3 layoutMarginsDidChange];
  [(UIView *)self setNeedsLayout];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  [(UIView *)&v3 safeAreaInsetsDidChange];
  [(UIView *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
}

@end