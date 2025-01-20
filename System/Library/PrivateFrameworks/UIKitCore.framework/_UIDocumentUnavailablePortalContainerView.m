@interface _UIDocumentUnavailablePortalContainerView
- (void)initWithSourceView:(void *)a1;
- (void)layoutSubviews;
@end

@implementation _UIDocumentUnavailablePortalContainerView

- (void)initWithSourceView:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    [a2 bounds];
    v20.receiver = v2;
    v20.super_class = (Class)_UIDocumentUnavailablePortalContainerView;
    v4 = objc_msgSendSuper2(&v20, sel_initWithFrame_);
    v2 = v4;
    if (v4)
    {
      uint64_t v5 = *MEMORY[0x1E4F39EA8];
      v6 = [v4 layer];
      [v6 setCornerCurve:v5];

      v7 = [v2 layer];
      [v7 setCornerRadius:13.0];

      v8 = [v2 layer];
      LODWORD(v9) = 1036831949;
      [v8 setShadowOpacity:v9];

      v10 = [v2 layer];
      [v10 setShadowRadius:40.0];

      v11 = [v2 layer];
      objc_msgSend(v11, "setShadowOffset:", 0.0, 8.0);

      id v12 = +[UIColor blackColor];
      uint64_t v13 = [v12 CGColor];
      v14 = [v2 layer];
      [v14 setShadowColor:v13];

      v15 = [_UIPortalView alloc];
      [v2 bounds];
      v16 = -[_UIPortalView initWithFrame:](v15, "initWithFrame:");
      [(UIView *)v16 setAutoresizingMask:18];
      [(_UIPortalView *)v16 setSourceView:a2];
      [(_UIPortalView *)v16 setAllowsBackdropGroups:1];
      [(_UIPortalView *)v16 _setPrefersClientLayer:1];
      v17 = (void *)v2[51];
      v2[51] = v16;
      v18 = v16;

      [v2 addSubview:v18];
    }
  }
  return v2;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentUnavailablePortalContainerView;
  [(UIView *)&v5 layoutSubviews];
  [(UIView *)self _intersectedSceneCornerRadii];
  v3 = [(UIView *)self layer];
  v4[0] = v4[4];
  v4[1] = v4[5];
  v4[2] = v4[6];
  v4[3] = v4[7];
  [v3 setCornerRadii:v4];
}

- (void).cxx_destruct
{
}

@end