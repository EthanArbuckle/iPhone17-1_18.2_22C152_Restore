@interface TPSViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)loading;
- (NSString)defaultErrorTitleText;
- (NSUUID)networkMonitorToken;
- (TPSKVOManager)KVOManager;
- (TPSViewController)init;
- (TPSViewController)initWithCoder:(id)a3;
- (TPSViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UILabel)messageLabel;
- (void)commonInit;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)removeInlineMessageLabel;
- (void)setDefaultErrorTitleText:(id)a3;
- (void)setKVOManager:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setMessageLabel:(id)a3;
- (void)setNetworkMonitorToken:(id)a3;
- (void)showInlineGenericErrorMessage;
- (void)showInlineLabelWithTitle:(id)a3 message:(id)a4;
- (void)showInlineMessageForError:(id)a3;
- (void)showInlineNoConnectionMessage;
- (void)viewDidLoad;
@end

@implementation TPSViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)TPSViewController;
  [(TPSViewController *)&v6 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

  v4 = +[TPSAppearance defaultBackgroundColor];
  v5 = [(TPSViewController *)self view];
  [v5 setBackgroundColor:v4];
}

- (TPSViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TPSViewController;
  v4 = [(TPSViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(TPSViewController *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  objc_initWeak(&location, self);
  v3 = (NSUUID *)objc_opt_new();
  networkMonitorToken = self->_networkMonitorToken;
  self->_networkMonitorToken = v3;

  v5 = +[TPSNetworkPathMonitor sharedMonitor];
  objc_super v6 = self->_networkMonitorToken;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025FF4;
  v7[3] = &unk_1000B75F8;
  objc_copyWeak(&v8, &location);
  [v5 addObserverForKey:v6 using:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)removeInlineMessageLabel
{
  [(UILabel *)self->_messageLabel removeFromSuperview];
  messageLabel = self->_messageLabel;
  self->_messageLabel = 0;

  messageLabelTitle = self->_messageLabelTitle;
  self->_messageLabelTitle = 0;

  messageLabelDetailText = self->_messageLabelDetailText;
  self->_messageLabelDetailText = 0;
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    loadingView = self->_loadingView;
    if (a3)
    {
      if (!loadingView)
      {
        v5 = [(TPSViewController *)self view];
        objc_super v6 = (TPSLoadingView *)objc_alloc_init((Class)TPSLoadingView);
        objc_super v7 = self->_loadingView;
        self->_loadingView = v6;

        [(TPSLoadingView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
        [v5 addSubview:self->_loadingView];
        id v8 = [(TPSLoadingView *)self->_loadingView topAnchor];
        v9 = [v5 topAnchor];
        v10 = [v8 constraintEqualToAnchor:v9];
        [v10 setActive:1];

        v11 = [(TPSLoadingView *)self->_loadingView bottomAnchor];
        v12 = [v5 bottomAnchor];
        v13 = [v11 constraintEqualToAnchor:v12];
        [v13 setActive:1];

        v14 = [(TPSLoadingView *)self->_loadingView leadingAnchor];
        v15 = [v5 leadingAnchor];
        v16 = [v14 constraintEqualToAnchor:v15];
        [v16 setActive:1];

        v17 = [(TPSLoadingView *)self->_loadingView trailingAnchor];
        v18 = [v5 trailingAnchor];
        v19 = [v17 constraintEqualToAnchor:v18];
        [v19 setActive:1];
      }
      [(TPSViewController *)self removeInlineMessageLabel];
    }
    else
    {
      [(TPSLoadingView *)loadingView removeFromSuperview];
      v20 = self->_loadingView;
      self->_loadingView = 0;
    }
  }
}

- (TPSViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSViewController;
  v2 = [(TPSViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TPSViewController *)v2 commonInit];
  }
  return v3;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:self];

  v4 = +[TPSNetworkPathMonitor sharedMonitor];
  objc_super v5 = [(TPSViewController *)self networkMonitorToken];
  [v4 removeObserverForKey:v5];

  v6.receiver = self;
  v6.super_class = (Class)TPSViewController;
  [(TPSViewController *)&v6 dealloc];
}

- (TPSViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSViewController;
  v3 = [(TPSViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(TPSViewController *)v3 commonInit];
  }
  return v4;
}

- (TPSKVOManager)KVOManager
{
  KVOManager = self->_KVOManager;
  if (!KVOManager)
  {
    v4 = (TPSKVOManager *)[objc_alloc((Class)TPSKVOManager) initWithObserver:self];
    objc_super v5 = self->_KVOManager;
    self->_KVOManager = v4;

    KVOManager = self->_KVOManager;
  }

  return KVOManager;
}

- (void)contentSizeCategoryDidChange
{
  if (*(_OWORD *)&self->_messageLabelTitle != 0) {
    -[TPSViewController showInlineLabelWithTitle:message:](self, "showInlineLabelWithTitle:message:");
  }
}

- (void)showInlineMessageForError:(id)a3
{
  if (+[TPSNetworkPathMonitor isNetworkError:a3])
  {
    [(TPSViewController *)self showInlineNoConnectionMessage];
  }
  else
  {
    [(TPSViewController *)self showInlineGenericErrorMessage];
  }
}

- (void)showInlineGenericErrorMessage
{
  v3 = [(TPSViewController *)self defaultErrorTitleText];
  v4 = v3;
  if (v3)
  {
    id v8 = v3;
  }
  else
  {
    objc_super v5 = +[NSBundle mainBundle];
    id v8 = [v5 localizedStringForKey:@"LOAD_ERROR_UNKNOWN_TITLE" value:&stru_1000B98B0 table:0];
  }
  objc_super v6 = +[NSBundle mainBundle];
  objc_super v7 = [v6 localizedStringForKey:@"LOAD_ERROR_MESSAGE" value:&stru_1000B98B0 table:0];

  [(TPSViewController *)self showInlineLabelWithTitle:v8 message:v7];
}

- (void)showInlineNoConnectionMessage
{
  v3 = +[NSBundle mainBundle];
  id v6 = [v3 localizedStringForKey:@"LOAD_ERROR_NETWORK_TITLE" value:&stru_1000B98B0 table:0];

  v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"LOAD_ERROR_MESSAGE" value:&stru_1000B98B0 table:0];

  [(TPSViewController *)self showInlineLabelWithTitle:v6 message:v5];
}

- (void)showInlineLabelWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_messageLabelTitle, a3);
  objc_storeStrong((id *)&self->_messageLabelDetailText, a4);
  [(TPSViewController *)self setLoading:0];
  id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_1000B98B0];
  v10 = &_ss11_StringGutsV4growyySiF_ptr;
  if (v7)
  {
    v11 = +[UIDevice currentDevice];
    id v12 = [v11 userInterfaceIdiom];

    v13 = &UIFontTextStyleTitle1;
    if (!v12) {
      v13 = &UIFontTextStyleTitle3;
    }
    v14 = +[TPSAppearance preferredFontForTextStyle:*v13];
    CFStringRef v15 = @"\n";
    if (!v8) {
      CFStringRef v15 = &stru_1000B98B0;
    }
    v16 = +[NSString stringWithFormat:@"%@%@", v7, v15];
    id v17 = objc_alloc((Class)NSAttributedString);
    v48[0] = v14;
    v47[0] = NSFontAttributeName;
    v47[1] = NSForegroundColorAttributeName;
    +[UIColor systemGrayColor];
    v19 = id v18 = v7;
    v48[1] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
    id v21 = [v17 initWithString:v16 attributes:v20];

    id v7 = v18;
    [v9 appendAttributedString:v21];

    v10 = &_ss11_StringGutsV4growyySiF_ptr;
  }
  if (v8)
  {
    v45[0] = NSFontAttributeName;
    v22 = [v10[481] bodyFont];
    v45[1] = NSForegroundColorAttributeName;
    v46[0] = v22;
    v23 = +[UIColor colorWithWhite:0.57254902 alpha:1.0];
    v46[1] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];

    id v25 = [objc_alloc((Class)NSAttributedString) initWithString:v8 attributes:v24];
    [v9 appendAttributedString:v25];
  }
  if ([v9 length])
  {
    id v26 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v26 setParagraphSpacing:8.0];
    [v26 setLineBreakMode:0];
    [v26 setAlignment:1];
    [v9 addAttribute:NSParagraphStyleAttributeName value:v26 range:0, [v9 length]];
    messageLabel = self->_messageLabel;
    if (!messageLabel)
    {
      v28 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      v29 = self->_messageLabel;
      self->_messageLabel = v28;

      [(UILabel *)self->_messageLabel setNumberOfLines:0];
      [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v30 = [(TPSViewController *)self view];
      [v30 addSubview:self->_messageLabel];

      v31 = [(TPSViewController *)self view];
      [v31 bringSubviewToFront:self->_messageLabel];

      v32 = [(UILabel *)self->_messageLabel leadingAnchor];
      v33 = [(TPSViewController *)self view];
      [v33 leadingAnchor];
      v35 = id v34 = v7;
      v36 = [v32 constraintEqualToAnchor:v35 constant:20.0];
      [v36 setActive:1];

      v37 = [(UILabel *)self->_messageLabel trailingAnchor];
      v38 = [(TPSViewController *)self view];
      v39 = [v38 trailingAnchor];
      v40 = [v37 constraintEqualToAnchor:v39 constant:-20.0];
      [v40 setActive:1];

      v41 = [(UILabel *)self->_messageLabel centerYAnchor];
      v42 = [(TPSViewController *)self view];
      v43 = [v42 centerYAnchor];
      v44 = [v41 constraintEqualToAnchor:v43];
      [v44 setActive:1];

      id v7 = v34;
      messageLabel = self->_messageLabel;
    }
    [(UILabel *)messageLabel setAttributedText:v9];
  }
  else
  {
    [(TPSViewController *)self removeInlineMessageLabel];
  }
}

- (BOOL)loading
{
  return self->_loading;
}

- (NSString)defaultErrorTitleText
{
  return self->_defaultErrorTitleText;
}

- (void)setDefaultErrorTitleText:(id)a3
{
}

- (void)setKVOManager:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (NSUUID)networkMonitorToken
{
  return self->_networkMonitorToken;
}

- (void)setNetworkMonitorToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorToken, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_defaultErrorTitleText, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_messageLabelDetailText, 0);

  objc_storeStrong((id *)&self->_messageLabelTitle, 0);
}

@end