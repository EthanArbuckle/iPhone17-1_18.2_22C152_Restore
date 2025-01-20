@interface SBHIconGridSizeClassSizeMap
+ (SBHIconGridSizeClassSizeMap)allocWithZone:(_NSZone *)a3;
- (BOOL)gridSizesMatchDefault;
- (BOOL)hasGridSizeForGridSizeClass:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)largestGridSizeClass;
- (NSString)tallestGridSizeClass;
- (NSString)widestGridSizeClass;
- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3;
- (SBHIconGridSizeClassSizeMap)init;
- (SBHIconGridSizeClassSizeMap)initWithGridSize:(SBHIconGridSize)a3 forGridSizeClass:(id)a4;
- (SBHIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3;
- (SBHIconGridSizeClassSizeMap)initWithGridSizeClassesAndGridSizes:(id)a3;
- (SBHIconGridSizeClassSizeMap)initWithIconGridSizeClassSizeMap:(id)a3;
- (id)_sizes;
- (id)_sizesSortedByArea;
- (id)bestGridSizeClassForGridSize:(SBHIconGridSize)a3;
- (id)bestGridSizeClassForGridSize:(SBHIconGridSize)a3 allowedGridSizeClasses:(id)a4;
- (id)descriptionWithGridSizeClassDomain:(id)a3;
- (id)gridSizeClassLargerThanGridSizeClass:(id)a3 allowedGridSizeClasses:(id)a4;
- (id)gridSizeClassSmallerThanGridSizeClass:(id)a3 allowedGridSizeClasses:(id)a4;
- (id)gridSizeClassesSortedByGridArea;
- (id)gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:(id)a3;
- (id)largestGridSizeClassWhichTilesInGridSize:(SBHIconGridSize)a3;
- (id)largestGridSizeClassWhichTilesInGridSize:(SBHIconGridSize)a3 allowedGridSizeClasses:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)shortestGridSizeClassWithWidth:(unsigned __int16)a3;
- (id)shortestGridSizeClassWithWidth:(unsigned __int16)a3 allowedGridSizeClasses:(id)a4;
- (unint64_t)hash;
- (unsigned)gridSizeAreaForGridSizeClass:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3 gridSizeClassDomain:(id)a4;
- (void)enumerateGridSizesFilteringBySet:(id)a3 usingBlock:(id)a4;
- (void)enumerateGridSizesInSet:(id)a3 usingBlock:(id)a4;
- (void)enumerateGridSizesSortedByAreaWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateGridSizesUsingBlock:(id)a3;
@end

@implementation SBHIconGridSizeClassSizeMap

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3
{
  id v4 = a3;
  v5 = [(SBHIconGridSizeClassSizeMap *)self _sizes];
  v6 = [v5 objectForKey:v4];

  if (v6) {
    SBHIconGridSize v7 = (SBHIconGridSize)objc_msgSend(v6, "sbh_SBHIconGridSizeValue");
  }
  else {
    SBHIconGridSize v7 = (SBHIconGridSize)65537;
  }

  return v7;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  [(SBHIconGridSizeClassSizeMap *)self appendDescriptionToFormatter:v3];
  id v4 = [v3 description];

  return (NSString *)v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  id v5 = +[SBHIconGridSizeClassDomain globalDomain];
  [(SBHIconGridSizeClassSizeMap *)self appendDescriptionToFormatter:v4 gridSizeClassDomain:v5];
}

- (void)appendDescriptionToFormatter:(id)a3 gridSizeClassDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SBHIconGridSizeClassSizeMap_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke;
  v10[3] = &unk_1E6AAFC48;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:v10];
}

