@interface PXCMMTranscriptBubbleViewController
+ (BOOL)_isPermanentFailureURL:(id)a3;
+ (void)_registerPermanentFailureURL:(id)a3;
- (BOOL)_shouldOpenCloudSettings;
- (BOOL)_shouldOpenInSafari;
- (BOOL)_shouldRetryOnTap;
- (BOOL)_shouldShowContent;
- (BOOL)isSender;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (CGSize)workaroundSizeForSize:(CGSize)a3;
- (NSError)error;
- (NSString)description;
- (NSURL)url;
- (PHMomentShare)momentShare;
- (PXCMMTranscriptBubbleTouchDelegate)touchDelegate;
- (PXCMMTranscriptBubbleViewController)init;
- (PXCMMTranscriptBubbleViewController)initWithCoder:(id)a3;
- (PXCMMTranscriptBubbleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXCMMTranscriptBubbleViewController)initWithURL:(id)a3 isSender:(BOOL)a4;
- (int64_t)bubbleState;
- (int64_t)targetState;
- (void)_acceptMomentShareIfNeeded:(id)a3;
- (void)_autoAcceptMomentShareIfNeeded:(id)a3;
- (void)_ensureBubbleStateTransition;
- (void)_fetchMomentShareFromNetworkURL:(id)a3;
- (void)_momentShareURL:(id)a3 fetchDidFailWithError:(id)a4;
- (void)_readyForStateTransition;
- (void)_retryMomentShareFetch;
- (void)_tapGesture:(id)a3;
- (void)_triggerForcedSyncIfNeeded;
- (void)_updateBubbleState;
- (void)_updateBubbleView;
- (void)_updateContent;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)setBubbleState:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setTargetState:(int64_t)a3;
- (void)setTouchDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXCMMTranscriptBubbleViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusView, 0);
  objc_storeStrong((id *)&self->_errorStatusView, 0);
  objc_storeStrong((id *)&self->_stackBubbleView, 0);
  objc_storeStrong((id *)&self->_backingFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)targetState
{
  return self->_targetState;
}

- (int64_t)bubbleState
{
  return self->_bubbleState;
}

- (void)setTouchDelegate:(id)a3
{
}

- (PXCMMTranscriptBubbleTouchDelegate)touchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  return (PXCMMTranscriptBubbleTouchDelegate *)WeakRetained;
}

- (BOOL)isSender
{
  return self->_isSender;
}

- (NSURL)url
{
  return self->_url;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)CMMSpecObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCMMTranscriptBubbleViewController.m" lineNumber:633 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXCMMTranscriptBubbleViewController *)self _updateBubbleView];
    id v9 = v11;
  }
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = PLSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = self;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Photo library did change for bubble: %@.", buf, 0xCu);
  }

  if (!self->_backingFetchResult)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXCMMTranscriptBubbleViewController.m", 574, @"Invalid parameter not satisfying: %@", @"_backingFetchResult" object file lineNumber description];
  }
  objc_msgSend(v5, "changeDetailsForFetchResult:");
  v7 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "Change details: %@.", buf, 0xCu);
    }

    id v9 = [(PXCMMTranscriptBubbleViewController *)v7 fetchResultAfterChanges];
    backingFetchResult = self->_backingFetchResult;
    self->_backingFetchResult = v9;

    id v11 = [(PXCMMTranscriptBubbleViewController *)v7 changedIndexes];
    uint64_t v12 = [v11 count];

    v13 = [(PXCMMTranscriptBubbleViewController *)self error];

    if (v13) {
      goto LABEL_25;
    }
    v14 = [(PXCMMTranscriptBubbleViewController *)v7 fetchResultBeforeChanges];
    v26 = [v14 firstObject];
    v15 = [(PHFetchResult *)self->_backingFetchResult firstObject];
    v16 = [(PXCMMTranscriptBubbleViewController *)self url];
    objc_msgSend(v16, "pl_redactedShareURL");
    v17 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();

    if (v15 && [v15 trashedState] == 1 && !objc_msgSend(v26, "trashedState"))
    {
      v21 = PLSharingGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "Moment share was trashed for URL: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1100, @"Moment share was trashed for URL: %@", v17);
    }
    else
    {
      v18 = [(PXCMMTranscriptBubbleViewController *)v7 removedIndexes];
      if (![v18 count]
        || [(PHFetchResult *)self->_backingFetchResult count]
        || ![v14 count])
      {
        goto LABEL_23;
      }
      BOOL isExpungingAndRefetching = self->_isExpungingAndRefetching;

      if (isExpungingAndRefetching)
      {
LABEL_24:

LABEL_25:
        if (self->_isExpungingAndRefetching)
        {
          v22 = [(PXCMMTranscriptBubbleViewController *)v7 insertedIndexes];
          if ([v22 count])
          {
            v23 = [(PXCMMTranscriptBubbleViewController *)v7 fetchResultBeforeChanges];
            uint64_t v24 = [v23 count];

            if (!v24) {
              self->_BOOL isExpungingAndRefetching = 0;
            }
          }
          else
          {
          }
        }
        [(PXCMMTranscriptBubbleViewController *)self _updateBubbleState];
        if (v12) {
          [(PXCMMTranscriptBubbleViewController *)self _updateBubbleView];
        }
        [(PXCMMTranscriptBubbleViewController *)self _triggerForcedSyncIfNeeded];
        goto LABEL_33;
      }
      v20 = PLSharingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "Moment share object went away for URL: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1101, @"Moment share object went away for URL: %@", v17);
    v18 = };
    [(PXCMMTranscriptBubbleViewController *)self setError:v18];
