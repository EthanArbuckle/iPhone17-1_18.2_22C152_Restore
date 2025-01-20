@interface _UITableViewCellVerticalSeparator
- (BOOL)_shouldDrawThickSeparators;
- (BOOL)_shouldReplaceWithFixedPadding;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_UITableViewCellVerticalSeparator)initWithFrame:(CGRect)a3;
- (void)_traitsUserInterfaceIdiomDidChange;
@end

@implementation _UITableViewCellVerticalSeparator

- (_UITableViewCellVerticalSeparator)initWithFrame:(CGRect)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UITableViewCellVerticalSeparator;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor tableSeparatorLightColor];
    [(UIView *)v3 setBackgroundColor:v4];

    v5 = [(UIView *)v3 layer];
    [v5 setAllowsEdgeAntialiasing:1];

    [(UIView *)v3 setHidden:[(_UITableViewCellVerticalSeparator *)v3 _shouldReplaceWithFixedPadding]];
    v10[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = [(UIView *)v3 registerForTraitChanges:v6 withAction:sel__traitsUserInterfaceIdiomDidChange];
  }
  return v3;
}

- (BOOL)_shouldReplaceWithFixedPadding
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 6;

  return v3;
}

- (void)_traitsUserInterfaceIdiomDidChange
{
  [(UIView *)self setHidden:[(_UITableViewCellVerticalSeparator *)self _shouldReplaceWithFixedPadding]];
  [(UIView *)self layoutIfNeeded];
}

- (BOOL)_shouldDrawThickSeparators
{
  int v2 = dyld_program_sdk_at_least();
  if (v2)
  {
    BOOL v3 = [(id)UIApp preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    LOBYTE(v2) = IsAccessibilityCategory;
  }
  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  if ([(_UITableViewCellVerticalSeparator *)self _shouldReplaceWithFixedPadding])
  {
    v5 = [(UIView *)self traitCollection];
    v6 = _UITableConstantsForTraitCollection(v5);

    [v6 defaultVerticalAccessorySeparatorReplacementPaddingWidth];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.0;
    if (![(_UITableViewCellVerticalSeparator *)self _shouldDrawThickSeparators])
    {
      [(UIView *)self _currentScreenScale];
      double v8 = 1.0 / v9;
    }
  }
  double v10 = v8;
  double v11 = height;
  result.CGFloat height = v11;
  result.width = v10;
  return result;
}

@end