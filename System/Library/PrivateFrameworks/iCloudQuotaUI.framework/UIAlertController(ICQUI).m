@interface UIAlertController(ICQUI)
+ (id)sheetAlertControllerWithTitle:()ICQUI message:;
@end

@implementation UIAlertController(ICQUI)

+ (id)sheetAlertControllerWithTitle:()ICQUI message:
{
  v5 = (void *)MEMORY[0x263F82670];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 currentDevice];
  BOOL v9 = [v8 userInterfaceIdiom] != 0;

  v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v6 preferredStyle:v9];

  return v10;
}

@end