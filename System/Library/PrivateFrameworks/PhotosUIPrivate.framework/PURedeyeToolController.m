@interface PURedeyeToolController
- (BOOL)_removeCorrectionAtPoint:(CGPoint)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)wantsSecondaryToolbarVisible;
- (BOOL)wantsZoomAndPanEnabled;
- (CGPoint)_extractRedEyePointFromCorrectionDictionary:(id)a3;
- (PURedeyeToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)centerToolbarView;
- (id)localizedName;
- (id)selectedToolbarIconGlyphName;
- (id)toolbarIconGlyphName;
- (int64_t)toolControllerTag;
- (void)_animateFailureAppearance;
- (void)_animateInstructionAppearance;
- (void)_correctRedEyeAtPoint:(CGPoint)a3;
- (void)_handleRedeyeButton:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)_loadCorrectionsFromModelAnimated:(BOOL)a3;
- (void)_showChangeIndicatorAtPoint:(CGPoint)a3 isFailure:(BOOL)a4;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)dealloc;
- (void)didBecomeActiveTool;
- (void)didResignActiveTool;
- (void)flashAutoRedEyeCorrections;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)updateViewConstraints;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PURedeyeToolController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownCorrections, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_failureLabelConstraints, 0);
  objc_storeStrong((id *)&self->_failureLabel, 0);
  objc_storeStrong((id *)&self->_instructionLabelConstraints, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
}

- (void)_correctRedEyeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__74449;
  v32 = __Block_byref_object_dispose__74450;
  id v33 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v7 = [(PUPhotoEditToolController *)self delegate];
  [v7 toolControllerOriginalImageSize:self];
  double v9 = v8;
  double v11 = v10;

  v12 = [(PUPhotoEditToolController *)self delegate];
  v13 = [v12 toolControllerMainRenderer:self];
  v14 = [v13 composition];

  [v14 setObject:0 forKeyedSubscript:@"orientation"];
  PLPhysicalScreenScale();
  double v15 = x / v9;
  double v17 = y / v11;
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A2D8]), "initWithComposition:location:touchDiameter:", v14, v15, v17, v16 * 42.0);
  [v18 setName:@"PU-PIManualRedEyeAutoCalculator"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke;
  v25[3] = &unk_1E5F2B268;
  v27 = &v28;
  v19 = v6;
  v26 = v19;
  [v18 submit:v25];
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if ([(id)v29[5] count])
  {
    self->_isModelChangeLocal = 1;
    v20 = [(PUPhotoEditToolController *)self compositionController];
    v21 = [(PUPhotoEditToolController *)self compositionController];
    v22 = [v21 adjustmentConstants];
    v23 = [v22 PIRedEyeAdjustmentKey];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke_2;
    v24[3] = &unk_1E5F2B290;
    v24[4] = &v28;
    [v20 modifyAdjustmentWithKey:v23 modificationBlock:v24];

    self->_isModelChangeLocal = 0;
  }
  else
  {
    -[PURedeyeToolController _showChangeIndicatorAtPoint:isFailure:](self, "_showChangeIndicatorAtPoint:isFailure:", 1, v15, v17);
    [(PURedeyeToolController *)self _animateFailureAppearance];
  }

  _Block_object_dispose(&v28, 8);
}

void __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v8 = 0;
  v3 = [a2 result:&v8];
  id v4 = v8;
  uint64_t v5 = [v3 valueForKey:@"inputCorrectionInfo"];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 setEnabled:1];
  v3 = [v8 inputCorrectionInfo];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v6 = v5;

  v7 = [v6 arrayByAddingObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  [v8 setInputCorrectionInfo:v7];
}

