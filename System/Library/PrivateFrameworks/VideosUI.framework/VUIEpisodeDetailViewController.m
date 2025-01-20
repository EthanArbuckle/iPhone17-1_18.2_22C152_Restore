@interface VUIEpisodeDetailViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (VUIEpisodeDetailView)detailView;
- (VUIEpisodeDetailViewController)initWithMediaItem:(id)a3;
- (VUIEpisodeDetailViewControllerDelegate)delegate;
- (VUIMediaItem)mediaItem;
- (VUIViewControllerContentPresenter)contentPresenter;
- (void)_configureNavigationBar;
- (void)dealloc;
- (void)didTapPlay;
- (void)dismissPopover;
- (void)dismissTapped:(id)a3;
- (void)loadView;
- (void)reportMetricsPageEvent;
- (void)setContentPresenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailView:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIEpisodeDetailViewController

- (VUIEpisodeDetailViewController)initWithMediaItem:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIEpisodeDetailViewController;
  v6 = [(VUIEpisodeDetailViewController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaItem, a3);
    v8 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v8;

    [(VUIViewControllerContentPresenter *)v7->_contentPresenter setLogName:@"VUIEpisodeDetailViewController"];
    objc_initWeak(&location, v7);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__VUIEpisodeDetailViewController_initWithMediaItem___block_invoke;
    v13[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v14, &location);
    id v11 = (id)[(VUIEpisodeDetailViewController *)v7 registerForTraitChanges:v10 withHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __52__VUIEpisodeDetailViewController_initWithMediaItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained view];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  v6 = [WeakRetained detailView];
  v7 = [WeakRetained mediaItem];
  +[VUIEpisodeDetailView configureEpisodeDetailView:withMedia:viewSize:](VUIEpisodeDetailView, "configureEpisodeDetailView:withMedia:viewSize:", v6, v7, v3, v5);

  v8 = [WeakRetained detailView];
  objc_msgSend(v8, "sizeThatFits:", v3, v5);
  double v10 = v9;
  double v12 = v11;

  v13 = [WeakRetained detailView];
  objc_msgSend(v13, "setContentSize:", v10, v12);
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIEpisodeDetailViewController;
  [(VUIEpisodeDetailViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)VUIEpisodeDetailViewController;
  [(VUIEpisodeDetailViewController *)&v16 viewDidLoad];
  [(VUIEpisodeDetailViewController *)self _configureNavigationBar];
  double v3 = [(VUIEpisodeDetailViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];
  objc_super v4 = [VUIEpisodeDetailView alloc];
  double v5 = -[VUIEpisodeDetailView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  detailView = self->_detailView;
  self->_detailView = v5;

  [(VUIEpisodeDetailView *)self->_detailView setEpisodeViewDelegate:self];
  v7 = [(VUIEpisodeDetailViewController *)self contentPresenter];
  [v7 setContentView:self->_detailView];

  v8 = [(VUIEpisodeDetailViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  +[VUIEpisodeDetailView configureEpisodeDetailView:withMedia:viewSize:](VUIEpisodeDetailView, "configureEpisodeDetailView:withMedia:viewSize:", self->_detailView, self->_mediaItem, v10, v12);
  v13 = [(VUIEpisodeDetailViewController *)self contentPresenter];
  [v13 setCurrentContentViewType:3];

  id v14 = [(VUIEpisodeDetailViewController *)self view];
  v15 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"EpisodeDetail\""];
  [v14 setAccessibilityIdentifier:v15];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUIEpisodeDetailViewController;
  [(VUIEpisodeDetailViewController *)&v8 viewDidAppear:a3];
  if (!self->_tapGestureRecognizer)
  {
    objc_super v4 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_dismissTapped_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v4;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
    v6 = [(VUIEpisodeDetailViewController *)self view];
    v7 = [v6 window];
    [v7 addGestureRecognizer:self->_tapGestureRecognizer];
  }
  [(VUIEpisodeDetailViewController *)self reportMetricsPageEvent];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUIEpisodeDetailViewController;
  [(VUIEpisodeDetailViewController *)&v7 viewWillDisappear:a3];
  if (self->_tapGestureRecognizer)
  {
    objc_super v4 = [(VUIEpisodeDetailViewController *)self view];
    double v5 = [v4 window];
    [v5 removeGestureRecognizer:self->_tapGestureRecognizer];

    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIEpisodeDetailViewController;
  id v7 = a4;
  -[VUIEpisodeDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__VUIEpisodeDetailViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF4CD8;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __85__VUIEpisodeDetailViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureNavigationBar];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)VUIEpisodeDetailViewController;
  [(VUIEpisodeDetailViewController *)&v4 loadView];
  double v3 = [(VUIEpisodeDetailViewController *)self contentPresenter];
  [v3 setRootViewForViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUIEpisodeDetailViewController;
  [(VUIEpisodeDetailViewController *)&v5 viewWillLayoutSubviews];
  double v3 = [(VUIEpisodeDetailViewController *)self contentPresenter];
  objc_super v4 = [(VUIEpisodeDetailViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");
}

- (void)reportMetricsPageEvent
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)dismissTapped:(id)a3
{
  id v19 = a3;
  if ([v19 state] == 3)
  {
    objc_super v4 = [(VUIEpisodeDetailViewController *)self view];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    v13 = [(VUIEpisodeDetailViewController *)self view];
    [v19 locationInView:v13];
    v21.x = v14;
    v21.y = v15;
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.double width = v10;
    v22.size.double height = v12;
    BOOL v16 = CGRectContainsPoint(v22, v21);

    if (!v16)
    {
      v17 = [(VUIEpisodeDetailViewController *)self view];
      v18 = [v17 window];
      [v18 removeGestureRecognizer:v19];

      [(VUIEpisodeDetailViewController *)self dismissPopover];
    }
  }
}

- (void)didTapPlay
{
  double v3 = self->_mediaItem;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke;
  aBlock[3] = &unk_1E6DF3D58;
  objc_super v4 = v3;
  CGFloat v10 = v4;
  double v5 = (void (**)(void))_Block_copy(aBlock);
  CGFloat v6 = [(VUIEpisodeDetailViewController *)self presentingViewController];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_36;
    v7[3] = &unk_1E6DF3DD0;
    CGFloat v8 = v5;
    [(VUIEpisodeDetailViewController *)self dismissViewControllerAnimated:1 completion:v7];
  }
  else
  {
    v5[2](v5);
  }
}

void __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v2 = [*v1 videosPlayable];
      double v3 = [VUIMediaInfo alloc];
      v12[0] = v2;
      objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      double v5 = [(VUIMediaInfo *)v3 initWithPlaybackContext:3 videosPlayables:v4 imageProxies:0 storeDictionary:0];

      CGFloat v6 = [MEMORY[0x1E4F1C9C8] date];
      [v5 setUserPlaybackInitiationDate:v6 openURLCompletionDate:0];

      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      double v7 = [VUIMediaInfo alloc];
      id v11 = *v1;
      CGFloat v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      double v5 = [(VUIMediaInfo *)v7 initWithPlaybackContext:3 vuiMediaItems:v8];

      [v5 setIntent:1];
      [v5 setAutomaticPlaybackStart:0];
      if (!v5)
      {
LABEL_10:
        double v5 = VUIDefaultLogObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_2((uint64_t *)v1, v5);
        }
        goto LABEL_12;
      }
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_2;
    v9[3] = &unk_1E6DF3D58;
    id v10 = *v1;
    +[VUIActionPlay playMediaInfo:v5 watchType:0 isRentAndWatchNow:0 completion:v9];

    goto LABEL_12;
  }
  double v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_1(v5);
  }
LABEL_12:
}

uint64_t __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_2(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:*(void *)(a1 + 32) isLaunchingExtras:0];
}

