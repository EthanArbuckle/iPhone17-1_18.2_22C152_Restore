@interface TSWPHyperlinkActionsViewController
- (TSWPHyperlinkActionsViewController)initWithHyperlink:(id)a3 readOnly:(BOOL)a4;
- (TSWPHyperlinkField)hyperlink;
- (id)hyperlinkSettingsViewController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)loadView;
- (void)setHyperlink:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSWPHyperlinkActionsViewController

- (TSWPHyperlinkActionsViewController)initWithHyperlink:(id)a3 readOnly:(BOOL)a4
{
  v6 = [(TSWPHyperlinkActionsViewController *)self initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v6->_readOnly = a4;
    [(TSWPHyperlinkActionsViewController *)v6 setHyperlink:a3];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkActionsViewController;
  [(TSWPHyperlinkActionsViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = +[TSWPHyperlinkUIController defaultTableView];
  [v3 setDataSource:self];
  [v3 setDelegate:self];
  [(TSWPHyperlinkActionsViewController *)self setView:v3];
  [(TSWPHyperlinkActionsViewController *)self setEdgesForExtendedLayout:0];
  +[TSKPopoverBasedViewController preferredContentSizeForTableView:v3];

  -[TSWPHyperlinkActionsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TSWPHyperlinkActionsViewController;
  -[TSWPHyperlinkActionsViewController viewWillAppear:](&v18, sel_viewWillAppear_);
  objc_opt_class();
  objc_msgSend((id)objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "interactiveCanvasController"), "layerHost");
  v5 = (void *)TSUDynamicCast();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (uint64_t v6 = objc_msgSend(v5, "performSelector:withObject:", sel_hyperlinkUICustomStringForURLString_, objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "stringForURL"))) == 0)
  {
    uint64_t v6 = objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "stringForURL");
  }
  objc_msgSend((id)-[TSWPHyperlinkActionsViewController view](self, "view"), "frame");
  double v8 = v7;
  if (objc_msgSend((id)-[TSWPHyperlinkActionsViewController navigationItem](self, "navigationItem"), "titleView"))
  {
    objc_msgSend((id)objc_msgSend((id)-[TSWPHyperlinkActionsViewController navigationItem](self, "navigationItem"), "titleView"), "frame");
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v14 = v8 + -20.0;
    double v10 = 0.0;
    double v16 = 35.0;
    double v12 = 0.0;
  }
  objc_msgSend((id)-[TSWPHyperlinkActionsViewController navigationItem](self, "navigationItem"), "setTitleView:", -[TSWPHyperlinkPopoverTitleView initWithFrame:titleString:]([TSWPHyperlinkPopoverTitleView alloc], "initWithFrame:titleString:", v6, v10, v12, v14, v16));
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "p_clearTextSelection");
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "showHyperlinkHighlight");
  v17.receiver = self;
  v17.super_class = (Class)TSWPHyperlinkActionsViewController;
  [(TSWPHyperlinkActionsViewController *)&v17 viewWillAppear:v3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_readOnly) {
    return 1;
  }
  else {
    return 2;
  }
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
  BOOL v5 = [(NSString *)[(NSURL *)[(TSWPHyperlinkField *)[(TSWPHyperlinkActionsViewController *)self hyperlink] url] scheme] isEqualToString:@"mailto"];
  uint64_t v6 = [a4 section];
  uint64_t v7 = [a4 row];
  id v8 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:0];
  if (!(v6 | v7))
  {
    double v9 = (void *)TSWPBundle();
    if (v5) {
      double v10 = @"New Message";
    }
    else {
      double v10 = @"Open";
    }
    goto LABEL_8;
  }
  if (!v6 && v7 == 1)
  {
    double v9 = (void *)TSWPBundle();
    double v10 = @"Copy";
LABEL_8:
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_26D688A48, @"TSText"));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setTextAlignment:", 1);
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Link Settings", &stru_26D688A48, @"TSText"));
    [v8 setAccessoryType:1];
  }
LABEL_9:
  +[TSKPopoverBasedViewController configureTableViewCell:v8];
  return v8;
}

- (id)hyperlinkSettingsViewController
{
  id result = self->_hyperlinkSettingsViewController;
  if (!result)
  {
    id result = [[TSWPHyperlinkSettingsViewController alloc] initWithHyperlink:[(TSWPHyperlinkActionsViewController *)self hyperlink] readOnly:self->_readOnly];
    self->_hyperlinkSettingsViewController = (TSWPHyperlinkSettingsViewController *)result;
  }
  return result;
}

- (TSWPHyperlinkField)hyperlink
{
  return self->_hyperlink;
}

- (void)setHyperlink:(id)a3
{
}

@end