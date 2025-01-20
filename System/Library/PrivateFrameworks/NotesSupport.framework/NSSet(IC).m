@interface NSSet(IC)
+ (id)ic_setFromNonNilArray:()IC;
+ (id)ic_setFromNonNilObject:()IC;
- (BOOL)ic_containsObjectPassingTest:()IC;
- (id)ic_compactMap:()IC;
- (id)ic_map:()IC;
- (id)ic_objectOfClass:()IC;
- (id)ic_objectPassingTest:()IC;
- (id)ic_objectsConformingToProtocol:()IC;
- (id)ic_objectsOfClass:()IC;
- (uint64_t)ic_containsObjectMatchingPredicate:()IC;
@end

@implementation NSSet(IC)

- (uint64_t)ic_containsObjectMatchingPredicate:()IC
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__NSSet_IC__ic_containsObjectMatchingPredicate___block_invoke;
  v8[3] = &unk_2640CE2A0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "ic_containsObjectPassingTest:", v8);

  return v6;
}

- (BOOL)ic_containsObjectPassingTest:()IC
{
  v1 = objc_msgSend(a1, "ic_objectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)ic_objectPassingTest:()IC
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__NSSet_IC__ic_objectPassingTest___block_invoke;
  v9[3] = &unk_2640CE278;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 objectsPassingTest:v9];
  v7 = [v6 anyObject];

  return v7;
}

- (id)ic_objectsOfClass:()IC
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__NSSet_IC__ic_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v5[4] = a3;
  v3 = [a1 objectsPassingTest:v5];
  return v3;
}

+ (id)ic_setFromNonNilObject:()IC
{
  if (a3) {
    objc_msgSend(a1, "setWithObject:");
  }
  else {
  v3 = [MEMORY[0x263EFFA08] set];
  }
  return v3;
}

- (id)ic_map:()IC
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __20__NSSet_IC__ic_map___block_invoke;
  v13 = &unk_2640CE2E8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ic_compactMap:()IC
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __27__NSSet_IC__ic_compactMap___block_invoke;
  v13 = &unk_2640CE2E8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

+ (id)ic_setFromNonNilArray:()IC
{
  id v4 = (void *)MEMORY[0x263EFFA68];
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  id v6 = [a1 setWithArray:v5];

  return v6;
}

- (id)ic_objectsConformingToProtocol:()IC
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__NSSet_IC__ic_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_2640CE2A0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 objectsPassingTest:v8];

  return v6;
}

- (id)ic_objectOfClass:()IC
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__NSSet_IC__ic_objectOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "ic_objectPassingTest:", v5);
  return v3;
}

@end