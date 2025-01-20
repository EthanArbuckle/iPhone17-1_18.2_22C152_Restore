@interface SPUIKeyboardGaussianBlurView
+ (Class)layerClass;
- (SPUIKeyboardGaussianBlurView)init;
@end

@implementation SPUIKeyboardGaussianBlurView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SPUIKeyboardGaussianBlurView)init
{
  v9[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)SPUIKeyboardGaussianBlurView;
  v2 = [(SPUIKeyboardGaussianBlurView *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v3 setName:@"blur"];
    [v3 setValue:&unk_26F10BD48 forKey:*MEMORY[0x263F15C80]];
    [v3 setValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F15C68]];
    v9[0] = v3;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    v5 = [(SPUIKeyboardGaussianBlurView *)v2 layer];
    [v5 setFilters:v4];

    v6 = [(SPUIKeyboardGaussianBlurView *)v2 layer];
    [v6 setScale:0.125];
  }
  return v2;
}

@end