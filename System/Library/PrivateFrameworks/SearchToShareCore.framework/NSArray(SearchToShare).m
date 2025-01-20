@interface NSArray(SearchToShare)
- (id)sts_map:()SearchToShare;
@end

@implementation NSArray(SearchToShare)

- (id)sts_map:()SearchToShare
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__NSArray_SearchToShare__sts_map___block_invoke;
  v11[3] = &unk_264A060D8;
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