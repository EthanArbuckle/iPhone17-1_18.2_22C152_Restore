@interface TPSTipsByCollectionViewController
- (BOOL)pendingContentUpdate;
- (BOOL)pendingReload;
- (BOOL)skipIntro;
- (TPSTipsByCollectionViewControllerDelegate)contentDelegate;
- (id)collectionIDForTipID:(id)a3;
- (void)appController:(id)a3 loadingContent:(BOOL)a4;
- (void)appControllerContentUpdated:(id)a3;
- (void)dealloc;
- (void)reloadContentIfNeeded;
- (void)resetTips;
- (void)setContentDelegate:(id)a3;
- (void)setPendingReload:(BOOL)a3;
- (void)setSkipIntro:(BOOL)a3;
- (void)showError;
- (void)updateContent;
- (void)updateTipsForCurrentCollection;
- (void)updateTitleTextForCollection:(id)a3;
- (void)updateWithCollectionID:(id)a3 tipID:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TPSTipsByCollectionViewController

- (void)setContentDelegate:(id)a3
{
}

- (BOOL)pendingContentUpdate
{
  return self->_pendingTipID || self->_pendingCollectionID != 0;
}

- (void)dealloc
{
  v3 = [(TPSAppViewController *)self appController];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)TPSTipsByCollectionViewController;
  [(TPSTipsViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSTipsByCollectionViewController;
  [(TPSTipsViewController *)&v9 viewWillAppear:a3];
  objc_super v4 = [(TPSAppViewController *)self appController];
  if (([v4 contentHasLoaded] & 1) == 0) {
    goto LABEL_6;
  }
  v5 = [(TPSTipsViewController *)self tips];
  if (![v5 count])
  {

LABEL_6:
    goto LABEL_7;
  }
  v6 = [(TPSTipsViewController *)self collectionView];
  unsigned int v7 = [v6 isHidden];

  if (v7) {
    [(TPSTipsViewController *)self removeInlineMessageLabel];
  }
LABEL_7:
  v8 = [(TPSAppViewController *)self appController];
  [v8 addDelegate:self];

  [(TPSTipsByCollectionViewController *)self updateContent];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSTipsByCollectionViewController;
  [(TPSTipsViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(TPSAppViewController *)self appController];
  [v4 removeDelegate:self];
}

- (void)setPendingReload:(BOOL)a3
{
  if (self->_pendingReload != a3)
  {
    self->_pendingReload = a3;
    [(TPSTipsByCollectionViewController *)self reloadContentIfNeeded];
  }
}

- (void)reloadContentIfNeeded
{
  if ([(TPSTipsByCollectionViewController *)self pendingReload]
    && [(TPSAppViewController *)self viewWillAppear])
  {
    [(TPSTipsByCollectionViewController *)self updateTipsForCurrentCollection];
    [(TPSTipsByCollectionViewController *)self setPendingReload:0];
  }
}

- (void)updateContent
{
  v3 = [(TPSAppViewController *)self appController];
  objc_super v4 = [v3 collections];
  id v5 = [v4 count];

  if (v5)
  {
LABEL_2:
    v6 = [(TPSAppViewController *)self appController];
    [(TPSTipsByCollectionViewController *)self appControllerContentUpdated:v6];

LABEL_3:
    unsigned int v7 = [(TPSAppViewController *)self appController];
    [(TPSTipsByCollectionViewController *)self appController:v7 loadingContent:0];

    [(TPSTipsByCollectionViewController *)self reloadContentIfNeeded];
    return;
  }
  v8 = [(TPSAppViewController *)self appController];
  unsigned int v9 = [v8 updatingContent];

  v10 = [(TPSAppViewController *)self appController];
  id v12 = v10;
  if (!v9)
  {
    v11 = [v10 featuredCollection];

    if (!v11) {
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  [(TPSTipsByCollectionViewController *)self appController:v10 loadingContent:1];
}

- (void)updateTipsForCurrentCollection
{
  [(TPSTipsByCollectionViewController *)self resetTips];
  v3 = [(TPSTipsViewController *)self tips];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(TPSTipsViewController *)self currentTip];
    id v12 = [v5 identifier];

    v6 = [(TPSAppViewController *)self appController];
    unsigned int v7 = [v6 tipForIdentifier:v12];

    if (!v7)
    {
      v8 = [(TPSTipsViewController *)self tips];
      unsigned int v7 = [v8 firstObject];
    }
    [(TPSTipsViewController *)self setCurrentTip:v7];
    unsigned int v9 = [(TPSTipsViewController *)self currentTip];
    [(TPSTipsViewController *)self updatePageControlToTip:v9];
  }
  else
  {
    v10 = [(TPSAppViewController *)self appController];
    uint64_t v11 = [v10 updatingContent];

    if ((v11 & 1) == 0)
    {
      [(TPSTipsByCollectionViewController *)self showError];
    }
  }
}

- (void)showError
{
  v3 = [(TPSAppViewController *)self appController];
  unsigned __int8 v4 = [v3 updatingContent];

  if ((v4 & 1) == 0)
  {
    id v5 = [(TPSAppViewController *)self appController];
    v6 = [v5 lastFetchError];

    if (v6)
    {
      id v8 = [(TPSAppViewController *)self appController];
      unsigned int v7 = [v8 lastFetchError];
      [(TPSViewController *)self showInlineMessageForError:v7];
    }
    else
    {
      [(TPSViewController *)self showInlineGenericErrorMessage];
    }
  }
}

- (void)updateWithCollectionID:(id)a3 tipID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    id v8 = [(TPSAppViewController *)self appController];
    uint64_t v9 = [v8 collectionIdentifierForTipIdentifier:v7];

    id v6 = (id)v9;
  }
  v10 = [(TPSAppViewController *)self appController];
  uint64_t v11 = [v10 collectionForIdentifier:v6];

  if (([v6 isEqualToString:@"Unknown"] & 1) == 0) {
    [(TPSTipsByCollectionViewController *)self updateTitleTextForCollection:v11];
  }
  if (![(TPSAppViewController *)self viewWillAppear])
  {
    objc_storeStrong((id *)&self->_pendingCollectionID, v6);
    v14 = (NSString *)v7;
    pendingTipID = self->_pendingTipID;
    self->_pendingTipID = v14;
    v42 = (NSString *)v6;
LABEL_46:

    goto LABEL_47;
  }
  id v12 = [(TPSAppViewController *)self appController];
  if ([v12 updatingContent])
  {
    unsigned int v13 = 0;
  }
  else
  {
    v16 = [(TPSAppViewController *)self appController];
    unsigned int v13 = [v16 contentHasLoaded];
  }
  v17 = [(TPSTipsViewController *)self collectionID];
  unsigned int v18 = [v17 isEqualToString:v6];

  if ((v18 & 1) == 0)
  {
    if (v11) {
      char v19 = 1;
    }
    else {
      char v19 = v13;
    }
    id v20 = v6;
    if ((v19 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_pendingCollectionID, v6);
      id v20 = 0;
    }
    [(TPSTipsViewController *)self setCollectionID:v20];
    currentCollectionFirstTipID = self->_currentCollectionFirstTipID;
    self->_currentCollectionFirstTipID = 0;

    [(TPSTipsViewController *)self setCurrentTip:0];
  }
  if (v13) {
    [(TPSTipsViewController *)self removeInlineMessageLabel];
  }
  v22 = [(TPSTipsViewController *)self collectionID];
  if ([v22 isEqualToString:@"Unknown"])
  {

    goto LABEL_26;
  }
  if (!v18)
  {

    goto LABEL_25;
  }
  v23 = self->_pendingTipID;

  if (v23) {
LABEL_25:
  }
    [(TPSTipsByCollectionViewController *)self updateTipsForCurrentCollection];
LABEL_26:
  id v24 = [v7 length];
  v25 = [(TPSTipsViewController *)self currentTip];
  v26 = v25;
  if (v24)
  {
    v27 = [v25 identifier];
    unsigned __int8 v28 = [v27 isEqualToString:v7];

    if (v28) {
      goto LABEL_36;
    }
    v29 = [(TPSTipsViewController *)self tipForTipID:v7];
    if (!v29)
    {
      objc_storeStrong((id *)&self->_pendingTipID, a4);
      v30 = [(TPSTipsViewController *)self tips];
      id v31 = [v30 count];

      if (!v31) {
        [(TPSViewController *)self setLoading:1];
      }
      goto LABEL_35;
    }
LABEL_34:
    [(TPSTipsViewController *)self setCurrentTip:v29];
LABEL_35:

    goto LABEL_36;
  }
  if (!v25) {
    goto LABEL_33;
  }
  v32 = [(TPSTipsViewController *)self tips];
  v33 = [(TPSTipsViewController *)self currentTip];
  id v34 = [v32 indexOfObject:v33];

  if (v34 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    v35 = [(TPSTipsViewController *)self tips];
    v29 = [v35 firstObject];

    goto LABEL_34;
  }
LABEL_36:
  v36 = [(TPSTipsViewController *)self currentTip];
  [(TPSTipsViewController *)self updatePageControlToTip:v36];

  [(TPSTipsViewController *)self ensureCurrentTipVisible];
  v37 = [(TPSTipsViewController *)self currentTip];
  if (v37)
  {
LABEL_41:

    goto LABEL_42;
  }
  v38 = [(TPSTipsViewController *)self tips];
  if ([v38 count]) {
    unsigned int v13 = 0;
  }

  if (v13 == 1)
  {
    pendingCollectionID = self->_pendingCollectionID;
    self->_pendingCollectionID = 0;

    v37 = self->_pendingTipID;
    self->_pendingTipID = 0;
    goto LABEL_41;
  }
LABEL_42:
  v40 = [(TPSTipsViewController *)self collectionID];
  v41 = v40;
  if (!v40) {
    v41 = self->_pendingCollectionID;
  }
  v42 = v41;

  if (![(NSString *)v42 isEqualToString:@"Unknown"])
  {
    pendingTipID = [(TPSAppViewController *)self appController];
    [pendingTipID collectionIdentifierViewed:v42];
    goto LABEL_46;
  }
LABEL_47:
}

