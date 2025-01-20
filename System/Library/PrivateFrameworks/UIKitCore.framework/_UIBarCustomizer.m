@interface _UIBarCustomizer
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)isActive;
- (BOOL)wasReset;
- (CGPoint)lastDragLocation;
- (CGRect)initialSourceFrame;
- (NSMutableArray)_visibleItems;
- (NSMutableArray)ellipsisDotViews;
- (UIDragInteraction)dragInteraction;
- (UIScrollView)visibleItemScrollView;
- (UIView)dimmingView;
- (_UIBarCustomizationContainerView)containerView;
- (_UIBarCustomizationItemReservoirView)reservoir;
- (_UIBarCustomizationSession)_activeSession;
- (_UIBarCustomizer)initWithDelegate:(id)a3;
- (_UIBarCustomizerDelegate)delegate;
- (double)_dragInteraction:(id)a3 delayForLiftBeginningAtLocation:(CGPoint)a4;
- (id)_dragItemsAtLocation:(CGPoint)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)keyboardSuppressionAssertion;
- (int)_overflowItemBucketSize;
- (unint64_t)_dropIndex;
- (unint64_t)overflowItemCount;
- (void)_animateDropOrCancelForItem:(id)a3 animator:(id)a4 isCancel:(BOOL)a5;
- (void)_handleDimmingViewTap:(id)a3;
- (void)_reflow;
- (void)_reflowAnimatedWithAlongsideActions:(id)a3;
- (void)_setActive:(BOOL)a3;
- (void)_updateDebugUI;
- (void)beginWithSession:(id)a3;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)end;
- (void)invalidateLayout;
- (void)setContainerView:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setDragInteraction:(id)a3;
- (void)setEllipsisDotViews:(id)a3;
- (void)setInitialSourceFrame:(CGRect)a3;
- (void)setKeyboardSuppressionAssertion:(id)a3;
- (void)setLastDragLocation:(CGPoint)a3;
- (void)setOverflowItemCount:(unint64_t)a3;
- (void)setReservoir:(id)a3;
- (void)setVisibleItemScrollView:(id)a3;
- (void)setWasReset:(BOOL)a3;
- (void)set_activeSession:(id)a3;
- (void)set_dropIndex:(unint64_t)a3;
- (void)set_visibleItems:(id)a3;
@end

@implementation _UIBarCustomizer

