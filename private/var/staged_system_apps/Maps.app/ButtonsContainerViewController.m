@interface ButtonsContainerViewController
- (BOOL)_canShowWhileLocked;
- (ButtonsContainerViewController)initWithCoder:(id)a3;
- (ButtonsContainerViewController)initWithFloatingButtonItems:(id)a3;
- (ButtonsContainerViewController)initWithFloatingButtonItems:(id)a3 visualEffectDisabled:(BOOL)a4;
- (ButtonsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)floatingButtonItems;
- (NSString)blurGroupName;
- (void)hideNonVisibleControls:(int64_t)a3;
- (void)loadView;
- (void)refreshControls;
- (void)setBlurGroupName:(id)a3;
- (void)setVisibleControls:(int64_t)a3;
- (void)showVisibleControls:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation ButtonsContainerViewController

- (ButtonsContainerViewController)initWithFloatingButtonItems:(id)a3 visualEffectDisabled:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ButtonsContainerViewController;
  v7 = [(ButtonsContainerViewController *)&v13 initWithNibName:0 bundle:0];
  if (v7)
  {
    v8 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v7->_stackView;
    v7->_stackView = v8;

    [(UIStackView *)v7->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7->_visualEffectDisabled = a4;
    v10 = (NSArray *)[v6 copy];
    floatingButtonItems = v7->_floatingButtonItems;
    v7->_floatingButtonItems = v10;

    [(ButtonsContainerViewController *)v7 refreshControls];
  }

  return v7;
}

- (void)loadView
{
  v3 = self->_blurGroupName;
  BOOL visualEffectDisabled = self->_visualEffectDisabled;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100083AD4;
  v22[3] = &unk_1012E95D0;
  BOOL v25 = visualEffectDisabled;
  v17 = v3;
  v23 = v17;
  id v6 = v5;
  id v24 = v6;
  v7 = objc_retainBlock(v22);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = self->_floatingButtonItems;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v14 isSeparator])
        {
          if ([v8 count])
          {
            ((void (*)(void *, id))v7[2])(v7, v8);
            [v8 removeAllObjects];
          }
        }
        else
        {
          [v8 addObject:v14];
        }
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    ((void (*)(void *, id))v7[2])(v7, v8);
  }
  v15 = (NSArray *)[v6 copy];
  groupVCs = self->_groupVCs;
  self->_groupVCs = v15;

  [(ButtonsContainerViewController *)self setView:self->_stackView];
}

- (NSArray)floatingButtonItems
{
  return self->_floatingButtonItems;
}

- (void)hideNonVisibleControls:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_groupVCs;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 hideNonVisibleControls:a3, v12];
        uint64_t v10 = [v9 hasShownControls] ^ 1;
        id v11 = [v9 view];
        [v11 setHidden:v10];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)showVisibleControls:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_groupVCs;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 showVisibleControls:a3, v12];
        uint64_t v10 = [v9 hasShownControls] ^ 1;
        id v11 = [v9 view];
        [v11 setHidden:v10];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)refreshControls
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_groupVCs;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v9 refreshControls];
        [(ButtonsContainerViewController *)self addChildViewController:v9];
        uint64_t v10 = [v9 view];
        [v3 addObject:v10];

        [v9 didMoveToParentViewController:self];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  stackView = self->_stackView;
  id v12 = [v3 copy];
  [(UIStackView *)stackView _maps_setArrangedSubviews:v12];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004642C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setVisibleControls:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_groupVCs;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 setVisibleControls:a3, v12];
        if ([v9 hasVisibleControls]) {
          double v10 = 1.0;
        }
        else {
          double v10 = 0.0;
        }
        id v11 = [v9 view];
        [v11 setAlpha:v10];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setBlurGroupName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_groupVCs;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setBlurGroupName:self->_blurGroupName v11];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ButtonsContainerViewController;
  [(ButtonsContainerViewController *)&v5 viewDidLoad];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setSpacing:10.0];
  [(UIStackView *)self->_stackView setAlignment:0];
  [(UIStackView *)self->_stackView setAxis:1];
  LODWORD(v3) = 1148846080;
  [(UIStackView *)self->_stackView setContentHuggingPriority:0 forAxis:v3];
  LODWORD(v4) = 1148846080;
  [(UIStackView *)self->_stackView setContentCompressionResistancePriority:0 forAxis:v4];
}

- (ButtonsContainerViewController)initWithFloatingButtonItems:(id)a3
{
  return [(ButtonsContainerViewController *)self initWithFloatingButtonItems:a3 visualEffectDisabled:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ButtonsContainerViewController)initWithCoder:(id)a3
{
  return [(ButtonsContainerViewController *)self initWithFloatingButtonItems:0];
}

- (ButtonsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ButtonsContainerViewController initWithFloatingButtonItems:](self, "initWithFloatingButtonItems:", 0, a4);
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_floatingButtonItems, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_groupVCs, 0);
}

@end