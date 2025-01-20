@interface TUIHostingView
+ (id)renderModelIdentifier:(id)a3 size:(CGSize)a4 requestedSize:(CGSize)a5 usingGeometry:(BOOL)a6 insets:(UIEdgeInsets)a7 hostingIdentifier:(id)a8 hostingProperties:(id)a9 anchorPoint:(CGPoint)a10;
- (TUIHostingView)init;
- (void)_cleanup;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setNeedsHostingUpdate;
- (void)viewDidEndDisplay;
@end

@implementation TUIHostingView

- (TUIHostingView)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIHostingView;
  v2 = [(TUIHostingView *)&v6 init];
  if (v2)
  {
    v3 = +[UITraitCollection tui_allAPITraits];
    id v4 = [(TUIHostingView *)v2 registerForTraitChanges:v3 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v2;
}

+ (id)renderModelIdentifier:(id)a3 size:(CGSize)a4 requestedSize:(CGSize)a5 usingGeometry:(BOOL)a6 insets:(UIEdgeInsets)a7 hostingIdentifier:(id)a8 hostingProperties:(id)a9 anchorPoint:(CGPoint)a10
{
  double bottom = a7.bottom;
  double right = a7.right;
  double left = a7.left;
  double top = a7.top;
  BOOL v13 = a6;
  double height = a5.height;
  double width = a5.width;
  double v16 = a4.height;
  double v17 = a4.width;
  id v19 = a9;
  id v20 = a8;
  id v21 = a3;
  v22 = -[_TUIlHostingRenderModel initWithIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:]([_TUIlHostingRenderModel alloc], "initWithIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:", v21, v13, v20, v19, v17, v16, width, height, top, left, bottom, right, v27, v28);

  return v22;
}

- (void)setNeedsHostingUpdate
{
  if (!self->_flags.needsHostingUpdate)
  {
    v3 = TUIHostingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_191D00(self);
    }

    self->_flags.needsHostingUpdate = 1;
    [(TUIHostingView *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = TUIHostingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_191E70(self, v5);
  }

  v23.receiver = self;
  v23.super_class = (Class)TUIHostingView;
  [(TUIReusableBaseView *)&v23 applyLayoutAttributes:v4];

  objc_super v6 = [(TUIReusableBaseView *)self layoutAttributes];
  v7 = [v6 renderModel];

  v8 = [v7 hostingIdentifier];
  v9 = [v7 hostingProperties];
  p_hostingIdentifier = &self->_hostingIdentifier;
  hostingIdentifier = self->_hostingIdentifier;
  if ((hostingIdentifier == v8 || [(TUIHostingIdentifier *)hostingIdentifier isEqual:v8])
    && ((hostingProperties = self->_hostingProperties, hostingProperties == v9)
     || [(TUIHostingProperties *)hostingProperties isEqual:v9]))
  {
    [v7 requestedSize];
    if (self->_requestedSize.width != v14 || self->_requestedSize.height != v13)
    {
      [v7 requestedSize];
      self->_requestedSize.double width = v16;
      self->_requestedSize.double height = v17;
LABEL_20:
      [(TUIHostingView *)self setNeedsLayout];
      goto LABEL_21;
    }
    if ([(TUIHostingViewState *)self->_hostedViewState needsLayout]) {
      goto LABEL_20;
    }
  }
  else
  {
    v18 = TUIHostingLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_191DBC(self);
    }

    id v19 = [(TUIReusableBaseView *)self feedControllerHost];
    id v20 = [v19 hostingController];

    if (*p_hostingIdentifier) {
      [v20 removeProviderObserver:self forIdentifier:];
    }
    objc_storeStrong((id *)&self->_hostingIdentifier, v8);
    objc_storeStrong((id *)&self->_hostingProperties, v9);
    [v7 requestedSize];
    self->_requestedSize.double width = v21;
    self->_requestedSize.double height = v22;
    if (*p_hostingIdentifier) {
      [v20 addProviderObserver:self];
    }
    [(TUIHostingView *)self setNeedsHostingUpdate];
  }
LABEL_21:
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(TUIReusableBaseView *)self feedControllerHost];
  id v9 = [v6 hostingController];

  v7 = [(TUIHostingView *)self traitCollection];
  unsigned int v8 = [v9 needsGeometryUpdateWithOldTraitCollection:v7 newTraitCollection:v5];

  if (v8) {
    [(TUIHostingView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3 = TUIHostingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_191F78((uint64_t)self, v3);
  }

  id v4 = [(TUIReusableBaseView *)self feedControllerHost];
  id v5 = [v4 hostingController];

  BOOL needsHostingUpdate = self->_flags.needsHostingUpdate;
  if (self->_flags.needsHostingUpdate)
  {
    self->_flags.BOOL needsHostingUpdate = 0;
    v7 = [v5 viewStateForIdentifier:self->_hostingIdentifier];
    unsigned int v8 = TUIHostingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v33 = [(TUIReusableBaseView *)self feedControllerHost];
      id v34 = [v33 feedId];
      hostingIdentifier = self->_hostingIdentifier;
      hostedViewState = self->_hostedViewState;
      *(_DWORD *)buf = 134219010;
      id v42 = v34;
      __int16 v43 = 2112;
      v44 = hostingIdentifier;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2114;
      v48 = hostedViewState;
      __int16 v49 = 2114;
      v50 = v7;
      _os_log_debug_impl(&def_141F14, v8, OS_LOG_TYPE_DEBUG, "[fid:%lu] hosting update for identifier=%@ view=%p %{public}@ -> %{public}@", buf, 0x34u);
    }
    p_hostedViewState = &self->_hostedViewState;
    v10 = self->_hostedViewState;
    if (v10 == v7) {
      goto LABEL_11;
    }
    if (v10) {
      [v5 runDisappearanceTransitionForViewState:];
    }
    objc_storeStrong((id *)p_hostedViewState, v7);
    hostedViewVisibilityCancellable = self->_hostedViewVisibilityCancellable;
    self->_hostedViewVisibilityCancellable = 0;

    if (!*p_hostedViewState)
    {
LABEL_11:
      int v12 = 0;
    }
    else
    {
      [v5 runAppearanceTransitionForViewState:*p_hostedViewState superview:self];
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  double v13 = [(TUIReusableBaseView *)self layoutAttributes];
  double v14 = [v13 renderModel];

  [v14 insets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  unsigned int v23 = [v14 usingGeometry];
  [v14 anchorPoint];
  -[TUIHostingViewState setAnchorPoint:](self->_hostedViewState, "setAnchorPoint:");
  if (self->_hostedViewState)
  {
    if (needsHostingUpdate) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = v23 ^ 1;
    }
    [v5 updateFrameIfNeeded:v24 forViewState:self->_requestedSize.width, self->_requestedSize.height, v16, v18, v20, v22];
  }
  if ([v14 usingGeometry] && self->_hostedViewState) {
    [v5 runAppearanceAnimationIfNeededForViewState:];
  }
  v40.receiver = self;
  v40.super_class = (Class)TUIHostingView;
  [(TUIHostingView *)&v40 layoutSubviews];
  if (self->_hostedViewState) {
    [v5 updateGeometryForViewState:self->_requestedSize.width, self->_requestedSize.height, v16, v18, v20, v22];
  }
  if (v12)
  {
    v25 = [(TUIHostingViewState *)self->_hostedViewState visibilityOptions];
    if (v25)
    {
      v26 = self->_hostingIdentifier;
      uint64_t v27 = [(TUIReusableBaseView *)self feedControllerHost];
      uint64_t v28 = [v27 viewVisibilityController];
      v29 = [(TUIHostingViewState *)self->_hostedViewState view];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_B95C8;
      v37[3] = &unk_254A58;
      id v38 = v5;
      v39 = v26;
      v30 = v26;
      v31 = [v28 observeView:v29 options:v25 block:v37];
      v32 = self->_hostedViewVisibilityCancellable;
      self->_hostedViewVisibilityCancellable = v31;
    }
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TUIHostingView;
  [(TUIReusableBaseView *)&v3 prepareForReuse];
  [(TUIHostingView *)self _cleanup];
}

- (void)viewDidEndDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TUIHostingView;
  [(TUIReusableBaseView *)&v3 viewDidEndDisplay];
  [(TUIHostingView *)self _cleanup];
}

- (void)_cleanup
{
  objc_super v3 = [(TUIReusableBaseView *)self feedControllerHost];
  id v4 = [v3 hostingController];

  p_hostingIdentifier = &self->_hostingIdentifier;
  hostingIdentifier = self->_hostingIdentifier;
  if (v4)
  {
    if (hostingIdentifier)
    {
      [v4 removeProviderObserver:self];
      v7 = *p_hostingIdentifier;
      *p_hostingIdentifier = 0;

      hostingProperties = self->_hostingProperties;
      self->_hostingProperties = 0;
    }
    if (self->_hostedViewState)
    {
      hostedViewVisibilityCancellable = self->_hostedViewVisibilityCancellable;
      self->_hostedViewVisibilityCancellable = 0;

      [v4 didEndDisplayForViewState:self->_hostedViewState];
      hostedViewState = self->_hostedViewState;
      self->_hostedViewState = 0;
    }
  }
  else if (hostingIdentifier || self->_hostedViewState)
  {
    v11 = TUIHostingLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_192008((uint64_t *)&self->_hostingIdentifier, (uint64_t)self, v11);
    }

    if (_TUIDeviceHasInternalInstall())
    {
      id v12 = objc_alloc((Class)NSException);
      double v13 = +[NSString stringWithFormat:@"The hosting view has no hosting controller and is not cleaned up: identifier %@, viewState %@", *p_hostingIdentifier, self->_hostedViewState];
      id v14 = [v12 initWithName:@"HostingViewDetachedFromHost" reason:v13 userInfo:0];

      objc_exception_throw(v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViewVisibilityCancellable, 0);
  objc_storeStrong((id *)&self->_hostedViewState, 0);
  objc_storeStrong((id *)&self->_hostingProperties, 0);

  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end