- (_UIBarCustomizer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarCustomizer;
  v5 = [(_UIBarCustomizer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[_UIBarCustomizer setInitialSourceFrame:](v6, "setInitialSourceFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [(_UIBarCustomizer *)v6 set_dropIndex:0x7FFFFFFFFFFFFFFFLL];
  }

  return v6;
}

- (void)beginWithSession:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  v59 = [v62 _mutableVisibleItems];
  v61 = [v62 _mutableAdditionalItems];
  [(_UIBarCustomizer *)self set_activeSession:v62];
  v60 = [(_UIBarCustomizer *)self delegate];
  v3 = [(_UIBarCustomizer *)self _activeSession];
  v63 = [v60 barCustomizer:self containerViewForSession:v3];

  id v4 = [v63 traitCollection];
  uint64_t v5 = [v4 layoutDirection];

  if (v5 == 1)
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v6 = v59;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v82 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v81 + 1) + 8 * i) setReverseItemsForRTL:1];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v81 objects:v87 count:16];
      }
      while (v7);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v10 = v61;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v78 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v77 + 1) + 8 * j) setReverseItemsForRTL:1];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v11);
    }
  }
  v14 = [(_UIBarCustomizer *)self containerView];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    v25 = [v60 barCustomizer:self parentTraitEnvironmentForSession:v62];
    v26 = [[_UIBarCustomizationContainerView alloc] initWithParentTraitEnvironment:v25];
    [v63 bounds];
    -[UIView setFrame:](v26, "setFrame:");
    objc_initWeak(&location, self);
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __37___UIBarCustomizer_beginWithSession___block_invoke;
    v74[3] = &unk_1E52EE830;
    objc_copyWeak(&v75, &location);
    [(_UIBarCustomizationContainerView *)v26 setTraitChangeHandler:v74];
    v27 = [UIView alloc];
    [(UIView *)v26 bounds];
    v28 = -[UIView initWithFrame:](v27, "initWithFrame:");
    [(UIView *)v28 setAutoresizingMask:18];
    v29 = +[UIColor _alertControllerDimmingViewColor];
    [(UIView *)v28 setBackgroundColor:v29];

    [(UIView *)v28 setAlpha:0.0];
    v30 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handleDimmingViewTap_];
    [(UIView *)v28 addGestureRecognizer:v30];

    [(UIView *)v26 addSubview:v28];
    [(_UIBarCustomizer *)self setDimmingView:v28];

    v31 = objc_opt_new();
    [v31 setShowsHorizontalScrollIndicator:0];
    [(UIView *)v26 addSubview:v31];
    [(_UIBarCustomizer *)self setVisibleItemScrollView:v31];

    v32 = [_UIBarCustomizationItemReservoirView alloc];
    v33 = (void *)[v61 mutableCopy];
    v34 = [(_UIBarCustomizationItemReservoirView *)v32 initWithItems:v33];

    [(UIView *)v34 setAlpha:0.0];
    [(_UIBarCustomizationItemReservoirView *)v34 setExpanded:0 animated:0];
    v35 = _UILocalizedString(@"BAR_CUSTOMIZATION_POPOVER_RESET", @"Reset button in bar customization popover.", @"Reset");
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __37___UIBarCustomizer_beginWithSession___block_invoke_2;
    v72[3] = &unk_1E52DDB60;
    objc_copyWeak(&v73, &location);
    v36 = +[UIAction actionWithTitle:v35 image:0 identifier:0 handler:v72];
    [(_UIBarCustomizationItemReservoirView *)v34 setResetAction:v36];

    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __37___UIBarCustomizer_beginWithSession___block_invoke_3;
    v70[3] = &unk_1E52DDB60;
    objc_copyWeak(&v71, &location);
    v37 = +[UIAction actionWithHandler:v70];
    [(_UIBarCustomizationItemReservoirView *)v34 setDoneAction:v37];

    v38 = [(_UIBarCustomizer *)self dimmingView];
    [(UIView *)v26 insertSubview:v34 above:v38];

    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);

    [(_UIBarCustomizer *)self setReservoir:v34];
    v39 = [[UIDragInteraction alloc] initWithDelegate:self];
    [(UIDragInteraction *)v39 setEnabled:0];
    [(_UIBarCustomizer *)self setDragInteraction:v39];

    v40 = [(_UIBarCustomizer *)self dragInteraction];
    [(UIView *)v26 addInteraction:v40];

    v41 = [[UIDropInteraction alloc] initWithDelegate:self];
    [(UIView *)v26 addInteraction:v41];

    v42 = [MEMORY[0x1E4F1CA48] array];
    int v43 = 3;
    do
    {
      v44 = objc_opt_new();
      v45 = +[UIColor tintColor];
      [v44 setBackgroundColor:v45];

      v46 = [(_UIBarCustomizer *)self visibleItemScrollView];
      [v46 addSubview:v44];

      [v42 addObject:v44];
      --v43;
    }
    while (v43);
    [(_UIBarCustomizer *)self setEllipsisDotViews:v42];

    [(_UIBarCustomizer *)self setContainerView:v26];
    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);
  }
  else
  {
    [v63 bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(_UIBarCustomizer *)self containerView];
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    v25 = (void *)[v61 mutableCopy];
    v26 = [(_UIBarCustomizer *)self reservoir];
    [(_UIBarCustomizationContainerView *)v26 setItems:v25];
  }

  v47 = [(_UIBarCustomizer *)self containerView];
  [v63 addSubview:v47];

  v48 = [(_UIBarCustomizer *)self visibleItemScrollView];
  objc_msgSend(v48, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  v49 = [MEMORY[0x1E4F1CA48] array];
  [(_UIBarCustomizer *)self set_visibleItems:v49];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v50 = v59;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v66 objects:v85 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v67 != v52) {
          objc_enumerationMutation(v50);
        }
        uint64_t v54 = *(void *)(*((void *)&v66 + 1) + 8 * k);
        v55 = objc_opt_new();
        v56 = [[_UIBarCustomizationChiclet alloc] initWithItem:v54];
        [(_UIBarCustomizationChiclet *)v56 sizeToFit];
        [v55 setChiclet:v56];
        v57 = [(_UIBarCustomizer *)self _visibleItems];
        [v57 addObject:v54];

        v58 = [(_UIBarCustomizer *)self visibleItemScrollView];
        [v58 addSubview:v55];
      }
      uint64_t v51 = [v50 countByEnumeratingWithState:&v66 objects:v85 count:16];
    }
    while (v51);
  }

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __37___UIBarCustomizer_beginWithSession___block_invoke_4;
  v65[3] = &unk_1E52D9F70;
  v65[4] = self;
  +[UIView performWithoutAnimation:v65];
  [(_UIBarCustomizer *)self _setActive:1];
}

- (void)end
{
}

