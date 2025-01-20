@interface SFScribbleController
- (BOOL)canEnableScribble;
- (BOOL)isPrivateBrowsing;
- (BOOL)isScribbling;
- (BOOL)userInitiatedScribblingDisabled;
- (CGImage)_imageForScribbleAnimationWithElementFrame:(CGRect)a3;
- (CGPoint)_offsetForObscuredInsets;
- (CGRect)_frameForElementFrame:(CGRect)a3 inCoordinateSpace:(id)a4;
- (CGRect)_frameForElementFrame:(CGRect)a3 inCoordinateSpace:(id)a4 withOutset:(double)a5;
- (NSArray)normalBrowsingUserContentControllers;
- (SFScribbleController)initWithWebView:(id)a3 delegate:(id)a4;
- (SFScribbleControllerDelegate)delegate;
- (SFScribbleOverlay)overlay;
- (SFURLFieldOverlayConfiguration)urlFieldOverlayConfiguration;
- (SFURLFieldOverlayConfiguration)urlFieldOverlayNarrowConfiguration;
- (WBSScribbleQuirksManager)scribbleQuirksManager;
- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager;
- (WKWebView)webView;
- (id)_cancelActionForURLFieldOverlay;
- (id)_doneAction;
- (id)_urlFieldOverlayText;
- (unint64_t)hiddenElementCount;
- (void)_endScribblingAndSaveChanges:(BOOL)a3;
- (void)_hideSelectedElement;
- (void)_performPendingSelectionRequestIfNeeded;
- (void)_runScribbleAnimationInFrame:(CGRect)a3;
- (void)_selectionDidMoveToLocation:(CGPoint)a3;
- (void)_setCommonPropertiesToConfiguration:(id)a3;
- (void)_setSelectedElement:(id)a3;
- (void)_startScribbling;
- (void)_updateScribbleControllerForElementAtPoint:(CGPoint)a3;
- (void)clearEdits;
- (void)invalidate;
- (void)openFeedbackAppForScribbleReportForWebView:(id)a3;
- (void)reloadData;
- (void)reloadWithoutScribbleElements;
- (void)scheduleValidationForHiddenElementsIfNeeded;
- (void)scribbleController:(id)a3 didUpdateSelectedElement:(id)a4 withError:(id)a5;
- (void)scribbleControllerDidUpdateHiddenElementCount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserInitiatedScribblingDisabled:(BOOL)a3;
- (void)startScribbling;
- (void)updateCountForElementsHiddenByPaintingAvoidance;
- (void)updateOverlayInScrollView:(id)a3;
- (void)updateUserDefinedContentBlockerWithHost:(id)a3;
@end

@implementation SFScribbleController

- (SFScribbleController)initWithWebView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SFScribbleController;
  v8 = [(SFScribbleController *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F98E08]) initWithWebView:v6];
    elementController = v9->_elementController;
    v9->_elementController = (WBSScribbleController *)v10;

    [(WBSScribbleController *)v9->_elementController setDelegate:v9];
    v12 = objc_alloc_init(SFScribbleOverlay);
    overlay = v9->_overlay;
    v9->_overlay = v12;

    objc_storeWeak((id *)&v9->_webView, v6);
    objc_initWeak(&location, v9);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__SFScribbleController_initWithWebView_delegate___block_invoke;
    v18[3] = &unk_1E54EDA50;
    objc_copyWeak(&v19, &location);
    [(SFScribbleOverlay *)v9->_overlay setSelectionHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__SFScribbleController_initWithWebView_delegate___block_invoke_2;
    v16[3] = &unk_1E54EA1B8;
    objc_copyWeak(&v17, &location);
    [(SFScribbleOverlay *)v9->_overlay setTapHandler:v16];
    v14 = v9;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __49__SFScribbleController_initWithWebView_delegate___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectionDidMoveToLocation:", a2, a3);
}

void __49__SFScribbleController_initWithWebView_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideSelectedElement];
}

