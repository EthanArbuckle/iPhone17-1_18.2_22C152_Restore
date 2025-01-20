@interface NSPredicate(VideosUICore)
+ (id)_vui_keyPathsInComparisonPredicate:()VideosUICore;
+ (id)_vui_keyPathsInCompoundPredicate:()VideosUICore;
+ (id)_vui_keyPathsInPredicate:()VideosUICore;
+ (id)vui_keyPathBitTestPredicateWithKeyPath:()VideosUICore value:;
+ (id)vui_predicateWithSubpredicates:()VideosUICore type:;
+ (uint64_t)vui_equalPredicateWithKeyPath:()VideosUICore value:;
+ (uint64_t)vui_inPredicateWithKeyPath:()VideosUICore value:;
+ (uint64_t)vui_notEqualPredicateWithKeyPath:()VideosUICore value:;
- (uint64_t)vui_keyPathsInPredicate;
@end

@implementation NSPredicate(VideosUICore)

+ (uint64_t)vui_equalPredicateWithKeyPath:()VideosUICore value:
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", a3, a4];
}

+ (uint64_t)vui_notEqualPredicateWithKeyPath:()VideosUICore value:
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", a3, a4];
}

+ (uint64_t)vui_inPredicateWithKeyPath:()VideosUICore value:
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", a3, a4];
}

+ (id)vui_keyPathBitTestPredicateWithKeyPath:()VideosUICore value:
{
  v0 = objc_msgSend(MEMORY[0x1E4F28C68], "vui_keyPathBitTestExpressionWithKeyPath:value:");
  v1 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1F3DFD6B0];
  v2 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v0 rightExpression:v1 modifier:0 type:5 options:0];

  return v2;
}

+ (id)vui_predicateWithSubpredicates:()VideosUICore type:
{
  id v5 = a3;
  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The compound predicate type must be NSAndPredicateType or NSOrPredicateType"];
  }
  if ([v5 count] == 1)
  {
    uint64_t v6 = [v5 firstObject];
LABEL_7:
    v7 = (void *)v6;
    goto LABEL_9;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:a4 subpredicates:v5];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (uint64_t)vui_keyPathsInPredicate
{
  v2 = objc_opt_class();
  return objc_msgSend(v2, "_vui_keyPathsInPredicate:", a1);
}

+ (id)_vui_keyPathsInPredicate:()VideosUICore
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_msgSend(a1, "_vui_keyPathsInCompoundPredicate:", v4);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = objc_msgSend(a1, "_vui_keyPathsInComparisonPredicate:", v4);
      if (v6)
      {
        id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
      char v8 = [v4 isEqual:v7];

      if ((v8 & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported predicate: %@", v4 format];
      }
      id v5 = 0;
    }
  }

  return v5;
}

+ (id)_vui_keyPathsInCompoundPredicate:()VideosUICore
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(v4, "subpredicates", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "_vui_keyPathsInPredicate:", *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          [v5 unionSet:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_vui_keyPathsInComparisonPredicate:()VideosUICore
{
  v3 = [a3 leftExpression];
  if ([v3 expressionType] == 3) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [v4 keyPath];

  return v5;
}

@end