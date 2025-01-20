@interface UITableViewIndexVisualStyle_iOS
+ (id)containerViewForTableViewIndex:(id)a3;
- (UIFont)font;
- (UITableViewIndex)tableViewIndex;
- (UITableViewIndexVisualStyle_iOS)initWithTableViewIndex:(id)a3;
- (double)_lineSpacingForCurrentIdiom;
- (double)indexWidth;
- (double)minLineSpacing;
- (double)verticalTextHeightEstimate;
- (void)legibilityWeightOrPreferredContentSizeUpdated;
- (void)setFont:(id)a3;
- (void)setTableViewIndex:(id)a3;
- (void)setVerticalTextHeightEstimate:(double)a3;
@end

@implementation UITableViewIndexVisualStyle_iOS

+ (id)containerViewForTableViewIndex:(id)a3
{
  return 0;
}

- (UITableViewIndexVisualStyle_iOS)initWithTableViewIndex:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewIndexVisualStyle_iOS;
  id v3 = a3;
  v4 = [(UITableViewIndexVisualStyle_iOS *)&v7 init];
  -[UITableViewIndexVisualStyle_iOS setTableViewIndex:](v4, "setTableViewIndex:", v3, v7.receiver, v7.super_class);

  v5 = [off_1E52D39B8 boldSystemFontOfSize:11.0];
  [(UITableViewIndexVisualStyle_iOS *)v4 setFont:v5];

  [(UITableViewIndexVisualStyle_iOS *)v4 setVerticalTextHeightEstimate:0.0];
  return v4;
}

- (void)setFont:(id)a3
{
  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    [(UITableViewIndexVisualStyle_iOS *)self setVerticalTextHeightEstimate:0.0];
    v5 = v6;
  }
}

- (double)indexWidth
{
  v2 = [(UITableViewIndexVisualStyle_iOS *)self tableViewIndex];
  id v3 = [v2 traitCollection];

  double v4 = _UIDefaultIndexBarWidthForTraitCollection(v3);
  return v4;
}

- (double)_lineSpacingForCurrentIdiom
{
  v2 = [(UITableViewIndexVisualStyle_iOS *)self tableViewIndex];
  id v3 = [v2 traitCollection];
  if (([v3 userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v4 = 16.0;
  }
  else {
    double v4 = 6.0;
  }

  return v4;
}

- (double)minLineSpacing
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (self->_verticalTextHeightEstimate == 0.0)
  {
    uint64_t v12 = *(void *)off_1E52D2040;
    id v3 = [(UITableViewIndexVisualStyle_iOS *)self font];
    v13[0] = v3;
    double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    CFAttributedStringRef v5 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:0x1ED183200 attributes:v4];
    v6 = CTLineCreateWithAttributedString(v5);
    if (v6)
    {
      objc_super v7 = v6;
      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v6, 8uLL);
      -[UITableViewIndexVisualStyle_iOS setVerticalTextHeightEstimate:](self, "setVerticalTextHeightEstimate:", BoundsWithOptions.size.height, BoundsWithOptions.origin.y, BoundsWithOptions.size.width);
      CFRelease(v7);
    }
  }
  [(UITableViewIndexVisualStyle_iOS *)self verticalTextHeightEstimate];
  double v9 = v8;
  [(UITableViewIndexVisualStyle_iOS *)self _lineSpacingForCurrentIdiom];
  return v9 + v10;
}

- (void)legibilityWeightOrPreferredContentSizeUpdated
{
  self->_verticalTextHeightEstimate = 0.0;
}

- (UITableViewIndex)tableViewIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewIndex);
  return (UITableViewIndex *)WeakRetained;
}

- (void)setTableViewIndex:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (double)verticalTextHeightEstimate
{
  return self->_verticalTextHeightEstimate;
}

- (void)setVerticalTextHeightEstimate:(double)a3
{
  self->_verticalTextHeightEstimate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_tableViewIndex);
}

@end