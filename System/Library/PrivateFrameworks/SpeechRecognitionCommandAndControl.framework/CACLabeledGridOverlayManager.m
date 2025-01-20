@interface CACLabeledGridOverlayManager
+ (CGSize)bestGridResolutionForPortraitUpRect:(CGRect)a3 desiredColumns:(unint64_t)a4 desiredRows:(unint64_t)a5 level:(unint64_t)a6 screen:(id)a7;
+ (CGSize)gridResolutionForTopLevelWithPortraitUpRect:(CGRect)a3 desiredColumns:(unint64_t)a4 desiredRows:(unint64_t)a5 screen:(id)a6;
+ (unint64_t)maxNumberOfColumnsForDevice;
+ (unint64_t)maxNumberOfRowsForDevice;
- (BOOL)_isNextLevelAvailable;
- (BOOL)isOverlay;
- (BOOL)needsToBeRedrawn;
- (BOOL)shouldZoom;
- (BOOL)updateOverlayWithPortraitUpRect:(CGRect)a3 gridContainingLabel:(id)a4;
- (CACLabeledGridOverlayManagerDelegate)delegate;
- (CGPoint)portraitUpCenterPoint;
- (CGRect)bestDrilledGridRectForPortraitUpRect:(CGRect)a3;
- (CGRect)currentGridPortraitUpFrame;
- (CGSize)bestGridResolutionForPortraitUpRect:(CGRect)a3;
- (NSArray)labeledElements;
- (float)maxX;
- (float)maxY;
- (float)scale;
- (int64_t)currentLevel;
- (int64_t)currentNumberOfColumns;
- (int64_t)currentNumberOfRows;
- (int64_t)startingNumber;
- (void)_generateLabeledElementsForPortraitUpRect:(CGRect)a3;
- (void)hide;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)hideWithoutAnimation;
- (void)resetAndDrawAtTopLevelWithStartingNumber:(unint64_t)a3;
- (void)setCurrentGridPortraitUpFrame:(CGRect)a3;
- (void)setCurrentLevel:(int64_t)a3;
- (void)setCurrentNumberOfColumns:(int64_t)a3;
- (void)setCurrentNumberOfRows:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLabeledElements:(id)a3;
- (void)setMaxX:(float)a3;
- (void)setMaxY:(float)a3;
- (void)setNeedsToBeRedrawn:(BOOL)a3;
- (void)setScale:(float)a3;
- (void)setStartingNumber:(int64_t)a3;
- (void)showOverlayWithStartingNumber:(unint64_t)a3;
- (void)startDelayedDimmingOfNumbers;
- (void)stopDelayedDimmingOfNumbers;
@end

@implementation CACLabeledGridOverlayManager

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CACSimpleContentViewManager *)self setContentViewManagerDelegate:obj];
  }
}

- (void)showOverlayWithStartingNumber:(unint64_t)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke;
  v4[3] = &unk_264D11648;
  v4[4] = self;
  v4[5] = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke_2;
  v3[3] = &unk_264D11670;
  v3[4] = self;
  [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:v4 updateHandler:v3];
}

CACLabeledGridOverlayViewController *__62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(CACLabeledGridOverlayViewController);
  [*(id *)(a1 + 32) resetAndDrawAtTopLevelWithStartingNumber:*(void *)(a1 + 40)];
  return v2;
}

void __62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  objc_msgSend(v4, "setShowsNumbersInTopLeft:", objc_msgSend(v5, "showsNumbersInTopLeftForLabeledGridOverlayManager:", *(void *)(a1 + 32)));
}

- (void)resetAndDrawAtTopLevelWithStartingNumber:(unint64_t)a3
{
  [(CACLabeledGridOverlayManager *)self setCurrentLevel:0];
  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_currentGridPortraitUpFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_currentGridPortraitUpFrame.size = v5;
  v6 = [(CACLabeledGridOverlayManager *)self delegate];
  id v13 = [v6 screenForLabeledGridOverlayManager:self];

  [v13 bounds];
  *(float *)&double v8 = v7;
  [(CACLabeledGridOverlayManager *)self setMaxX:v8];
  [v13 bounds];
  *(float *)&double v10 = v9;
  [(CACLabeledGridOverlayManager *)self setMaxY:v10];
  [v13 scale];
  *(float *)&double v11 = v11;
  [(CACLabeledGridOverlayManager *)self setScale:v11];
  [(CACLabeledGridOverlayManager *)self setStartingNumber:a3];
  v12 = [(CACLabeledGridOverlayManager *)self delegate];
  [v12 topLevelPortraitUpRectForLabeledGridOverlayManager:self];
  -[CACLabeledGridOverlayManager updateOverlayWithPortraitUpRect:gridContainingLabel:](self, "updateOverlayWithPortraitUpRect:gridContainingLabel:", 0);
}

