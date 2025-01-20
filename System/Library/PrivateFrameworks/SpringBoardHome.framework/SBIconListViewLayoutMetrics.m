@interface SBIconListViewLayoutMetrics
- (BOOL)adjustedIconContentScaleToFit;
- (BOOL)adjustedInsetsToFit;
- (BOOL)needsHorizontalColumnBumps;
- (CGSize)alignmentIconSize;
- (CGSize)iconImageSize;
- (CGSize)iconSize;
- (CGSize)iconSpacing;
- (NSString)description;
- (SBIconListGridCellInfo)gridCellInfo;
- (SBIconListModel)listModel;
- (UIEdgeInsets)iconInsets;
- (double)iconContentScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)columnOffset;
- (unint64_t)columns;
- (unint64_t)columnsUsedForLayout;
- (unint64_t)rows;
- (unint64_t)rowsUsedForLayout;
- (void)setAdjustedIconContentScaleToFit:(BOOL)a3;
- (void)setAdjustedInsetsToFit:(BOOL)a3;
- (void)setAlignmentIconSize:(CGSize)a3;
- (void)setColumnOffset:(int64_t)a3;
- (void)setColumns:(unint64_t)a3;
- (void)setColumnsUsedForLayout:(unint64_t)a3;
- (void)setGridCellInfo:(id)a3;
- (void)setIconContentScale:(double)a3;
- (void)setIconImageSize:(CGSize)a3;
- (void)setIconInsets:(UIEdgeInsets)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setIconSpacing:(CGSize)a3;
- (void)setListModel:(id)a3;
- (void)setNeedsHorizontalColumnBumps:(BOOL)a3;
- (void)setRows:(unint64_t)a3;
- (void)setRowsUsedForLayout:(unint64_t)a3;
@end

@implementation SBIconListViewLayoutMetrics

- (unint64_t)columns
{
  return self->_columns;
}

- (BOOL)needsHorizontalColumnBumps
{
  return self->_needsHorizontalColumnBumps;
}

- (CGSize)iconSpacing
{
  double width = self->_iconSpacing.width;
  double height = self->_iconSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)iconInsets
{
  double top = self->_iconInsets.top;
  double left = self->_iconInsets.left;
  double bottom = self->_iconInsets.bottom;
  double right = self->_iconInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)columnsUsedForLayout
{
  return self->_columnsUsedForLayout;
}

