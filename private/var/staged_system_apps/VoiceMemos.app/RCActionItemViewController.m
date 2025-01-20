@interface RCActionItemViewController
- (NSString)actionTitle;
- (UIImage)actionImage;
- (void)loadView;
- (void)setActionImage:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)viewDidLoad;
@end

@implementation RCActionItemViewController

- (void)setActionImage:(id)a3
{
  objc_storeStrong((id *)&self->_actionImage, a3);
  id v5 = a3;
  id v7 = [(RCActionItemViewController *)self view];
  v6 = [v7 actionImageView];
  [v6 setImage:v5];
}

- (UIImage)actionImage
{
  v2 = [(RCActionItemViewController *)self view];
  v3 = [v2 actionImageView];
  v4 = [v3 image];

  return (UIImage *)v4;
}

- (void)setActionTitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  actionTitle = self->_actionTitle;
  self->_actionTitle = v5;

  id v8 = [(RCActionItemViewController *)self view];
  id v7 = [v8 actionTitleLabel];
  [v7 setText:v4];
}

- (NSString)actionTitle
{
  v2 = [(RCActionItemViewController *)self view];
  v3 = [v2 actionTitleLabel];
  id v4 = [v3 text];

  return (NSString *)v4;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)RCActionItemViewController;
  [(RCActionItemViewController *)&v4 loadView];
  v3 = objc_opt_new();
  [(RCActionItemViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)RCActionItemViewController;
  [(RCActionItemViewController *)&v15 viewDidLoad];
  v3 = [(RCActionItemViewController *)self view];
  objc_super v4 = [v3 actionImageView];

  id v5 = [(RCActionItemViewController *)self view];
  v6 = [v5 tintColor];

  [v4 setImage:self->_actionImage];
  [v4 setTintColor:v6];
  id v7 = [(RCActionItemViewController *)self view];
  id v8 = [v7 actionTitleLabel];

  [v8 setText:self->_actionTitle];
  [v8 setTextColor:v6];
  v9 = +[UIFont scaledSystemFontOfSize:20.0];
  [v8 setFont:v9];

  [v8 setAdjustsFontForContentSizeCategory:1];
  v10 = [(RCActionItemViewController *)self view];
  [v10 setIsAccessibilityElement:1];

  v11 = [(RCActionItemViewController *)self view];
  unint64_t v12 = (unint64_t)[v11 accessibilityTraits];
  [v11 setAccessibilityTraits:UIAccessibilityTraitButton | v12];

  v13 = [v8 text];
  v14 = [(RCActionItemViewController *)self view];
  [v14 setAccessibilityLabel:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTitle, 0);

  objc_storeStrong((id *)&self->_actionImage, 0);
}

@end