- (BOOL)_removeCorrectionAtPoint:(CGPoint)a3
{
  id v4 = [(PUPhotoEditToolController *)self delegate];
  [v4 toolControllerOriginalImageSize:self];
  double v6 = v5;

  v7 = self->_knownCorrections;
  uint64_t v8 = [(NSMutableArray *)v7 count];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = 0;
    double v11 = 2.0;
    uint64_t v12 = v8;
    do
    {
      v13 = [(NSMutableArray *)v7 objectAtIndex:v10];
      v14 = [v13 objectForKey:@"repairRectangleMinimumX"];

      if (v14)
      {
        double v15 = [v13 objectForKey:@"repairRectangleMinimumX"];
        [v15 doubleValue];

        double v16 = [v13 objectForKey:@"repairRectangleMaximumX"];
        [v16 doubleValue];

        double v17 = [v13 objectForKey:@"repairRectangleMaximumY"];
        [v17 doubleValue];

        v18 = [v13 objectForKey:@"repairRectangleMinimumY"];
        [v18 doubleValue];

        UIDistanceBetweenPointAndRect();
      }
      else
      {
        [(PURedeyeToolController *)self _extractRedEyePointFromCorrectionDictionary:v13];
        UIDistanceBetweenPoints();
      }
      if (v19 < 15.0 / v6 && v19 < v11)
      {
        double v11 = v19;
        uint64_t v12 = v10;
      }

      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v12 != v9)
  {
    self->_isModelChangeLocal = 1;
    v20 = -[NSMutableArray subarrayWithRange:](v7, "subarrayWithRange:", v12, 1);
    v21 = [(PUPhotoEditToolController *)self compositionController];
    v22 = [(PUPhotoEditToolController *)self compositionController];
    v23 = [v22 adjustmentConstants];
    v24 = [v23 PIRedEyeAdjustmentKey];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __51__PURedeyeToolController__removeCorrectionAtPoint___block_invoke;
    v27[3] = &unk_1E5F2B240;
    id v28 = v20;
    id v25 = v20;
    [v21 modifyAdjustmentWithKey:v24 modificationBlock:v27];

    self->_isModelChangeLocal = 0;
  }

  return v12 != v9;
}

void __51__PURedeyeToolController__removeCorrectionAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 inputCorrectionInfo];
  id v6 = (id)[v4 mutableCopy];

  [v6 removeObjectsInArray:*(void *)(a1 + 32)];
  double v5 = (void *)[v6 copy];
  [v3 setInputCorrectionInfo:v5];
}

- (void)_handleRedeyeButton:(id)a3
{
  id v4 = [(PUPhotoEditToolController *)self delegate];
  [v4 toolControllerDidFinish:self];
}

- (void)_animateInstructionAppearance
{
  if (!self->_failureAnimationIsInProgress)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__animateInstructionAppearance object:0];
    self->_failureAnimationIsInProgress = 1;
    [(CEKBadgeTextView *)self->_instructionLabel setHidden:0];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__PURedeyeToolController__animateInstructionAppearance__block_invoke;
    v4[3] = &unk_1E5F2ED10;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PURedeyeToolController__animateInstructionAppearance__block_invoke_2;
    v3[3] = &unk_1E5F2CEE8;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:196608 delay:v4 options:v3 animations:0.3 completion:0.0];
  }
}

uint64_t __55__PURedeyeToolController__animateInstructionAppearance__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1192);
  return [v2 setAlpha:0.0];
}

uint64_t __55__PURedeyeToolController__animateInstructionAppearance__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1192) setHidden:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 1224) = 0;
  return result;
}

- (void)_animateFailureAppearance
{
  if (!self->_failureAnimationIsInProgress)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__animateInstructionAppearance object:0];
    self->_failureAnimationIsInProgress = 1;
    [(CEKBadgeTextView *)self->_failureLabel setHidden:0];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__PURedeyeToolController__animateFailureAppearance__block_invoke;
    v4[3] = &unk_1E5F2ED10;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __51__PURedeyeToolController__animateFailureAppearance__block_invoke_2;
    v3[3] = &unk_1E5F2CEE8;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3 completion:0.1];
  }
}

uint64_t __51__PURedeyeToolController__animateFailureAppearance__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1192);
  return [v2 setAlpha:1.0];
}

uint64_t __51__PURedeyeToolController__animateFailureAppearance__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) setHidden:1];
  uint64_t result = [*(id *)(a1 + 32) performSelector:sel__animateInstructionAppearance withObject:0 afterDelay:3.0];
  *(unsigned char *)(*(void *)(a1 + 32) + 1224) = 0;
  return result;
}

