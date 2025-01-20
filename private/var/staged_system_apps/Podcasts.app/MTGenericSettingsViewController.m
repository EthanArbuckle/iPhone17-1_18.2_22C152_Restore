@interface MTGenericSettingsViewController
+ (BOOL)isMacIdiom;
+ (double)rowHeight;
+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
+ (id)cellIdentifierForSettingType:(int64_t)a3;
+ (id)settingFont;
- (BOOL)_isEmphasizedSetting:(id)a3;
- (BOOL)_radioButtonTintsTextColorOnSelection;
- (BOOL)_shouldDelayEmphasizeCellScrollToVisible;
- (BOOL)emphasizedCellNeedsScrollToVisible;
- (BOOL)updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:(id)a3;
- (MTGenericSettingsViewController)init;
- (MTSetting)emphasizedSetting;
- (MTSettingsController)settingsController;
- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)indexPathForSetting:(id)a3;
- (id)newCellForDescriptionType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
- (id)optionsTableViewControllerWithOption:(id)a3;
- (id)settingAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_defaultSelectionStyleForSetting:(id)a3;
- (int64_t)cellEmphasisStyle;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureEmphasisForCell:(id)a3 indexPath:(id)a4 animated:(BOOL)a5;
- (void)_configureEmphasisForCellAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)_scrollEmphasizedCellToVisibleIfNecessary;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)optionSettingChanged:(id)a3 value:(unint64_t)a4;
- (void)setCell:(id)a3 enabled:(BOOL)a4 withDescription:(id)a5;
- (void)setCellEmphasisStyle:(int64_t)a3;
- (void)setEmphasizedCellNeedsScrollToVisible:(BOOL)a3;
- (void)setEmphasizedSetting:(id)a3;
- (void)setEmphasizedSetting:(id)a3 style:(int64_t)a4;
- (void)setSettingsController:(id)a3;
- (void)settingsController:(id)a3 addedGroup:(id)a4 atIndex:(int64_t)a5;
- (void)settingsController:(id)a3 didChangeHeaderAction:(id)a4 inGroupWithIdentifier:(id)a5;
- (void)settingsController:(id)a3 didChangeSettingValueAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5;
- (void)settingsController:(id)a3 reloadedGroupWithIdentifier:(id)a4;
- (void)settingsController:(id)a3 removedGroupAtIndex:(int64_t)a4;
- (void)settingsController:(id)a3 removedSettingAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5;
- (void)switchSettingChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)textSettingChanged:(id)a3 value:(id)a4;
- (void)updateRowHeight;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTGenericSettingsViewController

+ (id)settingFont
{
  if ([a1 isMacIdiom]) {
    +[UIFont systemFontOfSize:15.0];
  }
  else {
  v2 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
  }

  return v2;
}

+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a4;
  if ((unint64_t)a3 <= 9)
  {
    v7 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v7);
  }

  return v4;
}

+ (id)cellIdentifierForSettingType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return @"MTSettingSwitchType";
  }
  else {
    return *(&off_1005526D0 + a3 - 1);
  }
}

+ (double)rowHeight
{
  v2 = [(id)objc_opt_class() settingFont];
  [v2 lineHeight];
  double v4 = v3 + 30.0;

  return v4;
}

- (MTGenericSettingsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTGenericSettingsViewController;
  v2 = [(MTGenericSettingsViewController *)&v6 initWithStyle:2];
  if (v2)
  {
    double v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    double v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"syncControllerOperationCompleted:" name:@"MTSyncControllerOperationCompleted" object:0];
  }
  return v2;
}