- (void)enumerateGridSizesUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, uint64_t, unint64_t, char *))a3;
  [(SBHIconGridSizeClassSizeMap *)self _sizes];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
      SBHIconGridSize v12 = (SBHIconGridSize)[(SBHIconGridSizeClassSizeMap *)self gridSizeForGridSizeClass:v11];
      char v13 = 0;
      unint64_t v3 = v3 & 0xFFFFFFFF00000000 | *(unsigned int *)&v12;
      v5[2](v5, v11, v3, &v13);
      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __80__SBHIconGridSizeClassSizeMap_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v7 = a2;
  id v5 = SBHStringForIconGridSize(a3);
  id v6 = [*(id *)(a1 + 32) descriptionForGridSizeClass:v7];
  if (!v6) {
    id v6 = v7;
  }
  [*(id *)(a1 + 40) appendString:v5 withName:v6 skipIfEmpty:0];
}

+ (SBHIconGridSizeClassSizeMap)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (SBHIconGridSizeClassSizeMap *)+[SBHIconGridSizeClassSizeMap allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SBHIconGridSizeClassSizeMap;
    return (SBHIconGridSizeClassSizeMap *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (SBHIconGridSizeClassSizeMap)initWithGridSize:(SBHIconGridSize)a3 forGridSizeClass:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F29238];
  uint64_t v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v5, "sbh_valueWithSBHIconGridSize:", v6);
  id v12 = v7;
  v13[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v10 = [(SBHIconGridSizeClassSizeMap *)self initWithGridSizeClassSizes:v9];
  return v10;
}

- (SBHIconGridSizeClassSizeMap)initWithGridSizeClassesAndGridSizes:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = (unsigned int *)&v13;
  if (v5)
  {
    do
    {
      unint64_t v3 = v3 & 0xFFFFFFFF00000000 | *v12;
      id v7 = objc_msgSend(MEMORY[0x1E4F29238], "sbh_valueWithSBHIconGridSize:", v3);
      [v6 setObject:v7 forKey:v5];
      uint64_t v8 = (id *)(v12 + 2);
      v12 += 4;
      id v9 = *v8;

      id v5 = v9;
    }
    while (v9);
  }
  uint64_t v10 = [(SBHIconGridSizeClassSizeMap *)self initWithGridSizeClassSizes:v6];

  return v10;
}

- (SBHIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHIconGridSizeClassSizeMap;
  return [(SBHIconGridSizeClassSizeMap *)&v4 init];
}

- (SBHIconGridSizeClassSizeMap)init
{
  return [(SBHIconGridSizeClassSizeMap *)self initWithGridSizeClassSizes:MEMORY[0x1E4F1CC08]];
}

- (SBHIconGridSizeClassSizeMap)initWithIconGridSizeClassSizeMap:(id)a3
{
  objc_super v4 = [a3 _sizes];
  id v5 = [(SBHIconGridSizeClassSizeMap *)self initWithGridSizeClassSizes:v4];

  return v5;
}

- (unsigned)gridSizeAreaForGridSizeClass:(id)a3
{
  SBHIconGridSize v3 = (SBHIconGridSize)[(SBHIconGridSizeClassSizeMap *)self gridSizeForGridSizeClass:a3];
  return SBHIconGridSizeGetArea(*(_DWORD *)&v3);
}

- (BOOL)hasGridSizeForGridSizeClass:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconGridSizeClassSizeMap *)self _sizes];
  id v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (id)bestGridSizeClassForGridSize:(SBHIconGridSize)a3
{
  return [(SBHIconGridSizeClassSizeMap *)self bestGridSizeClassForGridSize:*(unsigned int *)&a3 allowedGridSizeClasses:0];
}

- (id)bestGridSizeClassForGridSize:(SBHIconGridSize)a3 allowedGridSizeClasses:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__SBHIconGridSizeClassSizeMap_bestGridSizeClassForGridSize_allowedGridSizeClasses___block_invoke;
  v10[3] = &unk_1E6AAFAB8;
  id v7 = v6;
  SBHIconGridSize v13 = a3;
  id v11 = v7;
  id v12 = &v14;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __83__SBHIconGridSizeClassSizeMap_bestGridSizeClassForGridSize_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, int a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = *(void **)(a1 + 32);
  if ((!v8 || [v8 containsGridSizeClass:v9])
    && SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)(a1 + 48), a3))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSString)largestGridSizeClass
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__7;
  id v12 = __Block_byref_object_dispose__7;
  SBHIconGridSize v13 = @"SBHIconGridSizeClassDefault";
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  int v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBHIconGridSizeClassSizeMap_largestGridSizeClass__block_invoke;
  v5[3] = &unk_1E6AAFAE0;
  v5[4] = v6;
  v5[5] = &v8;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:v5];
  id v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return (NSString *)v3;
}

