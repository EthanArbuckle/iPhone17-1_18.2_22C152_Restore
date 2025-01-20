@interface UITableConstants_Pad
+ (id)sharedConstants;
- (BOOL)supportsUserInterfaceStyles;
- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4;
- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (double)defaultRowHeightForTableView:(id)a3;
- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4;
- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4;
@end

@implementation UITableConstants_Pad

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_1;
  if (!sharedConstants___sharedConstants_1)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_1;
    sharedConstants___sharedConstants_1 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_1;
  }
  return v3;
}

- (BOOL)supportsUserInterfaceStyles
{
  return 0;
}

- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UITableConstants_Pad;
  [(UITableConstants_IOS *)&v9 defaultRowHeightForTableView:a3 cellStyle:a4];
  double v6 = v5;
  int ShouldUseExtraPaddingForCells = TableShouldUseExtraPaddingForCells(a3);
  double result = v6 + 8.0;
  if (!ShouldUseExtraPaddingForCells) {
    return v6;
  }
  return result;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  [(UITableConstants_Pad *)self defaultRowHeightForTableView:a3 cellStyle:0];
  return result;
}

- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UITableConstants_Pad;
  [(UITableConstants_IOS *)&v5 minimumContentViewHeightForFont:a3 traitCollection:a4];
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)UITableConstants_Pad;
  -[UITableConstants_IOS defaultLayoutMarginsForCell:inTableView:](&v18, sel_defaultLayoutMarginsForCell_inTableView_, a3);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  int ShouldUseExtraPaddingForCells = TableShouldUseExtraPaddingForCells(a4);
  if (ShouldUseExtraPaddingForCells) {
    double v14 = v10 + 4.0;
  }
  else {
    double v14 = v10;
  }
  if (ShouldUseExtraPaddingForCells) {
    double v15 = v6 + 4.0;
  }
  else {
    double v15 = v6;
  }
  double v16 = v8;
  double v17 = v12;
  result.right = v17;
  result.bottom = v14;
  result.left = v16;
  result.top = v15;
  return result;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v7.receiver = self;
  v7.super_class = (Class)UITableConstants_Pad;
  return (_UITableConstantsBackgroundProperties *)[(_UITableConstantsBackgroundProperties *)&v7 defaultCellBackgroundPropertiesForTableViewStyle:a4 state:a5 traitCollection:a6];
}

- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v7.receiver = self;
  v7.super_class = (Class)UITableConstants_Pad;
  return (_UITableConstantsBackgroundProperties *)[(_UITableConstantsBackgroundProperties *)&v7 defaultSidebarCellBackgroundPropertiesForStyle:a4 state:a5 traitCollection:a6];
}

@end