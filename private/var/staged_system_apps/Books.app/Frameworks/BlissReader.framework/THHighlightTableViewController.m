@interface THHighlightTableViewController
- (IMThemePage)theme;
- (THHighlightTableViewController)initWithOptions:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)p_updateColors;
- (void)setTheme:(id)a3;
- (void)studyOptionsDidChangeFilterOptions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation THHighlightTableViewController

- (THHighlightTableViewController)initWithOptions:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightTableViewController initWithOptions:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptionsPopoverController.mm") lineNumber:354 description:@"invalid nil value for '%s'", "options"];
  }
  v10.receiver = self;
  v10.super_class = (Class)THHighlightTableViewController;
  v5 = [(THHighlightTableViewController *)&v10 initWithStyle:0];
  if (v5)
  {
    v5->_options = (THStudyOptions *)a3;
    -[THHighlightTableViewController setTitle:](v5, "setTitle:", [(id)THBundle() localizedStringForKey:@"Highlights and Notes" value:&stru_46D7E8 table:0]);
    if (+[UIFont bc_accessibilityFontSizesEnabled])double v6 = 360.0; {
    else
    }
      double v6 = 320.0;
    unsigned int v7 = +[UIFont bc_accessibilityFontSizesEnabled];
    double v8 = 400.0;
    if (!v7) {
      double v8 = 146.0;
    }
    -[THHighlightTableViewController setPreferredContentSize:](v5, "setPreferredContentSize:", v6, v8);
    [(THHighlightTableViewController *)v5 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v5;
}

- (void)dealloc
{
  self->_options = 0;
  self->_theme = 0;
  v3.receiver = self;
  v3.super_class = (Class)THHighlightTableViewController;
  [(THHighlightTableViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THHighlightTableViewController;
  [(THHighlightTableViewController *)&v4 viewWillAppear:a3];
  [(THStudyOptions *)self->_options addObserver:self];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  [(THHighlightTableViewController *)self p_updateColors];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THHighlightTableViewController;
  [(THHighlightTableViewController *)&v4 viewDidDisappear:a3];
  [(THStudyOptions *)self->_options removeObserver:self];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)THHighlightTableViewController;
  [(THHighlightTableViewController *)&v4 viewDidLoad];
  [self tableView].separatorStyle = 1;
  [self tableView].separatorColor = [UIColor colorWithWhite:0.79 alpha:1.0];
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setBackgroundColor:[UIColor clearColor]];
  [self tableView].setTableFooterView:v3;

  [self.tableView setAlwaysBounceHorizontal:0];
  [self tableView].setAlwaysBounceVertical:0;
  [(THHighlightTableViewController *)self contentSizeCategoryDidChange];
}

- (void)contentSizeCategoryDidChange
{
  [self tableView].rowHeight = 42.0;
  [self.tableView setEstimatedRowHeight:42.0];
  if (+[UIFont bc_accessibilityFontSizesEnabled])
  {
    id v3 = [(THHighlightTableViewController *)self tableView];
    [v3 setRowHeight:UITableViewAutomaticDimension];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = [a3 dequeueReusableCellWithIdentifier:@"StudyOptionsHighlightTableCell"];
  if (!v6) {
    id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"StudyOptionsHighlightTableCell"];
  }
  [v6 setBackgroundColor:[self->_theme secondaryGroupedBackgroundColor]];
  if ([a4 row])
  {
    if (qword_573240 != -1) {
      dispatch_once(&qword_573240, &stru_4596B0);
    }
    uint64_t v7 = qword_573238;
    uint64_t v8 = v7 + 16 * (void)[a4 row];
    uint64_t v9 = *(unsigned int *)(v8 - 16);
    uint64_t v10 = *(void *)(v8 - 8);
    if (v9 == 6)
    {
      id v11 = +[BCResources iconTextPopupHighlightUnderline];
      [v11 size];
      TSDCenterRectOverRect();
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      v25.width = 22.0;
      v25.height = 22.0;
      UIGraphicsBeginImageContextWithOptions(v25, 0, 0.0);
      [v11 drawInRect:v13, v15, v17, v19];
      [+[UIColor colorWithWhite:0.850980392 alpha:1.0] setStroke];
      v27.origin.x = 0.0;
      v27.origin.y = 0.0;
      v27.size.width = 22.0;
      v27.size.height = 22.0;
      CGRect v28 = CGRectInset(v27, 1.0, 1.0);
      [+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height, v28.size.width * 0.5) stroke];
    }
    else
    {
      id v22 = [[AEAnnotationTheme themeForAnnotationStyle:pageTheme:4] highlightColor];
      v26.width = 22.0;
      v26.height = 22.0;
      UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
      [v22 setFill];
      [+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 22.0, 22.0, 11.0) fill];
    }
    objc_msgSend(objc_msgSend(v6, "imageView"), "setImage:", UIGraphicsGetImageFromCurrentImageContext());
    UIGraphicsEndImageContext();
    objc_msgSend(objc_msgSend(v6, "textLabel"), "setText:", v10);
    unsigned int v21 = [(THStudyOptions *)self->_options shouldShowAnnotationStyle:v9];
  }
  else
  {
    objc_msgSend(objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"All Highlights and Notes", &stru_46D7E8, 0));
    [v6 setIndentationLevel:0];
    [v6 setIndentationWidth:53.0];
    [v6 indentationWidth];
    [v6 setSeparatorInset:0.0, v20, 0.0, 0.0];
    unsigned int v21 = [(THStudyOptions *)self->_options shouldShowAllAnnotationStyles];
  }
  if (v21) {
    uint64_t v23 = 3;
  }
  else {
    uint64_t v23 = 0;
  }
  [v6 setAccessoryType:v23];
  return v6;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = [a3 cellForRowAtIndexPath:a4];
  if ([a4 row])
  {
    if (qword_573240 != -1) {
      dispatch_once(&qword_573240, &stru_4596B0);
    }
    uint64_t v7 = qword_573238;
    uint64_t v8 = *(unsigned int *)(v7 + 16 * (void)[a4 row] - 16);
    unsigned int v9 = [(THStudyOptions *)self->_options shouldShowAnnotationStyle:v8];
    options = self->_options;
    if (v9) {
      [(THStudyOptions *)options hideAnnotationStyle:v8];
    }
    else {
      [(THStudyOptions *)options showAnnotationStyle:v8];
    }
  }
  else
  {
    id v11 = [v6 accessoryType];
    double v12 = self->_options;
    if (v11) {
      [(THStudyOptions *)v12 hideAllAnnotationStyles];
    }
    else {
      [(THStudyOptions *)v12 showAllAnnotationStyles];
    }
  }
  return a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)studyOptionsDidChangeFilterOptions:(id)a3
{
  id v4 = [(THHighlightTableViewController *)self tableView];
  id v5 = [v4 numberOfRowsInSection:0];
  if ((unint64_t)v5 >= 2)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    for (uint64_t i = 1; (id)i != v6; ++i)
    {
      id v9 = [v4 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
      if (qword_573240 != -1) {
        dispatch_once(&qword_573240, &stru_4596B0);
      }
      if ([(THStudyOptions *)self->_options shouldShowAnnotationStyle:*(unsigned int *)(qword_573238 + v7)])
      {
        uint64_t v10 = 3;
      }
      else
      {
        uint64_t v10 = 0;
      }
      [v9 setAccessoryType:v10];
      v7 += 16;
    }
  }
  id v11 = [v4 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
  if ([(THStudyOptions *)self->_options shouldShowAllAnnotationStyles]) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }

  [v11 setAccessoryType:v12];
}

- (void)p_updateColors
{
  [self->viewIfLoaded setTintColor:[self->_theme keyColor]];
  objc_msgSend(objc_msgSend(-[THHighlightTableViewController navigationController](self, "navigationController"), "navigationBar"), "setTintColor:", -[IMThemePage keyColor](self->_theme, "keyColor"));
  id v3 = [(THHighlightTableViewController *)self tableView];

  [v3 reloadData];
}

- (void)setTheme:(id)a3
{
  if ((-[IMThemePage isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {

    self->_theme = (IMThemePage *)a3;
    [(THHighlightTableViewController *)self p_updateColors];
  }
}

- (IMThemePage)theme
{
  return self->_theme;
}

@end