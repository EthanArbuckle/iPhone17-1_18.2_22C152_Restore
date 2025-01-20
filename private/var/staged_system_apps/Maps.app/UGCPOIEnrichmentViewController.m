@interface UGCPOIEnrichmentViewController
- (BOOL)deferPhotoPresentationToParent;
- (BOOL)defersPhotoPresentationToParent;
- (BOOL)formInteractionEnabled;
- (BOOL)hasTransitionedToPhotoCarousel;
- (BOOL)isInlineMode;
- (BOOL)isScrollEnabled;
- (BOOL)suppressRatings;
- (BOOL)useTopPromotedAndInsetGroupedNutritionLabel;
- (NSArray)sectionControllers;
- (UGCPOIEnrichmentViewController)initWithPOIEnrichmentForm:(id)a3 presentationContext:(int64_t)a4;
- (UGCPOIEnrichmentViewControllerDelegate)delegate;
- (int)currentTarget;
- (int64_t)presentationContext;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)_updateRowItems;
- (void)_updateScrollViewHairlinesAnimated:(BOOL)a3;
- (void)captureUserAction:(int)a3;
- (void)captureUserAction:(int)a3 withValue:(id)a4;
- (void)logCancelAction;
- (void)logDoneAction;
- (void)photosSectionController:(id)a3 selectedAddPhotosUsingSourceType:(int64_t)a4 presentationOptions:(id)a5;
- (void)photosSectionController:(id)a3 userActionCapturedForAction:(int)a4 value:(id)a5;
- (void)photosSectionController:(id)a3 willShowPhotoCarousel:(BOOL)a4;
- (void)ratingsSectionController:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4;
- (void)ratingsSectionController:(id)a3 userActionCapturedForRatingCategoryState:(int64_t)a4 value:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)sectionControllerDidUpdateRowItems:(id)a3;
- (void)sectionControllerRequestsLegalAttribution:(id)a3;
- (void)setDeferPhotoPresentationToParent:(BOOL)a3;
- (void)setDefersPhotoPresentationToParent:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFormInteractionEnabled:(BOOL)a3;
- (void)setHasTransitionedToPhotoCarousel:(BOOL)a3;
- (void)setIsInlineMode:(BOOL)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setSuppressRatings:(BOOL)a3;
- (void)setUseTopPromotedAndInsetGroupedNutritionLabel:(BOOL)a3;
- (void)submissionFinishedWithError:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation UGCPOIEnrichmentViewController

- (UGCPOIEnrichmentViewController)initWithPOIEnrichmentForm:(id)a3 presentationContext:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UGCPOIEnrichmentViewController;
  v8 = [(UGCPOIEnrichmentViewController *)&v12 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v8->_scrollEnabled = 1;
    v8->_formInteractionEnabled = 1;
    objc_storeStrong((id *)&v8->_poiEnrichmentForm, a3);
    v9->_presentationContext = a4;
    v10 = [(UGCPOIEnrichmentForm *)v9->_poiEnrichmentForm photosForm];
    [v10 addObserver:v9];
  }
  return v9;
}

