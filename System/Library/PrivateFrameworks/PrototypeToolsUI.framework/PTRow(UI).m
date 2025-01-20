@interface PTRow(UI)
- (uint64_t)defaultUIAction;
- (uint64_t)tableViewCellClass;
@end

@implementation PTRow(UI)

- (uint64_t)tableViewCellClass
{
  return 0;
}

- (uint64_t)defaultUIAction
{
  return 0;
}

@end