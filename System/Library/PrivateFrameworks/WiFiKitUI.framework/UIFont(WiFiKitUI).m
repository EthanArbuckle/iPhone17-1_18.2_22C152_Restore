@interface UIFont(WiFiKitUI)
+ (id)preferredFontForStyle:()WiFiKitUI weight:;
@end

@implementation UIFont(WiFiKitUI)

+ (id)preferredFontForStyle:()WiFiKitUI weight:
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263F81720], "preferredFontDescriptorWithTextStyle:");
  uint64_t v8 = *MEMORY[0x263F81850];
  v3 = [NSNumber numberWithDouble:a1];
  v9[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v5 = [v2 fontDescriptorByAddingAttributes:v4];

  v6 = [MEMORY[0x263F81708] fontWithDescriptor:v5 size:0.0];

  return v6;
}

@end