- (NSArray)sectionControllers
{
  if (!self->_ratingsSectionController)
  {
    v3 = [UGCRatingsSectionController alloc];
    v4 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm ratingsForm];
    v5 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm mapItem];
    v6 = [(UGCRatingsSectionController *)v3 initWithRatingsForm:v4 mapItem:v5 analyticsDelegate:self];
    ratingsSectionController = self->_ratingsSectionController;
    self->_ratingsSectionController = v6;

    [(UGCRatingsSectionController *)self->_ratingsSectionController setDelegate:self];
  }
  if (!self->_photosSectionController)
  {
    v8 = [UGCPhotosSectionController alloc];
    v9 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm photosForm];
    v10 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm mapItem];
    v11 = [(UGCPhotosSectionController *)v8 initWithPhotosForm:v9 mapItem:v10 presentingViewController:self deferAddPhotoPresentationToParent:[(UGCPOIEnrichmentViewController *)self defersPhotoPresentationToParent] analyticsDelegate:self showSuggestedPhotos:!self->_isInlineMode];
    photosSectionController = self->_photosSectionController;
    self->_photosSectionController = v11;

    [(UGCPhotosSectionController *)self->_photosSectionController setDelegate:self];
  }
  if (!self->_userInfoSectionController)
  {
    v13 = [[UGCUserInformationSectionController alloc] initWithInsetGrouped:[(UGCPOIEnrichmentViewController *)self useTopPromotedAndInsetGroupedNutritionLabel]];
    userInfoSectionController = self->_userInfoSectionController;
    self->_userInfoSectionController = v13;

    [(UGCUserInformationSectionController *)self->_userInfoSectionController setDelegate:self];
  }
  unsigned int v15 = [(UGCPOIEnrichmentViewController *)self suppressRatings];
  int IsEnabled_ARPCommunityID = MapsFeature_IsEnabled_ARPCommunityID();
  unsigned int v17 = [(UGCPOIEnrichmentViewController *)self useTopPromotedAndInsetGroupedNutritionLabel];
  if (IsEnabled_ARPCommunityID)
  {
    if (v17)
    {
      if (v15)
      {
        v40 = self->_photosSectionController;
        v18 = &v40;
        uint64_t v19 = 1;
        goto LABEL_27;
      }
      v23 = self->_photosSectionController;
      v39[0] = self->_ratingsSectionController;
      v39[1] = v23;
      v18 = (UGCPhotosSectionController **)v39;
      goto LABEL_19;
    }
    if (v15)
    {
      v21 = self->_userInfoSectionController;
      v38[0] = self->_photosSectionController;
      v38[1] = v21;
      v18 = (UGCPhotosSectionController **)v38;
      goto LABEL_19;
    }
    v25 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm photosForm];
    if ([v25 numberOfAddedPhotos])
    {
    }
    else
    {
      unsigned __int8 v27 = [(UGCPOIEnrichmentViewController *)self hasTransitionedToPhotoCarousel];

      if ((v27 & 1) == 0)
      {
        v31 = self->_photosSectionController;
        v36[0] = self->_ratingsSectionController;
        v36[1] = v31;
        v18 = (UGCPhotosSectionController **)v36;
        goto LABEL_19;
      }
    }
    v28 = self->_photosSectionController;
    v37[0] = self->_ratingsSectionController;
    v37[1] = v28;
    v37[2] = self->_userInfoSectionController;
    v18 = (UGCPhotosSectionController **)v37;
  }
  else if (v17)
  {
    if (v15)
    {
      v20 = self->_photosSectionController;
      v35[0] = self->_userInfoSectionController;
      v35[1] = v20;
      v18 = (UGCPhotosSectionController **)v35;
LABEL_19:
      uint64_t v19 = 2;
      goto LABEL_27;
    }
    v24 = self->_ratingsSectionController;
    v34[0] = self->_userInfoSectionController;
    v34[1] = v24;
    v34[2] = self->_photosSectionController;
    v18 = (UGCPhotosSectionController **)v34;
  }
  else
  {
    if (v15)
    {
      v22 = self->_userInfoSectionController;
      v33[0] = self->_photosSectionController;
      v33[1] = v22;
      v18 = (UGCPhotosSectionController **)v33;
      goto LABEL_19;
    }
    v26 = self->_photosSectionController;
    v32[0] = self->_ratingsSectionController;
    v32[1] = v26;
    v32[2] = self->_userInfoSectionController;
    v18 = (UGCPhotosSectionController **)v32;
  }
  uint64_t v19 = 3;
LABEL_27:
  v29 = +[NSArray arrayWithObjects:v18 count:v19];

  return (NSArray *)v29;
}

