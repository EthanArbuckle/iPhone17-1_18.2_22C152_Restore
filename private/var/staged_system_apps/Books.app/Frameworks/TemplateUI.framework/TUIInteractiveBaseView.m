@interface TUIInteractiveBaseView
+ (NSString)tuiReuseIdentifier;
- (BOOL)_updateFromState;
- (BOOL)clipsToBounds;
- (BOOL)enabled;
- (BOOL)highlighted;
- (BOOL)isEnabledWithRenderModel:(id)a3;
- (BOOL)presentContextMenuForAccessibility;
- (BOOL)showContents;
- (NSString)animatingTargetState;
- (NSString)currentState;
- (NSString)name;
- (NSString)previousState;
- (NSString)savedCurrentState;
- (TUIControlView)control;
- (TUIRenderModelInteractive)renderModel;
- (TUIRenderModelSubviews)currentSubviewsModel;
- (TUIViewFactory)factory;
- (UIEdgeInsets)outsets;
- (id)descendentViewWithIdentifier:(id)a3;
- (id)descendentViewWithRefId:(id)a3;
- (id)viewStateSave;
- (void)_updateSubviews;
- (void)appendRenderOverrideObservers:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)invalidateRenderReferenceOverride:(id)a3;
- (void)invalidateShowContents;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAnimatingTargetState:(id)a3;
- (void)setControl:(id)a3;
- (void)setCurrentSubviewsModel:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFactory:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOutsets:(UIEdgeInsets)a3;
- (void)setPreviousState:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)setSavedCurrentState:(id)a3;
- (void)updateFromState;
- (void)viewDidEndDisplay;
@end

@implementation TUIInteractiveBaseView

+ (NSString)tuiReuseIdentifier
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self->_control;
  if ([(TUIControlView *)v4 isEnabled] != v3) {
    [(TUIInteractiveBaseView *)v4 setEnabled:v3];
  }
}

- (BOOL)enabled
{
  return [(TUIControlView *)self->_control isEnabled];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self->_control;
  if ([(TUIControlView *)v4 isHighlighted] != v3) {
    [(TUIInteractiveBaseView *)v4 setHighlighted:v3];
  }
}

- (BOOL)highlighted
{
  return [(TUIControlView *)self->_control isHighlighted];
}

- (void)applyLayoutAttributes:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TUIInteractiveBaseView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v18 applyLayoutAttributes:v4];
  v5 = [(TUIRenderModelInteractive *)self->_renderModel style];
  v6 = [v4 renderModel];
  [v4 outsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[TUIInteractiveBaseView configureWithModel:outsets:](self, "configureWithModel:outsets:", v6, v8, v10, v12, v14);
  v15 = [(TUIInteractiveBaseView *)self control];
  [v5 removeStylingFromView:v15];

  v16 = [v6 style];
  v17 = [(TUIInteractiveBaseView *)self control];
  [v16 applyStylingToView:v17];
}

- (void)setFactory:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_factory, obj);
    [(TUIInteractiveBaseView *)self _updateSubviews];
    [(TUIInteractiveBaseView *)self didUpdateSubviews];
    v5 = obj;
  }
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)appendRenderOverrideObservers:(id)a3
{
  id v4 = a3;
  [v4 addObject:self];
  v5 = [(TUIInteractiveBaseView *)self control];
  v6 = [v5 tui_hostedSubviewsMap];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_B9D18;
  v8[3] = &unk_252BC8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

- (id)viewStateSave
{
  return 0;
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v10 = (TUIRenderModelInteractive *)a3;
  v19 = v10;
  if (self->_renderModel != v10
    || ((double v11 = self->_outsets.top, self->_outsets.left == left) ? (v12 = v11 == top) : (v12 = 0),
        v12 ? (BOOL v13 = self->_outsets.right == right) : (BOOL v13 = 0),
        v13 ? (BOOL v14 = self->_outsets.bottom == bottom) : (BOOL v14 = 0),
        !v14))
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    self->_outsets.double top = top;
    self->_outsets.double left = left;
    self->_outsets.double bottom = bottom;
    self->_outsets.double right = right;
    [(TUIInteractiveBaseView *)self loadControlIfNeeded];
    [(TUIInteractiveBaseView *)self setEnabled:[(TUIInteractiveBaseView *)self isEnabledWithRenderModel:v19]];
    BOOL v15 = [(TUIInteractiveBaseView *)self clipsToBounds];
    v16 = [(TUIInteractiveBaseView *)self control];
    [v16 setClipsToBounds:v15];

    v17 = [(TUIRenderModelInteractive *)v19 name];
    [(TUIInteractiveBaseView *)self setName:v17];

    objc_super v18 = [(TUIInteractiveBaseView *)self currentState];
    [(TUIInteractiveBaseView *)self setPreviousState:v18];

    [(TUIInteractiveBaseView *)self updateFromState];
    [(TUIInteractiveBaseView *)self renderModelUpdated];
LABEL_13:
    double v10 = v19;
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)&self->_flags |= 2u;
    [(TUIInteractiveBaseView *)self setNeedsLayout];
    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)isEnabledWithRenderModel:(id)a3
{
  return [a3 enabled];
}

