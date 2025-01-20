@interface RAPHomeDataSource
- (BOOL)_isInternalInstall;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)isEmpty;
- (RAPHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4;
- (SupplementaryElementsDataSourceDelegate)supplementaryElementsDelegate;
- (double)footerHeightForSection:(int64_t)a3 collectionView:(id)a4;
- (double)headerHeightForSection:(int64_t)a3 collectionView:(id)a4;
- (id)RAPHomeReportMenu;
- (id)_footerLinkText;
- (id)_footerString90Days;
- (id)_footerStringActionsSection;
- (id)_footerStringReviewedSection;
- (id)_headerStringActionsSection;
- (id)_headerStringInReviewSection;
- (id)_headerStringIncidentsReportedSection;
- (id)_headerStringIssuesReportedSection;
- (id)_headerStringReviewedSection;
- (id)_headerStringTellUsMoreSection;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int)analyticsTarget;
- (int)entryPoint;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)sectionForIndex:(unint64_t)a3;
- (void)_addSections;
- (void)_buildReportHistoryContent;
- (void)_loadReportHistoryContent;
- (void)_populateActionSection;
- (void)_populateIncidentsSection;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)privacyTextTapped;
- (void)reportHistoryManagerDidUpdate:(id)a3;
- (void)seeAllTappedForReportForSection:(int64_t)a3;
- (void)setEntryPoint:(int)a3;
- (void)setSupplementaryElementsDelegate:(id)a3;
@end

@implementation RAPHomeDataSource

- (RAPHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RAPHomeDataSource;
  v7 = [(DataSource *)&v25 initWithCollectionView:v6 updateLocation:v4];
  if (v7)
  {
    v8 = +[UserProfileReportHistoryManager sharedInstance];
    uint64_t v9 = [v8 rapHistory];
    allReports = v7->_allReports;
    v7->_allReports = (NSArray *)v9;

    v11 = +[UserProfileReportHistoryManager sharedInstance];
    [v11 refineRAPHistory];

    v12 = +[UserProfileReportHistoryManager sharedInstance];
    v13 = [v12 observers];
    [v13 registerObserver:v7];

    v14 = objc_alloc_init(RAPReportMenuProvider);
    reportMenuProvider = v7->_reportMenuProvider;
    v7->_reportMenuProvider = v14;

    [(RAPHomeDataSource *)v7 _loadReportHistoryContent];
    [(RAPHomeDataSource *)v7 _populateActionSection];
    [(RAPHomeDataSource *)v7 _populateIncidentsSection];
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ReportLinkCell"];
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"IncidentsCell"];
    uint64_t v16 = objc_opt_class();
    v17 = +[TwoLineCollectionViewListCell identifier];
    [v6 registerClass:v16 forCellWithReuseIdentifier:v17];

    uint64_t v18 = objc_opt_class();
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v6 registerClass:v18 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v20];

    uint64_t v21 = objc_opt_class();
    v22 = +[SectionHeaderCollectionReusableView reuseIdentifier];
    [v6 registerClass:v21 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v22];

    v23 = [(DataSource *)v7 collectionView];
    [v23 reloadData];
  }
  return v7;
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_homeViewSections count] == 0;
}