- (void)invalidateLayout
{
  if ([(_UIBarCustomizer *)self isActive])
  {
    -[_UIBarCustomizer setInitialSourceFrame:](self, "setInitialSourceFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [(_UIBarCustomizer *)self _reflow];
    id v3 = [(_UIBarCustomizer *)self reservoir];
    [v3 invalidateLayoutAndForceUpdate:1];
  }
}

- (void)_handleDimmingViewTap:(id)a3
{
}

- (void)_setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIBarCustomizer *)self isActive] != a3)
  {
    self->_isActive = v3;
    uint64_t v5 = [(_UIBarCustomizer *)self dragInteraction];
    [v5 setEnabled:v3];

    id v6 = [(_UIBarCustomizer *)self containerView];
    [v6 setUserInteractionEnabled:v3];

    if (v3)
    {
      uint64_t v7 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      uint64_t v8 = [v7 vendKeyboardSuppressionAssertionForReason:@"bar customizer"];
      [(_UIBarCustomizer *)self setKeyboardSuppressionAssertion:v8];

      v9 = [(_UIBarCustomizer *)self _activeSession];
      id v10 = [v9 beginAnimationCoordinator];
    }
    else
    {
      [(_UIBarCustomizer *)self setKeyboardSuppressionAssertion:0];
      v9 = [(_UIBarCustomizer *)self _activeSession];
      id v10 = [v9 endAnimationCoordinator];
      uint64_t v11 = [(_UIBarCustomizer *)self dragInteraction];
      [v11 _cancelDrag];

      [(_UIBarCustomizer *)self set_activeSession:0];
      uint64_t v12 = [(_UIBarCustomizer *)self _visibleItems];
      objc_msgSend(v9, "set_mutableVisibleItems:", v12);

      v13 = [(_UIBarCustomizer *)self reservoir];
      v14 = [v13 items];
      objc_msgSend(v9, "set_mutableAdditionalItems:", v14);

      BOOL v15 = [(_UIBarCustomizer *)self delegate];
      objc_msgSend(v15, "barCustomizer:willEndSession:didReset:", self, v9, -[_UIBarCustomizer wasReset](self, "wasReset"));

      objc_initWeak(&location, self);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __31___UIBarCustomizer__setActive___block_invoke;
      v34[3] = &unk_1E52EE858;
      objc_copyWeak(&v35, &location);
      [v10 addCompletion:v34];
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    double v16 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.875 response:0.56];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __31___UIBarCustomizer__setActive___block_invoke_2;
    v29 = &unk_1E52DC3F8;
    v30 = self;
    LOBYTE(v33) = v3;
    id v31 = v9;
    id v32 = v10;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    double v22 = __31___UIBarCustomizer__setActive___block_invoke_3;
    double v23 = &unk_1E52DA9F8;
    id v24 = v32;
    id v25 = v31;
    id v17 = v31;
    id v18 = v32;
    +[UIView _animateUsingSpringBehavior:v16 tracking:0 animations:&v26 completion:&v20];

    if (!v3) {
      -[_UIBarCustomizer setInitialSourceFrame:](self, "setInitialSourceFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32,
    }
        v33);
    double v19 = [(_UIBarCustomizer *)self reservoir];
    [v19 setExpanded:v3 animated:1];
  }
}