- (void)_setupSubviews
{
  [(UGCPOIEnrichmentViewController *)self _mapsui_resetViewLayoutMargins];
  v3 = +[UIColor clearColor];
  v4 = [(UGCPOIEnrichmentViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(UGCPOIEnrichmentViewController *)self view];
  [v5 setAccessibilityIdentifier:@"UGCPOIEnrichmentView"];

  id v6 = objc_alloc((Class)UIScrollView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = [v6 initWithFrame:CGRectMake(0, 0, width, height)];
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  [(UIScrollView *)self->_scrollView setScrollEnabled:self->_scrollEnabled];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView _mapsui_resetLayoutMargins];
  uint64_t v12 = sub_1000BBB44(self);
  v13 = self->_scrollView;
  if (v12 == 5)
  {
    [(UIScrollView *)v13 setPreservesSuperviewLayoutMargins:1];
  }
  else
  {
    [(UIScrollView *)v13 setPreservesSuperviewLayoutMargins:0];
    -[UIScrollView setDirectionalLayoutMargins:](self->_scrollView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:3];
  }
  v14 = [(UGCPOIEnrichmentViewController *)self view];
  [v14 addSubview:self->_scrollView];

  unsigned int v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  contentView = self->_contentView;
  self->_contentView = v15;

  [(UIView *)self->_contentView _mapsui_resetLayoutMarginsWithPreservesSuperview:1];
  [(UIScrollView *)self->_scrollView addSubview:self->_contentView];
  unsigned int v17 = (MUStackLayout *)[objc_alloc((Class)MUStackLayout) initWithContainer:self->_contentView axis:1];
  stackLayout = self->_stackLayout;
  self->_stackLayout = v17;

  [(UGCPOIEnrichmentViewController *)self _updateRowItems];

  [(UGCPOIEnrichmentViewController *)self _updateScrollViewHairlinesAnimated:0];
}

- (void)_setupConstraints
{
  id v3 = objc_alloc((Class)MUEdgeLayout);
  scrollView = self->_scrollView;
  v5 = [(UGCPOIEnrichmentViewController *)self view];
  id v6 = [v3 initWithItem:scrollView container:v5];

  id v7 = objc_alloc((Class)MUEdgeLayout);
  contentView = self->_contentView;
  v9 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  id v10 = [v7 initWithItem:contentView container:v9];

  v11 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  uint64_t v12 = [v11 widthAnchor];
  v13 = [(UIScrollView *)self->_scrollView frameLayoutGuide];
  v14 = [v13 widthAnchor];
  unsigned int v15 = [v12 constraintEqualToAnchor:v14];

  v19[0] = self->_stackLayout;
  v19[1] = v6;
  v19[2] = v10;
  v16 = +[NSArray arrayWithObjects:v19 count:3];
  v18 = v15;
  unsigned int v17 = +[NSArray arrayWithObjects:&v18 count:1];
  +[NSLayoutConstraint _mapsui_activateLayouts:v16 constraints:v17];
}

- (void)_updateConstraints
{
  [(NSLayoutConstraint *)self->_heightConstraint setActive:0];
  BOOL scrollEnabled = self->_scrollEnabled;
  v4 = [(UIScrollView *)self->_scrollView frameLayoutGuide];
  v5 = [v4 heightAnchor];
  id v6 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  id v7 = [v6 heightAnchor];
  if (scrollEnabled)
  {
    v8 = [v5 constraintGreaterThanOrEqualToAnchor:v7];
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = v8;

    LODWORD(v10) = 1112276992;
    [(NSLayoutConstraint *)self->_heightConstraint setPriority:v10];
  }
  else
  {
    v11 = [v5 constraintEqualToAnchor:v7];
    uint64_t v12 = self->_heightConstraint;
    self->_heightConstraint = v11;
  }
  v13 = self->_heightConstraint;

  [(NSLayoutConstraint *)v13 setActive:1];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)UGCPOIEnrichmentViewController;
  [(UGCPOIEnrichmentViewController *)&v12 viewDidLoad];
  [(UGCPOIEnrichmentViewController *)self _setupSubviews];
  [(UGCPOIEnrichmentViewController *)self _setupConstraints];
  [(UGCPOIEnrichmentViewController *)self _updateConstraints];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(UGCPOIEnrichmentViewController *)self sectionControllers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setFormInteractionEnabled:self->_formInteractionEnabled];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  if (![(UGCPOIEnrichmentViewController *)self isInlineMode]) {
    [(UGCPOIEnrichmentViewController *)self captureUserAction:2142];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UGCPOIEnrichmentViewController;
  [(UGCPOIEnrichmentViewController *)&v3 viewDidLayoutSubviews];
  [(UGCPOIEnrichmentViewController *)self _updateScrollViewHairlinesAnimated:0];
}

