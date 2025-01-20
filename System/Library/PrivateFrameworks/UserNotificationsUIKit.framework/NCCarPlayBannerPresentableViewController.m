@interface NCCarPlayBannerPresentableViewController
+ (NSString)requesterIdentifier;
- (BOOL)bannerContentViewShouldShowOKButton:(id)a3;
- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3;
- (BOOL)fillsContainer;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NCCarPlayBannerPresentableViewController)initWithNotificationRequest:(id)a3;
- (NCCarPlayBannerPresentableViewControllerDelegate)delegate;
- (NCNotificationRequest)notificationRequest;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (id)_platterView;
- (id)_staticContentProviderFromRequest:(id)a3;
- (id)presentableDescription;
- (void)_handleBackGesture:(id)a3;
- (void)_handleSwipeGesture:(id)a3;
- (void)_handleTapOnContent:(id)a3;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_updateStaticContentProvider;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)addPresentableObserver:(id)a3;
- (void)invalidateDisplayProperties;
- (void)loadView;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)removePresentableObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFillsContainer:(BOOL)a3;
- (void)updateRequestToInstance:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NCCarPlayBannerPresentableViewController

+ (NSString)requesterIdentifier
{
  return (NSString *)[MEMORY[0x1E4FB37F0] requesterIdentifier];
}

- (NCCarPlayBannerPresentableViewController)initWithNotificationRequest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCCarPlayBannerPresentableViewController;
  v6 = [(NCCarPlayBannerPresentableViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationRequest, a3);
    uint64_t v8 = [(NCCarPlayBannerPresentableViewController *)v7 _staticContentProviderFromRequest:v5];
    staticContentProvider = v7->_staticContentProvider;
    v7->_staticContentProvider = (NCNotificationStaticContentProviding *)v8;
  }
  return v7;
}

- (void)updateRequestToInstance:(id)a3
{
  objc_storeStrong((id *)&self->_notificationRequest, a3);
  id v5 = a3;
  v6 = [(NCCarPlayBannerPresentableViewController *)self _staticContentProviderFromRequest:v5];
  staticContentProvider = self->_staticContentProvider;
  self->_staticContentProvider = v6;

  [(NCCarPlayBannerPresentableViewController *)self _updateStaticContentProvider];
}

- (void)invalidateDisplayProperties
{
}

- (void)loadView
{
  id v3 = [MEMORY[0x1E4F91460] platterViewWithStyle:*MEMORY[0x1E4F91470]];
  [(NCCarPlayBannerPresentableViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)NCCarPlayBannerPresentableViewController;
  [(NCCarPlayBannerPresentableViewController *)&v17 viewDidLoad];
  id v3 = objc_alloc_init(NCCarPlayBannerContentView);
  bannerContentView = self->_bannerContentView;
  self->_bannerContentView = v3;

  [(NCCarPlayBannerContentView *)self->_bannerContentView setDelegate:self];
  id v5 = [(NCCarPlayBannerPresentableViewController *)self _platterView];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 setMaterialGroupNameBase:v7];

  uint64_t v8 = self->_bannerContentView;
  [v5 bounds];
  -[NCCarPlayBannerContentView setFrame:](v8, "setFrame:");
  v9 = [v5 customContentView];
  [v9 addSubview:self->_bannerContentView];

  [(NCCarPlayBannerContentView *)self->_bannerContentView setAutoresizingMask:18];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__NCCarPlayBannerPresentableViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E6A94E38;
  aBlock[4] = self;
  v10 = (void (**)(void *, char *, void))_Block_copy(aBlock);
  objc_super v11 = v10[2](v10, sel__handleTapOnContent_, 0);
  [v11 setAllowedTouchTypes:&unk_1F2F845F8];
  [(NCCarPlayBannerContentView *)self->_bannerContentView addGestureRecognizer:v11];
  ((void (**)(void *, char *, void *))v10)[2](v10, sel__handleTapOnContent_, &unk_1F2F84460);
  v12 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  contentSelectPressGesture = self->_contentSelectPressGesture;
  self->_contentSelectPressGesture = v12;

  v14 = ((void (**)(void *, char *, void *))v10)[2](v10, sel__handleBackGesture_, &unk_1F2F84478);
  [(NCCarPlayBannerContentView *)self->_bannerContentView addGestureRecognizer:v14];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self action:sel__handleSwipeGesture_];
  [v15 setAllowedTouchTypes:&unk_1F2F84610];
  [v15 setDirection:4];
  [(NCCarPlayBannerContentView *)self->_bannerContentView addGestureRecognizer:v15];
  [(NCCarPlayBannerPresentableViewController *)self _updateStaticContentProvider];
}

id __55__NCCarPlayBannerPresentableViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:*(void *)(a1 + 32) action:a2];
  [v6 setNumberOfTapsRequired:1];
  [v6 setNumberOfTouchesRequired:1];
  if (v5)
  {
    v9[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 setAllowedPressTypes:v7];
  }

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCCarPlayBannerPresentableViewController;
  [(NCCarPlayBannerPresentableViewController *)&v6 viewDidAppear:a3];
  v4 = [(NCCarPlayBannerPresentableViewController *)self view];
  id v5 = [v4 window];
  [v5 addGestureRecognizer:self->_contentSelectPressGesture];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCCarPlayBannerPresentableViewController;
  [(NCCarPlayBannerPresentableViewController *)&v5 viewWillDisappear:a3];
  v4 = [(UITapGestureRecognizer *)self->_contentSelectPressGesture view];
  [v4 removeGestureRecognizer:self->_contentSelectPressGesture];
}

- (UIEdgeInsets)bannerContentOutsets
{
  [(NCCarPlayBannerPresentableViewController *)self loadViewIfNeeded];
  id v3 = [(NCCarPlayBannerPresentableViewController *)self _platterView];
  [v3 shadowOutsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  if (self->_fillsContainer) {
    double width = a4.width;
  }
  else {
    double width = a3.width;
  }
  if (self->_fillsContainer) {
    double height = a4.height;
  }
  else {
    double height = a3.height;
  }
  -[NCCarPlayBannerPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height, a4.width, a4.height);
  double v6 = width;
  double v7 = height;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3
{
  return 0;
}

- (NSString)requesterIdentifier
{
  v2 = objc_opt_class();

  return (NSString *)[v2 requesterIdentifier];
}

- (NSString)requestIdentifier
{
  v2 = [(NCCarPlayBannerPresentableViewController *)self notificationRequest];
  id v3 = [v2 notificationIdentifier];

  return (NSString *)v3;
}

- (id)presentableDescription
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v7 = @"logDigest";
  v2 = [(NCCarPlayBannerPresentableViewController *)self requestIdentifier];
  id v3 = objc_msgSend(v2, "un_logDigest");
  v8[0] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v5 = BNPresentableDescription();

  return v5;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__NCCarPlayBannerPresentableViewController_presentableWillAppearAsBanner___block_invoke;
  v6[3] = &unk_1E6A94E60;
  id v7 = v4;
  id v5 = v4;
  [(NCCarPlayBannerPresentableViewController *)self _notifyObserversWithBlock:v6];
}

void __74__NCCarPlayBannerPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 presentableWillAppearAsBanner:*(void *)(a1 + 32)];
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NCCarPlayBannerPresentableViewController_presentableDidAppearAsBanner___block_invoke;
  v6[3] = &unk_1E6A94E60;
  id v7 = v4;
  id v5 = v4;
  [(NCCarPlayBannerPresentableViewController *)self _notifyObserversWithBlock:v6];
}

void __73__NCCarPlayBannerPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 presentableDidAppearAsBanner:*(void *)(a1 + 32)];
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__NCCarPlayBannerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E6A94E88;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NCCarPlayBannerPresentableViewController *)self _notifyObserversWithBlock:v10];
}

void __88__NCCarPlayBannerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 presentableWillDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__NCCarPlayBannerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E6A94E88;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NCCarPlayBannerPresentableViewController *)self _notifyObserversWithBlock:v10];
}

void __87__NCCarPlayBannerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 presentableDidDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
  }
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__NCCarPlayBannerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E6A94E60;
  id v7 = v4;
  id v5 = v4;
  [(NCCarPlayBannerPresentableViewController *)self _notifyObserversWithBlock:v6];
}

void __92__NCCarPlayBannerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 userInteractionWillBeginForBannerForPresentable:*(void *)(a1 + 32)];
  }
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__NCCarPlayBannerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E6A94E60;
  id v7 = v4;
  id v5 = v4;
  [(NCCarPlayBannerPresentableViewController *)self _notifyObserversWithBlock:v6];
}

