@interface _UIContextMenuCommitAnimation
- (UIView)container;
- (UIView)destination;
- (UIView)destinationTransformView;
- (UIView)morphContainer;
- (UIView)originalContentSnapshotView;
- (UIView)source;
- (UIView)sourceSnapshotView;
- (UIView)sourceTransformView;
- (_UIContextMenuCommitAnimation)initWithSource:(id)a3 container:(id)a4;
- (_UIContextMenuCommitContainerView)animationContainer;
- (_UIPortalView)destinationContentPortalView;
- (double)destinationRadius;
- (double)sourceRadius;
- (unint64_t)animationCount;
- (void)_prepareAnimationViews;
- (void)_prepareSnapshots;
- (void)animateWithAlongsideActions:(id)a3 completion:(id)a4;
- (void)setAnimationContainer:(id)a3;
- (void)setAnimationCount:(unint64_t)a3;
- (void)setContainer:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationContentPortalView:(id)a3;
- (void)setDestinationRadius:(double)a3;
- (void)setDestinationTransformView:(id)a3;
- (void)setMorphContainer:(id)a3;
- (void)setOriginalContentSnapshotView:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceRadius:(double)a3;
- (void)setSourceSnapshotView:(id)a3;
- (void)setSourceTransformView:(id)a3;
@end

@implementation _UIContextMenuCommitAnimation

- (_UIContextMenuCommitAnimation)initWithSource:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIContextMenuCommitAnimation;
  v8 = [(_UIContextMenuCommitAnimation *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(_UIContextMenuCommitAnimation *)v8 setSource:v6];
    [(_UIContextMenuCommitAnimation *)v9 setContainer:v7];
    [(_UIContextMenuCommitAnimation *)v9 setSourceRadius:13.0];
    v10 = [(_UIContextMenuCommitAnimation *)v9 container];
    v11 = [v10 traitCollection];
    [v11 displayCornerRadius];
    -[_UIContextMenuCommitAnimation setDestinationRadius:](v9, "setDestinationRadius:");
  }
  return v9;
}

- (void)animateWithAlongsideActions:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke;
  aBlock[3] = &unk_1E52E45A0;
  aBlock[4] = self;
  id v8 = v7;
  id v43 = v8;
  v9 = _Block_copy(aBlock);
  v10 = [(_UIContextMenuCommitAnimation *)self container];
  v11 = [v10 traitCollection];
  v12 = _UIContextMenuGetPlatformMetrics([v11 userInterfaceIdiom]);

  objc_super v13 = [_UIClickPresentationFeedbackGenerator alloc];
  v14 = [v12 presentationFeedbackConfiguration];
  v15 = [(_UIContextMenuCommitAnimation *)self container];
  v16 = [(_UIClickPresentationFeedbackGenerator *)v13 initWithConfiguration:v14 view:v15];

  [(_UIClickPresentationFeedbackGenerator *)v16 userInteractionStarted];
  -[_UIClickPresentationFeedbackGenerator poppedAtLocation:](v16, "poppedAtLocation:", 1.79769313e308, 1.79769313e308);
  [(_UIClickPresentationFeedbackGenerator *)v16 userInteractionEnded];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_9;
  v41[3] = &unk_1E52D9F70;
  v41[4] = self;
  +[UIView performWithoutAnimation:v41];
  if (v6)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_2;
    v39[3] = &unk_1E52DA040;
    id v40 = v6;
    +[UIViewController _performWithoutDeferringTransitions:v39];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v17 = [(_UIContextMenuCommitAnimation *)self container];
  v18 = [v17 _window];
  v19 = [v18 subviews];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (!v20)
  {

LABEL_17:
    v28 = [(_UIContextMenuCommitAnimation *)self container];
    [(_UIContextMenuCommitAnimation *)self setDestination:v28];

    v22 = 0;
    goto LABEL_18;
  }
  uint64_t v21 = v20;
  v29 = v9;
  id v30 = v8;
  id v31 = v6;
  v22 = 0;
  uint64_t v23 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v36 != v23) {
        objc_enumerationMutation(v19);
      }
      v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v25 isHidden] & 1) == 0)
      {
        [v25 alpha];
        if (v26 >= 2.22044605e-16)
        {
          id v27 = v25;

          v22 = v27;
        }
      }
    }
    uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
  }
  while (v21);

  id v6 = v31;
  v9 = v29;
  if (!v22) {
    goto LABEL_17;
  }
  [(_UIContextMenuCommitAnimation *)self setDestination:v22];
