@interface DBSDisplayCellLayoutManager
- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4;
@end

@implementation DBSDisplayCellLayoutManager

- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v8 = [v7 userInterfaceLayoutDirection];

  v9 = [v6 contentView];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v34.receiver = self;
  v34.super_class = (Class)DBSDisplayCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v34 standardLayoutImageViewFrameForCell:v6 forSizing:v4];
  double v19 = v18;
  double v21 = v20;
  uint64_t v23 = v22;
  double v25 = v24;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8 == 1)
    {
      v35.origin.x = v11;
      v35.origin.y = v13;
      v35.size.width = v15;
      v35.size.height = v17;
      CGFloat v26 = CGRectGetWidth(v35) + -60.0;
      v27 = [v6 contentView];
      [v27 layoutMargins];
      double v19 = v26 - v28;
    }
    else
    {
      v27 = [v6 contentView];
      [v27 layoutMargins];
      double v19 = v29;
    }

    *(double *)&uint64_t v23 = 60.0;
  }

  double v30 = v19;
  double v31 = v21;
  double v32 = *(double *)&v23;
  double v33 = v25;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

@end