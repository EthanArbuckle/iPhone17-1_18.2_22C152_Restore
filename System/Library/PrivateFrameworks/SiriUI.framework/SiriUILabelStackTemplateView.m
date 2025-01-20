@interface SiriUILabelStackTemplateView
- (BOOL)constraintsUpdated;
- (NSDictionary)contentBoundsGuideConstraints;
- (NSLayoutConstraint)bottomViewConstraint;
- (NSLayoutConstraint)topViewConstraint;
- (NSMutableDictionary)componentsForViews;
- (NSMutableDictionary)stackedComponentsGuideConstraints;
- (SiriUILabelStackTemplateView)initWithDataSource:(id)a3;
- (SiriUILabelStackTemplateViewDelegate)delegate;
- (UILayoutGuide)contentBoundsGuide;
- (UILayoutGuide)stackedComponentsBoundsGuide;
- (UIStackView)leadingViews;
- (UIStackView)trailingViews;
- (UIView)bottomView;
- (UIView)topView;
- (double)desiredHeight;
- (int64_t)defaultTextAlignment;
- (int64_t)layoutStyle;
- (void)_createContentLayoutGuides;
- (void)_updateTopAndBottomViewConstraints;
- (void)insertLeadingView:(id)a3 withMargins:(UIEdgeInsets)a4;
- (void)insertTopView:(id)a3;
- (void)insertTrailingView:(id)a3 withMargins:(UIEdgeInsets)a4;
- (void)populateStack;
- (void)reloadData;
- (void)removeFromTemplatedSuperview;
- (void)setBottomView:(id)a3;
- (void)setBottomViewConstraint:(id)a3;
- (void)setComponentsForViews:(id)a3;
- (void)setConstraintsUpdated:(BOOL)a3;
- (void)setContentBoundsGuide:(id)a3;
- (void)setContentBoundsGuideConstraints:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultTextAlignment:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLeadingViews:(id)a3;
- (void)setStackedComponentsBoundsGuide:(id)a3;
- (void)setStackedComponentsGuideConstraints:(id)a3;
- (void)setTemplatedSuperview:(id)a3;
- (void)setTopView:(id)a3;
- (void)setTopViewConstraint:(id)a3;
- (void)setTrailingViews:(id)a3;
- (void)updateConstraints;
@end

@implementation SiriUILabelStackTemplateView

- (SiriUILabelStackTemplateView)initWithDataSource:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriUILabelStackTemplateView;
  v5 = [(SiriUIBaseTemplateView *)&v14 initWithDataSource:v4];
  v6 = v5;
  if (v5)
  {
    v5->_defaultTextAlignment = 4;
    v7 = [(SiriUIBaseTemplateView *)v5 dataSource];
    uint64_t v8 = [v7 alignmentValue];

    if (v8 == 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 4;
    }
    [(SiriUILabelStackTemplateView *)v6 setDefaultTextAlignment:v9];
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    componentsForViews = v6->_componentsForViews;
    v6->_componentsForViews = v10;

    [(SiriUILabelStackTemplateView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriUILabelStackTemplateView *)v6 _createContentLayoutGuides];
    v12 = [MEMORY[0x263F08938] constraintWithItem:v6 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:44.0];
    [(SiriUILabelStackTemplateView *)v6 addConstraint:v12];

    [(SiriUILabelStackTemplateView *)v6 setDataSource:v4];
    [(SiriUILabelStackTemplateView *)v6 setNeedsUpdateConstraints];
    [(SiriUILabelStackTemplateView *)v6 setNeedsLayout];
  }

  return v6;
}