LABEL_18:
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_3;
  v34[3] = &unk_1E52D9F70;
  v34[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v34, v29, v30, v31);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_4;
  v33[3] = &unk_1E52D9F70;
  v33[4] = self;
  +[UIView animateWithDuration:2 delay:v33 usingSpringWithDamping:v9 initialSpringVelocity:0.5 options:0.0 animations:0.7 completion:15.0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_5;
  v32[3] = &unk_1E52D9CD0;
  v32[4] = self;
  v32[5] = 2;
  +[UIView animateWithDuration:2 delay:v32 usingSpringWithDamping:v9 initialSpringVelocity:0.35 options:0.0 animations:1.0 completion:0.0];
}

- (void)_prepareSnapshots
{
  v3 = [(_UIContextMenuCommitAnimation *)self container];
  v4 = [(_UIContextMenuCommitAnimation *)self container];
  [v4 bounds];
  v9 = _UISnapshotScreenAtViewRectAfterCommit(v3, 0, v5, v6, v7, v8);

  v10 = [(_UIContextMenuCommitAnimation *)self container];
  [v10 bounds];
  objc_msgSend(v9, "setFrame:");

  [(_UIContextMenuCommitAnimation *)self setOriginalContentSnapshotView:v9];
  v11 = [(_UIContextMenuCommitAnimation *)self source];
  v12 = [v11 layer];
  objc_super v13 = [v12 presentationLayer];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v22 = [(_UIContextMenuCommitAnimation *)self source];
  uint64_t v23 = [v22 superview];
  v24 = [(_UIContextMenuCommitAnimation *)self container];
  objc_msgSend(v23, "convertRect:toView:", v24, v15, v17, v19, v21);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  v33 = [(_UIContextMenuCommitAnimation *)self container];
  _UISnapshotScreenAtViewRectAfterCommit(v33, 0, v26, v28, v30, v32);
  id v34 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setFrame:", 0.0, 0.0, v30, v32);
  [(_UIContextMenuCommitAnimation *)self sourceRadius];
  objc_msgSend(v34, "_setContinuousCornerRadius:");
  [v34 setClipsToBounds:1];
  [(_UIContextMenuCommitAnimation *)self setSourceSnapshotView:v34];
}