- (void)_populateActionSection
{
  v3 = +[NSMutableArray arrayWithArray:&off_1013AD878];
  reportActionSections = self->_reportActionSections;
  self->_reportActionSections = v3;

  v5 = +[GEOPlatform sharedPlatform];
  unsigned int v6 = [v5 supportsNavigation];

  if (v6)
  {
    [(NSMutableArray *)self->_reportActionSections addObject:&off_1013A7A50];
    v7 = +[TrafficIncidentLayoutManager sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1005BB4B4;
    v8[3] = &unk_1012F0F88;
    v8[4] = self;
    [v7 fetchTrafficIncidentsLayout:v8];
  }
}

- (void)_populateIncidentsSection
{
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  incidentsSections = self->_incidentsSections;
  self->_incidentsSections = v3;

  v5 = +[UserProfileReportHistoryManager sharedInstance];
  uint64_t v6 = (uint64_t)[v5 crashesCount];

  if (v6 >= 1) {
    [(NSMutableArray *)self->_incidentsSections addObject:&off_1013A7A08];
  }
  v7 = +[UserProfileReportHistoryManager sharedInstance];
  uint64_t v8 = (uint64_t)[v7 hazardsCount];

  if (v8 >= 1) {
    [(NSMutableArray *)self->_incidentsSections addObject:&off_1013A7A68];
  }
  uint64_t v9 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned int v10 = [v9 inChina];

  v11 = +[UserProfileReportHistoryManager sharedInstance];
  v12 = v11;
  if (v10)
  {
    id v13 = [v11 roadWorkCount];

    if ((uint64_t)v13 <= 0) {
      return;
    }
    v14 = &off_1013A7A38;
  }
  else
  {
    uint64_t v15 = (uint64_t)[v11 speedChecksCount];

    if (v15 < 1) {
      return;
    }
    v14 = &off_1013A7A20;
  }
  uint64_t v16 = self->_incidentsSections;

  [(NSMutableArray *)v16 addObject:v14];
}

- (void)_loadReportHistoryContent
{
  [(RAPHomeDataSource *)self _buildReportHistoryContent];
  id v3 = [(DataSource *)self delegate];
  [v3 dataSourceUpdated:self];
}

- (void)_buildReportHistoryContent
{
  id v3 = +[NSArray array];
  reportsInReview = self->_reportsInReview;
  self->_reportsInReview = v3;

  v5 = +[NSArray array];
  reportsAlreadyReviewed = self->_reportsAlreadyReviewed;
  uint64_t v30 = 136;
  self->_reportsAlreadyReviewed = v5;

  v7 = +[NSArray array];
  reportsTellUsMore = self->_reportsTellUsMore;
  self->_reportsTellUsMore = v7;

  uint64_t v9 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned int v10 = [v9 rapHistory];

  v11 = +[NSMutableArray array];
  v12 = +[NSMutableArray array];
  id v13 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unsigned int v20 = [v19 reportStatus];
        uint64_t v21 = v11;
        if (!v20) {
          goto LABEL_11;
        }
        if (v20 == 2)
        {
          uint64_t v21 = v13;
LABEL_11:
          [v21 addObject:v19];
          continue;
        }
        uint64_t v21 = v12;
        if (v20 == 1) {
          goto LABEL_11;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }

  id v22 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"dateOfReportCreation" ascending:0];
  v23 = +[NSArray arrayWithObject:v22];
  v24 = [v11 sortedArrayUsingDescriptors:v23];
  objc_super v25 = self->_reportsInReview;
  self->_reportsInReview = v24;

  v26 = [v12 sortedArrayUsingDescriptors:v23];
  v27 = *(Class *)((char *)&self->super.super.isa + v30);
  *(Class *)((char *)&self->super.super.isa + v30) = v26;

  v28 = [v13 sortedArrayUsingDescriptors:v23];
  v29 = self->_reportsTellUsMore;
  self->_reportsTellUsMore = v28;

  [(RAPHomeDataSource *)self _addSections];
}