- (void)_createContentLayoutGuides
{
  v26[4] = *MEMORY[0x263EF8340];
  if (!self->_contentBoundsGuide)
  {
    v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    contentBoundsGuide = self->_contentBoundsGuide;
    self->_contentBoundsGuide = v3;

    [(UILayoutGuide *)self->_contentBoundsGuide setIdentifier:@"outer margins guide"];
    [(SiriUILabelStackTemplateView *)self addLayoutGuide:self->_contentBoundsGuide];
    v5 = [(UIView *)self siriui_pinToLayoutGuide:self->_contentBoundsGuide];
    contentBoundsGuideConstraints = self->_contentBoundsGuideConstraints;
    self->_contentBoundsGuideConstraints = v5;
  }
  if (!self->_stackedComponentsBoundsGuide)
  {
    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    stackedComponentsBoundsGuide = self->_stackedComponentsBoundsGuide;
    self->_stackedComponentsBoundsGuide = v7;

    [(UILayoutGuide *)self->_stackedComponentsBoundsGuide setIdentifier:@"inner components guide"];
    [(SiriUILabelStackTemplateView *)self addLayoutGuide:self->_stackedComponentsBoundsGuide];
    uint64_t v9 = [(UILayoutGuide *)self->_stackedComponentsBoundsGuide leadingAnchor];
    v10 = [(UILayoutGuide *)self->_contentBoundsGuide leadingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];

    v12 = [(UILayoutGuide *)self->_stackedComponentsBoundsGuide trailingAnchor];
    v13 = [(UILayoutGuide *)self->_contentBoundsGuide trailingAnchor];
    objc_super v14 = [v12 constraintEqualToAnchor:v13];

    v15 = [(UILayoutGuide *)self->_stackedComponentsBoundsGuide topAnchor];
    v16 = [(UILayoutGuide *)self->_contentBoundsGuide topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];

    v18 = [(UILayoutGuide *)self->_stackedComponentsBoundsGuide bottomAnchor];
    v19 = [(UILayoutGuide *)self->_contentBoundsGuide bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];

    v25[0] = &unk_26D657DD0;
    v25[1] = &unk_26D657DE8;
    v26[0] = v17;
    v26[1] = v20;
    v25[2] = &unk_26D657E00;
    v25[3] = &unk_26D657E18;
    v26[2] = v11;
    v26[3] = v14;
    v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    v22 = (NSMutableDictionary *)[v21 mutableCopy];
    stackedComponentsGuideConstraints = self->_stackedComponentsGuideConstraints;
    self->_stackedComponentsGuideConstraints = v22;

    v24 = [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints allValues];
    [(SiriUILabelStackTemplateView *)self addConstraints:v24];
  }
}

