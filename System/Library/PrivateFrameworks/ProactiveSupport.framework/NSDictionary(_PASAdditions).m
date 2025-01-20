@interface NSDictionary(_PASAdditions)
+ (id)_pas_dictionaryNoCopyLeavesWithPropertyListData:()_PASAdditions error:;
- (id)_pas_unlazyDictionary;
@end

@implementation NSDictionary(_PASAdditions)

- (id)_pas_unlazyDictionary
{
  if (objc_opt_respondsToSelector())
  {
    v2 = objc_msgSend(a1, "_pas_overrideUnlazyDictionary");
  }
  else
  {
    v2 = (void *)[a1 copy];
  }

  return v2;
}

+ (id)_pas_dictionaryNoCopyLeavesWithPropertyListData:()_PASAdditions error:
{
  id v5 = a3;
  v6 = +[_PASLazyPlist dictionaryWithData:v5 error:a4];
  v7 = objc_msgSend(v6, "_pas_unlazyDictionary");

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:a4];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v11 = 0;
    if (isKindOfClass)
    {
      id v11 = v9;
      if (a4) {
        *a4 = 0;
      }
    }
    id v8 = v11;
  }

  return v8;
}

@end