- (void)_reflow
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  v140 = [(_UIBarCustomizer *)self containerView];
  v2 = [(_UIBarCustomizer *)self visibleItemScrollView];
  [(_UIBarCustomizer *)self initialSourceFrame];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  v138 = [(_UIBarCustomizer *)self _visibleItems];
  v177.origin.double x = x;
  v177.origin.double y = y;
  v177.size.double width = width;
  v177.size.double height = height;
  if (CGRectIsNull(v177))
  {
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = __27___UIBarCustomizer__reflow__block_invoke;
    v167[3] = &unk_1E52D9F98;
    id v11 = v2;
    id v168 = v11;
    v169 = self;
    +[UIView performWithoutAnimation:v167];
    long long v165 = 0u;
    long long v166 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    uint64_t v12 = [(_UIBarCustomizer *)self _activeSession];
    v13 = [v12 sourceItems];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v163 objects:v171 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v164;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v164 != v15) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v163 + 1) + 8 * i) _sourceFrameInContainer:v11];
          v193.origin.double x = v17;
          v193.origin.double y = v18;
          v193.size.double width = v19;
          v193.size.double height = v20;
          v178.origin.double x = x;
          v178.origin.double y = y;
          v178.size.double width = width;
          v178.size.double height = height;
          CGRect v179 = CGRectUnion(v178, v193);
          double x = v179.origin.x;
          double y = v179.origin.y;
          double width = v179.size.width;
          double height = v179.size.height;
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v163 objects:v171 count:16];
      }
      while (v14);
    }

    v180.origin.double x = x;
    v180.origin.double y = y;
    v180.size.double width = width;
    v180.size.double height = height;
    if (CGRectIsNull(v180))
    {
      [v140 bounds];
      double x = CGRectGetMidX(v181);
      double width = 0.0;
      double height = 100.0;
      double y = 0.0;
    }
    -[_UIBarCustomizer setInitialSourceFrame:](self, "setInitialSourceFrame:", x, y, width, height);
  }
  if ([(_UIBarCustomizer *)self isActive])
  {
    double v172 = 0.0;
    v173 = &v172;
    uint64_t v174 = 0x2020000000;
    uint64_t v175 = 0;
    uint64_t v21 = [v140 traitCollection];
    uint64_t v22 = [v21 layoutDirection];

    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __27___UIBarCustomizer__reflow__block_invoke_2;
    v161[3] = &unk_1E52EE880;
    if (v22 == 1) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 0;
    }
    BOOL v162 = v22 == 1;
    v161[4] = self;
    v161[5] = &v172;
    *(double *)&v161[6] = y + height * 0.5;
    [v138 enumerateObjectsWithOptions:v23 usingBlock:v161];
    double v24 = v173[3];
    [v2 frame];
    double v25 = CGRectGetWidth(v182);
    unint64_t v26 = [(_UIBarCustomizer *)self _dropIndex];
    uint64_t v27 = [v138 count];
    unint64_t v28 = 0;
    int v29 = 0;
    double v30 = -40.0;
    if (v22 == 1) {
      double v30 = 40.0;
    }
    if (v26 != v27) {
      double v30 = -0.0;
    }
    double v31 = (v25 - v24) * 0.5 + v30;
    while ([v138 count] > v28)
    {
      id v32 = [v138 objectAtIndexedSubscript:v28];
      uint64_t v33 = [v32 _chiclet];
      v34 = [v33 anchorView];

      id v35 = [v34 chiclet];
      LODWORD(v33) = [v35 minimized];

      if (v33)
      {
        double v36 = (double)(int)fmin((double)(v29 / [(_UIBarCustomizer *)self _overflowItemBucketSize]), 2.0)* 0.166666667+ 0.5;
        v37 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:v36];
        v159[0] = MEMORY[0x1E4F143A8];
        v159[1] = 3221225472;
        v159[2] = __27___UIBarCustomizer__reflow__block_invoke_3;
        v159[3] = &unk_1E52D9F70;
        id v38 = v34;
        id v160 = v38;
        +[UIView _animateUsingSpringBehavior:v37 tracking:0 animations:v159 completion:0];

        if (v31 > 0.0)
        {
          v39 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.82 response:v36];
          v156[0] = MEMORY[0x1E4F143A8];
          v156[1] = 3221225472;
          v156[2] = __27___UIBarCustomizer__reflow__block_invoke_4;
          v156[3] = &unk_1E52D9CD0;
          id v157 = v38;
          double v158 = v31;
          +[UIView _animateUsingSpringBehavior:v39 tracking:0 animations:v156 completion:0];
        }
        ++v29;
      }
      else if (v31 > 0.0)
      {
        [v34 center];
        double v41 = v40;
        [v34 center];
        [v34 setCenter:v31 + v41];
      }

      ++v28;
    }
    [v2 frame];
    objc_msgSend(v2, "setContentSize:", v24, CGRectGetHeight(v189));
    _Block_object_dispose(&v172, 8);
  }
  else
  {
    objc_msgSend(v2, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v42 = [(_UIBarCustomizer *)self delegate];
    int v43 = [(_UIBarCustomizer *)self _activeSession];
    [v42 barCustomizer:self overflowControlBoundsForSession:v43];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;

    objc_msgSend(v140, "convertRect:toView:", v2, v45, v47, v49, v51);
    double v133 = v52;
    double v134 = v53;
    double v131 = v54;
    double v132 = v55;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id v56 = v138;
    int v57 = 0;
    uint64_t v58 = [v56 countByEnumeratingWithState:&v152 objects:v170 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v153;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v153 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = [*(id *)(*((void *)&v152 + 1) + 8 * j) _chiclet];
          id v62 = [v61 anchorView];

          v63 = [v62 chiclet];
          v64 = [v63 representedItem];
          [v64 _sourceFrameInContainer:v140];
          double v66 = v65;
          double v68 = v67;
          double v45 = v69;
          double v71 = v70;

          v183.origin.double x = v66;
          v183.origin.double y = v68;
          v183.size.double width = v45;
          v183.size.double height = v71;
          if (CGRectIsEmpty(v183))
          {
            if ([(_UIBarCustomizer *)self wasReset])
            {
              [v62 setAlpha:0.0];
              CGAffineTransformMakeScale(&v151, 0.1, 0.1);
              CGAffineTransform v150 = v151;
              [v62 setTransform:&v150];
            }
            else
            {
              ++v57;
            }
          }
          else
          {
            [v2 frame];
            double MinX = CGRectGetMinX(v184);
            [v2 frame];
            objc_msgSend(v62, "setCenter:", v45 * 0.5 + v66 - MinX, v71 * 0.5 + v68 - CGRectGetMinY(v185));
            [v62 frame];
            CGRectGetMaxX(v186);
          }
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v152 objects:v170 count:16];
      }
      while (v58);
    }

    int64_t v137 = v57;
    -[_UIBarCustomizer setOverflowItemCount:](self, "setOverflowItemCount:");
    int v73 = [v56 count];
    int v135 = [(_UIBarCustomizer *)self _overflowItemBucketSize];
    v74 = [(_UIBarCustomizer *)self containerView];
    id v75 = [v74 traitCollection];

    id v136 = v75;
    v76 = +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:");
    long long v77 = [v76 configurationWithTraitCollection:v136];
    long long v78 = +[UIImage systemImageNamed:@"ellipsis.circle" withConfiguration:v77];
    long long v79 = [v78 _outlinePath];

    id v80 = v79;
    CFArrayRef SeparateComponents = CGPathCreateSeparateComponents((CGPathRef)[v80 CGPath], 0);
    CFIndex Count = CFArrayGetCount(SeparateComponents);
    if (Count >= 1)
    {
      CFIndex v83 = 0;
      long long v84 = (double *)&v173;
      do
      {
        ValueAtIndedouble x = (const CGPath *)CFArrayGetValueAtIndex(SeparateComponents, v83);
        PathBoundingBodouble x = CGPathGetPathBoundingBox(ValueAtIndex);
        double v86 = PathBoundingBox.origin.x;
        double v87 = PathBoundingBox.origin.y;
        double v88 = PathBoundingBox.size.width;
        double v89 = PathBoundingBox.size.height;
        double v90 = CGRectGetWidth(PathBoundingBox);
        [v80 bounds];
        if (v90 < CGRectGetWidth(v188) * 0.5)
        {
          *(v84 - 1) = v86 + v88 * 0.5;
          *long long v84 = v87 + v89 * 0.5;
        }
        ++v83;
        v84 += 2;
      }
      while (Count != v83);
      double v45 = *(double *)&v174 - v172;
    }

    double v91 = fabs(v45);
    unint64_t v92 = v73 - v57;
    if ([v56 count] > v92)
    {
      uint64_t v93 = 0;
      do
      {
        v94 = [v56 objectAtIndexedSubscript:v92 + v93];
        v95 = [v94 _chiclet];
        v96 = [v95 anchorView];

        uint64_t v97 = [v136 layoutDirection];
        int v98 = (int)fmin((double)((int)v93 / v135), 2.0);
        int v99 = v98 - 1;
        if (v97) {
          double v100 = -(v91 * (double)v99);
        }
        else {
          double v100 = v91 * (double)v99;
        }
        v101 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.88 response:(double)v98 * -0.186666667 + 0.56];
        v146[0] = MEMORY[0x1E4F143A8];
        v146[1] = 3221225472;
        v146[2] = __27___UIBarCustomizer__reflow__block_invoke_5;
        v146[3] = &unk_1E52DD178;
        id v147 = v96;
        double v148 = v133 + v131 * 0.5 + v100;
        double v149 = v134 + v132 * 0.5;
        id v102 = v96;
        +[UIView _animateUsingSpringBehavior:v101 tracking:0 animations:v146 completion:0];

        ++v93;
      }
      while ([v56 count] > v92 + v93);
    }
    id v103 = v136;
    v104 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
    v105 = [v104 configurationWithTraitCollection:v103];
    v106 = +[UIImage systemImageNamed:@"ellipsis.circle" withConfiguration:v105];
    v107 = [v106 _outlinePath];

    id v108 = v107;
    CFArrayRef v109 = CGPathCreateSeparateComponents((CGPathRef)[v108 CGPath], 0);
    CFIndex v110 = CFArrayGetCount(v109);
    CGFloat v111 = 0.0;
    if (v110 >= 1)
    {
      CFIndex v112 = 0;
      while (1)
      {
        v113 = (const CGPath *)CFArrayGetValueAtIndex(v109, v112);
        CGRect v190 = CGPathGetPathBoundingBox(v113);
        CGFloat v114 = v190.origin.x;
        CGFloat v115 = v190.origin.y;
        CGFloat v116 = v190.size.width;
        CGFloat v117 = v190.size.height;
        double v118 = CGRectGetWidth(v190);
        [v108 bounds];
        if (v118 < CGRectGetWidth(v191) * 0.5) {
          break;
        }
        if (v110 == ++v112) {
          goto LABEL_60;
        }
      }
      v192.origin.double x = v114;
      v192.origin.double y = v115;
      v192.size.double width = v116;
      v192.size.double height = v117;
      CGFloat v111 = CGRectGetWidth(v192);
    }
