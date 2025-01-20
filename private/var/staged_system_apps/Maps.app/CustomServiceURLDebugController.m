@interface CustomServiceURLDebugController
- ($6E15C01CA1BE37A4936191A84F7075E2)defaultsKey;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CustomServiceURLDebugController)initWithStyle:(int64_t)a3;
- (NSString)defaultURLString;
- (id)callback;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)title;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)setCallback:(id)a3;
- (void)setDefaultURLString:(id)a3;
- (void)setDefaultsKey:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CustomServiceURLDebugController

- (id)title
{
  return @"Custom URL";
}

- (CustomServiceURLDebugController)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CustomServiceURLDebugController;
  v3 = [(CustomServiceURLDebugController *)&v9 initWithStyle:a3];
  if (v3)
  {
    v4 = (UITextField *)objc_alloc_init((Class)UITextField);
    textField = v3->_textField;
    v3->_textField = v4;

    [(UITextField *)v3->_textField setAutoresizingMask:18];
    v6 = +[UIColor clearColor];
    [(UITextField *)v3->_textField setBackgroundColor:v6];

    [(UITextField *)v3->_textField setAutocorrectionType:1];
    [(UITextField *)v3->_textField setAutocapitalizationType:0];
    [(UITextField *)v3->_textField setKeyboardType:3];
    [(UITextField *)v3->_textField setReturnKeyType:9];
    [(UITextField *)v3->_textField setClearButtonMode:3];
    [(UITextField *)v3->_textField setDelegate:v3];
    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(UITextField *)self->_textField setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CustomServiceURLDebugController;
  [(CustomServiceURLDebugController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITextField *)self->_textField becomeFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)CustomServiceURLDebugController;
  [(CustomServiceURLDebugController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  UIKeyboardForceOrderOutAutomaticAnimated();
  v5.receiver = self;
  v5.super_class = (Class)CustomServiceURLDebugController;
  [(CustomServiceURLDebugController *)&v5 viewWillDisappear:v3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
  [v5 setAccessoryType:0];
  [v5 setSelectionStyle:0];
  v6 = self->_defaultURLString;
  if (_GEOConfigHasValue())
  {
    uint64_t v7 = GEOConfigGetString();

    v6 = (NSString *)v7;
  }
  [(UITextField *)self->_textField setText:v6];
  [(UITextField *)self->_textField sizeToFit];
  [(UITextField *)self->_textField frame];
  double v9 = v8;
  v10 = [v5 contentView];
  [v10 bounds];
  double v12 = v11 + -12.0;

  v13 = [v5 contentView];
  [v13 bounds];
  double v15 = (v14 - v12) * 0.5;

  v16 = [v5 contentView];
  [v16 bounds];
  double v18 = (v17 - v9) * 0.5;

  -[UITextField setFrame:](self->_textField, "setFrame:", v15, v18, v12, v9);
  v19 = [v5 contentView];
  [v19 addSubview:self->_textField];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v6 = [(UITextField *)self->_textField text];
  if ([v6 length])
  {
    if (v6)
    {
      GEOConfigSetString();
      goto LABEL_6;
    }
  }
  else
  {
  }
  _GEOConfigRemoveValue();
  id v6 = 0;
LABEL_6:
  callback = (void (**)(id, id, void))self->_callback;
  if (callback) {
    callback[2](callback, v6, 0);
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:GEOCountryConfigurationProvidersDidChangeNotification object:self userInfo:0];

  [(UITextField *)self->_textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  BOOL v3 = [(CustomServiceURLDebugController *)self navigationController];
  id v4 = [v3 popViewControllerAnimated:1];

  return 1;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)defaultsKey
{
  p_defaultsKey = &self->_defaultsKey;
  uint64_t v3 = *(void *)&self->_defaultsKey.key.identifier;
  metadata = p_defaultsKey->key.metadata;
  result.var0.var1 = metadata;
  *(void *)&result.var0.var0 = v3;
  return result;
}

- (void)setDefaultsKey:(id)a3
{
  self->_defaultsKey = ($33DE67F1CDB11BCA61FBB15085D733CE)a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSString)defaultURLString
{
  return self->_defaultURLString;
}

- (void)setDefaultURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_defaultURLString, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end