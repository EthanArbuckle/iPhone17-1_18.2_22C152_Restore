@interface _TVUISearchBar
+ (id)_clearGlyph;
+ (id)_searchGlyph;
+ (id)_tvmlKitBundle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _TVUISearchBar

+ (id)_tvmlKitBundle
{
  if (_tvmlKitBundle_onceToken != -1) {
    dispatch_once(&_tvmlKitBundle_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)_tvmlKitBundle_bundle;
  return v2;
}

+ (id)_clearGlyph
{
  if (_clearGlyph_onceToken != -1) {
    dispatch_once(&_clearGlyph_onceToken, &__block_literal_global_3_0);
  }
  v2 = (void *)_clearGlyph_clearGlpyh;
  return v2;
}

+ (id)_searchGlyph
{
  if (_searchGlyph_onceToken != -1) {
    dispatch_once(&_searchGlyph_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)_searchGlyph_searchGlyph;
  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_TVUISearchBar;
  [(_TVUISearchBar *)&v16 traitCollectionDidChange:a3];
  v4 = [(_TVUISearchBar *)self searchField];
  v5 = [v4 _placeholderLabel];
  [v4 _setRoundedRectBackgroundCornerRadius:6.0];
  v6 = [MEMORY[0x263F1C408] sharedApplication];
  v7 = [v6 preferredContentSizeCategory];
  int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  v9 = (void *)MEMORY[0x263F1D300];
  if (IsAccessibilityContentSizeCategory) {
    v9 = (void *)MEMORY[0x263F1D260];
  }
  v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*v9];
  [v4 setFont:v10];
  [v5 setFont:v10];
  v11 = [MEMORY[0x263F1C550] systemGrayColor];
  [v5 setTextColor:v11];

  v12 = [(id)objc_opt_class() _clearGlyph];
  v13 = [(id)objc_opt_class() _searchGlyph];
  [(_TVUISearchBar *)self setImage:v12 forSearchBarIcon:1 state:0];
  -[_TVUISearchBar setPositionAdjustment:forSearchBarIcon:](self, "setPositionAdjustment:forSearchBarIcon:", 1, -4.0, 0.0);
  v14 = [(_TVUISearchBar *)self searchField];
  v15 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v13];
  [v14 setLeftView:v15];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_TVUISearchBar;
  [(_TVUISearchBar *)&v8 layoutSubviews];
  v3 = [(_TVUISearchBar *)self searchField];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  [(_TVUISearchBar *)self bounds];
  objc_msgSend(v3, "setFrame:", v5, 0.0, v7, CGRectGetHeight(v9));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_TVUISearchBar;
  -[_TVUISearchBar sizeThatFits:](&v15, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3;
  double v5 = [MEMORY[0x263F1C408] sharedApplication];
  double v6 = [v5 preferredContentSizeCategory];
  int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  objc_super v8 = (void *)MEMORY[0x263F1D300];
  if (IsAccessibilityContentSizeCategory)
  {
    objc_super v8 = (void *)MEMORY[0x263F1D260];
    double v9 = 33.0;
  }
  else
  {
    double v9 = 44.0;
  }
  v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*v8];
  [v10 _scaledValueForValue:v9];
  double v12 = round(v11);

  double v13 = v4;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  double v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v5 = [v4 preferredLocalizations];
  double v6 = [v5 objectAtIndex:0];

  if ([&unk_26E59EBD8 containsObject:v6]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 3;
  }
  v8.receiver = self;
  v8.super_class = (Class)_TVUISearchBar;
  [(_TVUISearchBar *)&v8 setSemanticContentAttribute:v7];
}

@end