- (void)_addSections
{
  id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  homeViewSections = self->_homeViewSections;
  self->_homeViewSections = v3;

  if (![(RAPHomeDataSource *)self _isRAPNewUI]
    && _MKRAPIsAvailable()
    && (sub_100521BD0() & 1) == 0)
  {
    [(NSMutableArray *)self->_homeViewSections addObject:&off_1013A7A80];
  }
  v5 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned int v6 = [v5 inChina];

  if (v6)
  {
    if (![(NSArray *)self->_allReports count]) {
      goto LABEL_16;
    }
    v7 = &off_1013A7A98;
    goto LABEL_15;
  }
  if ([(RAPHomeDataSource *)self _isRAPNewUI])
  {
    uint64_t v8 = +[UserProfileReportHistoryManager sharedInstance];
    unsigned int v9 = [v8 hasTellUsMoreRAPs];

    if (v9) {
      [(NSMutableArray *)self->_homeViewSections addObject:&off_1013A7AB0];
    }
  }
  unsigned int v10 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned int v11 = [v10 hasInReviewRAPs];

  if (v11) {
    [(NSMutableArray *)self->_homeViewSections addObject:&off_1013A7AC8];
  }
  v12 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned int v13 = [v12 hasReviewedRAPs];

  if (v13)
  {
    v7 = &off_1013A7AE0;
LABEL_15:
    [(NSMutableArray *)self->_homeViewSections addObject:v7];
  }
LABEL_16:
  id v14 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned int v15 = [v14 hasIncidentReports];

  if (v15) {
    [(NSMutableArray *)self->_homeViewSections addObject:&off_1013A7AF8];
  }
  id v16 = [(DataSource *)self collectionView];
  [v16 reloadData];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (int64_t)[(NSMutableArray *)self->_homeViewSections count];
}

- (int64_t)sectionForIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_homeViewSections count] <= a3) {
    return 0;
  }
  v5 = [(NSMutableArray *)self->_homeViewSections objectAtIndexedSubscript:a3];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  id v9 = [v7 row];
  unsigned int v10 = objc_alloc_init(ReportLinkFactory);
  switch(v8)
  {
    case 0:
      unsigned int v11 = [v6 dequeueReusableCellWithReuseIdentifier:@"ReportLinkCell" forIndexPath:v7];
      v12 = [(NSMutableArray *)self->_reportActionSections objectAtIndexedSubscript:v9];
      id v13 = [v12 integerValue];

      if ((unint64_t)v13 > 4)
      {
        id v14 = 0;
      }
      else
      {
        id v14 = [(ReportLinkFactory *)v10 createModelForType:v13];
      }
      [v11 setReportLink:v14];
      goto LABEL_19;
    case 1:
      uint64_t v15 = 144;
      goto LABEL_8;
    case 2:
      uint64_t v15 = 128;
      goto LABEL_8;
    case 3:
      uint64_t v15 = 136;
      goto LABEL_8;
    case 4:
      uint64_t v15 = 120;
LABEL_8:
      id v14 = [*(id *)((char *)&self->super.super.isa + v15) objectAtIndexedSubscript:v9];
      goto LABEL_18;
    case 5:
      unsigned int v11 = [v6 dequeueReusableCellWithReuseIdentifier:@"IncidentsCell" forIndexPath:v7];
      if (sub_1000BBB44(v11) == 5)
      {
        id v16 = +[UIColor clearColor];
        [v11 setBackgroundColor:v16];
      }
      else
      {
        id v16 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
        uint64_t v17 = [v16 backgroundColor];
        [v11 setBackgroundColor:v17];
      }
      uint64_t v18 = [(NSMutableArray *)self->_incidentsSections objectAtIndexedSubscript:v9];
      id v19 = [v18 integerValue];

      switch((unint64_t)v19)
      {
        case 0uLL:
          unsigned int v20 = +[NSBundle mainBundle];
          uint64_t v21 = [v20 localizedStringForKey:@"[RAP History] Crashes" value:@"localized string not found" table:0];
          [v11 setTitle:v21];

          id v22 = +[UserProfileReportHistoryManager sharedInstance];
          v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v22 crashesCount]);
          CFStringRef v24 = @"user-profile-crashes";
          break;
        case 1uLL:
          v28 = +[NSBundle mainBundle];
          v29 = [v28 localizedStringForKey:@"[RAP History] Hazards" value:@"localized string not found" table:0];
          [v11 setTitle:v29];

          id v22 = +[UserProfileReportHistoryManager sharedInstance];
          v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v22 hazardsCount]);
          CFStringRef v24 = @"user-profile-hazards";
          break;
        case 2uLL:
          uint64_t v30 = +[NSBundle mainBundle];
          long long v31 = [v30 localizedStringForKey:@"[RAP History] Speed Checks" value:@"localized string not found" table:0];
          [v11 setTitle:v31];

          id v22 = +[UserProfileReportHistoryManager sharedInstance];
          v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v22 speedChecksCount]);
          CFStringRef v24 = @"user-profile-speed-checks";
          break;
        case 3uLL:
          long long v32 = +[NSBundle mainBundle];
          long long v33 = [v32 localizedStringForKey:@"[RAP History] Road Work" value:@"localized string not found" table:0];
          [v11 setTitle:v33];

          id v22 = +[UserProfileReportHistoryManager sharedInstance];
          v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v22 roadWorkCount]);
          CFStringRef v24 = @"user-profile-road-work";
          break;
        default:

          goto LABEL_17;
      }
      [v11 setSubtitle:v23];

      id v14 = +[UIImage imageNamed:v24];
      [v11 setIcon:v14];
      goto LABEL_19;
    default:
