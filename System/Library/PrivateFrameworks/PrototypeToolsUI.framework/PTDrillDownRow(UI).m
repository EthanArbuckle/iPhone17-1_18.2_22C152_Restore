@interface PTDrillDownRow(UI)
- (id)defaultUIAction;
- (uint64_t)tableViewCellClass;
@end

@implementation PTDrillDownRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

- (id)defaultUIAction
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__PTDrillDownRow_UI__defaultUIAction__block_invoke;
  v3[3] = &unk_26425EDC0;
  v3[4] = a1;
  v1 = +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:v3];

  return v1;
}

@end