- (void)dealloc
{
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTGenericSettingsViewController;
  [(MTGenericSettingsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MTGenericSettingsViewController;
  [(MTGenericSettingsViewController *)&v4 viewDidLoad];
  double v3 = [(MTGenericSettingsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"MTSettingsWithActionHeaderView"];
  [(MTGenericSettingsViewController *)self updateRowHeight];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTGenericSettingsViewController;
  [(MTGenericSettingsViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(MTGenericSettingsViewController *)self tableView];
  [v4 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTGenericSettingsViewController;
  [(MTGenericSettingsViewController *)&v4 viewDidAppear:a3];
  [(MTGenericSettingsViewController *)self _scrollEmphasizedCellToVisibleIfNecessary];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = [(MTGenericSettingsViewController *)self view];
  [v4 setNeedsLayout];

  [(MTGenericSettingsViewController *)self updateRowHeight];
}

- (void)updateRowHeight
{
  double v3 = [(MTGenericSettingsViewController *)self tableView];
  [(id)objc_opt_class() rowHeight];
  [v3 setRowHeight:];

  id v4 = [(MTGenericSettingsViewController *)self tableView];
  [v4 reloadData];
}

- (void)setEmphasizedSetting:(id)a3 style:(int64_t)a4
{
  v13 = (MTSetting *)a3;
  emphasizedSetting = self->_emphasizedSetting;
  BOOL v8 = self->_cellEmphasisStyle != a4;
  v9 = [(MTGenericSettingsViewController *)self indexPathForSetting:emphasizedSetting];
  if (emphasizedSetting == v13)
  {
    v11 = 0;
  }
  else
  {
    if (v9) {
      BOOL v10 = self->_emphasizedSetting == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      v11 = 0;
    }
    else {
      v11 = v9;
    }
    BOOL v8 = 1;
  }
  id v12 = v11;
  objc_storeStrong((id *)&self->_emphasizedSetting, a3);
  self->_cellEmphasisStyle = a4;
  if (v8)
  {
    if (v12) {
      [(MTGenericSettingsViewController *)self _configureEmphasisForCellAtIndexPath:v12 animated:+[UIView areAnimationsEnabled]];
    }
    self->_emphasizedCellNeedsScrollToVisible = 1;
    if (![(MTGenericSettingsViewController *)self _shouldDelayEmphasizeCellScrollToVisible])[(MTGenericSettingsViewController *)self _scrollEmphasizedCellToVisibleIfNecessary]; {
  }
    }
}

- (BOOL)_shouldDelayEmphasizeCellScrollToVisible
{
  double v3 = [(MTGenericSettingsViewController *)self navigationController];
  if (v3)
  {
    id v4 = [(MTGenericSettingsViewController *)self view];
    objc_super v5 = [v4 window];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_scrollEmphasizedCellToVisibleIfNecessary
{
  if (self->_emphasizedCellNeedsScrollToVisible)
  {
    self->_emphasizedCellNeedsScrollToVisible = 0;
    if (self->_emphasizedSetting)
    {
      uint64_t v3 = -[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:");
      uint64_t v4 = v3;
      if (v3)
      {
        uint64_t v27 = v3;
        objc_super v5 = [(MTGenericSettingsViewController *)self tableView];
        [v5 rectForRowAtIndexPath:v27];
        CGFloat v7 = v6;
        CGFloat v9 = v8;
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        [v5 visibleBounds];
        double Height = CGRectGetHeight(v29);
        v30.origin.x = v7;
        v30.origin.y = v9;
        v30.size.width = v11;
        v30.size.height = v13;
        double v15 = CGRectGetMaxY(v30) + Height * -0.5;
        [v5 adjustedContentInset];
        double v17 = v16;
        double v19 = -v18;
        [v5 contentSize];
        double v21 = v17 + v20 - Height;
        [v5 contentOffset];
        double v23 = v22;
        if (v15 >= v21) {
          double v24 = v21;
        }
        else {
          double v24 = v15;
        }
        if (v24 >= v19) {
          double v25 = v24;
        }
        else {
          double v25 = v19;
        }
        BOOL v26 = +[UIView areAnimationsEnabled];
        [v5 setContentOffset:v26 animated:v23];
        [(MTGenericSettingsViewController *)self _configureEmphasisForCellAtIndexPath:v27 animated:v26];

        uint64_t v4 = v27;
      }
      _objc_release_x1(v3, v4);
    }
  }
}

- (void)setEmphasizedSetting:(id)a3
{
  if (self->_cellEmphasisStyle) {
    [(MTGenericSettingsViewController *)self setEmphasizedSetting:a3 style:self->_cellEmphasisStyle];
  }
  else {
    [(MTGenericSettingsViewController *)self setEmphasizedSetting:a3 style:2];
  }
}

- (void)setCellEmphasisStyle:(int64_t)a3
{
  if (self->_cellEmphasisStyle != a3)
  {
    self->_cellEmphasisStyle = a3;
    if (self->_emphasizedSetting)
    {
      -[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (v4) {
        [(MTGenericSettingsViewController *)self _configureEmphasisForCellAtIndexPath:v4 animated:+[UIView areAnimationsEnabled]];
      }
    }
  }
}

- (BOOL)_isEmphasizedSetting:(id)a3
{
  return self->_emphasizedSetting == a3;
}

- (void)_configureEmphasisForCellAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CGFloat v7 = [(MTGenericSettingsViewController *)self tableView];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  [(MTGenericSettingsViewController *)self _configureEmphasisForCell:v8 indexPath:v6 animated:v4];
}

- (void)_configureEmphasisForCell:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(MTGenericSettingsViewController *)self settingAtIndexPath:a4];
  double v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v8;
        if ([(MTGenericSettingsViewController *)self _isEmphasizedSetting:v10]) {
          int64_t cellEmphasisStyle = self->_cellEmphasisStyle;
        }
        else {
          int64_t cellEmphasisStyle = 0;
        }
        double v15 = _NSConcreteStackBlock;
        uint64_t v16 = 3221225472;
        double v17 = sub_10012A844;
        double v18 = &unk_10054EB68;
        id v13 = v11;
        id v19 = v13;
        int64_t v20 = cellEmphasisStyle;
        v14 = objc_retainBlock(&v15);
        if (v5)
        {
          [v13 selectionFadeDuration:v15, v16, v17, v18];
          +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, 0);
        }
        else
        {
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14, v15, v16, v17, v18);
        }
      }
    }
  }
}

- (void)setSettingsController:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_settingsController, a3);
  [v6 setDelegate:self];
  if ([(MTGenericSettingsViewController *)self isViewLoaded])
  {
    BOOL v5 = [(MTGenericSettingsViewController *)self tableView];
    [v5 reloadData];
  }
}

