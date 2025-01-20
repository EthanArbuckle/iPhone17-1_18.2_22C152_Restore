@interface WFParameterValuePickerTableViewCellConfiguration
- (BOOL)disablesSeparatorIconInset;
- (BOOL)forceImageScaling;
- (BOOL)isContainedInState;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesInsetGroupedTableStyle;
- (BOOL)usesToggleForSelection;
- (NSString)secondaryText;
- (NSString)text;
- (UIColor)secondaryTextColor;
- (UIColor)textColor;
- (UIFont)secondaryTextFont;
- (UIFont)textFont;
- (UIViewController)parentViewController;
- (WFIcon)icon;
- (WFImage)image;
- (WFParameterValuePickerTableViewCellDelegate)delegate;
- (double)cornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)makeContentView;
- (unint64_t)hash;
- (void)setContainedInState:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablesSeparatorIconInset:(BOOL)a3;
- (void)setForceImageScaling:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setSecondaryTextFont:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFont:(id)a3;
- (void)setUsesInsetGroupedTableStyle:(BOOL)a3;
- (void)setUsesToggleForSelection:(BOOL)a3;
@end

@implementation WFParameterValuePickerTableViewCellConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_secondaryTextFont, 0);
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setDelegate:(id)a3
{
}

- (WFParameterValuePickerTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFParameterValuePickerTableViewCellDelegate *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setDisablesSeparatorIconInset:(BOOL)a3
{
  self->_disablesSeparatorIconInset = a3;
}

- (BOOL)disablesSeparatorIconInset
{
  return self->_disablesSeparatorIconInset;
}

- (void)setUsesInsetGroupedTableStyle:(BOOL)a3
{
  self->_usesInsetGroupedTableStyle = a3;
}

- (BOOL)usesInsetGroupedTableStyle
{
  return self->_usesInsetGroupedTableStyle;
}

- (void)setForceImageScaling:(BOOL)a3
{
  self->_forceImageScaling = a3;
}

- (BOOL)forceImageScaling
{
  return self->_forceImageScaling;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setIcon:(id)a3
{
}

- (WFIcon)icon
{
  return self->_icon;
}

- (void)setImage:(id)a3
{
}

- (WFImage)image
{
  return self->_image;
}

- (void)setSecondaryTextFont:(id)a3
{
}

- (UIFont)secondaryTextFont
{
  return self->_secondaryTextFont;
}

- (void)setTextFont:(id)a3
{
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (void)setUsesToggleForSelection:(BOOL)a3
{
  self->_usesToggleForSelection = a3;
}

- (BOOL)usesToggleForSelection
{
  return self->_usesToggleForSelection;
}

- (void)setContainedInState:(BOOL)a3
{
  self->_containedInState = a3;
}

- (BOOL)isContainedInState
{
  return self->_containedInState;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setSecondaryText:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)hash
{
  v28 = [(WFParameterValuePickerTableViewCellConfiguration *)self text];
  uint64_t v3 = [v28 hash];
  v27 = [(WFParameterValuePickerTableViewCellConfiguration *)self secondaryText];
  uint64_t v4 = [v27 hash] ^ v3;
  v26 = [(WFParameterValuePickerTableViewCellConfiguration *)self textColor];
  uint64_t v5 = [v26 hash];
  v6 = [(WFParameterValuePickerTableViewCellConfiguration *)self secondaryTextColor];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  v8 = [(WFParameterValuePickerTableViewCellConfiguration *)self textFont];
  uint64_t v9 = [v8 hash];
  v10 = [(WFParameterValuePickerTableViewCellConfiguration *)self secondaryTextFont];
  uint64_t v11 = v9 ^ [v10 hash];
  if ([(WFParameterValuePickerTableViewCellConfiguration *)self isContainedInState]) {
    uint64_t v12 = 3133065982;
  }
  else {
    uint64_t v12 = 3405691582;
  }
  uint64_t v13 = v7 ^ v11 ^ v12;
  if ([(WFParameterValuePickerTableViewCellConfiguration *)self usesToggleForSelection]) {
    uint64_t v14 = 3405691582;
  }
  else {
    uint64_t v14 = 3133065982;
  }
  v15 = [(WFParameterValuePickerTableViewCellConfiguration *)self image];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(WFParameterValuePickerTableViewCellConfiguration *)self icon];
  uint64_t v18 = v13 ^ v16 ^ [v17 hash];
  [(WFParameterValuePickerTableViewCellConfiguration *)self cornerRadius];
  unint64_t v20 = (unint64_t)v19;
  if ([(WFParameterValuePickerTableViewCellConfiguration *)self forceImageScaling]) {
    uint64_t v21 = 3405691582;
  }
  else {
    uint64_t v21 = 3133065982;
  }
  uint64_t v22 = v18 ^ v21;
  v23 = [(WFParameterValuePickerTableViewCellConfiguration *)self parentViewController];
  unint64_t v24 = v22 ^ [v23 hash] ^ v20;

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFParameterValuePickerTableViewCellConfiguration *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v19 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [(WFParameterValuePickerTableViewCellConfiguration *)self text];
      v8 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 text];
      if ([v7 isEqualToString:v8])
      {
        uint64_t v9 = [(WFParameterValuePickerTableViewCellConfiguration *)self secondaryText];
        v10 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 secondaryText];
        if ([v9 isEqualToString:v10])
        {
          uint64_t v11 = [(WFParameterValuePickerTableViewCellConfiguration *)self textColor];
          uint64_t v12 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 textColor];
          if ([v11 isEqual:v12])
          {
            uint64_t v13 = [(WFParameterValuePickerTableViewCellConfiguration *)self secondaryTextColor];
            v36 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 secondaryTextColor];
            v37 = v13;
            if ([v13 isEqual:v36])
            {
              uint64_t v14 = [(WFParameterValuePickerTableViewCellConfiguration *)self textFont];
              v34 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 textFont];
              v35 = v14;
              if ([v14 isEqual:v34])
              {
                uint64_t v15 = [(WFParameterValuePickerTableViewCellConfiguration *)self secondaryTextFont];
                uint64_t v16 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 secondaryTextFont];
                v33 = (void *)v15;
                v17 = (void *)v15;
                uint64_t v18 = (void *)v16;
                if ([v17 isEqual:v16]
                  && (BOOL v30 = [(WFParameterValuePickerTableViewCellConfiguration *)self isContainedInState], v30 == [(WFParameterValuePickerTableViewCellConfiguration *)v6 isContainedInState])&& (v31 = [(WFParameterValuePickerTableViewCellConfiguration *)self usesToggleForSelection], v31 == [(WFParameterValuePickerTableViewCellConfiguration *)v6 usesToggleForSelection]))
                {
                  v32 = [(WFParameterValuePickerTableViewCellConfiguration *)self image];
                  v29 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 image];
                  if (objc_msgSend(v32, "isEqual:"))
                  {
                    v28 = [(WFParameterValuePickerTableViewCellConfiguration *)self icon];
                    v27 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 icon];
                    if (objc_msgSend(v28, "isEqual:")
                      && ([(WFParameterValuePickerTableViewCellConfiguration *)self cornerRadius],
                          double v22 = v21,
                          [(WFParameterValuePickerTableViewCellConfiguration *)v6 cornerRadius],
                          v22 == v23)
                      && (BOOL v25 = [(WFParameterValuePickerTableViewCellConfiguration *)self forceImageScaling], v25 == [(WFParameterValuePickerTableViewCellConfiguration *)v6 forceImageScaling]))
                    {
                      v26 = [(WFParameterValuePickerTableViewCellConfiguration *)self parentViewController];
                      unint64_t v24 = [(WFParameterValuePickerTableViewCellConfiguration *)v6 parentViewController];
                      BOOL v19 = v26 == v24;
                    }
                    else
                    {
                      BOOL v19 = 0;
                    }
                  }
                  else
                  {
                    BOOL v19 = 0;
                  }
                }
                else
                {
                  BOOL v19 = 0;
                }
              }
              else
              {
                BOOL v19 = 0;
              }
            }
            else
            {
              BOOL v19 = 0;
            }
          }
          else
          {
            BOOL v19 = 0;
          }
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_text copy];
    v6 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v5;

    uint64_t v7 = [(NSString *)self->_secondaryText copy];
    v8 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v7;

    objc_storeStrong((id *)(v4 + 32), self->_textColor);
    objc_storeStrong((id *)(v4 + 40), self->_secondaryTextColor);
    *(unsigned char *)(v4 + 8) = self->_containedInState;
    *(unsigned char *)(v4 + 9) = self->_usesToggleForSelection;
    objc_storeStrong((id *)(v4 + 48), self->_textFont);
    objc_storeStrong((id *)(v4 + 56), self->_secondaryTextFont);
    objc_storeStrong((id *)(v4 + 64), self->_image);
    objc_storeStrong((id *)(v4 + 72), self->_icon);
    *(double *)(v4 + 80) = self->_cornerRadius;
    *(unsigned char *)(v4 + 10) = self->_forceImageScaling;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    objc_storeWeak((id *)(v4 + 88), WeakRetained);
  }
  return (id)v4;
}

- (id)makeContentView
{
  v2 = [[WFParameterValuePickerTableViewCellContentView alloc] initWithConfiguration:self];
  return v2;
}

@end