- (void)_updateTopAndBottomViewConstraints
{
  p_topViewConstraint = &self->_topViewConstraint;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topViewConstraint);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_topViewConstraint);
    [(SiriUILabelStackTemplateView *)self removeConstraint:v5];
  }
  id v6 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
    [(SiriUILabelStackTemplateView *)self removeConstraint:v7];
  }
  uint64_t v8 = [(SiriUILabelStackTemplateView *)self topView];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(SiriUILabelStackTemplateView *)self topView];
    v11 = [(SiriUILabelStackTemplateView *)self bottomView];

    if (v10 == v11)
    {
      v12 = [(SiriUILabelStackTemplateView *)self topView];
      v13 = [v12 centerYAnchor];
      objc_super v14 = [(SiriUILabelStackTemplateView *)self stackedComponentsBoundsGuide];
      v15 = [v14 centerYAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];

      LODWORD(v17) = 1132068864;
      [v16 setPriority:v17];
      [(SiriUILabelStackTemplateView *)self addConstraint:v16];
    }
  }
  v18 = [(SiriUILabelStackTemplateView *)self topView];

  if (v18)
  {
    v19 = [(SiriUILabelStackTemplateView *)self componentsForViews];
    v20 = (void *)MEMORY[0x263F08D40];
    v21 = [(SiriUILabelStackTemplateView *)self topView];
    v22 = [v20 valueWithPointer:v21];
    v23 = [v19 objectForKey:v22];

    v24 = +[SiriUIComponentConstraintFactory sharedConstraintFactory];
    v25 = [(SiriUILabelStackTemplateView *)self topView];
    v26 = [(SiriUILabelStackTemplateView *)self stackedComponentsBoundsGuide];
    v27 = objc_msgSend(v24, "topConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v25, v26, v23, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
    objc_storeWeak((id *)p_topViewConstraint, v27);

    id v28 = objc_loadWeakRetained((id *)p_topViewConstraint);
    if (!v28)
    {
      v29 = [(SiriUILabelStackTemplateView *)self topView];
      v30 = [(SiriUILabelStackTemplateView *)self contentBoundsGuide];
      v31 = [(SiriUIBaseTemplateView *)self templatedSuperview];
      [v31 templatedContentMargins];
      v32 = objc_msgSend(v29, "siriui_pinTopTo:withMargin:priority:", v30);
      objc_storeWeak((id *)p_topViewConstraint, v32);
    }
    id v33 = objc_loadWeakRetained((id *)p_topViewConstraint);
    [(SiriUILabelStackTemplateView *)self addConstraint:v33];
  }
  v34 = [(SiriUILabelStackTemplateView *)self bottomView];

  if (v34)
  {
    v35 = [(SiriUILabelStackTemplateView *)self componentsForViews];
    v36 = (void *)MEMORY[0x263F08D40];
    v37 = [(SiriUILabelStackTemplateView *)self bottomView];
    v38 = [v36 valueWithPointer:v37];
    id v50 = [v35 objectForKey:v38];

    v39 = +[SiriUIComponentConstraintFactory sharedConstraintFactory];
    v40 = [(SiriUILabelStackTemplateView *)self bottomView];
    v41 = [(SiriUILabelStackTemplateView *)self stackedComponentsBoundsGuide];
    v42 = objc_msgSend(v39, "bottomConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v40, v41, v50, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
    objc_storeWeak((id *)&self->_bottomViewConstraint, v42);

    id v43 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
    if (!v43)
    {
      v44 = [(SiriUILabelStackTemplateView *)self bottomView];
      v45 = [(SiriUIBaseTemplateView *)self templatedSuperview];
      [v45 templatedContentMargins];
      LODWORD(v46) = 1132003328;
      v48 = objc_msgSend(v44, "siriui_pinBottomTo:withMargin:priority:", self, v47, v46);
      objc_storeWeak((id *)&self->_bottomViewConstraint, v48);
    }
    id v49 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
    [(SiriUILabelStackTemplateView *)self addConstraint:v49];
  }
}

- (void)updateConstraints
{
  v25.receiver = self;
  v25.super_class = (Class)SiriUILabelStackTemplateView;
  [(SiriUILabelStackTemplateView *)&v25 updateConstraints];
  if (!self->_constraintsUpdated)
  {
    v3 = [(SiriUIBaseTemplateView *)self templatedSuperview];

    if (v3)
    {
      [(SiriUILabelStackTemplateView *)self _updateTopAndBottomViewConstraints];
      self->_constraintsUpdated = 1;
    }
  }
  id v4 = [(SiriUIBaseTemplateView *)self templatedSuperview];

  if (v4)
  {
    id v5 = [(SiriUIBaseTemplateView *)self templatedSuperview];
    [v5 templatedContentMargins];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_super v14 = [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints objectForKeyedSubscript:&unk_26D657DD0];
    [v14 setConstant:v7];

    v15 = [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints objectForKeyedSubscript:&unk_26D657DE8];
    [v15 setConstant:-v11];

    v16 = [(NSDictionary *)self->_contentBoundsGuideConstraints objectForKeyedSubscript:&unk_26D657E00];
    [v16 setConstant:v9];

    double v17 = [(NSDictionary *)self->_contentBoundsGuideConstraints objectForKeyedSubscript:&unk_26D657E18];
    [v17 setConstant:-v13];
  }
  v18 = [(SiriUILabelStackTemplateView *)self delegate];
  char v19 = [v18 labelStackTemplateViewShouldLayoutCompressed:self];

  double v20 = 0.0;
  if ((v19 & 1) == 0)
  {
    v21 = [(SiriUIBaseTemplateView *)self dataSource];
    uint64_t v22 = [v21 paddingValue];

    if (v22 == 1) {
      double v20 = 22.0;
    }
    else {
      double v20 = 0.0;
    }
  }
  v23 = [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints objectForKeyedSubscript:&unk_26D657DD0];
  [v23 setConstant:v20];

  v24 = [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints objectForKeyedSubscript:&unk_26D657DE8];
  [v24 setConstant:-v20];
}

- (void)insertLeadingView:(id)a3 withMargins:(UIEdgeInsets)a4
{
  double right = a4.right;
  double left = a4.left;
  id v7 = a3;
  leadingViews = self->_leadingViews;
  id v28 = v7;
  if (!leadingViews)
  {
    double v9 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
    double v10 = self->_leadingViews;
    self->_leadingViews = v9;

    [(SiriUILabelStackTemplateView *)self addSubview:self->_leadingViews];
    [(UIStackView *)self->_leadingViews setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_leadingViews setAlignment:0];
    [(UIStackView *)self->_leadingViews setAxis:0];
    LODWORD(v11) = 1144750080;
    [(UIStackView *)self->_leadingViews setContentHuggingPriority:0 forAxis:v11];
    LODWORD(v12) = 1132068864;
    [(UIStackView *)self->_leadingViews setContentCompressionResistancePriority:0 forAxis:v12];
    double v13 = self->_leadingViews;
    objc_super v14 = [(SiriUILabelStackTemplateView *)self contentBoundsGuide];
    id v15 = (id)[(UIStackView *)v13 siriui_pinLeadingToLeadingEdgeOf:v14 withMargin:0.0];

    v16 = [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints objectForKeyedSubscript:&unk_26D657E00];
    [(SiriUILabelStackTemplateView *)self removeConstraint:v16];

    double v17 = [(UIStackView *)self->_leadingViews siriui_pinTrailingToLeadingEdgeOf:self->_stackedComponentsBoundsGuide withMargin:-12.0];
    [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints setObject:v17 forKeyedSubscript:&unk_26D657E00];
    v18 = [(UIStackView *)self->_leadingViews centerYAnchor];
    char v19 = [(UILayoutGuide *)self->_stackedComponentsBoundsGuide centerYAnchor];
    double v20 = [v18 constraintEqualToAnchor:v19];

    LODWORD(v21) = 1132068864;
    [v20 setPriority:v21];
    [(SiriUILabelStackTemplateView *)self addConstraint:v20];

    id v7 = v28;
    leadingViews = self->_leadingViews;
  }
  [(UIStackView *)leadingViews addArrangedSubview:v7];
  uint64_t v22 = +[SiriUIComponentConstraintFactory sharedConstraintFactory];
  v23 = [(SiriUILabelStackTemplateView *)self contentBoundsGuide];
  v24 = objc_msgSend(v22, "topConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v28, v23, 0, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));

  if (v24) {
    [(SiriUILabelStackTemplateView *)self addConstraint:v24];
  }
  objc_super v25 = +[SiriUIComponentConstraintFactory sharedConstraintFactory];
  v26 = [(SiriUILabelStackTemplateView *)self contentBoundsGuide];
  v27 = objc_msgSend(v25, "bottomConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v28, v26, 0, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));

  if (v27) {
    [(SiriUILabelStackTemplateView *)self addConstraint:v27];
  }
  [(UIStackView *)self->_leadingViews setSpacing:fabs(left) + fabs(right)];
}

- (void)insertTrailingView:(id)a3 withMargins:(UIEdgeInsets)a4
{
  double right = a4.right;
  double left = a4.left;
  id v7 = a3;
  trailingViews = self->_trailingViews;
  id v22 = v7;
  if (!trailingViews)
  {
    double v9 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
    double v10 = self->_trailingViews;
    self->_trailingViews = v9;

    [(SiriUILabelStackTemplateView *)self addSubview:self->_trailingViews];
    [(UIStackView *)self->_trailingViews setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_trailingViews setAlignment:0];
    [(UIStackView *)self->_trailingViews setAxis:0];
    LODWORD(v11) = 1144750080;
    [(UIStackView *)self->_trailingViews setContentHuggingPriority:0 forAxis:v11];
    LODWORD(v12) = 1132068864;
    [(UIStackView *)self->_trailingViews setContentCompressionResistancePriority:0 forAxis:v12];
    double v13 = self->_trailingViews;
    objc_super v14 = [(SiriUILabelStackTemplateView *)self contentBoundsGuide];
    id v15 = (id)[(UIStackView *)v13 siriui_pinTrailingToTrailingEdgeOf:v14 withMargin:0.0];

    v16 = [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints objectForKeyedSubscript:&unk_26D657E18];
    [(SiriUILabelStackTemplateView *)self removeConstraint:v16];

    double v17 = [(UIStackView *)self->_trailingViews siriui_pinLeadingToTrailingEdgeOf:self->_stackedComponentsBoundsGuide withMargin:12.0];
    [(NSMutableDictionary *)self->_stackedComponentsGuideConstraints setObject:v17 forKeyedSubscript:&unk_26D657E18];
    v18 = [(UIStackView *)self->_trailingViews centerYAnchor];
    char v19 = [(SiriUILabelStackTemplateView *)self stackedComponentsBoundsGuide];
    double v20 = [v19 centerYAnchor];
    double v21 = [v18 constraintEqualToAnchor:v20];
    [(SiriUILabelStackTemplateView *)self addConstraint:v21];

    id v7 = v22;
    trailingViews = self->_trailingViews;
  }
  [(UIStackView *)trailingViews addArrangedSubview:v7];
  [(UIStackView *)self->_trailingViews setSpacing:fabs(left) + fabs(right)];
}

- (void)insertTopView:(id)a3
{
  id v4 = a3;
  [(SiriUILabelStackTemplateView *)self addSubview:v4];
  id v5 = [(SiriUILabelStackTemplateView *)self topView];

  if (v5)
  {
    double v6 = [(SiriUILabelStackTemplateView *)self topView];
    id v7 = [(SiriUILabelStackTemplateView *)self componentsForViews];
    double v8 = [MEMORY[0x263F08D40] valueWithPointer:v6];
    double v9 = [v7 objectForKey:v8];

    double v10 = +[SiriUIComponentConstraintFactory sharedConstraintFactory];
    double v11 = objc_msgSend(v10, "verticalConstraintFromUpperView:lowerView:upperTemplateComponent:lowerTemplateComponent:layoutStyle:", v4, v6, 0, v9, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));

    [(SiriUILabelStackTemplateView *)self addConstraint:v11];
  }
  else
  {
    [(SiriUILabelStackTemplateView *)self setBottomView:v4];
  }
  [(SiriUILabelStackTemplateView *)self setTopView:v4];

  [(SiriUILabelStackTemplateView *)self _updateTopAndBottomViewConstraints];
  [(SiriUILabelStackTemplateView *)self setNeedsUpdateConstraints];
}

- (double)desiredHeight
{
  [(UILayoutGuide *)self->_contentBoundsGuide layoutFrame];
  return CGRectGetMaxY(*(CGRect *)&v2);
}

- (void)removeFromTemplatedSuperview
{
  id v3 = [(SiriUIBaseTemplateView *)self templatedSuperview];
  [v3 templateSubviewWantsToBeRemovedFromHierarchy:self];
}

- (void)populateStack
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(SiriUILabelStackTemplateView *)self topView];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(SiriUIBaseTemplateView *)self dataSource];
  id v5 = [v4 labelComponents];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      double v11 = v3;
      double v12 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        objc_super v14 = +[SiriUILabelComponentView viewForComponent:v13];
        id v15 = [(SiriUILabelStackTemplateView *)self componentsForViews];
        v16 = [MEMORY[0x263F08D40] valueWithPointer:v14];
        [v15 setObject:v13 forKey:v16];

        [(SiriUILabelStackTemplateView *)self addSubview:v14];
        if (v11)
        {
          double v17 = +[SiriUIComponentConstraintFactory sharedConstraintFactory];
          v18 = objc_msgSend(v17, "verticalConstraintFromUpperView:lowerView:upperTemplateComponent:lowerTemplateComponent:layoutStyle:", v11, v14, v12, v13, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));

          [(SiriUILabelStackTemplateView *)self addConstraint:v18];
        }
        else
        {
          [(SiriUILabelStackTemplateView *)self setTopView:v14];
        }
        id v19 = (id)objc_msgSend(v14, "siriui_pinLeadingToLeadingEdgeOf:withMargin:", self->_stackedComponentsBoundsGuide, 0.0);
        id v20 = (id)objc_msgSend(v14, "siriui_pinTrailingToTrailingEdgeOf:withMargin:", self->_stackedComponentsBoundsGuide, 0.0);
        id v8 = v13;

        id v3 = v14;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v3;
          objc_msgSend(v21, "setTextAlignment:", -[SiriUILabelStackTemplateView defaultTextAlignment](self, "defaultTextAlignment"));
        }
        [(SiriUILabelStackTemplateView *)self setBottomView:v3];

        ++v10;
        double v11 = v3;
        double v12 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)setTemplatedSuperview:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SiriUILabelStackTemplateView;
  [(SiriUIBaseTemplateView *)&v7 setTemplatedSuperview:v4];
  if (v4)
  {
    id v5 = [(UIView *)self siriui_pinLeadingTo:v4 withMargin:0.0];
    id v6 = [(UIView *)self siriui_pinTrailingTo:v4 withMargin:0.0];
    [(SiriUILabelStackTemplateView *)self setNeedsUpdateConstraints];
  }
}

