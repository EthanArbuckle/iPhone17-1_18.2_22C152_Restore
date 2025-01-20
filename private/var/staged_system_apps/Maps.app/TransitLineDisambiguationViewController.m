@interface TransitLineDisambiguationViewController
- (BOOL)hasStatusMessageToShow;
- (BOOL)isLoading;
- (CGSize)calculatePreferredContentSize;
- (ContainerHeaderView)titleHeaderView;
- (MapsThemeTableView)tableView;
- (NSArray)allLines;
- (NSArray)linesBySystem;
- (NSDictionary)shieldsByLine;
- (NSString)statusMessage;
- (NSString)titleMessage;
- (UILabel)macTitleLabel;
- (id)lineSelectionBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)titleForSection:(int64_t)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_determineShieldsFromLines;
- (void)handleDismissAction:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)setAllLines:(id)a3;
- (void)setLineSelectionBlock:(id)a3;
- (void)setLines:(id)a3;
- (void)setLinesBySystem:(id)a3;
- (void)setMacTitleLabel:(id)a3;
- (void)setShieldsByLine:(id)a3;
- (void)setStatusMessage:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)setTitleMessage:(id)a3;
- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updatePreferredContentSize;
- (void)viewDidLoad;
@end

@implementation TransitLineDisambiguationViewController

