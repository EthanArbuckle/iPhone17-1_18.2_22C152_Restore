@interface TUIStatsFeedEntryViewController
- (TUIStatsFeedEntry)feedEntry;
- (TUIStatsFeedEntryViewController)initWithFeedEntry:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation TUIStatsFeedEntryViewController

- (TUIStatsFeedEntryViewController)initWithFeedEntry:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIStatsFeedEntryViewController;
  v6 = [(TUIStatsFeedEntryViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedEntry, a3);
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Done" style:2 target:v7 action:"_dismiss:"];
    v9 = [(TUIStatsFeedEntryViewController *)v7 navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  return v7;
}

- (void)_dismiss:(id)a3
{
  id v3 = [(TUIStatsFeedEntryViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)TUIStatsFeedEntryViewController;
  [(TUIStatsFeedEntryViewController *)&v8 viewDidLoad];
  id v3 = [(TUIStatsFeedEntryViewController *)self tableView];
  v4 = +[TUIStatsCell nib];
  [v3 registerNib:v4 forCellReuseIdentifier:@"cell"];

  id v5 = [(TUIStatsFeedEntryViewController *)self tableView];
  [v5 setRowHeight:UITableViewAutomaticDimension];

  v6 = [(TUIStatsFeedEntryViewController *)self tableView];
  [v6 setEstimatedRowHeight:100.0];

  v7 = [(TUIStatsFeedEntryViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"header"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  v4 = [(TUIStatsFeedEntry *)self->_feedEntry passes];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = [(TUIStatsFeedEntryViewController *)self tableView];
  v6 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:@"header"];

  if (a4 == 1)
  {
    v7 = [v6 textLabel];
    objc_super v8 = v7;
    CFStringRef v9 = @"Passes";
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    v7 = [v6 textLabel];
    objc_super v8 = v7;
    CFStringRef v9 = @"Summary";
  }
  [v7 setText:v9];

LABEL_6:

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v6];
  if ([v6 section])
  {
    if ([v6 section] == (char *)&def_141F14 + 1)
    {
      objc_super v8 = [(TUIStatsFeedEntry *)self->_feedEntry passes];
      CFStringRef v9 = (char *)[v8 count];
      v10 = &v9[~(unint64_t)[v6 row]];

      objc_super v11 = [(TUIStatsFeedEntry *)self->_feedEntry passes];
      v12 = [v11 objectAtIndexedSubscript:v10];

      v13 = [v12 url];
      v14 = [v13 lastPathComponent];
      v15 = TUIStatsReasonToString((char)[v12 reason]);
      v16 = +[NSString stringWithFormat:@"%@ - %@\n\n", v14, v15];
      [v7 setHeader:v16];

      [v7 setTimingProvider:v12];
      [v7 setEventProvider:v12];
    }
  }
  else
  {
    [v7 setHeader:0];
    [v7 setTimingProvider:self->_feedEntry];
    [v7 setEventProvider:self->_feedEntry];
  }
  [v7 updateContent];

  return v7;
}

- (TUIStatsFeedEntry)feedEntry
{
  return self->_feedEntry;
}

- (void).cxx_destruct
{
}

@end