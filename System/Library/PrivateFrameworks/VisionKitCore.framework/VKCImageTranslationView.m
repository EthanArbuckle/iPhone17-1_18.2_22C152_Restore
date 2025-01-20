@interface VKCImageTranslationView
- (BOOL)translationNeedsUpdate;
- (LTUIVisualTranslationView)visualTranslationView;
- (UIView)presentationAnchorView;
- (UIView)translationContainerView;
- (VKCImageTranslationView)init;
- (VKCVisualSearchResult)visualSearchResult;
- (id)recognizedLines;
- (void)checkForTranslationResultsWithCompletion:(id)a3;
- (void)hideTranslationOverlay;
- (void)setContentsRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPresentationAnchorView:(id)a3;
- (void)setRecognitionResult:(id)a3;
- (void)setTranslationContainerView:(id)a3;
- (void)setTranslationNeedsUpdate:(BOOL)a3;
- (void)setVisualSearchResult:(id)a3;
- (void)setVisualTranslationView:(id)a3;
- (void)showTranslationOverlay;
@end

@implementation VKCImageTranslationView

- (VKCImageTranslationView)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKCImageTranslationView;
  v2 = [(VKCImageTranslationView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    -[VKCImageBaseOverlayView setNormalizedVisibleRect:](v2, "setNormalizedVisibleRect:", 0.0, 0.0, 1.0, 1.0);
    v3->_translationNeedsUpdate = 1;
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(VKCImageTranslationView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    translationContainerView = v3->_translationContainerView;
    v3->_translationContainerView = (UIView *)v5;

    [(VKCImageTranslationView *)v3 addSubview:v3->_translationContainerView];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VKCImageTranslationView;
  -[VKCImageTranslationView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(VKCImageTranslationView *)self translationContainerView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)setContentsRect:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VKCImageTranslationView;
  -[VKCImageBaseOverlayView setContentsRect:](&v13, sel_setContentsRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(VKCImageTranslationView *)self translationContainerView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)checkForTranslationResultsWithCompletion:(id)a3
{
  id v4 = a3;
  if (vk_isSeedBuild()
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 BOOLForKey:@"DebugVisionKitCatalystTranslation"],
        v5,
        !v6))
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else
  {
    id LTUIVisualTranslationViewClass = getLTUIVisualTranslationViewClass();
    double v8 = [(VKCImageTranslationView *)self recognizedLines];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__VKCImageTranslationView_checkForTranslationResultsWithCompletion___block_invoke;
    v9[3] = &unk_1E6BF14D8;
    id v10 = v4;
    [LTUIVisualTranslationViewClass isTranslatable:v8 completion:v9];
  }
}

uint64_t __68__VKCImageTranslationView_checkForTranslationResultsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showTranslationOverlay
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_visualTranslationView)
  {
    v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Creating Translation overlay View: %@", buf, 0xCu);
    }

    getLTUIVisualTranslationViewClass();
    id v4 = (LTUIVisualTranslationView *)objc_opt_new();
    visualTranslationView = self->_visualTranslationView;
    self->_visualTranslationView = v4;

    int v6 = [(VKCImageTranslationView *)self presentationAnchorView];
    double v7 = [(VKCImageTranslationView *)self visualTranslationView];
    [v7 setPresentationAnchorView:v6];

    double v8 = [(VKCImageTranslationView *)self visualTranslationView];
    double v9 = [v8 superview];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(VKCImageTranslationView *)self visualTranslationView];
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
  }
  v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl(&dword_1DB266000, v19, OS_LOG_TYPE_DEFAULT, "Activating Translation overlay: %@", buf, 0xCu);
  }

  if (self->_translationNeedsUpdate)
  {
    objc_initWeak((id *)buf, self);
    v20 = [(VKCImageTranslationView *)self visualTranslationView];
    v21 = [(VKCImageTranslationView *)self recognizedLines];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__VKCImageTranslationView_showTranslationOverlay__block_invoke;
    v24[3] = &unk_1E6BF1500;
    objc_copyWeak(&v25, (id *)buf);
    v24[4] = self;
    [v20 translate:v21 completion:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v22 = [(VKCImageTranslationView *)self translationContainerView];
    v23 = [(VKCImageTranslationView *)self visualTranslationView];
    [v22 addSubview:v23];
  }
}

void __49__VKCImageTranslationView_showTranslationOverlay__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    double v5 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setTranslationNeedsUpdate:0];

    objc_msgSend(*(id *)(a1 + 32), "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [*(id *)(a1 + 32) visualTranslationView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    id v19 = objc_loadWeakRetained(v5);
    double v16 = [v19 translationContainerView];
    id v17 = objc_loadWeakRetained(v5);
    v18 = [v17 visualTranslationView];
    [v16 addSubview:v18];
  }
}

- (id)recognizedLines
{
  v2 = [(VKCImageBaseOverlayView *)self recognitionResult];
  uint64_t v3 = [v2 sourceVNDocument];

  id v4 = objc_msgSend(v3, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);

  return v4;
}

- (void)hideTranslationOverlay
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Hiding Translation overlay %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(VKCImageTranslationView *)self visualTranslationView];
  [v4 dismiss];
}

- (void)setRecognitionResult:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageTranslationView;
  [(VKCImageBaseOverlayView *)&v4 setRecognitionResult:a3];
  [(VKCImageTranslationView *)self setTranslationNeedsUpdate:1];
}

- (void)setPresentationAnchorView:(id)a3
{
}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (void)setVisualSearchResult:(id)a3
{
}

- (LTUIVisualTranslationView)visualTranslationView
{
  return self->_visualTranslationView;
}

- (void)setVisualTranslationView:(id)a3
{
}

- (UIView)presentationAnchorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationAnchorView);
  return (UIView *)WeakRetained;
}

- (BOOL)translationNeedsUpdate
{
  return self->_translationNeedsUpdate;
}

- (void)setTranslationNeedsUpdate:(BOOL)a3
{
  self->_translationNeedsUpdate = a3;
}

- (UIView)translationContainerView
{
  return self->_translationContainerView;
}

- (void)setTranslationContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationContainerView, 0);
  objc_destroyWeak((id *)&self->_presentationAnchorView);
  objc_storeStrong((id *)&self->_visualTranslationView, 0);
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
}

@end