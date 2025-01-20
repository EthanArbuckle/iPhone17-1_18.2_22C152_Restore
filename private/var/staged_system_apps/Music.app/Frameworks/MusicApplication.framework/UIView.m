@interface UIView
+ (UIEdgeInsets)music_defaultLayoutInsetsInView:(id)a3;
- (UIEdgeInsets)music_inheritedLayoutInsets;
- (UIEdgeInsets)music_layoutInsets;
- (void)_music_layoutInsets_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_music_layoutInsets_didMoveToSuperview;
- (void)_music_updateInheritedLayoutInsets;
- (void)music_setLayoutInsets:(UIEdgeInsets)a3;
@end

@implementation UIView

- (UIEdgeInsets)music_layoutInsets
{
  if (sSetupOnceToken != -1) {
    dispatch_once(&sSetupOnceToken, &__block_literal_global_38);
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
    double v6 = -1.0;
    double v8 = -1.0;
    double v10 = -1.0;
    double v12 = -1.0;
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
  if (sSetupOnceToken != -1) {
    dispatch_once(&sSetupOnceToken, &__block_literal_global_38);
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
  if (sSetupOnceToken != -1) {
    dispatch_once(&sSetupOnceToken, &__block_literal_global_38);
  }
  [(UIView *)self music_layoutInsets];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    double v15 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyLayoutInsets;
    double v16 = +[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", top, left, bottom, right);
    objc_setAssociatedObject(self, v15, v16, &stru_2E8.segname[9]);

    [(UIView *)self _music_updateInheritedLayoutInsets];
  }
}

+ (UIEdgeInsets)music_defaultLayoutInsetsInView:(id)a3
{
  [a3 bounds];
  double Width = CGRectGetWidth(v9);
  if (MusicFloatGreaterThanOrEqualToFloat(Width, 1000.0))
  {
    double v4 = 52.0;
  }
  else
  {
    BOOL v5 = MusicFloatGreaterThanOrEqualToFloat(Width, 650.0);
    double v4 = 20.0;
    if (v5) {
      double v4 = 34.0;
    }
  }
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.double right = v8;
  result.double bottom = v7;
  result.double left = v4;
  result.double top = v6;
  return result;
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
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
    double v20 = v24;
  }

  if (MusicFloatEqualToFloat(v4, -1.0)) {
    double v4 = v14;
  }
  if (MusicFloatEqualToFloat(v6, -1.0)) {
    double v6 = v16;
  }
  if (MusicFloatEqualToFloat(v8, -1.0)) {
    double v8 = v18;
  }
  if (MusicFloatEqualToFloat(v10, -1.0)) {
    double v10 = v20;
  }
  [(UIView *)self music_inheritedLayoutInsets];
  if (v28 != v6 || v25 != v4 || v27 != v10 || v26 != v8)
  {
    v32 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyInheritedLayoutInsets;
    v33 = +[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", v4, v6, v8, v10);
    objc_setAssociatedObject(self, v32, v33, &stru_2E8.segname[9]);

    [(UIView *)self music_inheritedLayoutInsetsDidChange];
    v34 = +[UIViewController viewControllerForView:self];
    [v34 music_viewInheritedLayoutInsetsDidChange];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v35 = [(UIView *)self subviews];
    id v36 = [v35 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v41;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v41 != v38) {
            objc_enumerationMutation(v35);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * i) _music_updateInheritedLayoutInsets];
        }
        id v37 = [v35 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v37);
    }
  }
}

@end