- (void)viewDidLoad
{
  v72.receiver = self;
  v72.super_class = (Class)TransitLineDisambiguationViewController;
  [(ContaineeViewController *)&v72 viewDidLoad];
  v71 = +[NSMutableArray array];
  v3 = GEOResultRefinementSort_ptr;
  if (sub_1000BBB44(self) != 5)
  {
    v4 = [[ContainerHeaderView alloc] initWithHairlineMargin:16.0];
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v4;

    [(ContainerHeaderView *)self->_titleHeaderView setDelegate:self];
    [(ContainerHeaderView *)self->_titleHeaderView setPreservesSuperviewLayoutMargins:1];
    [(ContainerHeaderView *)self->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(TransitLineDisambiguationViewController *)self view];
    [v6 addSubview:self->_titleHeaderView];

    v67 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
    v69 = [(TransitLineDisambiguationViewController *)self view];
    v65 = [v69 trailingAnchor];
    v63 = [v67 constraintEqualToAnchor:v65];
    v75[0] = v63;
    v61 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
    v7 = [(TransitLineDisambiguationViewController *)self view];
    v8 = [v7 topAnchor];
    v9 = [v61 constraintEqualToAnchor:v8];
    v75[1] = v9;
    v10 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
    v11 = [(TransitLineDisambiguationViewController *)self view];
    v12 = [v11 leadingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v75[2] = v13;
    v14 = +[NSArray arrayWithObjects:v75 count:3];
    [v71 addObjectsFromArray:v14];

    v3 = GEOResultRefinementSort_ptr;
  }
  BOOL v15 = sub_1000BBB44(self) == 5;
  v16 = [MapsThemeTableView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v20 = -[MapsThemeTableView initWithFrame:style:](v16, "initWithFrame:style:", v15, CGRectZero.origin.x, y, width, height);
  [(TransitLineDisambiguationViewController *)self setTableView:v20];

  v21 = [(TransitLineDisambiguationViewController *)self tableView];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(TransitLineDisambiguationViewController *)self tableView];
  [v22 setRowHeight:UITableViewAutomaticDimension];

  v23 = [(TransitLineDisambiguationViewController *)self tableView];
  [v23 setSectionHeaderHeight:UITableViewAutomaticDimension];

  v24 = [(TransitLineDisambiguationViewController *)self tableView];
  [v24 _setAutomaticContentOffsetAdjustmentEnabled:0];

  id v25 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  v26 = [(TransitLineDisambiguationViewController *)self tableView];
  [v26 setTableFooterView:v25];

  v27 = [(TransitLineDisambiguationViewController *)self tableView];
  [v27 setDelegate:self];

  v28 = [(TransitLineDisambiguationViewController *)self tableView];
  [v28 setDataSource:self];

  v29 = [(TransitLineDisambiguationViewController *)self tableView];
  [v29 setSeparatorInset:0.0, 16.0, 0.0, 16.0];

  v30 = [(TransitLineDisambiguationViewController *)self tableView];
  [v30 setEstimatedRowHeight:79.0];

  v31 = +[UIColor clearColor];
  v32 = [(TransitLineDisambiguationViewController *)self tableView];
  [v32 setBackgroundColor:v31];

  v33 = [(TransitLineDisambiguationViewController *)self tableView];
  uint64_t v34 = objc_opt_class();
  v35 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v35);
  [v33 registerClass:v34 forCellReuseIdentifier:v36];

  v37 = [(TransitLineDisambiguationViewController *)self tableView];
  uint64_t v38 = objc_opt_class();
  v39 = +[TransitLineDisambiguationSectionHeaderView identifier];
  [v37 registerClass:v38 forHeaderFooterViewReuseIdentifier:v39];

  v40 = [(TransitLineDisambiguationViewController *)self view];
  v41 = [(TransitLineDisambiguationViewController *)self tableView];
  [v40 addSubview:v41];

  uint64_t v42 = sub_1000BBB44(self);
  v43 = [(MapsThemeTableView *)self->_tableView trailingAnchor];
  v68 = [(TransitLineDisambiguationViewController *)self view];
  [v68 trailingAnchor];
  v66 = v70 = v43;
  uint64_t v44 = [v43 constraintEqualToAnchor:];
  v64 = (void *)v44;
  if (v42 == 5)
  {
    v74[0] = v44;
    v57 = [(MapsThemeTableView *)self->_tableView topAnchor];
    v62 = [(TransitLineDisambiguationViewController *)self view];
    v60 = [v62 topAnchor];
    v59 = [v57 constraintEqualToAnchor:];
    v74[1] = v59;
    v45 = [(MapsThemeTableView *)self->_tableView leadingAnchor];
    v46 = [(TransitLineDisambiguationViewController *)self view];
    v47 = [v46 leadingAnchor];
    v58 = v45;
    v48 = [v45 constraintEqualToAnchor:v47];
    v74[2] = v48;
    v49 = [(MapsThemeTableView *)self->_tableView bottomAnchor];
    v50 = [(TransitLineDisambiguationViewController *)self view];
    v51 = [v50 bottomAnchor];
    v52 = [v49 constraintEqualToAnchor:v51];
    v74[3] = v52;
    v53 = [v3[501] arrayWithObjects:v74 count:4];
    v54 = v71;
    [v71 addObjectsFromArray:v53];

    v55 = v57;
  }
  else
  {
    v73[0] = v44;
    v55 = [(MapsThemeTableView *)self->_tableView topAnchor];
    v62 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
    v60 = [v55 constraintEqualToAnchor:];
    v73[1] = v60;
    v56 = [(MapsThemeTableView *)self->_tableView leadingAnchor];
    v58 = [(TransitLineDisambiguationViewController *)self view];
    v46 = [v58 leadingAnchor];
    v59 = v56;
    v47 = [v56 constraintEqualToAnchor:v46];
    v73[2] = v47;
    v48 = [(MapsThemeTableView *)self->_tableView bottomAnchor];
    v49 = [(TransitLineDisambiguationViewController *)self view];
    v50 = [v49 bottomAnchor];
    v51 = [v48 constraintEqualToAnchor:v50];
    v73[3] = v51;
    v52 = [v3[501] arrayWithObjects:v73 count:4];
    v54 = v71;
    [v71 addObjectsFromArray:v52];
  }

  +[NSLayoutConstraint activateConstraints:v54];
  [(TransitLineDisambiguationViewController *)self updatePreferredContentSize];
}

