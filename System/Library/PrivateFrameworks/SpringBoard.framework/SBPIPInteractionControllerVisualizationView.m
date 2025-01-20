@interface SBPIPInteractionControllerVisualizationView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_backgroundFrame;
- (CGRect)_unionFrame;
- (SBPIPPositionGeometryContext)extendedGeometryContext;
- (SBPIPPositionGeometryContext)mainGeometryContext;
- (SBPIPPositionInteractionStateContext)interactionContext;
- (_UIHyperregionUnion)regionUnion;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setExtendedGeometryContext:(SBPIPPositionGeometryContext *)a3;
- (void)setInteractionContext:(SBPIPPositionInteractionStateContext *)a3;
- (void)setMainGeometryContext:(SBPIPPositionGeometryContext *)a3;
- (void)setRegionUnion:(id)a3;
@end

@implementation SBPIPInteractionControllerVisualizationView

- (void)layoutSubviews
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)SBPIPInteractionControllerVisualizationView;
  [(SBPIPInteractionControllerVisualizationView *)&v75 layoutSubviews];
  containerView = self->_containerView;
  v4 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
  v5 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
  v6 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
  if (!containerView)
  {
    v7 = [(SBPIPInteractionControllerVisualizationView *)self layer];
    [v7 setAllowsHitTesting:0];

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v9 = self->_containerView;
    self->_containerView = v8;

    [(UIView *)self->_containerView setUserInteractionEnabled:0];
    id v10 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v11 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    insetsGeometryView = self->_insetsGeometryView;
    self->_insetsGeometryView = v11;

    v13 = self->_insetsGeometryView;
    v14 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(UIView *)v13 setBackgroundColor:v14];

    [(UIView *)self->_insetsGeometryView setUserInteractionEnabled:0];
    [(UIView *)self->_containerView addSubview:self->_insetsGeometryView];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    unionView = self->_unionView;
    self->_unionView = v15;

    [(UIView *)self->_unionView setUserInteractionEnabled:0];
    v17 = self->_unionView;
    v18 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
    [(UIView *)v17 setBackgroundColor:v18];

    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    mainGeometryView = self->_mainGeometryView;
    self->_mainGeometryView = v19;

    v21 = self->_mainGeometryView;
    v22 = [MEMORY[0x1E4F428B8] systemYellowColor];
    v23 = [v22 colorWithAlphaComponent:0.2];
    [(UIView *)v21 setBackgroundColor:v23];

    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    extendedGeometryView = self->_extendedGeometryView;
    self->_extendedGeometryView = v24;

    v26 = self->_extendedGeometryView;
    v27 = [MEMORY[0x1E4F428B8] systemRedColor];
    v28 = [v27 colorWithAlphaComponent:0.2];
    [(UIView *)v26 setBackgroundColor:v28];

    v4 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
    [(UIView *)self->_containerView addSubview:self->_unionView];
    v6 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
    [(UIView *)self->_containerView addSubview:self->_mainGeometryView];
    [(UIView *)self->_containerView addSubview:self->_extendedGeometryView];
    v5 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    fakePIPView = self->_fakePIPView;
    self->_fakePIPView = v29;

    v31 = self->_fakePIPView;
    v32 = [MEMORY[0x1E4F428B8] systemMintColor];
    [(UIView *)v31 setBackgroundColor:v32];

    [(UIView *)self->_containerView addSubview:self->_fakePIPView];
    [(SBPIPInteractionControllerVisualizationView *)self addSubview:self->_containerView];
    containerView = self->_containerView;
  }
  long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v74[0] = *MEMORY[0x1E4F1DAB8];
  v74[1] = v33;
  v74[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)containerView setTransform:v74];
  v34 = self->_containerView;
  [(SBPIPInteractionControllerVisualizationView *)self _unionFrame];
  -[UIView setFrame:](v34, "setFrame:");
  uint64_t v35 = v4[1014];
  v36 = *(Class *)((char *)&self->super.super.super.isa + v35);
  [(SBPIPInteractionControllerVisualizationView *)self _backgroundFrame];
  objc_msgSend(v36, "setFrame:");
  -[UIView setFrame:](self->_extendedGeometryView, "setFrame:", self->_extendedGeometryContext.containerBounds.origin.x, self->_extendedGeometryContext.containerBounds.origin.y, self->_extendedGeometryContext.containerBounds.size.width, self->_extendedGeometryContext.containerBounds.size.height);
  uint64_t v37 = v5[1015];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v37), "setFrame:", self->_mainGeometryContext.containerBounds.origin.x, self->_mainGeometryContext.containerBounds.origin.y, self->_mainGeometryContext.containerBounds.size.width, self->_mainGeometryContext.containerBounds.size.height);
  v38 = self->_insetsGeometryView;
  UIRectInset();
  -[UIView setFrame:](v38, "setFrame:");
  v39 = [(UIView *)self->_extendedGeometryView layer];
  id v40 = [MEMORY[0x1E4F428B8] yellowColor];
  objc_msgSend(v39, "setBorderColor:", objc_msgSend(v40, "CGColor"));

  v41 = [*(id *)((char *)&self->super.super.super.isa + v37) layer];
  id v42 = [MEMORY[0x1E4F428B8] yellowColor];
  objc_msgSend(v41, "setBorderColor:", objc_msgSend(v42, "CGColor"));

  v43 = [*(id *)((char *)&self->super.super.super.isa + v37) layer];
  [v43 setBorderWidth:20.0];

  v44 = [(UIView *)self->_extendedGeometryView layer];
  [v44 setBorderWidth:20.0];

  uint64_t v45 = v6[1017];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v45), "setSize:", self->_mainGeometryContext.pipCurrentSize.width, self->_mainGeometryContext.pipCurrentSize.height);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v45), "setCenter:", self->_interactionContext.currentPosition.x, self->_interactionContext.currentPosition.y);
  [(UIView *)self->_containerView bounds];
  double v46 = 300.0 / CGRectGetWidth(v78);
  [(UIView *)self->_containerView bounds];
  double v47 = 300.0 / CGRectGetHeight(v79);
  if (v46 >= v47) {
    CGFloat v48 = v47;
  }
  else {
    CGFloat v48 = v46;
  }
  v49 = self->_containerView;
  CGAffineTransformMakeScale(&v73, v48, v48);
  [(UIView *)v49 setTransform:&v73];
  [(SBPIPInteractionControllerVisualizationView *)self bounds];
  UIRectGetCenter();
  double v51 = v50;
  double v53 = v52;
  [*(id *)((char *)&self->super.super.super.isa + v35) frame];
  double v55 = v51 - v54 * v48;
  [*(id *)((char *)&self->super.super.super.isa + v35) frame];
  -[UIView setCenter:](self->_containerView, "setCenter:", v55, v53 - v56 * v48);
  v57 = [MEMORY[0x1E4F1CA80] setWithArray:self->_regionViews];
  v58 = [(_UIHyperregionUnion *)self->_regionUnion _regions];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __61__SBPIPInteractionControllerVisualizationView_layoutSubviews__block_invoke;
  v71[3] = &unk_1E6AFC360;
  v71[4] = self;
  id v59 = v57;
  id v72 = v59;
  [v58 enumerateObjectsUsingBlock:v71];

  regionViews = self->_regionViews;
  v61 = [v59 allObjects];
  [(NSMutableArray *)regionViews removeObjectsInArray:v61];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v62 = v59;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v68 != v65) {
          objc_enumerationMutation(v62);
        }
        objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * i), "removeFromSuperview", (void)v67);
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v64);
  }
}

