@interface PXMessagesStackPlaybackControlView
- (BOOL)_shouldPauseOnTap;
- (BOOL)_wantsButton;
- (BOOL)handleTapAtPoint:(CGPoint)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)clippingRect;
- (PXGDisplayAssetVideoPresentationController)videoController;
- (PXMessagesStackPlaybackControlUserData)userData;
- (PXMessagesStackPlaybackControlView)initWithFrame:(CGRect)a3;
- (PXMessagesStackPlaybackControlViewModel)viewModel;
- (void)_handleButton:(id)a3;
- (void)_updateButtonVisibility;
- (void)becomeReusable;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
- (void)setVideoController:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXMessagesStackPlaybackControlView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

- (PXGDisplayAssetVideoPresentationController)videoController
{
  return self->_videoController;
}

- (PXMessagesStackPlaybackControlViewModel)viewModel
{
  return self->_viewModel;
}

- (PXMessagesStackPlaybackControlUserData)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->clippingRect.origin.x;
  double y = self->clippingRect.origin.y;
  double width = self->clippingRect.size.width;
  double height = self->clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((void *)ViewModelObservationContext_242340 == a5)
  {
    if ((v6 & 4) == 0)
    {
      if ((v6 & 7) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    v10 = [(PXMessagesStackPlaybackControlView *)self viewModel];
    v17 = [v10 videoController];
    [(PXMessagesStackPlaybackControlView *)self setVideoController:v17];

LABEL_12:
LABEL_13:
    [(PXMessagesStackPlaybackControlView *)self _updateButtonVisibility];
    goto LABEL_14;
  }
  if ((void *)VideoControllerObservationContext != a5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PXMessagesStackPlaybackControlView.m" lineNumber:249 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x206) != 0)
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(PXMessagesStackPlaybackControlView *)self videoController];
      uint64_t v12 = [v11 actualPlayState];
      v13 = [(PXMessagesStackPlaybackControlView *)self videoController];
      int v14 = [v13 isAtEnd];
      v15 = @"NO";
      if (v14) {
        v15 = @"YES";
      }
      v16 = v15;
      int v19 = 134218242;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "[Stack Playback] Updated play state: %ld isAtEnd: %@", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_12;
  }
LABEL_14:
}

- (void)becomeReusable
{
  [(PXMessagesStackPlaybackControlView *)self setViewModel:0];
  [(PXMessagesStackPlaybackControlView *)self setVideoController:0];
  self->_itemIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  v3 = [(_PXMessagesStackPlayButton *)self->_button layer];
  [v3 removeAllAnimations];

  button = self->_button;
  [(_PXMessagesStackPlayButton *)button setHidden:1];
}

- (void)setUserData:(id)a3
{
  if (self->_userData != a3)
  {
    id v4 = a3;
    v5 = (PXMessagesStackPlaybackControlUserData *)[v4 copy];
    userData = self->_userData;
    self->_userData = v5;

    v7 = [v4 viewModel];
    [(PXMessagesStackPlaybackControlView *)self setViewModel:v7];

    v8 = [v4 viewModel];
    id v9 = [v8 videoController];
    [(PXMessagesStackPlaybackControlView *)self setVideoController:v9];

    int64_t v10 = [v4 itemIndex];
    self->_itemIndedouble x = v10;
    [(PXMessagesStackPlaybackControlView *)self _updateButtonVisibility];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackPlaybackControlView;
  [(PXMessagesStackPlaybackControlView *)&v3 layoutSubviews];
  [(PXMessagesStackPlaybackControlView *)self bounds];
  PXRectGetCenter();
}

- (void)_handleButton:(id)a3
{
  id v4 = [(PXMessagesStackPlaybackControlView *)self viewModel];
  uint64_t v5 = [v4 currentItem];
  itemIndedouble x = self->_itemIndex;

  if (v5 == itemIndex)
  {
    v7 = [(PXMessagesStackPlaybackControlView *)self videoController];
    char v8 = [v7 isAtEnd];

    if ((v8 & 1) != 0
      || ([(PXMessagesStackPlaybackControlView *)self videoController],
          id v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 desiredPlayState],
          v9,
          v10 != 1))
    {
      v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "[Stack Playback] Attempting to start video playback due to play button tap", buf, 2u);
      }
    }
    uint64_t v12 = [(PXMessagesStackPlaybackControlView *)self videoController];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__PXMessagesStackPlaybackControlView__handleButton___block_invoke;
    v13[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
    char v14 = v8;
    [v12 performChanges:v13];
  }
}

void __52__PXMessagesStackPlaybackControlView__handleButton___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    [v3 seekToBeginning];
    id v3 = v4;
  }
  [v3 setDesiredPlayState:1];
}