- (void)setIsInlineMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isInlineMode = a3;
  [(UGCPOIEnrichmentViewController *)self setScrollEnabled:!a3];
  [(UGCPOIEnrichmentViewController *)self setDefersPhotoPresentationToParent:v3];

  [(UGCPOIEnrichmentViewController *)self setUseTopPromotedAndInsetGroupedNutritionLabel:v3];
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (self->_scrollEnabled != a3)
  {
    self->_BOOL scrollEnabled = a3;
    if ([(UGCPOIEnrichmentViewController *)self isViewLoaded])
    {
      [(UIScrollView *)self->_scrollView setScrollEnabled:self->_scrollEnabled];
      [(UGCPOIEnrichmentViewController *)self _updateConstraints];
    }
    [(UGCPOIEnrichmentViewController *)self _updateScrollViewHairlinesAnimated:0];
  }
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  if (self->_formInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_formInteractionEnabled = a3;
    if ([(UGCPOIEnrichmentViewController *)self isViewLoaded])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = [(UGCPOIEnrichmentViewController *)self sectionControllers];
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v10 + 1) + 8 * i) setFormInteractionEnabled:v3];
          }
          id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)_updateRowItems
{
  BOOL v3 = +[NSMutableArray array];
  [(MUStackLayout *)self->_stackLayout prepare];
  [(MUStackLayout *)self->_stackLayout setArrangedLayoutItems:&__NSArray0__struct];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(UGCPOIEnrichmentViewController *)self sectionControllers];
  id v37 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v48;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v4;
        id v5 = *(void **)(*((void *)&v47 + 1) + 8 * v4);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v6 = [v5 rowItems];
        id v7 = [v6 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v44;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v44 != v9) {
                objc_enumerationMutation(v6);
              }
              long long v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              long long v12 = [v11 rowView];
              if (([v12 isHidden] & 1) == 0)
              {
                [v12 setPreservesSuperviewLayoutMargins:1];
                [v3 addObject:v12];
                [(UIView *)self->_contentView addSubview:v12];
                [(MUStackLayout *)self->_stackLayout addArrangedLayoutItem:v12];
                [v11 bottomSpacing];
                if (v13 > 0.0)
                {
                  v14 = v3;
                  stackLayout = self->_stackLayout;
                  [v11 bottomSpacing];
                  v16 = stackLayout;
                  BOOL v3 = v14;
                  -[MUStackLayout setPadding:forArrangedLayoutItem:](v16, "setPadding:forArrangedLayoutItem:", v12, 0.0, 0.0, v17, 0.0);
                }
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v38 + 1;
      }
      while ((id)(v38 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v37);
  }

  v18 = [(MUStackLayout *)self->_stackLayout arrangedLayoutItems];
  id v19 = [v18 count];

  if (v19)
  {
    if (self->_scrollEnabled && sub_1000BBB44(self) != 5)
    {
      v20 = self->_stackLayout;
      v21 = [(MUStackLayout *)v20 arrangedLayoutItems];
      v22 = [v21 lastObject];
      double top = 0.0;
      double leading = 0.0;
      double bottom = 12.0;
      double trailing = 0.0;
    }
    else
    {
      v20 = self->_stackLayout;
      v21 = [(MUStackLayout *)v20 arrangedLayoutItems];
      v22 = [v21 lastObject];
      double top = NSDirectionalEdgeInsetsZero.top;
      double leading = NSDirectionalEdgeInsetsZero.leading;
      double bottom = NSDirectionalEdgeInsetsZero.bottom;
      double trailing = NSDirectionalEdgeInsetsZero.trailing;
    }
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v20, "setPadding:forArrangedLayoutItem:", v22, top, leading, bottom, trailing);
  }
  [(MUStackLayout *)self->_stackLayout activate];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  unsigned __int8 v27 = self->_rowViews;
  id v28 = [(NSArray *)v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        if (([v3 containsObject:v32] & 1) == 0) {
          [v32 removeFromSuperview];
        }
      }
      id v29 = [(NSArray *)v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v29);
  }

  v33 = (NSArray *)[v3 copy];
  rowViews = self->_rowViews;
  self->_rowViews = v33;
}