LABEL_23:

    goto LABEL_24;
  }
LABEL_33:
}

- (void)_readyForStateTransition
{
  self->_readyForBubbleStateTransitions = 1;
  [(PXCMMTranscriptBubbleViewController *)self _ensureBubbleStateTransition];
}

- (void)_ensureBubbleStateTransition
{
  int64_t v3 = [(PXCMMTranscriptBubbleViewController *)self targetState];
  if (v3 != [(PXCMMTranscriptBubbleViewController *)self bubbleState]
    && self->_readyForBubbleStateTransitions)
  {
    [(PXCMMTranscriptBubbleViewController *)self setBubbleState:[(PXCMMTranscriptBubbleViewController *)self targetState]];
    self->_readyForBubbleStateTransitions = 0;
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PXCMMTranscriptBubbleViewController__ensureBubbleStateTransition__block_invoke;
    v5[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __67__PXCMMTranscriptBubbleViewController__ensureBubbleStateTransition__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _readyForStateTransition];
}

- (void)_updateBubbleState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PXCMMTranscriptBubbleViewController *)self bubbleState];
  dispatch_time_t v4 = +[PXCompleteMyMomentSettings sharedInstance];
  int v5 = [v4 simulateMomentShareBubbleError];

  id v6 = [(PXCMMTranscriptBubbleViewController *)self error];

  if (v6 || v5)
  {
    v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v5)
      {
        id v9 = @"Simulated";
      }
      else
      {
        id v9 = [(PXCMMTranscriptBubbleViewController *)self error];
      }
      int v10 = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Will enter error state for bubble: %@ - Error: %@", (uint8_t *)&v10, 0x16u);
      if ((v5 & 1) == 0) {
    }
      }
    uint64_t v7 = 3;
  }
  else if ([(PXCMMTranscriptBubbleViewController *)self _shouldShowContent])
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = v3 != 0;
  }
  [(PXCMMTranscriptBubbleViewController *)self setTargetState:v7];
}

- (void)_updateContent
{
  if ([(PXCMMTranscriptBubbleViewController *)self _shouldShowContent])
  {
    id v3 = [(PXCMMTranscriptBubbleViewController *)self momentShare];
    [(PXCMMStackBubbleView *)self->_stackBubbleView setMomentShare:v3];
  }
}

