@interface NSItemProvider(NSURL)
+ (id)itemProviderWithURL:()NSURL title:;
@end

@implementation NSItemProvider(NSURL)

+ (id)itemProviderWithURL:()NSURL title:
{
  id v5 = a3;
  [v5 _setTitle:a4];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v5];

  return v6;
}

@end