LABEL_60:

    v119 = [(_UIBarCustomizer *)self ellipsisDotViews];
    BOOL v120 = [v119 count] == 0;

    if (!v120)
    {
      unint64_t v121 = 0;
      uint64_t v122 = MEMORY[0x1E4F143A8];
      do
      {
        v123 = [(_UIBarCustomizer *)self ellipsisDotViews];
        v124 = [v123 objectAtIndexedSubscript:v121];

        uint64_t v125 = [v103 layoutDirection];
        double v126 = -(v91 * (double)((int)v121 - 1));
        if (!v125) {
          double v126 = v91 * (double)((int)v121 - 1);
        }
        double v127 = v133 + v131 * 0.5 + v126;
        v141[0] = v122;
        v141[1] = 3221225472;
        v141[2] = __27___UIBarCustomizer__reflow__block_invoke_6;
        v141[3] = &unk_1E52DA260;
        id v128 = v124;
        id v142 = v128;
        CGFloat v143 = v111;
        double v144 = v127;
        double v145 = v134 + v132 * 0.5;
        +[UIView performWithoutAnimation:v141];
        if ((uint64_t)v121 >= v137) {
          [v128 setAlpha:1.0];
        }

        v129 = [(_UIBarCustomizer *)self ellipsisDotViews];
        unint64_t v130 = [v129 count];

        ++v121;
      }
      while (v130 > v121);
    }
  }
}