- (int64_t)layoutStyle
{
  return 0;
}

- (void)reloadData
{
  [(SiriUILabelStackTemplateView *)self populateStack];
  [(SiriUILabelStackTemplateView *)self setNeedsUpdateConstraints];
}

- (void)setDataSource:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUILabelStackTemplateView;
  [(SiriUIBaseTemplateView *)&v4 setDataSource:a3];
  [(SiriUILabelStackTemplateView *)self reloadData];
}

- (SiriUILabelStackTemplateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUILabelStackTemplateViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)defaultTextAlignment
{
  return self->_defaultTextAlignment;
}

- (void)setDefaultTextAlignment:(int64_t)a3
{
  self->_defaultTextAlignment = a3;
}

- (UIView)topView
{
  return self->_topView;
}

- (void)setTopView:(id)a3
{
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
}

- (BOOL)constraintsUpdated
{
  return self->_constraintsUpdated;
}

- (void)setConstraintsUpdated:(BOOL)a3
{
  self->_constraintsUpdated = a3;
}

- (NSLayoutConstraint)topViewConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topViewConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTopViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomViewConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomViewConstraint:(id)a3
{
}

- (UIStackView)trailingViews
{
  return self->_trailingViews;
}

- (void)setTrailingViews:(id)a3
{
}