- (void)_updateBubbleView
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PXCMMTranscriptBubbleViewController *)self bubbleState];
  if (v3 != 1)
  {
    if (v3 != 3)
    {
      if (v3 != 2) {
        return;
      }
      if (self->_stackBubbleView)
      {
        dispatch_time_t v4 = 0;
      }
      else
      {
        v26 = [PXCMMStackBubbleView alloc];
        v27 = -[PXCMMStackBubbleView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        stackBubbleView = self->_stackBubbleView;
        self->_stackBubbleView = v27;

        uint64_t v29 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v29 bounds];
        double v31 = v30;

        [(PXCMMStackBubbleView *)self->_stackBubbleView setMaximumHeight:ceil(v31 * 0.2)];
        dispatch_time_t v4 = self->_stackBubbleView;
      }
      loadingStatusView = self->_loadingStatusView;
      self->_loadingStatusView = 0;

      errorStatusView = self->_errorStatusView;
      self->_errorStatusView = 0;

      [(PXCMMTranscriptBubbleViewController *)self _updateContent];
      if (!v4) {
        return;
      }
LABEL_28:
      [(PXTranscriptBubbleViewController *)self transitionToContentView:v4];

      return;
    }
    if (self->_errorStatusView)
    {
      dispatch_time_t v4 = 0;
    }
    else
    {
      v13 = [PXCMMTranscriptBubbleStatusView alloc];
      uint64_t v14 = -[PXCMMTranscriptBubbleStatusView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v15 = self->_errorStatusView;
      self->_errorStatusView = v14;

      dispatch_time_t v4 = self->_errorStatusView;
    }
    v16 = self->_stackBubbleView;
    self->_stackBubbleView = 0;

    v17 = self->_loadingStatusView;
    self->_loadingStatusView = 0;

    v18 = PXLocalizedStringFromTable(@"PXMessagesBubbleLinkUnavailableTitle", @"PhotosUICore");
    [(PXCMMTranscriptBubbleStatusView *)self->_errorStatusView setStatusTitle:v18];

    v19 = [(PXCMMTranscriptBubbleViewController *)self error];
    v20 = +[PXCompleteMyMomentSettings sharedInstance];
    int v21 = [v20 simulateMomentShareBubbleError];

    if (v21)
    {
      v22 = +[PXCompleteMyMomentSettings sharedInstance];
      unint64_t v23 = [v22 simulatedMomentShareBubbleErrorType];

      uint64_t v24 = PLSharingGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (v23 > 0xB) {
          v25 = 0;
        }
        else {
          v25 = *(&off_1E5DBD7E8 + v23);
        }
        id v34 = v25;
        int v38 = 138543362;
        id v39 = v34;
        _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEFAULT, "Simulating moment share bubble error (PXCompleteMyMomentSettings.sharedInstance.simulatedMomentShareBubbleErrorType):  %{public}@", (uint8_t *)&v38, 0xCu);
      }
      if (v23 > 0xB)
      {
        v35 = 0;
LABEL_27:
        [(PXCMMTranscriptBubbleStatusView *)self->_errorStatusView setStatusDescription:v35];
        v36 = [(PXTranscriptBubbleViewController *)self delegate];
        [v36 safeAreaInsetsForBubble:self];
        -[PXCMMTranscriptBubbleStatusView setBubbleSafeAreaInsets:](self->_errorStatusView, "setBubbleSafeAreaInsets:");

        v37 = [(PXFeatureSpecManager *)self->_specManager spec];
        [(PXCMMTranscriptBubbleStatusView *)self->_errorStatusView setSpec:v37];

        if (!v4) {
          return;
        }
        goto LABEL_28;
      }
    }
    else
    {
      unint64_t v23 = PXMomentShareTypeForError(v19);
    }
    v35 = PXLocalizedStringFromTable(off_1E5DD2590[v23], @"PhotosUICore");
    goto LABEL_27;
  }
  if (self->_loadingStatusView)
  {
    dispatch_time_t v4 = 0;
  }
  else
  {
    int v5 = [PXCMMTranscriptBubbleStatusView alloc];
    id v6 = -[PXCMMTranscriptBubbleStatusView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = self->_loadingStatusView;
    self->_loadingStatusView = v6;

    dispatch_time_t v4 = self->_loadingStatusView;
  }
  v8 = self->_stackBubbleView;
  self->_stackBubbleView = 0;

  id v9 = self->_errorStatusView;
  self->_errorStatusView = 0;

  int v10 = PXLocalizedStringFromTable(@"PXMessagesBubbleLoadingMessage", @"PhotosUICore");
  [(PXCMMTranscriptBubbleStatusView *)self->_loadingStatusView setStatusTitle:v10];

  [(PXCMMTranscriptBubbleStatusView *)self->_loadingStatusView setShowsActivityIndicator:1];
  id v11 = [(PXTranscriptBubbleViewController *)self delegate];
  [v11 safeAreaInsetsForBubble:self];
  -[PXCMMTranscriptBubbleStatusView setBubbleSafeAreaInsets:](self->_loadingStatusView, "setBubbleSafeAreaInsets:");

  __int16 v12 = [(PXFeatureSpecManager *)self->_specManager spec];
  [(PXCMMTranscriptBubbleStatusView *)self->_loadingStatusView setSpec:v12];

  if (v4) {
    goto LABEL_28;
  }
}

