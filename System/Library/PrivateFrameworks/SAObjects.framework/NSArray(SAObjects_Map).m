@interface NSArray(SAObjects_Map)
- (id)_sa_mappedArrayWithBlock:()SAObjects_Map;
@end

@implementation NSArray(SAObjects_Map)

- (id)_sa_mappedArrayWithBlock:()SAObjects_Map
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __51__NSArray_SAObjects_Map___sa_mappedArrayWithBlock___block_invoke;
  v13 = &unk_1E5CD7C68;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end