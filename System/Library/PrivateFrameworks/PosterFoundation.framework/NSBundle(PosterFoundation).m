@interface NSBundle(PosterFoundation)
+ (id)pf_uniqueBundleWithURL:()PosterFoundation;
@end

@implementation NSBundle(PosterFoundation)

+ (id)pf_uniqueBundleWithURL:()PosterFoundation
{
  v3 = (objc_class *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] _initUniqueWithURL:v4];

  return v5;
}

@end