@interface THStudyOptionsPopoverController
- (IMThemePage)theme;
- (THStudyOptionsDelegate)delegate;
- (THStudyOptionsPopoverController)initWithOptions:(id)a3;
- (UIColor)hiddenColor;
- (UIImage)checkImage;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)doneButtonPressed:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)p_updateColors;
- (void)setCheckImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTheme:(id)a3;
- (void)shuffleSwitchChanged:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation THStudyOptionsPopoverController

- (THStudyOptionsPopoverController)initWithOptions:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptionsPopoverController initWithOptions:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptionsPopoverController.mm") lineNumber:95 description:@"invalid nil value for '%s'", "options"];
  }
  uint64_t v5 = THBundle();
  v13.receiver = self;
  v13.super_class = (Class)THStudyOptionsPopoverController;
  v6 = [(THStudyOptionsPopoverController *)&v13 initWithNibName:@"THiOSStudyOptions" bundle:v5];
  if (v6)
  {
    v6->_options = (THStudyOptions *)a3;
    -[THStudyOptionsPopoverController setTitle:](v6, "setTitle:", [(id)THBundle() localizedStringForKey:@"Study Options" value:&stru_46D7E8 table:0]);
    if (+[UIFont bc_accessibilityFontSizesEnabled])double v7 = 360.0; {
    else
    }
      double v7 = 320.0;
    unsigned int v8 = +[UIFont bc_accessibilityFontSizesEnabled];
    double v9 = 400.0;
    if (!v8) {
      double v9 = 146.0;
    }
    -[THStudyOptionsPopoverController setPreferredContentSize:](v6, "setPreferredContentSize:", v7, v9);
    [v6 navigationItem].backBarButtonItem = [objc_alloc((Class)UIBarButtonItem) initWithTitle:&stru_46D7E8 style:0 target:0 action:0];
    [(THStudyOptionsPopoverController *)v6 preferredContentSize];
    objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](v6, "presentingViewController"), "presentedViewController"), "setPreferredContentSize:", v10, v11);
  }
  return v6;
}

- (void)dealloc
{
  self->_tableView = 0;
  self->_options = 0;

  self->_theme = 0;
  self->_checkImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)THStudyOptionsPopoverController;
  [(THStudyOptionsPopoverController *)&v3 dealloc];
}

- (UIImage)checkImage
{
  result = self->_checkImage;
  if (!result)
  {
    result = [+[UIImage systemImageNamed:@"checkmark"] imageWithRenderingMode:2];
    self->_checkImage = result;
  }
  return result;
}

- (UIColor)hiddenColor
{
  return +[UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THStudyOptionsPopoverController;
  [(THStudyOptionsPopoverController *)&v4 viewWillAppear:a3];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  [(THStudyOptionsPopoverController *)self p_updateColors];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THStudyOptionsPopoverController;
  [(THStudyOptionsPopoverController *)&v4 viewDidDisappear:a3];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)THStudyOptionsPopoverController;
  [(THStudyOptionsPopoverController *)&v3 viewDidLoad];
  [(UITableView *)[(THStudyOptionsPopoverController *)self tableView] registerClass:objc_opt_class() forCellReuseIdentifier:@"StudyOptionsTableCell"];
  [(UITableView *)[(THStudyOptionsPopoverController *)self tableView] setSectionFooterHeight:0.0];
  [(UITableView *)[(THStudyOptionsPopoverController *)self tableView] setTableFooterView:0];
  [(UITableView *)[(THStudyOptionsPopoverController *)self tableView] setSeparatorStyle:1];
  [(THStudyOptionsPopoverController *)self contentSizeCategoryDidChange];
}

- (void)contentSizeCategoryDidChange
{
  [(UITableView *)[(THStudyOptionsPopoverController *)self tableView] setRowHeight:42.0];
  [(UITableView *)[(THStudyOptionsPopoverController *)self tableView] setEstimatedRowHeight:42.0];
  if (+[UIFont bc_accessibilityFontSizesEnabled])
  {
    objc_super v3 = [(THStudyOptionsPopoverController *)self tableView];
    [(UITableView *)v3 setRowHeight:UITableViewAutomaticDimension];
  }
}