void __89__NCCarPlayBannerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 userInteractionDidEndForBannerForPresentable:*(void *)(a1 + 32)];
  }
}

- (void)addPresentableObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removePresentableObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, NCCarPlayBannerPresentableViewController *, void))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = (id)[(NSHashTable *)observers copy];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            id v11 = objc_initWeak(&location, self);
            v4[2](v4, self, v10);

            objc_destroyWeak(&location);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
}

- (BOOL)bannerContentViewShouldShowOKButton:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained presentableViewControllerClosesByDefault:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)_staticContentProviderFromRequest:(id)a3
{
  id v4 = [NCNotificationRequestCarPlayContentProvider alloc];
  char v5 = [(NCCarPlayBannerPresentableViewController *)self notificationRequest];
  id v6 = [(NCNotificationRequestCoalescingContentProvider *)v4 initWithNotificationRequest:v5];

  return v6;
}

- (void)_updateStaticContentProvider
{
  bannerContentView = self->_bannerContentView;
  if (bannerContentView)
  {
    id v4 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider badgedIconView];
    [(NCCarPlayBannerContentView *)bannerContentView setBadgedIconView:v4];

    char v5 = self->_bannerContentView;
    id v6 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider date];
    [(NCCarPlayBannerContentView *)v5 setDate:v6];

    [(NCCarPlayBannerContentView *)self->_bannerContentView setDateAllDay:[(NCNotificationStaticContentProviding *)self->_staticContentProvider isDateAllDay]];
    uint64_t v7 = self->_bannerContentView;
    uint64_t v8 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider timeZone];
    [(NCCarPlayBannerContentView *)v7 setTimeZone:v8];

    [(NCCarPlayBannerContentView *)self->_bannerContentView setDateFormatStyle:1];
    id v9 = self->_bannerContentView;
    uint64_t v10 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primaryText];
    [(NCCarPlayBannerContentView *)v9 setPrimaryText:v10];

    id v11 = self->_bannerContentView;
    id v12 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primarySubtitleText];
    [(NCCarPlayBannerContentView *)v11 setPrimarySubtitleText:v12];

    long long v13 = self->_bannerContentView;
    long long v14 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primaryText];
    [(NCCarPlayBannerContentView *)v13 setPrimaryText:v14];

    long long v15 = self->_bannerContentView;
    long long v16 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primarySubtitleText];
    if ([v16 length]) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    [(NCCarPlayBannerContentView *)v15 setPrimaryTextMaximumNumberOfLines:v17];

    uint64_t v18 = self->_bannerContentView;
    [(NCCarPlayBannerContentView *)v18 setPrimarySubtitleTextMaximumNumberOfLines:1];
  }
}

- (id)_platterView
{
  v2 = [(NCCarPlayBannerPresentableViewController *)self view];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      char v5 = v4;
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_handleTapOnContent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didSelectBannerOfPresentableViewController:self];
  }
}

- (void)_handleBackGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didCancelBannerOfPresentableViewController:self reason:@"NCCarPlayBannerRevocationReasonBackGesture"];
  }
}

- (void)_handleSwipeGesture:(id)a3
{
  if ([a3 direction] == 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained didCancelBannerOfPresentableViewController:self reason:@"NCCarPlayBannerRevocationReasonTouchPadSwipeGesture"];
    }
  }
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] != 7
    || [v4 subtype] != 202 && objc_msgSend(v4, "subtype") != 200 && objc_msgSend(v4, "subtype") != 201)
  {
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_8:
    v6.receiver = self;
    v6.super_class = (Class)NCCarPlayBannerPresentableViewController;
    [(NCCarPlayBannerPresentableViewController *)&v6 _wheelChangedWithEvent:v4];
    goto LABEL_9;
  }
  [WeakRetained didCancelBannerOfPresentableViewController:self reason:@"NCCarPlayBannerRevocationReasonWheelEvent"];

LABEL_9:
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (NCCarPlayBannerPresentableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCCarPlayBannerPresentableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)fillsContainer
{
  return self->_fillsContainer;
}

- (void)setFillsContainer:(BOOL)a3
{
  self->_fillsContainer = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_contentSelectPressGesture, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_staticContentProvider, 0);

  objc_storeStrong((id *)&self->_bannerContentView, 0);
}

@end