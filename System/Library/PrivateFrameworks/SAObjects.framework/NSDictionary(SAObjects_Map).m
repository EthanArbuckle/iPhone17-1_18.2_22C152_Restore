@interface NSDictionary(SAObjects_Map)
- (id)_sa_mappedDictionaryWithBlock:()SAObjects_Map;
@end

@implementation NSDictionary(SAObjects_Map)

- (id)_sa_mappedDictionaryWithBlock:()SAObjects_Map
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __61__NSDictionary_SAObjects_Map___sa_mappedDictionaryWithBlock___block_invoke;
  v13 = &unk_1E5CE09F8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end