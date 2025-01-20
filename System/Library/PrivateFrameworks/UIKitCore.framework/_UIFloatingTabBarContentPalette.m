@interface _UIFloatingTabBarContentPalette
- (UIColor)highlightedColor;
- (UIColor)inactiveColor;
- (UIColor)selectedColor;
- (id)resolvedColorFromProvider:(id)a3;
- (void)setHighlightedColor:(id)a3;
- (void)setInactiveColor:(id)a3;
- (void)setSelectedColor:(id)a3;
@end

@implementation _UIFloatingTabBarContentPalette

- (id)resolvedColorFromProvider:(id)a3
{
  id v4 = a3;
  if ([v4 isEditing])
  {
    if ([v4 isCustomizableItem])
    {
      uint64_t v5 = +[UIColor labelColor];
      goto LABEL_12;
    }
  }
  else if (![v4 isDisabled])
  {
    if ([v4 hasSelectionHighlight])
    {
      uint64_t v5 = [(_UIFloatingTabBarContentPalette *)self selectedColor];
    }
    else
    {
      if ([v4 isHighlighted]) {
        [(_UIFloatingTabBarContentPalette *)self highlightedColor];
      }
      else {
      uint64_t v5 = [(_UIFloatingTabBarContentPalette *)self inactiveColor];
      }
    }
    goto LABEL_12;
  }
  uint64_t v5 = +[UIColor tertiaryLabelColor];
LABEL_12:
  v6 = (void *)v5;

  return v6;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (UIColor)inactiveColor
{
  return self->_inactiveColor;
}

- (void)setInactiveColor:(id)a3
{
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (void)setHighlightedColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
}

@end