- (int64_t)columnOffset
{
  return self->_columnOffset;
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (SBIconListGridCellInfo)gridCellInfo
{
  return self->_gridCellInfo;
}

- (SBIconListModel)listModel
{
  return self->_listModel;
}

- (void)setRowsUsedForLayout:(unint64_t)a3
{
  self->_rowsUsedForLayout = a3;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (void)setNeedsHorizontalColumnBumps:(BOOL)a3
{
  self->_needsHorizontalColumnBumps = a3;
}

- (void)setListModel:(id)a3
{
}

- (void)setIconSpacing:(CGSize)a3
{
  self->_iconSpacing = a3;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (void)setIconInsets:(UIEdgeInsets)a3
{
  self->_iconInsets = a3;
}

- (void)setIconImageSize:(CGSize)a3
{
  self->_iconImageSize = a3;
}

- (void)setIconContentScale:(double)a3
{
  self->_iconContentScale = a3;
}

- (void)setGridCellInfo:(id)a3
{
}

- (void)setColumnsUsedForLayout:(unint64_t)a3
{
  self->_columnsUsedForLayout = a3;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (void)setAlignmentIconSize:(CGSize)a3
{
  self->_alignmentIconSize = a3;
}

- (void)setAdjustedInsetsToFit:(BOOL)a3
{
  self->_adjustedInsetsToFit = a3;
}

- (void)setAdjustedIconContentScaleToFit:(BOOL)a3
{
  self->_adjustedIconContentScaleToFit = a3;
}

- (BOOL)adjustedIconContentScaleToFit
{
  return self->_adjustedIconContentScaleToFit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridCellInfo, 0);
  objc_storeStrong((id *)&self->_listModel, 0);
}

- (CGSize)alignmentIconSize
{
  double width = self->_alignmentIconSize.width;
  double height = self->_alignmentIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewLayoutMetrics *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 16) = self->_columns;
    *(void *)(v4 + 24) = self->_rows;
    *(void *)(v4 + 32) = self->_rowsUsedForLayout;
    *(void *)(v4 + 40) = self->_columnsUsedForLayout;
    *(void *)(v4 + 48) = self->_columnOffset;
    *(CGSize *)(v4 + 80) = self->_iconSpacing;
    *(CGSize *)(v4 + 96) = self->_iconSize;
    *(CGSize *)(v4 + 112) = self->_alignmentIconSize;
    *(CGSize *)(v4 + 128) = self->_iconImageSize;
    *(double *)(v4 + 56) = self->_iconContentScale;
    long long v6 = *(_OWORD *)&self->_iconInsets.bottom;
    *(_OWORD *)(v4 + 144) = *(_OWORD *)&self->_iconInsets.top;
    *(_OWORD *)(v4 + 160) = v6;
    objc_storeStrong((id *)(v4 + 64), self->_listModel);
    uint64_t v7 = [(SBIconListGridCellInfo *)self->_gridCellInfo copy];
    v8 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v7;

    *(unsigned char *)(v5 + 8) = self->_adjustedInsetsToFit;
    *(unsigned char *)(v5 + 9) = self->_adjustedIconContentScaleToFit;
    *(unsigned char *)(v5 + 10) = self->_needsHorizontalColumnBumps;
    id v9 = (id)v5;
  }

  return (id)v5;
}

- (id)succinctDescription
{
  v2 = [(SBIconListViewLayoutMetrics *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIconListViewLayoutMetrics *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBIconListViewLayoutMetrics *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendUnsignedInteger:self->_columns withName:@"columns"];
  id v6 = (id)[v4 appendUnsignedInteger:self->_rows withName:@"rows"];
  id v7 = (id)[v4 appendUnsignedInteger:self->_rowsUsedForLayout withName:@"rowsUsedForLayout"];
  id v8 = (id)[v4 appendUnsignedInteger:self->_columnsUsedForLayout withName:@"columnsUsedForLayout"];
  id v9 = (id)[v4 appendInteger:self->_columnOffset withName:@"columnOffset"];
  id v10 = (id)objc_msgSend(v4, "appendSize:withName:", @"iconSpacing", self->_iconSpacing.width, self->_iconSpacing.height);
  id v11 = (id)objc_msgSend(v4, "appendSize:withName:", @"alignmentIconSize", self->_alignmentIconSize.width, self->_alignmentIconSize.height);
  id v12 = (id)objc_msgSend(v4, "appendSize:withName:", @"iconImageSize", self->_iconImageSize.width, self->_iconImageSize.height);
  id v13 = (id)[v4 appendFloat:@"iconContentScale" withName:self->_iconContentScale];
  v14 = NSStringFromUIEdgeInsets(self->_iconInsets);
  [v4 appendString:v14 withName:@"iconInsets"];

  id v15 = (id)[v4 appendObject:self->_gridCellInfo withName:@"gridCellInfo"];
  id v16 = (id)[v4 appendBool:self->_adjustedInsetsToFit withName:@"adjustedInsetsToFit"];
  id v17 = (id)[v4 appendBool:self->_adjustedIconContentScaleToFit withName:@"adjustedIconContentScaleToFit"];
  id v18 = (id)[v4 appendBool:self->_needsHorizontalColumnBumps withName:@"needsHorizontalColumnBumps"];
  return v4;
}

- (unint64_t)rowsUsedForLayout
{
  return self->_rowsUsedForLayout;
}

- (void)setColumnOffset:(int64_t)a3
{
  self->_columnOffset = a3;
}

- (CGSize)iconImageSize
{
  double width = self->_iconImageSize.width;
  double height = self->_iconImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)adjustedInsetsToFit
{
  return self->_adjustedInsetsToFit;
}

@end