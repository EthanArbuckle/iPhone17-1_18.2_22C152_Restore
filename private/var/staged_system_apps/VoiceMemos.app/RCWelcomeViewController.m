@interface RCWelcomeViewController
+ (int64_t)reasonToShow;
- (BOOL)canBecomeFirstResponder;
- (RCWelcomeViewController)initWithCompletionBlock:(id)a3;
- (id)completionBlock;
- (id)keyCommands;
- (id)overdubContentLabel;
- (unint64_t)supportedInterfaceOrientations;
- (void)handleContinueButton:(id)a3;
- (void)handleLearnMoreButton:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setupSubviewsForDefaultScreen;
- (void)setupSubviewsForOverdubScreen;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RCWelcomeViewController

+ (int64_t)reasonToShow
{
  return +[RCWelcomeUtilities reasonToShow];
}

- (RCWelcomeViewController)initWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int IsEnabled = RCOverdubRecordingIsEnabled();
  v6 = +[NSBundle mainBundle];
  v7 = v6;
  if (IsEnabled) {
    CFStringRef v8 = @"RECORD_VOCAL_LAYER_TITLE_FULL";
  }
  else {
    CFStringRef v8 = @"WHATS_NEW_TITLE_FULL";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_100228BC8 table:0];

  v10 = 0;
  if (RCOverdubRecordingIsEnabled())
  {
    v10 = +[UIImage imageNamed:@"VocalLayer_Onboarding"];
  }
  v16.receiver = self;
  v16.super_class = (Class)RCWelcomeViewController;
  v11 = [(RCWelcomeViewController *)&v16 initWithTitle:v9 detailText:0 icon:v10];
  v12 = [(RCWelcomeViewController *)v11 headerView];
  [v12 setAllowFullWidthIcon:1];

  if (v11)
  {
    id v13 = objc_retainBlock(v4);
    id completionBlock = v11->_completionBlock;
    v11->_id completionBlock = v13;
  }
  return v11;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)RCWelcomeViewController;
  [(RCWelcomeViewController *)&v13 viewDidLoad];
  if (RCOverdubRecordingIsEnabled()) {
    [(RCWelcomeViewController *)self setupSubviewsForOverdubScreen];
  }
  else {
    [(RCWelcomeViewController *)self setupSubviewsForDefaultScreen];
  }
  v3 = +[OBBoldTrayButton boldButton];
  id v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"WELCOME_CONTINUE" value:&stru_100228BC8 table:0];
  [v3 setTitle:v5 forState:0];

  v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  v7 = [v6 standardInteractionTintColor];
  [v3 setTintColor:v7];

  [v3 addTarget:self action:"handleContinueButton:" forControlEvents:64];
  CFStringRef v8 = [(RCWelcomeViewController *)self buttonTray];
  [v8 addButton:v3];

  if (RCOverdubRecordingIsEnabled())
  {
    v9 = +[OBLinkTrayButton linkButton];
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"LEARN_MORE_TITLE" value:&stru_100228BC8 table:0];
    [v9 setTitle:v11 forState:0];

    [v9 addTarget:self action:"handleLearnMoreButton:" forControlEvents:64];
    v12 = [(RCWelcomeViewController *)self buttonTray];
    [v12 addButton:v9];
  }
  [(RCWelcomeViewController *)self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  v2 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:"handleContinueButton:"];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RCWelcomeViewController;
  [(RCWelcomeViewController *)&v3 viewDidAppear:a3];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

- (void)setupSubviewsForDefaultScreen
{
  id v17 = +[UIImage systemImageNamed:@"quote.bubble"];
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"WELCOME_ITEM_1_TITLE" value:&stru_100228BC8 table:0];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"WELCOME_ITEM_1_DESCRIPTION" value:&stru_100228BC8 table:0];
  [(RCWelcomeViewController *)self addBulletedListItemWithTitle:v4 description:v6 image:v17];

  v7 = +[UIImage _systemImageNamed:@"waveform.and.stereo"];
  CFStringRef v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"WELCOME_ITEM_2_TITLE" value:&stru_100228BC8 table:0];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"WELCOME_ITEM_2_DESCRIPTION" value:&stru_100228BC8 table:0];
  [(RCWelcomeViewController *)self addBulletedListItemWithTitle:v9 description:v11 image:v7];

  v12 = +[UIImage systemImageNamed:@"plus.square.on.square"];
  objc_super v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"WELCOME_ITEM_3_TITLE" value:&stru_100228BC8 table:0];
  v15 = +[NSBundle mainBundle];
  objc_super v16 = [v15 localizedStringForKey:@"WELCOME_ITEM_3_DESCRIPTION" value:&stru_100228BC8 table:0];
  [(RCWelcomeViewController *)self addBulletedListItemWithTitle:v14 description:v16 image:v12];
}

- (void)setupSubviewsForOverdubScreen
{
  id v3 = [(RCWelcomeViewController *)self overdubContentLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(RCWelcomeViewController *)self contentView];
  [v4 addSubview:v3];

  v20 = [v3 topAnchor];
  v21 = [(RCWelcomeViewController *)self contentView];
  v19 = [v21 topAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v22[0] = v18;
  objc_super v16 = [v3 bottomAnchor];
  id v17 = [(RCWelcomeViewController *)self contentView];
  v15 = [v17 bottomAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v22[1] = v14;
  v5 = [v3 leadingAnchor];
  v6 = [(RCWelcomeViewController *)self contentView];
  v7 = [v6 leadingAnchor];
  CFStringRef v8 = [v5 constraintEqualToAnchor:v7];
  v22[2] = v8;
  v9 = [v3 trailingAnchor];
  v10 = [(RCWelcomeViewController *)self contentView];
  v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v22[3] = v12;
  objc_super v13 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (id)overdubContentLabel
{
  v2 = objc_opt_new();
  id v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v4 = [v3 multitrackImageForWelcome];
  v5 = [v4 imageWithRenderingMode:2];
  [v2 setImage:v5];

  v6 = +[NSAttributedString attributedStringWithAttachment:v2];
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  CFStringRef v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"RECORD_VOCAL_LAYER_DESCRIPTION" value:&stru_100228BC8 table:0];
  id v10 = [v7 initWithString:v9];

  v11 = [v10 string];
  id v12 = [v11 rangeOfString:@"<+>"];
  uint64_t v14 = v13;

  if (v14)
  {
    [v10 replaceCharactersInRange:v12 withAttributedString:v14];
  }
  else
  {
    v15 = OSLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10016B438(v15);
    }
  }
  objc_super v16 = objc_opt_new();
  [v16 setAttributedText:v10];
  [v16 setTextAlignment:1];
  [v16 setNumberOfLines:0];

  return v16;
}

- (void)handleContinueButton:(id)a3
{
  +[RCWelcomeUtilities finishShowingWelcomeScreen];
  id completionBlock = self->_completionBlock;

  [(RCWelcomeViewController *)self dismissViewControllerAnimated:1 completion:completionBlock];
}

- (void)handleLearnMoreButton:(id)a3
{
  id v4 = +[NSURL URLWithString:@"https://support.apple.com/guide/iphone/iphfefa3252b"];
  id v3 = +[UIApplication sharedApplication];
  [v3 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end