@interface SXDataTableComponentController
- ($01BB1521EC52D44A8E7628F5261DCEC8)paddingForCellAtIndexPath:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathSubstractingHeaders:(id)a3;
- (BOOL)hasColumnHeader;
- (BOOL)hasRowHeader;
- (BOOL)indexPathIsHeader:(id)a3;
- (NSArray)records;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXDataRecordValueTransformerFactory)recordValueTransformerFactory;
- (SXDataTableComponentController)initWithStyleFactory:(id)a3 textSourceFactory:(id)a4 dataSource:(id)a5 recordValueTransformerFactory:(id)a6 DOMObjectProvider:(id)a7;
- (SXDataTableComponentControllerDataSource)dataSource;
- (SXDataTableDictionary)cellObjects;
- (SXDataTableDictionary)textLayouters;
- (SXDataTableStyleFactory)styleFactory;
- (SXDataTableTextSourceFactory)textSourceFactory;
- (double)convertConvertibleValue:(_SXConvertibleValue)a3;
- (double)heightForCellAtIndexPath:(id)a3;
- (double)heightForCellndexPath:(id)a3 forWidth:(double)a4;
- (double)minimumWidthForCellAtIndexPath:(id)a3;
- (double)minimumWidthForStorage:(id)a3 usingStringEnumeration:(unint64_t)a4;
- (double)widthForCellAtIndexPath:(id)a3;
- (id)additionsForTextSource:(id)a3;
- (id)backgroundColorForCellAtIndexPath:(id)a3;
- (id)backgroundColorForColumnAtIndex:(unint64_t)a3;
- (id)backgroundColorForRowAtIndex:(unint64_t)a3;
- (id)cellBorderForCellAtIndexPath:(id)a3;
- (id)cellObjectForIndexPath:(id)a3;
- (id)cellStyleForIndexPath:(id)a3;
- (id)columnDividerAtIndex:(unint64_t)a3;
- (id)columnStyleForColumnIndex:(unint64_t)a3;
- (id)component;
- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4;
- (id)contentSizeCategoryForTextSource:(id)a3;
- (id)dataDescriptorForIdentifier:(id)a3;
- (id)dataDescriptorForIndexPath:(id)a3;
- (id)defaultComponentTextStyleForTextSource:(id)a3;
- (id)defaultComponentTextStylesForTextSource:(id)a3;
- (id)inlineTextStylesForTextSource:(id)a3;
- (id)recordForIndexPath:(id)a3;
- (id)rowDividerAtIndex:(unint64_t)a3;
- (id)rowStyleForRowIndex:(unint64_t)a3;
- (id)tableBorder;
- (id)textLayouterForIndexPath:(id)a3;
- (id)textResizerForTextSource:(id)a3;
- (id)textRulesForTextSource:(id)a3;
- (id)textStyleForIdentifier:(id)a3;
- (unint64_t)dataOrientation;
- (unint64_t)horizontalAlignmentForCellAtIndexPath:(id)a3;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (unint64_t)verticalAlignmentForCellAtIndexPath:(id)a3;
- (void)loadRecords;
- (void)prepareForLayout;
- (void)setRecordValueTransformerFactory:(id)a3;
- (void)setRecords:(id)a3;
@end

@implementation SXDataTableComponentController

- (SXDataTableComponentController)initWithStyleFactory:(id)a3 textSourceFactory:(id)a4 dataSource:(id)a5 recordValueTransformerFactory:(id)a6 DOMObjectProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SXDataTableComponentController;
  v18 = [(SXDataTableComponentController *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_styleFactory, a3);
    objc_storeStrong((id *)&v19->_textSourceFactory, a4);
    objc_storeWeak((id *)&v19->_dataSource, v15);
    uint64_t v20 = +[SXDataTableDictionary dataTableDictionaryWithRows:[(SXDataTableComponentController *)v19 numberOfRows] andColumns:[(SXDataTableComponentController *)v19 numberOfColumns]];
    cellObjects = v19->_cellObjects;
    v19->_cellObjects = (SXDataTableDictionary *)v20;

    uint64_t v22 = +[SXDataTableDictionary dataTableDictionaryWithRows:[(SXDataTableComponentController *)v19 numberOfRows] andColumns:[(SXDataTableComponentController *)v19 numberOfColumns]];
    textLayouters = v19->_textLayouters;
    v19->_textLayouters = (SXDataTableDictionary *)v22;

    objc_storeStrong((id *)&v19->_recordValueTransformerFactory, a6);
    objc_storeStrong((id *)&v19->_DOMObjectProvider, a7);
    [(SXDataTableComponentController *)v19 loadRecords];
  }

  return v19;
}