LABEL_17:
      id v14 = 0;
LABEL_18:
      objc_super v25 = +[TwoLineCollectionViewListCell identifier];
      unsigned int v11 = [v6 dequeueReusableCellWithReuseIdentifier:v25 forIndexPath:v7];

      v26 = +[TwoLinesContentViewModelComposer cellModelForRAPReportsHistory:v14 allowDisclosureIndicator:1];
      [v11 setViewModel:v26];

LABEL_19:
      return v11;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  switch([(RAPHomeDataSource *)self sectionForIndex:a4])
  {
    case 0:
      uint64_t v5 = 168;
      goto LABEL_14;
    case 1:
      uint64_t v5 = 144;
      goto LABEL_14;
    case 2:
      uint64_t v6 = 128;
      if ([(NSArray *)self->_reportsInReview count] < 4) {
        goto LABEL_10;
      }
      uint64_t v7 = 184;
      goto LABEL_9;
    case 3:
      uint64_t v6 = 136;
      if ([(NSArray *)self->_reportsAlreadyReviewed count] < 4) {
        goto LABEL_10;
      }
      uint64_t v7 = 185;
      goto LABEL_9;
    case 4:
      uint64_t v6 = 120;
      if ([(NSArray *)self->_allReports count] < 4)
      {
LABEL_10:
        id v9 = *(Class *)((char *)&self->super.super.isa + v6);
LABEL_15:
        return (int64_t)[v9 count];
      }
      else
      {
        uint64_t v7 = 186;
LABEL_9:
        *((unsigned char *)&self->super.super.isa + v7) = 1;
        return 3;
      }
    case 5:
      uint64_t v5 = 176;
LABEL_14:
      id v9 = *(Class *)((char *)&self->super.super.isa + v5);
      goto LABEL_15;
    default:
      return 1;
  }
}

- (id)RAPHomeReportMenu
{
  reportMenuProvider = self->_reportMenuProvider;
  uint64_t v4 = [(RAPHomeDataSource *)self entryPoint];
  uint64_t v5 = [(DataSource *)self collectionView];
  uint64_t v6 = [v5 _maps_mapsSceneDelegate];
  uint64_t v7 = [(RAPReportMenuProvider *)reportMenuProvider getReportMenuFromEntryPoint:v4 sceneDelegate:v6];

  return v7;
}

- (id)_headerStringTellUsMoreSection
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] Tell Us More" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_headerStringInReviewSection
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] In Review" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_headerStringReviewedSection
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] Reviewed" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_headerStringIssuesReportedSection
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] Issues Reported" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_headerStringIncidentsReportedSection
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] Incidents Reported" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_footerStringActionsSection
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[RAP History] Issues you report are associated with your Apple Account. Incidents you report are not associated with your Apple Account" value:@"localized string not found" table:0];

  return v3;
}

