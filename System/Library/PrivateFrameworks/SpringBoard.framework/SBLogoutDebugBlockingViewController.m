@interface SBLogoutDebugBlockingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSDictionary)debugBlockingTasks;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureCell:(id)a3 withBlockingTask:(id)a4;
- (void)loadView;
- (void)setDebugBlockingTasks:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBLogoutDebugBlockingViewController

- (void)setDebugBlockingTasks:(id)a3
{
  p_debugBlockingTasks = &self->_debugBlockingTasks;
  v12 = (NSDictionary *)a3;
  if (*p_debugBlockingTasks != v12)
  {
    objc_storeStrong((id *)&self->_debugBlockingTasks, a3);
    v6 = [(NSDictionary *)*p_debugBlockingTasks allKeys];
    v7 = [v6 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    applicationKeys = self->_applicationKeys;
    self->_applicationKeys = v7;

    v9 = [(SBLogoutDebugBlockingViewController *)self view];
    v10 = [v9 window];

    if (v10)
    {
      v11 = [(SBLogoutDebugBlockingViewController *)self _tableView];
      [v11 reloadData];
    }
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setDelegate:self];
  [v4 setDataSource:self];
  [v4 setBackgroundColor:0];
  [(SBLogoutDebugBlockingViewController *)self setView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBLogoutDebugBlockingViewController;
  [(SBLogoutDebugBlockingViewController *)&v5 viewWillAppear:a3];
  id v4 = [(SBLogoutDebugBlockingViewController *)self _tableView];
  [v4 reloadData];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureCell:(id)a3 withBlockingTask:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v21 = [v5 name];
  v7 = [v5 reason];
  v8 = [v5 bundleID];

  v9 = &stru_1F3084718;
  if (v21) {
    v10 = v21;
  }
  else {
    v10 = &stru_1F3084718;
  }
  v11 = v10;
  if (v7) {
    v12 = v7;
  }
  else {
    v12 = &stru_1F3084718;
  }
  v13 = v12;
  if (v8)
  {
    v9 = [NSString stringWithFormat:@"(%@)", v8];
  }
  v14 = [MEMORY[0x1E4F28E78] stringWithString:v11];
  [v14 appendString:@" "];
  if (v9) {
    [v14 appendString:v9];
  }
  v15 = [v6 textLabel];
  [v15 setTextAlignment:0];
  [v15 setText:v14];
  v16 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.75];
  [v15 setColor:v16];

  v17 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:13.0];
  [v15 setFont:v17];

  v18 = [v6 detailTextLabel];
  [v18 setTextAlignment:0];
  [v18 setText:v13];
  v19 = [MEMORY[0x1E4F428B8] grayColor];
  [v18 setColor:v19];

  v20 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0];
  [v18 setFont:v20];

  [v6 setBackgroundColor:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSDictionary *)self->_debugBlockingTasks count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(NSArray *)self->_applicationKeys objectAtIndex:a4];
  if (v5)
  {
    id v6 = [(NSDictionary *)self->_debugBlockingTasks objectForKey:v5];
    int64_t v7 = [v6 count];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"DebugBlockingViewCell"];
  v8 = -[NSArray objectAtIndex:](self->_applicationKeys, "objectAtIndex:", [v6 section]);
  if (v8)
  {
    v9 = [(NSDictionary *)self->_debugBlockingTasks objectForKey:v8];
    if (v9)
    {
      v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
      if (v10)
      {
        if (!v7) {
          int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:3 reuseIdentifier:@"DebugBlockingViewCell"];
        }
        [(SBLogoutDebugBlockingViewController *)self _configureCell:v7 withBlockingTask:v10];
      }
    }
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_applicationKeys objectAtIndex:a4];
  id v5 = +[SBApplicationController sharedInstance];
  id v6 = [v5 applicationWithBundleIdentifier:v4];

  if (v6)
  {
    id v7 = [v6 displayName];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 2;
}

- (NSDictionary)debugBlockingTasks
{
  return self->_debugBlockingTasks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationKeys, 0);
  objc_storeStrong((id *)&self->_debugBlockingTasks, 0);
}

@end