- (BOOL)_shouldShowContent
{
  v2 = [(PXCMMTranscriptBubbleViewController *)self momentShare];
  int64_t v3 = v2;
  if (v2) {
    BOOL v4 = [v2 trashedState] != 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PXCMMTranscriptBubbleViewController;
  [(PXTranscriptBubbleViewController *)&v13 viewDidLoad];
  BOOL v4 = [(UIViewController *)self px_extendedTraitCollection];
  if (!v4)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXCMMTranscriptBubbleViewController.m" lineNumber:384 description:@"Spec cannot be set up if there's no trait collection"];
  }
  if ([(PXCMMTranscriptBubbleViewController *)self isSender]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [[PXCMMSpecManager alloc] initWithExtendedTraitCollection:v4 activityType:v5];
  specManager = self->_specManager;
  self->_specManager = v6;

  [(PXCMMSpecManager *)self->_specManager registerChangeObserver:self context:CMMSpecObservationContext];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__tapGesture_];
  id v9 = [(PXCMMTranscriptBubbleViewController *)self view];
  [v9 addGestureRecognizer:v8];

  int v10 = [MEMORY[0x1E4FB1618] clearColor];
  id v11 = [(PXCMMTranscriptBubbleViewController *)self view];
  [v11 setBackgroundColor:v10];
}

- (void)_tapGesture:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([a3 state] != 3) {
    return;
  }
  if ([(PXCMMTranscriptBubbleViewController *)self _shouldNavigateToContent])
  {
    BOOL v4 = [(PXTranscriptBubbleViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v10 = [(PXCMMTranscriptBubbleViewController *)self momentShare];
      id v6 = [(PXCMMTranscriptBubbleViewController *)self touchDelegate];
      [v6 transcriptBubbleViewController:self didSelectMomentShare:v10];
    }
    return;
  }
  if ([(PXCMMTranscriptBubbleViewController *)self _shouldRetryOnTap])
  {
    [(PXCMMTranscriptBubbleViewController *)self _retryMomentShareFetch];
    return;
  }
  if ([(PXCMMTranscriptBubbleViewController *)self _shouldOpenInSafari])
  {
    uint64_t v7 = PLSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v12 = self;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to open URL in Safari for bubble: %@", buf, 0xCu);
    }

    v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v9 = [(PXCMMTranscriptBubbleViewController *)self url];
    [v8 openURL:v9 configuration:0 completionHandler:0];

LABEL_15:
    return;
  }
  if (![(PXCMMTranscriptBubbleViewController *)self _shouldOpenCloudSettings])
  {
    v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v12 = self;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "No action required for tap on bubble: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  +[PXSystemNavigation navigateToDestination:4 completion:0];
}