- (void)loadRecords
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(SXDataSortDescriptorFactory);
  v4 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(SXDataTableComponentController *)self component];
  v6 = [v5 sortBy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 descriptor];
        id v13 = [(SXDataTableComponentController *)self dataDescriptorForIdentifier:v12];

        if (v13)
        {
          id v14 = -[SXDataSortDescriptorFactory sortDescriptorForDataDescriptor:ascending:](v3, "sortDescriptorForDataDescriptor:ascending:", v13, [v11 direction] == 0);
          if (v14) {
            [v4 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v15 = [(SXDataTableComponentController *)self component];
  id v16 = [v15 data];
  id v17 = [v16 recordsUsingSortDescriptors:v4];
  [(SXDataTableComponentController *)self setRecords:v17];
}

- (void)prepareForLayout
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SXDataTableComponentController *)self textLayouters];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) reset];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)indexPathIsHeader:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if ([(SXDataTableComponentController *)self hasRowHeader] && !var0) {
    return 1;
  }
  BOOL result = [(SXDataTableComponentController *)self hasColumnHeader];
  if (var1) {
    return 0;
  }
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathSubstractingHeaders:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  BOOL v6 = [(SXDataTableComponentController *)self hasRowHeader];
  if (var0) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  unint64_t v8 = var0 - v7;
  BOOL v9 = [(SXDataTableComponentController *)self hasColumnHeader];
  if (var1) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }
  unint64_t v11 = var1 - v10;
  unint64_t v12 = v8;
  result.unint64_t var1 = v11;
  result.unint64_t var0 = v12;
  return result;
}

- (BOOL)hasColumnHeader
{
  if ([(SXDataTableComponentController *)self dataOrientation] != 1) {
    return 0;
  }
  uint64_t v3 = [(SXDataTableComponentController *)self component];
  char v4 = [v3 showDescriptorLabels];

  return v4;
}

- (BOOL)hasRowHeader
{
  if ([(SXDataTableComponentController *)self dataOrientation]) {
    return 0;
  }
  char v4 = [(SXDataTableComponentController *)self component];
  char v5 = [v4 showDescriptorLabels];

  return v5;
}

- (unint64_t)dataOrientation
{
  v2 = [(SXDataTableComponentController *)self component];
  unint64_t v3 = [v2 dataOrientation];

  return v3;
}

- (id)tableBorder
{
  unint64_t v3 = [(SXDataTableComponentController *)self styleFactory];
  char v4 = [v3 dataTableStyle];
  char v5 = [v4 border];

  if (v5)
  {
    BOOL v6 = [(SXDataTableComponentController *)self dataSource];
    BOOL v7 = [v6 unitConverterForDataTableComponentController:self];

    [v5 setUnitConverter:v7];
  }
  return v5;
}

- (unint64_t)numberOfRows
{
  unint64_t v3 = [(SXDataTableComponentController *)self dataOrientation];
  char v4 = [(SXDataTableComponentController *)self component];
  char v5 = [v4 data];
  BOOL v6 = v5;
  if (v3)
  {
    BOOL v7 = [v5 descriptors];
    uint64_t v8 = [v7 count];
  }
  else
  {
    uint64_t v8 = [v5 numberOfRecords];
  }

  BOOL v9 = [(SXDataTableComponentController *)self hasRowHeader];
  if (v8) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }
  return v8 + v10;
}

- (unint64_t)numberOfColumns
{
  unint64_t v3 = [(SXDataTableComponentController *)self dataOrientation];
  char v4 = [(SXDataTableComponentController *)self component];
  char v5 = [v4 data];
  BOOL v6 = v5;
  if (v3)
  {
    uint64_t v7 = [v5 numberOfRecords];
  }
  else
  {
    uint64_t v8 = [v5 descriptors];
    uint64_t v7 = [v8 count];
  }
  BOOL v9 = [(SXDataTableComponentController *)self hasColumnHeader];
  if (v7) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }
  return v7 + v10;
}