- (UIStackView)leadingViews
{
  return self->_leadingViews;
}

- (void)setLeadingViews:(id)a3
{
}

- (NSMutableDictionary)componentsForViews
{
  return self->_componentsForViews;
}

- (void)setComponentsForViews:(id)a3
{
}

- (UILayoutGuide)contentBoundsGuide
{
  return self->_contentBoundsGuide;
}

- (void)setContentBoundsGuide:(id)a3
{
}

- (NSDictionary)contentBoundsGuideConstraints
{
  return self->_contentBoundsGuideConstraints;
}

- (void)setContentBoundsGuideConstraints:(id)a3
{
}

- (UILayoutGuide)stackedComponentsBoundsGuide
{
  return self->_stackedComponentsBoundsGuide;
}

- (void)setStackedComponentsBoundsGuide:(id)a3
{
}

- (NSMutableDictionary)stackedComponentsGuideConstraints
{
  return self->_stackedComponentsGuideConstraints;
}

- (void)setStackedComponentsGuideConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedComponentsGuideConstraints, 0);
  objc_storeStrong((id *)&self->_stackedComponentsBoundsGuide, 0);
  objc_storeStrong((id *)&self->_contentBoundsGuideConstraints, 0);
  objc_storeStrong((id *)&self->_contentBoundsGuide, 0);
  objc_storeStrong((id *)&self->_componentsForViews, 0);
  objc_storeStrong((id *)&self->_leadingViews, 0);
  objc_storeStrong((id *)&self->_trailingViews, 0);
  objc_destroyWeak((id *)&self->_bottomViewConstraint);
  objc_destroyWeak((id *)&self->_topViewConstraint);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end