- (id)settingAtIndexPath:(id)a3
{
  settingsController = self->_settingsController;
  id v5 = a3;
  id v6 = [(MTSettingsController *)settingsController order];
  CGFloat v7 = [v6 objectAtIndexedSubscript:[v5 section]];

  id v8 = [(MTSettingsController *)self->_settingsController groups];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  double v10 = [v9 groupSettings];

  id v11 = [v5 row];
  double v12 = [v10 objectAtIndexedSubscript:v11];

  return v12;
}

- (id)indexPathForSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MTSettingsController *)self->_settingsController groups];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10012ABFC;
    v19[3] = &unk_100552610;
    id v6 = v4;
    id v20 = v6;
    CGFloat v7 = [v5 keysOfEntriesPassingTest:v19];
    id v8 = [v7 anyObject];

    uint64_t v9 = [(MTSettingsController *)self->_settingsController order];
    id v10 = [v9 indexOfObject:v8];

    id v11 = [v6 group];
    double v12 = [v11 groupSettings];
    id v13 = [v12 indexOfObject:v6];

    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL || v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      double v15 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(MTSettingsController *)self->_settingsController order];
        *(_DWORD *)buf = 138543874;
        id v22 = v6;
        __int16 v23 = 2114;
        double v24 = v8;
        __int16 v25 = 2114;
        BOOL v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to locate an index path for setting %{public}@ for key %{public}@. All settings: %{public}@", buf, 0x20u);
      }
      double v17 = 0;
    }
    else
    {
      double v17 = +[NSIndexPath indexPathForRow:v13 inSection:v10];
    }
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (void)setCell:(id)a3 enabled:(BOOL)a4 withDescription:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  id v8 = a5;
  if (v6)
  {
    [v15 setSelectionStyle:[self _defaultSelectionStyleForSetting:v8]];
    uint64_t v9 = [v15 textLabel];
    [v9 setEnabled:1];

    id v10 = [v15 detailTextLabel];
    id v11 = v10;
    uint64_t v12 = 1;
  }
  else
  {
    [v15 setSelectionStyle:0];
    id v13 = [v15 textLabel];
    [v13 setEnabled:0];

    id v10 = [v15 detailTextLabel];
    id v11 = v10;
    uint64_t v12 = 0;
  }
  [v10 setEnabled:v12];

  if ([v8 type])
  {
    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    [v15 setEnabled:v6];
    if (!v6) {
      goto LABEL_11;
    }
  }
  v14 = [(MTGenericSettingsViewController *)self indexPathForSetting:v8];
  if (v14) {
    [(MTGenericSettingsViewController *)self _configureEmphasisForCell:v15 indexPath:v14 animated:0];
  }

