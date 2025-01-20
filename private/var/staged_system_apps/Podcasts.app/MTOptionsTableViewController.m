@interface MTOptionsTableViewController
+ (double)rowHeight;
+ (id)optionFont;
- (MTOptionSetting)option;
- (MTOptionsTableViewController)initWithOption:(id)a3;
- (MTOptionsTableViewController)initWithOption:(id)a3 largeTitleDisplayMode:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)footerText;
- (id)headerText;
- (id)metricsName;
- (id)optionSelectedBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)selectedIndex;
- (void)_updateTextColorForCell:(id)a3 selected:(BOOL)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)setOption:(id)a3;
- (void)setOptionSelectedBlock:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateRowHeight;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTOptionsTableViewController

+ (double)rowHeight
{
  v2 = [(id)objc_opt_class() optionFont];
  [v2 lineHeight];
  double v4 = v3 + 30.0;

  return v4;
}

+ (id)optionFont
{
  return +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
}

- (MTOptionsTableViewController)initWithOption:(id)a3
{
  return [(MTOptionsTableViewController *)self initWithOption:a3 largeTitleDisplayMode:0];
}

- (MTOptionsTableViewController)initWithOption:(id)a3 largeTitleDisplayMode:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTOptionsTableViewController;
  v8 = [(MTOptionsTableViewController *)&v13 initWithStyle:2];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_option, a3);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v9 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v11 = [(MTOptionsTableViewController *)v9 navigationItem];
    [v11 setLargeTitleDisplayMode:a4];
  }
  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTOptionsTableViewController;
  [(MTOptionsTableViewController *)&v3 viewDidLoad];
  [(MTOptionsTableViewController *)self updateRowHeight];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTOptionsTableViewController;
  [(MTOptionsTableViewController *)&v4 dealloc];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTOptionsTableViewController;
  id v7 = a4;
  -[MTOptionsTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100114A94;
  v8[3] = &unk_10054E878;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = [(MTOptionsTableViewController *)self view];
  [v4 setNeedsLayout];

  [(MTOptionsTableViewController *)self updateRowHeight];
}

- (void)updateRowHeight
{
  objc_super v3 = [(MTOptionsTableViewController *)self tableView];
  [(id)objc_opt_class() rowHeight];
  [v3 setRowHeight:];

  id v4 = [(MTOptionsTableViewController *)self tableView];
  [v4 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MTOptionsTableViewController *)self option];
  v5 = [v4 options];
  v6 = [v5 longTitles];
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"OptionCell"];
  if (!v7) {
    id v7 = [[MTTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"OptionCell"];
  }
  id v8 = [v6 row];
  BOOL v9 = v8 == (id)[(MTOptionsTableViewController *)self selectedIndex];
  BOOL v10 = v9;
  if (v9) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [(MTTableViewCell *)v7 setAccessoryType:v11];
  [(MTOptionsTableViewController *)self _updateTextColorForCell:v7 selected:v10];
  v12 = [(MTTableViewCell *)v7 textLabel];
  objc_super v13 = [(id)objc_opt_class() optionFont];
  [v12 setFont:v13];

  v14 = [(MTTableViewCell *)v7 textLabel];
  v15 = [(MTOptionsTableViewController *)self option];
  v16 = [v15 options];
  v17 = [v16 longTitles];
  v18 = [v17 objectAtIndex:[v6 row]];
  [v14 setText:v18];

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v5 = [(MTOptionsTableViewController *)self footerText];

  if (v5)
  {
    v5 = objc_alloc_init(MTGenericSettingsFooterLabelView);
    id v6 = [(MTOptionsTableViewController *)self footerText];
    id v7 = [(MTGenericSettingsFooterLabelView *)v5 textView];
    [v7 setAttributedText:v6];
  }

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  v5 = [(MTOptionsTableViewController *)self footerText];
  if ([v5 length])
  {
    id v6 = [v5 string];
    id v7 = [(MTOptionsTableViewController *)self view];
    [v7 frame];
    CGFloat v8 = CGRectGetWidth(v17) + -64.0;
    NSAttributedStringKey v15 = NSFontAttributeName;
    BOOL v9 = +[UIFont sectionFooterFont];
    v16 = v9;
    BOOL v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v6 boundingRectWithSize:1 options:v10 attributes:0 context:v8];
    double v12 = v11;

    double v13 = v12 + 16.0;
  }
  else
  {
    double v13 = 16.0;
  }

  return v13;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    id v7 = [(MTOptionsTableViewController *)self headerText];
    CGFloat v8 = [v6 textLabel];

    [v8 setText:v7];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[MTOptionsTableViewController selectedIndex](self, "selectedIndex"), [v6 section]);
  CGFloat v8 = [v15 cellForRowAtIndexPath:v7];
  [v8 setAccessoryType:0];
  [(MTOptionsTableViewController *)self _updateTextColorForCell:v8 selected:0];
  id v9 = [v15 cellForRowAtIndexPath:v6];

  [v9 setAccessoryType:3];
  [(MTOptionsTableViewController *)self _updateTextColorForCell:v9 selected:1];
  [v15 deselectRowAtIndexPath:v6 animated:1];
  optionSelectedBlock = (void (**)(id, id))self->_optionSelectedBlock;
  if (optionSelectedBlock) {
    optionSelectedBlock[2](optionSelectedBlock, [v6 row]);
  }
  double v11 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v6 section]);
  [v15 reloadSections:v11 withRowAnimation:100];

  double v12 = [v15 headerViewForSection:[v6 section]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v13 = [v12 textLabel];
    v14 = [(MTOptionsTableViewController *)self headerText];
    [v13 setText:v14];
  }
}