- (CGImage)_imageForScribbleAnimationWithElementFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[SFScribbleController _frameForElementFrame:inCoordinateSpace:](self, "_frameForElementFrame:inCoordinateSpace:", WeakRetained, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = objc_msgSend(WeakRetained, "safari_snapshotImageFromIOSurfaceInRect:");
  v18 = (void *)MEMORY[0x1E4F98E10];
  id v19 = v17;
  uint64_t v20 = [v19 CGImage];
  [WeakRetained bounds];
  double v22 = v21;
  double v24 = v23;
  v25 = [WeakRetained traitCollection];
  [v25 displayScale];
  v27 = (CGImage *)objc_msgSend(v18, "imageForScribbleEffectWithElementSnapshot:elementFrame:webViewSize:webViewScale:", v20, v10, v12, v14, v16, v22, v24, v26);

  return v27;
}

- (void)_runScribbleAnimationInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    double v9 = -[SFScribbleController _imageForScribbleAnimationWithElementFrame:](self, "_imageForScribbleAnimationWithElementFrame:", x, y, width, height);
    id v10 = objc_alloc(MEMORY[0x1E4F98E10]);
    [WeakRetained bounds];
    objc_msgSend(WeakRetained, "convertRect:toView:", self->_overlay);
    double v11 = objc_msgSend(v10, "initWithImage:frame:", v9);
    CGImageRelease(v9);
    double v12 = [(SFScribbleOverlay *)self->_overlay window];

    if (v12) {
      [(SFScribbleOverlay *)self->_overlay insertSubview:v11 atIndex:0];
    }
    else {
      [WeakRetained addSubview:v11];
    }
    objc_initWeak(&location, self);
    [(WBSScribbleController *)self->_elementController setElementSelectionEnabled:0];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __53__SFScribbleController__runScribbleAnimationInFrame___block_invoke;
    double v16 = &unk_1E54EA1B8;
    objc_copyWeak(&v17, &location);
    [v11 startEffectWithCompletion:&v13];
    objc_msgSend(MEMORY[0x1E4F98E10], "prewarm", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __53__SFScribbleController__runScribbleAnimationInFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] setElementSelectionEnabled:1];
    id WeakRetained = v2;
  }
}

- (BOOL)isScribbling
{
  return [(WBSScribbleController *)self->_elementController isScribbling];
}

- (BOOL)canEnableScribble
{
  return [(WBSScribbleController *)self->_elementController canHideContentInWebView];
}

- (void)_endScribblingAndSaveChanges:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WBSScribbleController *)self->_elementController isScribbling])
  {
    if (!self->_userInitiatedScribblingDisabled)
    {
      pendingSelectionLocation = self->_pendingSelectionLocation;
      self->_pendingSelectionLocation = 0;

      overladouble y = self->_overlay;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __53__SFScribbleController__endScribblingAndSaveChanges___block_invoke;
      v8[3] = &unk_1E54E9858;
      v8[4] = self;
      [(SFScribbleOverlay *)overlay endSelectionWithCompletion:v8];
      [(WBSScribbleController *)self->_elementController endScribblingAndSaveChanges:v3];
      [MEMORY[0x1E4F98E10] discardPrewarmedContent];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained sfScribbleControllerDidEndScribbling:self];
    }
  }
}

uint64_t __53__SFScribbleController__endScribblingAndSaveChanges___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeFromSuperview];
}

- (unint64_t)hiddenElementCount
{
  return [(WBSScribbleController *)self->_elementController numberOfAllHiddenElements];
}

