@interface NSDictionary(RTExtensions)
- (id)objectForKey:()RTExtensions defaultObject:;
@end

@implementation NSDictionary(RTExtensions)

- (id)objectForKey:()RTExtensions defaultObject:
{
  id v6 = a4;
  uint64_t v7 = [a1 objectForKey:a3];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v6;
  }
  id v10 = v9;

  return v10;
}

@end