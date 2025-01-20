@interface EpisodeListAvailableViewController
- (BOOL)_isLastEpisodeRowForIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)shouldShowRevealMoreFooter;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (EpisodeListAvailableStyle)style;
- (EpisodeListAvailableViewController)initWithNotification:(id)a3;
- (NSArray)installedConstraints;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (UICollectionReusableView)showMoreFooterView;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (double)_preferredCollectionViewHeight;
- (id)_episodeSourceAtIndexPath:(id)a3;
- (id)_loadedIndexPathForEpisodeWithUuid:(id)a3;
- (id)actionsWithDefaultActions:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)headerTitle;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)countOfAllEpisodes;
- (unint64_t)numberOfRevealedEpisodes;
- (void)_removeNotificationFromHistory;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)episodesPropertySourceController:(id)a3 didUpdateEpisodePropertySourcesAtIndexes:(id)a4;
- (void)episodesPropertySourceControllerDidUpdatingNeedingFullReload:(id)a3;
- (void)handlePlayActionForEpisodeAvailableCell:(id)a3;
- (void)handleShowMoreEpisodesForFooterView:(id)a3;
- (void)loadCollectionView;
- (void)loadConstraints;
- (void)loadContentViews;
- (void)playEpisodeWithDefaultBehaviorForEpisodeWithDataSource:(id)a3;
- (void)revealMoreEpisodes;
- (void)setNumberOfRevealedEpisodes:(unint64_t)a3;
- (void)showEpisodeDetailsForEpisodeWithDataSource:(id)a3;
- (void)showPodcastDetails;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDynamicConstraints;
- (void)updateViewConstraints;
@end

@implementation EpisodeListAvailableViewController

- (EpisodeListAvailableViewController)initWithNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 request];
  v6 = [v5 content];
  v7 = [v6 mt_notificationEpisodes];

  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)EpisodeListAvailableViewController;
    v8 = [(ContentAvailableViewController *)&v14 initWithNotification:v4];
    if (v8)
    {
      uint64_t v9 = +[EpisodeListAvailableStyle defaultStyle];
      style = v8->_style;
      v8->_style = (EpisodeListAvailableStyle *)v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unexpected state encountered.  We should never have no episodes in a notification!", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EpisodeListAvailableViewController;
  [(EpisodeListAvailableViewController *)&v4 traitCollectionDidChange:a3];
  [(EpisodeListAvailableViewController *)self updateDynamicConstraints];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)EpisodeListAvailableViewController;
  [(EpisodeListAvailableViewController *)&v3 updateViewConstraints];
  [(EpisodeListAvailableViewController *)self updateDynamicConstraints];
}

- (void)revealMoreEpisodes
{
  objc_super v3 = (char *)[(EpisodeListAvailableViewController *)self numberOfRevealedEpisodes] + 24;

  [(EpisodeListAvailableViewController *)self setNumberOfRevealedEpisodes:v3];
}

- (void)showEpisodeDetailsForEpisodeWithDataSource:(id)a3
{
  id v4 = a3;
  [(EpisodeListAvailableViewController *)self _removeNotificationFromHistory];
  id v6 = [v4 openEpisodeDetailInAppURL];

  if (v6)
  {
    v5 = [(EpisodeListAvailableViewController *)self extensionContext];
    [v5 openURL:v6 completionHandler:0];
  }
}

- (void)showPodcastDetails
{
  [(EpisodeListAvailableViewController *)self _removeNotificationFromHistory];
  objc_super v3 = [(ContentAvailableViewController *)self episodesPropertySourceController];
  id v6 = [v3 firstEpisodePropertySource];

  id v4 = [v6 openPodcastDetailInAppURL];
  if (v4)
  {
    v5 = [(EpisodeListAvailableViewController *)self extensionContext];
    [v5 openURL:v4 completionHandler:0];
  }
}

- (void)playEpisodeWithDefaultBehaviorForEpisodeWithDataSource:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006280;
  v3[3] = &unk_10002C9E0;
  v3[4] = self;
  [a3 initiatePlaybackWithCompletion:v3];
}

