@interface TSWPHyperlinkSettingsViewController
- (TSWPHyperlinkField)hyperlink;
- (TSWPHyperlinkSettingsViewController)initWithHyperlink:(id)a3 readOnly:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)keyboardDidHideOrUndock:(id)a3;
- (void)keyboardDidShowOrDock:(id)a3;
- (void)loadView;
- (void)setHyperlink:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TSWPHyperlinkSettingsViewController

- (TSWPHyperlinkSettingsViewController)initWithHyperlink:(id)a3 readOnly:(BOOL)a4
{
  v6 = [(TSWPHyperlinkSettingsViewController *)self initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v6->_readOnly = a4;
    [(TSWPHyperlinkSettingsViewController *)v6 setHyperlink:a3];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkSettingsViewController;
  [(TSWPHyperlinkSettingsViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = +[TSWPHyperlinkUIController defaultTableView];
  [v3 setDataSource:self];
  [v3 setDelegate:self];
  [(TSWPHyperlinkSettingsViewController *)self setView:v3];
  objc_msgSend((id)-[TSWPHyperlinkSettingsViewController navigationItem](self, "navigationItem"), "setTitle:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Link Settings", &stru_26D688A48, @"TSText"));
  [(TSWPHyperlinkSettingsViewController *)self setEdgesForExtendedLayout:0];
  +[TSKPopoverBasedViewController preferredContentSizeForTableView:v3];

  -[TSWPHyperlinkSettingsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
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
  id v7 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];
  BOOL v8 = [(NSString *)[(NSURL *)[(TSWPHyperlinkField *)[(TSWPHyperlinkSettingsViewController *)self hyperlink] url] scheme] isEqualToString:@"mailto"];
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"cell%ld.%ld", objc_msgSend(a4, "section"), objc_msgSend(a4, "row"));
  v10 = (TSWPTextFieldTableViewCell *)[a3 dequeueReusableCellWithIdentifier:v9];
  if (!v10)
  {
    if ([a4 section])
    {
      v10 = (TSWPTextFieldTableViewCell *)(id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:0];
      objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setText:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Remove Link", &stru_26D688A48, @"TSText"));
      objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setTextAlignment:", 1);
      uint64_t v11 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
      v12 = (UITextField *)[(TSWPTextFieldTableViewCell *)v10 textLabel];
LABEL_4:
      [(UITextField *)v12 setTextColor:v11];
      goto LABEL_5;
    }
    v10 = [[TSWPTextFieldTableViewCell alloc] initWithStyle:1 reuseIdentifier:v9];
    v14 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel_textFieldDidChange_, *MEMORY[0x263F1D778], -[TSWPTextFieldTableViewCell textField](v10, "textField"));
    -[UITextField setTag:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setTag:", [a4 row]);
    if ([a4 row])
    {
      if ([a4 row] == 1)
      {
        objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setText:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Display", &stru_26D688A48, @"TSText"));
        -[UITextField setText:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setText:", [v7 stringForDisplay]);
        [(TSWPTextFieldTableViewCell *)v10 setSelectionStyle:0];
        if (self->_readOnly)
        {
          [(UITextField *)[(TSWPTextFieldTableViewCell *)v10 textField] setEnabled:0];
          uint64_t v11 = [MEMORY[0x263F1C550] colorWithRed:0.219999999 green:0.330000013 blue:0.529999971 alpha:0.5];
          v12 = [(TSWPTextFieldTableViewCell *)v10 textField];
          goto LABEL_4;
        }
      }
    }
    else
    {
      v15 = (void *)TSWPBundle();
      if (v8) {
        v16 = @"To";
      }
      else {
        v16 = @"Link";
      }
      if (v8) {
        uint64_t v17 = 7;
      }
      else {
        uint64_t v17 = 3;
      }
      objc_msgSend((id)-[TSWPTextFieldTableViewCell textLabel](v10, "textLabel"), "setText:", objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_26D688A48, @"TSText"));
      [(UITextField *)[(TSWPTextFieldTableViewCell *)v10 textField] setKeyboardType:v17];
      objc_opt_class();
      objc_msgSend((id)objc_msgSend(v7, "interactiveCanvasController"), "layerHost");
      v18 = (void *)TSUDynamicCast();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (uint64_t v19 = objc_msgSend(v18, "performSelector:withObject:", sel_hyperlinkUICustomStringForURLString_, objc_msgSend(v7, "stringForURL"))) != 0)
      {
        [(UITextField *)[(TSWPTextFieldTableViewCell *)v10 textField] setText:v19];
        [(UITextField *)[(TSWPTextFieldTableViewCell *)v10 textField] setEnabled:0];
        -[UITextField setTextColor:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setTextColor:", [MEMORY[0x263F1C550] colorWithRed:0.219999999 green:0.330000013 blue:0.529999971 alpha:0.5]);
      }
      else
      {
        -[UITextField setText:](-[TSWPTextFieldTableViewCell textField](v10, "textField"), "setText:", objc_msgSend((id)objc_msgSend(v7, "stringForURL"), "stringByRemovingPercentEncoding"));
      }
      [(UITextField *)[(TSWPTextFieldTableViewCell *)v10 textField] setAutocorrectionType:1];
      [(TSWPTextFieldTableViewCell *)v10 setSelectionStyle:0];
    }
  }
LABEL_5:
  +[TSKPopoverBasedViewController configureTableViewCell:v10];
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];
  v6.receiver = self;
  v6.super_class = (Class)TSWPHyperlinkSettingsViewController;
  [(TSWPHyperlinkSettingsViewController *)&v6 viewWillAppear:v3];
  if ([v5 editingController])
  {
    [v5 hideHyperlinkHighlight];
    objc_msgSend(v5, "p_selectHyperlinkField");
  }
  if (TSUPhoneUI()) {
    +[TSKKeyboardMonitor addKeyboardObserver:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPHyperlinkSettingsViewController;
  [(TSWPHyperlinkSettingsViewController *)&v4 viewWillDisappear:a3];
  if (TSUPhoneUI()) {
    +[TSKKeyboardMonitor removeKeyboardObserver:self];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "delegate");
  uint64_t v4 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v5 = objc_msgSend((id)-[TSWPHyperlinkSettingsViewController view](self, "view"), "window");

  return [v3 application:v4 supportedInterfaceOrientationsForWindow:v5];
}

- (void)keyboardDidShowOrDock:(id)a3
{
  uint64_t v4 = (void *)[(TSWPHyperlinkSettingsViewController *)self view];
  objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "keyboardFrame");
  if (v5 >= v6) {
    double v5 = v6;
  }
  objc_msgSend(v4, "setContentInset:", 0.0, 0.0, v5, 0.0);
  uint64_t v7 = [v4 indexPathForCell:self->_editingCell];

  [v4 scrollToRowAtIndexPath:v7 atScrollPosition:0 animated:1];
}

- (void)keyboardDidHideOrUndock:(id)a3
{
  BOOL v3 = (void *)[(TSWPHyperlinkSettingsViewController *)self view];
  double v4 = *MEMORY[0x263F1D1C0];
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v7 = *(double *)(MEMORY[0x263F1D1C0] + 24);

  objc_msgSend(v3, "setContentInset:", v4, v5, v6, v7);
}

- (TSWPHyperlinkField)hyperlink
{
  return self->_hyperlink;
}

- (void)setHyperlink:(id)a3
{
}

@end