- (CGPoint)portraitUpCenterPoint
{
  p_currentGridPortraitUpFrame = &self->_currentGridPortraitUpFrame;
  CGFloat MidX = CGRectGetMidX(self->_currentGridPortraitUpFrame);
  double MidY = CGRectGetMidY(*p_currentGridPortraitUpFrame);
  double v5 = MidX;
  result.y = MidY;
  result.x = v5;
  return result;
}

- (void)startDelayedDimmingOfNumbers
{
  if (self->_currentLevel <= 1
    && ([(CACLabeledGridOverlayManager *)self delegate],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isAlwaysShowingLabeledGridOverlayManager:self],
        v3,
        v4))
  {
    [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
    [(CACSimpleContentViewManager *)self setActiveDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID]];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    double v5 = [(CACLabeledGridOverlayManager *)self delegate];
    int v6 = [v5 isOverlayFadingEnabledForLabeledGridOverlayManager:self];

    if (v6)
    {
      double v7 = [(CACLabeledGridOverlayManager *)self delegate];
      [v7 overlayFadeDelayForLabeledGridOverlayManager:self];
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
      v12[3] = &unk_264D115D0;
      v12[4] = self;
      double v10 = (void *)MEMORY[0x263EF83A0];
      dispatch_after(v9, MEMORY[0x263EF83A0], v12);
    }
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_4;
    v11[3] = &unk_264D115D0;
    v11[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  v1 = [v2 view];
  [v1 setAlpha:1.0];
}

uint64_t __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeDimmingTransactionID];
  uint64_t result = [*(id *)(a1 + 32) pendingDimmingTransactionID];
  if (v2 == result)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_3;
    v4[3] = &unk_264D115D0;
    v4[4] = *(void *)(a1 + 32);
    return [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0 completion:1.0];
  }
  return result;
}

void __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 overlayFadeOpacityForLabeledGridOverlayManager:*(void *)(a1 + 32)];
  double v3 = v2;
  int v4 = [*(id *)(a1 + 32) viewController];
  double v5 = [v4 view];
  [v5 setAlpha:v3];
}

void __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  v1 = [v2 view];
  [v1 setAlpha:1.0];
}

- (void)stopDelayedDimmingOfNumbers
{
  [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
  id v4 = [(CACSimpleContentViewManager *)self viewController];
  double v3 = [v4 view];
  [v3 setAlpha:1.0];
}

- (BOOL)updateOverlayWithPortraitUpRect:(CGRect)a3 gridContainingLabel:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v9 = [(CACLabeledGridOverlayManager *)self _isNextLevelAvailable];
  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__CACLabeledGridOverlayManager_updateOverlayWithPortraitUpRect_gridContainingLabel___block_invoke;
    block[3] = &unk_264D11698;
    block[4] = self;
    *(CGFloat *)&void block[5] = x;
    *(CGFloat *)&block[6] = y;
    *(CGFloat *)&block[7] = width;
    *(CGFloat *)&block[8] = height;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    double v10 = CACLogGrid();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CACLabeledGridOverlayManager updateOverlayWithPortraitUpRect:gridContainingLabel:](v10);
    }
  }
  return v9;
}

void __84__CACLabeledGridOverlayManager_updateOverlayWithPortraitUpRect_gridContainingLabel___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsToBeRedrawn:0];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLevel:", objc_msgSend(*(id *)(a1 + 32), "currentLevel") + 1);
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  if ([*(id *)(a1 + 32) currentLevel] >= 2)
  {
    [*(id *)(a1 + 32) stopDelayedDimmingOfNumbers];
    objc_msgSend(*(id *)(a1 + 32), "bestDrilledGridRectForPortraitUpRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v2 = v6;
    double v3 = v7;
    double v4 = v8;
    double v5 = v9;
  }
  double v10 = (double *)(*(void *)(a1 + 32) + 56);
  *double v10 = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  objc_msgSend(*(id *)(a1 + 32), "_generateLabeledElementsForPortraitUpRect:", v2, v3, v4, v5);
  uint64_t v11 = [*(id *)(a1 + 32) _isNextLevelAvailable] ^ 1;
  v12 = [*(id *)(a1 + 32) viewController];
  [v12 setShowsElementsAsClickable:v11];

  id v13 = [*(id *)(a1 + 32) viewController];
  v14 = [*(id *)(a1 + 32) labeledElements];
  [v13 setLabeledElements:v14];

  id v15 = [*(id *)(a1 + 32) delegate];
  [v15 didUpdateElementsForLabeledGridOverlayManager:*(void *)(a1 + 32)];
}