- (void)_updateTextColorForCell:(id)a3 selected:(BOOL)a4
{
  id v5 = a3;
  if (a4) {
    +[UIColor appTintColor];
  }
  else {
  id v7 = +[UIColor cellTextColor];
  }
  id v6 = [v5 textLabel];

  [v6 setTextColor:v7];
}

- (id)footerText
{
  objc_super v3 = [(MTOptionsTableViewController *)self option];
  id v4 = [v3 footerText];

  id v5 = [(MTOptionsTableViewController *)self option];
  id v6 = [v5 options];
  id v7 = [v6 footerCallback];

  if (v7)
  {
    CGFloat v8 = [(MTOptionsTableViewController *)self option];
    id v9 = [v8 options];
    BOOL v10 = [v9 footerCallback];
    double v11 = [(MTOptionsTableViewController *)self option];
    double v12 = [v11 value];
    id v13 = (id)((uint64_t (**)(void, id))v10)[2](v10, [v12 unsignedIntegerValue]);
  }

  return v4;
}

- (id)headerText
{
  objc_super v3 = [(MTOptionsTableViewController *)self option];
  id v4 = [v3 options];
  id v5 = [v4 headerCallback];

  if (v5)
  {
    id v6 = [(MTOptionsTableViewController *)self option];
    id v7 = [v6 options];
    CGFloat v8 = [v7 headerCallback];
    id v9 = [(MTOptionsTableViewController *)self option];
    BOOL v10 = [v9 value];
    id v11 = (id)((uint64_t (**)(void, id))v8)[2](v8, [v10 unsignedIntegerValue]);
  }
  return 0;
}

- (unint64_t)selectedIndex
{
  objc_super v3 = [(MTOptionsTableViewController *)self option];
  id v4 = [v3 options];
  id v5 = [(MTOptionsTableViewController *)self option];
  id v6 = [v5 value];
  id v7 = [v4 indexForValue:[v6 unsignedIntegerValue]];

  return (unint64_t)v7;
}

- (id)metricsName
{
  v2 = [(MTOptionsTableViewController *)self option];
  objc_super v3 = [v2 headerTitle];
  id v4 = +[NSString stringWithFormat:@"Settings: %@", v3];

  return v4;
}

- (id)optionSelectedBlock
{
  return self->_optionSelectedBlock;
}

- (void)setOptionSelectedBlock:(id)a3
{
}

- (MTOptionSetting)option
{
  return self->_option;
}

- (void)setOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_option, 0);

  objc_storeStrong(&self->_optionSelectedBlock, 0);
}

@end