LABEL_11:
}

- (int64_t)_defaultSelectionStyleForSetting:(id)a3
{
  if ([a3 type]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  return 44.0;
}

+ (BOOL)isMacIdiom
{
  return 0;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 textLabel];
  id v15 = [v12 title];
  [v14 setText:v15];

  uint64_t v16 = [v10 textLabel];
  [v16 setAdjustsFontSizeToFitWidth:1];

  double v17 = [v10 textLabel];
  [v17 setBaselineAdjustment:1];

  double v18 = [v10 textLabel];
  [v18 setMinimumScaleFactor:0.9];

  if ([(id)objc_opt_class() isMacIdiom]) {
    +[UIFont systemFontOfSize:13.0];
  }
  else {
  id v19 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
  }
  id v20 = [v10 textLabel];
  [v20 setFont:v19];

  double v21 = [v10 detailTextLabel];
  [v21 setFont:v19];

  objc_initWeak(&location, self);
  switch((unint64_t)[v12 type])
  {
    case 0uLL:
      id v22 = v10;
      __int16 v23 = [v12 value];
      [v22 toggleOn:[v23 BOOLValue]];

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10012B2E0;
      v37[3] = &unk_100552638;
      objc_copyWeak(&v39, &location);
      id v38 = v12;
      [v22 setToggleChanged:v37];

      objc_destroyWeak(&v39);
      goto LABEL_20;
    case 1uLL:
      double v24 = [v10 textLabel];
      __int16 v25 = +[UIColor cellTextColor];
      [v24 setTextColor:v25];

      id v22 = [v10 textLabel];
      [v22 setTextAlignment:1];
      goto LABEL_20;
    case 2uLL:
      v34 = [v10 detailTextLabel];
      v35 = [v12 value];
      [v34 setText:v35];

      goto LABEL_17;
    case 3uLL:
LABEL_17:
      id v22 = [v10 textLabel];
      BOOL v26 = +[UIColor appTintColor];
      [v22 setTextColor:v26];
      goto LABEL_19;
    case 4uLL:
      id v22 = [v10 detailTextLabel];
      BOOL v26 = [v12 value];
      [v22 setText:v26];
      goto LABEL_19;
    case 5uLL:
      id v22 = v12;
      BOOL v26 = [v10 detailTextLabel];
      uint64_t v27 = [v22 currentShortTitle];
      [v26 setText:v27];
      goto LABEL_15;
    case 7uLL:
      id v22 = v12;
      v36 = [v22 radioGroup];
      v28 = [v22 value];
      CGRect v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v36 value]);
      unsigned int v30 = [v28 isEqual:v29];

      if (v30) {
        uint64_t v31 = 3;
      }
      else {
        uint64_t v31 = 0;
      }
      [v10 setAccessoryType:v31];
      if ([(MTGenericSettingsViewController *)self _radioButtonTintsTextColorOnSelection])
      {
        v32 = +[UIColor cellTextColor];
        v33 = [v10 textLabel];
        [v33 setTextColor:v32];
      }
      goto LABEL_20;
    case 9uLL:
      id v22 = v10;
      BOOL v26 = [v12 value];
      uint64_t v27 = [v22 messageLabel];
      [v27 setText:v26];
LABEL_15:

