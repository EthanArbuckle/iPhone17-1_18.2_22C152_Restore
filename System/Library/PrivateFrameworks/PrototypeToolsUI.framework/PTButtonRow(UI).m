@interface PTButtonRow(UI)
- (uint64_t)tableViewCellClass;
@end

@implementation PTButtonRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

@end