- (BOOL)_isNextLevelAvailable
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v3 = CACLogGrid();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = NSStringFromCGRect(self->_currentGridPortraitUpFrame);
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_238377000, v3, OS_LOG_TYPE_DEFAULT, "Grid size %@", (uint8_t *)&v10, 0xCu);
  }
  double v5 = [(CACLabeledGridOverlayManager *)self delegate];
  char v6 = [v5 isPressOnFirstLevelEnabledForLabeledGridOverlayManager:self];

  int64_t currentLevel = self->_currentLevel;
  if (currentLevel >= 1 && (v6 & 1) != 0) {
    return 0;
  }
  double height = self->_currentGridPortraitUpFrame.size.height;
  if (currentLevel >= 1 && height < 36.0000011 && self->_currentGridPortraitUpFrame.size.width < 36.0000011) {
    return 0;
  }
  if (height == 27.0) {
    return self->_currentGridPortraitUpFrame.size.width != 27.0;
  }
  return 1;
}

- (CGRect)bestDrilledGridRectForPortraitUpRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CACSimpleContentViewManager *)self viewController];
  double v9 = [v8 view];
  double v10 = CACViewRectFromPortraitUpRect(v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [(CACLabeledGridOverlayManager *)self maxX];
  double v18 = v17;
  [(CACLabeledGridOverlayManager *)self maxY];
  double v20 = v19;
  v21 = CACLogGrid();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[CACLabeledGridOverlayManager bestDrilledGridRectForPortraitUpRect:]();
  }

  double v22 = fmax(v16, 27.0);
  double v23 = fmax(v14, 27.0);
  if (v10 + v23 > v18) {
    double v10 = v18 - v23;
  }
  if (v12 + v22 > v20) {
    double v12 = v20 - v22;
  }
  if (v10 < 0.0 || v12 < 0.0)
  {
    v24 = CACLogGrid();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CACLabeledGridOverlayManager bestDrilledGridRectForPortraitUpRect:]();
    }
  }
  double v25 = CACPortraitUpRectFromViewRect(0, v10, v12, v23, v22);
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