- (id)backgroundColorForRowAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(SXDataTableComponentController *)self rowStyleForRowIndex:a3];
  char v4 = [v3 backgroundColor];

  return v4;
}

- (id)backgroundColorForColumnAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(SXDataTableComponentController *)self columnStyleForColumnIndex:a3];
  char v4 = [v3 backgroundColor];

  return v4;
}

- (id)cellObjectForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  BOOL v6 = [(SXDataTableComponentController *)self cellObjects];
  uint64_t v7 = objc_msgSend(v6, "objectForIndexPath:", var0, var1);

  if (!v7)
  {
    uint64_t v8 = -[SXDataTableComponentController dataDescriptorForIndexPath:](self, "dataDescriptorForIndexPath:", var0, var1);
    if (-[SXDataTableComponentController indexPathIsHeader:](self, "indexPathIsHeader:", var0, var1))
    {
      uint64_t v7 = [v8 label];
      if (!v7) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v9 = -[SXDataTableComponentController indexPathSubstractingHeaders:](self, "indexPathSubstractingHeaders:", var0, var1);
      unint64_t v11 = -[SXDataTableComponentController recordForIndexPath:](self, "recordForIndexPath:", v9, v10);
      unint64_t v12 = [(SXDataTableComponentController *)self recordValueTransformerFactory];
      id v13 = [v12 recordValueTransformerForDataDescriptor:v8];

      uint64_t v7 = [v13 transformValueForRecord:v11 descriptor:v8];

      if (!v7)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    id v14 = [(SXDataTableComponentController *)self cellObjects];
    objc_msgSend(v14, "setObject:forIndexPath:", v7, var0, var1);

    goto LABEL_7;
  }
LABEL_8:
  return v7;
}

- (id)textLayouterForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  BOOL v6 = [(SXDataTableComponentController *)self textLayouters];
  objc_msgSend(v6, "objectForIndexPath:", var0, var1);
  uint64_t v7 = (SXTextLayouter *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    uint64_t v8 = -[SXDataTableComponentController cellObjectForIndexPath:](self, "cellObjectForIndexPath:", var0, var1);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [(SXDataTableComponentController *)self textSourceFactory];
      uint64_t v10 = objc_msgSend(v9, "textSourceWithFormattedText:indexPath:dataSource:", v8, var0, var1, self);

      unint64_t v11 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
      objc_msgSend(v10, "setDefaultTextAlignment:", objc_msgSend(v11, "horizontalAlignment"));
      unint64_t v12 = [SXTextLayouter alloc];
      id v13 = [(SXDataTableComponentController *)self dataSource];
      id v14 = [v13 textComponentLayoutHostingForDataTableComponentController:self];
      id v15 = [v14 documentRoot];
      uint64_t v7 = [(SXTextLayouter *)v12 initWithTextSource:v10 andDocumentRoot:v15];

      id v16 = [(SXDataTableComponentController *)self textLayouters];
      objc_msgSend(v16, "setObject:forIndexPath:", v7, var0, var1);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (double)minimumWidthForCellAtIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  BOOL v6 = -[SXDataTableComponentController cellObjectForIndexPath:](self, "cellObjectForIndexPath:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = -[SXDataTableComponentController dataDescriptorForIndexPath:](self, "dataDescriptorForIndexPath:", var0, var1);
    uint64_t v9 = [v8 format];

    uint64_t v10 = [v9 minimumWidth];
    -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v10, v11);
    double v13 = v12;
    [v9 maximumWidth];
    if (v14)
    {
      uint64_t v15 = [v9 maximumWidth];
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v15, v16);
      if (v13 >= v17) {
        double v13 = v17;
      }
    }
    uint64_t v18 = [v9 minimumHeight];
    -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v18, v19);
    double v21 = v20;
    [v9 maximumHeight];
    if (v22)
    {
      uint64_t v23 = [v9 maximumHeight];
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v23, v24);
      if (v21 >= v25) {
        double v21 = v25;
      }
    }
    [v7 widthForImageHeight:v21];
    if (v13 < v26) {
      double v13 = v26;
    }
    [v9 maximumHeight];
    if (v27)
    {
      uint64_t v28 = [v9 maximumHeight];
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v28, v29);
      if (v13 >= v30) {
        double v13 = v30;
      }
    }
    goto LABEL_22;
  }
  objc_opt_class();
  double v13 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  id v31 = v6;
  uint64_t v9 = -[SXDataTableComponentController textLayouterForIndexPath:](self, "textLayouterForIndexPath:", var0, var1);
  if ([v31 shouldWrapText])
  {
    v32 = [v9 wpStorage];
    v33 = [v9 wpStorage];
    [(SXDataTableComponentController *)self minimumWidthForStorage:v33 usingStringEnumeration:3];
    double v13 = v34;

    if (v13 != 0.0) {
      goto LABEL_21;
    }
    v35 = [(SXTextUtilities *)v32 string];
    uint64_t v36 = [v35 length];

    if (!v36) {
      goto LABEL_21;
    }
    v37 = [v9 wpStorage];
    [(SXDataTableComponentController *)self minimumWidthForStorage:v37 usingStringEnumeration:2];
  }
  else
  {
    v39 = [SXTextUtilities alloc];
    v40 = [v9 wpStorage];
    v41 = [v40 paragraphStyleAtParIndex:0 effectiveRange:0];
    v32 = [(TSWPText *)v39 initWithParagraphStyle:v41];

    v37 = [v9 wpStorage];
    [(TSWPText *)v32 measureStorage:v37];
  }
  double v13 = v38;

