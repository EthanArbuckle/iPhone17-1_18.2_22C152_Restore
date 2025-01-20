@interface PXFeedView
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handlePrimaryInteractionAtPoint:(CGPoint)a3;
- (BOOL)isActive;
- (NSObject)hoveredItemObjectID;
- (PXFeedContentLayout)feedContentLayout;
- (PXFeedTitleLayout)titleLayout;
- (PXFeedView)initWithCoder:(id)a3;
- (PXFeedView)initWithFrame:(CGRect)a3;
- (PXFeedView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (PXFeedViewModel)viewModel;
- (PXGAXResponder)axNextResponder;
- (PXGSplitLayout)splitLayout;
- (PXGView)tungstenView;
- (PXGViewCoordinator)tungstenViewCoordinator;
- (PXSimpleIndexPath)indexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4;
- (PXTouchingUIGestureRecognizer)touchingGestureRecognizer;
- (UIHoverGestureRecognizer)hoverGesture;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)currentHoverCompletion;
- (id)currentTouchCompletion;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)regionOfInterestForObjectReference:(id)a3;
- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3;
- (void)_handleHover:(id)a3;
- (void)_handleHoverEventAtPoint:(CGPoint)a3;
- (void)_handleTap:(id)a3;
- (void)_installGestureRecognizers;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)beginTouchingAtPoint:(CGPoint)a3;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)endTouching;
- (void)scrollObjectReference:(id)a3 toScrollPosition:(unint64_t)a4;
- (void)setAxNextResponder:(id)a3;
- (void)setCurrentHoverCompletion:(id)a3;
- (void)setCurrentTouchCompletion:(id)a3;
- (void)setHoveredItemObjectID:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)touchingUIGestureRecognizerWillBeginTouching:(id)a3;
@end

@implementation PXFeedView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tungstenViewCoordinator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hoveredItemObjectID, 0);
  objc_storeStrong(&self->_currentHoverCompletion, 0);
  objc_storeStrong(&self->_currentTouchCompletion, 0);
  objc_storeStrong((id *)&self->_feedContentLayout, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
  objc_storeStrong((id *)&self->_splitLayout, 0);
  objc_storeStrong((id *)&self->_hoverGesture, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_axNextResponder);
}

- (PXGViewCoordinator)tungstenViewCoordinator
{
  return self->_tungstenViewCoordinator;
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setHoveredItemObjectID:(id)a3
{
}

- (NSObject)hoveredItemObjectID
{
  return self->_hoveredItemObjectID;
}

- (id)currentHoverCompletion
{
  return self->_currentHoverCompletion;
}

- (id)currentTouchCompletion
{
  return self->_currentTouchCompletion;
}

- (PXFeedContentLayout)feedContentLayout
{
  return self->_feedContentLayout;
}

- (PXFeedTitleLayout)titleLayout
{
  return self->_titleLayout;
}

- (PXGSplitLayout)splitLayout
{
  return self->_splitLayout;
}

- (UIHoverGestureRecognizer)hoverGesture
{
  return self->_hoverGesture;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (PXTouchingUIGestureRecognizer)touchingGestureRecognizer
{
  return self->_touchingGestureRecognizer;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setAxNextResponder:(id)a3
{
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  v5 = [(PXFeedView *)self viewModel];
  [v4 addSubprovider:v5];

  id v6 = [(PXFeedView *)self tungstenView];
  [v4 addSubprovider:v6];
}

- (void)touchingUIGestureRecognizerWillBeginTouching:(id)a3
{
  [a3 locationInView:self];
  -[PXFeedView beginTouchingAtPoint:](self, "beginTouchingAtPoint:");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXFeedView *)self touchingGestureRecognizer];

  if (v8 == v7)
  {
    id v14 = 0;
    int v10 = objc_msgSend(v6, "px_isPanGestureRecognizerOfScrollView:", &v14);
    id v11 = v14;
    v12 = v11;
    BOOL v9 = !v10 || (objc_msgSend(v11, "px_isDecelerating") & 1) == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  id v5 = [(PXFeedView *)self touchingGestureRecognizer];
  if (v5 == v4)
  {

LABEL_5:
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke;
    v10[3] = &unk_1E5DCD5C8;
    id v11 = v4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke_2;
    v9[3] = &unk_1E5DCABD0;
    v9[4] = &v12;
    [(PXFeedView *)self px_enumerateDescendantSubviewsPassingTest:v10 usingBlock:v9];

    goto LABEL_6;
  }
  id v6 = [(PXFeedView *)self tapGestureRecognizer];

  if (v6 == v4) {
    goto LABEL_5;
  }
LABEL_6:
  char v7 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v7;
}

BOOL __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 alpha];
  if (v4 <= 0.0 || ([v3 isHidden] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    [v3 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [*(id *)(a1 + 32) locationInView:v3];
    v17.x = v14;
    v17.y = v15;
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    BOOL v5 = CGRectContainsPoint(v18, v17);
  }

  return v5;
}

void __43__PXFeedView_gestureRecognizerShouldBegin___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (void)_handleHover:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1 || objc_msgSend(v4, "state") == 2)
  {
    [v4 locationInView:0];
    -[PXFeedView _handleHoverEventAtPoint:](self, "_handleHoverEventAtPoint:");
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self];
    -[PXFeedView handlePrimaryInteractionAtPoint:](self, "handlePrimaryInteractionAtPoint:");
  }
}