- (BOOL)_shouldOpenCloudSettings
{
  v2 = [(PXCMMTranscriptBubbleViewController *)self error];
  int64_t v3 = v2;
  if (v2) {
    BOOL v4 = PXMomentShareTypeForError(v2) == 10;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldOpenInSafari
{
  v2 = [(PXCMMTranscriptBubbleViewController *)self error];
  int64_t v3 = v2;
  if (v2) {
    BOOL v4 = PXMomentShareTypeForError(v2) == 6;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldRetryOnTap
{
  int64_t v3 = [(PXCMMTranscriptBubbleViewController *)self error];

  if (v3)
  {
    BOOL v4 = [(PXCMMTranscriptBubbleViewController *)self error];
    int64_t v3 = (void *)PXMomentShareTypeForError(v4);

    if (v3 != (void *)1)
    {
      if (v3 == (void *)3)
      {
        char v5 = [(PXCMMTranscriptBubbleViewController *)self momentShare];
        LOBYTE(v3) = [v5 status] != 1;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    id v6 = +[PXCompleteMyMomentSettings sharedInstance];
    if ([v6 alwaysTapToRetry])
    {
      uint64_t v7 = [(PXCMMTranscriptBubbleViewController *)self momentShare];

      if (!v7) {
        LOBYTE(v3) = 1;
      }
    }
  }
  return (char)v3;
}

- (void)_retryMomentShareFetch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PXCMMTranscriptBubbleViewController *)self momentShare];
  BOOL v4 = v3;
  if (v3)
  {
    if (!self->_isExpungingAndRefetching
      && [v3 trashedState] == 1
      && [v4 status] != 1)
    {
      [(PXCMMTranscriptBubbleViewController *)self setError:0];
      self->_BOOL isExpungingAndRefetching = 1;
      id v10 = PLSharingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(PXCMMTranscriptBubbleViewController *)self url];
        objc_msgSend(v11, "pl_redactedShareURL");
        __int16 v12 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v4 uuid];
        *(_DWORD *)buf = 138543618;
        v17 = v12;
        __int16 v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Retrying moment share fetch for URL: %{public}@ - Trashed Moment Shared with UUID: %@", buf, 0x16u);
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __61__PXCMMTranscriptBubbleViewController__retryMomentShareFetch__block_invoke;
      v14[3] = &unk_1E5DD2570;
      v14[4] = self;
      id v15 = v4;
      PXExpungeMomentShare(v15, v14);
    }
    char v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Skipping moment share retry. There's already a moment share for bubble: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = PLSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(PXCMMTranscriptBubbleViewController *)self url];
      objc_msgSend(v7, "pl_redactedShareURL");
      v8 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      id v9 = [(PXCMMTranscriptBubbleViewController *)self error];
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Retrying moment share fetch for URL: %{public}@ - Previous error: %@", buf, 0x16u);
    }
    [(PXCMMTranscriptBubbleViewController *)self setError:0];
    char v5 = [(PXCMMTranscriptBubbleViewController *)self url];
    [(PXCMMTranscriptBubbleViewController *)self _fetchMomentShareFromNetworkURL:v5];
  }
}

void __61__PXCMMTranscriptBubbleViewController__retryMomentShareFetch__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharingGetLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 32) url];
      id v9 = objc_msgSend(v8, "pl_redactedShareURL");
      id v10 = [*(id *)(a1 + 40) uuid];
      int v16 = 138543618;
      v17 = v9;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Successfully expunged trashed moment share fetch for refetch - URL: %{public}@ UUID: %@", (uint8_t *)&v16, 0x16u);
    }
    id v11 = *(void **)(a1 + 32);
    __int16 v12 = [v11 url];
    [v11 _fetchMomentShareFromNetworkURL:v12];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [*(id *)(a1 + 32) url];
      uint64_t v14 = objc_msgSend(v13, "pl_redactedShareURL");
      id v15 = [*(id *)(a1 + 40) uuid];
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to expunge trashed moment share fetch for refetch - URL: %{public}@ UUID: %@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) setError:v5];
    *(unsigned char *)(*(void *)(a1 + 32) + 1089) = 0;
  }
}