LABEL_19:
LABEL_20:

      break;
    default:
      break;
  }
  objc_destroyWeak(&location);
}

- (id)newCellForDescriptionType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(id)objc_opt_class() cellClassForSettingType:a3 inGroupWithIdentifier:v5];
  Class v7 = NSClassFromString(v6);

  id v8 = +[MTGenericSettingsViewController cellClassForSettingType:a3 inGroupWithIdentifier:v5];
  Class v9 = NSClassFromString(v8);

  if (([(objc_class *)v7 isSubclassOfClass:v9] & 1) == 0)
  {
    double v18 = +[NSString stringWithFormat:@"%@ is not a subclass of %@", v7, v9];
    id v19 = +[NSException exceptionWithName:@"MTInvalidCellClass" reason:v18 userInfo:0];

    objc_exception_throw(v19);
  }
  id v10 = NSStringFromClass(v7);
  id v11 = [(id)objc_opt_class() cellIdentifierForSettingType:a3];
  id v12 = +[NSString stringWithFormat:@"%@%@", v10, v11];

  switch(a3)
  {
    case 0:
    case 1:
    case 6:
    case 9:
      id v13 = [v7 alloc];
      uint64_t v14 = 0;
      goto LABEL_5;
    case 2:
    case 3:
    case 8:
      id v13 = [v7 alloc];
      uint64_t v14 = 1;
LABEL_5:
      Class v7 = (Class)[v13 initWithStyle:v14 reuseIdentifier:v12];
      break;
    case 4:
      id v15 = (objc_class *)[[v7 alloc] initWithStyle:1 reuseIdentifier:v12];
      Class v7 = v15;
      uint64_t v16 = 1;
      goto LABEL_9;
    case 5:
      Class v7 = (Class)[[v7 alloc] initWithStyle:1 reuseIdentifier:v12];
      uint64_t v16 = [(id)objc_opt_class() isMacIdiom] ^ 1;
      id v15 = v7;
      goto LABEL_9;
    case 7:
      id v15 = (objc_class *)[[v7 alloc] initWithStyle:1 reuseIdentifier:v12];
      Class v7 = v15;
      uint64_t v16 = 3;
LABEL_9:
      [(objc_class *)v15 setAccessoryType:v16];
      break;
    default:
      break;
  }

  return v7;
}