- (void)_installGestureRecognizers
{
  id v3 = [[PXTouchingUIGestureRecognizer alloc] initWithTarget:self action:sel__handleTouch_];
  touchingGestureRecognizer = self->_touchingGestureRecognizer;
  self->_touchingGestureRecognizer = v3;

  [(PXTouchingUIGestureRecognizer *)self->_touchingGestureRecognizer setMaximumTouchMovement:20.0];
  [(PXTouchingUIGestureRecognizer *)self->_touchingGestureRecognizer setTouchDelegate:self];
  [(PXTouchingUIGestureRecognizer *)self->_touchingGestureRecognizer setDelegate:self];
  [(PXFeedView *)self addGestureRecognizer:self->_touchingGestureRecognizer];
  id v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v5;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [(PXFeedView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  CGFloat v7 = [(PXFeedView *)self viewModel];
  double v8 = [v7 spec];
  int v9 = [v8 wantsItemHoverEvents];

  if (v9)
  {
    double v10 = (UIHoverGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:self action:sel__handleHover_];
    [(UIHoverGestureRecognizer *)v10 setDelegate:self];
    hoverGesture = self->_hoverGesture;
    self->_hoverGesture = v10;
    double v12 = v10;

    [(PXFeedView *)self addGestureRecognizer:v12];
  }
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double v10 = [(PXFeedView *)self axNextResponder];
  LOBYTE(a4) = [v10 axGroup:v9 didRequestToPerformAction:a4 userInfo:v8];

  return a4;
}

- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFeedView *)self viewModel];
  double v6 = [v5 selectionManager];
  long long v10 = 0u;
  long long v11 = 0u;
  PXGAXGetToSimpleIndexPathForUserInfo(v4, (uint64_t)&v10);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PXFeedView__handleChangeToModifySelectionWithUserInfo___block_invoke;
  v7[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  long long v8 = v10;
  long long v9 = v11;
  [v6 performChanges:v7];
}