- (void)_triggerForcedSyncIfNeeded
{
  if (!self->_triggeredForcedSync)
  {
    int64_t v3 = [(PXCMMTranscriptBubbleViewController *)self momentShare];
    if ([(PXCMMTranscriptBubbleViewController *)self bubbleState] == 2
      && v3
      && ([v3 status] == 1 || objc_msgSend(v3, "status") == 3))
    {
      self->_triggeredForcedSync = 1;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __65__PXCMMTranscriptBubbleViewController__triggerForcedSyncIfNeeded__block_invoke;
      v4[3] = &unk_1E5DD2D68;
      v4[4] = self;
      [v3 forceSyncMomentShareWithCompletion:v4];
    }
  }
}

void __65__PXCMMTranscriptBubbleViewController__triggerForcedSyncIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = PLSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 134218242;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Forced sync for bubble %p, failed with error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_acceptMomentShareIfNeeded:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PXCMMTranscriptBubbleViewController__acceptMomentShareIfNeeded___block_invoke;
  block[3] = &unk_1E5DD36F8;
  id v4 = v3;
  id v10 = v4;
  uint64_t v5 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  int v6 = +[PXCompleteMyMomentSettings sharedInstance];
  int v7 = [v6 simulateDelays];

  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 3000000000);
    dispatch_after(v8, MEMORY[0x1E4F14428], v5);
  }
  else
  {
    v5[2](v5);
  }
}

void __66__PXCMMTranscriptBubbleViewController__acceptMomentShareIfNeeded___block_invoke(uint64_t a1)
{
}

- (void)_autoAcceptMomentShareIfNeeded:(id)a3
{
  id v6 = a3;
  id v4 = +[PXCompleteMyMomentSettings sharedInstance];
  int v5 = [v4 autoAcceptBubbles];

  if (v5) {
    [(PXCMMTranscriptBubbleViewController *)self _acceptMomentShareIfNeeded:v6];
  }
}

- (void)_momentShareURL:(id)a3 fetchDidFailWithError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(PXCMMTranscriptBubbleViewController *)self setError:v6];
  uint64_t v7 = PXMomentShareTypeForError(v6);

  if (v7 == 4 || (v7 & 0xE) == 2) {
    [(id)objc_opt_class() _registerPermanentFailureURL:v8];
  }
}

- (void)_fetchMomentShareFromNetworkURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  __int16 v12 = __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke;
  uint64_t v13 = &unk_1E5DD2548;
  id v5 = v4;
  id v14 = v5;
  id v15 = self;
  objc_copyWeak(&v16, &location);
  id v6 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_DETACHED, &v10);
  uint64_t v7 = +[PXCompleteMyMomentSettings sharedInstance];
  int v8 = [v7 simulateDelays];

  if (v8)
  {
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    dispatch_after(v9, MEMORY[0x1E4F14428], v6);
  }
  else
  {
    v6[2](v6);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F391B0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 1040) librarySpecificFetchOptions];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke_2;
  v5[3] = &unk_1E5DD2520;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 32);
  [v2 fetchMomentShareFromShareURL:v3 options:v4 completionHandler:v5];

  objc_destroyWeak(&v7);
}

void __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    objc_copyWeak(&v10, (id *)(a1 + 40));
    *(id *)(a1 + 32);
    v6;
    px_dispatch_on_main_queue();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _autoAcceptMomentShareIfNeeded:v5];

  int v8 = PLSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v9 = objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
    *(_DWORD *)buf = 138543362;
    __int16 v12 = v9;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched MomentShare for URL %{public}@", buf, 0xCu);
  }
}

void __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke_219(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _momentShareURL:*(void *)(a1 + 32) fetchDidFailWithError:*(void *)(a1 + 40)];
}

- (PHMomentShare)momentShare
{
  return (PHMomentShare *)[(PHFetchResult *)self->_backingFetchResult firstObject];
}

- (void)setTargetState:(int64_t)a3
{
  if (self->_targetState != a3)
  {
    self->_targetState = a3;
    [(PXCMMTranscriptBubbleViewController *)self _ensureBubbleStateTransition];
  }
}

