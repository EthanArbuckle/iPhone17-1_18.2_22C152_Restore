@interface TUIContainerView
+ (id)renderModelWithSubviewsModel:(id)a3 style:(id)a4 identifier:(id)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showContents;
- (NSDictionary)tui_hostedSubviewsMap;
- (TUIContainerView)initWithFrame:(CGRect)a3;
- (TUIViewFactory)factory;
- (UIView)contentView;
- (UIView)shadowView;
- (_TUIBackdropView)backdropView;
- (id)descendentViewWithIdentifier:(id)a3;
- (id)descendentViewWithRefId:(id)a3;
- (id)tui_hostingView;
- (void)_resetStyling;
- (void)_updateSubviews;
- (void)appendRenderOverrideObservers:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)applyStyle:(id)a3;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)invalidateRenderReferenceOverride:(id)a3;
- (void)invalidateShowContents;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackdropView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setFactory:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setTui_hostedSubviewsMap:(id)a3;
- (void)viewDidEndDisplay;
@end

@implementation TUIContainerView

+ (id)renderModelWithSubviewsModel:(id)a3 style:(id)a4 identifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[TUIRenderModelView alloc] initWithReuseIdentifier:@"TUIReuseIdentifierContainerView" identifier:v7 submodel:v9 style:v8];

  return v10;
}

- (void)applyLayoutAttributes:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TUIContainerView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v16 applyLayoutAttributes:v4];
  v5 = [v4 renderModel];
  v6 = [v5 submodel];
  [v4 outsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[TUIContainerView configureWithModel:outsets:](self, "configureWithModel:outsets:", v6, v8, v10, v12, v14);
  v15 = [v5 style];
  [(TUIContainerView *)self applyStyle:v15];
}

- (void)applyStyle:(id)a3
{
  id v52 = a3;
  [(TUIRenderStyling *)self->_currentStyle removeStylingFromView:self->_contentView];
  [v52 applyStylingToView:self->_contentView];
  objc_storeStrong((id *)&self->_currentStyle, a3);
  v5 = [(UIView *)self->_contentView layer];
  v6 = [v5 compositingFilter];

  unsigned int v7 = TUILayerCompositingFilterNeedsBackdropLayer(v6);
  unsigned int v8 = v7;
  if (v6) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 1;
  }
  double v10 = [(TUIContainerView *)self layer];
  [v10 setAllowsGroupBlending:v9];

  backdropView = self->_backdropView;
  if (v8)
  {
    if (!backdropView)
    {
      double v12 = [_TUIBackdropView alloc];
      [(TUIContainerView *)self bounds];
      double v13 = -[_TUIBackdropView initWithFrame:](v12, "initWithFrame:");
      double v14 = self->_backdropView;
      self->_backdropView = v13;

      [(_TUIBackdropView *)self->_backdropView setUserInteractionEnabled:0];
      [(_TUIBackdropView *)self->_backdropView setAutoresizingMask:18];
      [(TUIContainerView *)self insertSubview:self->_backdropView belowSubview:self->_contentView];
    }
  }
  else if (backdropView)
  {
    [(_TUIBackdropView *)backdropView removeFromSuperview];
    v15 = self->_backdropView;
    self->_backdropView = 0;
  }
  if (v6
    && ([(UIView *)self->_contentView layer],
        objc_super v16 = objc_claimAutoreleasedReturnValue(),
        [v16 shadowOpacity],
        float v18 = v17,
        v16,
        v18 > 0.0))
  {
    if (!self->_shadowView)
    {
      id v19 = objc_alloc((Class)UIView);
      [(TUIContainerView *)self bounds];
      v20 = [v19 initWithFrame:];
      shadowView = self->_shadowView;
      self->_shadowView = v20;

      [(UIView *)self->_shadowView setUserInteractionEnabled:0];
      [(UIView *)self->_shadowView setAutoresizingMask:18];
      [(TUIContainerView *)self insertSubview:self->_shadowView belowSubview:self->_contentView];
    }
  }
  else
  {
    v22 = self->_shadowView;
    if (v22)
    {
      [(UIView *)v22 removeFromSuperview];
      v23 = self->_shadowView;
      self->_shadowView = 0;
    }
  }
  if (self->_shadowView)
  {
    v24 = [(UIView *)self->_contentView layer];
    id v25 = [v24 shadowColor];
    v26 = [(UIView *)self->_shadowView layer];
    [v26 setShadowColor:v25];

    v27 = [(UIView *)self->_contentView layer];
    [v27 shadowOffset];
    double v29 = v28;
    double v31 = v30;
    v32 = [(UIView *)self->_shadowView layer];
    [v32 setShadowOffset:v29, v31];

    v33 = [(UIView *)self->_contentView layer];
    [v33 shadowRadius];
    double v35 = v34;
    v36 = [(UIView *)self->_shadowView layer];
    [v36 setShadowRadius:v35];

    v37 = [(UIView *)self->_contentView layer];
    [v37 shadowOpacity];
    LODWORD(v35) = v38;
    v39 = [(UIView *)self->_shadowView layer];
    LODWORD(v40) = LODWORD(v35);
    [v39 setShadowOpacity:v40];

    v41 = [(UIView *)self->_contentView layer];
    id v42 = [v41 shadowPath];
    v43 = [(UIView *)self->_shadowView layer];
    [v43 setShadowPath:v42];

    v44 = [(UIView *)self->_shadowView layer];
    [v44 setPunchoutShadow:1];

    id v45 = +[UIColor blackColor];
    id v46 = [v45 CGColor];
    v47 = [(UIView *)self->_contentView layer];
    [v47 setShadowColor:v46];

    v48 = [(UIView *)self->_contentView layer];
    [v48 setShadowOffset:0.0, -3.0];

    v49 = [(UIView *)self->_contentView layer];
    [v49 setShadowRadius:3.0];

    v50 = [(UIView *)self->_contentView layer];
    [v50 setShadowOpacity:0.0];

    v51 = [(UIView *)self->_contentView layer];
    [v51 setShadowPath:0];
  }
}