- (void)prepareForReuse
{
  v15.receiver = self;
  v15.super_class = (Class)TUIInteractiveBaseView;
  [(TUIReusableBaseView *)&v15 prepareForReuse];
  BOOL v3 = [(TUIInteractiveBaseView *)self layer];
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m33;
  v14[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v14[5] = v4;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  v14[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v14[7] = v5;
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  v14[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v14[1] = v6;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m23;
  v14[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v14[3] = v7;
  [v3 setSublayerTransform:v14];

  animatingTargetState = self->_animatingTargetState;
  self->_animatingTargetState = 0;

  savedCurrentState = self->_savedCurrentState;
  self->_savedCurrentState = 0;

  double v10 = [(TUIRenderModelInteractive *)self->_renderModel style];
  double v11 = [(TUIInteractiveBaseView *)self control];
  [v10 removeStylingFromView:v11];

  renderModel = self->_renderModel;
  self->_renderModel = 0;

  currentSubviewsModel = self->_currentSubviewsModel;
  self->_currentSubviewsModel = 0;

  [(TUIInteractiveBaseView *)self _updateSubviews];
  [(TUIInteractiveBaseView *)self didUpdateSubviews];
}

- (void)updateFromState
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    *(unsigned char *)&self->_flags |= 1u;
    BOOL v3 = [(TUIInteractiveBaseView *)self currentState];
    savedCurrentState = self->_savedCurrentState;
    self->_savedCurrentState = v3;

    [(TUIInteractiveBaseView *)self setNeedsLayout];
  }
}

- (BOOL)_updateFromState
{
  p_animatingTargetState = &self->_animatingTargetState;
  if (!self->_animatingTargetState)
  {
    savedCurrentState = self->_savedCurrentState;
    if (savedCurrentState)
    {
      long long v6 = savedCurrentState;
    }
    else
    {
      long long v6 = [(TUIInteractiveBaseView *)self currentState];
    }
    long long v7 = v6;
    double v8 = self->_savedCurrentState;
    self->_savedCurrentState = 0;

    id v9 = [(TUIInteractiveBaseView *)self renderModel];
    [v9 pressScale];
    double v11 = v10;

    if (v7 == @"highlighted")
    {
      BOOL v13 = [(TUIInteractiveBaseView *)self previousState];
      BOOL v12 = v13 == @"default";
    }
    else
    {
      BOOL v12 = 0;
    }
    if (v7 == @"default")
    {
      objc_super v15 = [(TUIInteractiveBaseView *)self previousState];
      BOOL v14 = v15 == @"highlighted";
    }
    else
    {
      BOOL v14 = 0;
    }
    BOOL v60 = v14;
    int v16 = v12 || v14;
    v62 = [(TUIInteractiveBaseView *)self control];
    v63 = [v62 tui_hostingView];
    v17 = [(TUIRenderModelInteractive *)self->_renderModel stateToModel];
    objc_super v18 = [(TUIInteractiveBaseView *)self currentState];
    v19 = [v17 objectForKeyedSubscript:v18];

    if (!v19)
    {
      v20 = [(TUIRenderModelInteractive *)self->_renderModel stateToModel];
      v19 = [v20 objectForKeyedSubscript:@"default"];
    }
    p_currentSubviewsModel = &self->_currentSubviewsModel;
    if (v11 == 1.0 && self->_currentSubviewsModel == v19) {
      int v16 = 0;
    }
    uint64_t v73 = 0;
    v74 = (id *)&v73;
    uint64_t v75 = 0x3032000000;
    v76 = sub_BA95C;
    v77 = sub_BA96C;
    id v78 = 0;
    if (v16 == 1)
    {
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_BA974;
      v72[3] = &unk_2519E0;
      v72[4] = self;
      v72[5] = &v73;
      v23 = [[_TUIInteractiveBasePressAnimationDelegate alloc] initWithCompletion:v72];
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong(v74 + 5, v23);
    if (v16)
    {

      if (*p_currentSubviewsModel == v19)
      {
        BOOL v3 = 0;
        goto LABEL_29;
      }
      v24 = +[CATransition animation];
      [v24 setDuration:0.15];
      v25 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      [v24 setTimingFunction:v25];

      [v24 setDelegate:v74[5]];
      v26 = [v63 layer];
      [v26 addAnimation:v24 forKey:@"crossfade"];
    }
    else if (*p_currentSubviewsModel == v19)
    {
      BOOL v3 = 0;
LABEL_40:
      [(TUIInteractiveBaseView *)self setPreviousState:v7];
      _Block_object_dispose(&v73, 8);

      return v3;
    }
    objc_storeStrong((id *)&self->_currentSubviewsModel, v19);
    [(TUIInteractiveBaseView *)self _updateSubviews];
    BOOL v3 = 1;
    if (!v16) {
      goto LABEL_40;
    }
LABEL_29:
    if (v74[5]) {
      objc_storeStrong((id *)p_animatingTargetState, v7);
    }
    v27 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    if (v12)
    {
      memset(&v71, 0, sizeof(v71));
      CGFloat v28 = -self->_outsets.top;
      CGFloat v29 = -self->_outsets.left;
      long long v56 = *(_OWORD *)&CATransform3DIdentity.m33;
      long long v58 = *(_OWORD *)&CATransform3DIdentity.m31;
      *(_OWORD *)&v70.m31 = v58;
      *(_OWORD *)&v70.m33 = v56;
      long long v52 = *(_OWORD *)&CATransform3DIdentity.m43;
      long long v54 = *(_OWORD *)&CATransform3DIdentity.m41;
      *(_OWORD *)&v70.m41 = v54;
      *(_OWORD *)&v70.m43 = v52;
      long long v48 = *(_OWORD *)&CATransform3DIdentity.m13;
      long long v50 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v70.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v70.m13 = v48;
      long long v45 = *(_OWORD *)&CATransform3DIdentity.m23;
      long long v46 = *(_OWORD *)&CATransform3DIdentity.m21;
      *(_OWORD *)&v70.m21 = v46;
      *(_OWORD *)&v70.m23 = v45;
      CATransform3DTranslate(&v71, &v70, v28, v29, 0.0);
      memset(&v70, 0, sizeof(v70));
      v30 = [(TUIInteractiveBaseView *)self control];
      v31 = [v30 layer];
      v32 = [v31 presentationLayer];
      v33 = v32;
      if (v32) {
        [v32 sublayerTransform];
      }
      else {
        memset(&b, 0, sizeof(b));
      }
      CATransform3D a = v71;
      CATransform3DConcat(&v70, &a, &b);

      memset(&a, 0, sizeof(a));
      *(_OWORD *)&v67.m31 = v58;
      *(_OWORD *)&v67.m33 = v56;
      *(_OWORD *)&v67.m41 = v54;
      *(_OWORD *)&v67.m43 = v52;
      *(_OWORD *)&v67.m11 = v50;
      *(_OWORD *)&v67.m13 = v48;
      *(_OWORD *)&v67.m21 = v46;
      *(_OWORD *)&v67.m23 = v45;
      CATransform3DScale(&a, &v67, v11, v11, 1.0);
      CATransform3D v67 = v70;
      v34 = +[NSValue valueWithCATransform3D:&v67];
      CATransform3D v67 = a;
      v35 = +[NSValue valueWithCATransform3D:&v67];
      v36 = +[CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
      [v36 setFromValue:v34];
      [v36 setToValue:v35];
      [v36 setDuration:0.15];
      [v36 setDelegate:v74[5]];
      v37 = [(TUIInteractiveBaseView *)self layer];
      [v37 addAnimation:v36 forKey:@"pressed"];

      CATransform3D v66 = a;
      v38 = [(TUIInteractiveBaseView *)self layer];
      CATransform3D v65 = v66;
      [v38 setSublayerTransform:&v65];

      v27 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    }
    if (v60)
    {
      memset(&v71, 0, sizeof(v71));
      long long v59 = *(_OWORD *)&CATransform3DIdentity.m33;
      *(_OWORD *)&v70.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
      long long v61 = *(_OWORD *)&v70.m31;
      *(_OWORD *)&v70.m33 = v59;
      long long v55 = *(_OWORD *)&CATransform3DIdentity.m43;
      *(_OWORD *)&v70.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
      long long v57 = *(_OWORD *)&v70.m41;
      *(_OWORD *)&v70.m43 = v55;
      long long v51 = *(_OWORD *)&CATransform3DIdentity.m13;
      *(_OWORD *)&v70.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      long long v53 = *(_OWORD *)&v70.m11;
      *(_OWORD *)&v70.m13 = v51;
      long long v47 = *(_OWORD *)&CATransform3DIdentity.m23;
      *(_OWORD *)&v70.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
      long long v49 = *(_OWORD *)&v70.m21;
      *(_OWORD *)&v70.m23 = v47;
      CATransform3DScale(&v71, &v70, v11, v11, 1.0);
      CATransform3D v70 = v71;
      v39 = +[NSValue valueWithCATransform3D:&v70];
      *(_OWORD *)&v70.m31 = v61;
      *(_OWORD *)&v70.m33 = v59;
      *(_OWORD *)&v70.m41 = v57;
      *(_OWORD *)&v70.m43 = v55;
      *(_OWORD *)&v70.m11 = v53;
      *(_OWORD *)&v70.m13 = v51;
      *(_OWORD *)&v70.m21 = v49;
      *(_OWORD *)&v70.m23 = v47;
      v40 = +[NSValue valueWithCATransform3D:&v70];
      v41 = +[CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
      [v41 setFromValue:v39];
      [v41 setToValue:v40];
      [v41 setDuration:0.15];
      [v41 setDelegate:v74[5]];
      v42 = [(TUIInteractiveBaseView *)self layer];
      [v42 addAnimation:v41 forKey:@"reversed"];

      v43 = [(TUIInteractiveBaseView *)self layer];
      v64[4] = v61;
      v64[5] = v59;
      v64[6] = v57;
      v64[7] = v55;
      v64[0] = v53;
      v64[1] = v51;
      v64[2] = v49;
      v64[3] = v47;
      [v43 setSublayerTransform:v64];

      v27 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    }
    [v27[402] commit:v45];
    goto LABEL_40;
  }
  return 0;
}

- (void)viewDidEndDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TUIInteractiveBaseView;
  [(TUIReusableBaseView *)&v3 viewDidEndDisplay];
  [(TUIInteractiveBaseView *)self prepareForReuse];
}

- (void)layoutSubviews
{
  char flags = (char)self->_flags;
  if (flags)
  {
    *(unsigned char *)&self->_char flags = flags & 0xFE;
    unsigned int v4 = [(TUIInteractiveBaseView *)self _updateFromState];
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
      if (!v4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_9;
  }
  *(unsigned char *)&self->_char flags = flags & 0xFD;
  [(TUIInteractiveBaseView *)self _updateSubviews];
LABEL_8:
  [(TUIInteractiveBaseView *)self didUpdateSubviews];
LABEL_9:
  v5.receiver = self;
  v5.super_class = (Class)TUIInteractiveBaseView;
  [(TUIInteractiveBaseView *)&v5 layoutSubviews];
}

- (void)invalidateShowContents
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    *(unsigned char *)&self->_flags |= 2u;
    [(TUIInteractiveBaseView *)self setNeedsLayout];
  }
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIInteractiveBaseView;
  objc_super v5 = [(TUIReusableBaseView *)&v19 descendentViewWithIdentifier:v4];
  if (!v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v6 = [(TUIInteractiveBaseView *)self control];
    long long v7 = [v6 tui_hostedSubviewsMap];
    double v8 = [v7 allValues];

    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) descendentViewWithIdentifier:v4];
          if (v13)
          {
            objc_super v5 = (void *)v13;
            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    objc_super v5 = 0;
LABEL_12:
  }

  return v5;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIInteractiveBaseView;
  objc_super v5 = [(TUIReusableBaseView *)&v19 descendentViewWithRefId:v4];
  if (!v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v6 = [(TUIInteractiveBaseView *)self control];
    long long v7 = [v6 tui_hostedSubviewsMap];
    double v8 = [v7 allValues];

    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) descendentViewWithRefId:v4];
          if (v13)
          {
            objc_super v5 = (void *)v13;
            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    objc_super v5 = 0;
LABEL_12:
  }

  return v5;
}

- (BOOL)showContents
{
  return 1;
}

- (void)_updateSubviews
{
  objc_super v3 = [(TUIInteractiveBaseView *)self control];
  char v25 = 0;
  if (self->_currentSubviewsModel
    && (id v4 = objc_loadWeakRetained((id *)&self->_factory)) != 0
    && (objc_super v5 = v4, v6 = [(TUIInteractiveBaseView *)self showContents], v5, v6))
  {
    [(TUIRenderModelSubviews *)self->_currentSubviewsModel prepare];
    long long v7 = [(TUIReusableBaseView *)self feedControllerHost];
    double v8 = [v7 renderOverrideProvider];
    id v9 = [v8 renderOverrides];

    if (v9)
    {
      id v10 = [(TUIReusableBaseView *)self tui_querySectionUUID];
      uint64_t v11 = [(TUIReusableBaseView *)self tui_querySectionUID];
    }
    else
    {
      uint64_t v11 = 0;
      id v10 = 0;
    }
    currentSubviewsModel = self->_currentSubviewsModel;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
    long long v16 = -[TUIRenderModelSubviews configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:](currentSubviewsModel, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", WeakRetained, v3, v9, &v25, v10, v11, self->_outsets.top, self->_outsets.left, self->_outsets.bottom, self->_outsets.right);

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v17 = v16;
    long long v18 = (char *)[v17 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v18)
    {
      objc_super v19 = v18;
      uint64_t v20 = *(void *)v22;
      while (1)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(v17);
        }
        if (!--v19)
        {
          objc_super v19 = (char *)[v17 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (!v19) {
            break;
          }
        }
      }
    }

    char v13 = 4 * v25;
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)&self->_factory);
    [v12 viewFactoryPrepareToReuseHost:v3];

    char v13 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v13;
}

