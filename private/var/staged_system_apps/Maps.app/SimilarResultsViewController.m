@interface SimilarResultsViewController
- (BOOL)_isDisplayingAssociatedTrailsOrTrailheads;
- (MKMapItem)originalMapItem;
- (_MKInfoCardAnalyticsDelegate)analyticsDelegate;
- (void)_captureCloseAction;
- (void)_captureTapActionWithSearchResult:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setOriginalMapItem:(id)a3;
- (void)updateTitle;
- (void)viewDidLoad;
@end

@implementation SimilarResultsViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SimilarResultsViewController;
  [(SimpleResultsViewController *)&v7 viewDidLoad];
  uint64_t v3 = sub_1000BBB44(self);
  v4 = [(SimpleResultsViewController *)self titleHeaderView];
  v5 = v4;
  if (v3 == 5)
  {
    [v4 setButtonHidden:0];

    v5 = [(SimpleResultsViewController *)self titleHeaderView];
    [v5 setTitleViewInsets:32.0, 0.0, 0.0, 0.0];
  }
  else
  {
    [v4 setTitleView:0];
  }

  v6 = [(SimpleResultsViewController *)self headerView];
  [v6 setPreservesSuperviewLayoutMargins:1];

  [(SimilarResultsViewController *)self updateTitle];
}

- (void)setHeaderTitle:(id)a3
{
  id v5 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    v6.receiver = self;
    v6.super_class = (Class)SimilarResultsViewController;
    [(SimpleResultsViewController *)&v6 setHeaderTitle:v5];
  }
  else
  {
    objc_storeStrong((id *)&self->_headerTitle, a3);
    if ([(SimilarResultsViewController *)self isViewLoaded]) {
      [(SimilarResultsViewController *)self updateTitle];
    }
  }
}

- (void)updateTitle
{
  if (sub_1000BBB44(self) == 5)
  {
    v5.receiver = self;
    v5.super_class = (Class)SimilarResultsViewController;
    [(SimpleResultsViewController *)&v5 updateTitle:0];
  }
  else
  {
    headerTitle = self->_headerTitle;
    id v4 = [(SimpleResultsViewController *)self titleHeaderView];
    [v4 setTitle:headerTitle];
  }
}

- (void)_captureTapActionWithSearchResult:(id)a3
{
  id v25 = a3;
  id v4 = [(SimilarResultsViewController *)self originalMapItem];
  objc_super v5 = [v4 _relatedPlaceLists];
  objc_super v6 = [v5 firstObject];
  unsigned int v7 = [v6 type];

  switch(v7)
  {
    case 0u:
    case 4u:
      if ([(SimilarResultsViewController *)self _isDisplayingAssociatedTrailsOrTrailheads])
      {
        v8 = [(SimilarResultsViewController *)self originalMapItem];
        unsigned int v9 = [v8 _mapsui_associatedHikingItemType];

        if (v9 == 1)
        {
          uint64_t v10 = 365;
          uint64_t v11 = 128;
        }
        else if (v9 == 2)
        {
          uint64_t v10 = 412;
          uint64_t v11 = 129;
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v10 = 0;
        }
        v22 = [v25 mapItem];
        unsigned __int8 v23 = [v22 _hasMUID];

        if (v23) {
          goto LABEL_18;
        }
      }
      else
      {
        v18 = [v25 mapItem];
        unsigned int v19 = [v18 _hasHikeInfo];

        if (!v19)
        {
          v12 = 0;
          goto LABEL_22;
        }
        v20 = [v25 mapItem];
        unsigned int v21 = [v20 _hasHikeInfo];

        uint64_t v10 = 467;
        uint64_t v11 = 133;
        if (v21)
        {
LABEL_18:
          v24 = [v25 mapItem];
          v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v24 _muid]);

          if (!v11) {
            goto LABEL_22;
          }
          goto LABEL_19;
        }
      }
      v12 = 0;
      if (!v11) {
        goto LABEL_22;
      }
LABEL_19:
      if (!v10) {
        goto LABEL_22;
      }
      v13 = [(SimilarResultsViewController *)self analyticsDelegate];
      [v13 infoCardAnalyticsDidSelectAction:v10 target:v11 eventValue:v12 feedbackDelegateSelector:0 actionRichProviderId:0];
      goto LABEL_21;
    case 1u:
      v12 = [(SimilarResultsViewController *)self analyticsDelegate];
      v13 = [v25 mapItem];
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v13 _muid]);
      v15 = v12;
      uint64_t v16 = 6079;
      uint64_t v17 = 655;
      goto LABEL_9;
    case 2u:
      v12 = [(SimilarResultsViewController *)self analyticsDelegate];
      v13 = [v25 mapItem];
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v13 _muid]);
      v15 = v12;
      uint64_t v16 = 6081;
      uint64_t v17 = 656;
      goto LABEL_9;
    case 3u:
      v12 = [(SimilarResultsViewController *)self analyticsDelegate];
      v13 = [v25 mapItem];
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v13 _muid]);
      v15 = v12;
      uint64_t v16 = 6080;
      uint64_t v17 = 654;
LABEL_9:
      [v15 infoCardAnalyticsDidSelectAction:v16 target:v17 eventValue:v14 feedbackDelegateSelector:0 actionRichProviderId:0];

LABEL_21:
LABEL_22:

      goto LABEL_23;
    default:
LABEL_23:

      return;
  }
}

- (void)_captureCloseAction
{
  uint64_t v3 = [(SimilarResultsViewController *)self originalMapItem];
  id v4 = [v3 _relatedPlaceLists];
  objc_super v5 = [v4 firstObject];
  unsigned int v6 = [v5 type];

  switch(v6)
  {
    case 0u:
    case 4u:
      if (![(SimilarResultsViewController *)self _isDisplayingAssociatedTrailsOrTrailheads])return; {
      unsigned int v7 = [(SimilarResultsViewController *)self originalMapItem];
      }
      unsigned int v8 = [v7 _mapsui_associatedHikingItemType];

      if (v8 == 2)
      {
        uint64_t v9 = 129;
        goto LABEL_11;
      }
      if (v8 == 1)
      {
        uint64_t v9 = 128;
LABEL_11:
        uint64_t v10 = [(SimilarResultsViewController *)self analyticsDelegate];
        id v12 = v10;
        uint64_t v11 = v9;
        goto LABEL_12;
      }
      return;
    case 1u:
      uint64_t v10 = [(SimilarResultsViewController *)self analyticsDelegate];
      id v12 = v10;
      uint64_t v11 = 655;
      goto LABEL_12;
    case 2u:
      uint64_t v10 = [(SimilarResultsViewController *)self analyticsDelegate];
      id v12 = v10;
      uint64_t v11 = 656;
      goto LABEL_12;
    case 3u:
      uint64_t v10 = [(SimilarResultsViewController *)self analyticsDelegate];
      id v12 = v10;
      uint64_t v11 = 654;
LABEL_12:
      [v10 infoCardAnalyticsDidSelectAction:4 target:v11 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];

      return;
    default:
      return;
  }
}

- (BOOL)_isDisplayingAssociatedTrailsOrTrailheads
{
  v2 = [(SimilarResultsViewController *)self originalMapItem];
  uint64_t v3 = [v2 _trailHead];
  BOOL v4 = v3 != 0;

  return v4;
}

- (MKMapItem)originalMapItem
{
  return self->_originalMapItem;
}

- (void)setOriginalMapItem:(id)a3
{
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (_MKInfoCardAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_originalMapItem, 0);

  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end