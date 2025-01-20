@interface _UIAlternateApplicationIconsAlertContentViewController
- (NSString)messageText;
- (void)__updateWithVisualStyle:(id)a3;
- (void)_containingAlertControllerDidChangeVisualStyle:(id)a3;
- (void)_updateWithContainingAlertControllerVisualStyle;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)setMessageText:(id)a3;
@end

@implementation _UIAlternateApplicationIconsAlertContentViewController

- (NSString)messageText
{
  id v3 = [(UIViewController *)self view];
  messageLabel = self->_messageLabel;
  return [(UILabel *)messageLabel text];
}

- (void)setMessageText:(id)a3
{
  id v5 = a3;
  id v4 = [(UIViewController *)self view];
  [(UILabel *)self->_messageLabel setText:v5];
}

- (void)_containingAlertControllerDidChangeVisualStyle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIAlternateApplicationIconsAlertContentViewController;
  id v4 = a3;
  [(UIViewController *)&v5 _containingAlertControllerDidChangeVisualStyle:v4];
  -[_UIAlternateApplicationIconsAlertContentViewController __updateWithVisualStyle:](self, "__updateWithVisualStyle:", v4, v5.receiver, v5.super_class);
}

- (void)__updateWithVisualStyle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 messageLabelFont];
  [(UILabel *)self->_messageLabel setFont:v5];

  v6 = [v4 messageLabelColor];
  [(UILabel *)self->_messageLabel setTextColor:v6];

  uint64_t v7 = [v4 maximumNumberOfLinesInMessageLabel];
  messageLabel = self->_messageLabel;
  [(UILabel *)messageLabel setNumberOfLines:v7];
}

- (void)_updateWithContainingAlertControllerVisualStyle
{
  id v3 = [(UIViewController *)self _visualStyleOfContainingAlertController];
  if (v3)
  {
    id v4 = v3;
    [(_UIAlternateApplicationIconsAlertContentViewController *)self __updateWithVisualStyle:v3];
    id v3 = v4;
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIAlternateApplicationIconsAlertContentViewController;
  [(UIViewController *)&v4 didMoveToParentViewController:a3];
  [(_UIAlternateApplicationIconsAlertContentViewController *)self _updateWithContainingAlertControllerVisualStyle];
}

- (void)loadView
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v3 = (UILabel *)objc_opt_new();
  [(_UIAlternateApplicationIconsAlertContentViewController *)self _updateWithContainingAlertControllerVisualStyle];
  [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v4 = self;
  v34 = self;
  messageLabel = self->_messageLabel;
  v4->_messageLabel = v3;
  v32 = v3;

  v6 = _UIMainBundleIdentifier();
  uint64_t v7 = +[UIScreen mainScreen];
  [v7 scale];
  v33 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2);

  v8 = [[UIImageView alloc] initWithImage:v33];
  [(UIImageView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1148846080;
  [(UIView *)v8 setContentCompressionResistancePriority:0 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [(UIView *)v8 setContentCompressionResistancePriority:1 forAxis:v10];
  LODWORD(v11) = 1148846080;
  [(UIView *)v8 setContentHuggingPriority:0 forAxis:v11];
  v31 = v8;
  LODWORD(v12) = 1148846080;
  [(UIView *)v8 setContentHuggingPriority:1 forAxis:v12];
  v13 = [UIStackView alloc];
  v39[0] = v32;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v30 = [(UIStackView *)v13 initWithArrangedSubviews:v14];

  [(UIStackView *)v30 setAxis:1];
  [(UIStackView *)v30 setAlignment:3];
  [(UIStackView *)v30 setDistribution:3];
  [(UIStackView *)v30 setSpacing:8.0];
  v15 = [UIStackView alloc];
  v38[0] = v8;
  v38[1] = v30;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v17 = [(UIStackView *)v15 initWithArrangedSubviews:v16];

  [(UIStackView *)v17 setAxis:0];
  [(UIStackView *)v17 setAlignment:3];
  [(UIStackView *)v17 setDistribution:3];
  [(UIStackView *)v17 setSpacing:8.0];
  v18 = objc_opt_new();
  [v18 addSubview:v17];
  [(UIStackView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = @"hStackView";
  v37 = v17;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v19 = [(UIView *)v17 centerXAnchor];
  v20 = [v18 centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v35[0] = v21;
  v22 = [(UIView *)v17 centerYAnchor];
  v23 = [v18 centerYAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v35[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v26 = (void *)[v25 mutableCopy];

  v27 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-(spc)-[hStackView]-(spc)-|" options:0 metrics:&unk_1ED3F7A28 views:v29];
  [v26 addObjectsFromArray:v27];

  v28 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|-(spc)-[hStackView]-(spc)-|" options:0 metrics:&unk_1ED3F7A28 views:v29];
  [v26 addObjectsFromArray:v28];

  [MEMORY[0x1E4F5B268] activateConstraints:v26];
  [(UIViewController *)v34 setView:v18];
}

- (void).cxx_destruct
{
}

@end