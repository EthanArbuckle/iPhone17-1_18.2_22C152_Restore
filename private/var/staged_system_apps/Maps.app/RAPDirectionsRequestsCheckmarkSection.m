@interface RAPDirectionsRequestsCheckmarkSection
- (Class)defaultCellClass;
- (id)dequeueCellForValue:(id)a3;
@end

@implementation RAPDirectionsRequestsCheckmarkSection

- (Class)defaultCellClass
{
  return (Class)objc_opt_class();
}

- (id)dequeueCellForValue:(id)a3
{
  id v3 = a3;
  v4 = [(RAPTwoLinesMenuTableViewCell *)[RAPRouteHistoryItemTableViewCell alloc] initWithStyle:3 reuseIdentifier:0];
  v5 = [v3 historyItem];
  [(RAPRouteHistoryItemTableViewCell *)v4 setHistoryItem:v5];

  return v4;
}

@end