LABEL_21:
LABEL_22:

LABEL_23:
  v42 = [(SXDataTableComponentController *)self columnStyleForColumnIndex:var1];
  v43 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  uint64_t v44 = [v43 minimumWidth];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v44, v45);
  double v47 = v46;
  uint64_t v48 = [v42 minimumWidth];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v48, v49);
  if (v50 < v47) {
    double v50 = v47;
  }
  if (v13 < v50) {
    double v13 = v50;
  }

  return v13;
}

- (double)heightForCellndexPath:(id)a3 forWidth:(double)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  uint64_t v8 = -[SXDataTableComponentController cellObjectForIndexPath:](self, "cellObjectForIndexPath:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = -[SXDataTableComponentController dataDescriptorForIndexPath:](self, "dataDescriptorForIndexPath:", var0, var1);
    id v10 = v8;
    uint64_t v11 = [v9 format];
    [v11 maximumWidth];
    if (v12)
    {
      uint64_t v13 = [v11 maximumWidth];
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v13, v14);
      if (v15 <= a4) {
        a4 = v15;
      }
    }
    [v11 maximumHeight];
    if (v16)
    {
      uint64_t v17 = [v11 maximumHeight];
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v17, v18);
      double v20 = v19;
    }
    else
    {
      double v20 = 1.79769313e308;
    }
    objc_msgSend(v10, "sizeThatFits:", a4, v20);
    double v21 = v23;

    goto LABEL_11;
  }
  objc_opt_class();
  double v21 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = -[SXDataTableComponentController textLayouterForIndexPath:](self, "textLayouterForIndexPath:", var0, var1);
    [v9 calculateHeightForWidth:a4];
    double v21 = v22;
LABEL_11:
  }
  return v21;
}

- (double)widthForCellAtIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  BOOL v6 = [(SXDataTableComponentController *)self columnStyleForColumnIndex:a3.var1];
  id v7 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  [v6 width];
  if (v8 == 1.79769313e308)
  {
    double v10 = 0.0;
  }
  else
  {
    [v6 width];
    double v10 = v9;
  }
  [v7 width];
  if (v11 > v10)
  {
    [v7 width];
    if (v12 != 1.79769313e308)
    {
      [v7 width];
      double v10 = v13;
    }
  }

  return v10;
}