void __61__SBPIPInteractionControllerVisualizationView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v27 = a2;
  v5 = *(void **)(*(void *)(a1 + 32) + 456);
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 456);
    *(void *)(v7 + 456) = v6;

    v5 = *(void **)(*(void *)(a1 + 32) + 456);
  }
  if ([v5 count] <= a3)
  {
    v9 = *(void **)(*(void *)(a1 + 32) + 456);
    id v10 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v9 addObject:v10];
  }
  v11 = [*(id *)(*(void *)(a1 + 32) + 456) objectAtIndexedSubscript:a3];
  v12 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  v13 = [v12 colorWithAlphaComponent:0.2];
  [v11 setBackgroundColor:v13];

  v14 = [*(id *)(*(void *)(a1 + 32) + 456) objectAtIndexedSubscript:a3];
  objc_msgSend(v27, "sb_debugFrame");
  objc_msgSend(v14, "setFrame:");

  v15 = [*(id *)(*(void *)(a1 + 32) + 456) objectAtIndexedSubscript:a3];
  [v15 frame];
  double Width = CGRectGetWidth(v29);

  v17 = [*(id *)(*(void *)(a1 + 32) + 456) objectAtIndexedSubscript:a3];
  v18 = [v17 layer];
  if (Width >= 25.0) {
    [MEMORY[0x1E4F428B8] whiteColor];
  }
  else {
  id v19 = [MEMORY[0x1E4F428B8] redColor];
  }
  objc_msgSend(v18, "setBorderColor:", objc_msgSend(v19, "CGColor"));

  v20 = [*(id *)(*(void *)(a1 + 32) + 456) objectAtIndexedSubscript:a3];
  v21 = [v20 layer];
  [v21 setBorderWidth:20.0];

  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 408);
  v24 = [*(id *)(v22 + 456) objectAtIndexedSubscript:a3];
  [v23 addSubview:v24];

  v25 = *(void **)(a1 + 40);
  v26 = [*(id *)(*(void *)(a1 + 32) + 456) objectAtIndexedSubscript:a3];
  [v25 removeObject:v26];
}