uint64_t __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissPopover
{
  double v3 = [(VUIEpisodeDetailViewController *)self delegate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VUIEpisodeDetailViewController_dismissPopover__block_invoke;
  v5[3] = &unk_1E6DF3F68;
  id v6 = v3;
  double v7 = self;
  id v4 = v3;
  [(VUIEpisodeDetailViewController *)self dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __48__VUIEpisodeDetailViewController_dismissPopover__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 episodeDetailViewControllerWasDismissed:v4];
  }
  return result;
}

- (void)_configureNavigationBar
{
  if (+[VUIUtilities isIpadInterface])
  {
    double v3 = [(VUIEpisodeDetailViewController *)self navigationController];
    id v9 = v3;
    uint64_t v4 = 1;
  }
  else
  {
    double v5 = [(VUIEpisodeDetailViewController *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1)
    {
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissPopover];
      CGFloat v8 = [(VUIEpisodeDetailViewController *)self navigationItem];
      [v8 setRightBarButtonItem:v7];
    }
    double v3 = [(VUIEpisodeDetailViewController *)self navigationController];
    id v9 = v3;
    uint64_t v4 = 0;
  }
  [v3 setNavigationBarHidden:v4];
}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (VUIEpisodeDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIEpisodeDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUIEpisodeDetailView)detailView
{
  return self->_detailView;
}

- (void)setDetailView:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

void __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Unable to present nil media item", v1, 2u);
}

void __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Unable to start playback because mediaInfo is nil; mediaEntity: %@",
    (uint8_t *)&v3,
    0xCu);
}

@end