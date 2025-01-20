@interface MFPreviewViewController
+ (OS_os_log)log;
- (BOOL)displayErrorMessage;
- (BOOL)isRTL;
- (EMDaemonInterface)daemonInterface;
- (MFPreviewViewController)init;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (NSError)error;
- (UIEdgeInsets)minMargins;
- (id)_errorLabel;
- (id)_messageForMessageIdentifier:(id)a3;
- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4;
- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5;
- (void)setDaemonInterface:(id)a3;
- (void)setDisplayErrorMessage:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setMinMargins:(UIEdgeInsets)a3;
- (void)viewDidLoad;
@end

@implementation MFPreviewViewController

+ (OS_os_log)log
{
  if (qword_100043DC8 != -1) {
    dispatch_once(&qword_100043DC8, &stru_1000391A0);
  }
  v2 = (void *)qword_100043DC0;

  return (OS_os_log *)v2;
}

- (MFPreviewViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)MFPreviewViewController;
  v2 = [(MFPreviewViewController *)&v12 init];
  if (v2)
  {
    v3 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    daemonInterface = v2->_daemonInterface;
    v2->_daemonInterface = v3;

    id v5 = objc_alloc_init((Class)MUICachingSVGConverter);
    id v6 = objc_alloc((Class)MUIBrandIndicatorProvider);
    v7 = [(EMDaemonInterface *)v2->_daemonInterface messageRepository];
    v8 = (MUIBrandIndicatorProvider *)[v6 initWithMessageRepository:v7 svgConverter:v5];
    brandIndicatorProvider = v2->_brandIndicatorProvider;
    v2->_brandIndicatorProvider = v8;

    +[MFWKWebViewFactory setDaemonInterface:v2->_daemonInterface URLCacheWithMemoryCapacity:0];
    v10 = [(EMDaemonInterface *)v2->_daemonInterface vipManager];
    +[VIPManager setBackingManager:v10];
  }
  return v2;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)MFPreviewViewController;
  [(MFPreviewViewController *)&v13 viewDidLoad];
  [(MFPreviewViewController *)self systemMinimumLayoutMargins];
  v3 = [(MFPreviewViewController *)self view];
  [self setIsRTL:[v3 mf_prefersRightToLeftInterfaceLayout]];

  [(MFPreviewViewController *)self isRTL];
  MFEdgeInsetsFromDirectionalEdgeInsets();
  -[MFPreviewViewController setMinMargins:](self, "setMinMargins:");
  p_minMargins = &self->_minMargins;
  double top = p_minMargins->top;
  if (p_minMargins->top == 0.0
    || (double top = p_minMargins->right, top == 0.0)
    || (double top = p_minMargins->bottom, top == 0.0)
    || (double top = p_minMargins->left, top == 0.0))
  {
    id v6 = +[MFPreviewViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = NSStringFromUIEdgeInsets(*p_minMargins);
      sub_10001EF70(v7, buf, v6);
    }

    __asm { FMOV            V0.2D, #16.0 }
    *(_OWORD *)&p_minMargins->double top = _Q0;
    *(_OWORD *)&p_minMargins->bottom = _Q0;
  }
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [(MFPreviewViewController *)self _messageForMessageIdentifier:v7];
  v10 = +[EFScheduler mainThreadScheduler];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001D0C8;
  v17[3] = &unk_1000391C8;
  objc_copyWeak(&v19, &location);
  id v11 = v8;
  id v18 = v11;
  [v9 onScheduler:v10 addSuccessBlock:v17];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D584;
  v14[3] = &unk_1000391F0;
  id v12 = v11;
  id v16 = v12;
  v14[4] = self;
  id v13 = v7;
  id v15 = v13;
  [v9 onScheduler:v10 addFailureBlock:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (id)_errorLabel
{
  [(MFPreviewViewController *)self minMargins];
  CGFloat v4 = v3;
  id v5 = [(MFPreviewViewController *)self view];
  [v5 frame];
  CGRect v19 = CGRectInset(v18, v4, v4);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;

  id v10 = [objc_alloc((Class)UILabel) initWithFrame:x, y, width, height];
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"MESSAGE_CAUSED_PROBLEM" value:&stru_100039250 table:@"Main"];
  [v10 setText:v12];

  id v13 = +[UIColor labelColor];
  [v10 setTextColor:v13];

  v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v10 setFont:v14];

  [v10 setNumberOfLines:2];
  [v10 setTextAlignment:1];
  [v10 sizeToFit];
  id v15 = [(MFPreviewViewController *)self view];
  [v15 center];
  [v10 setCenter:];

  return v10;
}

- (id)_messageForMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MFPreviewViewController *)self daemonInterface];
  id v6 = [v5 messageRepository];

  id v7 = [v6 messageForSearchableItemIdentifier:v4];

  return v7;
}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  id v7 = a4;
  id v5 = [(MFPreviewViewController *)self daemonInterface];
  id v6 = [v5 messageRepository];
  [v6 noteViewOfRemoteContentLinks:v7];
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (UIEdgeInsets)minMargins
{
  double top = self->_minMargins.top;
  double left = self->_minMargins.left;
  double bottom = self->_minMargins.bottom;
  double right = self->_minMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMinMargins:(UIEdgeInsets)a3
{
  self->_minMargins = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)displayErrorMessage
{
  return self->_displayErrorMessage;
}

- (void)setDisplayErrorMessage:(BOOL)a3
{
  self->_displayErrorMessage = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);

  objc_storeStrong((id *)&self->_daemonInterface, 0);
}

@end