- (id)collectionIDForTipID:(id)a3
{
  unsigned __int8 v4 = [(TPSAppViewController *)self appController];
  id v5 = [v4 tipForIdentifier:self->_pendingTipID];

  id v6 = +[TPSCommonDefines sharedInstance];
  id v7 = [v5 collectionIdentifiers];
  id v8 = [v6 collectionIdentifierToUseForCollectionIdentifiers:v7];

  return v8;
}

- (void)appControllerContentUpdated:(id)a3
{
  v21 = self->_currentCollectionFirstTipID;
  unsigned __int8 v4 = [(TPSTipsViewController *)self tips];
  id v5 = [v4 firstObject];
  id v6 = [v5 identifier];
  currentCollectionFirstTipID = self->_currentCollectionFirstTipID;
  self->_currentCollectionFirstTipID = v6;

  p_pendingTipID = &self->_pendingTipID;
  if (self->_pendingTipID) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v21 == 0;
  }
  if (!v9 && ![(NSString *)v21 isEqualToString:self->_currentCollectionFirstTipID]) {
    objc_storeStrong((id *)&self->_pendingTipID, self->_currentCollectionFirstTipID);
  }
  if ([(NSString *)self->_pendingCollectionID isEqualToString:@"Unknown"])
  {
    v10 = [(TPSTipsViewController *)self collectionID];

    if (!v10)
    {
      uint64_t v11 = *p_pendingTipID;
      id v12 = *p_pendingTipID;
      if (!*p_pendingTipID)
      {
        v10 = [(TPSTipsViewController *)self currentTip];
        id v12 = [v10 identifier];
      }
      unsigned int v13 = [(TPSTipsByCollectionViewController *)self collectionIDForTipID:v12];
      pendingCollectionID = self->_pendingCollectionID;
      self->_pendingCollectionID = v13;

      if (!v11)
      {
      }
    }
  }
  v15 = self->_pendingCollectionID;
  if (*p_pendingTipID)
  {
    if (!v15)
    {
      v16 = [(TPSTipsViewController *)self collectionID];
      [(TPSTipsByCollectionViewController *)self updateWithCollectionID:v16 tipID:*p_pendingTipID];

LABEL_18:
      v17 = *p_pendingTipID;
      *p_pendingTipID = 0;

      unsigned int v18 = self->_pendingCollectionID;
      self->_pendingCollectionID = 0;
      goto LABEL_19;
    }
LABEL_17:
    -[TPSTipsByCollectionViewController updateWithCollectionID:tipID:](self, "updateWithCollectionID:tipID:");
    goto LABEL_18;
  }
  if (v15) {
    goto LABEL_17;
  }
  char v19 = [(TPSAppViewController *)self appController];
  id v20 = [(TPSTipsViewController *)self collectionID];
  unsigned int v18 = [v19 collectionForIdentifier:v20];

  [(TPSTipsByCollectionViewController *)self updateTitleTextForCollection:v18];
  [(TPSTipsByCollectionViewController *)self updateTipsForCurrentCollection];