- (id)actionsWithDefaultActions:(id)a3
{
  objc_super v3 = [(ContentAvailableViewController *)self episodesPropertySourceController];
  [v3 firstEpisodePropertySource];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006478;
  v12[3] = &unk_10002CA08;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v4;
  v5 = [v3 firstEpisodePropertySourcePassingTest:v12];

  if ([v4 requiresForegroundLaunch]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = +[UNNotificationAction mt_playMultipleEpisodesActionWithCount:options:](UNNotificationAction, "mt_playMultipleEpisodesActionWithCount:options:", [v3 countOfEpisodePropertySources], v6);
  v8 = (void *)v7;
  if (v5)
  {
    uint64_t v14 = v7;
    uint64_t v9 = +[NSArray arrayWithObjects:&v14 count:1];
  }
  else
  {
    v15[0] = v7;
    v10 = +[UNNotificationAction mt_showOnePodcastMultipleEpisodesDetail];
    v15[1] = v10;
    uint64_t v9 = +[NSArray arrayWithObjects:v15 count:2];
  }

  return v9;
}

- (id)headerTitle
{
  objc_super v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_EPISODE_N_AVAILABLE_HEADER_FORMAT" value:&stru_10002D2B8 table:0];

  v5 = [(ContentAvailableViewController *)self episodesPropertySourceController];
  uint64_t v6 = +[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, @"%u", 0, [v5 countOfEpisodePropertySources]);

  return v6;
}

- (void)loadContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)EpisodeListAvailableViewController;
  [(ContentAvailableViewController *)&v3 loadContentViews];
  [(EpisodeListAvailableViewController *)self loadCollectionView];
  [(EpisodeListAvailableViewController *)self setNumberOfRevealedEpisodes:24];
}

