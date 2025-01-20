@interface UIBarButtonItem(SSSAdditions)
+ (id)_sss_cropItemWithTarget:()SSSAdditions action:;
+ (id)_sss_redoItemWithTarget:()SSSAdditions action:;
+ (id)_sss_shareItemWithTarget:()SSSAdditions action:;
+ (id)_sss_trashItemWithTarget:()SSSAdditions action:;
+ (id)_sss_undoItemWithTarget:()SSSAdditions action:;
@end

@implementation UIBarButtonItem(SSSAdditions)

+ (id)_sss_undoItemWithTarget:()SSSAdditions action:
{
  v5 = (objc_class *)MEMORY[0x263F1C468];
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x263F1C6B0], "systemImageNamed:", @"arrow.uturn.backward.circle"), 0, v6, a4);

  return v8;
}

+ (id)_sss_redoItemWithTarget:()SSSAdditions action:
{
  v5 = (objc_class *)MEMORY[0x263F1C468];
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x263F1C6B0], "systemImageNamed:", @"arrow.uturn.forward.circle"), 0, v6, a4);

  return v8;
}

+ (id)_sss_shareItemWithTarget:()SSSAdditions action:
{
  v5 = (objc_class *)MEMORY[0x263F1C468];
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x263F1C6B0], "systemImageNamed:", @"square.and.arrow.up"), 0, v6, a4);

  return v8;
}

+ (id)_sss_trashItemWithTarget:()SSSAdditions action:
{
  v5 = (objc_class *)MEMORY[0x263F1C468];
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x263F1C6B0], "systemImageNamed:", @"trash"), 0, v6, a4);

  return v8;
}

+ (id)_sss_cropItemWithTarget:()SSSAdditions action:
{
  v5 = (objc_class *)MEMORY[0x263F1C468];
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x263F1C6B0], "systemImageNamed:", @"crop"), 0, v6, a4);

  return v8;
}

@end