void __51__SBHIconGridSizeClassSizeMap_largestGridSizeClass__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v8 = a2;
  unsigned int Area = SBHIconGridSizeGetArea(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (Area > *(_DWORD *)(v7 + 24))
  {
    *(_DWORD *)(v7 + 24) = Area;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (NSString)widestGridSizeClass
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__7;
  id v12 = __Block_byref_object_dispose__7;
  SBHIconGridSize v13 = @"SBHIconGridSizeClassDefault";
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  __int16 v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBHIconGridSizeClassSizeMap_widestGridSizeClass__block_invoke;
  v5[3] = &unk_1E6AAFAE0;
  v5[4] = v6;
  v5[5] = &v8;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:v5];
  id v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return (NSString *)v3;
}

void __50__SBHIconGridSizeClassSizeMap_widestGridSizeClass__block_invoke(uint64_t a1, void *a2, unsigned __int16 a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned __int16 *)(v7 + 24) < a3)
  {
    *(_WORD *)(v7 + 24) = a3;
    id v8 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v6 = v8;
  }
}

- (NSString)tallestGridSizeClass
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__7;
  id v12 = __Block_byref_object_dispose__7;
  SBHIconGridSize v13 = @"SBHIconGridSizeClassDefault";
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  __int16 v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBHIconGridSizeClassSizeMap_tallestGridSizeClass__block_invoke;
  v5[3] = &unk_1E6AAFAE0;
  v5[4] = v6;
  v5[5] = &v8;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:v5];
  id v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return (NSString *)v3;
}

void __51__SBHIconGridSizeClassSizeMap_tallestGridSizeClass__block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned __int16 *)(v7 + 24) < HIWORD(a3))
  {
    *(_WORD *)(v7 + 24) = HIWORD(a3);
    id v8 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v6 = v8;
  }
}

- (id)largestGridSizeClassWhichTilesInGridSize:(SBHIconGridSize)a3
{
  return [(SBHIconGridSizeClassSizeMap *)self largestGridSizeClassWhichTilesInGridSize:*(unsigned int *)&a3 allowedGridSizeClasses:0];
}

- (id)largestGridSizeClassWhichTilesInGridSize:(SBHIconGridSize)a3 allowedGridSizeClasses:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__7;
  long long v17 = __Block_byref_object_dispose__7;
  v18 = @"SBHIconGridSizeClassDefault";
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  int v12 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__SBHIconGridSizeClassSizeMap_largestGridSizeClassWhichTilesInGridSize_allowedGridSizeClasses___block_invoke;
  v9[3] = &unk_1E6AAFB08;
  SBHIconGridSize v10 = a3;
  v9[4] = v11;
  v9[5] = &v13;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesFilteringBySet:v6 usingBlock:v9];
  id v7 = (id)v14[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __95__SBHIconGridSizeClassSizeMap_largestGridSizeClassWhichTilesInGridSize_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v6 = a2;
  if (a3 >= 0x10000)
  {
    if ((_WORD)a3)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 48);
      if (v7 == 0xFFFF || !(v7 % (unsigned __int16)a3))
      {
        unsigned int v8 = *(unsigned __int16 *)(a1 + 50);
        if (v8 == 0xFFFF || !(v8 % HIWORD(a3)))
        {
          id v11 = v6;
          unsigned int Area = SBHIconGridSizeGetArea(a3);
          id v6 = v11;
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
          if (Area > *(_DWORD *)(v10 + 24))
          {
            *(_DWORD *)(v10 + 24) = Area;
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
            id v6 = v11;
          }
        }
      }
    }
  }
}

