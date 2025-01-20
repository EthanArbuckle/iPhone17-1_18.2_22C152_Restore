@interface PKViewController
- (PKViewController)init;
- (PKViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation PKViewController

- (PKViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKViewController;
  return [(PKViewController *)&v3 initWithNibName:0 bundle:0];
}

- (PKViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(PKView);
  [(PKViewController *)self setView:v3];
}

@end