LABEL_19:
}

- (void)updateTitleTextForCollection:(id)a3
{
  id v7 = a3;
  unsigned __int8 v4 = [v7 shortTitle];
  if (!v4)
  {
    uint64_t v5 = [v7 title];
    if (v5) {
      unsigned __int8 v4 = (__CFString *)v5;
    }
    else {
      unsigned __int8 v4 = &stru_1000B98B0;
    }
  }
  [(TPSTipsViewController *)self setTitleText:v4];
  id v6 = [(TPSTipsViewController *)self titleText];
  [(TPSTipsViewController *)self updateNavigationTitle:v6];
}

- (void)appController:(id)a3 loadingContent:(BOOL)a4
{
  if (a4)
  {
    [(TPSTipsViewController *)self removeInlineMessageLabel];
    uint64_t v5 = [(TPSTipsViewController *)self tips];
    id v6 = [v5 count];

    if (!v6)
    {
      [(TPSViewController *)self setLoading:1];
    }
  }
  else
  {
    [(TPSViewController *)self setLoading:0];
    id v7 = [(TPSTipsViewController *)self tips];
    id v8 = [v7 count];

    if (v8)
    {
      [(TPSTipsViewController *)self removeInlineMessageLabel];
      BOOL v9 = [(TPSTipsViewController *)self currentTip];
      [(TPSTipsViewController *)self updatePageControlToTip:v9];
    }
    else
    {
      v10 = [(TPSAppViewController *)self appController];
      BOOL v9 = [v10 lastFetchError];

      [(TPSViewController *)self showInlineMessageForError:v9];
      uint64_t v11 = +[TPSLogger default];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(TPSTipsViewController *)self collectionID];
        int v15 = 138412546;
        v16 = v12;
        __int16 v17 = 2112;
        unsigned int v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tips feed %@ load failed with error %@", (uint8_t *)&v15, 0x16u);
      }
    }

    pendingTipID = self->_pendingTipID;
    self->_pendingTipID = 0;

    pendingCollectionID = self->_pendingCollectionID;
    self->_pendingCollectionID = 0;
  }
}

