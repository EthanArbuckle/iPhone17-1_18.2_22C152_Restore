@interface TSADebugViewController
- (TSADebugViewController)initWithDelegate:(id)a3;
- (void)addItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)dealloc;
- (void)hideIt:(id)a3;
- (void)loadView;
- (void)showIt:(id)a3;
- (void)toggleVisible:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSADebugViewController

- (TSADebugViewController)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSADebugViewController;
  v4 = [(TSADebugViewController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (UIViewController *)a3;
    v4->_debugTableViewController = [[TSADebugTableViewController alloc] initWithParent:v4];
  }
  [(TSADebugViewController *)v5 view];
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSADebugViewController;
  [(TSKPopoverBasedViewController *)&v3 dealloc];
}

- (void)addItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)TSADebugViewController;
  [(TSADebugViewController *)&v4 loadView];
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 230.0, 375.0);
  objc_msgSend(v3, "addSubview:", -[TSADebugTableViewController tableView](self->_debugTableViewController, "tableView"));
  [(TSADebugViewController *)self setView:v3];
}

- (void)toggleVisible:(id)a3
{
  if ([(TSKPopoverBasedViewController *)self isVisible])
  {
    [(TSADebugViewController *)self hideIt:a3];
  }
  else
  {
    [(TSADebugViewController *)self showIt:a3];
  }
}

- (void)showIt:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "rightApplicationToolbarItems"), "firstObject");
    objc_opt_class();
    uint64_t v4 = TSUDynamicCast();
    objc_opt_class();
    v5 = (void *)TSUDynamicCast();
    objc_opt_class();
    v6 = (void *)TSUDynamicCast();
    if (v4)
    {
      delegate = self->_delegate;
      [(TSKPopoverBasedViewController *)self presentModallyFromBarItem:v4 viewController:delegate];
    }
    else
    {
      if (v5)
      {
        [v5 bounds];
        v8 = self->_delegate;
        v9 = self;
        v10 = v5;
      }
      else
      {
        v11 = v6;
        if (!v6) {
          return;
        }
        [v6 bounds];
        v8 = self->_delegate;
        v9 = self;
        v10 = v11;
      }
      -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:](v9, "presentModallyFromRect:inView:viewController:", v10, v8);
    }
  }
}

- (void)hideIt:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TSADebugViewController;
  -[TSKPopoverBasedViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(TSADebugTableViewController *)self->_debugTableViewController viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  -[TSADebugTableViewController viewDidDisappear:](self->_debugTableViewController, "viewDidDisappear:");
  v5.receiver = self;
  v5.super_class = (Class)TSADebugViewController;
  [(TSKPopoverBasedViewController *)&v5 viewDidDisappear:v3];
}

@end