+ (CGSize)gridResolutionForTopLevelWithPortraitUpRect:(CGRect)a3 desiredColumns:(unint64_t)a4 desiredRows:(unint64_t)a5 screen:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a6;
  objc_msgSend((id)objc_opt_class(), "bestGridResolutionForPortraitUpRect:desiredColumns:desiredRows:level:screen:", a4, a5, 1, v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)bestGridResolutionForPortraitUpRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(CACLabeledGridOverlayManager *)self currentNumberOfColumns];
  int64_t v9 = [(CACLabeledGridOverlayManager *)self currentNumberOfRows];
  if (!(v8 | v9))
  {
    double v10 = [(CACLabeledGridOverlayManager *)self delegate];
    uint64_t v8 = [v10 defaultNumberOfColumnsForLabeledGridOverlayManager:self];
  }
  double v11 = [(CACLabeledGridOverlayManager *)self delegate];
  id v12 = [v11 screenForLabeledGridOverlayManager:self];

  objc_msgSend((id)objc_opt_class(), "bestGridResolutionForPortraitUpRect:desiredColumns:desiredRows:level:screen:", v8, v9, self->_currentLevel, v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

+ (CGSize)bestGridResolutionForPortraitUpRect:(CGRect)a3 desiredColumns:(unint64_t)a4 desiredRows:(unint64_t)a5 level:(unint64_t)a6 screen:(id)a7
{
  CACViewRectFromPortraitUpRect(0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v12 = v10;
  double v13 = v11;
  BOOL v14 = v11 / v10 <= 0.666666667 || v11 / v10 >= 1.5;
  BOOL v15 = a4 == 0;
  if (a6 <= 1) {
    LOBYTE(v14) = a5 == 0;
  }
  else {
    BOOL v15 = v14;
  }
  unint64_t v16 = a4;
  if (v10 < (double)(20 * a4)) {
    unint64_t v16 = (unint64_t)(v10 / 20.0);
  }
  if (v11 < (double)(20 * a5)) {
    a5 = (unint64_t)(v11 / 20.0);
  }
  if (v14)
  {
    a5 = vcvtad_u64_f64(v11 / (v10 / (double)v16));
    if (v16 * a5 > 0x96)
    {
      if (!v15) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
  else if (v15)
  {
    unint64_t v16 = vcvtad_u64_f64(v10 / (v11 / (double)a5));
    if (a5 * v16 > 0x96) {
LABEL_17:
    }
      unint64_t v16 = 0x96 / a5;
  }
  else if (a5 * v16 > 0x96)
  {
LABEL_19:
    a5 = 0x96 / v16;
  }
  double v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v16 * a5 / 0xA + 1);
  uint64_t v18 = [v17 length];

  +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:v18 arrowOrientation:0 badgePresentation:0 badgeIndicator:0];
  if (!a4 || a6 >= 2)
  {
    BOOL v20 = v12 / (double)v16 < v19;
    double v21 = v12 / v19;
    if (v20) {
      unint64_t v16 = (unint64_t)v21;
    }
    if (a6 >= 2)
    {
      BOOL v22 = a5 >= 3 && v16 > 2;
      if (!v22 && (vabdd_f64(v12, v13) + 1.0) / (v12 + v13) < 0.2)
      {
        a5 = 3;
        unint64_t v16 = 3;
      }
    }
  }
  double v23 = (double)v16;
  double v24 = (double)a5;
  result.double height = v24;
  result.double width = v23;
  return result;
}

+ (unint64_t)maxNumberOfRowsForDevice
{
  double v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  CACPortraitUpRectFromViewRect(0, v3, v4, v5, v6);
  double v8 = v7;

  float v9 = v8 / 27.0;
  return vcvtms_u32_f32(v9);
}

+ (unint64_t)maxNumberOfColumnsForDevice
{
  double v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  CACPortraitUpRectFromViewRect(0, v3, v4, v5, v6);
  double v8 = v7;

  float v9 = v8 / 27.0;
  return vcvtms_u32_f32(v9);
}

- (void)_generateLabeledElementsForPortraitUpRect:(CGRect)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  CACViewRectFromPortraitUpRect(0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CACLabeledGridOverlayManager bestGridResolutionForPortraitUpRect:](self, "bestGridResolutionForPortraitUpRect:", self->_currentGridPortraitUpFrame.origin.x, self->_currentGridPortraitUpFrame.origin.y, self->_currentGridPortraitUpFrame.size.width, self->_currentGridPortraitUpFrame.size.height);
  double v5 = v4;
  double v7 = v6;
  double v8 = CACLogGrid();
  uint64_t v9 = (uint64_t)v5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CACLabeledGridOverlayManager _generateLabeledElementsForPortraitUpRect:]((uint64_t)v5, v8);
  }

  double v10 = CACLogGrid();
  uint64_t v31 = (uint64_t)v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CACLabeledGridOverlayManager _generateLabeledElementsForPortraitUpRect:](v31, v10);
  }

  double v11 = self;
  objc_sync_enter(v11);
  uint64_t v12 = objc_opt_new();
  labeledElements = v11->_labeledElements;
  v11->_labeledElements = (NSMutableArray *)v12;

  if (v31 >= 1)
  {
    uint64_t v14 = 0;
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (v9 >= 1)
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          [(CACLabeledGridOverlayManager *)v11 scale];
          UIRoundToScale();
          double v17 = v16;
          UIRoundToScale();
          double v19 = v18;
          UIRoundToScale();
          double v21 = v20;
          UIRoundToScale();
          double v23 = v22;
          double v24 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v14 + j + -[CACLabeledGridOverlayManager startingNumber](v11, "startingNumber"));
          double v25 = [(CACLabeledGridOverlayManager *)v11 delegate];
          double v26 = [(CACSimpleContentViewManager *)v11 viewController];
          double v27 = [v26 view];
          double v28 = objc_msgSend(v25, "labeledGridOverlayManager:elementWithTitle:rectangle:", v11, v24, CACPortraitUpRectFromViewRect(v27, v17, v19, v21, v23));

          [(NSMutableArray *)v11->_labeledElements addObject:v28];
          v29 = CACLogGrid();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218752;
            double v34 = v17;
            __int16 v35 = 2048;
            double v36 = v19;
            __int16 v37 = 2048;
            double v38 = v23;
            __int16 v39 = 2048;
            double v40 = v21;
            _os_log_debug_impl(&dword_238377000, v29, OS_LOG_TYPE_DEBUG, "element.rectangle: origin (%f, %f),size (%f, %f)", buf, 0x2Au);
          }

          v30 = CACLogGrid();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v34 = *(double *)&v24;
            _os_log_debug_impl(&dword_238377000, v30, OS_LOG_TYPE_DEBUG, "element.label: %@", buf, 0xCu);
          }
        }
      }
      v14 += v9;
    }
  }
  objc_sync_exit(v11);
}

