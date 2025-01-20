@interface SearchHomeBrowseCategoryCellSizeController
- (BOOL)isEqual:(id)a3;
- (CGSize)imageSize;
- (NSArray)columnWidths;
- (SearchHomeBrowseCategoryCellSizeController)initWithStrings:(id)a3 traitCollection:(id)a4 availableWidth:(double)a5 wantsOneColumnLayout:(BOOL)a6 isSearchAlongRoute:(BOOL)a7 supportsFullTextSearch:(BOOL)a8;
- (UIFont)titleLabelFont;
- (double)imageLeadingPadding;
- (double)imageToLabelPadding;
- (double)imageToLabelPaddingWithContentSizeCategory:(id)a3;
- (double)labelTopAndBottomPadding;
- (double)labelTopAndBottomPaddingWithContentSizeCategory:(id)a3;
- (double)longestLabelWidthWithStrings:(id)a3 titleLabelFont:(id)a4 imageToLabelPadding:(double)a5 imageSize:(CGSize)a6;
- (double)paddingBetweenCells;
- (double)singleColumnLeadingPadding;
- (id)columnWidthsWithTraitCollection:(id)a3 strings:(id)a4 availableWidth:(double)a5 numberOfColumns:(unint64_t)a6;
- (id)effectiveTraitCollectionWithTraitCollection:(id)a3;
- (id)stringsInColumnAtIndex:(unint64_t)a3 withStrings:(id)a4;
- (id)titleLabelFontWithTraitCollection:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfColumnWithContentSizeCategory:(id)a3 numberOfItems:(unint64_t)a4;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
@end

@implementation SearchHomeBrowseCategoryCellSizeController