- (BOOL)presentContextMenuForAccessibility
{
  return 0;
}

- (void)invalidateRenderReferenceOverride:(id)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  [(TUIInteractiveBaseView *)self setNeedsLayout];
}

- (TUIViewFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  return (TUIViewFactory *)WeakRetained;
}

- (NSString)currentState
{
  return self->_currentState;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)animatingTargetState
{
  return self->_animatingTargetState;
}

- (void)setAnimatingTargetState:(id)a3
{
}

- (NSString)savedCurrentState
{
  return self->_savedCurrentState;
}

- (void)setSavedCurrentState:(id)a3
{
}

- (TUIControlView)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
}

- (TUIRenderModelInteractive)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (UIEdgeInsets)outsets
{
  double top = self->_outsets.top;
  double left = self->_outsets.left;
  double bottom = self->_outsets.bottom;
  double right = self->_outsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOutsets:(UIEdgeInsets)a3
{
  self->_outsets = a3;
}

- (NSString)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
}

- (TUIRenderModelSubviews)currentSubviewsModel
{
  return self->_currentSubviewsModel;
}

- (void)setCurrentSubviewsModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSubviewsModel, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_savedCurrentState, 0);
  objc_storeStrong((id *)&self->_animatingTargetState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentState, 0);

  objc_destroyWeak((id *)&self->_factory);
}

@end