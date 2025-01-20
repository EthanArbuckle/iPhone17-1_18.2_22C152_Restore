@interface UITraitCollection(PRXUITraitCollectionExtras)
+ (id)prx_traitCollectionWithCardSizeClass:()PRXUITraitCollectionExtras;
+ (uint64_t)prx_traitCollectionWithCustomBackgroundColor:()PRXUITraitCollectionExtras;
- (uint64_t)customBackgroundColor;
- (uint64_t)prx_cardSizeClass;
@end

@implementation UITraitCollection(PRXUITraitCollectionExtras)

+ (id)prx_traitCollectionWithCardSizeClass:()PRXUITraitCollectionExtras
{
  v0 = (void *)MEMORY[0x263F1CB00];
  v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = [v0 _traitCollectionWithValue:v1 forTraitNamed:@"PRXCardSizeClass"];

  return v2;
}

- (uint64_t)prx_cardSizeClass
{
  v1 = [a1 _valueForTraitNamed:@"PRXCardSizeClass"];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

+ (uint64_t)prx_traitCollectionWithCustomBackgroundColor:()PRXUITraitCollectionExtras
{
  return [MEMORY[0x263F1CB00] _traitCollectionWithValue:a3 forTraitNamed:@"customBackgroundColor"];
}

- (uint64_t)customBackgroundColor
{
  return [a1 _valueForTraitNamed:@"customBackgroundColor"];
}

@end