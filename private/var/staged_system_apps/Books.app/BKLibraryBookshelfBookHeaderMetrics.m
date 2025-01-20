@interface BKLibraryBookshelfBookHeaderMetrics
+ (id)sectionName;
- (NSString)description;
- (TUIFontAttributes)headerFontAttributes;
- (TUIFontAttributes)largeHeaderFontAttributes;
- (double)bottomMargin;
- (double)sectionHeaderHeight;
- (double)topMargin;
- (void)configureWithSection:(id)a3;
- (void)setBottomMargin:(double)a3;
- (void)setHeaderFontAttributes:(id)a3;
- (void)setLargeHeaderFontAttributes:(id)a3;
- (void)setSectionHeaderHeight:(double)a3;
- (void)setTopMargin:(double)a3;
@end

@implementation BKLibraryBookshelfBookHeaderMetrics

+ (id)sectionName
{
  return @"bookHeader";
}

- (void)configureWithSection:(id)a3
{
  id v4 = a3;
  [v4 floatForKey:@"top-margin"];
  -[BKLibraryBookshelfBookHeaderMetrics setTopMargin:](self, "setTopMargin:");
  [v4 floatForKey:@"bottom-margin"];
  -[BKLibraryBookshelfBookHeaderMetrics setBottomMargin:](self, "setBottomMargin:");
  [v4 floatForKey:@"section-header-height"];
  -[BKLibraryBookshelfBookHeaderMetrics setSectionHeaderHeight:](self, "setSectionHeaderHeight:");
  v5 = [v4 fontSpecForKey:@"header"];
  v6 = [v5 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfBookHeaderMetrics *)self setHeaderFontAttributes:v6];

  id v8 = [v4 fontSpecForKey:@"largeHeader"];

  v7 = [v8 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfBookHeaderMetrics *)self setLargeHeaderFontAttributes:v7];
}

- (NSString)description
{
  [(BKLibraryBookshelfBookHeaderMetrics *)self topMargin];
  uint64_t v4 = v3;
  [(BKLibraryBookshelfBookHeaderMetrics *)self bottomMargin];
  return +[NSString stringWithFormat:@"BKLibraryBookshelfBookHeaderMetrics: topMargin: %f, bottomMargin: %f", v4, v5];
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_sectionHeaderHeight = a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (TUIFontAttributes)headerFontAttributes
{
  return self->_headerFontAttributes;
}

- (void)setHeaderFontAttributes:(id)a3
{
}

- (TUIFontAttributes)largeHeaderFontAttributes
{
  return self->_largeHeaderFontAttributes;
}

- (void)setLargeHeaderFontAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeHeaderFontAttributes, 0);

  objc_storeStrong((id *)&self->_headerFontAttributes, 0);
}

@end