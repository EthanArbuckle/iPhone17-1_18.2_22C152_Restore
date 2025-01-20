@interface BKLibraryBookshelfMainHeaderMetrics
+ (id)sectionName;
- (BOOL)sortHeaderStacked;
- (CGPoint)separatorLinePosition;
- (NSString)chevronName;
- (NSString)description;
- (NSString)iconName;
- (TUIFontAttributes)alternateTitleDetailsFontAttributes;
- (TUIFontAttributes)chevronFontAttributes;
- (TUIFontAttributes)cloudButtonFontAttributes;
- (TUIFontAttributes)collectionInfoLabelFontAttributes;
- (TUIFontAttributes)collectionsLabelFontAttributes;
- (TUIFontAttributes)editButtonFontAttributes;
- (TUIFontAttributes)footerFontAttributes;
- (TUIFontAttributes)iCloudBookStatusFontAttributes;
- (TUIFontAttributes)iCloudBookTitleFontAttributes;
- (TUIFontAttributes)iCloudButtonFontAttributes;
- (TUIFontAttributes)iCloudDescriptionFontAttributes;
- (TUIFontAttributes)iconFontAttributes;
- (TUIFontAttributes)largeTitleFontAttributes;
- (TUIFontAttributes)noBooksDescriptionFontAttributes;
- (TUIFontAttributes)noBooksDescriptionHeaderFontAttributes;
- (TUIFontAttributes)readingListButtonFontAttributes;
- (TUIFontAttributes)sortLabelFontAttributes;
- (TUIFontAttributes)sortPopupFontAttributes;
- (TUIFontAttributes)titleDetailsFontAttributes;
- (TUIFontAttributes)titleDetailsPlaceholderFontAttributes;
- (TUIFontAttributes)titleFontAttributes;
- (UIColor)gridButtonBackgroundColorOff;
- (UIColor)gridButtonBackgroundColorOn;
- (UIColor)gridButtonTintColorOff;
- (UIColor)gridButtonTintColorOn;
- (UIColor)headerBackgroundColor;
- (UIColor)iCloudButtonColor;
- (UIColor)readingBackgroundColor;
- (UIColor)readingListHighlightColor;
- (UIColor)separatorLineColor;
- (double)chevronSpacing;
- (double)cloudButtonSpacing;
- (double)collectionInfoHeaderVerticalMargin;
- (double)footerMargin;
- (double)iCloudButtonInset;
- (double)noBooksDescriptionSpacing;
- (double)noBooksDescriptionTopMargin;
- (double)noBooksDescriptionWidth;
- (double)readingListButtonPosition;
- (double)readingListHeight;
- (double)readingListImageSpacing;
- (double)readingListPadding;
- (double)sortButtonArrowMargin;
- (double)sortButtonSpacing;
- (double)sortHeaderHeight;
- (double)sortTitleSpacing;
- (double)titleDetailsBottomMargin;
- (double)titleDetailsMaxLines;
- (double)titleDetailsTopMargin;
- (void)configureWithSection:(id)a3;
- (void)setAlternateTitleDetailsFontAttributes:(id)a3;
- (void)setChevronFontAttributes:(id)a3;
- (void)setChevronName:(id)a3;
- (void)setChevronSpacing:(double)a3;
- (void)setCloudButtonFontAttributes:(id)a3;
- (void)setCloudButtonSpacing:(double)a3;
- (void)setCollectionInfoHeaderVerticalMargin:(double)a3;
- (void)setCollectionInfoLabelFontAttributes:(id)a3;
- (void)setCollectionsLabelFontAttributes:(id)a3;
- (void)setEditButtonFontAttributes:(id)a3;
- (void)setFooterFontAttributes:(id)a3;
- (void)setFooterMargin:(double)a3;
- (void)setGridButtonBackgroundColorOff:(id)a3;
- (void)setGridButtonBackgroundColorOn:(id)a3;
- (void)setGridButtonTintColorOff:(id)a3;
- (void)setGridButtonTintColorOn:(id)a3;
- (void)setHeaderBackgroundColor:(id)a3;
- (void)setICloudBookStatusFontAttributes:(id)a3;
- (void)setICloudBookTitleFontAttributes:(id)a3;
- (void)setICloudButtonColor:(id)a3;
- (void)setICloudButtonFontAttributes:(id)a3;
- (void)setICloudButtonInset:(double)a3;
- (void)setICloudDescriptionFontAttributes:(id)a3;
- (void)setIconFontAttributes:(id)a3;
- (void)setIconName:(id)a3;
- (void)setLargeTitleFontAttributes:(id)a3;
- (void)setNoBooksDescriptionFontAttributes:(id)a3;
- (void)setNoBooksDescriptionHeaderFontAttributes:(id)a3;
- (void)setNoBooksDescriptionSpacing:(double)a3;
- (void)setNoBooksDescriptionTopMargin:(double)a3;
- (void)setNoBooksDescriptionWidth:(double)a3;
- (void)setReadingBackgroundColor:(id)a3;
- (void)setReadingListButtonFontAttributes:(id)a3;
- (void)setReadingListButtonPosition:(double)a3;
- (void)setReadingListHeight:(double)a3;
- (void)setReadingListHighlightColor:(id)a3;
- (void)setReadingListImageSpacing:(double)a3;
- (void)setReadingListPadding:(double)a3;
- (void)setSeparatorLineColor:(id)a3;
- (void)setSeparatorLinePosition:(CGPoint)a3;
- (void)setSortButtonArrowMargin:(double)a3;
- (void)setSortButtonSpacing:(double)a3;
- (void)setSortHeaderHeight:(double)a3;
- (void)setSortHeaderStacked:(BOOL)a3;
- (void)setSortLabelFontAttributes:(id)a3;
- (void)setSortPopupFontAttributes:(id)a3;
- (void)setSortTitleSpacing:(double)a3;
- (void)setTitleDetailsBottomMargin:(double)a3;
- (void)setTitleDetailsFontAttributes:(id)a3;
- (void)setTitleDetailsMaxLines:(double)a3;
- (void)setTitleDetailsPlaceholderFontAttributes:(id)a3;
- (void)setTitleDetailsTopMargin:(double)a3;
- (void)setTitleFontAttributes:(id)a3;
@end