- (void)startScribbling
{
  if (([(WBSScribbleController *)self->_elementController isScribbling] & 1) == 0
    && !self->_userInitiatedScribblingDisabled)
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v4 = [v3 BOOLForKey:@"didShowDistractionControlEducationalAlertKey"];

    if (v4)
    {
      [(SFScribbleController *)self _startScribbling];
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v5 setBool:1 forKey:@"didShowDistractionControlEducationalAlertKey"];

      objc_initWeak(&location, self);
      id v6 = (void *)MEMORY[0x1E4FB1418];
      id v7 = _WBSLocalizedString();
      v8 = _WBSLocalizedString();
      double v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

      id v10 = (void *)MEMORY[0x1E4FB1410];
      double v11 = _WBSLocalizedString();
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      double v16 = __39__SFScribbleController_startScribbling__block_invoke;
      id v17 = &unk_1E54EDA78;
      objc_copyWeak(&v18, &location);
      double v12 = [v10 actionWithTitle:v11 style:0 handler:&v14];
      objc_msgSend(v9, "addAction:", v12, v14, v15, v16, v17);

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained sfScribbleController:self presentAlert:v9];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __39__SFScribbleController_startScribbling__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _startScribbling];
    id WeakRetained = v2;
  }
}

- (void)_startScribbling
{
  if (([(WBSScribbleController *)self->_elementController isScribbling] & 1) == 0
    && !self->_userInitiatedScribblingDisabled)
  {
    objc_initWeak(&location, self);
    elementController = self->_elementController;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__SFScribbleController__startScribbling__block_invoke;
    v4[3] = &unk_1E54EDAA0;
    objc_copyWeak(&v5, &location);
    [(WBSScribbleController *)elementController startScribblingWithCompletionHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __40__SFScribbleController__startScribbling__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      id v3 = objc_loadWeakRetained(WeakRetained + 4);
      id v4 = objc_loadWeakRetained(v7 + 6);
      id v5 = [v4 scrollView];

      id v6 = v7[5];
      [v5 bounds];
      objc_msgSend(v5, "convertRect:fromView:", v5);
      objc_msgSend(v6, "setFrame:");
      [v6 setAutoresizingMask:18];
      [v5 addSubview:v6];

      [MEMORY[0x1E4F98E10] prewarm];
      [v3 sfScribbleControllerDidStartScribbling:v7];

      id WeakRetained = v7;
    }
  }
}

- (void)updateOverlayInScrollView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  objc_msgSend(v4, "convertRect:fromView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[SFScribbleOverlay setFrame:](self->_overlay, "setFrame:", v6, v8, v10, v12);
  overladouble y = self->_overlay;

  [(SFScribbleOverlay *)overlay endSelection];
}

- (void)reloadData
{
  if ([(WBSScribbleController *)self->_elementController isScribbling]) {
    [(SFScribbleController *)self _endScribblingAndSaveChanges:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v3 = [WeakRetained URL];
  id v4 = [v3 host];
  [(SFScribbleController *)self updateUserDefinedContentBlockerWithHost:v4];
}

- (void)reloadWithoutScribbleElements
{
}

- (void)clearEdits
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sfScribbleControllerDidEndScribbling:self];
  if ([(SFScribbleController *)self hiddenElementCount] > 1)
  {
    objc_initWeak(&location, self);
    id v4 = (void *)MEMORY[0x1E4FB1418];
    double v5 = _WBSLocalizedString();
    double v6 = [v4 alertControllerWithTitle:0 message:v5 preferredStyle:1];

    double v7 = (void *)MEMORY[0x1E4FB1410];
    double v8 = _WBSLocalizedString();
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __34__SFScribbleController_clearEdits__block_invoke;
    double v16 = &unk_1E54EDA78;
    objc_copyWeak(&v17, &location);
    double v9 = [v7 actionWithTitle:v8 style:2 handler:&v13];
    objc_msgSend(v6, "addAction:", v9, v13, v14, v15, v16);

    double v10 = (void *)MEMORY[0x1E4FB1410];
    double v11 = _WBSLocalizedString();
    double v12 = [v10 actionWithTitle:v11 style:1 handler:0];
    [v6 addAction:v12];

    [WeakRetained sfScribbleController:self presentAlert:v6];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  else
  {
    [(WBSScribbleController *)self->_elementController clearAllEdits];
  }
}

void __34__SFScribbleController_clearEdits__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[1] clearAllEdits];
    id WeakRetained = v2;
  }
}