- (CGRect)_unionFrame
{
  CGRect v8 = CGRectUnion(*MEMORY[0x1E4F1DB28], self->_mainGeometryContext.containerBounds);
  CGFloat x = self->_extendedGeometryContext.containerBounds.origin.x;
  CGFloat y = self->_extendedGeometryContext.containerBounds.origin.y;
  CGFloat width = self->_extendedGeometryContext.containerBounds.size.width;
  CGFloat height = self->_extendedGeometryContext.containerBounds.size.height;
  return CGRectUnion(v8, *(CGRect *)&x);
}

- (CGRect)_backgroundFrame
{
  p_mainGeometryContext = &self->_mainGeometryContext;
  CGRect v7 = CGRectUnion(*MEMORY[0x1E4F1DB28], self->_mainGeometryContext.containerBounds);
  p_extendedGeometryContext = &self->_extendedGeometryContext;
  CGRect result = CGRectUnion(v7, p_extendedGeometryContext->containerBounds);
  double x = p_mainGeometryContext->containerBounds.origin.x;
  double y = p_mainGeometryContext->containerBounds.origin.y;
  if (x >= p_extendedGeometryContext->containerBounds.origin.x) {
    double x = p_extendedGeometryContext->containerBounds.origin.x;
  }
  if (y >= p_extendedGeometryContext->containerBounds.origin.y) {
    double y = p_extendedGeometryContext->containerBounds.origin.y;
  }
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (_UIHyperregionUnion)regionUnion
{
  return self->_regionUnion;
}

- (void)setRegionUnion:(id)a3
{
}

- (SBPIPPositionGeometryContext)mainGeometryContext
{
  long long v3 = *(_OWORD *)&self[3].edgeInsets.top;
  *(CGSize *)&retstr->stashedMinimumPadding.top = self[3].containerBounds.size;
  *(_OWORD *)&retstr->stashedMinimumPadding.bottom = v3;
  *(_OWORD *)&retstr->offscreenCorners = *(_OWORD *)&self[3].edgeInsets.bottom;
  CGSize pipStashedSize = self[3].pipStashedSize;
  *(CGSize *)&retstr->edgeInsets.top = self[3].pipLastSteadySize;
  *(CGSize *)&retstr->edgeInsets.bottom = pipStashedSize;
  CGPoint origin = self[3].containerBounds.origin;
  *(CGPoint *)&retstr->minimumPadding.top = self[3].pipAnchorPointOffset;
  *(CGPoint *)&retstr->minimumPadding.bottom = origin;
  CGPoint v6 = *(CGPoint *)&self[2].stashedMinimumPadding.bottom;
  retstr->CGSize pipStashedSize = *(CGSize *)&self[2].stashedMinimumPadding.top;
  retstr->pipAnchorPointOffset = v6;
  CGSize pipCurrentSize = self[3].pipCurrentSize;
  retstr->containerBounds.CGPoint origin = *(CGPoint *)&self[2].offscreenCorners;
  retstr->containerBounds.size = pipCurrentSize;
  CGSize v8 = *(CGSize *)&self[2].minimumPadding.bottom;
  retstr->CGSize pipCurrentSize = *(CGSize *)&self[2].minimumPadding.top;
  retstr->pipLastSteadySize = v8;
  return self;
}

- (void)setMainGeometryContext:(SBPIPPositionGeometryContext *)a3
{
  self->_mainGeometryContext.CGSize pipCurrentSize = a3->pipCurrentSize;
  CGPoint origin = a3->containerBounds.origin;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  CGSize pipStashedSize = a3->pipStashedSize;
  self->_mainGeometryContext.pipAnchorPointOffset = a3->pipAnchorPointOffset;
  self->_mainGeometryContext.containerBounds.CGPoint origin = origin;
  self->_mainGeometryContext.CGSize pipLastSteadySize = pipLastSteadySize;
  self->_mainGeometryContext.CGSize pipStashedSize = pipStashedSize;
  long long v6 = *(_OWORD *)&a3->minimumPadding.top;
  CGSize size = a3->containerBounds.size;
  long long v7 = *(_OWORD *)&a3->edgeInsets.top;
  *(_OWORD *)&self->_mainGeometryContext.edgeInsets.bottom = *(_OWORD *)&a3->edgeInsets.bottom;
  *(_OWORD *)&self->_mainGeometryContext.minimumPadding.top = v6;
  self->_mainGeometryContext.containerBounds.CGSize size = size;
  *(_OWORD *)&self->_mainGeometryContext.edgeInsets.top = v7;
  long long v9 = *(_OWORD *)&a3->offscreenCorners;
  long long v11 = *(_OWORD *)&a3->minimumPadding.bottom;
  long long v10 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  *(_OWORD *)&self->_mainGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  *(_OWORD *)&self->_mainGeometryContext.offscreenCorners = v9;
  *(_OWORD *)&self->_mainGeometryContext.minimumPadding.bottom = v11;
  *(_OWORD *)&self->_mainGeometryContext.stashedMinimumPadding.top = v10;
}

- (SBPIPPositionGeometryContext)extendedGeometryContext
{
  long long v3 = *(_OWORD *)&self[4].edgeInsets.top;
  *(CGSize *)&retstr->stashedMinimumPadding.top = self[4].containerBounds.size;
  *(_OWORD *)&retstr->stashedMinimumPadding.bottom = v3;
  *(_OWORD *)&retstr->offscreenCorners = *(_OWORD *)&self[4].edgeInsets.bottom;
  CGSize pipStashedSize = self[4].pipStashedSize;
  *(CGSize *)&retstr->edgeInsets.top = self[4].pipLastSteadySize;
  *(CGSize *)&retstr->edgeInsets.bottom = pipStashedSize;
  CGPoint origin = self[4].containerBounds.origin;
  *(CGPoint *)&retstr->minimumPadding.top = self[4].pipAnchorPointOffset;
  *(CGPoint *)&retstr->minimumPadding.bottom = origin;
  CGPoint v6 = *(CGPoint *)&self[3].stashedMinimumPadding.bottom;
  retstr->CGSize pipStashedSize = *(CGSize *)&self[3].stashedMinimumPadding.top;
  retstr->pipAnchorPointOffset = v6;
  CGSize pipCurrentSize = self[4].pipCurrentSize;
  retstr->containerBounds.CGPoint origin = *(CGPoint *)&self[3].offscreenCorners;
  retstr->containerBounds.CGSize size = pipCurrentSize;
  CGSize v8 = *(CGSize *)&self[3].minimumPadding.bottom;
  retstr->CGSize pipCurrentSize = *(CGSize *)&self[3].minimumPadding.top;
  retstr->CGSize pipLastSteadySize = v8;
  return self;
}

- (void)setExtendedGeometryContext:(SBPIPPositionGeometryContext *)a3
{
  self->_extendedGeometryContext.CGSize pipCurrentSize = a3->pipCurrentSize;
  CGPoint origin = a3->containerBounds.origin;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  CGSize pipStashedSize = a3->pipStashedSize;
  self->_extendedGeometryContext.pipAnchorPointOffset = a3->pipAnchorPointOffset;
  self->_extendedGeometryContext.containerBounds.CGPoint origin = origin;
  self->_extendedGeometryContext.CGSize pipLastSteadySize = pipLastSteadySize;
  self->_extendedGeometryContext.CGSize pipStashedSize = pipStashedSize;
  long long v6 = *(_OWORD *)&a3->minimumPadding.top;
  CGSize size = a3->containerBounds.size;
  long long v7 = *(_OWORD *)&a3->edgeInsets.top;
  *(_OWORD *)&self->_extendedGeometryContext.edgeInsets.bottom = *(_OWORD *)&a3->edgeInsets.bottom;
  *(_OWORD *)&self->_extendedGeometryContext.minimumPadding.top = v6;
  self->_extendedGeometryContext.containerBounds.CGSize size = size;
  *(_OWORD *)&self->_extendedGeometryContext.edgeInsets.top = v7;
  long long v9 = *(_OWORD *)&a3->offscreenCorners;
  long long v11 = *(_OWORD *)&a3->minimumPadding.bottom;
  long long v10 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  *(_OWORD *)&self->_extendedGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  *(_OWORD *)&self->_extendedGeometryContext.offscreenCorners = v9;
  *(_OWORD *)&self->_extendedGeometryContext.minimumPadding.bottom = v11;
  *(_OWORD *)&self->_extendedGeometryContext.stashedMinimumPadding.top = v10;
}

- (SBPIPPositionInteractionStateContext)interactionContext
{
  long long v3 = *(_OWORD *)&self[7].projectedPosition.y;
  *(_OWORD *)&retstr->initialPosition.double y = *(_OWORD *)&self[7].isStashed;
  *(_OWORD *)&retstr->currentPosition.double y = v3;
  retstr->projectedPositionStashProgress = self[7].initialPosition.y;
  long long v4 = *(_OWORD *)&self[6].currentPositionStashProgress;
  *(CGPoint *)&retstr->isStashed = self[6].currentPosition;
  *(_OWORD *)&retstr->projectedPosition.double y = v4;
  return self;
}

- (void)setInteractionContext:(SBPIPPositionInteractionStateContext *)a3
{
  *(_OWORD *)&self->_interactionContext.isStashed = *(_OWORD *)&a3->isStashed;
  long long v4 = *(_OWORD *)&a3->initialPosition.y;
  long long v3 = *(_OWORD *)&a3->currentPosition.y;
  long long v5 = *(_OWORD *)&a3->projectedPosition.y;
  self->_interactionContext.projectedPositionStashProgress = a3->projectedPositionStashProgress;
  *(_OWORD *)&self->_interactionContext.initialPosition.double y = v4;
  *(_OWORD *)&self->_interactionContext.currentPosition.double y = v3;
  *(_OWORD *)&self->_interactionContext.projectedPosition.double y = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionUnion, 0);
  objc_storeStrong((id *)&self->_regionViews, 0);
  objc_storeStrong((id *)&self->_fakePIPView, 0);
  objc_storeStrong((id *)&self->_insetsGeometryView, 0);
  objc_storeStrong((id *)&self->_extendedGeometryView, 0);
  objc_storeStrong((id *)&self->_mainGeometryView, 0);
  objc_storeStrong((id *)&self->_unionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end