- (id)optionsTableViewControllerWithOption:(id)a3
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(MTGenericSettingsViewController *)self settingAtIndexPath:v5];
  Class v7 = [(MTSettingsController *)self->_settingsController order];
  id v8 = [v5 section];

  Class v9 = [v7 objectAtIndexedSubscript:v8];
  [(MTGenericSettingsViewController *)self heightForRowWithDescription:v6 inGroupWithIdentifier:v9];
  double v11 = v10;

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [(MTGenericSettingsViewController *)self tableView:a3 heightForRowAtIndexPath:a4];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  BOOL v6 = [(MTSettingsController *)self->_settingsController order];
  Class v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [(MTSettingsController *)self->_settingsController groups];
  Class v9 = [v8 objectForKeyedSubscript:v7];

  [v9 customHeaderHeight];
  double v10 = 30.0;
  if (v11 > 0.0)
  {
    [v9 customHeaderHeight];
    double v10 = v12;
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  [(MTGenericSettingsViewController *)self tableView:a3 heightForHeaderInSection:a4];
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  BOOL v6 = [(MTSettingsController *)self->_settingsController order];
  Class v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [(MTSettingsController *)self->_settingsController groups];
  Class v9 = [v8 objectForKeyedSubscript:v7];

  double v10 = [v9 groupFooter];
  if ([v10 length])
  {
    double v11 = objc_alloc_init(MTGenericSettingsFooterLabelView);
    double v12 = [(MTGenericSettingsFooterLabelView *)v11 textView];
    [v12 setAttributedText:v10];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  BOOL v6 = [(MTSettingsController *)self->_settingsController order];
  Class v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [(MTSettingsController *)self->_settingsController groups];
  Class v9 = [v8 objectForKeyedSubscript:v7];

  double v10 = [v9 groupFooter];
  if ([v10 length])
  {
    double v11 = [(MTGenericSettingsViewController *)self view];
    [v11 frame];
    double v13 = v12;
    +[MTGenericSettingsFooterLabelView labelInset];
    double v15 = v13 + v14 * -2.0;

    uint64_t v16 = [v10 string];
    NSAttributedStringKey v23 = NSFontAttributeName;
    double v17 = +[UIFont sectionFooterFont];
    double v24 = v17;
    double v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v16 boundingRectWithSize:1 options:v18 attributes:0 context:v15];
    double v20 = v19;

    double v21 = ceil(v20) + 32.0;
  }
  else
  {
    double v21 = 16.0;
  }

  return v21;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(MTSettingsController *)self->_settingsController order];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6 = [(MTSettingsController *)self->_settingsController order];
  Class v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [(MTSettingsController *)self->_settingsController groups];
  Class v9 = [v8 objectForKeyedSubscript:v7];
  double v10 = [v9 groupSettings];
  id v11 = [v10 count];

  return (int64_t)v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTGenericSettingsViewController *)self settingAtIndexPath:v6];
  Class v9 = [objc_opt_class() cellIdentifierForSettingType:[v8 type]];
  id v10 = [v7 dequeueReusableCellWithIdentifier:v9];

  if (!v10)
  {
    id v11 = [v8 type];
    double v12 = [(MTSettingsController *)self->_settingsController order];
    double v13 = [v12 objectAtIndexedSubscript:[v6 section]];
    id v10 = [(MTGenericSettingsViewController *)self newCellForDescriptionType:v11 inGroupWithIdentifier:v13];
  }
  double v14 = [(MTSettingsController *)self->_settingsController order];
  double v15 = [v14 objectAtIndexedSubscript:[v6 section]];
  [(MTGenericSettingsViewController *)self configureCell:v10 atIndexPath:v6 withDescription:v8 inGroupWithIdentifier:v15];

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MTGenericSettingsViewController *)self settingAtIndexPath:v5];
  id v7 = [(MTSettingsController *)self->_settingsController order];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  Class v9 = [(MTSettingsController *)self->_settingsController disabledGroups];
  if ([v9 containsObject:v8])
  {
  }
  else
  {
    unsigned __int8 v10 = [v6 enabled];

    if (v10)
    {
      id v11 = v5;
      goto LABEL_6;
    }
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTGenericSettingsViewController *)self settingAtIndexPath:v7];
  switch((unint64_t)[v8 type])
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      Class v9 = [v8 changeHandler];
      v9[2](v9, 0);

      break;
    case 4uLL:
      unsigned __int8 v10 = [v8 generator];
      id v11 = v10[2]();

      double v12 = [(MTGenericSettingsViewController *)self navigationController];
      [v12 pushViewController:v11 animated:1];

      break;
    case 5uLL:
      id v13 = v8;
      double v14 = [v13 options];
      double v15 = [(MTGenericSettingsViewController *)self optionsTableViewControllerWithOption:v13];
      uint64_t v16 = [v13 headerTitle];
      [v15 setTitle:v16];

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10012C158;
      v46[3] = &unk_100552660;
      v46[4] = self;
      id v47 = v13;
      id v48 = v14;
      id v49 = v7;
      id v17 = v14;
      id v18 = v13;
      [v15 setOptionSelectedBlock:v46];
      double v19 = [(MTGenericSettingsViewController *)self metricDataSource];
      [v15 setMetricDataSource:v19];

      double v20 = [(MTGenericSettingsViewController *)self navigationController];
      [v20 pushViewController:v15 animated:1];

      break;
    case 7uLL:
      id v40 = v7;
      id v41 = v6;
      id v39 = v8;
      id v21 = v8;
      id v22 = [v21 radioGroup];
      NSAttributedStringKey v23 = [v21 value];
      [v22 setValue:[v23 unsignedIntegerValue]];

      double v24 = [v22 changeHandler];
      id v38 = v21;
      __int16 v25 = [v21 value];
      ((void (**)(void, id))v24)[2](v24, [v25 unsignedIntegerValue]);

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v37 = v22;
      BOOL v26 = [v22 settings];
      id v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            v32 = [(MTGenericSettingsViewController *)self indexPathForSetting:v31];
            if (v32)
            {
              v33 = [(MTGenericSettingsViewController *)self tableView];
              v34 = [v33 cellForRowAtIndexPath:v32];

              v35 = [(MTSettingsController *)self->_settingsController order];
              v36 = [v35 objectAtIndexedSubscript:[v32 section]];

              [(MTGenericSettingsViewController *)self configureCell:v34 atIndexPath:v32 withDescription:v31 inGroupWithIdentifier:v36];
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v28);
      }

      id v7 = v40;
      id v6 = v41;
      id v8 = v39;
      break;
    default:
      break;
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MTSettingsController *)self->_settingsController order];
  id v8 = [v7 objectAtIndexedSubscript:a4];

  Class v9 = [(MTSettingsController *)self->_settingsController groups];
  unsigned __int8 v10 = [v9 objectForKeyedSubscript:v8];

  id v11 = [v10 headerAction];
  if (v11)
  {
    double v12 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"MTSettingsWithActionHeaderView"];
    [v12 setAction:v11];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(MTSettingsController *)self->_settingsController order];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [(MTSettingsController *)self->_settingsController groups];
  Class v9 = [v8 objectForKeyedSubscript:v7];

  unsigned __int8 v10 = [v9 groupTitle];

  return v10;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a4;
  if ([(id)objc_opt_class() isMacIdiom])
  {
    id v5 = [v7 contentView];
    id v6 = +[UIColor systemBackgroundColor];
    [v5 setBackgroundColor:v6];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = a4;
  unsigned __int8 v10 = [(MTSettingsController *)settingsController order];
  [v10 objectAtIndexedSubscript:[v8 section]];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = [(MTGenericSettingsViewController *)self settingAtIndexPath:v8];

  double v12 = [(MTSettingsController *)self->_settingsController disabledGroups];
  if ([v12 containsObject:v14]) {
    id v13 = 0;
  }
  else {
    id v13 = [v11 enabled];
  }

  [(MTGenericSettingsViewController *)self setCell:v9 enabled:v13 withDescription:v11];
}