- (void)_hideSelectedElement
{
  [(SFScribbleOverlay *)self->_overlay endSelection];
  id v3 = [(WBSScribbleController *)self->_elementController selectedScribbleElement];

  if (v3)
  {
    id v4 = [(WBSScribbleController *)self->_elementController selectedScribbleElement];
    [v4 geometry];
    -[SFScribbleController _runScribbleAnimationInFrame:](self, "_runScribbleAnimationInFrame:");

    elementController = self->_elementController;
    [(WBSScribbleController *)elementController hideSelectedElement];
  }
}

- (BOOL)isPrivateBrowsing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained isPrivateBrowsing];

  return v3;
}

- (NSArray)normalBrowsingUserContentControllers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained normalBrowsingUserContentControllers];

  return (NSArray *)v3;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained scribbleQuirksManager];

  return (WBSScribbleQuirksManager *)v3;
}

- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained isPrivateBrowsing]) {
    [WeakRetained privateBrowsingUserDefinedContentBlockerManager];
  }
  else {
  char v3 = [WeakRetained normalBrowsingUserDefinedContentBlockerManager];
  }

  return (WBSUserDefinedContentBlockerManager *)v3;
}

- (void)scribbleController:(id)a3 didUpdateSelectedElement:(id)a4 withError:(id)a5
{
  [(SFScribbleController *)self _setSelectedElement:a4];

  [(SFScribbleController *)self _performPendingSelectionRequestIfNeeded];
}

- (void)scribbleControllerDidUpdateHiddenElementCount:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sfScribbleControllerDidUpdateHiddenElementCount:self];
}

- (void)updateUserDefinedContentBlockerWithHost:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [(SFScribbleController *)self userDefinedContentBlockerManager];
    int v5 = [v4 hasContentBlockerWithActions];

    if (v5) {
      [(WBSScribbleController *)self->_elementController loadContentBlockerForHost:v6];
    }
  }
}

- (void)scheduleValidationForHiddenElementsIfNeeded
{
}