- (void)setTitleMessage:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  titleMessage = self->_titleMessage;
  self->_titleMessage = v5;

  id v7 = [(TransitLineDisambiguationViewController *)self titleHeaderView];
  [v7 setTitle:v4];
}

- (void)setStatusMessage:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_statusMessage;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v10 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v10;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_statusMessage, a3);
      v9 = [(TransitLineDisambiguationViewController *)self tableView];
      [v9 reloadData];

      [(TransitLineDisambiguationViewController *)self updatePreferredContentSize];
      unint64_t v7 = (unint64_t)v10;
    }
  }
}

- (void)setLines:(id)a3
{
  id v4 = a3;
  if (![(NSArray *)self->_allLines isEqualToArray:v4])
  {
    id v5 = (NSArray *)[v4 copy];
    allLines = self->_allLines;
    self->_allLines = v5;

    if (sub_1000BBB44(self) == 5)
    {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v23 = v4;
      id v8 = v4;
      id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v28;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v14 = [v13 system];
            BOOL v15 = [v14 name];

            v16 = [v7 objectForKeyedSubscript:v15];
            if (!v16)
            {
              v16 = +[NSMutableArray array];
              [v7 setObject:v16 forKeyedSubscript:v15];
            }
            [v16 addObject:v13];
          }
          id v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v10);
      }

      +[NSMutableArray array];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100A986D8;
      v25[3] = &unk_1013161F0;
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = v26;
      [v7 enumerateKeysAndObjectsUsingBlock:v25];
      v18 = (NSArray *)[v17 copy];
      linesBySystem = self->_linesBySystem;
      self->_linesBySystem = v18;

      id v4 = v23;
    }
    else
    {
      v20 = self->_allLines;
      if (v20)
      {
        v31 = self->_allLines;
        id v7 = +[NSArray arrayWithObjects:&v31 count:1];
      }
      else
      {
        id v7 = 0;
      }
      objc_storeStrong((id *)&self->_linesBySystem, v7);
      if (!v20) {
        goto LABEL_18;
      }
    }

LABEL_18:
    [(TransitLineDisambiguationViewController *)self _determineShieldsFromLines];
    v21 = [(TransitLineDisambiguationViewController *)self tableView];
    [v21 reloadData];

    v22 = [(TransitLineDisambiguationViewController *)self tableView];
    [v22 layoutIfNeeded];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A9872C;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_determineShieldsFromLines
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (sub_1000BBB44(self) == 5) {
    uint64_t v4 = 6;
  }
  else {
    uint64_t v4 = 7;
  }
  id v5 = [(TransitLineDisambiguationViewController *)self view];
  unint64_t v6 = [v5 window];
  id v7 = [v6 screen];
  id v8 = v7;
  if (!v7)
  {
    id v8 = +[UIScreen mainScreen];
  }
  [v8 scale];
  uint64_t v10 = v9;
  if (!v7) {

  }
  uint64_t v11 = [(TransitLineDisambiguationViewController *)self allLines];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100A98978;
  v20[3] = &unk_101316218;
  uint64_t v23 = v4;
  uint64_t v24 = v10;
  id v12 = v3;
  id v21 = v12;
  v22 = &v25;
  [v11 enumerateObjectsUsingBlock:v20];

  v13 = [(TransitLineDisambiguationViewController *)self allLines];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A98A98;
  v16[3] = &unk_101316240;
  id v14 = v12;
  id v17 = v14;
  v18 = &v25;
  uint64_t v19 = v10;
  [v13 enumerateObjectsUsingBlock:v16];

  *(void *)&self->_maxWidthOfShields = v26[3];
  id v15 = [v14 copy];
  [(TransitLineDisambiguationViewController *)self setShieldsByLine:v15];

  _Block_object_dispose(&v25, 8);
}

- (void)headerViewTapped:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsExpandLayout];
}

- (int)currentUITargetForAnalytics
{
  return 638;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:4 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  v6.receiver = self;
  v6.super_class = (Class)TransitLineDisambiguationViewController;
  [(ContaineeViewController *)&v6 handleDismissAction:v4];
}