- (double)heightForCellAtIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  BOOL v6 = -[SXDataTableComponentController rowStyleForRowIndex:](self, "rowStyleForRowIndex:");
  id v7 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  uint64_t v8 = [v6 height];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v8, v9);
  double v11 = v10;
  uint64_t v12 = [v7 height];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v12, v13);
  if (v11 < v14) {
    double v11 = v14;
  }

  return v11;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)paddingForCellAtIndexPath:(id)a3
{
  char v4 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  char v5 = [v4 padding];
  uint64_t v6 = [v5 left];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v6, v7);
  double v9 = v8;

  double v10 = [v4 padding];
  uint64_t v11 = [v10 top];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v11, v12);
  double v14 = v13;

  double v15 = [v4 padding];
  uint64_t v16 = [v15 right];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v16, v17);
  double v19 = v18;

  double v20 = [v4 padding];
  uint64_t v21 = [v20 bottom];
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v21, v22);
  double v24 = v23;

  double v25 = v14;
  double v26 = v19;
  double v27 = v24;
  double v28 = v9;
  result.var3 = v28;
  result.var2 = v27;
  result.unint64_t var1 = v26;
  result.unint64_t var0 = v25;
  return result;
}

- (id)cellBorderForCellAtIndexPath:(id)a3
{
  char v4 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  char v5 = [v4 border];

  if (v5)
  {
    uint64_t v6 = [(SXDataTableComponentController *)self dataSource];
    uint64_t v7 = [v6 unitConverterForDataTableComponentController:self];

    double v8 = [v4 border];
    [v8 setUnitConverter:v7];
  }
  double v9 = [v4 border];

  return v9;
}

- (unint64_t)verticalAlignmentForCellAtIndexPath:(id)a3
{
  unint64_t v3 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  unint64_t v4 = [v3 verticalAlignment];

  return v4;
}

- (unint64_t)horizontalAlignmentForCellAtIndexPath:(id)a3
{
  unint64_t v3 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  unint64_t v4 = [v3 horizontalAlignment];

  return v4;
}

- (id)backgroundColorForCellAtIndexPath:(id)a3
{
  unint64_t v3 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  unint64_t v4 = [v3 backgroundColor];

  return v4;
}

- (id)rowDividerAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(SXDataTableComponentController *)self rowStyleForRowIndex:a3];
  char v5 = [v4 divider];

  if (v5)
  {
    uint64_t v6 = [(SXDataTableComponentController *)self dataSource];
    uint64_t v7 = [v6 unitConverterForDataTableComponentController:self];

    double v8 = [v4 divider];
    [v8 setUnitConverter:v7];
  }
  double v9 = [v4 divider];

  return v9;
}

- (id)columnDividerAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(SXDataTableComponentController *)self columnStyleForColumnIndex:a3];
  char v5 = [v4 divider];

  if (v5)
  {
    uint64_t v6 = [(SXDataTableComponentController *)self dataSource];
    uint64_t v7 = [v6 unitConverterForDataTableComponentController:self];

    double v8 = [v4 divider];
    [v8 setUnitConverter:v7];
  }
  double v9 = [v4 divider];

  return v9;
}

- (id)textResizerForTextSource:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SXDataTableComponentController *)self dataSource];
  uint64_t v6 = [v5 documentColumnLayoutForDataTableComponentController:self];

  uint64_t v7 = [(SXDataTableComponentController *)self DOMObjectProvider];
  double v8 = SXDefaultTextStyleIdentifierForRole(@"body");
  v21[0] = v8;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  double v10 = [(SXDataTableComponentController *)self component];
  uint64_t v11 = [v7 componentTextStyleForIdentifiers:v9 component:v10];

  if (!v11)
  {
    uint64_t v12 = [(SXDataTableComponentController *)self DOMObjectProvider];
    double v20 = @"default";
    double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    double v14 = [(SXDataTableComponentController *)self component];
    uint64_t v11 = [v12 componentTextStyleForIdentifiers:v13 component:v14];
  }
  char v15 = 1;
  uint64_t v16 = [(SXDataTableComponentController *)self componentTextStyleForTextSource:v4 inheritingFromDefaultStyles:1];
  uint64_t v17 = v16;
  if (v16) {
    char v15 = [v16 fontScaling];
  }
  double v18 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)[SXTextResizer alloc], v6, v11, v15);

  return v18;
}

- (id)textRulesForTextSource:(id)a3
{
  unint64_t v3 = [(SXDataTableComponentController *)self component];
  id v4 = [v3 classification];
  char v5 = [v4 textRules];

  return v5;
}

