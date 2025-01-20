@interface CRLLassoSegmentedViewController
- (CGSize)preferredContentSize;
- (CRLLassoSegmentedControlDelegate)delegate;
- (CRLLassoSegmentedViewController)initWithCoder:(id)a3;
- (CRLLassoSegmentedViewController)initWithLassoType:(unint64_t)a3;
- (CRLLassoSegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UISegmentedControl)segmentedControl;
- (unint64_t)lassoType;
- (void)p_commonInit;
- (void)segmentedControlDidChangeValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLassoType:(unint64_t)a3;
- (void)setSegmentedControl:(id)a3;
- (void)viewDidLoad;
@end

@implementation CRLLassoSegmentedViewController

- (CRLLassoSegmentedViewController)initWithLassoType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLLassoSegmentedViewController;
  v4 = [(CRLLassoSegmentedViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    [(CRLLassoSegmentedViewController *)v4 p_commonInit];
    [(UISegmentedControl *)v5->_segmentedControl setSelectedSegmentIndex:a3];
  }
  return v5;
}

- (CRLLassoSegmentedViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLLassoSegmentedViewController;
  v3 = [(CRLLassoSegmentedViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CRLLassoSegmentedViewController *)v3 p_commonInit];
    [(UISegmentedControl *)v4->_segmentedControl setSelectedSegmentIndex:0];
  }
  return v4;
}

- (CRLLassoSegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLLassoSegmentedViewController;
  v4 = [(CRLLassoSegmentedViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(CRLLassoSegmentedViewController *)v4 p_commonInit];
    [(UISegmentedControl *)v5->_segmentedControl setSelectedSegmentIndex:0];
  }
  return v5;
}

- (void)p_commonInit
{
  v3 = (UISegmentedControl *)objc_alloc_init((Class)UISegmentedControl);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v3;

  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[NSBundle mainBundle];
  id v8 = [v5 localizedStringForKey:@"All Objects" value:0 table:0];

  objc_super v6 = +[NSBundle mainBundle];
  objc_super v7 = [v6 localizedStringForKey:@"Drawings Only" value:0 table:0];

  [(UISegmentedControl *)self->_segmentedControl insertSegmentWithTitle:v8 atIndex:0 animated:1];
  [(UISegmentedControl *)self->_segmentedControl insertSegmentWithTitle:v7 atIndex:1 animated:1];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)CRLLassoSegmentedViewController;
  [(CRLLassoSegmentedViewController *)&v20 viewDidLoad];
  v3 = [(CRLLassoSegmentedViewController *)self view];
  [v3 addSubview:self->_segmentedControl];

  v17 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
  v19 = [(CRLLassoSegmentedViewController *)self view];
  v18 = [v19 safeAreaLayoutGuide];
  v16 = [v18 topAnchor];
  v15 = [v17 constraintEqualToAnchor:v16 constant:10.0];
  v21[0] = v15;
  v13 = [(UISegmentedControl *)self->_segmentedControl leadingAnchor];
  v14 = [(CRLLassoSegmentedViewController *)self view];
  v12 = [v14 safeAreaLayoutGuide];
  v4 = [v12 leadingAnchor];
  v5 = [v13 constraintEqualToAnchor:v4 constant:10.0];
  v21[1] = v5;
  objc_super v6 = [(UISegmentedControl *)self->_segmentedControl trailingAnchor];
  objc_super v7 = [(CRLLassoSegmentedViewController *)self view];
  id v8 = [v7 safeAreaLayoutGuide];
  v9 = [v8 trailingAnchor];
  v10 = [v6 constraintEqualToAnchor:v9 constant:-10.0];
  v21[2] = v10;
  v11 = +[NSArray arrayWithObjects:v21 count:3];
  +[NSLayoutConstraint activateConstraints:v11];

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:"segmentedControlDidChangeValue:" forControlEvents:4096];
}

- (unint64_t)lassoType
{
  return [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
}

- (void)setLassoType:(unint64_t)a3
{
  if ([(UISegmentedControl *)self->_segmentedControl numberOfSegments] > a3)
  {
    segmentedControl = self->_segmentedControl;
    [(UISegmentedControl *)segmentedControl setSelectedSegmentIndex:a3];
  }
}

- (CGSize)preferredContentSize
{
  -[UISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  if (v2 >= 300.0) {
    double v4 = v2 + 20.0;
  }
  else {
    double v4 = 300.0;
  }
  double v5 = v3 + 20.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)segmentedControlDidChangeValue:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained lassoSegmentedControlDidChangeType:[self lassoType]];
}

- (CRLLassoSegmentedControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLLassoSegmentedControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end