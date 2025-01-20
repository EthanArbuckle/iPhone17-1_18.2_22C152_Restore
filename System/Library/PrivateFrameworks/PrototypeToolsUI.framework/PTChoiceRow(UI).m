@interface PTChoiceRow(UI)
- (PTUIPushViewControllerRowAction)defaultUIAction;
- (uint64_t)tableViewCellClass;
@end

@implementation PTChoiceRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

- (PTUIPushViewControllerRowAction)defaultUIAction
{
  return +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:&__block_literal_global_0];
}

@end