- (void)loadCollectionView
{
  objc_super v3 = (UICollectionViewFlowLayout *)objc_alloc_init((Class)UICollectionViewFlowLayout);
  flowLayout = self->_flowLayout;
  self->_flowLayout = v3;

  +[EpisodeAvailableCell defaultHeight];
  double v6 = v5;
  -[UICollectionViewFlowLayout setEstimatedItemSize:](self->_flowLayout, "setEstimatedItemSize:", UICollectionViewFlowLayoutAutomaticSize.width, v5);
  -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", UICollectionViewFlowLayoutAutomaticSize.width, v6);
  [(UICollectionViewFlowLayout *)self->_flowLayout setMinimumLineSpacing:0.0];
  -[UICollectionViewFlowLayout setSectionInset:](self->_flowLayout, "setSectionInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [(UICollectionViewFlowLayout *)self->_flowLayout setScrollDirection:0];
  uint64_t v7 = [objc_alloc((Class)UICollectionView) initWithFrame:self->_flowLayout collectionViewLayout:0.0, 0.0, 0.0, 0.0];
  collectionView = self->_collectionView;
  self->_collectionView = v7;

  [(UICollectionView *)self->_collectionView mt_registerCellClass:objc_opt_class()];
  [(UICollectionView *)self->_collectionView mt_registerSupplementaryViewClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionFooter];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  uint64_t v9 = [(ContentAvailableViewController *)self headerTitleLabel];
  [v9 contentCompressionResistancePriorityForAxis:1];
  float v11 = v10;

  *(float *)&double v12 = v11 + -1.0;
  [(UICollectionView *)self->_collectionView setContentCompressionResistancePriority:1 forAxis:v12];
  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = +[UIColor backgroundColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v13];

  id v14 = [(EpisodeListAvailableViewController *)self view];
  [v14 addSubview:self->_collectionView];
}

- (void)loadConstraints
{
  v45.receiver = self;
  v45.super_class = (Class)EpisodeListAvailableViewController;
  [(ContentAvailableViewController *)&v45 loadConstraints];
  objc_super v3 = [(EpisodeListAvailableViewController *)self style];
  id v4 = [(EpisodeListAvailableViewController *)self view];
  double v5 = [(ContentAvailableViewController *)self headerTitleLabel];
  double v6 = [(EpisodeListAvailableViewController *)self collectionView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 defaultMarginH];
  double v8 = v7;
  [v3 defaultMarginH];
  [v6 setLayoutMargins:0.0, v8, 0.0, v9];
  float v10 = [v5 firstBaselineAnchor];
  float v11 = [v4 topAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  id v13 = [v3 cell_container_To_mainHeaderBL];
  v44 = [v12 mt_copyWithDynamicTypeConstant:v13];

  v46[0] = v44;
  id v14 = [v5 leadingAnchor];
  v15 = [v4 leadingAnchor];
  [v3 defaultMarginH];
  v43 = [v14 constraintEqualToAnchor:v15];

  v46[1] = v43;
  v42 = v5;
  v16 = [v5 trailingAnchor];
  v17 = [v4 trailingAnchor];
  [v3 defaultMarginH];
  v41 = [v16 constraintEqualToAnchor:v17 constant:-v18];

  v46[2] = v41;
  v40 = [v6 heightAnchor];
  [(EpisodeListAvailableViewController *)self _preferredCollectionViewHeight];
  [v40 constraintEqualToConstant:];
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  self->_collectionViewHeightConstraint = v19;

  v46[3] = v19;
  v21 = [v6 topAnchor];
  v22 = [v5 lastBaselineAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v24 = [v3 cell_mainHeaderBL_To_collectionViewTop];
  v25 = [v23 mt_copyWithDynamicTypeConstant:v24];

  v46[4] = v25;
  v26 = [v6 leadingAnchor];
  v27 = [v4 leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:0.0];

  v46[5] = v28;
  v29 = [v6 trailingAnchor];
  v30 = [v4 trailingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:0.0];

  v46[6] = v31;
  v32 = [v4 bottomAnchor];
  v33 = [v6 bottomAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:0.0];

  v46[7] = v34;
  v35 = +[NSArray arrayWithObjects:v46 count:8];
  installedConstraints = self->_installedConstraints;
  self->_installedConstraints = v35;

  LODWORD(v37) = 1112014848;
  [v34 setPriority:v37];
  [v6 reloadData];
  v38 = [(EpisodeListAvailableViewController *)self installedConstraints];
  +[NSLayoutConstraint activateConstraints:v38];

  [(EpisodeListAvailableViewController *)self updateDynamicConstraints];
  v39 = [(EpisodeListAvailableViewController *)self view];
  [v39 invalidateIntrinsicContentSize];
}

- (void)updateDynamicConstraints
{
  objc_super v3 = [(EpisodeListAvailableViewController *)self installedConstraints];
  +[MTDynamicTypeConstant updateDynamicConstantInConstraints:v3];

  [(EpisodeListAvailableViewController *)self _preferredCollectionViewHeight];
  double v5 = v4;
  id v6 = [(EpisodeListAvailableViewController *)self collectionViewHeightConstraint];
  [v6 setConstant:v5];
}

- (void)episodesPropertySourceControllerDidUpdatingNeedingFullReload:(id)a3
{
  id v3 = [(EpisodeListAvailableViewController *)self collectionView];
  [v3 reloadData];
}

- (void)episodesPropertySourceController:(id)a3 didUpdateEpisodePropertySourcesAtIndexes:(id)a4
{
  id v9 = a4;
  double v5 = +[NSMutableArray array];
  for (id i = [v9 firstIndex];
        i < (id)[(EpisodeListAvailableViewController *)self numberOfRevealedEpisodes];
        id i = [v9 indexGreaterThanIndex:i])
  {
    double v7 = +[NSIndexPath indexPathForRow:i inSection:0];
    [v5 addObject:v7];
  }
  double v8 = [(EpisodeListAvailableViewController *)self collectionView];
  [v8 reloadItemsAtIndexPaths:v5];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 mt_dequeueReusableCellClass:objc_opt_class() forIndexPath:v6];

  [v8 setDelegate:self];
  id v9 = [(EpisodeListAvailableViewController *)self _episodeSourceAtIndexPath:v6];
  [v8 setEpisodePropertySource:v9];
  BOOL v10 = ![(EpisodeListAvailableViewController *)self shouldShowRevealMoreFooter]
     && [(EpisodeListAvailableViewController *)self _isLastEpisodeRowForIndexPath:v6];
  [v8 setSeparatorHidden:v10];

  return v8;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 cellForItemAtIndexPath:v6];
  [v7 setHighlighted:1];

  id v8 = [(EpisodeListAvailableViewController *)self _episodeSourceAtIndexPath:v6];

  [(EpisodeListAvailableViewController *)self showEpisodeDetailsForEpisodeWithDataSource:v8];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a3;
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;
  [v6 frame];
  double v12 = v11;

  double v13 = v12 - (v8 + v10);
  id v14 = [(EpisodeListAvailableViewController *)self flowLayout];
  [v14 itemSize];
  double v16 = v15;

  double v17 = v13;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v10 mt_dequeueReusableSupplementaryViewClass:objc_opt_class() supplementaryViewKind:v9 forIndexPath:v8];

  [v11 setActionHandler:self];

  return v11;
}

- (void)handlePlayActionForEpisodeAvailableCell:(id)a3
{
  id v4 = [a3 episodePropertySource];
  [(EpisodeListAvailableViewController *)self playEpisodeWithDefaultBehaviorForEpisodeWithDataSource:v4];
}