- (id)additionsForTextSource:(id)a3
{
  id v3 = a3;
  id v4 = [v3 formattedText];
  char v5 = [v4 additions];

  if (v5)
  {
    uint64_t v6 = [v3 formattedText];
    uint64_t v7 = [v6 additions];
    double v8 = [v7 NSArray];
  }
  else
  {
    double v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)inlineTextStylesForTextSource:(id)a3
{
  id v3 = a3;
  id v4 = [v3 formattedText];
  char v5 = [v4 inlineTextStyles];

  if (v5)
  {
    uint64_t v6 = [v3 formattedText];
    uint64_t v7 = [v6 inlineTextStyles];
    double v8 = [v7 NSArray];
  }
  else
  {
    double v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  if (v4)
  {
    double v8 = [(SXDataTableComponentController *)self component];
    double v9 = [v8 classification];
    double v10 = [v9 defaultTextStyleIdentifiers];
    [v7 addObjectsFromArray:v10];
  }
  uint64_t v11 = [v6 indexPath];
  double v13 = -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", v11, v12);
  double v14 = [v13 textStyles];
  [v7 addObjectsFromArray:v14];

  char v15 = [v6 formattedText];
  uint64_t v16 = [v15 textStyle];

  if (v16)
  {
    uint64_t v17 = [v6 formattedText];
    double v18 = [v17 textStyle];
    [v7 addObject:v18];
  }
  double v19 = [(SXDataTableComponentController *)self DOMObjectProvider];
  double v20 = [(SXDataTableComponentController *)self component];
  uint64_t v21 = [v19 componentTextStyleForIdentifiers:v7 component:v20];

  return v21;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263EFF980];
  char v5 = [(SXDataTableComponentController *)self component];
  id v6 = [v5 classification];
  uint64_t v7 = [v6 defaultTextStyleIdentifiers];
  double v8 = [v4 arrayWithArray:v7];

  double v9 = [(SXDataTableComponentController *)self DOMObjectProvider];
  double v10 = [(SXDataTableComponentController *)self component];
  uint64_t v11 = [v9 componentTextStyleForIdentifiers:v8 component:v10];

  return v11;
}

- (id)defaultComponentTextStylesForTextSource:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = [(SXDataTableComponentController *)self component];
  char v5 = [v4 classification];
  id v6 = [v5 defaultTextStyleIdentifiers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(SXDataTableComponentController *)self DOMObjectProvider];
        uint64_t v22 = v11;
        double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
        double v14 = [(SXDataTableComponentController *)self component];
        char v15 = [v12 componentTextStyleForIdentifiers:v13 component:v14];

        if (v15) {
          [v17 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  return v17;
}

- (id)contentSizeCategoryForTextSource:(id)a3
{
  BOOL v4 = [(SXDataTableComponentController *)self dataSource];
  char v5 = [v4 contentSizeCategoryForDataTableComponentController:self];

  return v5;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(SXDataTableComponentController *)self DOMObjectProvider];
  id v6 = [(SXDataTableComponentController *)self component];
  uint64_t v7 = [v5 textStyleForIdentifier:v4 component:v6];

  return v7;
}

- (id)rowStyleForRowIndex:(unint64_t)a3
{
  BOOL v5 = -[SXDataTableComponentController shouldTreatIndexPathAsHeader:](self, "shouldTreatIndexPathAsHeader:", a3, -1);
  id v6 = [(SXDataTableComponentController *)self styleFactory];
  uint64_t v7 = v6;
  if (a3 || !v5)
  {
    uint64_t v8 = [v6 rowStyleForRowIndex:a3];
  }
  else
  {
    uint64_t v8 = [v6 headerRowStyleForRowIndex:0];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (id)columnStyleForColumnIndex:(unint64_t)a3
{
  BOOL v5 = -[SXDataTableComponentController shouldTreatIndexPathAsHeader:](self, "shouldTreatIndexPathAsHeader:", -1, a3);
  if (a3 || !v5)
  {
    unint64_t v8 = a3 - [(SXDataTableComponentController *)self hasColumnHeader];
    id v6 = [(SXDataTableComponentController *)self styleFactory];
    uint64_t v7 = [v6 columnStyleForColumnIndex:v8];
  }
  else
  {
    id v6 = [(SXDataTableComponentController *)self styleFactory];
    uint64_t v7 = [v6 headerColumnStyleForColumnIndex:0];
  }
  uint64_t v9 = (void *)v7;

  return v9;
}

- (id)cellStyleForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  BOOL v6 = -[SXDataTableComponentController shouldTreatIndexPathAsHeader:](self, "shouldTreatIndexPathAsHeader:");
  uint64_t v7 = [(SXDataTableComponentController *)self styleFactory];
  unint64_t v8 = v7;
  if (v6) {
    objc_msgSend(v7, "headerCellStyleForIndexPath:", var0, var1);
  }
  else {
  uint64_t v9 = objc_msgSend(v7, "cellStyleForIndexPath:", var0, var1);
  }

  return v9;
}

- (id)recordForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if (![(SXDataTableComponentController *)self dataOrientation]) {
    unint64_t var1 = var0;
  }
  BOOL v6 = [(SXDataTableComponentController *)self records];
  uint64_t v7 = [v6 objectAtIndex:var1];

  return v7;
}

- (id)dataDescriptorForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if ([(SXDataTableComponentController *)self dataOrientation]) {
    unint64_t var1 = var0;
  }
  BOOL v6 = [(SXDataTableComponentController *)self component];
  uint64_t v7 = [v6 data];
  unint64_t v8 = [v7 descriptors];
  uint64_t v9 = [v8 objectAtIndex:var1];

  return v9;
}

