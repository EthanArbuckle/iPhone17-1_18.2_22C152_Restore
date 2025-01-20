@interface PUIStylePickerSelectionChange
- (BOOL)hasChanges;
- (NSNumber)fontWeight;
- (NSNumber)isSuggestedStyle;
- (NSNumber)isSystemItem;
- (NSNumber)preferredAlignment;
- (NSNumber)preferredLayout;
- (NSString)fontIdentifier;
- (PUINumberingSystem)numberingSystem;
- (PUIStyle)style;
- (UIFont)customFont;
- (void)setCustomFont:(id)a3;
- (void)setFontIdentifier:(id)a3;
- (void)setFontWeight:(id)a3;
- (void)setNumberingSystem:(id)a3;
- (void)setPreferredAlignment:(id)a3;
- (void)setPreferredLayout:(id)a3;
- (void)setStyle:(id)a3;
- (void)setSuggestedStyle:(id)a3;
- (void)setSystemItem:(id)a3;
@end

@implementation PUIStylePickerSelectionChange

- (BOOL)hasChanges
{
  unsigned int outCount = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = class_copyPropertyList(v3, &outCount);
  if (outCount)
  {
    uint64_t v5 = 0;
    while (1)
    {
      Name = property_getName(v4[v5]);
      if (Name)
      {
        v7 = (NSString *)[[NSString alloc] initWithUTF8String:Name];
        SEL v8 = NSSelectorFromString(v7);

        v9 = ((void (*)(PUIStylePickerSelectionChange *, SEL))[(PUIStylePickerSelectionChange *)self methodForSelector:v8])(self, v8);

        if (v9) {
          break;
        }
      }
      if (++v5 >= (unint64_t)outCount) {
        goto LABEL_6;
      }
    }
    BOOL v10 = 1;
  }
  else
  {
LABEL_6:
    BOOL v10 = 0;
  }
  free(v4);
  return v10;
}

- (NSString)fontIdentifier
{
  return self->_fontIdentifier;
}

- (void)setFontIdentifier:(id)a3
{
}

- (NSNumber)preferredAlignment
{
  return self->_preferredAlignment;
}

- (void)setPreferredAlignment:(id)a3
{
}

- (NSNumber)preferredLayout
{
  return self->_preferredLayout;
}

- (void)setPreferredLayout:(id)a3
{
}

- (NSNumber)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(id)a3
{
}

- (NSNumber)isSystemItem
{
  return self->_isSystemItem;
}

- (void)setSystemItem:(id)a3
{
}

- (UIFont)customFont
{
  return self->_customFont;
}

- (void)setCustomFont:(id)a3
{
}

- (PUINumberingSystem)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(id)a3
{
}

- (PUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (NSNumber)isSuggestedStyle
{
  return self->_isSuggestedStyle;
}

- (void)setSuggestedStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isSuggestedStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_customFont, 0);
  objc_storeStrong((id *)&self->_isSystemItem, 0);
  objc_storeStrong((id *)&self->_fontWeight, 0);
  objc_storeStrong((id *)&self->_preferredLayout, 0);
  objc_storeStrong((id *)&self->_preferredAlignment, 0);
  objc_storeStrong((id *)&self->_fontIdentifier, 0);
}

@end