- (id)_headerStringActionsSection
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] Report an Issue" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_footerString90Days
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] From the past 90 days." value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_footerStringReviewedSection
{
  id v2 = objc_alloc((Class)NSAttributedString);
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[RAP History] From the past 90 days. Reports about issues with information from Apple partners can take some time to get updated in Maps" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (id)_footerLinkText
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[RAP History] See How Your Data is Managed" value:@"localized string not found" table:0];

  return v3;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", [v10 section]);
  switch((unint64_t)v11)
  {
    case 0uLL:
      if (sub_1000BBB44(v8) == 5)
      {
        v12 = [(RAPHomeDataSource *)self _headerStringActionsSection];
      }
      else
      {
        v12 = 0;
      }
      unsigned int v20 = +[UserProfileReportHistoryManager sharedInstance];
      unsigned __int8 v21 = [v20 inChina];

      if (v21) {
        goto LABEL_12;
      }
      uint64_t v30 = [(RAPHomeDataSource *)self _footerStringActionsSection];
      v28 = [(RAPHomeDataSource *)self _footerLinkText];
      id v22 = objc_alloc_init((Class)NSMutableParagraphStyle);
      [v22 setLineBreakMode:0];
      v27 = v22;
      v52[0] = NSParagraphStyleAttributeName;
      v52[1] = NSForegroundColorAttributeName;
      v53[0] = v22;
      v23 = +[UIColor secondaryLabelColor];
      v53[1] = v23;
      v29 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

      NSAttributedStringKey v50 = NSForegroundColorAttributeName;
      CFStringRef v24 = +[UIColor systemBlueColor];
      v51 = v24;
      objc_super v25 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

      id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v30 attributes:v29];
      id v26 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v28 attributes:v25];
      [v13 appendAttributedString:v26];

      break;
    case 1uLL:
      uint64_t v14 = [(RAPHomeDataSource *)self _headerStringTellUsMoreSection];
      goto LABEL_11;
    case 2uLL:
      v12 = [(RAPHomeDataSource *)self _headerStringInReviewSection];
      uint64_t v15 = [(RAPHomeDataSource *)self _footerString90Days];
      goto LABEL_9;
    case 3uLL:
      v12 = [(RAPHomeDataSource *)self _headerStringReviewedSection];
      uint64_t v15 = [(RAPHomeDataSource *)self _footerStringReviewedSection];
      goto LABEL_9;
    case 4uLL:
      v12 = [(RAPHomeDataSource *)self _headerStringIssuesReportedSection];
      uint64_t v15 = [(RAPHomeDataSource *)self _footerString90Days];
LABEL_9:
      id v13 = (id)v15;
      break;
    case 5uLL:
      uint64_t v14 = [(RAPHomeDataSource *)self _headerStringIncidentsReportedSection];
LABEL_11:
      v12 = (void *)v14;
LABEL_12:
      id v13 = 0;
      break;
    default:
      id v13 = 0;
      v12 = 0;
      break;
  }
  if ([v9 isEqualToString:_UICollectionViewListLayoutElementKindSectionHeader])
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = sub_100103D5C;
    v48 = sub_100104738;
    id v49 = 0;
    objc_initWeak(&location, self);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1005BCD90;
    v36[3] = &unk_1012F0FB0;
    objc_copyWeak(v42, &location);
    v41 = &v44;
    id v37 = v8;
    id v38 = v10;
    id v16 = v12;
    v42[1] = v11;
    id v39 = v16;
    v40 = self;
    +[UIView performWithoutAnimation:v36];
    id v17 = (id)v45[5];

    objc_destroyWeak(v42);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1005BCFB0;
    v31[3] = &unk_1012F0FD8;
    id v32 = v8;
    long long v34 = self;
    v35 = v11;
    id v33 = v10;
    uint64_t v18 = objc_retainBlock(v31);
    ((void (*)(void *, id, uint64_t))v18[2])(v18, v13, 1);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)privacyTextTapped
{
  id v2 = [(RAPHomeDataSource *)self supplementaryElementsDelegate];
  [v2 didTapOnPrivacyText];
}

