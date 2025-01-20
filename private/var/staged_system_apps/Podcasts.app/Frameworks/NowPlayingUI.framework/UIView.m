@interface UIView
- (CGRect)untransformedFrame;
- (UIEdgeInsets)music_inheritedLayoutInsets;
- (UIEdgeInsets)music_layoutInsets;
- (void)_music_layoutInsets_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_music_layoutInsets_didMoveToSuperview;
- (void)_music_updateInheritedLayoutInsets;
- (void)music_setLayoutInsets:(UIEdgeInsets)a3;
- (void)setUntransformedFrame:(CGRect)a3;
@end

@implementation UIView

- (UIEdgeInsets)music_layoutInsets
{
  if (sSetupOnceToken[0] != -1) {
    dispatch_once(sSetupOnceToken, &__block_literal_global_53);
  }
  v3 = objc_getAssociatedObject(self, _UIViewMusicLayoutAdditionsAssociatedObjectKeyLayoutInsets);
  v4 = v3;
  if (v3)
  {
    [v3 UIEdgeInsetsValue];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = MTMPULayoutSizeNoDimension;
    double v8 = MTMPULayoutSizeNoDimension;
    double v10 = MTMPULayoutSizeNoDimension;
    double v12 = MTMPULayoutSizeNoDimension;
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)music_inheritedLayoutInsets
{
  if (sSetupOnceToken[0] != -1) {
    dispatch_once(sSetupOnceToken, &__block_literal_global_53);
  }
  v3 = objc_getAssociatedObject(self, _UIViewMusicLayoutAdditionsAssociatedObjectKeyInheritedLayoutInsets);
  [v3 UIEdgeInsetsValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)music_setLayoutInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (sSetupOnceToken[0] != -1) {
    dispatch_once(sSetupOnceToken, &__block_literal_global_53);
  }
  [(UIView *)self music_layoutInsets];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    double v15 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyLayoutInsets;
    double v16 = +[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", top, left, bottom, right);
    objc_setAssociatedObject(self, v15, v16, &stru_2E8.segname[9]);

    if ([(UIView *)self _isInAWindow])
    {
      [(UIView *)self _music_updateInheritedLayoutInsets];
    }
    else
    {
      v17 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyNeedsUpdateAfterMovingToWindow;
      objc_setAssociatedObject(self, v17, &__kCFBooleanTrue, (char *)&dword_0 + 3);
    }
  }
}

- (void)_music_layoutInsets_didMoveToSuperview
{
  [(UIView *)self _music_updateInheritedLayoutInsets];

  [(UIView *)self _music_layoutInsets_didMoveToSuperview];
}

- (void)_music_layoutInsets_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  [(UIView *)self _music_updateInheritedLayoutInsets];

  [(UIView *)self _music_layoutInsets_didMoveFromWindow:a3 toWindow:a4];
}

- (void)_music_updateInheritedLayoutInsets
{
  [(UIView *)self music_layoutInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(UIView *)self _isInAWindow])
  {
    double v11 = [(UIView *)self superview];
    if (v11)
    {
      double v12 = [(UIView *)self superview];
      [v12 music_inheritedLayoutInsets];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
    }
    else
    {
      [(UIView *)self music_inheritedLayoutInsets];
      double v14 = v25;
      double v16 = v26;
      double v18 = v27;
      double v20 = v28;
    }
  }
  else
  {
    [(UIView *)self music_inheritedLayoutInsets];
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
    double v20 = v24;
  }
  if (MTMPUFloatEqualToFloat()) {
    double v4 = v14;
  }
  if (MTMPUFloatEqualToFloat()) {
    double v6 = v16;
  }
  if (MTMPUFloatEqualToFloat()) {
    double v8 = v18;
  }
  if (MTMPUFloatEqualToFloat()) {
    double v10 = v20;
  }
  [(UIView *)self music_inheritedLayoutInsets];
  if (v32 != v6 || v29 != v4 || v31 != v10 || v30 != v8)
  {
    v36 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyInheritedLayoutInsets;
    v37 = +[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", v4, v6, v8, v10);
    objc_setAssociatedObject(self, v36, v37, &stru_2E8.segname[9]);

    [(UIView *)self music_inheritedLayoutInsetsDidChange];
    v38 = +[UIViewController viewControllerForView:self];
    [v38 music_viewInheritedLayoutInsetsDidChange];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v39 = [(UIView *)self subviews];
    id v40 = [v39 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v45;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v45 != v42) {
            objc_enumerationMutation(v39);
          }
          [*(id *)(*((void *)&v44 + 1) + 8 * i) _music_updateInheritedLayoutInsets];
        }
        id v41 = [v39 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v41);
    }
  }
}

- (CGRect)untransformedFrame
{
  v2 = self;
  [(UIView *)v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)v2 center];
  double v12 = v11;
  double v14 = v13;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  double v15 = v12 - CGRectGetWidth(v23) * 0.5;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  double v16 = v14 - CGRectGetHeight(v24) * 0.5;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  CGFloat Width = CGRectGetWidth(v25);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  CGFloat Height = CGRectGetHeight(v26);

  double v19 = v15;
  double v20 = v16;
  double v21 = Width;
  double v22 = Height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)setUntransformedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v5 = self;
  -[UIView setBounds:](v5, "setBounds:", 0.0, 0.0, width, height);
  sub_12A010();
  -[UIView setCenter:](v5, "setCenter:");
}

@end