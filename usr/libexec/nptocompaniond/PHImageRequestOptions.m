@interface PHImageRequestOptions
+ (id)optionsForURLLoadingMode;
@end

@implementation PHImageRequestOptions

+ (id)optionsForURLLoadingMode
{
  id v2 = objc_alloc_init((Class)PHImageRequestOptions);
  [v2 setLoadingMode:0x10000];

  return v2;
}

@end