- (void)_showChangeIndicatorAtPoint:(CGPoint)a3 isFailure:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v9 = [v8 toolControllerPreviewView:self];

  uint64_t v10 = [(PUPhotoEditToolController *)self delegate];
  [v10 toolControllerOriginalImageSize:self];
  double v12 = v11;
  double v14 = v13;

  double v15 = [(PUPhotoEditToolController *)self delegate];
  objc_msgSend(v15, "toolController:viewPointFromOriginalPoint:view:", self, v9, x * v12, y * v14);
  double v17 = v16;
  double v19 = v18;

  [v9 bounds];
  v26.double x = v17;
  v26.double y = v19;
  if (CGRectContainsPoint(v27, v26))
  {
    BOOL v20 = v4;
    if (v4) {
      double v21 = 0.0;
    }
    else {
      double v21 = 0.5;
    }
    v22 = objc_alloc_init(PURedEyeIndicatorView);
    [(PURedEyeIndicatorView *)v22 setAnimationType:v20];
    -[PURedEyeIndicatorView setCenter:](v22, "setCenter:", v17, v19);
    [v9 addSubview:v22];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__PURedeyeToolController__showChangeIndicatorAtPoint_isFailure___block_invoke;
    v24[3] = &unk_1E5F2ED10;
    id v25 = v22;
    v23 = v22;
    [(PURedEyeIndicatorView *)v23 animateWithDelay:v24 completion:v21];
  }
}

uint64_t __64__PURedeyeToolController__showChangeIndicatorAtPoint_isFailure___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_loadCorrectionsFromModelAnimated:(BOOL)a3
{
  BOOL v29 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v5 = [(PUPhotoEditToolController *)self compositionController];

  if (!v5)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"PURedeyeToolController.m" lineNumber:325 description:@"Need a composition to perform this operation"];
  }
  uint64_t v30 = [(PUPhotoEditToolController *)self compositionController];
  id v6 = [v30 redEyeAdjustmentController];
  v7 = [v6 inputCorrectionInfo];
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v9 = self->_knownCorrections;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        if (([v7 containsObject:v14] & 1) == 0) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v11);
  }

  knownCorrections = self->_knownCorrections;
  double v16 = [v8 allObjects];
  [(NSMutableArray *)knownCorrections removeObjectsInArray:v16];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        if (([(NSMutableArray *)self->_knownCorrections containsObject:v22] & 1) == 0)
        {
          [(NSMutableArray *)self->_knownCorrections addObject:v22];
          [v8 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v19);
  }

  if (v29)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v8;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          [(PURedeyeToolController *)self _extractRedEyePointFromCorrectionDictionary:*(void *)(*((void *)&v31 + 1) + 8 * k)];
          -[PURedeyeToolController _showChangeIndicatorAtPoint:isFailure:](self, "_showChangeIndicatorAtPoint:isFailure:", 0);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v25);
    }
  }
}

- (void)flashAutoRedEyeCorrections
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPhotoEditToolController *)self compositionController];
  BOOL v4 = [v3 redEyeAdjustmentController];
  double v5 = [v4 inputCorrectionInfo];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PURedeyeToolController *)self _extractRedEyePointFromCorrectionDictionary:*(void *)(*((void *)&v10 + 1) + 8 * v9)];
        -[PURedeyeToolController _showChangeIndicatorAtPoint:isFailure:](self, "_showChangeIndicatorAtPoint:isFailure:", 0);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (CGPoint)_extractRedEyePointFromCorrectionDictionary:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKeyedSubscript:@"repairRectangleMinimumX"];

  if (v4)
  {
    double v5 = [v3 objectForKey:@"repairRectangleMinimumX"];
    [v5 doubleValue];
    double v7 = v6;
    uint64_t v8 = [v3 objectForKey:@"repairRectangleMaximumX"];
    [v8 doubleValue];
    double v10 = (v7 + v9) * 0.5;

    long long v11 = [v3 objectForKey:@"repairRectangleMinimumY"];
    [v11 doubleValue];
    double v13 = v12;
    uint64_t v14 = [v3 objectForKey:@"repairRectangleMaximumY"];
    [v14 doubleValue];
    double v16 = (v13 + v15) * 0.5;

    goto LABEL_8;
  }
  id v17 = [v3 objectForKeyedSubscript:@"pointX"];

  if (v17)
  {
    uint64_t v18 = [v3 objectForKey:@"pointX"];
    [v18 doubleValue];
    double v10 = v19;

    uint64_t v20 = [v3 objectForKey:@"pointY"];
LABEL_7:
    long long v11 = v20;
    [v20 doubleValue];
    double v16 = v24;
    goto LABEL_8;
  }
  double v21 = [v3 objectForKeyedSubscript:@"px"];

  if (v21)
  {
    uint64_t v22 = [v3 objectForKeyedSubscript:@"px"];
    [v22 doubleValue];
    double v10 = v23;

    uint64_t v20 = [v3 objectForKeyedSubscript:@"py"];
    goto LABEL_7;
  }
  CGRect v27 = (double *)MEMORY[0x1E4F1DAD8];
  long long v11 = PLUIGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Red-eye repair dictionary is of unknown type", v28, 2u);
  }
  double v10 = *v27;
  double v16 = v27[1];
