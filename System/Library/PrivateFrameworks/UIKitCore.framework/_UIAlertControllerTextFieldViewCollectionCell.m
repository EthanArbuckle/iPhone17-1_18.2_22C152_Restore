@interface _UIAlertControllerTextFieldViewCollectionCell
- (_UIAlertControllerTextFieldView)textField;
- (_UIAlertControllerTextFieldViewCollectionCell)initWithFrame:(CGRect)a3;
- (id)preferredFocusedView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_selectButton:(id)a3;
- (void)prepareForReuse;
- (void)setTextField:(id)a3 horizontalMargin:(double)a4;
@end

@implementation _UIAlertControllerTextFieldViewCollectionCell

- (_UIAlertControllerTextFieldViewCollectionCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIAlertControllerTextFieldViewCollectionCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[UITapGestureRecognizer alloc] initWithTarget:v3 action:sel__selectButton_];
    selectButtonGesture = v3->_selectButtonGesture;
    v3->_selectButtonGesture = v4;

    [(UITapGestureRecognizer *)v3->_selectButtonGesture setAllowedPressTypes:&unk_1ED3EF080];
    [(UIView *)v3 addGestureRecognizer:v3->_selectButtonGesture];
    [(UICollectionReusableView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(UICollectionViewCell *)v3 contentView];
    [v6 setAutoresizingMask:18];
  }
  return v3;
}

- (void)setTextField:(id)a3 horizontalMargin:(double)a4
{
  v6 = (_UIAlertControllerTextFieldView *)a3;
  id v12 = [(UICollectionViewCell *)self contentView];
  [v12 addSubview:v6];
  v7 = [MEMORY[0x1E4F5B268] constraintWithItem:v12 attribute:8 relatedBy:0 toItem:v6 attribute:8 multiplier:1.0 constant:0.0];
  [v12 addConstraint:v7];

  objc_super v8 = [MEMORY[0x1E4F5B268] constraintWithItem:v6 attribute:1 relatedBy:0 toItem:v12 attribute:1 multiplier:1.0 constant:a4];
  [v12 addConstraint:v8];

  v9 = [MEMORY[0x1E4F5B268] constraintWithItem:v6 attribute:2 relatedBy:0 toItem:v12 attribute:2 multiplier:1.0 constant:-a4];
  [v12 addConstraint:v9];

  v10 = [MEMORY[0x1E4F5B268] constraintWithItem:v6 attribute:3 relatedBy:0 toItem:v12 attribute:3 multiplier:1.0 constant:0.0];
  [v12 addConstraint:v10];

  textField = self->_textField;
  self->_textField = v6;
}

- (_UIAlertControllerTextFieldView)textField
{
  return self->_textField;
}

- (void)prepareForReuse
{
  v3 = [(_UIAlertControllerTextFieldViewCollectionCell *)self textField];
  [v3 removeFromSuperview];

  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerTextFieldViewCollectionCell;
  [(UICollectionViewCell *)&v4 prepareForReuse];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  LODWORD(v9) = 1148846080;
  LODWORD(v11) = 1132068864;
  -[UICollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, v12, v9, v11);
  double v14 = v13;
  double v16 = v15;
  v17 = (void *)[v4 copy];

  objc_msgSend(v17, "setFrame:", v6, v8, v14, v16);
  return v17;
}

- (void)_selectButton:(id)a3
{
  if ([a3 state] == 3)
  {
    id v5 = [(_UIAlertControllerTextFieldViewCollectionCell *)self textField];
    id v4 = [v5 textField];
    [v4 becomeFirstResponder];
  }
}

- (id)preferredFocusedView
{
  return [(_UIAlertControllerTextFieldView *)self->_textField textField];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectButtonGesture, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end