- (void)updatePreferredContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    [(TransitLineDisambiguationViewController *)self preferredContentSize];
    double v4 = v3;
    double v6 = v5;
    [(TransitLineDisambiguationViewController *)self calculatePreferredContentSize];
    if (v4 != v8 || v6 != v7)
    {
      -[TransitLineDisambiguationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
}

- (CGSize)calculatePreferredContentSize
{
  *(double *)&uint64_t v3 = 282.0;
  if ([(TransitLineDisambiguationViewController *)self isViewLoaded])
  {
    double v4 = 282.0;
    if (sub_1000BBB44(self) == 5)
    {
      double v5 = [(TransitLineDisambiguationViewController *)self view];
      [v5 layoutIfNeeded];

      [(MapsThemeTableView *)self->_tableView contentSize];
      double v7 = v6;
      [(ContainerHeaderView *)self->_titleHeaderView frame];
      double v4 = fmin(v7 + CGRectGetHeight(v12), 610.0);
      [(ContaineeViewController *)self macContaineeWidth];
      uint64_t v3 = v8;
    }
  }
  else
  {
    double v4 = 282.0;
  }
  double v9 = *(double *)&v3;
  double v10 = v4;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
}

- (BOOL)isLoading
{
  uint64_t v3 = [(TransitLineDisambiguationViewController *)self statusMessage];
  if ([v3 length])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(TransitLineDisambiguationViewController *)self allLines];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (BOOL)hasStatusMessageToShow
{
  uint64_t v3 = [(TransitLineDisambiguationViewController *)self statusMessage];
  if ([v3 length])
  {
    BOOL v4 = [(TransitLineDisambiguationViewController *)self allLines];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)titleForSection:(int64_t)a3
{
  if ([(TransitLineDisambiguationViewController *)self isLoading])
  {
    BOOL v5 = [(TransitLineDisambiguationViewController *)self titleMessage];
  }
  else
  {
    double v6 = [(TransitLineDisambiguationViewController *)self linesBySystem];
    double v7 = [v6 objectAtIndexedSubscript:a3];

    uint64_t v8 = [v7 firstObject];
    double v9 = [v8 system];
    double v10 = [v9 name];

    id v11 = [v7 count];
    id v12 = [v10 length];
    v13 = +[NSBundle mainBundle];
    id v14 = v13;
    if (v12)
    {
      id v15 = [v13 localizedStringForKey:@"number_of_disambiguation_lines_with_system_name" value:@"localized string not found" table:0];

      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v11, v10);
    }
    else
    {
      id v15 = [v13 localizedStringForKey:@"number_of_disambiguation_lines" value:@"localized string not found" table:0];

      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v11, v17);
    BOOL v5 = };
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(TransitLineDisambiguationViewController *)self hasStatusMessageToShow]
    || [(TransitLineDisambiguationViewController *)self isLoading])
  {
    return 1;
  }
  double v7 = [(TransitLineDisambiguationViewController *)self linesBySystem];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];

  id v9 = [v8 count];
  return (int64_t)v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (sub_1000BBB44(self) != 5) {
    return 1;
  }
  BOOL v4 = [(TransitLineDisambiguationViewController *)self linesBySystem];
  if ((uint64_t)[v4 count] < 1)
  {
    int64_t v6 = 1;
  }
  else
  {
    BOOL v5 = [(TransitLineDisambiguationViewController *)self linesBySystem];
    int64_t v6 = (int64_t)[v5 count];
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  if (![(TransitLineDisambiguationViewController *)self isLoading]) {
    [v6 hideSpinner];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  double v10 = [v7 dequeueReusableCellWithIdentifier:v9];

  if (sub_1000BBB44(self) != 5) {
    [v10 set_mapkit_separatorStyleOverride:1];
  }
  if ([(TransitLineDisambiguationViewController *)self isLoading])
  {
    [v10 showSpinner];
    [v10 setLabelText:0];
LABEL_7:
    [v10 setShieldImage:0];
    [v10 setMaxWidth:0.0];
    goto LABEL_17;
  }
  if ([(TransitLineDisambiguationViewController *)self hasStatusMessageToShow])
  {
    id v11 = [(TransitLineDisambiguationViewController *)self statusMessage];
    [v10 setLabelText:v11];

    goto LABEL_7;
  }
  id v12 = [v6 row];
  id v13 = [v6 section];
  id v14 = [(TransitLineDisambiguationViewController *)self linesBySystem];
  id v15 = [v14 objectAtIndexedSubscript:v13];

  if (v12 < [v15 count])
  {
    v16 = [v15 objectAtIndexedSubscript:v12];
    uint64_t v17 = [(TransitLineDisambiguationViewController *)self shieldsByLine];
    v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 muid]);
    uint64_t v19 = [v17 objectForKeyedSubscript:v18];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    [v10 setShieldImage:v20];
    id v21 = v16;
    v22 = [v21 name];
    id v23 = [v22 length];

    if (v23)
    {
      uint64_t v24 = [v21 name];
    }
    else
    {
      uint64_t v25 = [v21 system];
      uint64_t v24 = [v25 name];
    }
    [v10 setLabelText:v24];

    [v10 setMaxWidth:self->_maxWidthOfShields];
  }