- (void)setBubbleState:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_bubbleState != a3)
  {
    id v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int64_t bubbleState = self->_bubbleState;
      int v7 = 138412802;
      int v8 = self;
      __int16 v9 = 2048;
      int64_t v10 = bubbleState;
      __int16 v11 = 2048;
      int64_t v12 = a3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Transitioning bubble %@ state from %ld to %ld", (uint8_t *)&v7, 0x20u);
    }

    self->_int64_t bubbleState = a3;
    [(PXCMMTranscriptBubbleViewController *)self _updateBubbleView];
  }
}

- (void)setError:(id)a3
{
  id v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    [(PXCMMTranscriptBubbleViewController *)self _updateBubbleState];
    id v5 = v6;
  }
}

- (CGSize)workaroundSizeForSize:(CGSize)a3
{
  +[PXCMMStackBubbleView sizeThatFits:](PXCMMStackBubbleView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXCMMTranscriptBubbleViewController *)self _updateBubbleView];
  v8.receiver = self;
  v8.super_class = (Class)PXCMMTranscriptBubbleViewController;
  -[PXTranscriptBubbleViewController contentSizeThatFits:](&v8, sel_contentSizeThatFits_, width, height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)PXCMMTranscriptBubbleViewController;
  double v3 = [(PXCMMTranscriptBubbleViewController *)&v16 description];
  double v4 = [(PXCMMTranscriptBubbleViewController *)self momentShare];
  id v5 = [(PXCMMTranscriptBubbleViewController *)self url];
  double v6 = objc_msgSend(v5, "pl_redactedShareURL");
  if ([(PXCMMTranscriptBubbleViewController *)self isSender]) {
    double v7 = @"YES";
  }
  else {
    double v7 = @"NO";
  }
  objc_super v8 = v7;
  if (v4) {
    __int16 v9 = @"YES";
  }
  else {
    __int16 v9 = @"NO";
  }
  int64_t v10 = v9;
  uint64_t v11 = [v4 assetCount];
  uint64_t v12 = [v4 uploadedPhotosCount];
  uint64_t v13 = [(PXCMMTranscriptBubbleViewController *)self error];
  id v14 = [v3 stringByAppendingFormat:@" URL: %@ isSender: %@ hasMomentShare: %@ expectedAssetCount: %lu uploadedCount: %lu error: %@", v6, v8, v10, v11, v12, v13];

  return (NSString *)v14;
}

- (void)dealloc
{
  [(PHPhotoLibrary *)self->_photoLibrary px_unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PXCMMTranscriptBubbleViewController;
  [(PXCMMTranscriptBubbleViewController *)&v3 dealloc];
}

- (PXCMMTranscriptBubbleViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMTranscriptBubbleViewController.m", 148, @"%s is not available as initializer", "-[PXCMMTranscriptBubbleViewController initWithCoder:]");

  abort();
}

- (PXCMMTranscriptBubbleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMTranscriptBubbleViewController.m", 144, @"%s is not available as initializer", "-[PXCMMTranscriptBubbleViewController initWithNibName:bundle:]");

  abort();
}

- (PXCMMTranscriptBubbleViewController)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMTranscriptBubbleViewController.m", 140, @"%s is not available as initializer", "-[PXCMMTranscriptBubbleViewController init]");

  abort();
}

