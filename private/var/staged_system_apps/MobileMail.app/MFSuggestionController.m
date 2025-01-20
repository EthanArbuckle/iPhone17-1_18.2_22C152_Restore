@interface MFSuggestionController
+ (void)initialize;
- (EFScheduler)scheduler;
- (MFMessageHeaderView)headerView;
- (MFSuggestionBannerView)suggestionBanner;
- (MFSuggestionController)initWithDelegate:(id)a3 headerView:(id)a4;
- (MFSuggestionHandlingDelegate)delegate;
- (SGFoundInSuggestionPresenter)suggestionPresenter;
- (id)createAnalysisOperation;
- (id)suggestionCategoryComparatorForManager:(id)a3;
- (id)viewControllerForPresentingFromBannerByPresenter:(id)a3;
- (int64_t)suggestionsUIContext;
- (void)clearSuggestionsBannerAnimated:(BOOL)a3;
- (void)presentViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSuggestionBanner:(id)a3;
- (void)setSuggestionPresenter:(id)a3;
- (void)suggestionPresenterWantsToHideBanner:(id)a3;
- (void)suggestionPresenterWantsToShowBanner:(id)a3;
@end

@implementation MFSuggestionController

+ (void)initialize
{
  if (qword_100699D80 != -1) {
    dispatch_once(&qword_100699D80, &stru_10060D368);
  }
}

- (MFSuggestionController)initWithDelegate:(id)a3 headerView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFSuggestionController;
  v8 = [(MFSuggestionController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_headerView, v7);
    v10 = (SGFoundInSuggestionPresenter *)objc_alloc_init((Class)SGFoundInSuggestionPresenter);
    suggestionPresenter = v9->_suggestionPresenter;
    v9->_suggestionPresenter = v10;

    [(SGFoundInSuggestionPresenter *)v9->_suggestionPresenter setDelegate:v9];
    uint64_t v12 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.MFSuggestionController" qualityOfService:25];
    scheduler = v9->_scheduler;
    v9->_scheduler = (EFScheduler *)v12;
  }
  return v9;
}

- (id)createAnalysisOperation
{
  v3 = [MFSuggestionAnalysisOperation alloc];
  v4 = [(MFSuggestionController *)self suggestionPresenter];
  v5 = [(MFSuggestionController *)self scheduler];
  id v6 = [(MFSuggestionAnalysisOperation *)v3 initWithDelegate:self presenter:v4 scheduler:v5];

  return v6;
}

- (void)clearSuggestionsBannerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  id v6 = [(MFSuggestionController *)self suggestionBanner];
  [WeakRetained removeHeaderBlock:v6 animated:v3];

  [(MFSuggestionController *)self setSuggestionBanner:0];
}

- (void)presentViewController:(id)a3
{
  id v5 = a3;
  v4 = [(MFSuggestionController *)self delegate];
  [v4 presentSuggestionViewController:v5];
}

- (int64_t)suggestionsUIContext
{
  return 0;
}

- (void)suggestionPresenterWantsToShowBanner:(id)a3
{
  id v14 = a3;
  v4 = [(MFSuggestionController *)self delegate];
  unsigned int v5 = [v4 showsBanners];

  if (v5)
  {
    id v6 = [v14 banner];
    id v7 = [(MFSuggestionController *)self suggestionBanner];

    if (v7)
    {
      id v8 = [(MFSuggestionController *)self suggestionBanner];
      [v8 setBanner:v6];
    }
    else
    {
      id v8 = [objc_alloc((Class)MFSuggestionBannerView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [(MFSuggestionController *)self setSuggestionBanner:v8];
    }

    v9 = [v14 suggestions];
    if ([v9 count] == (id)1)
    {
      v10 = [v9 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [v6 setImages:0];
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
    v13 = [(MFSuggestionController *)self suggestionBanner];
    [WeakRetained insertHeaderBlock:v13 atIndex:0 animated:1];
  }
}

- (void)suggestionPresenterWantsToHideBanner:(id)a3
{
}

- (id)viewControllerForPresentingFromBannerByPresenter:(id)a3
{
  BOOL v3 = [(MFSuggestionController *)self delegate];
  v4 = [v3 viewControllerForPresentingSuggestions];

  return v4;
}

- (id)suggestionCategoryComparatorForManager:(id)a3
{
  BOOL v3 = +[EMListUnsubscribeSuggestion unsubscribeSuggestionComparator];

  return v3;
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (SGFoundInSuggestionPresenter)suggestionPresenter
{
  return self->_suggestionPresenter;
}

- (void)setSuggestionPresenter:(id)a3
{
}

- (MFSuggestionHandlingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFSuggestionHandlingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFMessageHeaderView)headerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);

  return (MFMessageHeaderView *)WeakRetained;
}

- (void)setHeaderView:(id)a3
{
}

- (MFSuggestionBannerView)suggestionBanner
{
  return self->_suggestionBanner;
}

- (void)setSuggestionBanner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionBanner, 0);
  objc_destroyWeak((id *)&self->_headerView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionPresenter, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end