@interface IdentitySwitcherViewController
- (CGSize)preferredContentSize;
- (IdentitySwitcherViewController)initWithModel:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation IdentitySwitcherViewController

- (IdentitySwitcherViewController)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IdentitySwitcherViewController;
  v6 = [(IdentitySwitcherViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UITableView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  tableView = self->_tableView;
  self->_tableView = v7;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  +[IdentitySwitcherCell cellHeight];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  objc_super v9 = -[IdentitySwitcherHeaderView initWithFrame:]([IdentitySwitcherHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(IdentitySwitcherHeaderView *)v9 setPreservesSuperviewLayoutMargins:1];
  [(IdentitySwitcherHeaderView *)v9 sizeToFit];
  [(UITableView *)self->_tableView setTableHeaderView:v9];
  [(IdentitySwitcherViewController *)self setView:self->_tableView];
}

- (CGSize)preferredContentSize
{
  tableView = self->_tableView;
  [(UITableView *)tableView bounds];

  -[UITableView sizeThatFits:](tableView, "sizeThatFits:", v3, 1.79769313e308);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
  double v5 = (char *)[v4 count] + 2;

  return (int64_t)v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v5 = [a4 row];
  v6 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
  v7 = (char *)[v6 count] + 1;

  if (v5 < v7) {
    return UITableViewAutomaticDimension;
  }
  objc_super v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v9 _scaledValueForValue:52.0];
  double v11 = v10;

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  objc_super v9 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
  id v10 = [v9 count];

  if (v8 <= v10)
  {
    v17 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
    if ([v7 row])
    {
      v20 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
      v18 = [v20 objectAtIndex:[v7 row] - 1];

      unsigned int v21 = [v17 isEqual:v18];
    }
    else
    {
      v18 = 0;
      unsigned int v21 = v17 == 0;
    }
    v22 = +[IdentitySwitcherCell cellForSource:v18 withModel:self->_model inTableView:v6];
    id v11 = v22;
    if (v21) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 0;
    }
    [v22 setAccessoryType:v23];
    id v24 = [v7 row];
    v25 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
    id v26 = [v25 count];

    if (v24 < v26)
    {
      [v11 layoutMargins];
      [v11 setSeparatorInset:0.0, v27 + 65.0, 0.0, 0.0];
    }
  }
  else
  {
    id v11 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    v12 = [v6 tintColor];
    v13 = [v11 textLabel];
    [v13 setTextColor:v12];

    v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"Add Delegate Calendar…" value:&stru_1001D6918 table:0];
    v16 = [v11 textLabel];
    [v16 setText:v15];

    v17 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:0];
    v18 = +[UIFont fontWithDescriptor:v17 size:0.0];
    v19 = [v11 textLabel];
    [v19 setFont:v18];
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  [a3 deselectRowAtIndexPath:v16 animated:1];
  id v6 = [v16 row];
  id v7 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
  id v8 = [v7 count];

  if (v6 <= v8)
  {
    if ((uint64_t)[v16 row] < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
      v13 = [v12 objectAtIndex:[v16 row] - 1];
    }
    model = self->_model;
    v15 = [(CUIKCalendarModel *)model selectedCalendars];
    [(CUIKCalendarModel *)model updateSourceForSelectedIdentity:v13 selectedCalendars:v15];

    id v10 = [(IdentitySwitcherViewController *)self presentingViewController];
    [v10 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    objc_super v9 = [(IdentitySwitcherViewController *)self presentingViewController];
    [v9 dismissViewControllerAnimated:1 completion:0];

    id v10 = +[NSURL URLWithString:@"prefs:root=CALENDAR&path=DELEGATE_CALENDARS"];
    id v11 = +[LSApplicationWorkspace defaultWorkspace];
    [v11 openSensitiveURL:v10 withOptions:0 error:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end