- (void)handleShowMoreEpisodesForFooterView:(id)a3
{
}

- (BOOL)shouldShowRevealMoreFooter
{
  unint64_t v3 = [(EpisodeListAvailableViewController *)self numberOfRevealedEpisodes];
  return v3 != [(EpisodeListAvailableViewController *)self countOfAllEpisodes];
}

- (unint64_t)countOfAllEpisodes
{
  v2 = [(ContentAvailableViewController *)self episodesPropertySourceController];
  id v3 = [v2 countOfEpisodePropertySources];

  return (unint64_t)v3;
}

- (void)setNumberOfRevealedEpisodes:(unint64_t)a3
{
  if (self->_numberOfRevealedEpisodes != a3)
  {
    unint64_t v5 = [(EpisodeListAvailableViewController *)self countOfAllEpisodes];
    if (v5 >= a3) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = v5;
    }
    self->_numberOfRevealedEpisodes = v6;
    if ([(EpisodeListAvailableViewController *)self shouldShowRevealMoreFooter])
    {
      +[ShowMoreFooterView defaultHeight];
      double v8 = v7;
      id v9 = [(EpisodeListAvailableViewController *)self flowLayout];
      id v10 = v9;
      double width = 0.0;
      double v12 = v8;
    }
    else
    {
      CGFloat height = CGSizeZero.height;
      id v9 = [(EpisodeListAvailableViewController *)self flowLayout];
      id v10 = v9;
      double width = CGSizeZero.width;
      double v12 = height;
    }
    [v9 setFooterReferenceSize:width, v12];

    id v14 = [(EpisodeListAvailableViewController *)self flowLayout];
    [v14 invalidateLayout];

    double v15 = [(EpisodeListAvailableViewController *)self collectionView];
    [v15 reloadData];

    id v16 = [(EpisodeListAvailableViewController *)self view];
    [v16 setNeedsUpdateConstraints];
  }
}

- (BOOL)_isLastEpisodeRowForIndexPath:(id)a3
{
  id v4 = (char *)[a3 row];
  return v4 == (char *)[(EpisodeListAvailableViewController *)self countOfAllEpisodes] - 1;
}

- (id)_loadedIndexPathForEpisodeWithUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    unint64_t v5 = [(ContentAvailableViewController *)self episodesPropertySourceController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007410;
    v9[3] = &unk_10002CA08;
    id v10 = v4;
    id v6 = [v5 indexOfPropertySourcePassingTest:v9];

    if (v6 >= (id)[(EpisodeListAvailableViewController *)self numberOfRevealedEpisodes])
    {
      double v7 = 0;
    }
    else
    {
      double v7 = +[NSIndexPath indexPathForRow:v6 inSection:0];
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)_episodeSourceAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 row];
  if (v5 >= (id)[(EpisodeListAvailableViewController *)self countOfAllEpisodes])
  {
    double v7 = 0;
  }
  else
  {
    id v6 = [(ContentAvailableViewController *)self episodesPropertySourceController];
    double v7 = [v6 episodePropertySourceAtIndex:[v4 row]];
  }

  return v7;
}

- (double)_preferredCollectionViewHeight
{
  [(EpisodeListAvailableViewController *)self flowLayout];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000075D8;
  v8[3] = &unk_10002CA30;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v9;
  id v4 = objc_retainBlock(v8);
  double v5 = ((double (*)(void *, unint64_t))v4[2])(v4, [(EpisodeListAvailableViewController *)self numberOfRevealedEpisodes]);
  double v6 = ((double (*)(void *, uint64_t))v4[2])(v4, 100000);
  if (v5 >= v6) {
    double v5 = v6;
  }

  return v5;
}

- (void)_removeNotificationFromHistory
{
  id v3 = [(ContentAvailableViewController *)self episodesPropertySourceController];
  v2 = [v3 notification];
  [v2 mt_removeFromUserNotificationCenter];
}

- (EpisodeListAvailableStyle)style
{
  return self->_style;
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionReusableView)showMoreFooterView
{
  return self->_showMoreFooterView;
}

- (NSArray)installedConstraints
{
  return self->_installedConstraints;
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (unint64_t)numberOfRevealedEpisodes
{
  return self->_numberOfRevealedEpisodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_installedConstraints, 0);
  objc_storeStrong((id *)&self->_showMoreFooterView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end