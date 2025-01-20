@interface UIViewController(TableViewScrollPositionSaving)
- (id)_safari_tableViewScrollPositionKey;
- (id)safari_tableViewForScrollPositionSaving;
- (uint64_t)safari_tableViewScrollPositionSaveIdentifier;
@end

@implementation UIViewController(TableViewScrollPositionSaving)

- (id)safari_tableViewForScrollPositionSaving
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 tableView];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)safari_tableViewScrollPositionSaveIdentifier
{
  return 0;
}

- (id)_safari_tableViewScrollPositionKey
{
  v1 = objc_msgSend(a1, "safari_tableViewScrollPositionSaveIdentifier");
  v2 = [@"SavedScrollPosition-" stringByAppendingString:v1];

  return v2;
}

@end