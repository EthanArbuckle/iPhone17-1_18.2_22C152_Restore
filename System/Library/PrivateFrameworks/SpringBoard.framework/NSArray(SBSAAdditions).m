@interface NSArray(SBSAAdditions)
- (id)sbsa_arrayByAddingOrReplacingObject:()SBSAAdditions passingTest:;
- (id)sbsa_arrayByAddingOrReplacingObjectMatchingClass:()SBSAAdditions;
- (id)sbsa_onlyObjectOrNil;
- (uint64_t)sbsa_onlyObjectOrNilAssert;
@end

@implementation NSArray(SBSAAdditions)

- (uint64_t)sbsa_onlyObjectOrNilAssert
{
  if ((unint64_t)[a1 count] >= 2)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, a1, @"SBSystemApertureUtilities.m", 150, @"Collection contains more than a single object: %@", a1 object file lineNumber description];
  }
  return [a1 lastObject];
}

- (id)sbsa_onlyObjectOrNil
{
  if ([a1 count] == 1)
  {
    v2 = [a1 lastObject];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)sbsa_arrayByAddingOrReplacingObject:()SBSAAdditions passingTest:
{
  id v6 = a3;
  id v7 = a1;
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 indexOfObjectPassingTest:a4];
    v10 = (void *)[v8 mutableCopy];
    v11 = v10;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      [v10 addObject:v6];
    }
    else {
      [v10 replaceObjectAtIndex:v9 withObject:v6];
    }
  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (id)sbsa_arrayByAddingOrReplacingObjectMatchingClass:()SBSAAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__NSArray_SBSAAdditions__sbsa_arrayByAddingOrReplacingObjectMatchingClass___block_invoke;
  v8[3] = &unk_1E6AF83F0;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "sbsa_arrayByAddingOrReplacingObject:passingTest:", v5, v8);

  return v6;
}

@end