- (PXCMMTranscriptBubbleViewController)initWithURL:(id)a3 isSender:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PXCMMTranscriptBubbleViewController;
  id v8 = [(PXCMMTranscriptBubbleViewController *)&v39 initWithNibName:0 bundle:0];
  __int16 v9 = v8;
  if (!v8) {
    goto LABEL_30;
  }
  if (!v7)
  {
    int64_t v10 = PLSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "A URL must be provided to a transcript bubble", buf, 2u);
    }

    objc_storeStrong((id *)&v9->_url, a3);
    v9->_isSender = a4;
    goto LABEL_27;
  }
  objc_storeStrong((id *)&v8->_url, a3);
  v9->_isSender = a4;
  uint64_t v38 = 0;
  uint64_t v11 = PXFetchAssetCollectionForCMMShareURL(v7, 1, &v38);
  backingFetchResult = v9->_backingFetchResult;
  v9->_backingFetchResult = (PHFetchResult *)v11;

  if (v38 == 1)
  {
    uint64_t v13 = PLSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "pl_redactedShareURL");
      id v14 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Unsupported debug URL: %{public}@", buf, 0xCu);
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    objc_super v16 = objc_msgSend(v7, "pl_redactedShareURL");
    uint64_t v17 = objc_msgSend(v15, "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1102, @"Debug URLs are unsupported: %@", v16);
    error = v9->_error;
    v9->_error = (NSError *)v17;

    goto LABEL_26;
  }
  v19 = [(PHFetchResult *)v9->_backingFetchResult firstObject];
  uint64_t v20 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  photoLibrary = v9->_photoLibrary;
  v9->_photoLibrary = (PHPhotoLibrary *)v20;

  if (v19)
  {
    if ([v19 trashedState] != 1)
    {
      [(PXCMMTranscriptBubbleViewController *)v9 _triggerForcedSyncIfNeeded];
      goto LABEL_25;
    }
    v22 = PLSharingGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "pl_redactedShareURL");
      unint64_t v23 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "Bubble will display error for trashed moment share URL: %{public}@", buf, 0xCu);
    }
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    v25 = objc_msgSend(v7, "pl_redactedShareURL");
    uint64_t v26 = objc_msgSend(v24, "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1100, @"Moment share is trashed for URL: %@", v25);
  }
  else
  {
    char v27 = [(id)objc_opt_class() _isPermanentFailureURL:v7];
    v28 = PLSharingGetLog();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if ((v27 & 1) == 0)
    {
      if (v29)
      {
        objc_msgSend(v7, "pl_redactedShareURL");
        v33 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v33;
        _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_DEFAULT, "Unable to find MomentShare for URL %{public}@. Triggering network request", buf, 0xCu);
      }
      [(PXCMMTranscriptBubbleViewController *)v9 _fetchMomentShareFromNetworkURL:v7];
      goto LABEL_25;
    }
    if (v29)
    {
      objc_msgSend(v7, "pl_redactedShareURL");
      double v30 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v30;
      _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_DEFAULT, "Dropping to error state for known permanent failure URL: %{public}@", buf, 0xCu);
    }
    double v31 = (void *)MEMORY[0x1E4F28C58];
    v25 = objc_msgSend(v7, "pl_redactedShareURL");
    uint64_t v26 = objc_msgSend(v31, "px_genericErrorWithDebugDescription:", @"Known permanent failure for URL: %@", v25);
  }
  v32 = v9->_error;
  v9->_error = (NSError *)v26;

LABEL_25:
LABEL_26:
  [(PHPhotoLibrary *)v9->_photoLibrary px_registerChangeObserver:v9];
LABEL_27:
  [(UIViewController *)v9 px_enableExtendedTraitCollection];
  v9->_readyForBubbleStateTransitions = 1;
  [(PXCMMTranscriptBubbleViewController *)v9 _updateBubbleState];
  id v34 = PLSharingGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = [(PXCMMTranscriptBubbleViewController *)v9 bubbleState];
    uint64_t v36 = [(PXCMMTranscriptBubbleViewController *)v9 targetState];
    *(_DWORD *)buf = 138412802;
    v41 = v9;
    __int16 v42 = 2048;
    uint64_t v43 = v35;
    __int16 v44 = 2048;
    uint64_t v45 = v36;
    _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_DEFAULT, "Initialized transcript bubble: %@ -  Initial state %lu (%lu)", buf, 0x20u);
  }

LABEL_30:
  return v9;
}

+ (BOOL)_isPermanentFailureURL:(id)a3
{
  return [(id)knownPermanentFailures containsObject:a3];
}

+ (void)_registerPermanentFailureURL:(id)a3
{
  id v3 = a3;
  double v4 = (void *)knownPermanentFailures;
  id v7 = v3;
  if (!knownPermanentFailures)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    double v6 = (void *)knownPermanentFailures;
    knownPermanentFailures = v5;

    id v3 = v7;
    double v4 = (void *)knownPermanentFailures;
  }
  [v4 addObject:v3];
}

@end