uint64_t __57__PXFeedView__handleChangeToModifySelectionWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = v9;
  if ((a4 & 2) != 0)
  {
    uint64_t v15 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v15);
    if (v15) {
      [(PXFeedView *)self _handleChangeToModifySelectionWithUserInfo:v10];
    }
  }
  if ((a4 & 4) != 0)
  {
    id v14 = 0;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v14);
    id v11 = v14;
    double v12 = v11;
    if (v11 && [v11 axContentKind] == 6) {
      [(PXFeedView *)self _handleChangeToModifySelectionWithUserInfo:v10];
    }
  }
  CGFloat v13 = [(PXFeedView *)self axNextResponder];
  [v13 axGroup:v8 didChange:a4 userInfo:v10];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v3 = [(PXFeedView *)self tungstenView];
  id v4 = [v3 scrollViewController];
  id v5 = [v4 scrollView];

  return v5;
}

- (void)_handleHoverEventAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PXFeedView *)self tungstenView];
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  CGFloat v7 = objc_msgSend(v6, "feedHitTestResultAtPoint:ignoringOverlayContent:", 1);
  id v8 = [(PXFeedView *)self viewModel];
  id v9 = [v8 dataSource];

  if (v7)
  {
    [v7 dataSourceIndexPath];
    long long v10 = [v9 objectIDAtIndexPath:&v15];
  }
  else
  {
    long long v10 = 0;
  }
  id v11 = [(PXFeedView *)self hoveredItemObjectID];
  if ([v10 isEqual:v11])
  {
LABEL_10:

    goto LABEL_11;
  }
  if (v10)
  {

LABEL_8:
    [(PXFeedView *)self setHoveredItemObjectID:v10];
    CGFloat v13 = [v7 hoverAction];

    if (!v13)
    {
      [(PXFeedView *)self setCurrentHoverCompletion:0];
      goto LABEL_11;
    }
    id v11 = [v7 hoverAction];
    id v14 = v11[2]();
    [(PXFeedView *)self setCurrentHoverCompletion:v14];

    goto LABEL_10;
  }
  double v12 = [(PXFeedView *)self hoveredItemObjectID];

  if (v12) {
    goto LABEL_8;
  }
LABEL_11:
}

- (PXSimpleIndexPath)indexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4
{
  id v8 = [(PXFeedView *)self feedContentLayout];
  id v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a4->item;
    v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v12[1] = v10;
    [v8 indexPathClosestToIndexPath:v12 inDirection:a5];
  }
  else
  {
    *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
    *(_OWORD *)&retstr->item = 0u;
  }

  return result;
}

- (void)endTouching
{
}

- (void)beginTouchingAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(PXFeedView *)self tungstenView];
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  double v6 = objc_msgSend(v7, "handleTouchAtPoint:");
  [(PXFeedView *)self setCurrentTouchCompletion:v6];
}

- (BOOL)handlePrimaryInteractionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = self;
  double v6 = [(PXFeedView *)self tungstenView];
  objc_msgSend(v6, "convertPoint:fromView:", v5, x, y);
  LOBYTE(v5) = objc_msgSend(v6, "handlePrimaryInteractionAtPoint:");

  return (char)v5;
}

- (void)setCurrentHoverCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  currentHoverCompletion = (void (**)(void))self->_currentHoverCompletion;
  if (currentHoverCompletion != v4)
  {
    id v8 = v4;
    if (currentHoverCompletion)
    {
      currentHoverCompletion[2]();
      id v4 = v8;
    }
    double v6 = _Block_copy(v4);
    id v7 = self->_currentHoverCompletion;
    self->_currentHoverCompletion = v6;

    id v4 = v8;
  }
}

- (void)setCurrentTouchCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  currentTouchCompletion = (void (**)(void))self->_currentTouchCompletion;
  if (currentTouchCompletion != v4)
  {
    id v8 = v4;
    if (currentTouchCompletion)
    {
      currentTouchCompletion[2]();
      id v4 = v8;
    }
    double v6 = _Block_copy(v4);
    id v7 = self->_currentTouchCompletion;
    self->_currentTouchCompletion = v6;

    id v4 = v8;
  }
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFeedView *)self feedContentLayout];
  double v6 = [v5 itemPlacementControllerForItemReference:v4];

  return v6;
}

