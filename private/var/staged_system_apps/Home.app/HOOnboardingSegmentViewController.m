@interface HOOnboardingSegmentViewController
+ (id)_buildPocketViewControllerWithOptions:(unint64_t)a3 target:(id)a4 action:(SEL)a5;
+ (unint64_t)pocketOptions;
- (BOOL)showPocket;
- (HOOnboardingChildViewControllerDelegate)delegate;
- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate;
- (HOOnboardingSegmentViewController)initWithContentViewController:(id)a3 delegate:(id)a4;
- (NSString)segmentIdentifier;
- (unint64_t)_numberOfPocketButtons;
- (void)_buttonActivated:(id)a3;
- (void)_setNavigationBarVisibility:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationBarDelegate:(id)a3;
- (void)setShowPocket:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HOOnboardingSegmentViewController

+ (id)_buildPocketViewControllerWithOptions:(unint64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v7 = a4;
  if (a3)
  {
    v8 = objc_opt_new();
    if ((a3 & 8) != 0)
    {
      v13 = sub_100014BB4(@"HOOnboardingGetStarted");
      v14 = +[HUPocketButtonDescriptor descriptorWithTitle:v13 style:0 target:v7 action:a5 userInfo:&off_1000CB640];
      [v8 addObject:v14];

      if ((a3 & 4) == 0)
      {
LABEL_4:
        if ((a3 & 1) == 0) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
    else if ((a3 & 4) == 0)
    {
      goto LABEL_4;
    }
    v15 = sub_100014BB4(@"HOOnboardingSetUpLater");
    v16 = +[HUPocketButtonDescriptor descriptorWithTitle:v15 style:1 target:v7 action:a5 userInfo:&off_1000CB658];
    [v8 addObject:v16];

    if ((a3 & 1) == 0)
    {
LABEL_5:
      if ((a3 & 2) == 0)
      {
LABEL_7:
        id v11 = [objc_alloc((Class)HUPocketButtonViewController) initWithButtonDescriptors:v8];

        goto LABEL_9;
      }
LABEL_6:
      v9 = sub_100014BB4(@"HODoneButtonTitle");
      v10 = +[HUPocketButtonDescriptor descriptorWithTitle:v9 style:0 target:v7 action:a5 userInfo:&off_1000CB688];
      [v8 addObject:v10];

      goto LABEL_7;
    }
LABEL_14:
    v17 = HULocalizedString();
    v18 = +[HUPocketButtonDescriptor descriptorWithTitle:v17 style:0 target:v7 action:a5 userInfo:&off_1000CB670];
    [v8 addObject:v18];

    if ((a3 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (HOOnboardingSegmentViewController)initWithContentViewController:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HOOnboardingSegmentViewController.m", 52, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v9 = objc_opt_class();
  v10 = [v9 _buildPocketViewControllerWithOptions:[objc_opt_class() pocketOptions] target:self action:@"_buttonActivated:"];
  v15.receiver = self;
  v15.super_class = (Class)HOOnboardingSegmentViewController;
  id v11 = [(HOOnboardingSegmentViewController *)&v15 initWithContentViewController:v7 pocketViewController:v10];
  v12 = v11;
  if (v11) {
    [(HOOnboardingSegmentViewController *)v11 setDelegate:v8];
  }

  return v12;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingSegmentViewController;
  [(HOOnboardingSegmentViewController *)&v5 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(HOOnboardingSegmentViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingSegmentViewController;
  -[HOOnboardingSegmentViewController viewWillAppear:](&v5, "viewWillAppear:");
  [(HOOnboardingSegmentViewController *)self _setNavigationBarVisibility:v3];
}

+ (unint64_t)pocketOptions
{
  return 0;
}

- (NSString)segmentIdentifier
{
  return 0;
}

- (BOOL)showPocket
{
  v2 = [(HOOnboardingSegmentViewController *)self pocketViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setShowPocket:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(id)objc_opt_class() pocketOptions];
    uint64_t v5 = [(id)objc_opt_class() _buildPocketViewControllerWithOptions:v4 target:self action:"_buttonActivated:"];
    if (v5) {
      [(HOOnboardingSegmentViewController *)self setPocketViewController:v5];
    }
    _objc_release_x1();
  }
  else
  {
    [(HOOnboardingSegmentViewController *)self setPocketViewController:0];
  }
}

- (void)_buttonActivated:(id)a3
{
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = [v5 userInfo];
    int v12 = 138412802;
    v13 = self;
    __int16 v14 = 2112;
    objc_super v15 = v7;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button (%@)", (uint8_t *)&v12, 0x20u);
  }
  v9 = [v5 userInfo];
  v10 = (char *)[v9 unsignedIntegerValue];

  if ((unint64_t)(v10 - 1) < 2) {
    goto LABEL_6;
  }
  if (v10 == (char *)4)
  {
    id v11 = [(HOOnboardingSegmentViewController *)self delegate];
    [v11 childViewControllerDidFinish:self shouldSkipRelatedChildren:1];
    goto LABEL_8;
  }
  if (v10 == (char *)8)
  {
LABEL_6:
    id v11 = [(HOOnboardingSegmentViewController *)self delegate];
    [v11 childViewControllerDidFinish:self];
LABEL_8:
  }
}

- (unint64_t)_numberOfPocketButtons
{
  objc_opt_class();
  BOOL v3 = [(HOOnboardingSegmentViewController *)self pocketViewController];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 descriptors];

  id v7 = [v6 count];
  return (unint64_t)v7;
}

- (void)_setNavigationBarVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (id)[(HOOnboardingSegmentViewController *)self _numberOfPocketButtons] != (id)1;
  v6 = [(HOOnboardingSegmentViewController *)self navigationItem];
  [v6 setHidesBackButton:v5];

  id v7 = [(HOOnboardingSegmentViewController *)self navigationController];
  [v7 setNavigationBarHidden:0 animated:v3];

  id v8 = [(HOOnboardingSegmentViewController *)self navigationController];
  v9 = [v8 navigationBar];
  v10 = +[UIColor systemBackgroundColor];
  [v9 setBarTintColor:v10];

  id v12 = [(HOOnboardingSegmentViewController *)self navigationController];
  id v11 = [v12 navigationBar];
  [v11 _setHidesShadow:1];
}

- (HOOnboardingChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HOOnboardingChildViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBarDelegate);

  return (HOOnboardingChildViewControllerNavigationBarDelegate *)WeakRetained;
}

- (void)setNavigationBarDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationBarDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end