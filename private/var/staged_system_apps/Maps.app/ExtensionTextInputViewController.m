@interface ExtensionTextInputViewController
- (ExtensionTextInputViewController)initWithTitle:(id)a3 placeholderText:(id)a4 text:(id)a5;
- (ExtensionTextInputViewControllerDelegate)inputDelegate;
- (NSString)initializedText;
- (NSString)placeholderText;
- (NSString)text;
- (NSString)titleText;
- (UITextView)textView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureTableView;
- (void)configureTextView;
- (void)doneButtonTapped:(id)a3;
- (void)setInitializedText:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ExtensionTextInputViewController

- (ExtensionTextInputViewController)initWithTitle:(id)a3 placeholderText:(id)a4 text:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ExtensionTextInputViewController;
  v11 = [(ExtensionTextInputViewController *)&v18 initWithStyle:1];
  v12 = v11;
  if (v11)
  {
    [(ExtensionTextInputViewController *)v11 setTitle:v8];
    v13 = (NSString *)[v9 copy];
    placeholderText = v12->_placeholderText;
    v12->_placeholderText = v13;

    v15 = (NSString *)[v10 copy];
    initializedText = v12->_initializedText;
    v12->_initializedText = v15;
  }
  return v12;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ExtensionTextInputViewController;
  [(ExtensionTextInputViewController *)&v3 viewDidLoad];
  [(ExtensionTextInputViewController *)self configureTableView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ExtensionTextInputViewController;
  [(ExtensionTextInputViewController *)&v5 viewDidAppear:a3];
  v4 = [(ExtensionTextInputViewController *)self textView];
  [v4 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ExtensionTextInputViewController;
  [(ExtensionTextInputViewController *)&v5 viewWillDisappear:a3];
  v4 = [(ExtensionTextInputViewController *)self inputDelegate];
  [v4 extensionTextInputViewControllerDidComplete:self];
}

- (void)configureTableView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v4 = [(ExtensionTextInputViewController *)self tableView];
  [v4 setTableFooterView:v3];

  objc_super v5 = [(ExtensionTextInputViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v5 registerClass:v6 forCellReuseIdentifier:v8];

  id v9 = [(ExtensionTextInputViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];

  id v10 = [(ExtensionTextInputViewController *)self tableView];
  [v10 setScrollEnabled:0];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 120.0;
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
  id v5 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = [v5 dequeueReusableCellWithIdentifier:v7];

  id v9 = [v8 textView];
  [(ExtensionTextInputViewController *)self setTextView:v9];

  [(ExtensionTextInputViewController *)self configureTextView];

  return v8;
}

- (void)configureTextView
{
  id v3 = +[UIColor clearColor];
  v4 = [(ExtensionTextInputViewController *)self textView];
  [v4 setBackgroundColor:v3];

  id v5 = +[UIFont systemFontOfSize:15.0];
  uint64_t v6 = [(ExtensionTextInputViewController *)self textView];
  [v6 setFont:v5];

  id v7 = objc_alloc((Class)NSAttributedString);
  id v8 = [(ExtensionTextInputViewController *)self placeholderText];
  id v9 = [v7 initWithString:v8];
  id v10 = [(ExtensionTextInputViewController *)self textView];
  [v10 setAttributedPlaceholder:v9];

  v11 = [(ExtensionTextInputViewController *)self textView];
  v12 = [v11 text];
  if (![v12 length])
  {
    v13 = [(ExtensionTextInputViewController *)self initializedText];
    id v14 = [v13 length];

    if (!v14) {
      goto LABEL_5;
    }
    v11 = [(ExtensionTextInputViewController *)self initializedText];
    v12 = [(ExtensionTextInputViewController *)self textView];
    [v12 setText:v11];
  }

LABEL_5:
  id v16 = [(ExtensionTextInputViewController *)self textView];
  v15 = [v16 textContainer];
  [v15 setLineFragmentPadding:0.0];
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = [(ExtensionTextInputViewController *)self inputDelegate];
  [v4 extensionTextInputViewControllerDidComplete:self];
}

- (NSString)text
{
  v2 = [(ExtensionTextInputViewController *)self textView];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (ExtensionTextInputViewControllerDelegate)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);

  return (ExtensionTextInputViewControllerDelegate *)WeakRetained;
}

- (void)setInputDelegate:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (NSString)initializedText
{
  return self->_initializedText;
}

- (void)setInitializedText:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_initializedText, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_destroyWeak((id *)&self->_inputDelegate);
}

@end