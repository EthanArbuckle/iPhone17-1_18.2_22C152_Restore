@interface TUIStatsFeedViewController
- (TUIStatsFeed)feed;
- (TUIStatsFeedViewController)initWithFeed:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismiss:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TUIStatsFeedViewController

- (TUIStatsFeedViewController)initWithFeed:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIStatsFeedViewController;
  v6 = [(TUIStatsFeedViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feed, a3);
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Done" style:2 target:v7 action:"_dismiss:"];
    v9 = [(TUIStatsFeedViewController *)v7 navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  return v7;
}

- (void)_dismiss:(id)a3
{
  id v3 = [(TUIStatsFeedViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)TUIStatsFeedViewController;
  [(TUIStatsFeedViewController *)&v8 viewDidLoad];
  id v3 = [(TUIStatsFeedViewController *)self tableView];
  v4 = +[TUIStatsCell nib];
  [v3 registerNib:v4 forCellReuseIdentifier:@"cell"];

  id v5 = [(TUIStatsFeedViewController *)self tableView];
  [v5 setRowHeight:UITableViewAutomaticDimension];

  v6 = [(TUIStatsFeedViewController *)self tableView];
  [v6 setEstimatedRowHeight:100.0];

  v7 = [(TUIStatsFeedViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"header"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      v7 = [(TUIStatsFeed *)self->_feed passes];
    }
    else
    {
      if (a4 != 1)
      {
        id v8 = 0;
        goto LABEL_9;
      }
      v7 = [(TUIStatsFeed *)self->_feed currentEntriesUID];
    }
    v9 = v7;
    id v8 = [v7 count];
  }
  else
  {
    id v8 = &def_141F14 + 1;
  }
LABEL_9:

  return (int64_t)v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = [(TUIStatsFeedViewController *)self tableView];
  id v6 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:@"header"];

  if (a4 == 2)
  {
    v7 = [v6 textLabel];
    id v8 = v7;
    CFStringRef v9 = @"Passes";
  }
  else if (a4 == 1)
  {
    v7 = [v6 textLabel];
    id v8 = v7;
    CFStringRef v9 = @"Entries";
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    v7 = [v6 textLabel];
    id v8 = v7;
    CFStringRef v9 = @"Summary";
  }
  [v7 setText:v9];

LABEL_8:

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v6];
  if (![v6 section])
  {
    id v9 = objc_alloc_init((Class)NSMutableString);
    uint64_t v20 = [(TUIStatsFeed *)self->_feed creationDate];
    v21 = (void *)v20;
    if (v20) {
      CFStringRef v22 = (const __CFString *)v20;
    }
    else {
      CFStringRef v22 = @"-";
    }
    [v9 appendFormat:@"creation: %@\n", v22];

    uint64_t v23 = [(TUIStatsFeed *)self->_feed initialResourcesRenderedDate];
    v24 = (void *)v23;
    if (v23) {
      CFStringRef v25 = (const __CFString *)v23;
    }
    else {
      CFStringRef v25 = @"-";
    }
    [v9 appendFormat:@"initialResourcesRenderedDate: %@\n", v25];

    uint64_t v26 = [(TUIStatsFeed *)self->_feed contentUpdateDate];
    v27 = (void *)v26;
    if (v26) {
      CFStringRef v28 = (const __CFString *)v26;
    }
    else {
      CFStringRef v28 = @"-";
    }
    [v9 appendFormat:@"contentUpdate: %@\n", v28];

    uint64_t v29 = [(TUIStatsFeed *)self->_feed initialContentReadyDate];
    v30 = (void *)v29;
    if (v29) {
      CFStringRef v31 = (const __CFString *)v29;
    }
    else {
      CFStringRef v31 = @"-";
    }
    [v9 appendFormat:@"initialContentReady: %@\n", v31];

    uint64_t v32 = [(TUIStatsFeed *)self->_feed initialLayoutStartDate];
    v33 = (void *)v32;
    if (v32) {
      CFStringRef v34 = (const __CFString *)v32;
    }
    else {
      CFStringRef v34 = @"-";
    }
    [v9 appendFormat:@"initialLayoutStartDate: %@\n", v34];

    uint64_t v35 = [(TUIStatsFeed *)self->_feed allContentReadyDate];
    v36 = (void *)v35;
    if (v35) {
      CFStringRef v37 = (const __CFString *)v35;
    }
    else {
      CFStringRef v37 = @"-";
    }
    [v9 appendFormat:@"allContentReady: %@\n", v37];

    uint64_t v38 = [(TUIStatsFeed *)self->_feed dynamicUpdateDate];
    v39 = (void *)v38;
    if (v38) {
      CFStringRef v40 = (const __CFString *)v38;
    }
    else {
      CFStringRef v40 = @"-";
    }
    [v9 appendFormat:@"dynamicUpdate: %@\n", v40];

    uint64_t v41 = [(TUIStatsFeed *)self->_feed resourcesStartLoadingDate];
    v42 = (void *)v41;
    if (v41) {
      CFStringRef v43 = (const __CFString *)v41;
    }
    else {
      CFStringRef v43 = @"-";
    }
    [v9 appendFormat:@"resourcesStartLoadingDate: %@\n", v43];

    uint64_t v44 = [(TUIStatsFeed *)self->_feed resourcesLoadedDate];
    v45 = (void *)v44;
    if (v44) {
      CFStringRef v46 = (const __CFString *)v44;
    }
    else {
      CFStringRef v46 = @"-";
    }
    [v9 appendFormat:@"resourcesLoaded: %@\n", v46];

    uint64_t v47 = [(TUIStatsFeed *)self->_feed viewWillAppearDate];
    v48 = (void *)v47;
    if (v47) {
      CFStringRef v49 = (const __CFString *)v47;
    }
    else {
      CFStringRef v49 = @"-";
    }
    [v9 appendFormat:@"viewWillAppear: %@\n", v49];

    [v7 setHeader:v9];
    [v7 setTimingProvider:self->_feed];
    feed = self->_feed;
    v51 = v7;
LABEL_37:
    [v51 setEventProvider:feed];
    goto LABEL_38;
  }
  if ([v6 section] != (char *)&def_141F14 + 1)
  {
    if ([v6 section] != (char *)&def_141F14 + 2) {
      goto LABEL_39;
    }
    v52 = [(TUIStatsFeed *)self->_feed passes];
    v53 = (char *)[v52 count];
    v54 = &v53[~(unint64_t)[v6 row]];

    v55 = [(TUIStatsFeed *)self->_feed passes];
    id v9 = [v55 objectAtIndexedSubscript:v54];

    [v9 elapsedTimeForPhase:0];
    double v57 = v56 * 1000.0;
    v58 = TUIStatsReasonToString((char)[v9 reason]);
    v59 = +[NSString stringWithFormat:@"%.3fms - %@\n\n", *(void *)&v57, v58];
    [v7 setHeader:v59];

    [v7 setTimingProvider:0];
    v51 = v7;
    feed = 0;
    goto LABEL_37;
  }
  id v8 = [(TUIStatsFeed *)self->_feed currentEntriesUID];
  [v8 objectAtIndexedSubscript:[v6 row]];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = [(TUIStatsFeed *)self->_feed entries];
  objc_super v11 = [v10 objectForKeyedSubscript:v9];

  v12 = [v11 passes];
  v13 = [v12 lastObject];

  [v11 elapsedTimeForPhase:0];
  double v15 = v14 * 1000.0;
  v16 = [v13 url];
  v17 = [v16 lastPathComponent];
  v18 = TUIStatsReasonToString((char)[v13 reason]);
  v19 = +[NSString stringWithFormat:@"%.3fms - %@ - %@\n\n", *(void *)&v15, v17, v18];
  [v7 setHeader:v19];

  [v7 setTimingProvider:0];
  [v7 setEventProvider:0];

LABEL_38:
LABEL_39:
  [v7 updateContent];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  if ([v11 section] == (char *)&def_141F14 + 1)
  {
    id v5 = [(TUIStatsFeed *)self->_feed currentEntriesUID];
    id v6 = [v5 objectAtIndexedSubscript:[v11 row]];

    v7 = [(TUIStatsFeed *)self->_feed entries];
    id v8 = [v7 objectForKeyedSubscript:v6];
    id v9 = +[TUIStatsViewControllerFactory newViewControllerWithFeedEntry:v8];

    v10 = [(TUIStatsFeedViewController *)self navigationController];
    [v10 pushViewController:v9 animated:1];
  }
}

- (TUIStatsFeed)feed
{
  return self->_feed;
}

- (void).cxx_destruct
{
}

@end