- (void)seeAllTappedForReportForSection:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      id v5 = [(RAPHomeDataSource *)self _headerStringIssuesReportedSection];
      goto LABEL_7;
    case 3:
      id v5 = [(RAPHomeDataSource *)self _headerStringReviewedSection];
      goto LABEL_7;
    case 2:
      id v5 = [(RAPHomeDataSource *)self _headerStringInReviewSection];
LABEL_7:
      uint64_t v6 = v5;
      id v8 = [v5 string];

      goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:
  uint64_t v7 = [(RAPHomeDataSource *)self supplementaryElementsDelegate];
  [v7 didTapOnMoreButtonForSectionType:a3 sectionTitle:v8];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v6 row];
  int64_t v8 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", [v6 section]);
  if (v8 == 3)
  {
    uint64_t v15 = 136;
LABEL_7:
    id v13 = [*(id *)((char *)&self->super.super.isa + v15) objectAtIndexedSubscript:v7];
    uint64_t v14 = [(DataSource *)self delegate];
    [v14 dataSource:self itemTapped:v13];
    goto LABEL_8;
  }
  if (v8 == 1)
  {
    uint64_t v15 = 144;
    goto LABEL_7;
  }
  if (v8) {
    goto LABEL_9;
  }
  id v9 = [(NSMutableArray *)self->_reportActionSections objectAtIndexedSubscript:v7];
  id v10 = [v9 integerValue];

  reportMenuProvider = self->_reportMenuProvider;
  uint64_t v12 = [(RAPHomeDataSource *)self entryPoint];
  id v13 = [(DataSource *)self collectionView];
  uint64_t v14 = [v13 _maps_mapsSceneDelegate];
  [(RAPReportMenuProvider *)reportMenuProvider handleMenuActionWithLinkType:v10 entryPoint:v12 sceneDelegate:v14];
LABEL_8:

LABEL_9:
  [v16 deselectItemAtIndexPath:v6 animated:1];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  unint64_t v5 = -[self sectionForIndex:[a4 section:a3]];
  if ([(RAPHomeDataSource *)self _isInternalInstall])
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    unsigned int v7 = [v6 BOOLForKey:@"__internal__EnableTapRAPForReportID"];

    if (v7) {
      return v5 != 5;
    }
  }
  if (v5 <= 3) {
    return (0xBu >> (v5 & 0xF)) & 1;
  }
  return 0;
}

- (double)footerHeightForSection:(int64_t)a3 collectionView:(id)a4
{
  [a4 frame];
  double v7 = v6;
  double height = UILayoutFittingExpandedSize.height;
  id v9 = objc_alloc_init(UserProfileSectionFooterView);
  id v10 = 0;
  switch(a3)
  {
    case 0:
      id v13 = +[UserProfileReportHistoryManager sharedInstance];
      unsigned __int8 v14 = [v13 inChina];

      if ((v14 & 1) == 0)
      {
        unsigned __int8 v21 = [(RAPHomeDataSource *)self _footerStringActionsSection];
        id v22 = [(RAPHomeDataSource *)self _footerLinkText];
        uint64_t v15 = [v21 stringByAppendingString:v22];

        v23 = [UserProfileSectionFooterViewModel alloc];
        id v24 = [objc_alloc((Class)NSAttributedString) initWithString:v15];
        id v10 = [(UserProfileSectionFooterViewModel *)v23 initWithContentString:v24];

        goto LABEL_7;
      }
      id v10 = 0;
      break;
    case 2:
    case 4:
      unsigned int v11 = [UserProfileSectionFooterViewModel alloc];
      uint64_t v12 = [(RAPHomeDataSource *)self _footerString90Days];
      goto LABEL_6;
    case 3:
      unsigned int v11 = [UserProfileSectionFooterViewModel alloc];
      uint64_t v12 = [(RAPHomeDataSource *)self _footerStringReviewedSection];
LABEL_6:
      uint64_t v15 = (void *)v12;
      id v10 = [(UserProfileSectionFooterViewModel *)v11 initWithContentString:v12];
LABEL_7:

      break;
    default:
      break;
  }
  [(UserProfileSectionFooterView *)v9 configureWithViewModel:v10];
  LODWORD(v16) = 1148846080;
  LODWORD(v17) = 1132068864;
  -[UserProfileSectionFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7 + -32.0, height, v16, v17);
  double v19 = v18;

  return v19;
}

