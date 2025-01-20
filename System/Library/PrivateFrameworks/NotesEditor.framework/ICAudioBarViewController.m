@interface ICAudioBarViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasTranslucentNavigationBar;
- (ICAudioBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICAudioBarViewControllerDelegate)delegate;
- (ICNote)note;
- (UIButton)doneButton;
- (UIViewController)addedToViewController;
- (double)height;
- (void)addConstraintsInSuperview:(id)a3;
- (void)addToViewController:(id)a3;
- (void)adjustTextViewContentInsetWhenAddingView:(BOOL)a3;
- (void)dealloc;
- (void)done:(id)a3;
- (void)noteWillBeDeletedNotification:(id)a3;
- (void)setAddedToViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeight:(double)a3;
- (void)setNote:(id)a3;
@end

@implementation ICAudioBarViewController

- (ICAudioBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ICAudioBarViewController;
  v4 = [(ICAudioBarViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(ICAudioBarView);
    v6 = [(ICAudioBarView *)v5 doneButton];
    [v6 addTarget:v4 action:sel_done_ forControlEvents:64];

    [(ICAudioBarViewController *)v4 setView:v5];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAudioBarViewController;
  [(ICAudioBarViewController *)&v4 dealloc];
}

- (UIButton)doneButton
{
  v2 = [(ICAudioBarViewController *)self view];
  v3 = [v2 doneButton];

  return (UIButton *)v3;
}

- (void)setHeight:(double)a3
{
  id v4 = [(ICAudioBarViewController *)self view];
  [v4 setHeight:a3];
}

- (double)height
{
  v2 = [(ICAudioBarViewController *)self view];
  [v2 height];
  double v4 = v3;

  return v4;
}

- (void)setNote:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v7 = *MEMORY[0x263F5AAA0];
    id v8 = objc_loadWeakRetained((id *)&self->_note);
    [v6 removeObserver:self name:v7 object:v8];

    id v9 = objc_storeWeak((id *)&self->_note, obj);
    v5 = obj;
    if (obj)
    {
      v10 = [MEMORY[0x263F08A00] defaultCenter];
      id v11 = objc_loadWeakRetained((id *)&self->_note);
      [v10 addObserver:self selector:sel_noteWillBeDeletedNotification_ name:v7 object:v11];

      v5 = obj;
    }
  }
}

- (void)addToViewController:(id)a3
{
  id v12 = a3;
  double v4 = [(ICAudioBarViewController *)self view];
  v5 = [v4 superview];
  v6 = [v12 view];

  if (v5 != v6)
  {
    [(ICAudioBarViewController *)self setAddedToViewController:v12];
    uint64_t v7 = [v12 view];
    id v8 = [(ICAudioBarViewController *)self view];
    [v7 addSubview:v8];

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      id v9 = [v12 view];
      v10 = [(ICAudioBarViewController *)self view];
      [v9 bringSubviewToFront:v10];
    }
    id v11 = [v12 view];
    [(ICAudioBarViewController *)self addConstraintsInSuperview:v11];

    [(ICAudioBarViewController *)self adjustTextViewContentInsetWhenAddingView:1];
  }
}

- (void)adjustTextViewContentInsetWhenAddingView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = [(ICAudioBarViewController *)self addedToViewController];
  v6 = [v5 view];
  uint64_t v7 = [v6 subviews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          [v13 contentInset];
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          [v13 contentOffset];
          double v23 = v22;
          double v25 = v24;
          [(ICAudioBarViewController *)self height];
          if (!v3) {
            double v26 = -v26;
          }
          objc_msgSend(v13, "setContentInset:", v15 + v26, v17, v19, v21);
          if ([(ICAudioBarViewController *)self hasTranslucentNavigationBar] && v3)
          {
            [v13 contentOffset];
            if (v23 != v28 || v25 != v27)
            {
              [v13 contentOffset];
              double v31 = v30;
              double v33 = v32;
              [(ICAudioBarViewController *)self height];
              objc_msgSend(v13, "setContentOffset:", v31, v33 + v34);
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v9);
  }
}

- (void)noteWillBeDeletedNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ICAudioBarViewController *)self note];

  v5 = v6;
  if (v6 == v4)
  {
    [(ICAudioBarViewController *)self setNote:0];
    [(ICAudioBarViewController *)self done:0];
    v5 = v6;
  }
}

- (void)done:(id)a3
{
  id v4 = [(ICAudioBarViewController *)self view];
  v5 = [v4 superview];

  if (v5)
  {
    [(ICAudioBarViewController *)self adjustTextViewContentInsetWhenAddingView:0];
    id v6 = [(ICAudioBarViewController *)self view];
    [v6 removeFromSuperview];
  }
  id v7 = [(ICAudioBarViewController *)self delegate];
  [v7 audioBarViewControllerDone:self];
}

- (BOOL)hasTranslucentNavigationBar
{
  v2 = [(ICAudioBarViewController *)self addedToViewController];
  BOOL v3 = [v2 navigationController];
  id v4 = [v3 navigationBar];

  LOBYTE(v2) = [v4 isTranslucent];
  return (char)v2;
}

- (void)addConstraintsInSuperview:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v20 = objc_alloc_init(v4);
  id v6 = [(ICAudioBarViewController *)self view];
  id v7 = [v6 topAnchor];
  uint64_t v8 = [v5 safeAreaLayoutGuide];
  uint64_t v9 = [v8 topAnchor];
  uint64_t v10 = [v7 constraintEqualToAnchor:v9];
  [v20 addObject:v10];

  uint64_t v11 = [(ICAudioBarViewController *)self view];
  id v12 = [v11 leadingAnchor];
  id v13 = [v5 leadingAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [v20 addObject:v14];

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    double v15 = -*MEMORY[0x263F5B5A0];
  }
  else {
    double v15 = 0.0;
  }
  double v16 = [(ICAudioBarViewController *)self view];
  double v17 = [v16 trailingAnchor];
  double v18 = [v5 trailingAnchor];

  double v19 = [v17 constraintEqualToAnchor:v18 constant:v15];
  [v20 addObject:v19];

  [MEMORY[0x263F08938] activateConstraints:v20];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICAudioBarViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICAudioBarViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  return (ICNote *)WeakRetained;
}

- (UIViewController)addedToViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addedToViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setAddedToViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addedToViewController);
  objc_destroyWeak((id *)&self->_note);

  objc_destroyWeak((id *)&self->_delegate);
}

@end