- (void)_updateButtonVisibility
{
  BOOL v3 = [(PXMessagesStackPlaybackControlView *)self _wantsButton];
  [(PXMessagesStackPlaybackControlView *)self setUserInteractionEnabled:v3];
  int v4 = [(_PXMessagesStackPlayButton *)self->_button isHidden];
  if (v3)
  {
    if (v4)
    {
      [(_PXMessagesStackPlayButton *)self->_button setHidden:0];
      uint64_t v5 = [(PXMessagesStackPlaybackControlView *)self viewModel];
      uint64_t v6 = [v5 currentItem];
      itemIndedouble x = self->_itemIndex;

      button = self->_button;
      if (v6 == itemIndex)
      {
        [(_PXMessagesStackPlayButton *)button setAlpha:0.0];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __61__PXMessagesStackPlaybackControlView__updateButtonVisibility__block_invoke;
        v11[3] = &unk_1E5DD36F8;
        v11[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.3];
      }
      else
      {
        [(_PXMessagesStackPlayButton *)button setAlpha:1.0];
      }
    }
  }
  else if ((v4 & 1) == 0)
  {
    id v9 = [(_PXMessagesStackPlayButton *)self->_button layer];
    [v9 removeAllAnimations];

    uint64_t v10 = self->_button;
    [(_PXMessagesStackPlayButton *)v10 setHidden:1];
  }
}

uint64_t __61__PXMessagesStackPlaybackControlView__updateButtonVisibility__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

- (BOOL)_wantsButton
{
  BOOL v3 = [(PXMessagesStackPlaybackControlView *)self videoController];
  if ([v3 desiredPlayState] == 1) {
    int v4 = [v3 isAtEnd];
  }
  else {
    int v4 = 1;
  }
  uint64_t v5 = [(PXMessagesStackPlaybackControlView *)self viewModel];
  uint64_t v6 = [v5 currentItem];
  itemIndedouble x = self->_itemIndex;
  unint64_t v8 = v6 - itemIndex;
  if (v6 - itemIndex < 0) {
    unint64_t v8 = itemIndex - v6;
  }
  if (!v4) {
    goto LABEL_11;
  }
  if (v6 != itemIndex)
  {
    if (v8 <= 1)
    {
      int v9 = [v5 isSettled] ^ 1;
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v9) = 0;
    goto LABEL_12;
  }
  LOBYTE(v9) = 1;
LABEL_12:

  return v9;
}

- (void)setVideoController:(id)a3
{
  uint64_t v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  videoController = self->_videoController;
  if (videoController != v5)
  {
    v7 = v5;
    [(PXGDisplayAssetVideoPresentationController *)videoController unregisterChangeObserver:self context:VideoControllerObservationContext];
    objc_storeStrong((id *)&self->_videoController, a3);
    [(PXGDisplayAssetVideoPresentationController *)self->_videoController registerChangeObserver:self context:VideoControllerObservationContext];
    uint64_t v5 = v7;
  }
}

- (void)setViewModel:(id)a3
{
  uint64_t v5 = (PXMessagesStackPlaybackControlViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    [(PXMessagesStackPlaybackControlViewModel *)viewModel unregisterChangeObserver:self context:ViewModelObservationContext_242340];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXMessagesStackPlaybackControlViewModel *)self->_viewModel registerChangeObserver:self context:ViewModelObservationContext_242340];
    uint64_t v5 = v7;
  }
}

- (BOOL)handleTapAtPoint:(CGPoint)a3
{
  -[PXMessagesStackPlaybackControlView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  int v4 = (_PXMessagesStackPlayButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;

  if (v4 == button)
  {
    [(PXMessagesStackPlaybackControlView *)self _handleButton:self->_button];
LABEL_7:
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v6 = [(PXMessagesStackPlaybackControlView *)self _shouldPauseOnTap];
  if (v6)
  {
    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[Stack Playback] Attempting to pause video playback due to tap on playing item", v10, 2u);
    }

    unint64_t v8 = [(PXMessagesStackPlaybackControlView *)self videoController];
    [v8 performChanges:&__block_literal_global_242358];

    goto LABEL_7;
  }
  return v6;
}

uint64_t __55__PXMessagesStackPlaybackControlView_handleTapAtPoint___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:0];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PXMessagesStackPlaybackControlView;
  if (-[PXMessagesStackPlaybackControlView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y))
  {
    if ([(PXMessagesStackPlaybackControlView *)self _shouldPauseOnTap])
    {
      char v8 = 1;
    }
    else
    {
      -[_PXMessagesStackPlayButton convertPoint:fromView:](self->_button, "convertPoint:fromView:", self, x, y);
      char v8 = -[_PXMessagesStackPlayButton pointInside:withEvent:](self->_button, "pointInside:withEvent:", v7);
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldPauseOnTap
{
  if ([(PXMessagesStackPlaybackControlView *)self _wantsButton]) {
    return 0;
  }
  int v4 = [(PXMessagesStackPlaybackControlView *)self videoController];
  BOOL v3 = [v4 desiredPlayState] == 1;

  return v3;
}

- (PXMessagesStackPlaybackControlView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXMessagesStackPlaybackControlView;
  BOOL v3 = -[PXMessagesStackPlaybackControlView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    int v4 = [_PXMessagesStackPlayButton alloc];
    uint64_t v5 = -[_PXMessagesStackPlayButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_PXMessagesStackPlayButton *)v5 setHidden:1];
    button = v3->_button;
    v3->_button = v5;
    id v7 = v5;

    [(_PXMessagesStackPlayButton *)v3->_button addTarget:v3 action:sel__handleButton_ forControlEvents:64];
    [(PXMessagesStackPlaybackControlView *)v3 addSubview:v7];

    v3->_itemIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

@end