- (void)settingsController:(id)a3 reloadedGroupWithIdentifier:(id)a4
{
  settingsController = self->_settingsController;
  id v6 = a4;
  id v7 = [(MTSettingsController *)settingsController order];
  id v8 = [v7 indexOfObject:v6];

  id v9 = [(MTGenericSettingsViewController *)self tableView];
  id v10 = [v9 numberOfSections];

  if ((uint64_t)v8 < (uint64_t)v10)
  {
    id v12 = [(MTGenericSettingsViewController *)self tableView];
    id v11 = +[NSIndexSet indexSetWithIndex:v8];
    [v12 reloadSections:v11 withRowAnimation:100];
  }
}

- (void)settingsController:(id)a3 addedGroup:(id)a4 atIndex:(int64_t)a5
{
  id v7 = [(MTGenericSettingsViewController *)self tableView];
  id v6 = +[NSIndexSet indexSetWithIndex:a5];
  [v7 insertSections:v6 withRowAnimation:100];
}

- (void)settingsController:(id)a3 didChangeHeaderAction:(id)a4 inGroupWithIdentifier:(id)a5
{
  id v16 = a4;
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = [(MTSettingsController *)settingsController order];
  id v10 = [v9 indexOfObject:v8];

  id v11 = v16;
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(MTGenericSettingsViewController *)self tableView];
    id v13 = [v12 headerViewForSection:v10];

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 setAction:v16];
      }
      else
      {
        id v14 = [(MTGenericSettingsViewController *)self tableView];
        double v15 = +[NSIndexSet indexSetWithIndex:v10];
        [v14 reloadSections:v15 withRowAnimation:100];
      }
    }

    id v11 = v16;
  }
}