- (SearchHomeBrowseCategoryCellSizeController)initWithStrings:(id)a3 traitCollection:(id)a4 availableWidth:(double)a5 wantsOneColumnLayout:(BOOL)a6 isSearchAlongRoute:(BOOL)a7 supportsFullTextSearch:(BOOL)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SearchHomeBrowseCategoryCellSizeController;
  v16 = [(SearchHomeBrowseCategoryCellSizeController *)&v45 init];
  v17 = v16;
  if (v16)
  {
    v16->_searchAlongRoute = v9;
    v16->_supportsFullTextSearch = a8;
    if (v9)
    {
      uint64_t v18 = [v15 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:UIContentSizeCategoryExtraLarge maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraExtraLarge];

      id v15 = (id)v18;
    }
    v19 = [v15 preferredContentSizeCategory];
    [(SearchHomeBrowseCategoryCellSizeController *)v17 imageToLabelPaddingWithContentSizeCategory:v19];
    v17->_imageToLabelPadding = v20;

    v17->_paddingBetweenCells = 8.0;
    uint64_t v21 = [(SearchHomeBrowseCategoryCellSizeController *)v17 titleLabelFontWithTraitCollection:v15];
    titleLabelFont = v17->_titleLabelFont;
    v17->_titleLabelFont = (UIFont *)v21;

    if (a6)
    {
      uint64_t v23 = 1;
    }
    else
    {
      v24 = [v15 preferredContentSizeCategory];
      uint64_t v23 = -[SearchHomeBrowseCategoryCellSizeController numberOfColumnWithContentSizeCategory:numberOfItems:](v17, "numberOfColumnWithContentSizeCategory:numberOfItems:", v24, [v14 count]);
    }
    v25 = +[UIDevice currentDevice];
    id v26 = [v25 userInterfaceIdiom];

    if (v26 == (id)5)
    {
      __asm { FMOV            V0.2D, #24.0 }
      v17->_imageSize = _Q0;
      v17->_labelTopAndBottomPadding = 10.0;
    }
    else
    {
      double v32 = 45.0;
      if (!v9) {
        double v32 = 30.0;
      }
      v17->_imageSize.width = v32;
      v17->_imageSize.height = v32;
      v33 = [v15 preferredContentSizeCategory];
      [(SearchHomeBrowseCategoryCellSizeController *)v17 labelTopAndBottomPaddingWithContentSizeCategory:v33];
      v17->_labelTopAndBottomPadding = v34;
    }
    if (v23 == 1)
    {
      [(SearchHomeBrowseCategoryCellSizeController *)v17 singleColumnLeadingPadding];
      v17->_imageLeadingPadding = v35;
      v17->_numberOfRows = (unint64_t)[v14 count];
      v36 = +[NSNumber numberWithDouble:a5];
      v46 = v36;
      uint64_t v37 = +[NSArray arrayWithObjects:&v46 count:1];
      columnWidths = v17->_columnWidths;
      v17->_columnWidths = (NSArray *)v37;
    }
    else
    {
      v17->_imageLeadingPadding = 0.0;
      v39 = +[MapsOfflineUIHelper sharedHelper];
      unsigned int v40 = [v39 isUsingOfflineMaps];

      unint64_t v41 = 2;
      if (v40 && !v9)
      {
        if (v17->_supportsFullTextSearch)
        {
          unint64_t v42 = (unint64_t)[v14 count];
          unint64_t v41 = ((unint64_t)[v14 count] & 1) + (v42 >> 1);
        }
        else
        {
          unint64_t v41 = 5;
        }
      }
      v17->_numberOfRows = v41;
      uint64_t v43 = [(SearchHomeBrowseCategoryCellSizeController *)v17 columnWidthsWithTraitCollection:v15 strings:v14 availableWidth:v23 numberOfColumns:a5];
      v36 = v17->_columnWidths;
      v17->_columnWidths = (NSArray *)v43;
    }
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SearchHomeBrowseCategoryCellSizeController *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(SearchHomeBrowseCategoryCellSizeController *)self imageToLabelPadding];
      double v7 = v6;
      [(SearchHomeBrowseCategoryCellSizeController *)v5 imageToLabelPadding];
      if (v7 == v8)
      {
        [(SearchHomeBrowseCategoryCellSizeController *)self imageLeadingPadding];
        double v10 = v9;
        [(SearchHomeBrowseCategoryCellSizeController *)v5 imageLeadingPadding];
        if (v10 == v11)
        {
          [(SearchHomeBrowseCategoryCellSizeController *)self imageSize];
          double v13 = v12;
          double v15 = v14;
          [(SearchHomeBrowseCategoryCellSizeController *)v5 imageSize];
          BOOL v17 = 0;
          if (v13 != v18 || v15 != v16) {
            goto LABEL_15;
          }
          [(SearchHomeBrowseCategoryCellSizeController *)self labelTopAndBottomPadding];
          double v20 = v19;
          [(SearchHomeBrowseCategoryCellSizeController *)v5 labelTopAndBottomPadding];
          if (v20 == v21)
          {
            v22 = [(SearchHomeBrowseCategoryCellSizeController *)self titleLabelFont];
            uint64_t v23 = [(SearchHomeBrowseCategoryCellSizeController *)v5 titleLabelFont];
            if ([v22 isEqual:v23]
              && (id v24 = [(SearchHomeBrowseCategoryCellSizeController *)self numberOfRows],
                  v24 == (id)[(SearchHomeBrowseCategoryCellSizeController *)v5 numberOfRows]))
            {
              v25 = [(SearchHomeBrowseCategoryCellSizeController *)self columnWidths];
              id v26 = [(SearchHomeBrowseCategoryCellSizeController *)v5 columnWidths];
              if ([v25 isEqualToArray:v26])
              {
                [(SearchHomeBrowseCategoryCellSizeController *)self paddingBetweenCells];
                double v28 = v27;
                [(SearchHomeBrowseCategoryCellSizeController *)v5 paddingBetweenCells];
                BOOL v17 = v28 == v29;
              }
              else
              {
                BOOL v17 = 0;
              }
            }
            else
            {
              BOOL v17 = 0;
            }

            goto LABEL_15;
          }
        }
      }
      BOOL v17 = 0;
LABEL_15:

      goto LABEL_16;
    }
    BOOL v17 = 0;
  }
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  [(SearchHomeBrowseCategoryCellSizeController *)self imageToLabelPadding];
  float v4 = v3;
  float v5 = -v4;
  if (v4 >= 0.0) {
    float v5 = v4;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  float v8 = fmodf(v6, 1.8447e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 >= 0.0) {
    unint64_t v11 = v10;
  }
  unint64_t v68 = v11;
  [(SearchHomeBrowseCategoryCellSizeController *)self imageLeadingPadding];
  float v13 = v12;
  float v14 = -v13;
  if (v13 >= 0.0) {
    float v14 = v13;
  }
  float v15 = floorf(v14 + 0.5);
  float v16 = (float)(v14 - v15) * 1.8447e19;
  float v17 = fmodf(v15, 1.8447e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 >= 0.0) {
    unint64_t v20 = v19;
  }
  [(SearchHomeBrowseCategoryCellSizeController *)self imageSize];
  float v22 = v21;
  float v23 = -v22;
  if (v22 >= 0.0) {
    float v23 = v22;
  }
  float v24 = floorf(v23 + 0.5);
  float v25 = (float)(v23 - v24) * 1.8447e19;
  float v26 = fmodf(v24, 1.8447e19);
  unint64_t v27 = 2654435761u * (unint64_t)v26;
  unint64_t v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0) {
    unint64_t v28 = 2654435761u * (unint64_t)v26;
  }
  unint64_t v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 < 0.0) {
    unint64_t v30 = v29;
  }
  else {
    unint64_t v30 = v28;
  }
  [(SearchHomeBrowseCategoryCellSizeController *)self imageSize];
  float v32 = v31;
  float v33 = -v32;
  if (v32 >= 0.0) {
    float v33 = v32;
  }
  float v34 = floorf(v33 + 0.5);
  float v35 = (float)(v33 - v34) * 1.8447e19;
  float v36 = fmodf(v34, 1.8447e19);
  unint64_t v37 = 2654435761u * (unint64_t)v36;
  unint64_t v38 = v37 + (unint64_t)v35;
  if (v35 <= 0.0) {
    unint64_t v38 = 2654435761u * (unint64_t)v36;
  }
  unint64_t v39 = v37 - (unint64_t)fabsf(v35);
  if (v35 < 0.0) {
    unint64_t v40 = v39;
  }
  else {
    unint64_t v40 = v38;
  }
  [(SearchHomeBrowseCategoryCellSizeController *)self labelTopAndBottomPadding];
  float v42 = v41;
  float v43 = -v42;
  if (v42 >= 0.0) {
    float v43 = v42;
  }
  float v44 = floorf(v43 + 0.5);
  float v45 = (float)(v43 - v44) * 1.8447e19;
  float v46 = fmodf(v44, 1.8447e19);
  unint64_t v47 = 2654435761u * (unint64_t)v46;
  unint64_t v48 = v47 + (unint64_t)v45;
  if (v45 <= 0.0) {
    unint64_t v48 = 2654435761u * (unint64_t)v46;
  }
  unint64_t v49 = v47 - (unint64_t)fabsf(v45);
  if (v45 < 0.0) {
    unint64_t v50 = v49;
  }
  else {
    unint64_t v50 = v48;
  }
  v51 = [(SearchHomeBrowseCategoryCellSizeController *)self titleLabelFont];
  unint64_t v52 = (unint64_t)[v51 hash];
  unint64_t v53 = [(SearchHomeBrowseCategoryCellSizeController *)self numberOfRows];
  v54 = [(SearchHomeBrowseCategoryCellSizeController *)self columnWidths];
  unint64_t v55 = (unint64_t)[v54 hash];
  [(SearchHomeBrowseCategoryCellSizeController *)self paddingBetweenCells];
  float v57 = v56;
  float v58 = -v57;
  if (v57 >= 0.0) {
    float v58 = v57;
  }
  float v59 = floorf(v58 + 0.5);
  float v60 = (float)(v58 - v59) * 1.8447e19;
  float v61 = fmodf(v59, 1.8447e19);
  unint64_t v62 = 2654435761u * (unint64_t)v61;
  unint64_t v63 = v62 + (unint64_t)v60;
  if (v60 <= 0.0) {
    unint64_t v63 = 2654435761u * (unint64_t)v61;
  }
  unint64_t v64 = v62 - (unint64_t)fabsf(v60);
  if (v60 >= 0.0) {
    unint64_t v64 = v63;
  }
  unint64_t v65 = v67 ^ v68 ^ v30 ^ v40 ^ v50 ^ v52 ^ (2654435761u * v53) ^ v55 ^ v64;

  return v65;
}