- (void)resetTips
{
  if ([(NSString *)self->_pendingCollectionID length]
    && ![(NSString *)self->_pendingCollectionID isEqualToString:@"Unknown"])
  {
    v3 = self->_pendingCollectionID;
  }
  else
  {
    v3 = [(TPSTipsViewController *)self collectionID];
  }
  v10 = v3;
  unsigned __int8 v4 = [(TPSTipsByCollectionViewController *)self contentDelegate];
  uint64_t v5 = [v4 tipsByCollectionViewController:self tipsForCollectionID:v10];

  if (v5)
  {
    currentCollectionFirstTipID = self->_currentCollectionFirstTipID;
    self->_currentCollectionFirstTipID = 0;
LABEL_7:

    goto LABEL_9;
  }
  id v7 = [(TPSAppViewController *)self appController];
  uint64_t v5 = [v7 tipsForCollectionIdentifier:v10];

  if (!self->_currentCollectionFirstTipID)
  {
    currentCollectionFirstTipID = [v5 firstObject];
    id v8 = [currentCollectionFirstTipID identifier];
    BOOL v9 = self->_currentCollectionFirstTipID;
    self->_currentCollectionFirstTipID = v8;

    goto LABEL_7;
  }
LABEL_9:
  [(TPSTipsViewController *)self setTips:v5];
}

- (BOOL)skipIntro
{
  return self->_skipIntro;
}

- (void)setSkipIntro:(BOOL)a3
{
  self->_skipIntro = a3;
}

- (BOOL)pendingReload
{
  return self->_pendingReload;
}

- (TPSTipsByCollectionViewControllerDelegate)contentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentDelegate);

  return (TPSTipsByCollectionViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentDelegate);
  objc_storeStrong((id *)&self->_pendingTipID, 0);
  objc_storeStrong((id *)&self->_pendingCollectionID, 0);

  objc_storeStrong((id *)&self->_currentCollectionFirstTipID, 0);
}

@end