- (BOOL)isOverlay
{
  return 1;
}

- (void)hide
{
  v2.receiver = self;
  v2.super_class = (Class)CACLabeledGridOverlayManager;
  [(CACSimpleContentViewManager *)&v2 hide];
}

- (void)hideWithoutAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)CACLabeledGridOverlayManager;
  [(CACSimpleContentViewManager *)&v2 hideWithoutAnimation];
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(CACLabeledGridOverlayManager *)self setLabeledElements:0];
  v7.receiver = self;
  v7.super_class = (Class)CACLabeledGridOverlayManager;
  [(CACSimpleContentViewManager *)&v7 hideAnimated:v4 completion:v6];
}

- (BOOL)shouldZoom
{
  objc_super v2 = self;
  double v3 = [(CACLabeledGridOverlayManager *)self delegate];
  LOBYTE(v2) = [v3 isZoomEnabledForGridOverlayManager:v2];

  return (char)v2;
}

- (NSArray)labeledElements
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabeledElements:(id)a3
{
}

- (int64_t)currentLevel
{
  return self->_currentLevel;
}

- (void)setCurrentLevel:(int64_t)a3
{
  self->_int64_t currentLevel = a3;
}

- (CGRect)currentGridPortraitUpFrame
{
  objc_copyStruct(v6, &self->_currentGridPortraitUpFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCurrentGridPortraitUpFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_currentGridPortraitUpFrame, &v3, 32, 1, 0);
}

- (CACLabeledGridOverlayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACLabeledGridOverlayManagerDelegate *)WeakRetained;
}

- (BOOL)needsToBeRedrawn
{
  return self->_needsToBeRedrawn;
}

- (void)setNeedsToBeRedrawn:(BOOL)a3
{
  self->_needsToBeRedrawn = a3;
}

- (int64_t)currentNumberOfColumns
{
  return self->_currentNumberOfColumns;
}

- (void)setCurrentNumberOfColumns:(int64_t)a3
{
  self->_currentNumberOfColumns = a3;
}

- (int64_t)currentNumberOfRows
{
  return self->_currentNumberOfRows;
}

- (void)setCurrentNumberOfRows:(int64_t)a3
{
  self->_currentNumberOfRows = a3;
}

- (int64_t)startingNumber
{
  return self->_startingNumber;
}

- (void)setStartingNumber:(int64_t)a3
{
  self->_startingNumber = a3;
}

- (float)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(float)a3
{
  self->_maxX = a3;
}

- (float)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(float)a3
{
  self->_maxY = a3;
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

- (void)updateOverlayWithPortraitUpRect:(os_log_t)log gridContainingLabel:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "Next level is not available, returning", v1, 2u);
}

- (void)bestDrilledGridRectForPortraitUpRect:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_238377000, v0, OS_LOG_TYPE_ERROR, "Grid rect's origin is off-screen! {%f, %f}", v1, 0x16u);
}

- (void)bestDrilledGridRectForPortraitUpRect:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_238377000, v0, OS_LOG_TYPE_DEBUG, "maxX, maxY {%f, %f}", v1, 0x16u);
}

- (void)_generateLabeledElementsForPortraitUpRect:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "vertSectionsCount: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)_generateLabeledElementsForPortraitUpRect:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "hortSectionsCount, %ld", (uint8_t *)&v2, 0xCu);
}

@end