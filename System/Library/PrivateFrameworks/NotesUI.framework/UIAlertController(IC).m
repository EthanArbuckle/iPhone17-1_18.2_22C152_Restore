@interface UIAlertController(IC)
+ (uint64_t)ic_showAlertWithTitle:()IC viewController:;
+ (void)ic_showAlertWithTitle:()IC message:viewController:;
@end

@implementation UIAlertController(IC)

+ (uint64_t)ic_showAlertWithTitle:()IC viewController:
{
  return objc_msgSend(a1, "ic_showAlertWithTitle:message:viewController:", a3, 0, a4);
}

+ (void)ic_showAlertWithTitle:()IC message:viewController:
{
  id v7 = a5;
  v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v9 = (void *)MEMORY[0x1E4FB1410];
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  v11 = [v9 actionWithTitle:v10 style:0 handler:0];
  [v8 addAction:v11];

  v14 = v7;
  v15 = v8;
  id v12 = v8;
  id v13 = v7;
  performBlockOnMainThread();
}

@end