- (double)headerHeightForSection:(int64_t)a3 collectionView:(id)a4
{
  id v6 = a4;
  double v7 = 0;
  double v8 = 0.0;
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 2:
      id v9 = [(RAPHomeDataSource *)self _headerStringInReviewSection];
      goto LABEL_6;
    case 3:
      id v9 = [(RAPHomeDataSource *)self _headerStringReviewedSection];
      goto LABEL_6;
    case 4:
      id v9 = [(RAPHomeDataSource *)self _headerStringIssuesReportedSection];
      goto LABEL_6;
    case 5:
      id v9 = [(RAPHomeDataSource *)self _headerStringIncidentsReportedSection];
LABEL_6:
      id v10 = v9;
      double v7 = [v9 string];

      break;
    default:
      break;
  }
  unsigned int v11 = [(DataSource *)self collectionView];
  [v11 bounds];
  double Width = CGRectGetWidth(v17);
  id v13 = [(DataSource *)self collectionView];
  unsigned __int8 v14 = [v13 traitCollection];
  +[SectionHeaderCollectionReusableView heightWhenFirstNonEmptySection:v7 == 0 title:v7 actionTitle:0 availableWidth:v14 traitCollection:Width];
  double v8 = v15;

LABEL_8:
  return v8;
}

- (void)reportHistoryManagerDidUpdate:(id)a3
{
  unint64_t v5 = sub_100011FD4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    double v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v9, 0x16u);
  }
  [(RAPHomeDataSource *)self _loadReportHistoryContent];
}

- (int)analyticsTarget
{
  return 39;
}

- (BOOL)_isInternalInstall
{
  id v2 = +[GEOPlatform sharedPlatform];
  unsigned __int8 v3 = [v2 isInternalInstall];

  return v3;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if ([(RAPHomeDataSource *)self _isInternalInstall]
    && (+[NSUserDefaults standardUserDefaults],
        double v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 BOOLForKey:@"__internal__EnableTapRAPForReportID"],
        v7,
        v8)
    && [v6 count] == (id)1)
  {
    int v9 = [v6 firstObject];
    id v10 = [v9 row];
    int64_t v11 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", [v9 section]);
    if ((unint64_t)(v11 - 2) <= 2
      && ([*(id *)((char *)&self->super.super.isa + **(&off_1012F1038 + v11 - 2)) objectAtIndexedSubscript:v10], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1005BDA10;
      v16[3] = &unk_1012F1000;
      id v17 = v12;
      id v13 = v12;
      unsigned __int8 v14 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v16];
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (SupplementaryElementsDataSourceDelegate)supplementaryElementsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supplementaryElementsDelegate);

  return (SupplementaryElementsDataSourceDelegate *)WeakRetained;
}

- (void)setSupplementaryElementsDelegate:(id)a3
{
}

- (int)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int)a3
{
  self->_entryPoint = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_supplementaryElementsDelegate);
  objc_storeStrong((id *)&self->_reportMenuProvider, 0);
  objc_storeStrong((id *)&self->_incidentsSections, 0);
  objc_storeStrong((id *)&self->_reportActionSections, 0);
  objc_storeStrong((id *)&self->_homeViewSections, 0);
  objc_storeStrong((id *)&self->_incidentReports, 0);
  objc_storeStrong((id *)&self->_reportsTellUsMore, 0);
  objc_storeStrong((id *)&self->_reportsAlreadyReviewed, 0);
  objc_storeStrong((id *)&self->_reportsInReview, 0);

  objc_storeStrong((id *)&self->_allReports, 0);
}

@end