- (void)scrollObjectReference:(id)a3 toScrollPosition:(unint64_t)a4
{
  id v6 = a3;
  id v10 = [(PXFeedView *)self tungstenView];
  id v7 = [v10 rootLayout];
  id v8 = objc_msgSend(v7, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v6, a4, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));

  id v9 = (id)[v8 autoInvalidate];
}

- (id)regionOfInterestForObjectReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFeedView *)self feedContentLayout];
  id v6 = [v5 spriteReferenceForObjectReference:v4];

  id v7 = [(PXFeedView *)self tungstenView];
  id v8 = [v7 regionOfInterestForSpriteReference:v6];

  return v8;
}

- (PXGView)tungstenView
{
  long long v2 = [(PXFeedView *)self tungstenViewCoordinator];
  id v3 = [v2 tungstenView];

  return (PXGView *)v3;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    id v4 = [(PXFeedView *)self viewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__PXFeedView_setIsActive___block_invoke;
    v5[3] = &__block_descriptor_33_e39_v16__0___PXStoryMutableFeedViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __26__PXFeedView_setIsActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:*(unsigned __int8 *)(a1 + 32)];
}

- (PXFeedView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PXFeedView;
  id v10 = -[PXFeedView initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    [v9 feedConfiguration];
    [(id)objc_claimAutoreleasedReturnValue() mediaProvider];
    objc_claimAutoreleasedReturnValue();
    id v11 = [[PXFeedViewModel alloc] initWithFeedViewConfiguration:v9];
    viewModel = v10->_viewModel;
    v10->_viewModel = v11;

    CGFloat v13 = [v9 feedConfiguration];
    int v14 = [v13 wantsEmbeddedScrollView];

    uint64_t v15 = [[PXFeedContentLayout alloc] initWithViewModel:v10->_viewModel];
    feedContentLayout = v10->_feedContentLayout;
    v10->_feedContentLayout = v15;

    if (v14) {
      CGPoint v17 = [[PXFeedViewScrollLayout alloc] initWithViewModel:v10->_viewModel displayingFeedContentLayout:v10->_feedContentLayout];
    }
    else {
      CGPoint v17 = v10->_feedContentLayout;
    }
    CGRect v18 = v17;
    v19 = [v9 feedConfiguration];
    v20 = [v19 localizedSubtitle];

    if (v20)
    {
      v21 = [[PXFeedTitleLayout alloc] initWithViewModel:v10->_viewModel];
      titleLayout = v10->_titleLayout;
      v10->_titleLayout = v21;

      v23 = objc_alloc_init(PXGSplitLayout);
      splitLayout = v10->_splitLayout;
      v10->_splitLayout = v23;

      [(PXGSplitLayout *)v10->_splitLayout setFirstSublayout:v10->_titleLayout];
      [(PXGSplitLayout *)v10->_splitLayout setSecondSublayout:v18];
      [(PXGSplitLayout *)v10->_splitLayout setObjectReferenceLookup:2];
      v10->_splitLayout;
    }
    if ((v14 & 1) == 0)
    {
      v25 = [(PXFeedViewModel *)v10->_viewModel spec];
      [v25 wantsScrollIndicators];
    }
    [(PXFeedView *)v10 bounds];
    [(PXFeedViewModel *)v10->_viewModel spec];
    [(id)objc_claimAutoreleasedReturnValue() viewOutsets];
    sub_1AB23B20C();
  }

  return 0;
}

void __42__PXFeedView_initWithFrame_configuration___block_invoke(uint64_t a1, void *a2)
{
}

- (PXFeedView)initWithCoder:(id)a3
{
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedView.m", 62, @"%s is not available as initializer", "-[PXFeedView initWithCoder:]");

  abort();
}

- (PXFeedView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedView.m", 58, @"%s is not available as initializer", "-[PXFeedView initWithFrame:]");

  abort();
}

@end