- (void)_updateScrollViewHairlinesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UGCPOIEnrichmentViewController *)self isViewLoaded])
  {
    topScrollHairline = self->_topScrollHairline;
    if (self->_scrollEnabled)
    {
      if (!topScrollHairline)
      {
        id v6 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        id v7 = self->_topScrollHairline;
        self->_topScrollHairline = v6;

        id v8 = [(UGCPOIEnrichmentViewController *)self view];
        [v8 addSubview:self->_topScrollHairline];

        id v9 = [objc_alloc((Class)MUEdgeLayout) initWithItem:self->_topScrollHairline container:self->_scrollView];
        [v9 setEdges:11];
        [v9 activate];
      }
      if (!self->_bottomScrollHairline)
      {
        long long v12 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        bottomScrollHairline = self->_bottomScrollHairline;
        self->_bottomScrollHairline = v12;

        v14 = [(UGCPOIEnrichmentViewController *)self view];
        [v14 addSubview:self->_bottomScrollHairline];

        id v15 = [objc_alloc((Class)MUEdgeLayout) initWithItem:self->_bottomScrollHairline container:self->_scrollView];
        [v15 setEdges:14];
        [v15 activate];
      }
      unsigned __int8 v16 = [(UIScrollView *)self->_scrollView _maps_edgesObscuringContentIncludingContentInsets:0];
      if (v16) {
        double v17 = 1.0;
      }
      else {
        double v17 = 0.0;
      }
      v21[4] = self;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1008E4BE8;
      v22[3] = &unk_1012EB708;
      v22[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1008E4BFC;
      v21[3] = &unk_1012EB730;
      +[UIScrollView _maps_updateHairlineAlpha:v3 animated:v22 getter:v21 setter:v17];
      if ((v16 & 4) != 0) {
        double v18 = 1.0;
      }
      else {
        double v18 = 0.0;
      }
      v19[4] = self;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1008E4C10;
      v20[3] = &unk_1012EB708;
      v20[4] = self;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1008E4C24;
      void v19[3] = &unk_1012EB730;
      +[UIScrollView _maps_updateHairlineAlpha:v3 animated:v20 getter:v19 setter:v18];
    }
    else
    {
      [(UGCHairlineView *)topScrollHairline removeFromSuperview];
      long long v10 = self->_topScrollHairline;
      self->_topScrollHairline = 0;

      [(UGCHairlineView *)self->_bottomScrollHairline removeFromSuperview];
      long long v11 = self->_bottomScrollHairline;
      self->_bottomScrollHairline = 0;
    }
  }
}

- (void)submissionFinishedWithError:(id)a3
{
  if (!a3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v3 = [(UGCPOIEnrichmentViewController *)self sectionControllers];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) handleSuccessfulSubmission];
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)sectionControllerDidUpdateRowItems:(id)a3
{
  [(UGCPOIEnrichmentViewController *)self _updateRowItems];
  id v4 = [(UGCPOIEnrichmentViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UGCPOIEnrichmentViewController *)self delegate];
    [v6 contentDidUpdate];
  }
}

- (void)photosSectionController:(id)a3 willShowPhotoCarousel:(BOOL)a4
{
  if ([(UGCPOIEnrichmentViewController *)self hasTransitionedToPhotoCarousel] != a4)
  {
    [(UGCPOIEnrichmentViewController *)self setHasTransitionedToPhotoCarousel:1];
    [(UGCPOIEnrichmentViewController *)self _updateRowItems];
  }
}

