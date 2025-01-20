@interface PSListController(Utility)
- (void)configureSpin:()Utility ofCellForSpecifier:setEnabled:;
@end

@implementation PSListController(Utility)

- (void)configureSpin:()Utility ofCellForSpecifier:setEnabled:
{
  v7 = [a4 propertyForKey:*MEMORY[0x263F602B0]];
  if (v7)
  {
    id v9 = v7;
    if (a3)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v8 startAnimating];
      [v9 setAccessoryView:v8];
    }
    else
    {
      [v7 setAccessoryView:0];
    }
    [v9 setCellEnabled:a5];
    v7 = v9;
  }
}

@end