LABEL_8:

  double v25 = v10;
  double v26 = v16;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapGestureRecognizer == v4)
  {
    double v6 = [(PUPhotoEditToolController *)self delegate];
    double v7 = [v6 toolControllerPreviewView:self];

    if (v7)
    {
      uint64_t v8 = [v7 superview];
      [(UITapGestureRecognizer *)v4 locationInView:v8];
      CGFloat v10 = v9;
      CGFloat v12 = v11;

      [v7 frame];
      v14.double x = v10;
      v14.double y = v12;
      BOOL v5 = CGRectContainsPoint(v15, v14);
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_handleTapGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PURedeyeToolController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  CGFloat v10 = [(PUPhotoEditToolController *)self delegate];
  double v11 = [(PURedeyeToolController *)self view];
  objc_msgSend(v10, "toolController:originalPointFromViewPoint:view:", self, v11, v7, v9);
  double v13 = v12;
  double v15 = v14;

  if (!-[PURedeyeToolController _removeCorrectionAtPoint:](self, "_removeCorrectionAtPoint:", v13, v15))
  {
    -[PURedeyeToolController _correctRedEyeAtPoint:](self, "_correctRedEyeAtPoint:", v13, v15);
  }
}

- (int64_t)toolControllerTag
{
  return 1006;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PURedeyeToolController;
  [(PUPhotoEditToolController *)&v8 setLayoutOrientation:a3 withTransitionCoordinator:a4];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_instructionLabelConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_failureLabelConstraints];
  instructionLabelConstraints = self->_instructionLabelConstraints;
  self->_instructionLabelConstraints = 0;

  failureLabelConstraints = self->_failureLabelConstraints;
  self->_failureLabelConstraints = 0;

  double v7 = [(PURedeyeToolController *)self view];
  [v7 setNeedsUpdateConstraints];
}

- (id)selectedToolbarIconGlyphName
{
  return @"eye.slash";
}

- (id)toolbarIconGlyphName
{
  return @"eye.slash";
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolController;
  [(PUPhotoEditToolController *)&v4 compositionControllerDidChangeForAdjustments:a3];
  [(PURedeyeToolController *)self _loadCorrectionsFromModelAnimated:self->_isModelChangeLocal];
}

- (id)centerToolbarView
{
  v2 = +[PUInterfaceManager currentTheme];
  id v3 = PULocalizedString(@"PHOTOEDIT_REDEYE_TOP_LABEL");
  objc_super v4 = [v3 localizedUppercaseString];

  BOOL v5 = [v2 photoEditingTopToolbarToolLabelButtonColor];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setText:v4];
  [v6 setTextColor:v5];
  double v7 = [v2 topToolbarToolLabelFont];
  [v6 setFont:v7];

  return v6;
}

- (id)localizedName
{
  return PULocalizedString(@"PHOTOEDIT_REDEYE_TOOL_BUTTON");
}

- (void)didResignActiveTool
{
  v3.receiver = self;
  v3.super_class = (Class)PURedeyeToolController;
  [(PUPhotoEditToolController *)&v3 didResignActiveTool];
  [(NSMutableArray *)self->_knownCorrections removeAllObjects];
}

