@interface SiriUILegacyCardSectionViewController
+ (id)cardSectionClasses;
- (BOOL)_shouldAttemptToConnectToRemoteViewController;
- (BOOL)siriSnippetViewControllerIsVisible:(id)a3;
- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3;
- (CGSize)siriViewControllerVisibleContentArea:(id)a3;
- (SiriUISnippetViewController)backingSnippetViewController;
- (SiriUISnippetViewController)containingSnippetViewController;
- (UIEdgeInsets)siriViewControllerBackgroundInsets:(id)a3;
- (double)boundingWidthForSnippetViewController:(id)a3;
- (double)siriViewControllerExpectedWidth:(id)a3;
- (double)statusBarHeightForSiriViewController:(id)a3;
- (id)_createReusableViewIfNeededWithClass:(Class)a3;
- (id)_interaction;
- (id)additionalSpeechInterpretationsForSiriViewController:(id)a3;
- (id)localeForSiriViewController:(id)a3;
- (id)persistentDataStoreForSiriViewController:(id)a3;
- (id)siriEnabledAppListForSiriViewController:(id)a3;
- (id)siriViewController:(id)a3 disambiguationItemForListItem:(id)a4 disambiguationKey:(id)a5;
- (id)siriViewController:(id)a3 domainObjectForIdentifier:(id)a4;
- (id)siriViewController:(id)a3 filteredDisambiguationListItems:(id)a4;
- (id)siriViewController:(id)a3 listItemToPickInAutodisambiguationForListItems:(id)a4;
- (id)siriViewControllerEffectiveBundleForCoreLocation:(id)a3;
- (id)updatedUserUtteranceForSiriViewController:(id)a3;
- (unint64_t)siriDeviceLockStateForSnippetViewController:(id)a3;
- (void)_loadCardSectionView;
- (void)_updateContentSize;
- (void)cancelRequestForSiriSnippetViewController:(id)a3;
- (void)cancelSpeakingForSiriViewController:(id)a3;
- (void)removeSiriViewController:(id)a3;
- (void)setContainingSnippetViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)siriSnippetViewController:(id)a3 didDismissViewController:(id)a4;
- (void)siriSnippetViewController:(id)a3 didPresentViewController:(id)a4;
- (void)siriSnippetViewController:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4;
- (void)siriSnippetViewController:(id)a3 didShowGuideStartDate:(id)a4 endDate:(id)a5;
- (void)siriSnippetViewController:(id)a3 pushSirilandSnippets:(id)a4;
- (void)siriSnippetViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4;
- (void)siriSnippetViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5;
- (void)siriSnippetViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)siriSnippetViewController:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)siriSnippetViewController:(id)a3 shouldPresentPicker:(id)a4 completion:(id)a5;
- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4;
- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4;
- (void)siriSnippetViewControllerViewDidLoad:(id)a3;
- (void)siriSnippetViewControllerWillBecomeFirstResponder:(id)a3;
- (void)siriViewController:(id)a3 addSelectionResponse:(id)a4;
- (void)siriViewController:(id)a3 didHideVibrantView:(id)a4;
- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5;
- (void)siriViewController:(id)a3 performAceCommands:(id)a4;
- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5;
- (void)siriViewController:(id)a3 setContentOffset:(double)a4;
- (void)siriViewController:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5;
- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5;
- (void)siriViewController:(id)a3 startCorrectedSpeechRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6;
- (void)siriViewControllerDidEndEditing:(id)a3;
- (void)siriViewControllerHeightDidChange:(id)a3;
- (void)siriViewControllerRequestTearDownEditingViewController:(id)a3;
- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4;
- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4;
- (void)siriViewControllerWillBeginEditing:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SiriUILegacyCardSectionViewController

- (id)_interaction
{
  v3 = [(CRKCardSectionViewController *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(CRKCardSectionViewController *)self delegate];
    v5 = [v4 card];
    v6 = [v5 interactions];
    v7 = [v6 anyObject];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)cardSectionClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (void)setDelegate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SiriUILegacyCardSectionViewController;
  [(CRKCardSectionViewController *)&v9 setDelegate:a3];
  v4 = [(SiriUILegacyCardSectionViewController *)self _interaction];
  v5 = +[SiriUISnippetManager sharedInstance];
  v6 = [v4 _snippet];
  v7 = [v5 snippetViewControllerForSnippet:v6];
  snippetViewController = self->_snippetViewController;
  self->_snippetViewController = v7;

  [(CRKCardSectionViewController *)self setLoading:[(SiriUISnippetViewController *)self->_snippetViewController isLoading]];
  if ([(SiriUILegacyCardSectionViewController *)self isViewLoaded]) {
    [(SiriUILegacyCardSectionViewController *)self _loadCardSectionView];
  }
}