- (void)_reflowAnimatedWithAlongsideActions:(id)a3
{
  id v4 = a3;
  double v5 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___UIBarCustomizer__reflowAnimatedWithAlongsideActions___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[UIView _animateUsingSpringBehavior:v5 tracking:0 animations:v7 completion:0];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIBarCustomizer *)self containerView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  id v11 = -[_UIBarCustomizer _dragItemsAtLocation:](self, "_dragItemsAtLocation:", v8, v10);

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (id)_dragItemsAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(_UIBarCustomizer *)self containerView];
  id v6 = objc_msgSend(v5, "hitTest:withEvent:", 0, x, y);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    double v8 = [[UIDragItem alloc] initWithItemProvider:v7];
    [(UIDragItem *)v8 setLocalObject:v6];
    v11[0] = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_msgSend(a4, "items", a3);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v9 = [v8 _chiclet];
        double v10 = [v9 anchorView];

        [v10 setState:1];
        id v11 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.3];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __53___UIBarCustomizer_dragInteraction_sessionWillBegin___block_invoke;
        v13[3] = &unk_1E52D9F70;
        v13[4] = v8;
        +[UIView _animateUsingSpringBehavior:v11 tracking:0 animations:v13 completion:0];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  if (!a5) {
    -[_UIBarCustomizer set_dropIndex:](self, "set_dropIndex:", 0x7FFFFFFFFFFFFFFFLL, a4);
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) _chiclet];
        uint64_t v12 = [v11 anchorView];

        [v12 setState:1];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v5 = a4;
  id v6 = objc_opt_new();
  [v6 _setPreviewMode:3];
  [v6 setHidesSourceViewDuringDropAnimation:1];
  uint64_t v7 = [v5 _chiclet];
  uint64_t v8 = [v7 superview];
  uint64_t v9 = [v5 _chiclet];
  [v8 bringSubviewToFront:v9];

  uint64_t v10 = [UITargetedDragPreview alloc];
  id v11 = [v5 _chiclet];

  uint64_t v12 = [(UITargetedPreview *)v10 initWithView:v11 parameters:v6];
  return v12;
}

- (double)_dragInteraction:(id)a3 delayForLiftBeginningAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [a3 view];
  uint64_t v8 = [(_UIBarCustomizer *)self containerView];
  objc_msgSend(v7, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  long long v13 = [(_UIBarCustomizer *)self containerView];
  long long v14 = objc_msgSend(v13, "hitTest:withEvent:", 0, v10, v12);

  long long v15 = [v14 _containingScrollView];
  long long v16 = v15;
  double v17 = 0.0;
  if (v15)
  {
    [v15 contentSize];
    double v19 = v18;
    [v16 frame];
    if (v19 > CGRectGetWidth(v23)
      || ([v16 contentSize], double v21 = v20, objc_msgSend(v16, "frame"), v21 > CGRectGetHeight(v24)))
    {
      double v17 = 0.15;
    }
  }

  return v17;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [a4 _chiclet];
  if ([(_UIBarCustomizer *)self isActive]
    || ([(_UIBarCustomizer *)self _visibleItems],
        double v9 = objc_claimAutoreleasedReturnValue(),
        [v8 representedItem],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v9 containsObject:v10],
        v10,
        v9,
        v11))
  {
    double v12 = [UIDragPreviewTarget alloc];
    long long v13 = [v8 superview];
    [v8 center];
    long long v14 = -[UIPreviewTarget initWithContainer:center:](v12, "initWithContainer:center:", v13);

    long long v15 = [v7 retargetedPreviewWithTarget:v14];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(a4, "items", a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) localObject];
        objc_opt_class();
        v8 &= objc_opt_isKindOfClass();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8 & 1;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(_UIBarCustomizer *)self _visibleItems];
  uint64_t v7 = [(_UIBarCustomizer *)self containerView];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;
  -[_UIBarCustomizer setLastDragLocation:](self, "setLastDragLocation:");
  [v7 bounds];
  v44.size.double width = CGRectGetWidth(v43);
  v44.size.double height = 150.0;
  v44.origin.double x = 0.0;
  v44.origin.double y = 0.0;
  v42.double x = v9;
  v42.double y = v11;
  if (CGRectContainsPoint(v44, v42))
  {
    id v33 = v5;
    double v31 = self;
    long long v12 = [(_UIBarCustomizer *)self visibleItemScrollView];
    objc_msgSend(v7, "convertPoint:toView:", v12, v9, v11);
    double v14 = v13;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v6;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v36;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v21 = v17 + v18;
        do
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = [*(id *)(*((void *)&v35 + 1) + 8 * v20) _chiclet];
          CGRect v23 = [v22 anchorView];

          if ([v23 state] != 1)
          {
            CGRect v24 = [v23 chiclet];
            char v25 = [v24 fixed];

            if ((v25 & 1) == 0)
            {
              unint64_t v26 = [v7 traitCollection];
              uint64_t v27 = [v26 layoutDirection];

              [v23 frame];
              double MidX = CGRectGetMidX(v45);
              if (v27)
              {
                if (v14 >= MidX) {
                  goto LABEL_17;
                }
              }
              else if (v14 <= MidX)
              {
LABEL_17:

                uint64_t v21 = v18 + v20;
                goto LABEL_19;
              }
            }
          }

          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
        uint64_t v18 = v21;
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
LABEL_19:

    uint64_t v6 = v32;
    id v5 = v33;
    self = v31;
  }
  else
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(_UIBarCustomizer *)self set_dropIndex:v21];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __53___UIBarCustomizer_dropInteraction_sessionDidUpdate___block_invoke;
  v34[3] = &unk_1E52D9F70;
  void v34[4] = self;
  [(_UIBarCustomizer *)self _reflowAnimatedWithAlongsideActions:v34];
  int v29 = [[UIDropProposal alloc] initWithDropOperation:3];

  return v29;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v47 = [(_UIBarCustomizer *)self _dropIndex];
  [(_UIBarCustomizer *)self set_dropIndex:0x7FFFFFFFFFFFFFFFLL];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  CGRect v44 = v5;
  obuint64_t j = [v5 items];
  uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v50;
    unint64_t v6 = v47;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v50 != v46) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        double v9 = [v8 _chiclet];
        double v10 = [v9 representedItem];
        double v11 = v10;
        if (v47 == 0x7FFFFFFFFFFFFFFFLL && ([v10 removable] & 1) != 0)
        {
          long long v12 = [(_UIBarCustomizer *)self _visibleItems];
          int v13 = [v12 containsObject:v11];

          if (v13)
          {
            double v14 = [(_UIBarCustomizer *)self reservoir];
            [v14 addItem:v11];

            id v15 = [(_UIBarCustomizer *)self _visibleItems];
            [v15 removeObject:v11];

            uint64_t v16 = [v9 anchorView];
            [v16 removeFromSuperview];

            [v9 setAnchorView:0];
          }
        }
        else
        {
          uint64_t v17 = [v8 _chiclet];
          uint64_t v18 = [v17 anchorView];

          if (!v18)
          {
            uint64_t v18 = objc_opt_new();
            uint64_t v19 = [(_UIBarCustomizer *)self visibleItemScrollView];
            [v19 addSubview:v18];

            uint64_t v20 = [v8 _chiclet];
            [v18 setChiclet:v20];

            [v18 layoutIfNeeded];
            uint64_t v21 = [(_UIBarCustomizer *)self _visibleItems];
            uint64_t v22 = [v21 count];

            if (v22)
            {
              CGRect v23 = [(_UIBarCustomizer *)self _visibleItems];
              CGRect v24 = v23;
              if (v6 == v22)
              {
                char v25 = [v23 objectAtIndexedSubscript:v6 - 1];
                unint64_t v26 = [v25 _chiclet];
                uint64_t v27 = [v26 anchorView];

                [v27 frame];
                double v28 = CGRectGetMaxX(v55) + 20.0;
              }
              else
              {
                int v29 = [v23 objectAtIndexedSubscript:v6];
                double v30 = [v29 _chiclet];
                uint64_t v27 = [v30 anchorView];

                [v27 frame];
                double v28 = CGRectGetMinX(v56) + -20.0;
              }
              [v27 center];
              double v32 = v31;

              objc_msgSend(v18, "setCenter:", v28, v32);
            }
          }
          id v33 = [(_UIBarCustomizer *)self _visibleItems];
          unint64_t v34 = [v33 indexOfObject:v11];

          uint64_t v36 = v34 != 0x7FFFFFFFFFFFFFFFLL && v6 > v34;
          v6 -= v36;
          long long v37 = [(_UIBarCustomizer *)self _visibleItems];
          [v37 removeObject:v11];

          long long v38 = [(_UIBarCustomizer *)self reservoir];
          [v38 removeItem:v11];

          v39 = [(_UIBarCustomizer *)self _visibleItems];
          uint64_t v40 = [(_UIBarCustomizer *)self _visibleItems];
          unint64_t v41 = [v40 count];

          if (v6 >= v41) {
            unint64_t v42 = v41;
          }
          else {
            unint64_t v42 = v6;
          }
          [v39 insertObject:v11 atIndex:v42];

          CGRect v43 = [v18 superview];
          [v43 bringSubviewToFront:v18];
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v48);
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  double v8 = [UIDragPreviewTarget alloc];
  double v9 = [v7 _chiclet];
  double v10 = [v9 superview];
  double v11 = [v7 _chiclet];

  [v11 center];
  long long v12 = -[UIPreviewTarget initWithContainer:center:](v8, "initWithContainer:center:", v10);

  int v13 = [v6 retargetedPreviewWithTarget:v12];

  return v13;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
}