- (id)shortestGridSizeClassWithWidth:(unsigned __int16)a3
{
  return [(SBHIconGridSizeClassSizeMap *)self shortestGridSizeClassWithWidth:a3 allowedGridSizeClasses:0];
}

- (id)shortestGridSizeClassWithWidth:(unsigned __int16)a3 allowedGridSizeClasses:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__7;
  long long v17 = __Block_byref_object_dispose__7;
  v18 = @"SBHIconGridSizeClassDefault";
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  __int16 v12 = -1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__SBHIconGridSizeClassSizeMap_shortestGridSizeClassWithWidth_allowedGridSizeClasses___block_invoke;
  v9[3] = &unk_1E6AAFB30;
  unsigned __int16 v10 = a3;
  v9[4] = v11;
  v9[5] = &v13;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesFilteringBySet:v6 usingBlock:v9];
  id v7 = (id)v14[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __85__SBHIconGridSizeClassSizeMap_shortestGridSizeClassWithWidth_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v6 = a2;
  if (*(unsigned __int16 *)(a1 + 48) == (unsigned __int16)a3)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned __int16 *)(v7 + 24) > HIWORD(a3))
    {
      *(_WORD *)(v7 + 24) = HIWORD(a3);
      id v8 = v6;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      id v6 = v8;
    }
  }
}

- (id)gridSizeClassLargerThanGridSizeClass:(id)a3 allowedGridSizeClasses:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SBHIconGridSizeClassSizeMap *)self gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:a4];
  uint64_t v8 = [v7 indexOfObject:v6];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v9 = [(SBHIconGridSizeClassSizeMap *)self gridSizeAreaForGridSizeClass:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (-[SBHIconGridSizeClassSizeMap gridSizeAreaForGridSizeClass:](self, "gridSizeAreaForGridSizeClass:", v15, (void)v19) > v9)
          {
            id v16 = v15;
            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_14:
  }
  else
  {
    uint64_t v17 = v8 + 1;
    if (v8 + 1 >= (unint64_t)[v7 count])
    {
      id v16 = 0;
    }
    else
    {
      id v16 = [v7 objectAtIndex:v17];
    }
  }

  return v16;
}

- (id)gridSizeClassSmallerThanGridSizeClass:(id)a3 allowedGridSizeClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHIconGridSizeClassSizeMap *)self gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:v7];
  uint64_t v9 = [v8 indexOfObject:v6];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__7;
  long long v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  if (v9)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned int v10 = [(SBHIconGridSizeClassSizeMap *)self gridSizeAreaForGridSizeClass:v6];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __92__SBHIconGridSizeClassSizeMap_gridSizeClassSmallerThanGridSizeClass_allowedGridSizeClasses___block_invoke;
      v15[3] = &unk_1E6AAFB58;
      unsigned int v16 = v10;
      v15[4] = self;
      v15[5] = &v17;
      [v8 enumerateObjectsWithOptions:2 usingBlock:v15];
    }
    else
    {
      uint64_t v11 = [v8 objectAtIndex:v9 - 1];
      uint64_t v12 = (void *)v18[5];
      v18[5] = v11;
    }
  }
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __92__SBHIconGridSizeClassSizeMap_gridSizeClassSmallerThanGridSizeClass_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "gridSizeAreaForGridSizeClass:") < *(_DWORD *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)gridSizeClassesSortedByGridArea
{
  return [(SBHIconGridSizeClassSizeMap *)self gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:0];
}

- (id)gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke;
  v13[3] = &unk_1E6AAFB80;
  id v7 = v6;
  id v14 = v7;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesFilteringBySet:v5 usingBlock:v13];

  char v8 = [v7 containsObject:@"SBHIconGridSizeClassDefault"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke_2;
  void v11[3] = &unk_1E6AAFBA8;
  v11[4] = self;
  char v12 = v8;
  [v7 sortUsingComparator:v11];
  id v9 = v7;

  return v9;
}

