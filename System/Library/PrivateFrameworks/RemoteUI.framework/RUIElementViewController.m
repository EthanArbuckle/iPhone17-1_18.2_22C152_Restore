@interface RUIElementViewController
- (RUIElementViewController)initWithElement:(id)a3;
- (RUITopLevelPageElement)element;
- (void)_setUpViews;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RUIElementViewController

- (RUIElementViewController)initWithElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RUIElementViewController;
  v6 = [(RUIElementViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_element, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RUIElementViewController;
  [(RUIElementViewController *)&v3 viewDidLoad];
  [(RUIElementViewController *)self _setUpViews];
}

- (void)_setUpViews
{
  v26[4] = *MEMORY[0x263EF8340];
  objc_super v3 = [(RUIElementViewController *)self element];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(RUIElementViewController *)self element];
    v6 = [v5 view];

    if (v6)
    {
      v7 = [(RUIElementViewController *)self view];
      [v7 addSubview:v6];

      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      v18 = (void *)MEMORY[0x263F08938];
      v24 = [v6 topAnchor];
      v25 = [(RUIElementViewController *)self view];
      v23 = [v25 topAnchor];
      v22 = [v24 constraintEqualToAnchor:v23];
      v26[0] = v22;
      v20 = [v6 bottomAnchor];
      v21 = [(RUIElementViewController *)self view];
      v19 = [v21 bottomAnchor];
      v17 = [v20 constraintEqualToAnchor:v19];
      v26[1] = v17;
      v8 = [v6 leadingAnchor];
      objc_super v9 = [(RUIElementViewController *)self view];
      v10 = [v9 leadingAnchor];
      v11 = [v8 constraintEqualToAnchor:v10];
      v26[2] = v11;
      v12 = [v6 trailingAnchor];
      v13 = [(RUIElementViewController *)self view];
      v14 = [v13 trailingAnchor];
      v15 = [v12 constraintEqualToAnchor:v14];
      v26[3] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
      [v18 activateConstraints:v16];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUIElementViewController;
  -[RUIElementViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  id v5 = [(RUIElementViewController *)self element];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(RUIElementViewController *)self element];
    [v7 viewWillAppear:v3];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUIElementViewController;
  -[RUIElementViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  id v5 = [(RUIElementViewController *)self element];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(RUIElementViewController *)self element];
    [v7 viewDidAppear:v3];
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)RUIElementViewController;
  [(RUIElementViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [(RUIElementViewController *)self element];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(RUIElementViewController *)self element];
    [v5 viewDidLayout];
  }
}

- (RUITopLevelPageElement)element
{
  return self->_element;
}

- (void).cxx_destruct
{
}

@end