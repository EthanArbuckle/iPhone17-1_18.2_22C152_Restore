@interface WFApplicationIconProvider
+ (id)applicationIconImageForBundleIdentifier:(id)a3 size:(CGSize)a4;
+ (id)applicationIconImageForCalendarDate:(id)a3 size:(CGSize)a4;
@end

@implementation WFApplicationIconProvider

+ (id)applicationIconImageForCalendarDate:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v6 = (objc_class *)MEMORY[0x263F4B540];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  v10 = (void *)[v8 initWithDate:v7 calendar:v9 format:0];

  v11 = UIImageFromISIcon(v10, width, height);

  return v11;
}

+ (id)applicationIconImageForBundleIdentifier:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if ([v7 isEqualToString:@"com.apple.mobilecal"])
  {
    id v8 = [MEMORY[0x263EFF910] date];
    v9 = objc_msgSend(a1, "applicationIconImageForCalendarDate:size:", v8, width, height);
    goto LABEL_9;
  }
  v10 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v7];
  v11 = [v10 appState];
  char v12 = [v11 isInstalled];

  if (v12)
  {
    id v8 = v10;
LABEL_7:
    v15 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithResourceProxy:v10];
    v9 = UIImageFromISIcon(v15, width, height);

    goto LABEL_9;
  }
  id v8 = [MEMORY[0x263F01868] applicationProxyForSystemPlaceholder:v7];

  v13 = [v8 appState];
  int v14 = [v13 isPlaceholder];

  if (v14)
  {
    v10 = v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

@end