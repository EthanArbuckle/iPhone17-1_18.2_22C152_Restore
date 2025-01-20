@interface NSArray(QueryUtils)
- (id)mapNonEmpty:()QueryUtils;
@end

@implementation NSArray(QueryUtils)

- (id)mapNonEmpty:()QueryUtils
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__NSArray_QueryUtils__mapNonEmpty___block_invoke;
  v11[3] = &unk_1E635A360;
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