- (void)_animateDropOrCancelForItem:(id)a3 animator:(id)a4 isCancel:(BOOL)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v34 = v8;
  double v10 = [v8 _chiclet];
  double v11 = [v10 anchorView];
  [v11 setState:0];
  id v12 = 0;
  if (!a5)
  {
    int v13 = objc_opt_new();
    [(_UIBarCustomizer *)self lastDragLocation];
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [v10 superview];
    [v10 center];
    double v20 = v19;
    double v22 = v21;
    CGRect v23 = [(_UIBarCustomizer *)self containerView];
    objc_msgSend(v18, "convertPoint:toView:", v23, v20, v22);
    [v13 setValue:sqrt((v24 - v15) * (v24 - v15) + (v25 - v17) * (v25 - v17))];

    v47[0] = v13;
    unint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke;
    v44[3] = &unk_1E52D9F98;
    id v45 = v11;
    id v12 = v13;
    id v46 = v12;
    +[UIView _createTransformerWithInputAnimatableProperties:v26 presentationValueChangedCallback:v44];
  }
  uint64_t v27 = [v10 representedItem];
  double v28 = [(_UIBarCustomizer *)self _visibleItems];
  char v29 = [v28 containsObject:v27];

  double v30 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.3];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_2;
  v40[3] = &unk_1E52DC3D0;
  id v31 = v27;
  id v41 = v31;
  char v43 = v29;
  id v32 = v10;
  id v42 = v32;
  +[UIView _animateUsingSpringBehavior:v30 tracking:0 animations:v40 completion:0];

  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_3;
  v35[3] = &unk_1E52EAD18;
  objc_copyWeak(&v37, &location);
  BOOL v38 = a5;
  id v33 = v12;
  id v36 = v33;
  [v9 addAnimations:v35];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (int)_overflowItemBucketSize
{
  int v2 = (int)((double)[(_UIBarCustomizer *)self overflowItemCount] / 3.0);
  if (v2 <= 1) {
    return 1;
  }
  else {
    return v2;
  }
}

