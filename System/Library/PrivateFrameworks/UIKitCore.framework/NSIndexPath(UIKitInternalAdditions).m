@interface NSIndexPath(UIKitInternalAdditions)
- (__CFString)_ui_shortDescription;
- (uint64_t)ui_getSectionIndex:()UIKitInternalAdditions itemIndex:;
@end

@implementation NSIndexPath(UIKitInternalAdditions)

- (uint64_t)ui_getSectionIndex:()UIKitInternalAdditions itemIndex:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"NSIndexPath+UIKitAdditions.m", 68, @"Invalid parameter not satisfying: %@", @"outSectionIndex != NULL" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSIndexPath+UIKitAdditions.m", 69, @"Invalid parameter not satisfying: %@", @"outItemIndex != NULL" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  long long v12 = xmmword_186B926D0;
  uint64_t result = objc_msgSend(a1, "getIndexes:range:", &v12, 0, 2);
  uint64_t v9 = *((void *)&v12 + 1);
  *a3 = v12;
  *a4 = v9;
  return result;
}

- (__CFString)_ui_shortDescription
{
  uint64_t v2 = [a1 length];
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (v3 - 1 == i) {
        v6 = @"");
      }
      else {
        v6 = @"-";
      }
      v7 = v6;
      uint64_t v8 = [a1 indexAtPosition:i];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        [(__CFString *)v4 appendFormat:@"NSNotFound%@", v7, v10];
      }
      else {
        [(__CFString *)v4 appendFormat:@"%lu%@", v8, v7];
      }
    }
  }
  else
  {
    v4 = @"(empty)";
  }
  return v4;
}

@end