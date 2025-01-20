@interface COSSkippedMiniFlowController
- (COSSkippedMiniFlowController)initWithSkippedControllerClassNames:(id)a3;
- (COSSkippedMiniFlowControllerDelegate)flowDelegate;
- (NSArray)skippedControllers;
- (id)currentController;
- (id)nextViewController;
- (id)setupFlowUserInfo;
- (unint64_t)controllerIndex;
- (void)_didFinish;
- (void)buddyControllerDone:(id)a3;
- (void)doneButtonPressed;
- (void)setControllerIndex:(unint64_t)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setSkippedControllers:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSSkippedMiniFlowController

- (COSSkippedMiniFlowController)initWithSkippedControllerClassNames:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)COSSkippedMiniFlowController;
  v5 = [(COSSkippedMiniFlowController *)&v24 init];
  if (v5)
  {
    v6 = (NSArray *)objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(NSString **)(*((void *)&v20 + 1) + 8 * i);
          v13 = NSClassFromString(v12);
          if (v13)
          {
            v14 = objc_alloc_init(v13);
            if (v14
              && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
               || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
              {
                v15 = v14;
                [v15 setDelegate:v5];
                [v15 setIsDisplayingInSkippedMiniFlow:1];
              }
              [(NSArray *)v6 addObject:v14];
            }
            else
            {
              v16 = pbb_bridge_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v12;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error recreating skipped pane '%@': Pane not initialized or invalid pane class", buf, 0xCu);
              }
            }
          }
          else
          {
            v14 = pbb_bridge_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v12;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error recreating skipped pane '%@': Class could not be loaded", buf, 0xCu);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v9);
    }

    skippedControllers = v5->_skippedControllers;
    v5->_skippedControllers = v6;

    v5->_controllerIndex = 0;
    id v4 = v19;
  }

  return v5;
}

- (id)currentController
{
  unint64_t v3 = [(COSSkippedMiniFlowController *)self controllerIndex];
  id v4 = [(COSSkippedMiniFlowController *)self skippedControllers];
  id v5 = [v4 count];

  if (v3 >= (unint64_t)v5)
  {
    id v7 = 0;
  }
  else
  {
    v6 = [(COSSkippedMiniFlowController *)self skippedControllers];
    id v7 = [v6 objectAtIndexedSubscript:[self controllerIndex]];
  }

  return v7;
}

- (id)nextViewController
{
  unint64_t v3 = [(COSSkippedMiniFlowController *)self currentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 viewController];
LABEL_5:
    id v5 = v4;
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed"];
    id v7 = [v5 navigationItem];
    [v7 setRightBarButtonItem:v6];

    id v8 = v5;
    id v9 = v8;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error: current skipped flow controller is not a view controller or mini flow controller", v11, 2u);
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)COSSkippedMiniFlowController;
  [(COSSkippedMiniFlowController *)&v6 viewDidLoad];
  [(COSSkippedMiniFlowController *)self setModalInPresentation:1];
  uint64_t v3 = [(COSSkippedMiniFlowController *)self nextViewController];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v7 = v3;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
    [(COSSkippedMiniFlowController *)self setViewControllers:v5];
  }
}

- (void)doneButtonPressed
{
  uint64_t v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[COSSkippedMiniFlowController doneButtonPressed]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(COSSkippedMiniFlowController *)self _didFinish];
}

- (void)_didFinish
{
  uint64_t v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[COSSkippedMiniFlowController _didFinish]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v4 = [(COSSkippedMiniFlowController *)self flowDelegate];
  if (v4)
  {
    id v5 = (void *)v4;
    objc_super v6 = [(COSSkippedMiniFlowController *)self flowDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(COSSkippedMiniFlowController *)self flowDelegate];
      [v8 skippedMiniFlowDidFinish:self];
    }
  }
  [(COSSkippedMiniFlowController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)buddyControllerDone:(id)a3
{
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[COSSkippedMiniFlowController buddyControllerDone:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  +[BPSFollowUpController removeSkippedPaneClassForCurrentDevice:objc_opt_class()];
  [(COSSkippedMiniFlowController *)self setControllerIndex:(char *)[(COSSkippedMiniFlowController *)self controllerIndex] + 1];
  objc_super v6 = [(COSSkippedMiniFlowController *)self nextViewController];
  if (v6)
  {
    char v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      int v9 = "-[COSSkippedMiniFlowController buddyControllerDone:]";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s pushing %@", (uint8_t *)&v8, 0x16u);
    }

    [(COSSkippedMiniFlowController *)self pushViewController:v6 animated:1];
  }
  else
  {
    [(COSSkippedMiniFlowController *)self _didFinish];
  }
}

- (id)setupFlowUserInfo
{
  v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = +[BPSTinkerSupport sharedInstance];
  id v4 = [v3 cachedTinkerFamilyMemeber];

  if (v4) {
    [v2 setObject:v4 forKey:BPSPairingFlowFamilyMember];
  }

  return v2;
}

- (COSSkippedMiniFlowControllerDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (COSSkippedMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (NSArray)skippedControllers
{
  return self->_skippedControllers;
}

- (void)setSkippedControllers:(id)a3
{
}

- (unint64_t)controllerIndex
{
  return self->_controllerIndex;
}

- (void)setControllerIndex:(unint64_t)a3
{
  self->_controllerIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedControllers, 0);

  objc_destroyWeak((id *)&self->_flowDelegate);
}

@end