- (void)_loadCardSectionView
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4 = [a2 _snippet];
  int v5 = 136315650;
  v6 = "-[SiriUILegacyCardSectionViewController _loadCardSectionView]";
  __int16 v7 = 2112;
  v8 = v4;
  __int16 v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_2231EF000, v3, OS_LOG_TYPE_ERROR, "%s #cards No snippet view controller for snippet: %@, interaction: %@", (uint8_t *)&v5, 0x20u);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUILegacyCardSectionViewController;
  [(CRKCardSectionViewController *)&v3 viewDidLayoutSubviews];
  [(SiriUILegacyCardSectionViewController *)self _updateContentSize];
}

- (BOOL)_shouldAttemptToConnectToRemoteViewController
{
  return 0;
}

- (void)_updateContentSize
{
  [(SiriUILegacyCardSectionViewController *)self siriViewControllerExpectedWidth:self->_snippetViewController];
  double v4 = v3;
  char v5 = objc_opt_respondsToSelector();
  id v8 = [(SiriUILegacyCardSectionViewController *)self view];
  snippetViewController = self->_snippetViewController;
  if (v5) {
    [(SiriUISnippetViewController *)snippetViewController desiredHeightForWidth:v4];
  }
  else {
    [(SiriUIBaseSnippetViewController *)snippetViewController desiredHeight];
  }
  objc_msgSend(v8, "setContentSize:", v4, v7);
}

- (id)_createReusableViewIfNeededWithClass:(Class)a3
{
  if (a3)
  {
    id v4 = [a3 alloc];
    char v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    if (objc_opt_respondsToSelector()) {
      [v5 setSnippetViewController:self->_snippetViewController];
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (void)siriSnippetViewController:(id)a3 pushSirilandSnippets:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  v6 = [v8 delegate];
  double v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriSnippetViewController:v7 pushSirilandSnippets:v5];
}

- (void)siriSnippetViewControllerViewDidLoad:(id)a3
{
  [(CRKCardSectionViewController *)self _finishLoadingViewIfNecessary];
  [(SiriUILegacyCardSectionViewController *)self _updateContentSize];
}

- (void)siriSnippetViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v8 = [v10 delegate];
  __int16 v9 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v8 siriSnippetViewController:v9 setStatusBarHidden:v6 animated:v5];
}

- (void)siriSnippetViewController:(id)a3 shouldPresentPicker:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  __int16 v9 = [v11 delegate];
  id v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v9 siriSnippetViewController:v10 shouldPresentPicker:v8 completion:v7];
}

- (void)siriSnippetViewController:(id)a3 didShowGuideStartDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  __int16 v9 = [v11 delegate];
  id v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v9 siriSnippetViewController:v10 didShowGuideStartDate:v8 endDate:v7];
}

- (BOOL)siriSnippetViewControllerIsVisible:(id)a3
{
  id v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  BOOL v5 = [v4 delegate];
  BOOL v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v7 = [v5 siriSnippetViewControllerIsVisible:v6];

  return v7;
}

- (void)siriSnippetViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  BOOL v6 = [v8 delegate];
  char v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriSnippetViewController:v7 requestPasscodeUnlockWithCompletion:v5];
}

- (void)siriSnippetViewControllerWillBecomeFirstResponder:(id)a3
{
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v4 = [v6 delegate];
  id v5 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v4 siriSnippetViewControllerWillBecomeFirstResponder:v5];
}

- (unint64_t)siriDeviceLockStateForSnippetViewController:(id)a3
{
  id v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 delegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  unint64_t v7 = [v5 siriDeviceLockStateForSnippetViewController:v6];

  return v7;
}

- (id)siriEnabledAppListForSiriViewController:(id)a3
{
  id v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 delegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  unint64_t v7 = [v5 siriEnabledAppListForSiriViewController:v6];

  return v7;
}

- (void)siriSnippetViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v11 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  __int16 v9 = [v11 delegate];
  id v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v9 siriSnippetViewController:v10 setStatusBarHidden:v7 animated:v6];
}

- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  id v5 = a3;
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  BOOL v6 = [v7 delegate];
  [v6 siriViewControllerViewDidAppear:v5 isTopLevelViewController:0];
}

- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  id v5 = a3;
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  BOOL v6 = [v7 delegate];
  [v6 siriViewControllerViewDidDisappear:v5 isTopLevelViewController:0];
}

- (double)boundingWidthForSnippetViewController:(id)a3
{
  double v3 = [(SiriUILegacyCardSectionViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  return v5;
}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  BOOL v6 = [v8 delegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriViewController:v7 performAceCommands:v5];
}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  __int16 v9 = [v11 delegate];
  id v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v9 siriViewController:v10 performAceCommands:v8 completion:v7];
}

- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  __int16 v9 = [v11 delegate];
  id v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v9 siriViewController:v10 openURL:v8 completion:v7];
}

- (id)siriViewController:(id)a3 domainObjectForIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  __int16 v9 = [v8 delegate];
  id v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v11 = [v9 siriViewController:v10 domainObjectForIdentifier:v7];

  v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    v15 = "-[SiriUILegacyCardSectionViewController siriViewController:domainObjectForIdentifier:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_2231EF000, v12, OS_LOG_TYPE_DEFAULT, "%s #cards Retrieving a domain object for a legacy snippet view controller:\n    Siri view controller: %@\n    Identifier: %@\n    Domain object: %@", (uint8_t *)&v14, 0x2Au);
  }

  return v11;
}

- (void)siriViewController:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315906;
    __int16 v16 = "-[SiriUILegacyCardSectionViewController siriViewController:setDomainObject:forIdentifier:]";
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_2231EF000, v11, OS_LOG_TYPE_DEFAULT, "%s #cards Storing a domain object on behalf of a legacy snippet view controller:\n    Siri view controller: %@\n    Domain object: %@\n    Identifier: %@", (uint8_t *)&v15, 0x2Au);
  }
  v12 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  v13 = [v12 delegate];
  int v14 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v13 siriViewController:v14 setDomainObject:v9 forIdentifier:v10];
}

- (id)siriViewControllerEffectiveBundleForCoreLocation:(id)a3
{
  double v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 delegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v7 = [v5 siriViewControllerEffectiveBundleForCoreLocation:v6];

  return v7;
}

- (double)siriViewControllerExpectedWidth:(id)a3
{
  double v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 delegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v5 siriViewControllerExpectedWidth:v6];
  double v8 = v7;

  return v8;
}

- (CGSize)siriViewControllerVisibleContentArea:(id)a3
{
  double v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 delegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v5 siriViewControllerVisibleContentArea:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)siriViewControllerHeightDidChange:(id)a3
{
  [(SiriUILegacyCardSectionViewController *)self _updateContentSize];
  id v4 = [(CRKCardSectionViewController *)self delegate];
  [v4 cardSectionViewControllerBoundsDidChange:self];
}

- (void)siriViewController:(id)a3 setContentOffset:(double)a4
{
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v6 = [v8 delegate];
  double v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriViewController:v7 setContentOffset:a4];
}

- (id)siriViewController:(id)a3 filteredDisambiguationListItems:(id)a4
{
  id v5 = a4;
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v7 = [v6 delegate];
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v9 = [v7 siriViewController:v8 filteredDisambiguationListItems:v5];

  return v9;
}

- (id)siriViewController:(id)a3 disambiguationItemForListItem:(id)a4 disambiguationKey:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v10 = [v9 delegate];
  double v11 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v12 = [v10 siriViewController:v11 disambiguationItemForListItem:v8 disambiguationKey:v7];

  return v12;
}

- (id)siriViewController:(id)a3 listItemToPickInAutodisambiguationForListItems:(id)a4
{
  id v5 = a4;
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v7 = [v6 delegate];
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v9 = [v7 siriViewController:v8 listItemToPickInAutodisambiguationForListItems:v5];

  return v9;
}

- (void)siriViewController:(id)a3 addSelectionResponse:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v6 = [v8 delegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriViewController:v7 addSelectionResponse:v5];
}

- (void)cancelRequestForSiriSnippetViewController:(id)a3
{
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v4 = [v6 delegate];
  id v5 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v4 cancelRequestForSiriSnippetViewController:v5];
}

