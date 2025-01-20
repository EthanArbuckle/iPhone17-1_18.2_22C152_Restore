@interface ICSRadarHelper
+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4;
@end

@implementation ICSRadarHelper

+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F08BA0];
  id v6 = a4;
  id v7 = a3;
  id v19 = objc_alloc_init(v5);
  [v19 setScheme:@"tap-to-radar"];
  [v19 setHost:@"new"];
  v8 = [MEMORY[0x263EFF980] array];
  v9 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentName" value:@"AppleAccount"];
  [v8 addObject:v9];

  v10 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentVersion" value:@"iOS"];
  [v8 addObject:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentID" value:@"511458"];
  [v8 addObject:v11];

  v12 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Classification" value:@"Serious Bug"];
  [v8 addObject:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Reproducibility" value:@"I Didn't Try"];
  [v8 addObject:v13];

  v14 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"AutoDiagnostics" value:@"phone"];
  [v8 addObject:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Title" value:v7];
  [v8 addObject:v15];

  v16 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Description" value:v6];
  [v8 addObject:v16];

  [v19 setQueryItems:v8];
  v17 = [MEMORY[0x263F01880] defaultWorkspace];
  v18 = [v19 URL];
  [v17 openURL:v18 configuration:0 completionHandler:0];
}

@end