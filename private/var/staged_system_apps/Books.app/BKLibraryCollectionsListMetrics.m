@interface BKLibraryCollectionsListMetrics
+ (id)sectionName;
- (BOOL)darkAppearance;
- (CGSize)collectionIconSize;
- (NSString)chevronName;
- (NSString)collectionIconName_Add;
- (NSString)collectionIconName_Audiobooks;
- (NSString)collectionIconName_Books;
- (NSString)collectionIconName_Downloaded;
- (NSString)collectionIconName_Finished;
- (NSString)collectionIconName_PDFs;
- (NSString)collectionIconName_Samples;
- (NSString)collectionIconName_User;
- (NSString)collectionIconName_WantToRead;
- (TUIFontAttributes)chevronFontAttributes;
- (TUIFontAttributes)tableCellDetailDimmedTextFontAttributes;
- (TUIFontAttributes)tableCellDetailNormalTextFontAttributes;
- (TUIFontAttributes)tableCellDimmedTextFontAttributes;
- (TUIFontAttributes)tableCellNormalTextFontAttributes;
- (UIColor)collectionIconColor_Add;
- (UIColor)collectionIconColor_Audiobooks;
- (UIColor)collectionIconColor_Books;
- (UIColor)collectionIconColor_Downloaded;
- (UIColor)collectionIconColor_Finished;
- (UIColor)collectionIconColor_PDFs;
- (UIColor)collectionIconColor_User;
- (UIColor)collectionIconColor_WantToRead;
- (UIColor)deleteActionColor;
- (UIColor)hideActionColor;
- (UIColor)popoverBackgroundColor;
- (UIColor)tableBackgroundColor;
- (UIColor)tableCellSelectedBackgroundColor;
- (UIColor)tableSeparatorColor;
- (double)collectionGlyphPointSize;
- (double)collectionIconDimmedAlpha;
- (void)configureWithSection:(id)a3;
- (void)setChevronFontAttributes:(id)a3;
- (void)setChevronName:(id)a3;
- (void)setCollectionGlyphPointSize:(double)a3;
- (void)setCollectionIconColor_Add:(id)a3;
- (void)setCollectionIconColor_Audiobooks:(id)a3;
- (void)setCollectionIconColor_Books:(id)a3;
- (void)setCollectionIconColor_Downloaded:(id)a3;
- (void)setCollectionIconColor_Finished:(id)a3;
- (void)setCollectionIconColor_PDFs:(id)a3;
- (void)setCollectionIconColor_User:(id)a3;
- (void)setCollectionIconColor_WantToRead:(id)a3;
- (void)setCollectionIconDimmedAlpha:(double)a3;
- (void)setCollectionIconName_Add:(id)a3;
- (void)setCollectionIconName_Audiobooks:(id)a3;
- (void)setCollectionIconName_Books:(id)a3;
- (void)setCollectionIconName_Downloaded:(id)a3;
- (void)setCollectionIconName_Finished:(id)a3;
- (void)setCollectionIconName_PDFs:(id)a3;
- (void)setCollectionIconName_Samples:(id)a3;
- (void)setCollectionIconName_User:(id)a3;
- (void)setCollectionIconName_WantToRead:(id)a3;
- (void)setCollectionIconSize:(CGSize)a3;
- (void)setDarkAppearance:(BOOL)a3;
- (void)setDeleteActionColor:(id)a3;
- (void)setHideActionColor:(id)a3;
- (void)setPopoverBackgroundColor:(id)a3;
- (void)setTableBackgroundColor:(id)a3;
- (void)setTableCellDetailDimmedTextFontAttributes:(id)a3;
- (void)setTableCellDetailNormalTextFontAttributes:(id)a3;
- (void)setTableCellDimmedTextFontAttributes:(id)a3;
- (void)setTableCellNormalTextFontAttributes:(id)a3;
- (void)setTableCellSelectedBackgroundColor:(id)a3;
- (void)setTableSeparatorColor:(id)a3;
@end