- (id)dataDescriptorForIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v5 = [(SXDataTableComponentController *)self component];
  BOOL v6 = [v5 data];
  uint64_t v7 = [v6 descriptors];

  id v8 = (id)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 identifier];
        if (v12)
        {
          double v13 = (void *)v12;
          double v14 = [v11 identifier];
          int v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

- (double)minimumWidthForStorage:(id)a3 usingStringEnumeration:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 string];
  uint64_t v14 = 0;
  int v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v7 = [v6 length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__SXDataTableComponentController_minimumWidthForStorage_usingStringEnumeration___block_invoke;
  v11[3] = &unk_264653130;
  id v8 = v5;
  id v12 = v8;
  double v13 = &v14;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, a4, v11);
  double v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __80__SXDataTableComponentController_minimumWidthForStorage_usingStringEnumeration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v7 context];
  id v14 = (id)objc_msgSend(v7, "newSubstorageWithRange:context:flags:", a3, a4, v8, 0);

  double v9 = [SXTextUtilities alloc];
  double v10 = [v14 paragraphStyleAtParIndex:0 effectiveRange:0];
  uint64_t v11 = [(TSWPText *)v9 initWithParagraphStyle:v10];

  [(TSWPText *)v11 measureStorage:v14];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v13 + 24) >= v12) {
    double v12 = *(double *)(v13 + 24);
  }
  *(double *)(v13 + 24) = v12;
}

- (id)component
{
  id v3 = [(SXDataTableComponentController *)self dataSource];
  id v4 = [v3 componentForDataTableComponentController:self];

  return v4;
}

- (double)convertConvertibleValue:(_SXConvertibleValue)a3
{
  unint64_t unit = a3.unit;
  double value = a3.value;
  BOOL v6 = [(SXDataTableComponentController *)self dataSource];
  uint64_t v7 = [v6 unitConverterForDataTableComponentController:self];

  objc_msgSend(v7, "convertValueToPoints:", *(void *)&value, unit);
  double v9 = v8;

  return v9;
}

- (SXDataTableDictionary)cellObjects
{
  return self->_cellObjects;
}

- (SXDataTableDictionary)textLayouters
{
  return self->_textLayouters;
}

- (SXDataTableComponentControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SXDataTableComponentControllerDataSource *)WeakRetained;
}

- (SXDataTableStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (SXDataTableTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (SXDataRecordValueTransformerFactory)recordValueTransformerFactory
{
  return self->_recordValueTransformerFactory;
}

- (void)setRecordValueTransformerFactory:(id)a3
{
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_recordValueTransformerFactory, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_textLayouters, 0);
  objc_storeStrong((id *)&self->_cellObjects, 0);
}

@end