- (void)_updateDebugUI
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v4 = _UIInternalPreference_BarCustomizationDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_BarCustomizationDebugEnabled)
    {
      while (v3 >= v4)
      {
        _UIInternalPreferenceSync(v3, &_UIInternalPreference_BarCustomizationDebugEnabled, @"BarCustomizationDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v4 = _UIInternalPreference_BarCustomizationDebugEnabled;
        if (v3 == _UIInternalPreference_BarCustomizationDebugEnabled) {
          return;
        }
      }
      if (byte_1E8FD4F84)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __34___UIBarCustomizer__updateDebugUI__block_invoke;
        block[3] = &unk_1E52D9F70;
        block[4] = self;
        if (_MergedGlobals_1050 != -1) {
          dispatch_once(&_MergedGlobals_1050, block);
        }
        if (!qword_1EB260790)
        {
          uint64_t v5 = objc_opt_new();
          id v6 = (void *)qword_1EB260790;
          qword_1EB260790 = v5;

          id v7 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.2];
          [(id)qword_1EB260790 setBackgroundColor:v7];

          id v8 = [(_UIBarCustomizer *)self visibleItemScrollView];
          [v8 addSubview:qword_1EB260790];
        }
        unint64_t v9 = [(_UIBarCustomizer *)self _dropIndex];
        double v10 = 0.0;
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v11 = [(_UIBarCustomizer *)self _visibleItems];
          uint64_t v15 = MEMORY[0x1E4F143A8];
          uint64_t v16 = 3221225472;
          double v17 = __34___UIBarCustomizer__updateDebugUI__block_invoke_2;
          uint64_t v18 = &unk_1E52DA070;
          double v19 = self;
          id v12 = v11;
          id v20 = v12;
          uint64_t v21 = 0x4044000000000000;
          int v13 = (void (**)(void))_Block_copy(&v15);
          objc_msgSend((id)qword_1EB260790, "frame", v15, v16, v17, v18, v19);
          if (fabs(v14) >= 2.22044605e-16) {
            v13[2](v13);
          }
          else {
            +[UIView performWithoutAnimation:v13];
          }

          double v10 = 40.0;
        }
        objc_msgSend((id)qword_1EB260790, "setBounds:", 0.0, 0.0, v10, 100.0);
      }
    }
  }
}

- (_UIBarCustomizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIBarCustomizerDelegate *)WeakRetained;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSMutableArray)_visibleItems
{
  return self->__visibleItems;
}

- (void)set_visibleItems:(id)a3
{
}

- (_UIBarCustomizationSession)_activeSession
{
  return self->__activeSession;
}

- (void)set_activeSession:(id)a3
{
}

- (id)keyboardSuppressionAssertion
{
  return self->_keyboardSuppressionAssertion;
}

- (void)setKeyboardSuppressionAssertion:(id)a3
{
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
}

- (_UIBarCustomizationContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (UIScrollView)visibleItemScrollView
{
  return self->_visibleItemScrollView;
}

- (void)setVisibleItemScrollView:(id)a3
{
}

- (_UIBarCustomizationItemReservoirView)reservoir
{
  return self->_reservoir;
}

- (void)setReservoir:(id)a3
{
}

- (unint64_t)_dropIndex
{
  return self->__dropIndex;
}

- (void)set_dropIndex:(unint64_t)a3
{
  self->__dropIndedouble x = a3;
}

- (CGRect)initialSourceFrame
{
  double x = self->_initialSourceFrame.origin.x;
  double y = self->_initialSourceFrame.origin.y;
  double width = self->_initialSourceFrame.size.width;
  double height = self->_initialSourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialSourceFrame:(CGRect)a3
{
  self->_initialSourceFrame = a3;
}

- (CGPoint)lastDragLocation
{
  double x = self->_lastDragLocation.x;
  double y = self->_lastDragLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastDragLocation:(CGPoint)a3
{
  self->_lastDragLocation = a3;
}

- (BOOL)wasReset
{
  return self->_wasReset;
}

- (void)setWasReset:(BOOL)a3
{
  self->_wasReset = a3;
}

- (NSMutableArray)ellipsisDotViews
{
  return self->_ellipsisDotViews;
}

- (void)setEllipsisDotViews:(id)a3
{
}

- (unint64_t)overflowItemCount
{
  return self->_overflowItemCount;
}

- (void)setOverflowItemCount:(unint64_t)a3
{
  self->_overflowItemCFIndex Count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ellipsisDotViews, 0);
  objc_storeStrong((id *)&self->_reservoir, 0);
  objc_storeStrong((id *)&self->_visibleItemScrollView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong(&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->__activeSession, 0);
  objc_storeStrong((id *)&self->__visibleItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end