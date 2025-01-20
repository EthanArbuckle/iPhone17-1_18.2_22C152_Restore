@interface UITableView(IC)
- (id)ic_middleVisibleIndexPath;
@end

@implementation UITableView(IC)

- (id)ic_middleVisibleIndexPath
{
  objc_msgSend(a1, "ic_visibleRectConsideringInsets:", 1);
  v2 = objc_msgSend(a1, "indexPathsForRowsInRect:");
  if ([v2 count])
  {
    v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v2, "count") >> 1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end