- (void)settingsController:(id)a3 removedGroupAtIndex:(int64_t)a4
{
  id v6 = [(MTGenericSettingsViewController *)self tableView];
  id v5 = +[NSIndexSet indexSetWithIndex:a4];
  [v6 deleteSections:v5 withRowAnimation:100];
}

- (void)settingsController:(id)a3 removedSettingAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5
{
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = [(MTSettingsController *)settingsController order];
  id v10 = [v9 indexOfObject:v8];

  id v11 = [(MTGenericSettingsViewController *)self tableView];
  id v12 = +[NSIndexPath indexPathForRow:a4 inSection:v10];
  id v14 = v12;
  id v13 = +[NSArray arrayWithObjects:&v14 count:1];
  [v11 deleteRowsAtIndexPaths:v13 withRowAnimation:100];
}

- (void)settingsController:(id)a3 didChangeSettingValueAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5
{
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = [(MTSettingsController *)settingsController order];
  id v10 = [v9 indexOfObject:v8];

  id v11 = +[NSIndexPath indexPathForRow:a4 inSection:v10];

  if (![(MTGenericSettingsViewController *)self updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:v11])
  {
    id v12 = [(MTGenericSettingsViewController *)self tableView];
    id v14 = v11;
    id v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v12 reloadRowsAtIndexPaths:v13 withRowAnimation:100];
  }
}

- (BOOL)updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MTGenericSettingsViewController *)self settingAtIndexPath:v4];
  id v6 = [(MTGenericSettingsViewController *)self tableView];
  id v7 = [v6 cellForRowAtIndexPath:v4];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v9 = [v5 value];
    [v7 toggleOn:[v9 BOOLValue] animated:1];
  }
  return isKindOfClass & 1;
}

- (void)optionSettingChanged:(id)a3 value:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInteger:a4];
  [v5 setValue:v6];

  id v8 = [v5 changeHandler];

  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  v8[2](v8, v7);
}

- (void)switchSettingChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 title];
  id v8 = +[NSNumber numberWithBool:v4];
  [v6 setValue:v8];

  id v9 = [v6 changeHandler];
  id v10 = +[NSNumber numberWithBool:v4];
  ((void (**)(void, void *))v9)[2](v9, v10);

  id v11 = [(MTGenericSettingsViewController *)self indexPathForSetting:v6];
  id v12 = [v6 title];

  LOBYTE(v6) = [v7 isEqualToString:v12];
  if ((v6 & 1) == 0 && v11)
  {
    id v13 = [(MTGenericSettingsViewController *)self tableView];
    double v15 = v11;
    id v14 = +[NSArray arrayWithObjects:&v15 count:1];
    [v13 reloadRowsAtIndexPaths:v14 withRowAnimation:5];
  }
}

- (void)textSettingChanged:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    [v6 setValue:v7];
    id v8 = [v6 changeHandler];
    ((void (**)(void, id))v8)[2](v8, v7);
  }
  else
  {
    id v8 = [(MTGenericSettingsViewController *)self indexPathForSetting:v6];
    id v9 = [(MTGenericSettingsViewController *)self tableView];
    id v10 = v9;
    if (v8)
    {
      id v12 = v8;
      id v11 = +[NSArray arrayWithObjects:&v12 count:1];
      [v10 reloadRowsAtIndexPaths:v11 withRowAnimation:5];
    }
    else
    {
      [v9 reloadData];
    }
  }
}

- (BOOL)_radioButtonTintsTextColorOnSelection
{
  return 1;
}

- (MTSettingsController)settingsController
{
  return self->_settingsController;
}

- (MTSetting)emphasizedSetting
{
  return self->_emphasizedSetting;
}

- (int64_t)cellEmphasisStyle
{
  return self->_cellEmphasisStyle;
}

- (BOOL)emphasizedCellNeedsScrollToVisible
{
  return self->_emphasizedCellNeedsScrollToVisible;
}

- (void)setEmphasizedCellNeedsScrollToVisible:(BOOL)a3
{
  self->_emphasizedCellNeedsScrollToVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedSetting, 0);

  objc_storeStrong((id *)&self->_settingsController, 0);
}

@end