LABEL_17:

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(TransitLineDisambiguationViewController *)self hasStatusMessageToShow]
    || [(TransitLineDisambiguationViewController *)self isLoading])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v6 row];
  id v8 = [v6 section];
  id v9 = [(TransitLineDisambiguationViewController *)self linesBySystem];
  double v10 = [v9 objectAtIndexedSubscript:v8];

  if (v7 >= [v10 count])
  {
    uint64_t v17 = [(TransitLineDisambiguationViewController *)self lineSelectionBlock];

    if (!v17) {
      goto LABEL_7;
    }
    id v11 = [(TransitLineDisambiguationViewController *)self lineSelectionBlock];
    v11[2](v11, 0);
  }
  else
  {
    [v18 deselectRowAtIndexPath:v6 animated:1];
    id v11 = [v10 objectAtIndexedSubscript:v7];
    id v12 = +[MKMapService sharedService];
    uint64_t v13 = [(TransitLineDisambiguationViewController *)self currentUITargetForAnalytics];
    id v14 = +[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:targetID:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:targetID:", 0, v7, [v11 muid], 0.0);
    [v12 captureUserAction:1032 onTarget:v13 eventValue:0 placeActionDetails:v14];

    id v15 = [(TransitLineDisambiguationViewController *)self lineSelectionBlock];

    if (v15)
    {
      v16 = [(TransitLineDisambiguationViewController *)self lineSelectionBlock];
      v16[2](v16, v11);
    }
  }

LABEL_7:
}

- (id)lineSelectionBlock
{
  return self->_lineSelectionBlock;
}

- (void)setLineSelectionBlock:(id)a3
{
}

- (NSString)titleMessage
{
  return self->_titleMessage;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (UILabel)macTitleLabel
{
  return self->_macTitleLabel;
}

- (void)setMacTitleLabel:(id)a3
{
}

- (MapsThemeTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSDictionary)shieldsByLine
{
  return self->_shieldsByLine;
}

- (void)setShieldsByLine:(id)a3
{
}

- (NSArray)linesBySystem
{
  return self->_linesBySystem;
}

- (void)setLinesBySystem:(id)a3
{
}

- (NSArray)allLines
{
  return self->_allLines;
}

- (void)setAllLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLines, 0);
  objc_storeStrong((id *)&self->_linesBySystem, 0);
  objc_storeStrong((id *)&self->_shieldsByLine, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_macTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_titleMessage, 0);

  objc_storeStrong(&self->_lineSelectionBlock, 0);
}

@end