@interface PTSliderRow(UI)
- (uint64_t)tableViewCellClass;
@end

@implementation PTSliderRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

@end