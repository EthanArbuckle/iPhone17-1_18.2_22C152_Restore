@interface _UIAnimatedImageTransitionButtonConfigurationVisualProvider
- (id)_transitioningImageViewForConfiguration:(id)a3;
- (id)imageEffectContainerView;
- (void)_updateImageViewWithConfiguration:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIAnimatedImageTransitionButtonConfigurationVisualProvider

- (void)willMoveToWindow:(id)a3
{
  self->_inViewHierarchy = a3 != 0;
}

- (id)imageEffectContainerView
{
  v3 = [(UIButtonConfigurationVisualProvider *)self button];
  contentAnimationContainerView = self->_contentAnimationContainerView;
  if (!contentAnimationContainerView)
  {
    v5 = [UIView alloc];
    [v3 bounds];
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    v7 = self->_contentAnimationContainerView;
    self->_contentAnimationContainerView = v6;

    [(UIView *)self->_contentAnimationContainerView setAutoresizingMask:18];
    [(UIView *)self->_contentAnimationContainerView setUserInteractionEnabled:0];
    [v3 addSubview:self->_contentAnimationContainerView];
    contentAnimationContainerView = self->_contentAnimationContainerView;
  }
  v8 = contentAnimationContainerView;

  return v8;
}

- (id)_transitioningImageViewForConfiguration:(id)a3
{
  id v4 = a3;
  imageViewsByConfiguration = self->_imageViewsByConfiguration;
  if (!imageViewsByConfiguration)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = self->_imageViewsByConfiguration;
    self->_imageViewsByConfiguration = v6;

    imageViewsByConfiguration = self->_imageViewsByConfiguration;
  }
  v8 = [(NSMutableDictionary *)imageViewsByConfiguration objectForKey:v4];
  if (!v8)
  {
    v8 = objc_alloc_init(UIImageView);
    [(UIImageView *)v8 setContentMode:[(UIView *)self->super._imageView contentMode]];
    v9 = [v4 _resolvedImage];
    v10 = [v4 _resolvedSymbolConfiguration];
    [(UIImageView *)v8 setPreferredSymbolConfiguration:v10];

    v11 = [v4 _resolvedImageColor];
    [(UIView *)v8 setTintColor:v11];

    [(UIImageView *)v8 setImage:v9];
    [(NSMutableDictionary *)self->_imageViewsByConfiguration setObject:v8 forKey:v4];
  }
  v12 = self->super._imageView;
  objc_storeStrong((id *)&self->super._imageView, v8);
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  [(UIButtonConfigurationVisualProvider *)self _layoutBounds];
  -[UIButtonConfigurationVisualProvider _layoutDataInBounds:forConfiguration:](self, "_layoutDataInBounds:forConfiguration:", v4);
  imageView = self->super._imageView;
  self->super._imageView = v12;
  v14 = v12;

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v34 = v47;
  long long v35 = v48;
  long long v36 = v49;
  long long v30 = v43;
  long long v31 = v44;
  long long v32 = v45;
  long long v33 = v46;
  long long v26 = v39;
  long long v27 = v40;
  long long v28 = v41;
  long long v29 = v42;
  v22 = __103___UIAnimatedImageTransitionButtonConfigurationVisualProvider__transitioningImageViewForConfiguration___block_invoke;
  v23 = &unk_1E530B130;
  uint64_t v37 = v50;
  long long v25 = v38;
  v15 = v8;
  v24 = v15;
  +[UIView performWithoutAnimation:&v20];
  v16 = [(_UIAnimatedImageTransitionButtonConfigurationVisualProvider *)self imageEffectContainerView];
  [v16 addSubview:v15];

  v17 = v24;
  v18 = v15;

  return v18;
}

- (void)_updateImageViewWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_inViewHierarchy && self->_fromConfiguration && (objc_msgSend(v4, "isEqual:") & 1) == 0)
  {
    v8 = [(_UIAnimatedImageTransitionButtonConfigurationVisualProvider *)self _transitioningImageViewForConfiguration:self->_fromConfiguration];
    v7 = [(_UIAnimatedImageTransitionButtonConfigurationVisualProvider *)self _transitioningImageViewForConfiguration:v5];
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)_UIAnimatedImageTransitionButtonConfigurationVisualProvider;
  [(UIButtonConfigurationVisualProvider *)&v23 _updateImageViewWithConfiguration:v5];
  if (v6)
  {
    [(UIImageView *)self->super._imageView setHidden:1];
    CGAffineTransformMakeScale(&v22, 0.3, 0.3);
    CGAffineTransform v21 = v22;
    [v7 setTransform:&v21];
    [v7 setAlpha:0.0];
    v9 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.2];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke;
    v18[3] = &unk_1E52D9F98;
    id v19 = v7;
    id v20 = v8;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke_2;
    v15 = &unk_1E52DA9F8;
    id v16 = v19;
    v17 = self;
    +[UIView _animateUsingSpringBehavior:v9 tracking:0 animations:v18 completion:&v12];
  }
  v10 = (_UIButtonConfigurationShim *)objc_msgSend(v5, "copy", v12, v13, v14, v15);
  fromConfiguration = self->_fromConfiguration;
  self->_fromConfiguration = v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewsByConfiguration, 0);
  objc_storeStrong((id *)&self->_contentAnimationContainerView, 0);
  objc_storeStrong((id *)&self->_fromConfiguration, 0);
}

@end