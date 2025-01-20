@interface UITableView
- (double)preferredContentHeightWithMax:(double)a3;
- (id)indexPathForRowPreceedingIndexPath:(id)a3;
- (void)setSeparatorsHidden:(BOOL)a3 forCellAtIndexPath:(id)a4;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
@end

@implementation UITableView

- (void)setSeparatorsHidden:(BOOL)a3 forCellAtIndexPath:(id)a4
{
  id v6 = a4;
  id v13 = v6;
  if (a3)
  {
    id v7 = v6;
    UITableViewCellSeparatorStyle v8 = UITableViewCellSeparatorStyleNone;
  }
  else
  {
    UITableViewCellSeparatorStyle v9 = [(UITableView *)self separatorStyle];
    id v7 = v13;
    UITableViewCellSeparatorStyle v8 = v9;
  }
  v10 = [(UITableView *)self cellForRowAtIndexPath:v7];
  if (v10)
  {
    v11 = [(UITableView *)self indexPathForRowPreceedingIndexPath:v13];
    v12 = [(UITableView *)self cellForRowAtIndexPath:v11];

    [v10 setSeparatorStyle:v8];
    [v12 setSeparatorStyle:v8];
  }
}

- (id)indexPathForRowPreceedingIndexPath:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 row] >= 1)
  {
    v5 = (char *)[v4 row] - 1;
    id v6 = (char *)[v4 section];
LABEL_6:
    UITableViewCellSeparatorStyle v8 = +[NSIndexPath indexPathForRow:v5 inSection:v6];
    goto LABEL_8;
  }
  if ((uint64_t)[v4 section] >= 1)
  {
    NSInteger v7 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", (char *)[v4 section] - 1);
    if (v7)
    {
      v5 = (char *)(v7 - 1);
      id v6 = (char *)[v4 section] - 1;
      goto LABEL_6;
    }
  }
  UITableViewCellSeparatorStyle v8 = 0;
LABEL_8:

  return v8;
}

- (double)preferredContentHeightWithMax:(double)a3
{
  v5 = [(UITableView *)self dataSource];
  id v6 = [(UITableView *)self delegate];
  id v7 = [v5 numberOfSectionsInTableView:self];
  BOOL v8 = a3 > 0.0;
  double v9 = 0.0;
  if (v7 && a3 > 0.0)
  {
    unint64_t v10 = (unint64_t)v7;
    unint64_t v11 = 0;
    do
    {
      [v6 tableView:self heightForHeaderInSection:v11];
      double v9 = v9 + v12;
      id v13 = [v5 tableView:self numberOfRowsInSection:v11];
      if (v13 && v9 < a3)
      {
        unint64_t v14 = (unint64_t)v13;
        unint64_t v15 = 1;
        do
        {
          v16 = +[NSIndexPath indexPathForRow:v15 - 1 inSection:v11];
          [v6 tableView:self heightForRowAtIndexPath:v16];
          double v18 = v17;
          char v19 = objc_opt_respondsToSelector();
          double v20 = -1.0;
          if (v19) {
            [v6 tableView:self estimatedHeightForRowAtIndexPath:v16];
          }
          if (v18 >= v20) {
            double v20 = v18;
          }
          double v9 = v9 + v20;

          if (v15 >= v14) {
            break;
          }
          ++v15;
        }
        while (v9 < a3);
      }
      ++v11;
      BOOL v8 = v9 < a3;
    }
    while (v11 < v10 && v9 < a3);
  }
  if (v8) {
    a3 = v9;
  }

  return a3;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UITableView;
  [(UITableView *)&v3 setShowsHorizontalScrollIndicator:a3];
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UITableView;
  [(UITableView *)&v3 setShowsVerticalScrollIndicator:a3];
}

@end