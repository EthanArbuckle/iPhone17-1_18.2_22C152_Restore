@interface TUISmartGridBox
+ (double)columnWidthWithConfiguration:(id)a3 columns:(unint64_t)a4 spacing:(double)a5;
+ (unint64_t)columnsWithConfiguration:(id)a3;
+ (unint64_t)layoutModeFromString:(id)a3;
+ (unint64_t)verticalPlacementFromString:(id)a3;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnSpacing;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)rowSpacing;
- (BOOL)acceptsDrop;
- (BOOL)balanceSections;
- (BOOL)paginated;
- (BOOL)truncate;
- (Class)layoutClass;
- (NSDictionary)configuration;
- (NSObject)columns;
- (TUIElementActionTriggerHandler)dropHandler;
- (TUIIdentifier)modelIdentifierForScrollable;
- (TUIScrollingBox)scrollBox;
- (TUISmartGridContentBox)content;
- (TUISnap)widthSnap;
- (UIEdgeInsets)gradientFraction;
- (UIEdgeInsets)gradientInsets;
- (UIEdgeInsets)insets;
- (double)decelerationRate;
- (unint64_t)columnMultiple;
- (unint64_t)layoutMode;
- (unint64_t)maxColumns;
- (unint64_t)maxPages;
- (unint64_t)rows;
- (unint64_t)verticalPlacement;
- (void)setAcceptsDrop:(BOOL)a3;
- (void)setBalanceSections:(BOOL)a3;
- (void)setColumnMultiple:(unint64_t)a3;
- (void)setColumnSpacing:(id *)a3;
- (void)setColumnWidth:(id *)a3;
- (void)setColumns:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDropHandler:(id)a3;
- (void)setGradientFraction:(UIEdgeInsets)a3;
- (void)setGradientInsets:(UIEdgeInsets)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setLayoutMode:(unint64_t)a3;
- (void)setMaxColumns:(unint64_t)a3;
- (void)setMaxPages:(unint64_t)a3;
- (void)setModelIdentifierForScrollable:(id)a3;
- (void)setPaginated:(BOOL)a3;
- (void)setRowSpacing:(id *)a3;
- (void)setRows:(unint64_t)a3;
- (void)setTruncate:(BOOL)a3;
- (void)setVerticalPlacement:(unint64_t)a3;
- (void)setWidthSnap:(id)a3;
- (void)updateWithContents:(id)a3;
@end

@implementation TUISmartGridBox

+ (unint64_t)layoutModeFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DF768 != -1)
  {
    dispatch_once(&qword_2DF768, &stru_256148);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF760 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (void)updateWithContents:(id)a3
{
  id v4 = a3;
  if ((self->_layoutMode | 4) == 4) {
    v5 = TUIHScrollBox;
  }
  else {
    v5 = TUIVScrollBox;
  }
  id v6 = (TUIScrollingBox *)objc_alloc_init(v5);
  scrollBox = self->_scrollBox;
  self->_scrollBox = v6;

  [(TUIScrollingBox *)self->_scrollBox setAcceptsDrop:self->_acceptsDrop];
  [(TUIScrollingBox *)self->_scrollBox setDropHandler:self->_dropHandler];
  [(TUIScrollingBox *)self->_scrollBox setDecelerationRate:self->_decelerationRate];
  v8 = [(TUIBox *)self identifier];
  v9 = [v8 tui_identifierByAppendingString:@"scrollable"];
  [(TUIScrollingBox *)self->_scrollBox setIdentifier:v9];

  v10 = [(TUISmartGridBox *)self modelIdentifierForScrollable];
  [(TUIScrollingBox *)self->_scrollBox setModelIdentifierForScrollable:v10];

  content = self->_content;
  if (!content)
  {
    v12 = objc_alloc_init(TUISmartGridContentBox);
    v13 = self->_content;
    self->_content = v12;

    v14 = [(TUIBox *)self identifier];
    v15 = [v14 tui_identifierByAppendingString:@"content"];
    [(TUIBox *)self->_content setIdentifier:v15];

    content = self->_content;
  }
  [(TUIContainerBox *)content updateModelChildren:v4];
  v16 = self->_scrollBox;
  v20 = self->_content;
  v17 = +[NSArray arrayWithObjects:&v20 count:1];
  [(TUIScrollingBox *)v16 updateModelChildren:v17];

  v19 = self->_scrollBox;
  v18 = +[NSArray arrayWithObjects:&v19 count:1];
  [(TUIContainerBox *)self updateModelChildren:v18];
}

+ (unint64_t)verticalPlacementFromString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (qword_2DF778 != -1)
  {
    dispatch_once(&qword_2DF778, &stru_256168);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF770 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)columnsWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [v3 columns];
  [v3 width];
  double v6 = v5;
  [v3 contentInsets];
  double v8 = v7;
  double v10 = v9;
  id v11 = [v3 columnSpacing];
  double v13 = TUILengthValueWithDefault((uint64_t)v11, v12, 0.0);
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL || !v4)
  {
    id v14 = [v3 columnWidth];
    double v16 = TUILengthValueWithDefault((uint64_t)v14, v15, 100.0);
    v17 = [v3 widthSnap];

    if (v17)
    {
      v18 = [v3 widthSnap];
      [v18 valueForValue:v6];
      double v6 = v19;
    }
    id v4 = (id)vcvtmd_u64_f64((v13 + v6 - v8 - v10) / (v13 + v16));
  }
  id v20 = [v3 columnMultiple];
  if ((unint64_t)v20 <= 1) {
    unint64_t v21 = 1;
  }
  else {
    unint64_t v21 = (unint64_t)v20;
  }
  if ((unint64_t)v4 <= v21) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = (unint64_t)v4;
  }
  unint64_t v23 = v22 / v21 * v21;
  if ([v3 maxColumns] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v24 = [v3 maxColumns];
    if ((unint64_t)v24 < v23) {
      unint64_t v23 = (unint64_t)v24;
    }
  }

  return v23;
}

