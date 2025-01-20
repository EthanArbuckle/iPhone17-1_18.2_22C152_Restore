@interface UIViewController
- (BOOL)safari_hasSavedTableViewScrollPosition;
- (BOOL)safari_restoreTableViewScrollPosition;
- (void)safari_saveTableViewScrollPosition;
@end

@implementation UIViewController

- (void)safari_saveTableViewScrollPosition
{
  v42[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = objc_msgSend(a1, "safari_tableViewForScrollPositionSaving");
    v3 = v2;
    if (v2)
    {
      uint64_t v4 = [v2 numberOfSections];
      if (v4)
      {
        [v3 rectForSection:v4 - 1];
        double MaxY = CGRectGetMaxY(v43);
        [v3 frame];
        double Height = CGRectGetHeight(v44);
        [v3 adjustedContentInset];
        double v8 = Height - v7;
        v9 = [v3 tableHeaderView];
        [v9 frame];
        double v10 = v8 + CGRectGetHeight(v45);

        if (MaxY >= v10)
        {
          v11 = [v3 indexPathsForVisibleRows];
          v12 = [v11 firstObject];

          if (v12)
          {
            [v3 contentOffset];
            double v14 = v13;
            double v16 = v15;
            [v3 rectForRowAtIndexPath:v12];
            CGRect v47 = CGRectOffset(v46, -v14, -v16);
            CGFloat x = v47.origin.x;
            CGFloat y = v47.origin.y;
            CGFloat width = v47.size.width;
            CGFloat v20 = v47.size.height;
            uint64_t v21 = [v12 section];
            [v3 rectForHeaderInSection:v21];
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            v48.origin.CGFloat x = x;
            v48.origin.CGFloat y = y;
            v48.size.CGFloat width = width;
            v48.size.height = v20;
            double MinY = CGRectGetMinY(v48);
            v49.origin.CGFloat x = v23;
            v49.origin.CGFloat y = v25;
            v49.size.CGFloat width = v27;
            v49.size.height = v29;
            double v31 = MinY - CGRectGetHeight(v49);
            [v3 adjustedContentInset];
            double v33 = v31 - v32;
            v41[0] = @"VisibleIndexSection";
            v34 = [MEMORY[0x1E4F28ED0] numberWithInteger:v21];
            v42[0] = v34;
            v41[1] = @"VisibleIndexRow";
            v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v12, "row"));
            v42[1] = v35;
            v41[2] = @"VisibleIndexOffset";
            v36 = [MEMORY[0x1E4F28ED0] numberWithDouble:v33];
            v42[2] = v36;
            v41[3] = @"Timestamp";
            v37 = [MEMORY[0x1E4F1C9C8] date];
            v42[3] = v37;
            v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];

            v39 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            v40 = objc_msgSend(a1, "_safari_tableViewScrollPositionKey");
            [v39 setObject:v38 forKey:v40];
          }
        }
      }
    }
  }
}

- (BOOL)safari_restoreTableViewScrollPosition
{
  if (!a1) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = objc_msgSend(a1, "_safari_tableViewScrollPositionKey");
  uint64_t v4 = [v2 dictionaryForKey:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 valueForKey:@"Timestamp"];
    double v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;

    BOOL v10 = v9 <= 480.0;
    if (v9 <= 480.0)
    {
      v11 = objc_msgSend(a1, "safari_tableViewForScrollPositionSaving");
      if (v11)
      {
        v12 = objc_msgSend(v5, "safari_numberForKey:", @"VisibleIndexSection");
        uint64_t v13 = objc_msgSend(v5, "safari_numberForKey:", @"VisibleIndexRow");
        double v14 = (void *)v13;
        if (v12
          && v13
          && (uint64_t v15 = [v12 integerValue], v15 < objc_msgSend(v11, "numberOfSections"))
          && (uint64_t v16 = [v14 integerValue],
              v16 < objc_msgSend(v11, "numberOfRowsInSection:", objc_msgSend(v12, "integerValue"))))
        {
          v17 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v14, "integerValue"), objc_msgSend(v12, "integerValue"));
          [v11 scrollToRowAtIndexPath:v17 atScrollPosition:1 animated:0];
          v18 = objc_msgSend(v5, "safari_numberForKey:", @"VisibleIndexOffset");
          if (v18)
          {
            [v11 contentOffset];
            double v20 = v19;
            double v22 = v21;
            [v18 floatValue];
            objc_msgSend(v11, "setContentOffset:", v20, v22 - v23);
          }
        }
        else
        {
          -[UITableView safari_adjustContentOffsetToTopHidingTableHeaderView](v11);
        }
      }
      [v2 removeObjectForKey:v3];
    }
    else
    {
      [v2 removeObjectForKey:v3];
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)safari_hasSavedTableViewScrollPosition
{
  BOOL v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3 = objc_msgSend((id)v1, "_safari_tableViewScrollPositionKey");
    uint64_t v4 = [v2 objectForKey:v3];
    BOOL v1 = v4 != 0;
  }
  return v1;
}

@end