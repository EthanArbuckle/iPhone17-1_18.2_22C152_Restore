@interface SiriSharedUICAFiltering
+ (void)applyGaussianBlurFilterToView:(id)a3;
@end

@implementation SiriSharedUICAFiltering

+ (void)applyGaussianBlurFilterToView:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F157C8];
  uint64_t v4 = *MEMORY[0x263F15BC8];
  id v5 = a3;
  v6 = [v3 filterWithType:v4];
  [v6 setValue:&unk_26C1AE5C0 forKeyPath:*MEMORY[0x263F15C80]];
  v7 = [v5 layer];

  v9[0] = v6;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v7 setFilters:v8];
}

@end