- (void)sectionControllerRequestsLegalAttribution:(id)a3
{
  uint64_t v4 = GEOConfigGetString();
  id v7 = +[NSURL URLWithString:v4];

  char v5 = [(UGCPOIEnrichmentViewController *)self delegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(UGCPOIEnrichmentViewController *)self delegate];
    [v6 poiEnrichmentViewController:self didSelectTermsOfServiceURL:v7];
  }
  else
  {
    id v6 = [objc_alloc((Class)SFSafariViewController) initWithURL:v7];
    [(UGCPOIEnrichmentViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (void)ratingsSectionController:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4
{
  long long v8 = (void (**)(id, uint64_t))a4;
  char v5 = [(UGCPOIEnrichmentViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UGCPOIEnrichmentViewController *)self delegate];
    [v7 poiEnrichmentViewController:self presentInformedConsentIfNeededWithCompletion:v8];
  }
  else if (v8)
  {
    v8[2](v8, 1);
  }
}

- (void)ratingsSectionController:(id)a3 userActionCapturedForRatingCategoryState:(int64_t)a4 value:(id)a5
{
  id v10 = a5;
  id v7 = [(UGCPOIEnrichmentViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v9 = [(UGCPOIEnrichmentViewController *)self delegate];
    [v9 poiEnrichmentViewController:self captureUserActionForRatingCategoryState:a4 value:v10 target:[self currentTarget]];
  }
}

- (void)photosSectionController:(id)a3 selectedAddPhotosUsingSourceType:(int64_t)a4 presentationOptions:(id)a5
{
  id v10 = a5;
  if ([(UGCPOIEnrichmentViewController *)self defersPhotoPresentationToParent])
  {
    id v7 = [(UGCPOIEnrichmentViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      long long v9 = [(UGCPOIEnrichmentViewController *)self delegate];
      [v9 poiEnrichmentViewController:self didSelectAddPhotosUsingSourceType:a4 presentationOptions:v10];
    }
  }
}

- (void)photosSectionController:(id)a3 userActionCapturedForAction:(int)a4 value:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v10 = a5;
  id v7 = [(UGCPOIEnrichmentViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v9 = [(UGCPOIEnrichmentViewController *)self delegate];
    [v9 poiEnrichmentViewController:self captureUserAction:v5 value:v10 target:[self currentTarget]];
  }
}

- (int)currentTarget
{
  unint64_t v2 = [(UGCPOIEnrichmentViewController *)self presentationContext];
  if (v2 > 2) {
    return 0;
  }
  else {
    return dword_100F728C4[v2];
  }
}

- (void)captureUserAction:(int)a3
{
}

- (void)captureUserAction:(int)a3 withValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  +[GEOAPPortal captureUserAction:v4 target:[(UGCPOIEnrichmentViewController *)self currentTarget] value:v6];
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (UGCPOIEnrichmentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCPOIEnrichmentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (BOOL)isScrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)isInlineMode
{
  return self->_isInlineMode;
}

- (BOOL)defersPhotoPresentationToParent
{
  return self->_defersPhotoPresentationToParent;
}

- (void)setDefersPhotoPresentationToParent:(BOOL)a3
{
  self->_defersPhotoPresentationToParent = a3;
}

- (BOOL)useTopPromotedAndInsetGroupedNutritionLabel
{
  return self->_useTopPromotedAndInsetGroupedNutritionLabel;
}

- (void)setUseTopPromotedAndInsetGroupedNutritionLabel:(BOOL)a3
{
  self->_useTopPromotedAndInsetGroupedNutritionLabel = a3;
}

- (BOOL)suppressRatings
{
  return self->_suppressRatings;
}

- (void)setSuppressRatings:(BOOL)a3
{
  self->_suppressRatings = a3;
}

- (BOOL)deferPhotoPresentationToParent
{
  return self->_deferPhotoPresentationToParent;
}

- (void)setDeferPhotoPresentationToParent:(BOOL)a3
{
  self->_deferPhotoPresentationToParent = a3;
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (BOOL)hasTransitionedToPhotoCarousel
{
  return self->_hasTransitionedToPhotoCarousel;
}

- (void)setHasTransitionedToPhotoCarousel:(BOOL)a3
{
  self->_hasTransitionedToPhotoCarousel = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomScrollHairline, 0);
  objc_storeStrong((id *)&self->_topScrollHairline, 0);
  objc_storeStrong((id *)&self->_userInfoSectionController, 0);
  objc_storeStrong((id *)&self->_photosSectionController, 0);
  objc_storeStrong((id *)&self->_ratingsSectionController, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)logCancelAction
{
}

- (void)logDoneAction
{
}

@end