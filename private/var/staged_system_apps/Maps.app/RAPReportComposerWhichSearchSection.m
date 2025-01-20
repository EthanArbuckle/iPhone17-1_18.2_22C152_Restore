@interface RAPReportComposerWhichSearchSection
- (Class)defaultCellClass;
- (id)dequeueCellForValue:(id)a3;
@end

@implementation RAPReportComposerWhichSearchSection

- (Class)defaultCellClass
{
  return (Class)objc_opt_class();
}

- (id)dequeueCellForValue:(id)a3
{
  id v3 = a3;
  v4 = [(RAPTwoLinesMenuTableViewCell *)[RAPSearchHistoryItemTableViewCell alloc] initWithStyle:3 reuseIdentifier:0];
  [(RAPSearchHistoryItemTableViewCell *)v4 setHistoryItem:v3];

  return v4;
}

@end