@interface NSArray(Map)
- (id)mapObjectsUsingBlock:()Map;
@end

@implementation NSArray(Map)

- (id)mapObjectsUsingBlock:()Map
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__NSArray_Map__mapObjectsUsingBlock___block_invoke;
  v11[3] = &unk_1E69BE950;
  id v6 = v5;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v13;
  id v9 = v6;

  return v9;
}

@end