- (void)setFactory:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_factory, obj);
    [(TUIContainerView *)self _updateSubviews];
    v5 = obj;
  }
}

- (TUIContainerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUIContainerView;
  v3 = -[TUIContainerView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(TUIContainerView *)v3 setClipsToBounds:0];
    v5 = [_TUIContainerContentView alloc];
    [(TUIContainerView *)v4 bounds];
    v6 = -[_TUIContainerContentView initWithFrame:](v5, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = &v6->super;

    [(UIView *)v4->_contentView setAutoresizingMask:18];
    [(TUIContainerView *)v4 addSubview:v4->_contentView];
  }
  return v4;
}

- (void)_resetStyling
{
  [(TUIRenderStyling *)self->_currentStyle removeStylingFromView:self->_contentView];
  currentStyle = self->_currentStyle;
  self->_currentStyle = 0;

  [(UIView *)self->_contentView setBackgroundColor:0];
  id v4 = [(UIView *)self->_contentView layer];
  [v4 setShadowOpacity:0.0];

  v5 = [(UIView *)self->_contentView layer];
  [v5 setBorderWidth:0.0];

  v6 = [(UIView *)self->_contentView layer];
  [v6 setCornerRadius:0.0];

  unsigned int v7 = [(UIView *)self->_contentView layer];
  [v7 setMasksToBounds:0];

  unsigned int v8 = [(UIView *)self->_contentView layer];
  [v8 setShadowPath:0];

  objc_super v9 = [(UIView *)self->_contentView layer];
  [v9 setCompositingFilter:0];

  [(_TUIBackdropView *)self->_backdropView removeFromSuperview];
  backdropView = self->_backdropView;
  self->_backdropView = 0;

  [(UIView *)self->_shadowView removeFromSuperview];
  shadowView = self->_shadowView;
  self->_shadowView = 0;

  id v12 = [(TUIContainerView *)self layer];
  [v12 setAllowsGroupBlending:1];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TUIContainerView;
  [(TUIReusableBaseView *)&v4 prepareForReuse];
  [(TUIContainerView *)self _resetStyling];
  model = self->_model;
  self->_model = 0;

  [(TUIContainerView *)self _updateSubviews];
}

- (void)viewDidEndDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TUIContainerView;
  [(TUIReusableBaseView *)&v3 viewDidEndDisplay];
  [(TUIContainerView *)self prepareForReuse];
}

- (BOOL)showContents
{
  return 1;
}

