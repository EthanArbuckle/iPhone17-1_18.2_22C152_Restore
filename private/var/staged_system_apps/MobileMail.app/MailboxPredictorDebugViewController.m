@interface MailboxPredictorDebugViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (MailboxPredictorDebugViewController)initWithAlgoritm:(id)a3 result:(id)a4 output:(id)a5 dismiss:(id)a6;
- (NSString)algorithm;
- (NSString)output;
- (NSString)result;
- (UITextView)outputTextView;
- (id)dismissBlock;
- (void)_dismiss;
- (void)selectAll:(id)a3;
- (void)setAlgorithm:(id)a3;
- (void)setDismissBlock:(id)a3;
- (void)setOutput:(id)a3;
- (void)setOutputTextView:(id)a3;
- (void)setResult:(id)a3;
- (void)viewDidLoad;
@end

@implementation MailboxPredictorDebugViewController

- (MailboxPredictorDebugViewController)initWithAlgoritm:(id)a3 result:(id)a4 output:(id)a5 dismiss:(id)a6
{
  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MailboxPredictorDebugViewController;
  v14 = [(MailboxPredictorDebugViewController *)&v20 init];
  v15 = v14;
  if (v14)
  {
    if (v10) {
      CFStringRef v16 = v10;
    }
    else {
      CFStringRef v16 = @"nil";
    }
    [(MailboxPredictorDebugViewController *)v14 setAlgorithm:v16];
    if (v11) {
      CFStringRef v17 = v11;
    }
    else {
      CFStringRef v17 = @"nil";
    }
    [(MailboxPredictorDebugViewController *)v15 setResult:v17];
    if (v12) {
      CFStringRef v18 = v12;
    }
    else {
      CFStringRef v18 = @"No output";
    }
    [(MailboxPredictorDebugViewController *)v15 setOutput:v18];
    [(MailboxPredictorDebugViewController *)v15 setDismissBlock:v13];
  }

  return v15;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)MailboxPredictorDebugViewController;
  [(MailboxPredictorDebugViewController *)&v23 viewDidLoad];
  [(MailboxPredictorDebugViewController *)self setTitle:@"Mailbox Prediction Debug"];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Dismiss" style:2 target:self action:"_dismiss"];
  v4 = [(MailboxPredictorDebugViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = objc_alloc_init((Class)UILabel);
  v6 = +[UIFont boldSystemFontOfSize:20.0];
  [v5 setFont:v6];

  v7 = [(MailboxPredictorDebugViewController *)self result];
  v8 = +[NSString stringWithFormat:@"Prediction: %@", v7];
  [v5 setText:v8];

  id v9 = objc_alloc_init((Class)UILabel);
  v10 = +[UIFont boldSystemFontOfSize:14.0];
  [v9 setFont:v10];

  v11 = [(MailboxPredictorDebugViewController *)self algorithm];
  v12 = +[NSString stringWithFormat:@"Model: %@", v11];
  [v9 setText:v12];

  id v13 = objc_alloc_init((Class)UITextView);
  v14 = +[UIFont systemFontOfSize:14.0];
  [v13 setFont:v14];

  v15 = [(MailboxPredictorDebugViewController *)self output];
  [v13 setText:v15];

  [v13 setEditable:0];
  id v16 = objc_alloc((Class)UIStackView);
  v24[0] = v5;
  v24[1] = v9;
  v24[2] = v13;
  CFStringRef v17 = +[NSArray arrayWithObjects:v24 count:3];
  id v18 = [v16 initWithArrangedSubviews:v17];

  [v18 setAxis:1];
  [v18 setAutoresizingMask:18];
  [v18 setLayoutMarginsRelativeArrangement:1];
  [v18 setLayoutMargins:8.0, 8.0, 8.0, 8.0];
  [v18 setSpacing:8.0];
  [(MailboxPredictorDebugViewController *)self setOutputTextView:v13];
  id v19 = objc_alloc_init((Class)UIView);
  [(MailboxPredictorDebugViewController *)self setView:v19];

  objc_super v20 = +[UIColor whiteColor];
  v21 = [(MailboxPredictorDebugViewController *)self view];
  [v21 setBackgroundColor:v20];

  v22 = [(MailboxPredictorDebugViewController *)self view];
  [v22 addSubview:v18];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ("selectAll:" != a3) {
    return 0;
  }
  v6 = [(MailboxPredictorDebugViewController *)self outputTextView];
  if ([v6 selectedRange])
  {
    BOOL v4 = 1;
  }
  else
  {
    v7 = [(MailboxPredictorDebugViewController *)self outputTextView];
    [v7 selectedRange];
    id v9 = v8;
    v10 = [(MailboxPredictorDebugViewController *)self outputTextView];
    v11 = [v10 text];
    BOOL v4 = v9 != [v11 length];
  }
  return v4;
}

- (void)selectAll:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MailboxPredictorDebugViewController *)self outputTextView];
  [v4 selectAll:v5];
}

- (void)_dismiss
{
  id v3 = [(MailboxPredictorDebugViewController *)self dismissBlock];

  if (v3)
  {
    BOOL v4 = [(MailboxPredictorDebugViewController *)self dismissBlock];
    v4[2]();
  }
}

- (NSString)algorithm
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAlgorithm:(id)a3
{
}

- (NSString)result
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResult:(id)a3
{
}

- (NSString)output
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutput:(id)a3
{
}

- (id)dismissBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDismissBlock:(id)a3
{
}

- (UITextView)outputTextView
{
  return (UITextView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOutputTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTextView, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end