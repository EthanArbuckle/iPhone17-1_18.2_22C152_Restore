@interface PTEditFloatRow(UI)
- (uint64_t)tableViewCellClass;
@end

@implementation PTEditFloatRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

@end