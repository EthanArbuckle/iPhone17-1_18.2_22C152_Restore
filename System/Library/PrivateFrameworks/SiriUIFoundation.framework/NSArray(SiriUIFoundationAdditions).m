@interface NSArray(SiriUIFoundationAdditions)
- (id)sruif_arrayByMappingWithBlock:()SiriUIFoundationAdditions;
@end

@implementation NSArray(SiriUIFoundationAdditions)

- (id)sruif_arrayByMappingWithBlock:()SiriUIFoundationAdditions
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__NSArray_SiriUIFoundationAdditions__sruif_arrayByMappingWithBlock___block_invoke;
    v10[3] = &unk_2647861F8;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateObjectsUsingBlock:v10];
    v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

@end