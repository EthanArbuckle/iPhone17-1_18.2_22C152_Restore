@interface _UICollectionViewOutlineCell
- (BOOL)automaticallyTogglesExpansionState;
- (BOOL)selectionFollowsTintColor;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (UIView)outlineContentView;
- (_UICollectionViewOutlineCellDisclosureConfiguration)disclosureConfiguration;
- (double)highlightCornerRadius;
- (id)disclosureWasTappedHandler;
- (void)setAutomaticallyTogglesExpansionState:(BOOL)a3;
- (void)setDisclosureConfiguration:(id)a3;
- (void)setDisclosureWasTappedHandler:(id)a3;
- (void)setHighlightCornerRadius:(double)a3;
- (void)setOutlineContentView:(id)a3;
- (void)setSelectionFollowsTintColor:(BOOL)a3;
@end

@implementation _UICollectionViewOutlineCell

- (UIView)outlineContentView
{
  return self->_outlineContentView;
}

- (void)setOutlineContentView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)automaticallyTogglesExpansionState
{
  return self->_automaticallyTogglesExpansionState;
}

- (void)setAutomaticallyTogglesExpansionState:(BOOL)a3
{
  self->_automaticallyTogglesExpansionState = a3;
}

- (_UICollectionViewOutlineCellDisclosureConfiguration)disclosureConfiguration
{
  return self->_disclosureConfiguration;
}

- (void)setDisclosureConfiguration:(id)a3
{
}

- (id)disclosureWasTappedHandler
{
  return self->_disclosureWasTappedHandler;
}

- (void)setDisclosureWasTappedHandler:(id)a3
{
}

- (double)highlightCornerRadius
{
  return self->_highlightCornerRadius;
}

- (void)setHighlightCornerRadius:(double)a3
{
  self->_highlightCornerRadius = a3;
}

- (BOOL)selectionFollowsTintColor
{
  return self->_selectionFollowsTintColor;
}

- (void)setSelectionFollowsTintColor:(BOOL)a3
{
  self->_selectionFollowsTintColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disclosureWasTappedHandler, 0);
  objc_storeStrong((id *)&self->_disclosureConfiguration, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_outlineContentView, 0);
}

@end