@implementation BKLibraryCollectionsListMetrics

+ (id)sectionName
{
  return @"collectionsList";
}

- (void)configureWithSection:(id)a3
{
  id v4 = a3;
  -[BKLibraryCollectionsListMetrics setDarkAppearance:](self, "setDarkAppearance:", [v4 BOOLForKey:@"dark-appearance"]);
  v5 = [v4 colorForKey:@"popover-background-color"];
  [(BKLibraryCollectionsListMetrics *)self setPopoverBackgroundColor:v5];

  v6 = [v4 colorForKey:@"table-background-color"];
  [(BKLibraryCollectionsListMetrics *)self setTableBackgroundColor:v6];

  v7 = [v4 colorForKey:@"table-separator-color"];
  [(BKLibraryCollectionsListMetrics *)self setTableSeparatorColor:v7];

  v8 = [v4 colorForKey:@"table-cell-selected-background-color"];
  [(BKLibraryCollectionsListMetrics *)self setTableCellSelectedBackgroundColor:v8];

  v9 = [v4 colorForKey:@"delete-action-color"];
  [(BKLibraryCollectionsListMetrics *)self setDeleteActionColor:v9];

  v10 = [v4 colorForKey:@"hide-action-color"];
  [(BKLibraryCollectionsListMetrics *)self setHideActionColor:v10];

  v11 = [v4 stringForKey:@"chevron-name"];
  [(BKLibraryCollectionsListMetrics *)self setChevronName:v11];

  v12 = [v4 fontSpecForKey:@"chevron-font-spec"];
  v13 = [v12 attributesForAttributedString];
  [(BKLibraryCollectionsListMetrics *)self setChevronFontAttributes:v13];

  [v4 sizeForKey:@"icon-size"];
  -[BKLibraryCollectionsListMetrics setCollectionIconSize:](self, "setCollectionIconSize:");
  [v4 floatForKey:@"glyph-point-size"];
  -[BKLibraryCollectionsListMetrics setCollectionGlyphPointSize:](self, "setCollectionGlyphPointSize:");
  v14 = [v4 colorForKey:@"icon-color-finished"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_Finished:v14];

  v15 = [v4 colorForKey:@"icon-color-want-to-read"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_WantToRead:v15];

  v16 = [v4 colorForKey:@"icon-color-books"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_Books:v16];

  v17 = [v4 colorForKey:@"icon-color-audiobooks"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_Audiobooks:v17];

  v18 = [v4 colorForKey:@"icon-color-pdfs"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_PDFs:v18];

  v19 = [v4 colorForKey:@"icon-color-downloaded"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_Downloaded:v19];

  v20 = [v4 colorForKey:@"icon-color-user"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_User:v20];

  v21 = [v4 colorForKey:@"icon-color-add"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconColor_Add:v21];

  [v4 floatForKey:@"icon-dimmed-alpha"];
  -[BKLibraryCollectionsListMetrics setCollectionIconDimmedAlpha:](self, "setCollectionIconDimmedAlpha:");
  v22 = [v4 stringForKey:@"icon-name-books"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_Books:v22];

  v23 = [v4 stringForKey:@"icon-name-samples"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_Samples:v23];

  v24 = [v4 stringForKey:@"icon-name-pdfs"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_PDFs:v24];

  v25 = [v4 stringForKey:@"icon-name-audiobooks"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_Audiobooks:v25];

  v26 = [v4 stringForKey:@"icon-name-downloaded"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_Downloaded:v26];

  v27 = [v4 stringForKey:@"icon-name-finished"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_Finished:v27];

  v28 = [v4 stringForKey:@"icon-name-want-to-read"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_WantToRead:v28];

  v29 = [v4 stringForKey:@"icon-name-user"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_User:v29];

  v30 = [v4 stringForKey:@"icon-name-add"];
  [(BKLibraryCollectionsListMetrics *)self setCollectionIconName_Add:v30];

  v31 = [v4 fontSpecForKey:@"tableCellNormalText"];
  v32 = [v31 attributesForAttributedString];
  [(BKLibraryCollectionsListMetrics *)self setTableCellNormalTextFontAttributes:v32];

  v33 = [v4 fontSpecForKey:@"tableCellDimmedText"];
  v34 = [v33 attributesForAttributedString];
  [(BKLibraryCollectionsListMetrics *)self setTableCellDimmedTextFontAttributes:v34];

  v35 = [v4 fontSpecForKey:@"tableCellDetailNormalText"];
  v36 = [v35 attributesForAttributedString];
  [(BKLibraryCollectionsListMetrics *)self setTableCellDetailNormalTextFontAttributes:v36];

  id v38 = [v4 fontSpecForKey:@"tableCellDetailDimmedText"];

  v37 = [v38 attributesForAttributedString];
  [(BKLibraryCollectionsListMetrics *)self setTableCellDetailDimmedTextFontAttributes:v37];
}