- (void)p_updateColors
{
  [self->viewIfLoaded setTintColor:[self->_theme keyColor]];
  objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController navigationController](self, "navigationController"), "navigationBar"), "setTintColor:", -[IMThemePage keyColor](self->_theme, "keyColor"));
  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)setTheme:(id)a3
{
  if ((-[IMThemePage isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {

    self->_theme = (IMThemePage *)a3;
    [(THStudyOptionsPopoverController *)self p_updateColors];
  }
}

- (void)shuffleSwitchChanged:(id)a3
{
  id v4 = [a3 isOn];
  options = self->_options;

  [(THStudyOptions *)options setShuffle:v4];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = [a3 dequeueReusableCellWithIdentifier:@"StudyOptionsTableCell"];
  [v6 setAccessoryView:0];
  objc_opt_class();
  [v6 contentConfiguration];
  double v7 = (UIListContentConfiguration *)TSUDynamicCast();
  if (!v7) {
    double v7 = +[UIListContentConfiguration cellConfiguration];
  }
  unsigned int v8 = [(UIListContentConfiguration *)v7 imageProperties];
  [(UIListContentConfiguration *)v7 setImage:[(THStudyOptionsPopoverController *)self checkImage]];
  [(UIListContentImageProperties *)v8 setTintColor:[(THStudyOptionsPopoverController *)self hiddenColor]];
  if (![a4 section])
  {
    [v6 setSelectionStyle:3];
    id v10 = [a4 row];
    double v11 = (void *)THBundle();
    if (v10)
    {
      -[UIListContentConfiguration setText:](v7, "setText:", [v11 localizedStringForKey:@"Glossary Terms" value:&stru_46D7E8 table:0]);
      [v6 setAccessoryType:0];
      if (![(THStudyOptions *)self->_options showVocabulary]) {
        goto LABEL_9;
      }
    }
    else
    {
      -[UIListContentConfiguration setText:](v7, "setText:", [v11 localizedStringForKey:@"Highlights and Notes" value:&stru_46D7E8 table:0]);
      [v6 setAccessoryType:4];
      if (![(THStudyOptions *)self->_options showAnnotations]) {
        goto LABEL_9;
      }
    }
    [(UIListContentImageProperties *)v8 setTintColor:[(IMThemePage *)[(THStudyOptionsPopoverController *)self theme] primaryTextColor]];
    goto LABEL_9;
  }
  if ([a4 section] == (char *)&dword_0 + 1)
  {
    -[UIListContentConfiguration setText:](v7, "setText:", [(id)THBundle() localizedStringForKey:@"Shuffle" value:&stru_46D7E8 table:0]);
    [v6 setSelectionStyle:0];
    id v9 = [objc_alloc((Class)UISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v9 setOn:[self->_options shuffle]];
    [v9 addTarget:self action:"shuffleSwitchChanged:" forControlEvents:4096];
    [v6 setAccessoryView:v9];
  }
LABEL_9:
  [v6 setContentConfiguration:v7];
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 0.001;
  if (a4 == 1) {
    return 20.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  [(THStudyOptionsPopoverController *)self tableView:a3 heightForHeaderInSection:a4];
  if (v5 <= 0.0) {
    return 0;
  }
  double v6 = v5;
  id v7 = objc_alloc((Class)UIView);
  [self view].frame
  id v8 = [v7 initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v11), v6)];
  id v9 = [(IMThemePage *)self->_theme groupedBackgroundColor];
  [v8 setBackgroundColor:v9];
  [(UITableView *)[(THStudyOptionsPopoverController *)self tableView] setBackgroundColor:v9];
  return v8;
}

- (void)doneButtonPressed:(id)a3
{
  objc_super v3 = [(THStudyOptionsPopoverController *)self delegate];

  [(THStudyOptionsDelegate *)v3 dismissStudyOptionsMenu:1 completion:0];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = [[THHighlightTableViewController alloc] initWithOptions:self->_options];
  [(THHighlightTableViewController *)v8 setOverrideUserInterfaceStyle:[(THStudyOptionsPopoverController *)self overrideUserInterfaceStyle]];
  [(THHighlightTableViewController *)v8 setTheme:[(THStudyOptionsPopoverController *)self theme]];
  if (+[UIFont bc_accessibilityFontSizesEnabled])double v5 = 360.0; {
  else
  }
    double v5 = 320.0;
  if (+[UIFont bc_accessibilityFontSizesEnabled])double v6 = 400.0; {
  else
  }
    double v6 = 146.0;
  objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](self, "presentingViewController"), "presentedViewController"), "setPreferredContentSize:", v5, v6);
  [self.navigationController pushViewController:v8 animated:1];
  if (objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](self, "presentingViewController"), "presentedViewController")&& (objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](self, "presentingViewController"), "presentedViewController"), "_isInPopoverPresentation") & 1) == 0)
  {
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
    [v8 navigationItem].setRightBarButtonItem:v7, 0);
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  if (!objc_msgSend(a4, "section", a3))
  {
    id v6 = [a4 row];
    options = self->_options;
    if (v6) {
      [(THStudyOptions *)self->_options setShowVocabulary:[(THStudyOptions *)options showVocabulary] ^ 1];
    }
    else {
      [(THStudyOptions *)self->_options setShowAnnotations:[(THStudyOptions *)options showAnnotations] ^ 1];
    }
  }
  return a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [a3 deselectRowAtIndexPath:a4 animated:1];
  if (![a4 section])
  {
    [a3 reloadData];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  if (a4 == self)
  {
    if (+[UIFont bc_accessibilityFontSizesEnabled])double v7 = 360.0; {
    else
    }
      double v7 = 320.0;
    if (+[UIFont bc_accessibilityFontSizesEnabled])double v8 = 400.0; {
    else
    }
      double v8 = 146.0;
    id v9 = objc_msgSend(objc_msgSend(a4, "presentingViewController"), "presentedViewController");
    [v9 setPreferredContentSize:v7, v8];
  }
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (THStudyOptionsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THStudyOptionsDelegate *)a3;
}

- (IMThemePage)theme
{
  return self->_theme;
}

- (void)setCheckImage:(id)a3
{
}

@end