- (unint64_t)numberOfColumns
{
  v2 = [(SearchHomeBrowseCategoryCellSizeController *)self columnWidths];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (double)singleColumnLeadingPadding
{
  v2 = +[UIDevice currentDevice];
  [v2 userInterfaceIdiom];

  return 16.0;
}

- (double)imageToLabelPaddingWithContentSizeCategory:(id)a3
{
  uint64_t v3 = qword_101610728;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_101610728, &stru_1013167A0);
  }
  unsigned int v5 = [(id)qword_101610720 containsObject:v4];

  double result = 12.0;
  if (v5) {
    return 8.0;
  }
  return result;
}

- (double)labelTopAndBottomPaddingWithContentSizeCategory:(id)a3
{
  uint64_t v3 = qword_101610738;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_101610738, &stru_1013167C0);
  }
  unsigned int v5 = [(id)qword_101610730 containsObject:v4];

  double result = 10.0;
  if (v5) {
    return 12.0;
  }
  return result;
}

- (id)titleLabelFontWithTraitCollection:(id)a3
{
  uint64_t v3 = [(SearchHomeBrowseCategoryCellSizeController *)self effectiveTraitCollectionWithTraitCollection:a3];
  id v4 = +[UIFont system17CompatibleWithTraitCollection:v3];

  return v4;
}