@implementation BKLibraryBookshelfMainHeaderMetrics

+ (id)sectionName
{
  return @"mainHeader";
}

- (void)configureWithSection:(id)a3
{
  id v4 = a3;
  [v4 floatForKey:@"title-details-top-margin"];
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsTopMargin:](self, "setTitleDetailsTopMargin:");
  [v4 floatForKey:@"title-details-bottom-margin"];
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsBottomMargin:](self, "setTitleDetailsBottomMargin:");
  [v4 floatForKey:@"title-details-lines"];
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsMaxLines:](self, "setTitleDetailsMaxLines:");
  [v4 floatForKey:@"footer-margin"];
  -[BKLibraryBookshelfMainHeaderMetrics setFooterMargin:](self, "setFooterMargin:");
  [v4 sizeForKey:@"separator-position"];
  -[BKLibraryBookshelfMainHeaderMetrics setSeparatorLinePosition:](self, "setSeparatorLinePosition:");
  v5 = [v4 colorForKey:@"separator-color"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setSeparatorLineColor:v5];

  [v4 floatForKey:@"reading-list-position"];
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListButtonPosition:](self, "setReadingListButtonPosition:");
  [v4 floatForKey:@"reading-list-padding"];
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListPadding:](self, "setReadingListPadding:");
  [v4 floatForKey:@"reading-list-height"];
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListHeight:](self, "setReadingListHeight:");
  [v4 floatForKey:@"reading-list-image-spacing"];
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListImageSpacing:](self, "setReadingListImageSpacing:");
  v6 = [v4 colorForKey:@"reading-list-background-color"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setReadingBackgroundColor:v6];

  v7 = [v4 colorForKey:@"header-background-color"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setHeaderBackgroundColor:v7];

  v8 = [v4 colorForKey:@"reading-list-highlight-color"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setReadingListHighlightColor:v8];

  v9 = [v4 colorForKey:@"grid-button-tint-color-on"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setGridButtonTintColorOn:v9];

  v10 = [v4 colorForKey:@"grid-button-tint-color-off"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setGridButtonTintColorOff:v10];

  v11 = [v4 colorForKey:@"grid-button-background-color-on"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setGridButtonBackgroundColorOn:v11];

  v12 = [v4 colorForKey:@"grid-button-background-color-off"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setGridButtonBackgroundColorOff:v12];

  [v4 floatForKey:@"nobooks-top-margin"];
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionTopMargin:](self, "setNoBooksDescriptionTopMargin:");
  [v4 floatForKey:@"nobooks-spacing"];
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionSpacing:](self, "setNoBooksDescriptionSpacing:");
  [v4 floatForKey:@"nobooks-description-width"];
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionWidth:](self, "setNoBooksDescriptionWidth:");
  [v4 floatForKey:@"sort-header-height"];
  -[BKLibraryBookshelfMainHeaderMetrics setSortHeaderHeight:](self, "setSortHeaderHeight:");
  [v4 floatForKey:@"info-header-vertical-margin"];
  -[BKLibraryBookshelfMainHeaderMetrics setCollectionInfoHeaderVerticalMargin:](self, "setCollectionInfoHeaderVerticalMargin:");
  [v4 floatForKey:@"sort-button-arrow-margin"];
  -[BKLibraryBookshelfMainHeaderMetrics setSortButtonArrowMargin:](self, "setSortButtonArrowMargin:");
  [v4 floatForKey:@"sort-button-spacing"];
  -[BKLibraryBookshelfMainHeaderMetrics setSortButtonSpacing:](self, "setSortButtonSpacing:");
  [v4 floatForKey:@"sort-title-spacing"];
  -[BKLibraryBookshelfMainHeaderMetrics setSortTitleSpacing:](self, "setSortTitleSpacing:");
  [v4 floatForKey:@"cloud-button-spacing"];
  -[BKLibraryBookshelfMainHeaderMetrics setCloudButtonSpacing:](self, "setCloudButtonSpacing:");
  -[BKLibraryBookshelfMainHeaderMetrics setSortHeaderStacked:](self, "setSortHeaderStacked:", [v4 BOOLForKey:@"sort-header-stacked"]);
  v13 = [v4 stringForKey:@"reading-list-icon-name"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setIconName:v13];

  v14 = [v4 fontSpecForKey:@"reading-list-icon-font-spec"];
  v15 = [v14 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setIconFontAttributes:v15];

  v16 = [v4 stringForKey:@"reading-list-chevron-name"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setChevronName:v16];

  v17 = [v4 fontSpecForKey:@"reading-list-chevron-font-spec"];
  v18 = [v17 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setChevronFontAttributes:v18];

  [v4 floatForKey:@"reading-list-chevron-spacing"];
  -[BKLibraryBookshelfMainHeaderMetrics setChevronSpacing:](self, "setChevronSpacing:");
  v19 = [v4 colorForKey:@"icloud-button-color"];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setICloudButtonColor:v19];

  [v4 floatForKey:@"icloud-button-text-inset"];
  -[BKLibraryBookshelfMainHeaderMetrics setICloudButtonInset:](self, "setICloudButtonInset:");
  v20 = [v4 fontSpecForKey:@"infoLabel"];
  v21 = [v20 attributesForAttributedStringCentered:1 truncated:1];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setCollectionInfoLabelFontAttributes:v21];

  v22 = [v4 fontSpecForKey:@"cloudButton"];
  v23 = [v22 attributesForAttributedStringCentered:1 truncated:1];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setCloudButtonFontAttributes:v23];

  v24 = [v4 fontSpecForKey:@"title"];
  v25 = [v24 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setTitleFontAttributes:v25];

  v26 = [v4 fontSpecForKey:@"largeTitle"];
  v27 = [v26 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setLargeTitleFontAttributes:v27];

  v28 = [v4 fontSpecForKey:@"titleDetails"];
  v29 = [v28 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setTitleDetailsFontAttributes:v29];

  v30 = [v4 fontSpecForKey:@"titleDetailsPlaceholder"];
  v31 = [v30 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setTitleDetailsPlaceholderFontAttributes:v31];

  v32 = [v4 fontSpecForKey:@"alternateTitleDetails"];
  v33 = [v32 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setAlternateTitleDetailsFontAttributes:v33];

  v34 = [v4 fontSpecForKey:@"footer"];
  v35 = [v34 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setFooterFontAttributes:v35];

  v36 = [v4 fontSpecForKey:@"readingList"];
  v37 = [v36 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setReadingListButtonFontAttributes:v37];

  v38 = [v4 fontSpecForKey:@"collectionsLabel"];
  v39 = [v38 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setCollectionsLabelFontAttributes:v39];

  v40 = [v4 fontSpecForKey:@"editButton"];
  v41 = [v40 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setEditButtonFontAttributes:v41];

  v42 = [v4 fontSpecForKey:@"noBooksDescriptionHeader"];
  v43 = [v42 attributesForAttributedStringCentered:1 truncated:1];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setNoBooksDescriptionHeaderFontAttributes:v43];

  v44 = [v4 fontSpecForKey:@"noBooksDescription"];
  v45 = [v44 attributesForAttributedStringCentered:1 truncated:0];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setNoBooksDescriptionFontAttributes:v45];

  v46 = [v4 fontSpecForKey:@"sortLabel"];
  v47 = [v46 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setSortLabelFontAttributes:v47];

  v48 = [v4 fontSpecForKey:@"sortPopup"];
  v49 = [v48 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setSortPopupFontAttributes:v49];

  v50 = [v4 fontSpecForKey:@"iCloudButton"];
  v51 = [v50 attributesForAttributedStringCentered:1 truncated:0];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setICloudButtonFontAttributes:v51];

  v52 = [v4 fontSpecForKey:@"iCloudDescription"];
  v53 = [v52 attributesForAttributedStringCentered:1 truncated:0];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setICloudDescriptionFontAttributes:v53];

  v54 = [v4 fontSpecForKey:@"iCloudBookStatus"];
  v55 = [v54 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setICloudBookStatusFontAttributes:v55];

  id v57 = [v4 fontSpecForKey:@"iCloudBookTitle"];

  v56 = [v57 attributesForAttributedString];
  [(BKLibraryBookshelfMainHeaderMetrics *)self setICloudBookTitleFontAttributes:v56];
}