uint64_t __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = [*(id *)(a1 + 32) gridSizeAreaForGridSizeClass:v5];
  unsigned int v8 = [*(id *)(a1 + 32) gridSizeAreaForGridSizeClass:v6];
  if (v7 == v8)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (!v5 || ([v5 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) != 0)
      {
        uint64_t v9 = -1;
        goto LABEL_14;
      }
      if (*(unsigned char *)(a1 + 40)
        && (!v6 || ([v6 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) != 0))
      {
        uint64_t v9 = 1;
        goto LABEL_14;
      }
    }
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  if (v7 < v8) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 1;
  }
LABEL_14:

  return v9;
}

- (BOOL)gridSizesMatchDefault
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__SBHIconGridSizeClassSizeMap_gridSizesMatchDefault__block_invoke;
  v4[3] = &unk_1E6AAFBD0;
  v4[4] = &v5;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

BOOL __52__SBHIconGridSizeClassSizeMap_gridSizesMatchDefault__block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4)
{
  BOOL result = SBHIconGridSizeEqualToIconGridSize(a3, 65537);
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateGridSizesSortedByAreaWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBHIconGridSizeClassSizeMap *)self _sizesSortedByArea];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__SBHIconGridSizeClassSizeMap_enumerateGridSizesSortedByAreaWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E6AAE4E0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateObjectsWithOptions:a3 usingBlock:v9];
}

void __84__SBHIconGridSizeClassSizeMap_enumerateGridSizesSortedByAreaWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, [v6 gridSizeForGridSizeClass:v7], a4);
}

- (void)enumerateGridSizesInSet:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__SBHIconGridSizeClassSizeMap_enumerateGridSizesInSet_usingBlock___block_invoke;
  v10[3] = &unk_1E6AAFBF8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:v10];
}

void __66__SBHIconGridSizeClassSizeMap_enumerateGridSizesInSet_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsGridSizeClass:")) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateGridSizesFilteringBySet:(id)a3 usingBlock:(id)a4
{
  if (a3) {
    [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesInSet:a3 usingBlock:a4];
  }
  else {
    [(SBHIconGridSizeClassSizeMap *)self enumerateGridSizesUsingBlock:a4];
  }
}

- (id)_sizes
{
  return 0;
}

- (id)_sizesSortedByArea
{
  id v3 = [(SBHIconGridSizeClassSizeMap *)self _sizes];
  id v4 = [v3 allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBHIconGridSizeClassSizeMap__sizesSortedByArea__block_invoke;
  v7[3] = &unk_1E6AAFC20;
  v7[4] = self;
  uint64_t v5 = [v4 sortedArrayUsingComparator:v7];

  return v5;
}

uint64_t __49__SBHIconGridSizeClassSizeMap__sizesSortedByArea__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unsigned int v7 = [v5 gridSizeAreaForGridSizeClass:a2];
  unsigned int v8 = [*(id *)(a1 + 32) gridSizeAreaForGridSizeClass:v6];

  if (v7 < v8) {
    return -1;
  }
  else {
    return v7 > v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHIconGridSizeClassSizeMap *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unsigned int v7 = v4;
      unsigned int v8 = [(SBHIconGridSizeClassSizeMap *)self _sizes];
      id v9 = [(SBHIconGridSizeClassSizeMap *)v7 _sizes];

      char v10 = BSEqualDictionaries();
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  char v2 = [(SBHIconGridSizeClassSizeMap *)self _sizes];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)descriptionWithGridSizeClassDomain:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F4F720];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(SBHIconGridSizeClassSizeMap *)self appendDescriptionToFormatter:v6 gridSizeClassDomain:v5];

  unsigned int v7 = [v6 description];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[SBHIconGridSizeClassSizeMap allocWithZone:a3];
  return [(SBHIconGridSizeClassSizeMap *)v4 initWithIconGridSizeClassSizeMap:self];
}

@end