- (id)effectiveTraitCollectionWithTraitCollection:(id)a3
{
  return [a3 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
}

- (unint64_t)numberOfColumnWithContentSizeCategory:(id)a3 numberOfItems:(unint64_t)a4
{
  id v6 = a3;
  float v7 = +[UIDevice currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v8 == (id)5) {
    goto LABEL_5;
  }
  if (qword_101610748 != -1) {
    dispatch_once(&qword_101610748, &stru_1013167E0);
  }
  if ([(id)qword_101610740 containsObject:v6])
  {
LABEL_5:
    unint64_t v9 = 1;
    goto LABEL_10;
  }
  unint64_t v10 = +[MapsOfflineUIHelper sharedHelper];
  if (![v10 isUsingOfflineMaps] || self->_searchAlongRoute)
  {

LABEL_9:
    unint64_t v9 = (a4 & 1) + (a4 >> 1);
    goto LABEL_10;
  }
  BOOL supportsFullTextSearch = self->_supportsFullTextSearch;

  if (supportsFullTextSearch) {
    goto LABEL_9;
  }
  if (a4 == 5 * (a4 / 5)) {
    unint64_t v9 = a4 / 5;
  }
  else {
    unint64_t v9 = a4 / 5 + 1;
  }
LABEL_10:

  return v9;
}

- (id)columnWidthsWithTraitCollection:(id)a3 strings:(id)a4 availableWidth:(double)a5 numberOfColumns:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[SearchHomeBrowseCategoryCellSizeController numberOfColumns](self, "numberOfColumns")];
  float v13 = [(SearchHomeBrowseCategoryCellSizeController *)self effectiveTraitCollectionWithTraitCollection:v10];
  +[UIFont _maps_bodyScaledValueForValue:v13 compatibleWithTraitCollection:166.0];
  double v15 = v14;

  if (a6)
  {
    uint64_t v16 = 0;
    double v17 = a5 * 0.9;
    do
    {
      unint64_t v18 = [(SearchHomeBrowseCategoryCellSizeController *)self stringsInColumnAtIndex:v16 withStrings:v11];
      id v19 = [v18 copy];
      unint64_t v20 = [(SearchHomeBrowseCategoryCellSizeController *)self titleLabelFont];
      [(SearchHomeBrowseCategoryCellSizeController *)self imageToLabelPadding];
      double v22 = v21;
      [(SearchHomeBrowseCategoryCellSizeController *)self imageSize];
      -[SearchHomeBrowseCategoryCellSizeController longestLabelWidthWithStrings:titleLabelFont:imageToLabelPadding:imageSize:](self, "longestLabelWidthWithStrings:titleLabelFont:imageToLabelPadding:imageSize:", v19, v20, v22, v23, v24);
      double v26 = v25;

      if (v15 <= v26) {
        double v27 = v26;
      }
      else {
        double v27 = v15;
      }
      if (v27 >= v17) {
        double v27 = v17;
      }
      unint64_t v28 = +[NSNumber numberWithDouble:v27];
      [v12 addObject:v28];

      ++v16;
    }
    while (a6 != v16);
  }
  id v29 = [v12 copy];

  return v29;
}

- (id)stringsInColumnAtIndex:(unint64_t)a3 withStrings:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[SearchHomeBrowseCategoryCellSizeController numberOfRows](self, "numberOfRows")];
  unint64_t v8 = [(SearchHomeBrowseCategoryCellSizeController *)self numberOfRows] * a3;
  if (v8 < [(SearchHomeBrowseCategoryCellSizeController *)self numberOfRows] + v8)
  {
    unint64_t v9 = v8;
    do
    {
      if (v9 < (unint64_t)[v6 count])
      {
        id v10 = [v6 objectAtIndex:v9];
        [v7 addObject:v10];
      }
      ++v9;
    }
    while (v9 < [(SearchHomeBrowseCategoryCellSizeController *)self numberOfRows] + v8);
  }
  id v11 = [v7 copy];

  return v11;
}

- (double)longestLabelWidthWithStrings:(id)a3 titleLabelFont:(id)a4 imageToLabelPadding:(double)a5 imageSize:(CGSize)a6
{
  double width = a6.width;
  id v9 = a3;
  id v10 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    double v14 = width + a5;
    double v15 = 0.0;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        NSAttributedStringKey v26 = NSFontAttributeName;
        id v27 = v10;
        unint64_t v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        [v17 sizeWithAttributes:v18];
        double v20 = ceil(v19);

        if (v15 <= v14 + v20) {
          double v15 = v14 + v20;
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v12);
  }
  else
  {
    double v15 = 0.0;
  }

  return v15;
}

- (double)imageToLabelPadding
{
  return self->_imageToLabelPadding;
}

- (double)imageLeadingPadding
{
  return self->_imageLeadingPadding;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)labelTopAndBottomPadding
{
  return self->_labelTopAndBottomPadding;
}

- (UIFont)titleLabelFont
{
  return self->_titleLabelFont;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (double)paddingBetweenCells
{
  return self->_paddingBetweenCells;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnWidths, 0);

  objc_storeStrong((id *)&self->_titleLabelFont, 0);
}

@end