- (id)persistentDataStoreForSiriViewController:(id)a3
{
  id v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 delegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v7 = [v5 persistentDataStoreForSiriViewController:v6];

  return v7;
}

- (void)siriSnippetViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v7 = [v6 delegate];
  uint64_t v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v7 siriSnippetViewController:v8 setStatusViewHidden:v4];

  double v9 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v10 = [v9 delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    id v13 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
    double v11 = [v13 delegate];
    double v12 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
    [v11 siriSnippetViewController:v12 setTypeToSiriViewHidden:v4];
  }
}

- (void)siriViewController:(id)a3 didHideVibrantView:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v6 = [v8 delegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriViewController:v7 didHideVibrantView:v5];
}

- (id)updatedUserUtteranceForSiriViewController:(id)a3
{
  BOOL v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
    id v8 = [v7 delegate];
    double v9 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
    double v10 = [v8 updatedUserUtteranceForSiriViewController:v9];
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

- (double)statusBarHeightForSiriViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v6 = [v5 delegate];
  [v6 statusBarHeightForSiriViewController:v4];
  double v8 = v7;

  return v8;
}

- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v9 = [v11 _privateDelegate];
  double v10 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v9 siriViewController:v10 speakText:v8 completion:v7];
}

- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v6 = [v8 _privateDelegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriSnippetViewController:v7 willPresentViewController:v5];
}

- (void)siriSnippetViewController:(id)a3 didPresentViewController:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v6 = [v8 _privateDelegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriSnippetViewController:v7 didPresentViewController:v5];
}

- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v6 = [v8 _privateDelegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriSnippetViewController:v7 willDismissViewController:v5];
}

- (void)siriSnippetViewController:(id)a3 didDismissViewController:(id)a4
{
  id v5 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v6 = [v8 _privateDelegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriSnippetViewController:v7 didDismissViewController:v5];
}

- (void)siriSnippetViewController:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v6 = [v8 _privateDelegate];
  id v7 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v6 siriSnippetViewController:v7 didRequestKeyboardWithVisibility:v4];
}

- (void)cancelSpeakingForSiriViewController:(id)a3
{
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  BOOL v4 = [v6 _privateDelegate];
  id v5 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v4 cancelSpeakingForSiriViewController:v5];
}

- (void)removeSiriViewController:(id)a3
{
  id v4 = a3;
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v6 _privateDelegate];
  [v5 removeSiriViewController:v4];
}

- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3
{
  id v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 _privateDelegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v7 = [v5 siriViewControllerShouldPreventUserInteraction:v6];

  return v7;
}

- (void)siriViewControllerWillBeginEditing:(id)a3
{
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v4 = [v6 _privateDelegate];
  id v5 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v4 siriViewControllerWillBeginEditing:v5];
}

- (void)siriViewControllerDidEndEditing:(id)a3
{
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v4 = [v6 _privateDelegate];
  id v5 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v4 siriViewControllerDidEndEditing:v5];
}

- (void)siriViewController:(id)a3 startCorrectedSpeechRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v14 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  double v12 = [v14 _privateDelegate];
  id v13 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v12 siriViewController:v13 startCorrectedSpeechRequestWithText:v11 correctionIdentifier:v10 userSelectionResults:v9];
}

- (void)siriViewControllerRequestTearDownEditingViewController:(id)a3
{
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v4 = [v6 _privateDelegate];
  id v5 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  [v4 siriViewControllerRequestTearDownEditingViewController:v5];
}

- (id)localeForSiriViewController:(id)a3
{
  id v4 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  id v5 = [v4 _privateDelegate];
  id v6 = [(SiriUILegacyCardSectionViewController *)self containingSnippetViewController];
  char v7 = [v5 localeForSiriViewController:v6];

  return v7;
}

- (id)additionalSpeechInterpretationsForSiriViewController:(id)a3
{
  return 0;
}

- (UIEdgeInsets)siriViewControllerBackgroundInsets:(id)a3
{
  double v3 = *MEMORY[0x263F1D1C0];
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SiriUISnippetViewController)backingSnippetViewController
{
  return self->_snippetViewController;
}

- (SiriUISnippetViewController)containingSnippetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSnippetViewController);
  return (SiriUISnippetViewController *)WeakRetained;
}

- (void)setContainingSnippetViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingSnippetViewController);
  objc_storeStrong((id *)&self->_snippetViewController, 0);
}

@end