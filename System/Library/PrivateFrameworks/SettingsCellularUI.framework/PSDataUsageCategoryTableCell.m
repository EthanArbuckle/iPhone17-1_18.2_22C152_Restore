@interface PSDataUsageCategoryTableCell
- (PSDataUsageCategoryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PSDataUsageCategoryTableCell

- (PSDataUsageCategoryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PSDataUsageCategoryTableCell;
  v4 = [(PSMultilineTitleTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PSMultilineTitleTableCell *)v4 titleLeadingCon];
    [v6 setConstant:44.0];
  }
  return v5;
}

@end