- (void)_updateSubviews
{
  char v20 = 0;
  if (self->_model
    && (p_factory = &self->_factory, (id v4 = objc_loadWeakRetained((id *)&self->_factory)) != 0)
    && (v5 = v4, unsigned int v6 = [(TUIContainerView *)self showContents], v5, v6))
  {
    unsigned int v7 = [(TUIReusableBaseView *)self feedControllerHost];
    unsigned int v8 = [v7 renderOverrideProvider];
    objc_super v9 = [v8 renderOverrides];

    if (v9)
    {
      double v10 = [(TUIReusableBaseView *)self tui_querySectionUUID];
      double v11 = [(TUIReusableBaseView *)self tui_querySectionUID];
    }
    else
    {
      double v11 = 0;
      double v10 = 0;
    }
    model = self->_model;
    id WeakRetained = objc_loadWeakRetained((id *)p_factory);
    float v17 = -[TUIRenderModelSubviews configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:](model, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", WeakRetained, self, v9, &v20, v10, v11, self->_outsets.top, self->_outsets.left, self->_outsets.bottom, self->_outsets.right);

    float v18 = (NSArray *)[v17 copy];
    currentSubviews = self->_currentSubviews;
    self->_currentSubviews = v18;

    char v14 = 2 * v20;
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)&self->_factory);
    double v13 = [v12 subviewPool];
    [v13 prepareToReuseHost:self];

    char v14 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v14;
}

- (void)layoutSubviews
{
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags &= ~1u;
    [(TUIContainerView *)self _updateSubviews];
  }
  v3.receiver = self;
  v3.super_class = (Class)TUIContainerView;
  [(TUIContainerView *)&v3 layoutSubviews];
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v10 = (TUIRenderModelSubviews *)a3;
  v15 = v10;
  if (self->_model != v10
    || ((double v11 = self->_outsets.top, self->_outsets.left == left) ? (v12 = v11 == top) : (v12 = 0),
        v12 ? (BOOL v13 = self->_outsets.right == right) : (BOOL v13 = 0),
        v13 ? (BOOL v14 = self->_outsets.bottom == bottom) : (BOOL v14 = 0),
        !v14))
  {
    objc_storeStrong((id *)&self->_model, a3);
    self->_outsets.double top = top;
    self->_outsets.double left = left;
    self->_outsets.double bottom = bottom;
    self->_outsets.double right = right;
    [(TUIContainerView *)self _updateSubviews];
LABEL_13:
    double v10 = v15;
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)&self->_flags |= 1u;
    [(TUIContainerView *)self setNeedsLayout];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)invalidateShowContents
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    *(unsigned char *)&self->_flags |= 1u;
    [(TUIContainerView *)self setNeedsLayout];
  }
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TUIContainerView;
  v5 = [(TUIReusableBaseView *)&v18 descendentViewWithIdentifier:v4];
  if (!v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unsigned int v6 = [(TUIContainerView *)self tui_hostedSubviewsMap];
    unsigned int v7 = [v6 allValues];

    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) descendentViewWithIdentifier:v4];
          if (v12)
          {
            v5 = (void *)v12;
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    v5 = 0;
LABEL_12:
  }

  return v5;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TUIContainerView;
  v5 = [(TUIReusableBaseView *)&v18 descendentViewWithRefId:v4];
  if (!v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unsigned int v6 = [(TUIContainerView *)self tui_hostedSubviewsMap];
    unsigned int v7 = [v6 allValues];

    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) descendentViewWithRefId:v4];
          if (v12)
          {
            v5 = (void *)v12;
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    v5 = 0;
LABEL_12:
  }

  return v5;
}

- (id)tui_hostingView
{
  return self->_contentView;
}

- (void)appendRenderOverrideObservers:(id)a3
{
  id v4 = a3;
  [v4 addObject:self];
  v5 = [(TUIContainerView *)self tui_hostedSubviewsMap];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_48EB0;
  v7[3] = &unk_252BC8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = self;
  contentView = self->_contentView;
  id v8 = a4;
  -[TUIContainerView convertPoint:toView:](v6, "convertPoint:toView:", contentView, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](contentView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)invalidateRenderReferenceOverride:(id)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  [(TUIContainerView *)self setNeedsLayout];
}

- (TUIViewFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  return (TUIViewFactory *)WeakRetained;
}

- (NSDictionary)tui_hostedSubviewsMap
{
  return self->_hostedSubviewsMap;
}

- (void)setTui_hostedSubviewsMap:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (_TUIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_hostedSubviewsMap, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_currentSubviews, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end