- (void)updateViewConstraints
{
  v46[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PUPhotoEditToolController *)self delegate];
  objc_super v4 = [v3 toolControllerMainContainerView:self];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(PURedeyeToolController *)self view];
  }
  id v6 = v5;
  uint64_t v7 = [(PUPhotoEditToolController *)self toolContainerView];
  objc_super v8 = (void *)v7;
  if (!self->_instructionLabelConstraints)
  {
    long long v41 = (void *)v7;
    double v9 = [MEMORY[0x1E4F1CA48] array];
    [(CEKBadgeTextView *)self->_instructionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    CGFloat v10 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v42 = [v10 currentLayoutStyle];

    double v11 = [(CEKBadgeTextView *)self->_instructionLabel widthAnchor];
    double v12 = [(PURedeyeToolController *)self view];
    double v13 = [v12 widthAnchor];
    double v14 = [v11 constraintLessThanOrEqualToAnchor:v13];
    v44 = v9;
    [(NSArray *)v9 addObject:v14];

    double v15 = [(CEKBadgeTextView *)self->_instructionLabel centerXAnchor];
    double v16 = [v6 centerXAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    uint64_t v18 = (void *)v17;
    if (v42 == 4)
    {
      v46[0] = v17;
      long long v40 = [(CEKBadgeTextView *)self->_instructionLabel bottomAnchor];
      double v19 = [v6 bottomAnchor];
      [v40 constraintEqualToAnchor:v19 constant:-27.0];
      v43 = v4;
      v21 = uint64_t v20 = v6;
      v46[1] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
      [(NSArray *)v9 addObjectsFromArray:v22];

      id v6 = v20;
      objc_super v4 = v43;
    }
    else
    {
      [(NSArray *)v9 addObject:v17];

      int64_t v23 = [(PUPhotoEditToolController *)self layoutOrientation];
      if (v23 != 2)
      {
        objc_super v8 = v41;
        if (v23 == 1)
        {
          double v24 = [(CEKBadgeTextView *)self->_instructionLabel centerYAnchor];
          double v25 = [v41 bottomAnchor];
          double v26 = [v24 constraintEqualToAnchor:v25 constant:-33.0];
          [(NSArray *)v9 addObject:v26];
        }
        goto LABEL_12;
      }
      double v15 = [(CEKBadgeTextView *)self->_instructionLabel bottomAnchor];
      double v16 = [(PURedeyeToolController *)self view];
      uint64_t v18 = [v16 safeAreaLayoutGuide];
      CGRect v27 = [v18 bottomAnchor];
      id v28 = [v15 constraintEqualToAnchor:v27 constant:-6.0];
      [(NSArray *)v44 addObject:v28];

      double v9 = v44;
    }

    objc_super v8 = v41;
LABEL_12:
    [MEMORY[0x1E4F28DC8] activateConstraints:v9];
    instructionLabelConstraints = self->_instructionLabelConstraints;
    self->_instructionLabelConstraints = v9;
  }
  if (!self->_failureLabelConstraints)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = v6;
    [(CEKBadgeTextView *)self->_failureLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    long long v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_failureLabel attribute:9 relatedBy:0 toItem:self->_instructionLabel attribute:9 multiplier:1.0 constant:0.0];
    [(NSArray *)v30 addObject:v32];

    long long v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_failureLabel attribute:10 relatedBy:0 toItem:self->_instructionLabel attribute:10 multiplier:1.0 constant:0.0];
    [(NSArray *)v30 addObject:v33];

    long long v34 = (void *)MEMORY[0x1E4F28DC8];
    failureLabel = self->_failureLabel;
    long long v36 = [(PURedeyeToolController *)self view];
    long long v37 = failureLabel;
    id v6 = v31;
    long long v38 = [v34 constraintWithItem:v37 attribute:7 relatedBy:-1 toItem:v36 attribute:7 multiplier:1.0 constant:0.0];
    [(NSArray *)v30 addObject:v38];

    [MEMORY[0x1E4F28DC8] activateConstraints:v30];
    failureLabelConstraints = self->_failureLabelConstraints;
    self->_failureLabelConstraints = v30;
  }
  v45.receiver = self;
  v45.super_class = (Class)PURedeyeToolController;
  [(PURedeyeToolController *)&v45 updateViewConstraints];
}

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)PURedeyeToolController;
  [(PUPhotoEditToolController *)&v3 dealloc];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PURedeyeToolController;
  [(PUPhotoEditToolController *)&v6 viewDidDisappear:a3];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_instructionLabelConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_failureLabelConstraints];
  instructionLabelConstraints = self->_instructionLabelConstraints;
  self->_instructionLabelConstraints = 0;

  failureLabelConstraints = self->_failureLabelConstraints;
  self->_failureLabelConstraints = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PURedeyeToolController;
  [(PURedeyeToolController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(UITapGestureRecognizer *)self->_tapGestureRecognizer view];
  [v4 removeGestureRecognizer:self->_tapGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PURedeyeToolController;
  [(PUPhotoEditToolController *)&v9 viewWillAppear:a3];
  objc_super v4 = [(PUPhotoEditToolController *)self delegate];
  objc_super v5 = [v4 toolControllerHitEventForwardView:self];

  objc_super v6 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapGesture_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v6;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [v5 addGestureRecognizer:self->_tapGestureRecognizer];
  objc_super v8 = [(PURedeyeToolController *)self view];
  [v8 setNeedsUpdateConstraints];
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)PURedeyeToolController;
  [(PURedeyeToolController *)&v30 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F57D38]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  objc_super v8 = (CEKBadgeTextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v8;

  CGFloat v10 = self->_instructionLabel;
  double v11 = PULocalizedString(@"PHOTOEDIT_REDEYE_INSTRUCTION");
  [(CEKBadgeTextView *)v10 _setText:v11];

  double v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
  [(CEKBadgeTextView *)self->_instructionLabel _setContentColor:v12];

  double v13 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.8];
  [(CEKBadgeTextView *)self->_instructionLabel _setFillColor:v13];

  [MEMORY[0x1E4F57D38] _defaultTextInsets];
  double v15 = v14 + 3.0;
  double v17 = v16 + 3.0;
  double v19 = v18 + 1.0;
  double v21 = v20 + 1.0;
  -[CEKBadgeTextView _setTextInsets:](self->_instructionLabel, "_setTextInsets:", v20 + 1.0, v14 + 3.0, v18 + 1.0, v16 + 3.0);
  uint64_t v22 = [(PURedeyeToolController *)self view];
  [v22 addSubview:self->_instructionLabel];

  int64_t v23 = (CEKBadgeTextView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57D38]), "initWithFrame:", v4, v5, v6, v7);
  failureLabel = self->_failureLabel;
  self->_failureLabel = v23;

  double v25 = self->_failureLabel;
  double v26 = PULocalizedString(@"PHOTOEDIT_REDEYE_FAILURE");
  [(CEKBadgeTextView *)v25 _setText:v26];

  [(CEKBadgeTextView *)self->_failureLabel setHidden:1];
  [(CEKBadgeTextView *)self->_failureLabel setAlpha:0.0];
  -[CEKBadgeTextView _setTextInsets:](self->_failureLabel, "_setTextInsets:", v21, v15, v19, v17);
  CGRect v27 = [(CEKBadgeTextView *)self->_instructionLabel _contentColor];
  [(CEKBadgeTextView *)self->_failureLabel _setContentColor:v27];

  id v28 = [(CEKBadgeTextView *)self->_instructionLabel _fillColor];
  [(CEKBadgeTextView *)self->_failureLabel _setFillColor:v28];

  BOOL v29 = [(PURedeyeToolController *)self view];
  [v29 addSubview:self->_failureLabel];

  self->_failureAnimationIsInProgress = 0;
}

- (void)didBecomeActiveTool
{
  [(PURedeyeToolController *)self _loadCorrectionsFromModelAnimated:1];
  v3.receiver = self;
  v3.super_class = (Class)PURedeyeToolController;
  [(PUPhotoEditToolController *)&v3 didBecomeActiveTool];
}

- (PURedeyeToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PURedeyeToolController;
  double v4 = [(PUPhotoEditToolController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    knownCorrections = v4->_knownCorrections;
    v4->_knownCorrections = (NSMutableArray *)v5;

    double v7 = objc_alloc_init(PURedeyeToolControllerSpec);
    [(PUPhotoEditToolController *)v4 setToolControllerSpec:v7];
  }
  return v4;
}

@end