- (void)_prepareAnimationViews
{
  v3 = [_UIContextMenuCommitContainerView alloc];
  v4 = [(_UIContextMenuCommitAnimation *)self container];
  [v4 bounds];
  double v5 = -[UIView initWithFrame:](v3, "initWithFrame:");

  double v6 = [(_UIContextMenuCommitAnimation *)self originalContentSnapshotView];
  [(UIView *)v5 addSubview:v6];

  double v7 = [(_UIContextMenuCommitAnimation *)self container];
  double v8 = [v7 _window];
  [v8 addSubview:v5];

  [(_UIContextMenuCommitAnimation *)self setAnimationContainer:v5];
  v9 = [(_UIContextMenuCommitAnimation *)self source];
  v10 = [v9 layer];
  v11 = [v10 presentationLayer];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, v15, v17, v19);
  [(UIView *)v20 setClipsToBounds:1];
  [(_UIContextMenuCommitAnimation *)self sourceRadius];
  -[UIView _setContinuousCornerRadius:](v20, "_setContinuousCornerRadius:");
  double v21 = [(_UIContextMenuCommitAnimation *)self animationContainer];
  [v21 addSubview:v20];

  [(_UIContextMenuCommitAnimation *)self setMorphContainer:v20];
  v22 = [_UIPortalView alloc];
  uint64_t v23 = [(_UIContextMenuCommitAnimation *)self destination];
  [v23 bounds];
  v24 = -[_UIPortalView initWithFrame:](v22, "initWithFrame:");

  double v25 = [(_UIContextMenuCommitAnimation *)self destination];
  [(_UIPortalView *)v24 setSourceView:v25];

  [(_UIPortalView *)v24 setAllowsBackdropGroups:1];
  [(_UIPortalView *)v24 setAllowsHitTesting:1];
  [(_UIContextMenuCommitAnimation *)self setDestinationContentPortalView:v24];
  double v26 = [UIView alloc];
  [(UIView *)v24 bounds];
  double v27 = -[UIView initWithFrame:](v26, "initWithFrame:");
  [(UIView *)v27 addSubview:v24];
  double v28 = [(_UIContextMenuCommitAnimation *)self morphContainer];
  [v28 addSubview:v27];

  double v29 = [(_UIContextMenuCommitAnimation *)self morphContainer];
  [v29 bounds];
  double v31 = v30;
  double v33 = v32;
  CGFloat v35 = v34;
  rect.origin.x = v34;
  double v37 = v36;

  [(UIView *)v27 bounds];
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  v81.origin.x = v31;
  v81.origin.y = v33;
  v81.size.width = v35;
  v81.size.height = v37;
  double Width = CGRectGetWidth(v81);
  v82.origin.x = v39;
  v82.origin.y = v41;
  v82.size.width = v43;
  v82.size.height = v45;
  CGFloat v47 = Width / CGRectGetWidth(v82);
  v83.origin.x = v31;
  v83.origin.y = v33;
  v83.size.width = rect.origin.x;
  v83.size.height = v37;
  CGRectGetHeight(v83);
  v84.origin.x = v39;
  v84.origin.y = v41;
  v84.size.width = v43;
  v84.size.height = v45;
  CGRectGetHeight(v84);
  CGAffineTransformMakeScale(&v80, v47, v47);
  CGAffineTransform v79 = v80;
  [(UIView *)v27 setTransform:&v79];
  -[UIView setCenter:](v27, "setCenter:", v31 + rect.origin.x * 0.5, v33 + v37 * 0.5);

  [(_UIContextMenuCommitAnimation *)self setDestinationTransformView:v27];
  v48 = [UIView alloc];
  v49 = [(_UIContextMenuCommitAnimation *)self sourceSnapshotView];
  [v49 bounds];
  v50 = -[UIView initWithFrame:](v48, "initWithFrame:");

  v51 = [(_UIContextMenuCommitAnimation *)self sourceSnapshotView];
  [(UIView *)v50 addSubview:v51];

  v52 = [(_UIContextMenuCommitAnimation *)self morphContainer];
  [v52 addSubview:v50];

  v53 = [(_UIContextMenuCommitAnimation *)self morphContainer];
  [v53 bounds];
  double v55 = v54;
  CGFloat v57 = v56;
  double v59 = v58;
  double v61 = v60;

  [(UIView *)v50 bounds];
  CGFloat v63 = v62;
  CGFloat v74 = v64;
  rect.origin.x = v62;
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  v85.origin.x = v55;
  v85.origin.y = v57;
  CGFloat v69 = v57;
  rect.origin.y = v57;
  v85.size.width = v59;
  v85.size.height = v61;
  double v70 = CGRectGetWidth(v85);
  v86.origin.x = v63;
  v86.origin.y = v66;
  v86.size.width = v68;
  v86.size.height = v74;
  CGFloat v71 = v70 / CGRectGetWidth(v86);
  v87.origin.x = v55;
  v87.origin.y = v69;
  v87.size.width = v59;
  v87.size.height = v61;
  double Height = CGRectGetHeight(v87);
  v88.origin.x = rect.origin.x;
  v88.origin.y = v66;
  v88.size.width = v68;
  v88.size.height = v74;
  CGFloat v73 = CGRectGetHeight(v88);
  CGAffineTransformMakeScale(&v78, v71, Height / v73);
  rect.size = *(CGSize *)&v78.a;
  long long v76 = *(_OWORD *)&v78.c;
  long long v77 = *(_OWORD *)&v78.tx;
  [(UIView *)v50 setTransform:&rect.size];
  -[UIView setCenter:](v50, "setCenter:", v55 + v59 * 0.5, rect.origin.y + v61 * 0.5);
  [(_UIContextMenuCommitAnimation *)self setSourceTransformView:v50];
}

- (double)sourceRadius
{
  return self->_sourceRadius;
}

- (void)setSourceRadius:(double)a3
{
  self->_sourceRadius = a3;
}

- (double)destinationRadius
{
  return self->_destinationRadius;
}

- (void)setDestinationRadius:(double)a3
{
  self->_destinationRadius = a3;
}

- (UIView)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (UIView)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (UIView)morphContainer
{
  return self->_morphContainer;
}

- (void)setMorphContainer:(id)a3
{
}

- (UIView)sourceSnapshotView
{
  return self->_sourceSnapshotView;
}

- (void)setSourceSnapshotView:(id)a3
{
}

- (UIView)sourceTransformView
{
  return self->_sourceTransformView;
}

- (void)setSourceTransformView:(id)a3
{
}

- (UIView)destinationTransformView
{
  return self->_destinationTransformView;
}

- (void)setDestinationTransformView:(id)a3
{
}

- (UIView)originalContentSnapshotView
{
  return self->_originalContentSnapshotView;
}

- (void)setOriginalContentSnapshotView:(id)a3
{
}

- (_UIPortalView)destinationContentPortalView
{
  return self->_destinationContentPortalView;
}

- (void)setDestinationContentPortalView:(id)a3
{
}

- (_UIContextMenuCommitContainerView)animationContainer
{
  return self->_animationContainer;
}

- (void)setAnimationContainer:(id)a3
{
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_destinationContentPortalView, 0);
  objc_storeStrong((id *)&self->_originalContentSnapshotView, 0);
  objc_storeStrong((id *)&self->_destinationTransformView, 0);
  objc_storeStrong((id *)&self->_sourceTransformView, 0);
  objc_storeStrong((id *)&self->_sourceSnapshotView, 0);
  objc_storeStrong((id *)&self->_morphContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end