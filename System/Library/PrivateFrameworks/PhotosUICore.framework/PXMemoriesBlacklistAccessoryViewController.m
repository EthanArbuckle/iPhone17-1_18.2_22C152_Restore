@interface PXMemoriesBlacklistAccessoryViewController
- (CGSize)preferredContentSize;
- (NSArray)constraints;
- (PXMemoriesBlacklistAccessoryViewController)initWithAccessoryView:(id)a3 viewSpec:(id)a4;
- (PXMemoriesBlacklistAccessoryViewController)initWithCoder:(id)a3;
- (PXMemoriesBlacklistAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXMemoriesBlacklistAccessoryViewSpec)viewSpec;
- (UIView)accessoryView;
- (void)_setConstraints:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)setAccessoryView:(id)a3;
- (void)setViewSpec:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation PXMemoriesBlacklistAccessoryViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_viewSpec, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setViewSpec:(id)a3
{
}

- (PXMemoriesBlacklistAccessoryViewSpec)viewSpec
{
  return self->_viewSpec;
}

- (void)setAccessoryView:(id)a3
{
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)updateViewConstraints
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXMemoriesBlacklistAccessoryViewController *)self constraints];
  if (v3) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v3];
  }
  accessoryView = self->_accessoryView;
  v11 = @"accessoryView";
  v12[0] = accessoryView;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-leftMargin-[accessoryView(>=width)]-rightMargin-|" options:0 metrics:&unk_1F02DA988 views:v5];
  [v6 addObjectsFromArray:v7];

  v8 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-topMargin-[accessoryView]|" options:0 metrics:&unk_1F02DA988 views:v5];
  [v6 addObjectsFromArray:v8];

  if ([(PXMemoriesBlacklistAccessoryViewSpec *)self->_viewSpec type] != 1)
  {
    v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_accessoryView attribute:7 relatedBy:0 toItem:self->_accessoryView attribute:8 multiplier:1.0 constant:0.0];
    [v6 addObject:v9];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v6];
  [(PXMemoriesBlacklistAccessoryViewController *)self _setConstraints:v6];
  v10.receiver = self;
  v10.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  [(PXMemoriesBlacklistAccessoryViewController *)&v10 updateViewConstraints];
}

- (void)_setConstraints:(id)a3
{
  v8 = (NSArray *)a3;
  v4 = self->_constraints;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      if (self->_constraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      }
      v6 = (NSArray *)[(NSArray *)v8 copy];
      constraints = self->_constraints;
      self->_constraints = v6;

      if (self->_constraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:");
      }
    }
  }
}

- (CGSize)preferredContentSize
{
  [(PXMemoriesBlacklistAccessoryViewSpec *)self->_viewSpec accessoryViewFrame];
  double v3 = v2 + 16.0;
  double v4 = 0.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  [(PXMemoriesBlacklistAccessoryViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  [(PXMemoriesBlacklistAccessoryViewController *)&v4 viewDidLoad];
  double v3 = [(PXMemoriesBlacklistAccessoryViewController *)self view];
  [(UIView *)self->_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_accessoryView];
  [v3 setNeedsUpdateConstraints];
}

- (PXMemoriesBlacklistAccessoryViewController)initWithAccessoryView:(id)a3 viewSpec:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  v9 = [(PXMemoriesBlacklistAccessoryViewController *)&v12 initWithNibName:0 bundle:0];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryView, a3);
    objc_storeStrong((id *)&v10->_viewSpec, a4);
  }

  return v10;
}

- (PXMemoriesBlacklistAccessoryViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMemoriesBlacklistAccessoryViewController.m", 35, @"%s is not available as initializer", "-[PXMemoriesBlacklistAccessoryViewController initWithCoder:]");

  abort();
}

- (PXMemoriesBlacklistAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMemoriesBlacklistAccessoryViewController.m", 31, @"%s is not available as initializer", "-[PXMemoriesBlacklistAccessoryViewController initWithNibName:bundle:]");

  abort();
}

@end