+ (double)columnWidthWithConfiguration:(id)a3 columns:(unint64_t)a4 spacing:(double)a5
{
  id v7 = a3;
  [v7 width];
  double v9 = v8;
  [v7 contentInsets];
  double v12 = (v9 - v10 - v11 + a5) / (double)a4 - a5;
  [v7 columnWidth];
  LODWORD(a4) = v13;

  return fmin(v12, *(float *)&a4);
}

- (TUIIdentifier)modelIdentifierForScrollable
{
  return self->_modelIdentifierForScrollable;
}

- (void)setModelIdentifierForScrollable:(id)a3
{
}

- (UIEdgeInsets)insets
{
  double v2 = *(double *)&self->_rowSpacing.max;
  double v3 = *(double *)&self->_rowSpacing._flags;
  double top = self->_insets.top;
  double left = self->_insets.left;
  result.right = left;
  result.bottom = top;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)&self->_rowSpacing.max = a3;
}

- (NSObject)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (unint64_t)maxColumns
{
  return self->_maxColumns;
}

- (void)setMaxColumns:(unint64_t)a3
{
  self->_maxColumns = a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_columnWidth.value;
}

- (void)setColumnWidth:(id *)a3
{
  *(void *)&self->_columnWidth.value = a3;
  *(void *)&self->_columnWidth.max = v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnSpacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_columnWidth._flags;
}

- (void)setColumnSpacing:(id *)a3
{
  *(void *)&self->_columnWidth._flags = a3;
  *(void *)&self->_columnSpacing.min = v3;
}

- (unint64_t)columnMultiple
{
  return self->_columnMultiple;
}

- (void)setColumnMultiple:(unint64_t)a3
{
  self->_columnMultiple = a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)rowSpacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_columnSpacing.priority;
}

- (void)setRowSpacing:(id *)a3
{
  *(void *)&self->_columnSpacing.priority = a3;
  *(void *)&self->_rowSpacing.value = v3;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(unint64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)paginated
{
  return self->_paginated;
}

- (void)setPaginated:(BOOL)a3
{
  self->_paginated = a3;
}

- (unint64_t)verticalPlacement
{
  return self->_verticalPlacement;
}

- (void)setVerticalPlacement:(unint64_t)a3
{
  self->_verticalPlacement = a3;
}

- (UIEdgeInsets)gradientInsets
{
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  double top = self->_gradientInsets.top;
  double left = self->_gradientInsets.left;
  result.double right = left;
  result.double bottom = top;
  result.double left = right;
  result.double top = bottom;
  return result;
}

- (void)setGradientInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)&self->_insets.double bottom = a3;
}

- (UIEdgeInsets)gradientFraction
{
  double bottom = self->_gradientInsets.bottom;
  double right = self->_gradientInsets.right;
  double top = self->_gradientFraction.top;
  double left = self->_gradientFraction.left;
  result.double right = left;
  result.double bottom = top;
  result.double left = right;
  result.double top = bottom;
  return result;
}

- (void)setGradientFraction:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)&self->_gradientInsets.double bottom = a3;
}

- (TUISnap)widthSnap
{
  return self->_widthSnap;
}

- (void)setWidthSnap:(id)a3
{
}

- (BOOL)balanceSections
{
  return self->_balanceSections;
}

- (void)setBalanceSections:(BOOL)a3
{
  self->_balanceSections = a3;
}

- (BOOL)truncate
{
  return self->_truncate;
}

- (void)setTruncate:(BOOL)a3
{
  self->_truncate = a3;
}

- (unint64_t)maxPages
{
  return self->_maxPages;
}

- (void)setMaxPages:(unint64_t)a3
{
  self->_maxPages = a3;
}

- (BOOL)acceptsDrop
{
  return self->_acceptsDrop;
}

- (void)setAcceptsDrop:(BOOL)a3
{
  self->_acceptsDrop = a3;
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return self->_dropHandler;
}

- (void)setDropHandler:(id)a3
{
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRate = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (TUIScrollingBox)scrollBox
{
  return self->_scrollBox;
}

- (TUISmartGridContentBox)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_scrollBox, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dropHandler, 0);
  objc_storeStrong((id *)&self->_widthSnap, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_modelIdentifierForScrollable, 0);
}

@end