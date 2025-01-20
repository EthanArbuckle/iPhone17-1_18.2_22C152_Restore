@interface _PSSpinnerViewController
- (void)loadView;
- (void)updateViewConstraints;
@end

@implementation _PSSpinnerViewController

- (void)loadView
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)_PSSpinnerViewController;
  [(_PSSpinnerViewController *)&v8 loadView];
  id v5 = (id)[(_PSSpinnerViewController *)v10 view];
  id v4 = (id)[MEMORY[0x263F825C8] tableCellGroupedBackgroundColor];
  objc_msgSend(v5, "setBackgroundColor:");

  uint64_t v2 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:10];
  spinner = v10->_spinner;
  v10->_spinner = (UIActivityIndicatorView *)v2;

  [(UIActivityIndicatorView *)v10->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)v10->_spinner startAnimating];
  id v6 = (id)[(_PSSpinnerViewController *)v10 view];
  [v6 addSubview:v10->_spinner];

  id v7 = (id)[(_PSSpinnerViewController *)v10 view];
  [v7 setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
  v14 = self;
  SEL v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)_PSSpinnerViewController;
  [(_PSSpinnerViewController *)&v12 updateViewConstraints];
  id v6 = (id)[(_PSSpinnerViewController *)v14 view];
  v3 = (void *)MEMORY[0x263F08938];
  spinner = v14->_spinner;
  id v5 = (id)[(_PSSpinnerViewController *)v14 view];
  id v4 = (id)objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", spinner, 9);
  objc_msgSend(v6, "addConstraint:");

  id v11 = (id)[(_PSSpinnerViewController *)v14 view];
  objc_super v8 = (void *)MEMORY[0x263F08938];
  id v7 = v14->_spinner;
  id v10 = (id)[(_PSSpinnerViewController *)v14 view];
  id v9 = (id)objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, 1.0, 0.0);
  objc_msgSend(v11, "addConstraint:");
}

- (void).cxx_destruct
{
}

@end