- (BOOL)darkAppearance
{
  return self->_darkAppearance;
}

- (void)setDarkAppearance:(BOOL)a3
{
  self->_darkAppearance = a3;
}

- (UIColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

- (void)setPopoverBackgroundColor:(id)a3
{
}

- (UIColor)tableBackgroundColor
{
  return self->_tableBackgroundColor;
}

- (void)setTableBackgroundColor:(id)a3
{
}

- (UIColor)tableSeparatorColor
{
  return self->_tableSeparatorColor;
}

- (void)setTableSeparatorColor:(id)a3
{
}

- (UIColor)tableCellSelectedBackgroundColor
{
  return self->_tableCellSelectedBackgroundColor;
}

- (void)setTableCellSelectedBackgroundColor:(id)a3
{
}

- (UIColor)deleteActionColor
{
  return self->_deleteActionColor;
}

- (void)setDeleteActionColor:(id)a3
{
}

- (UIColor)hideActionColor
{
  return self->_hideActionColor;
}

- (void)setHideActionColor:(id)a3
{
}

- (TUIFontAttributes)tableCellNormalTextFontAttributes
{
  return self->_tableCellNormalTextFontAttributes;
}

- (void)setTableCellNormalTextFontAttributes:(id)a3
{
}

- (TUIFontAttributes)tableCellDimmedTextFontAttributes
{
  return self->_tableCellDimmedTextFontAttributes;
}

- (void)setTableCellDimmedTextFontAttributes:(id)a3
{
}

- (TUIFontAttributes)tableCellDetailNormalTextFontAttributes
{
  return self->_tableCellDetailNormalTextFontAttributes;
}

- (void)setTableCellDetailNormalTextFontAttributes:(id)a3
{
}

- (TUIFontAttributes)tableCellDetailDimmedTextFontAttributes
{
  return self->_tableCellDetailDimmedTextFontAttributes;
}

- (void)setTableCellDetailDimmedTextFontAttributes:(id)a3
{
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

- (CGSize)collectionIconSize
{
  double width = self->_collectionIconSize.width;
  double height = self->_collectionIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCollectionIconSize:(CGSize)a3
{
  self->_collectionIconSize = a3;
}

- (double)collectionGlyphPointSize
{
  return self->_collectionGlyphPointSize;
}

- (void)setCollectionGlyphPointSize:(double)a3
{
  self->_collectionGlyphPointSize = a3;
}

- (UIColor)collectionIconColor_WantToRead
{
  return self->_collectionIconColor_WantToRead;
}

- (void)setCollectionIconColor_WantToRead:(id)a3
{
}

- (UIColor)collectionIconColor_Finished
{
  return self->_collectionIconColor_Finished;
}

- (void)setCollectionIconColor_Finished:(id)a3
{
}

- (UIColor)collectionIconColor_Books
{
  return self->_collectionIconColor_Books;
}

- (void)setCollectionIconColor_Books:(id)a3
{
}

- (UIColor)collectionIconColor_Audiobooks
{
  return self->_collectionIconColor_Audiobooks;
}

- (void)setCollectionIconColor_Audiobooks:(id)a3
{
}

- (UIColor)collectionIconColor_PDFs
{
  return self->_collectionIconColor_PDFs;
}

- (void)setCollectionIconColor_PDFs:(id)a3
{
}

- (UIColor)collectionIconColor_Downloaded
{
  return self->_collectionIconColor_Downloaded;
}

- (void)setCollectionIconColor_Downloaded:(id)a3
{
}

- (UIColor)collectionIconColor_User
{
  return self->_collectionIconColor_User;
}

- (void)setCollectionIconColor_User:(id)a3
{
}

- (UIColor)collectionIconColor_Add
{
  return self->_collectionIconColor_Add;
}

- (void)setCollectionIconColor_Add:(id)a3
{
}

- (double)collectionIconDimmedAlpha
{
  return self->_collectionIconDimmedAlpha;
}

- (void)setCollectionIconDimmedAlpha:(double)a3
{
  self->_collectionIconDimmedAlpha = a3;
}

- (NSString)collectionIconName_WantToRead
{
  return self->_collectionIconName_WantToRead;
}

- (void)setCollectionIconName_WantToRead:(id)a3
{
}

- (NSString)collectionIconName_Finished
{
  return self->_collectionIconName_Finished;
}

- (void)setCollectionIconName_Finished:(id)a3
{
}

- (NSString)collectionIconName_Books
{
  return self->_collectionIconName_Books;
}

- (void)setCollectionIconName_Books:(id)a3
{
}

- (NSString)collectionIconName_Samples
{
  return self->_collectionIconName_Samples;
}

- (void)setCollectionIconName_Samples:(id)a3
{
}

- (NSString)collectionIconName_Audiobooks
{
  return self->_collectionIconName_Audiobooks;
}

- (void)setCollectionIconName_Audiobooks:(id)a3
{
}

- (NSString)collectionIconName_PDFs
{
  return self->_collectionIconName_PDFs;
}

- (void)setCollectionIconName_PDFs:(id)a3
{
}

- (NSString)collectionIconName_Downloaded
{
  return self->_collectionIconName_Downloaded;
}

- (void)setCollectionIconName_Downloaded:(id)a3
{
}

- (NSString)collectionIconName_User
{
  return self->_collectionIconName_User;
}

- (void)setCollectionIconName_User:(id)a3
{
}

- (NSString)collectionIconName_Add
{
  return self->_collectionIconName_Add;
}

- (void)setCollectionIconName_Add:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIconName_Add, 0);
  objc_storeStrong((id *)&self->_collectionIconName_User, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Downloaded, 0);
  objc_storeStrong((id *)&self->_collectionIconName_PDFs, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Audiobooks, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Samples, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Books, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Finished, 0);
  objc_storeStrong((id *)&self->_collectionIconName_WantToRead, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Add, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_User, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Downloaded, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_PDFs, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Audiobooks, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Books, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Finished, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_WantToRead, 0);
  objc_storeStrong((id *)&self->_chevronFontAttributes, 0);
  objc_storeStrong((id *)&self->_chevronName, 0);
  objc_storeStrong((id *)&self->_tableCellDetailDimmedTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_tableCellDetailNormalTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_tableCellDimmedTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_tableCellNormalTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_hideActionColor, 0);
  objc_storeStrong((id *)&self->_deleteActionColor, 0);
  objc_storeStrong((id *)&self->_tableCellSelectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableSeparatorColor, 0);
  objc_storeStrong((id *)&self->_tableBackgroundColor, 0);

  objc_storeStrong((id *)&self->_popoverBackgroundColor, 0);
}

@end