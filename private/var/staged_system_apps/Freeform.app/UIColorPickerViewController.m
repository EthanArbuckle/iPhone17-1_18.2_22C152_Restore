@interface UIColorPickerViewController
- (BOOL)p_isColorSpaceP3ForColor:(id)a3;
- (id)p_colorToSelectFromColorMatchingSelectedColorSpaceIfPossible:(id)a3;
- (void)crl_ifVisuallyDifferentSetSelectedColor:(id)a3;
- (void)crl_ifVisuallyDifferentSetSelectedColor:(id)a3 preservingColorSpaceIfPossible:(BOOL)a4;
@end

@implementation UIColorPickerViewController

- (void)crl_ifVisuallyDifferentSetSelectedColor:(id)a3
{
}

- (void)crl_ifVisuallyDifferentSetSelectedColor:(id)a3 preservingColorSpaceIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = v6;
  if (!v6
    || ([(UIColorPickerViewController *)self selectedColor],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v11 _isSimilarToColor:v7 withinPercentage:0.0009765625],
        v7,
        id v6 = v11,
        (v8 & 1) == 0))
  {
    id v9 = v6;
    if (v4)
    {
      uint64_t v10 = [(UIColorPickerViewController *)self p_colorToSelectFromColorMatchingSelectedColorSpaceIfPossible:v9];

      id v9 = (id)v10;
    }
    [(UIColorPickerViewController *)self setSelectedColor:v9];

    id v6 = v11;
  }
}

- (id)p_colorToSelectFromColorMatchingSelectedColorSpaceIfPossible:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(UIColorPickerViewController *)self p_isColorSpaceP3ForColor:v4];
  id v6 = [(UIColorPickerViewController *)self selectedColor];
  unsigned int v7 = [(UIColorPickerViewController *)self p_isColorSpaceP3ForColor:v6];

  id v8 = v4;
  id v9 = v8;
  uint64_t v10 = v8;
  if (v7)
  {
    uint64_t v10 = v8;
    if ((v5 & 1) == 0)
    {
      id v11 = v8;
      v12 = (CGColor *)[v11 CGColor];
      v13 = (CGColorSpace *)sub_10000FDD8();
      CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v13, kCGRenderingIntentDefault, v12, 0);
      uint64_t v10 = +[UIColor colorWithCGColor:CopyByMatchingToColorSpace];

      CGColorRelease(CopyByMatchingToColorSpace);
    }
  }

  return v10;
}

- (BOOL)p_isColorSpaceP3ForColor:(id)a3
{
  ColorSpace = CGColorGetColorSpace((CGColorRef)[a3 CGColor]);
  CFStringRef Name = CGColorSpaceGetName(ColorSpace);
  if (Name) {
    LOBYTE(Name) = CFEqual(Name, kCGColorSpaceDisplayP3) != 0;
  }
  return (char)Name;
}

@end