@interface PTSwitchRow(UI)
- (uint64_t)tableViewCellClass;
@end

@implementation PTSwitchRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

@end