- (CGRect)_frameForElementFrame:(CGRect)a3 inCoordinateSpace:(id)a4
{
  -[SFScribbleController _frameForElementFrame:inCoordinateSpace:withOutset:](self, "_frameForElementFrame:inCoordinateSpace:withOutset:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_frameForElementFrame:(CGRect)a3 inCoordinateSpace:(id)a4 withOutset:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_webView = &self->_webView;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_webView);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  double MinX = CGRectGetMinX(v48);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.double width = width;
  v49.size.double height = height;
  objc_msgSend(WeakRetained, "_convertPointFromContentsToView:", MinX, CGRectGetMinY(v49));
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  id v18 = [WeakRetained scrollView];
  [v18 zoomScale];
  v50.size.double width = width * v19;
  v50.size.double height = height * v19;
  v50.origin.CGFloat x = v15;
  v50.origin.CGFloat y = v17;
  CGRect v51 = CGRectInset(v50, -a5, -a5);
  CGFloat v20 = v51.origin.x;
  CGFloat v21 = v51.origin.y;
  CGFloat v22 = v51.size.width;
  CGFloat v23 = v51.size.height;
  [WeakRetained bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  [WeakRetained _obscuredInsets];
  v55.origin.CGFloat x = v25 + v32;
  v55.origin.CGFloat y = v27 + v33;
  v55.size.double width = v29 - (v32 + v34);
  v55.size.double height = v31 - (v33 + v35);
  v52.origin.CGFloat x = v20;
  v52.origin.CGFloat y = v21;
  v52.size.double width = v22;
  v52.size.double height = v23;
  CGRect v53 = CGRectIntersection(v52, v55);
  objc_msgSend(WeakRetained, "convertRect:toCoordinateSpace:", v11, v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = v37;
  double v45 = v39;
  double v46 = v41;
  double v47 = v43;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.CGFloat y = v45;
  result.origin.CGFloat x = v44;
  return result;
}

- (CGPoint)_offsetForObscuredInsets
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_convertPointFromViewToContents:", 0.0, 0.0);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (void)_selectionDidMoveToLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  [(SFScribbleController *)self _offsetForObscuredInsets];
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(WeakRetained, "convertPoint:fromView:", self->_overlay, x, y);
  objc_msgSend(WeakRetained, "_convertPointFromViewToContents:");
  double v12 = v11 - v8;
  double v14 = v13 - v10;
  CGFloat v15 = [WeakRetained scrollView];
  [v15 zoomScale];
  double v17 = v16;

  double v18 = v12 * v17;
  double v19 = v14 * v17;
  if ([(WBSScribbleController *)self->_elementController hasPendingRequest])
  {
    *(double *)CGFloat v22 = v18;
    *(double *)&v22[1] = v19;
    [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{CGPoint=dd}"];
    CGFloat v20 = (NSValue *)objc_claimAutoreleasedReturnValue();
    pendingSelectionLocation = self->_pendingSelectionLocation;
    self->_pendingSelectionLocation = v20;
  }
  else
  {
    -[SFScribbleController _updateScribbleControllerForElementAtPoint:](self, "_updateScribbleControllerForElementAtPoint:", v18, v19);
  }
}

- (void)_updateScribbleControllerForElementAtPoint:(CGPoint)a3
{
}

- (void)updateCountForElementsHiddenByPaintingAvoidance
{
}

- (void)_performPendingSelectionRequestIfNeeded
{
  double v6 = self->_pendingSelectionLocation;
  pendingSelectionLocation = self->_pendingSelectionLocation;
  self->_pendingSelectionLocation = 0;

  double v4 = v6;
  if (v6)
  {
    int v5 = [(WBSScribbleController *)self->_elementController isScribbling];
    double v4 = v6;
    if (v5)
    {
      [(NSValue *)v6 CGPointValue];
      -[SFScribbleController _updateScribbleControllerForElementAtPoint:](self, "_updateScribbleControllerForElementAtPoint:");
      double v4 = v6;
    }
  }
}

- (void)_setSelectedElement:(id)a3
{
  if (a3)
  {
    [a3 geometry];
    -[SFScribbleController _frameForElementFrame:inCoordinateSpace:withOutset:](self, "_frameForElementFrame:inCoordinateSpace:withOutset:", self->_overlay);
    overladouble y = self->_overlay;
    -[SFScribbleOverlay moveSelectionToFrame:](overlay, "moveSelectionToFrame:");
  }
  else
  {
    int v5 = self->_overlay;
    [(SFScribbleOverlay *)v5 endSelection];
  }
}

- (id)_cancelActionForURLFieldOverlay
{
  double v3 = (void *)MEMORY[0x1E4FB13F0];
  double v4 = _WBSLocalizedString();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFScribbleController__cancelActionForURLFieldOverlay__block_invoke;
  v7[3] = &unk_1E54EDAC8;
  v7[4] = self;
  int v5 = [v3 actionWithTitle:v4 image:0 identifier:0 handler:v7];

  return v5;
}

uint64_t __55__SFScribbleController__cancelActionForURLFieldOverlay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endScribblingAndSaveChanges:0];
}

- (id)_doneAction
{
  double v3 = (void *)MEMORY[0x1E4FB13F0];
  double v4 = _WBSLocalizedString();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SFScribbleController__doneAction__block_invoke;
  v7[3] = &unk_1E54EDAC8;
  v7[4] = self;
  int v5 = [v3 actionWithTitle:v4 image:0 identifier:0 handler:v7];

  return v5;
}

uint64_t __35__SFScribbleController__doneAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endScribblingAndSaveChanges:1];
}

