@interface CRLiOSPresetCollectionViewLabeledCell
- (BOOL)labelHasDefaultLocalizedName;
- (NSLayoutConstraint)labelVerticalSpacingConstraint;
- (NSLayoutConstraint)presetViewLeadingConstraint;
- (NSLayoutConstraint)presetViewTrailingConstraint;
- (UIButton)presetButton;
- (UILabel)label;
- (UITextField)textField;
- (void)setLabel:(id)a3;
- (void)setLabelHasDefaultLocalizedName:(BOOL)a3;
- (void)setLabelVerticalSpacingConstraint:(id)a3;
- (void)setPresetButton:(id)a3;
- (void)setPresetViewLeadingConstraint:(id)a3;
- (void)setPresetViewTrailingConstraint:(id)a3;
- (void)setTextField:(id)a3;
@end

@implementation CRLiOSPresetCollectionViewLabeledCell

- (UIButton)presetButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presetButton);

  return (UIButton *)WeakRetained;
}

- (void)setPresetButton:(id)a3
{
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  return (UITextField *)WeakRetained;
}

- (void)setTextField:(id)a3
{
}

- (NSLayoutConstraint)labelVerticalSpacingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelVerticalSpacingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLabelVerticalSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)presetViewLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presetViewLeadingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setPresetViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)presetViewTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presetViewTrailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setPresetViewTrailingConstraint:(id)a3
{
}

- (BOOL)labelHasDefaultLocalizedName
{
  return self->_labelHasDefaultLocalizedName;
}

- (void)setLabelHasDefaultLocalizedName:(BOOL)a3
{
  self->_labelHasDefaultLocalizedName = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presetViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_presetViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_labelVerticalSpacingConstraint);
  objc_destroyWeak((id *)&self->_textField);
  objc_destroyWeak((id *)&self->_label);

  objc_destroyWeak((id *)&self->_presetButton);
}

@end