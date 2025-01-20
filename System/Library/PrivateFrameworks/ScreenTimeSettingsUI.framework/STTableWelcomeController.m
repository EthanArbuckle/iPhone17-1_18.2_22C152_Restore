@interface STTableWelcomeController
- (NSLayoutConstraint)heightConstraint;
- (UITableViewController)tableViewController;
- (void)_contentSizeDidChangeFrom:(CGSize)a3 to:(CGSize)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHeightConstraint:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewController:(id)a3;
@end

@implementation STTableWelcomeController

- (void)dealloc
{
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 removeObserver:self forKeyPath:@"contentSize" context:"KVOContextSTTableWelcomeController"];

  v4.receiver = self;
  v4.super_class = (Class)STTableWelcomeController;
  [(STTableWelcomeController *)&v4 dealloc];
}

- (void)setTableViewController:(id)a3
{
  v5 = (UITableViewController *)a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"STTableWelcomeController.m", 26, @"Invalid parameter not satisfying: %@", @"tableViewController != nil" object file lineNumber description];
  }
  tableViewController = self->_tableViewController;
  self->_tableViewController = v5;
  v10 = v5;
  v7 = tableViewController;

  [(UITableViewController *)v7 willMoveToParentViewController:0];
  [(STTableWelcomeController *)self addChildViewController:v10];
  v8 = [(UITableViewController *)v10 tableView];
  [(STTableWelcomeController *)self setTableView:v8];

  [(UITableViewController *)v10 didMoveToParentViewController:self];
  [(UITableViewController *)v7 removeFromParentViewController];
}

- (void)setTableView:(id)a3
{
  id v4 = a3;
  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 removeObserver:self forKeyPath:@"contentSize" context:"KVOContextSTTableWelcomeController"];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setScrollEnabled:0];
  v9.receiver = self;
  v9.super_class = (Class)STTableWelcomeController;
  [(OBTableWelcomeController *)&v9 setTableView:v4];
  v6 = [v4 heightAnchor];
  [v4 contentSize];
  v8 = [v6 constraintEqualToConstant:v7];

  [(STTableWelcomeController *)self setHeightConstraint:v8];
  [v8 setActive:1];
  [v4 addObserver:self forKeyPath:@"contentSize" options:3 context:"KVOContextSTTableWelcomeController"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "KVOContextSTTableWelcomeController")
  {
    if ([a3 isEqualToString:@"contentSize"])
    {
      v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v12 = [MEMORY[0x263EFF9D0] null];

      if (v11 == v12)
      {

        v11 = 0;
      }
      v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v14 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v14)
      {

        v13 = 0;
      }
      [v11 CGSizeValue];
      double v16 = v15;
      double v18 = v17;
      [v13 CGSizeValue];
      -[STTableWelcomeController _contentSizeDidChangeFrom:to:](self, "_contentSizeDidChangeFrom:to:", v16, v18, v19, v20);
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)STTableWelcomeController;
    [(STTableWelcomeController *)&v21 observeValueForKeyPath:@"contentSize" ofObject:a4 change:v10 context:a6];
  }
}

- (void)_contentSizeDidChangeFrom:(CGSize)a3 to:(CGSize)a4
{
  if (a3.height != a4.height)
  {
    double height = a4.height;
    double v7 = [(STTableWelcomeController *)self heightConstraint];
    [v7 setConstant:height];

    [(STTableWelcomeController *)self performSelector:sel_viewDidLayoutSubviews withObject:0 afterDelay:0.0];
  }
}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_tableViewController, 0);
}

@end