- (SFURLFieldOverlayConfiguration)urlFieldOverlayConfiguration
{
  double v3 = [[SFURLFieldOverlayConfiguration alloc] initWithIdentifier:@"scribble"];
  [(SFScribbleController *)self _setCommonPropertiesToConfiguration:v3];
  double v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye.slash.fill"];
  [(SFURLFieldOverlayConfiguration *)v3 setIcon:v4];

  [(SFURLFieldOverlayConfiguration *)v3 setPrefersSecondaryText:1];

  return v3;
}

- (SFURLFieldOverlayConfiguration)urlFieldOverlayNarrowConfiguration
{
  double v3 = [[SFURLFieldOverlayConfiguration alloc] initWithIdentifier:@"scribbleNarrow"];
  [(SFScribbleController *)self _setCommonPropertiesToConfiguration:v3];
  [(SFURLFieldOverlayConfiguration *)v3 setPlaceFirstButtonInLeadingEdge:1];
  [(SFURLFieldOverlayConfiguration *)v3 setShouldTextShrinkToFit:1];

  return v3;
}

- (void)_setCommonPropertiesToConfiguration:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v18 = [v4 array];
  double v6 = objc_alloc_init(SFURLFieldOverlayButtonItem);
  double v7 = [(SFScribbleController *)self _cancelActionForURLFieldOverlay];
  [(SFURLFieldOverlayButtonItem *)v6 setAction:v7];

  [(SFURLFieldOverlayButtonItem *)v6 setTheme:0];
  [v18 addObject:v6];

  double v8 = objc_alloc_init(SFURLFieldOverlayButtonItem);
  double v9 = [(SFScribbleController *)self _doneAction];
  [(SFURLFieldOverlayButtonItem *)v8 setAction:v9];

  if ([(WBSScribbleController *)self->_elementController numberOfChangesFromCurrentSession])
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 2;
  }
  [(SFURLFieldOverlayButtonItem *)v8 setTheme:v10];
  [v18 addObject:v8];

  double v11 = (void *)[v18 copy];
  [v5 setButtonItems:v11];

  double v12 = [(SFScribbleController *)self _urlFieldOverlayText];
  [v5 setSecondaryText:v12];

  double v13 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  [v5 setThemeColor:v13];

  [v5 setUserInterfaceStyle:1];
  double v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v5 setPrimaryTextColor:v14];

  CGFloat v15 = [MEMORY[0x1E4FB1618] labelColor];
  [v5 setSecondaryTextColor:v15];

  double v16 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"ScribbleDoneButtonColor");
  [v5 setProminentButtonBackgroundColor:v16];

  double v17 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"ScribbleTextColor");
  [v5 setProminentButtonTextColor:v17];
}

- (id)_urlFieldOverlayText
{
  if ([(WBSScribbleController *)self->_elementController numberOfChangesFromCurrentSession])
  {
    double v3 = NSString;
    double v4 = _WBSLocalizedString();
    id v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, -[WBSScribbleController numberOfChangesFromCurrentSession](self->_elementController, "numberOfChangesFromCurrentSession"));
  }
  else
  {
    id v5 = _WBSLocalizedString();
  }

  return v5;
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(SFScribbleOverlay *)self->_overlay removeFromSuperview];
  elementController = self->_elementController;

  [(WBSScribbleController *)elementController invalidate];
}

- (void)openFeedbackAppForScribbleReportForWebView:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F985D0]];
  [v4 openURL:v3 withOptions:0];
}

- (SFScribbleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFScribbleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFScribbleOverlay)overlay
{
  return self->_overlay;
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (BOOL)userInitiatedScribblingDisabled
{
  return self->_userInitiatedScribblingDisabled;
}

- (void)setUserInitiatedScribblingDisabled:(BOOL)a3
{
  self->_userInitiatedScribblingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingSelectionLocation, 0);

  objc_storeStrong((id *)&self->_elementController, 0);
}

@end