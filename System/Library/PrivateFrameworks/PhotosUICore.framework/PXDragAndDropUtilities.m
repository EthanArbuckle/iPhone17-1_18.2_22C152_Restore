@interface PXDragAndDropUtilities
+ (id)fileTypeForPhotosContainer:(id)a3;
+ (id)sanitizedFileNameForString:(id)a3;
+ (unint64_t)adjustedTargetIndexForCollection:(id)a3 movedObjects:(id)a4 targetIndex:(unint64_t)a5;
@end

@implementation PXDragAndDropUtilities

+ (id)sanitizedFileNameForString:(id)a3
{
  uint64_t v3 = sanitizedFileNameForString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&sanitizedFileNameForString__onceToken, &__block_literal_global_103290);
  }
  v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &stru_1F00B0030;
  }
  v7 = v6;

  v8 = [(__CFString *)v7 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  v9 = objc_msgSend((id)sanitizedFileNameForString__regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 4, 0, objc_msgSend(v8, "length"), &stru_1F00B0030);

  return v9;
}

void __53__PXDragAndDropUtilities_sanitizedFileNameForString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(^\\.+)" options:16 error:0];
  v1 = (void *)sanitizedFileNameForString__regex;
  sanitizedFileNameForString__regex = v0;
}

+ (id)fileTypeForPhotosContainer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id *)MEMORY[0x1E4F443C8];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = (id *)MEMORY[0x1E4F443C8];
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        id v4 = (id *)MEMORY[0x1E4F44408];
      }
    }
  }
  id v6 = *v4;

  return v6;
}

+ (unint64_t)adjustedTargetIndexForCollection:(id)a3 movedObjects:(id)a4 targetIndex:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v7 count];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    if (a5 + 1 < v9) {
      unint64_t v9 = a5 + 1;
    }
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(v7, "indexOfObject:inRange:", *(void *)(*((void *)&v19 + 1) + 8 * v15), 0, v9, (void)v19);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
          [v10 addIndex:v16];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  uint64_t v17 = objc_msgSend(v10, "countOfIndexesInRange:", 0, a5);
  return a5 - v17;
}

@end