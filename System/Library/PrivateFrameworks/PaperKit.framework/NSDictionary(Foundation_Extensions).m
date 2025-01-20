@interface NSDictionary(Foundation_Extensions)
- (id)muDeepMutableCopy;
@end

@implementation NSDictionary(Foundation_Extensions)

- (id)muDeepMutableCopy
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__NSDictionary_Foundation_Extensions__muDeepMutableCopy__block_invoke;
  v5[3] = &unk_2640D3D18;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

@end