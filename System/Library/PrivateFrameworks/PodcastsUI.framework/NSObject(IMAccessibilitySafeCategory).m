@interface NSObject(IMAccessibilitySafeCategory)
- (id)_accessibilityFindDescendant:()IMAccessibilitySafeCategory;
- (id)_imaxFindAncestor:()IMAccessibilitySafeCategory;
- (id)imaxAncestorIsKindOf:()IMAccessibilitySafeCategory;
- (id)imaxDescendentOfType:()IMAccessibilitySafeCategory;
- (id)imaxElementIsAncestor:()IMAccessibilitySafeCategory;
- (id)imaxIdentification;
- (id)imaxStorageValueForKey:()IMAccessibilitySafeCategory;
- (id)imaxValueForKey:()IMAccessibilitySafeCategory;
- (id)imaxValueForKeyPath:()IMAccessibilitySafeCategory;
- (uint64_t)imaxBoolForKey:()IMAccessibilitySafeCategory;
- (uint64_t)imaxUnignoredDescendant;
- (void)imaxSetIdentification:()IMAccessibilitySafeCategory;
- (void)imaxStorageSetRetainedValue:()IMAccessibilitySafeCategory forKey:;
@end

@implementation NSObject(IMAccessibilitySafeCategory)

- (id)imaxIdentification
{
  return objc_getAssociatedObject(a1, &AXIdentifier);
}

- (void)imaxSetIdentification:()IMAccessibilitySafeCategory
{
}

- (void)imaxStorageSetRetainedValue:()IMAccessibilitySafeCategory forKey:
{
  id v6 = a4;
  id value = a3;
  objc_setAssociatedObject(a1, (const void *)[v6 hash], value, (void *)0x301);
}

- (id)imaxStorageValueForKey:()IMAccessibilitySafeCategory
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, (const void *)[v4 hash]);

  return v5;
}

- (id)imaxValueForKey:()IMAccessibilitySafeCategory
{
  id v4 = a3;
  v5 = [a1 valueForKey:v4];

  return v5;
}

- (id)imaxValueForKeyPath:()IMAccessibilitySafeCategory
{
  id v4 = a3;
  v5 = [a1 valueForKeyPath:v4];

  return v5;
}

- (uint64_t)imaxBoolForKey:()IMAccessibilitySafeCategory
{
  v1 = objc_msgSend(a1, "imaxValueForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_imaxFindAncestor:()IMAccessibilitySafeCategory
{
  id v4 = a3;
  v5 = [a1 imaxValueForKey:@"accessibilityContainer"];
  if (v5)
  {
    do
    {
      if (v4[2](v4, v5)) {
        break;
      }
      uint64_t v6 = [v5 imaxValueForKey:@"accessibilityContainer"];

      v5 = (void *)v6;
    }
    while (v6);
  }

  return v5;
}

- (id)imaxElementIsAncestor:()IMAccessibilitySafeCategory
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__NSObject_IMAccessibilitySafeCategory__imaxElementIsAncestor___block_invoke;
  v8[3] = &unk_1E6E20560;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 _imaxFindAncestor:v8];

  return v6;
}

- (id)imaxAncestorIsKindOf:()IMAccessibilitySafeCategory
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__NSObject_IMAccessibilitySafeCategory__imaxAncestorIsKindOf___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  v3 = [a1 _imaxFindAncestor:v5];

  return v3;
}

- (id)_accessibilityFindDescendant:()IMAccessibilitySafeCategory
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
  [v5 addObject:a1];
  if ([v5 count])
  {
    while (1)
    {
      uint64_t v6 = [v5 lastObject];
      [v5 removeLastObject];
      if (v4[2](v4, v6)) {
        break;
      }
      uint64_t v7 = [v6 accessibilityElementCount];
      if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          v10 = objc_msgSend(v6, "subviews", 0);
          v11 = [v10 reverseObjectEnumerator];
          v12 = [v11 allObjects];

          uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v19;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v19 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v5 addObject:*(void *)(*((void *)&v18 + 1) + 8 * i)];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
            }
            while (v14);
          }
        }
      }
      else
      {
        unint64_t v8 = v7 + 1;
        do
        {
          id v9 = [v6 accessibilityElementAtIndex:v8 - 2];
          if (v9) {
            [v5 addObject:v9];
          }

          --v8;
        }
        while (v8 > 1);
      }

      if (![v5 count]) {
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)imaxDescendentOfType:()IMAccessibilitySafeCategory
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__NSObject_IMAccessibilitySafeCategory__imaxDescendentOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  v3 = [a1 _accessibilityFindDescendant:v5];

  return v3;
}

- (uint64_t)imaxUnignoredDescendant
{
  return [a1 _accessibilityFindDescendant:&__block_literal_global_10];
}

@end