- (NSString)description
{
  [(BKLibraryBookshelfMainHeaderMetrics *)self separatorLinePosition];
  uint64_t v4 = v3;
  [(BKLibraryBookshelfMainHeaderMetrics *)self separatorLinePosition];
  return +[NSString stringWithFormat:@"BKLibraryBookshelfMainHeaderMetrics: separatorLinePosition: %f,%f", v4, v5];
}

- (double)titleDetailsTopMargin
{
  return self->_titleDetailsTopMargin;
}

- (void)setTitleDetailsTopMargin:(double)a3
{
  self->_titleDetailsTopMargin = a3;
}

- (double)titleDetailsBottomMargin
{
  return self->_titleDetailsBottomMargin;
}

- (void)setTitleDetailsBottomMargin:(double)a3
{
  self->_titleDetailsBottomMargin = a3;
}

- (double)footerMargin
{
  return self->_footerMargin;
}

- (void)setFooterMargin:(double)a3
{
  self->_footerMargin = a3;
}

- (CGPoint)separatorLinePosition
{
  double x = self->_separatorLinePosition.x;
  double y = self->_separatorLinePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSeparatorLinePosition:(CGPoint)a3
{
  self->_separatorLinePosition = a3;
}

- (UIColor)separatorLineColor
{
  return self->_separatorLineColor;
}

- (void)setSeparatorLineColor:(id)a3
{
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
}

- (TUIFontAttributes)largeTitleFontAttributes
{
  return self->_largeTitleFontAttributes;
}

- (void)setLargeTitleFontAttributes:(id)a3
{
}

- (TUIFontAttributes)titleDetailsFontAttributes
{
  return self->_titleDetailsFontAttributes;
}

- (void)setTitleDetailsFontAttributes:(id)a3
{
}

- (TUIFontAttributes)titleDetailsPlaceholderFontAttributes
{
  return self->_titleDetailsPlaceholderFontAttributes;
}

- (void)setTitleDetailsPlaceholderFontAttributes:(id)a3
{
}

- (double)titleDetailsMaxLines
{
  return self->_titleDetailsMaxLines;
}

- (void)setTitleDetailsMaxLines:(double)a3
{
  self->_titleDetailsMaxLines = a3;
}

- (TUIFontAttributes)alternateTitleDetailsFontAttributes
{
  return self->_alternateTitleDetailsFontAttributes;
}

- (void)setAlternateTitleDetailsFontAttributes:(id)a3
{
}

- (TUIFontAttributes)footerFontAttributes
{
  return self->_footerFontAttributes;
}

- (void)setFooterFontAttributes:(id)a3
{
}

- (TUIFontAttributes)readingListButtonFontAttributes
{
  return self->_readingListButtonFontAttributes;
}

- (void)setReadingListButtonFontAttributes:(id)a3
{
}

- (TUIFontAttributes)collectionsLabelFontAttributes
{
  return self->_collectionsLabelFontAttributes;
}

- (void)setCollectionsLabelFontAttributes:(id)a3
{
}

- (TUIFontAttributes)editButtonFontAttributes
{
  return self->_editButtonFontAttributes;
}

- (void)setEditButtonFontAttributes:(id)a3
{
}

- (UIColor)gridButtonTintColorOn
{
  return self->_gridButtonTintColorOn;
}

- (void)setGridButtonTintColorOn:(id)a3
{
}

- (UIColor)gridButtonTintColorOff
{
  return self->_gridButtonTintColorOff;
}

- (void)setGridButtonTintColorOff:(id)a3
{
}

- (UIColor)gridButtonBackgroundColorOn
{
  return self->_gridButtonBackgroundColorOn;
}

- (void)setGridButtonBackgroundColorOn:(id)a3
{
}

- (UIColor)gridButtonBackgroundColorOff
{
  return self->_gridButtonBackgroundColorOff;
}

- (void)setGridButtonBackgroundColorOff:(id)a3
{
}

- (UIColor)headerBackgroundColor
{
  return self->_headerBackgroundColor;
}

- (void)setHeaderBackgroundColor:(id)a3
{
}

- (UIColor)readingListHighlightColor
{
  return self->_readingListHighlightColor;
}

- (void)setReadingListHighlightColor:(id)a3
{
}

- (double)readingListButtonPosition
{
  return self->_readingListButtonPosition;
}

- (void)setReadingListButtonPosition:(double)a3
{
  self->_readingListButtonPosition = a3;
}

- (double)readingListHeight
{
  return self->_readingListHeight;
}

- (void)setReadingListHeight:(double)a3
{
  self->_readingListHeight = a3;
}

- (double)readingListPadding
{
  return self->_readingListPadding;
}

- (void)setReadingListPadding:(double)a3
{
  self->_readingListPadding = a3;
}

- (double)readingListImageSpacing
{
  return self->_readingListImageSpacing;
}

- (void)setReadingListImageSpacing:(double)a3
{
  self->_readingListImageSpacing = a3;
}

- (UIColor)readingBackgroundColor
{
  return self->_readingBackgroundColor;
}

- (void)setReadingBackgroundColor:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (TUIFontAttributes)iconFontAttributes
{
  return self->_iconFontAttributes;
}

- (void)setIconFontAttributes:(id)a3
{
}

- (double)chevronSpacing
{
  return self->_chevronSpacing;
}

- (void)setChevronSpacing:(double)a3
{
  self->_chevronSpacing = a3;
}

- (NSString)chevronName
{
  return self->_chevronName;
}

- (void)setChevronName:(id)a3
{
}

- (TUIFontAttributes)chevronFontAttributes
{
  return self->_chevronFontAttributes;
}

- (void)setChevronFontAttributes:(id)a3
{
}

- (TUIFontAttributes)noBooksDescriptionHeaderFontAttributes
{
  return self->_noBooksDescriptionHeaderFontAttributes;
}

- (void)setNoBooksDescriptionHeaderFontAttributes:(id)a3
{
}

- (TUIFontAttributes)noBooksDescriptionFontAttributes
{
  return self->_noBooksDescriptionFontAttributes;
}

- (void)setNoBooksDescriptionFontAttributes:(id)a3
{
}

- (double)noBooksDescriptionTopMargin
{
  return self->_noBooksDescriptionTopMargin;
}

- (void)setNoBooksDescriptionTopMargin:(double)a3
{
  self->_noBooksDescriptionTopMargin = a3;
}

- (double)noBooksDescriptionSpacing
{
  return self->_noBooksDescriptionSpacing;
}

- (void)setNoBooksDescriptionSpacing:(double)a3
{
  self->_noBooksDescriptionSpacing = a3;
}

- (double)noBooksDescriptionWidth
{
  return self->_noBooksDescriptionWidth;
}

- (void)setNoBooksDescriptionWidth:(double)a3
{
  self->_noBooksDescriptionWidth = a3;
}

- (double)collectionInfoHeaderVerticalMargin
{
  return self->_collectionInfoHeaderVerticalMargin;
}

- (void)setCollectionInfoHeaderVerticalMargin:(double)a3
{
  self->_collectionInfoHeaderVerticalMargin = a3;
}

- (double)sortHeaderHeight
{
  return self->_sortHeaderHeight;
}

- (void)setSortHeaderHeight:(double)a3
{
  self->_sortHeaderHeight = a3;
}

- (BOOL)sortHeaderStacked
{
  return self->_sortHeaderStacked;
}

- (void)setSortHeaderStacked:(BOOL)a3
{
  self->_sortHeaderStacked = a3;
}

- (double)sortButtonArrowMargin
{
  return self->_sortButtonArrowMargin;
}

- (void)setSortButtonArrowMargin:(double)a3
{
  self->_sortButtonArrowMargin = a3;
}

- (double)sortButtonSpacing
{
  return self->_sortButtonSpacing;
}

- (void)setSortButtonSpacing:(double)a3
{
  self->_sortButtonSpacing = a3;
}

- (double)sortTitleSpacing
{
  return self->_sortTitleSpacing;
}

- (void)setSortTitleSpacing:(double)a3
{
  self->_sortTitleSpacing = a3;
}

- (TUIFontAttributes)sortLabelFontAttributes
{
  return self->_sortLabelFontAttributes;
}

- (void)setSortLabelFontAttributes:(id)a3
{
}

- (TUIFontAttributes)collectionInfoLabelFontAttributes
{
  return self->_collectionInfoLabelFontAttributes;
}

- (void)setCollectionInfoLabelFontAttributes:(id)a3
{
}

- (TUIFontAttributes)cloudButtonFontAttributes
{
  return self->_cloudButtonFontAttributes;
}

- (void)setCloudButtonFontAttributes:(id)a3
{
}

- (double)cloudButtonSpacing
{
  return self->_cloudButtonSpacing;
}

- (void)setCloudButtonSpacing:(double)a3
{
  self->_cloudButtonSpacing = a3;
}

- (TUIFontAttributes)sortPopupFontAttributes
{
  return self->_sortPopupFontAttributes;
}

- (void)setSortPopupFontAttributes:(id)a3
{
}

- (TUIFontAttributes)iCloudButtonFontAttributes
{
  return self->_iCloudButtonFontAttributes;
}

- (void)setICloudButtonFontAttributes:(id)a3
{
}

- (TUIFontAttributes)iCloudDescriptionFontAttributes
{
  return self->_iCloudDescriptionFontAttributes;
}

- (void)setICloudDescriptionFontAttributes:(id)a3
{
}

- (TUIFontAttributes)iCloudBookStatusFontAttributes
{
  return self->_iCloudBookStatusFontAttributes;
}

- (void)setICloudBookStatusFontAttributes:(id)a3
{
}

- (TUIFontAttributes)iCloudBookTitleFontAttributes
{
  return self->_iCloudBookTitleFontAttributes;
}

- (void)setICloudBookTitleFontAttributes:(id)a3
{
}

- (UIColor)iCloudButtonColor
{
  return self->_iCloudButtonColor;
}

- (void)setICloudButtonColor:(id)a3
{
}

- (double)iCloudButtonInset
{
  return self->_iCloudButtonInset;
}

- (void)setICloudButtonInset:(double)a3
{
  self->_iCloudButtonInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudButtonColor, 0);
  objc_storeStrong((id *)&self->_iCloudBookTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_iCloudBookStatusFontAttributes, 0);
  objc_storeStrong((id *)&self->_iCloudDescriptionFontAttributes, 0);
  objc_storeStrong((id *)&self->_iCloudButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_sortPopupFontAttributes, 0);
  objc_storeStrong((id *)&self->_cloudButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_collectionInfoLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_sortLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_noBooksDescriptionFontAttributes, 0);
  objc_storeStrong((id *)&self->_noBooksDescriptionHeaderFontAttributes, 0);
  objc_storeStrong((id *)&self->_chevronFontAttributes, 0);
  objc_storeStrong((id *)&self->_chevronName, 0);
  objc_storeStrong((id *)&self->_iconFontAttributes, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_readingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_readingListHighlightColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gridButtonBackgroundColorOff, 0);
  objc_storeStrong((id *)&self->_gridButtonBackgroundColorOn, 0);
  objc_storeStrong((id *)&self->_gridButtonTintColorOff, 0);
  objc_storeStrong((id *)&self->_gridButtonTintColorOn, 0);
  objc_storeStrong((id *)&self->_editButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_collectionsLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_readingListButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_footerFontAttributes, 0);
  objc_storeStrong((id *)&self->_alternateTitleDetailsFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDetailsPlaceholderFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDetailsFontAttributes, 0);
  objc_storeStrong((id *)&self->_largeTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);

  objc_storeStrong((id *)&self->_separatorLineColor, 0);
}

@end