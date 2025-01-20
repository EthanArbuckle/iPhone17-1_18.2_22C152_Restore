@interface PTEditStringRow(UI)
- (uint64_t)tableViewCellClass;
@end

@implementation PTEditStringRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

@end