@interface SBHIconGridSizeClassIconImageInfoMap
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)hasIconImageInfoForGridSizeClass:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)extraIconImageSizeForGridSizeClass:(id)a3 gridSizeClassSizes:(id)a4 iconSpacing:(CGSize)a5;
- (CGSize)extraIconImageSizeForGridSizeClassSizes:(id)a3 iconSpacing:(CGSize)a4;
- (CGSize)extraIconImageSizeForGridSizeClassSizes:(id)a3 iconSpacing:(CGSize)a4 inDomain:(id)a5;
- (NSString)description;
- (SBHIconGridSizeClassIconImageInfoMap)init;
- (SBHIconGridSizeClassIconImageInfoMap)initWithGridSizeClassesAndIconImageInfos:(id)a3;
- (SBHIconGridSizeClassIconImageInfoMap)initWithIconGridSizeClassIconImageInfoMap:(id)a3;
- (SBHIconGridSizeClassIconImageInfoMap)initWithIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4;
- (SBHIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (id)_iconImageInfos;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)enumerateIconImageInfosUsingBlock:(id)a3;
@end

@implementation SBHIconGridSizeClassIconImageInfoMap

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5 = a4;
  v6 = [(SBHIconGridSizeClassIconImageInfoMap *)self _iconImageInfos];
  v7 = [v6 objectForKey:v5];

  if (v7) {
    objc_msgSend(v7, "sbh_SBIconImageInfoValue");
  }

  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return +[SBHIconGridSizeClassIconImageInfoMap allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SBHIconGridSizeClassIconImageInfoMap;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  v20[1] = *MEMORY[0x1E4F143B8];
  v13 = (void *)MEMORY[0x1E4F29238];
  v14 = a3;
  v15 = objc_msgSend(v13, "sbh_valueWithSBIconImageInfo:", v11, v10, v9, v8);
  v19 = v14;
  v20[0] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

  v17 = [(SBHIconGridSizeClassIconImageInfoMap *)self initWithIconImageInfos:v16];
  return v17;
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithGridSizeClassesAndIconImageInfos:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v11 = (double *)&v12;
  if (v4)
  {
    do
    {
      double v6 = objc_msgSend(MEMORY[0x1E4F29238], "sbh_valueWithSBIconImageInfo:", *v11, v11[1], v11[2], v11[3]);
      [v5 setObject:v6 forKey:v4];
      double v7 = (id *)(v11 + 4);
      v11 += 5;
      id v8 = *v7;

      id v4 = v8;
    }
    while (v8);
  }
  double v9 = [(SBHIconGridSizeClassIconImageInfoMap *)self initWithIconImageInfos:v5];

  return v9;
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHIconGridSizeClassIconImageInfoMap;
  return [(SBHIconGridSizeClassIconImageInfoMap *)&v4 init];
}

- (SBHIconGridSizeClassIconImageInfoMap)init
{
  return [(SBHIconGridSizeClassIconImageInfoMap *)self initWithIconImageInfos:MEMORY[0x1E4F1CC08]];
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithIconGridSizeClassIconImageInfoMap:(id)a3
{
  objc_super v4 = [a3 _iconImageInfos];
  id v5 = [(SBHIconGridSizeClassIconImageInfoMap *)self initWithIconImageInfos:v4];

  return v5;
}

- (BOOL)hasIconImageInfoForGridSizeClass:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconGridSizeClassIconImageInfoMap *)self _iconImageInfos];
  double v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (CGSize)extraIconImageSizeForGridSizeClass:(id)a3 gridSizeClassSizes:(id)a4 iconSpacing:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v9 = (__CFString *)a3;
  id v10 = a4;
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (@"SBHIconGridSizeClassDefault" != v9
    && ([(__CFString *)v9 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    unsigned int v13 = [v10 gridSizeForGridSizeClass:v9];
    unsigned __int16 v14 = v13;
    int v15 = HIWORD(v13);
    [(SBHIconGridSizeClassIconImageInfoMap *)self iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassDefault"];
    double v17 = v16;
    double v19 = v18;
    [(SBHIconGridSizeClassIconImageInfoMap *)self iconImageInfoForGridSizeClass:v9];
    double v11 = v20 - (width * (double)(v14 - 1) + v17 * (double)v14);
    double v12 = v21 - (height * (double)(v15 - 1) + v19 * (double)v15);
  }

  double v22 = v11;
  double v23 = v12;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)extraIconImageSizeForGridSizeClassSizes:(id)a3 iconSpacing:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = +[SBHIconGridSizeClassDomain globalDomain];
  -[SBHIconGridSizeClassIconImageInfoMap extraIconImageSizeForGridSizeClassSizes:iconSpacing:inDomain:](self, "extraIconImageSizeForGridSizeClassSizes:iconSpacing:inDomain:", v7, v8, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)extraIconImageSizeForGridSizeClassSizes:(id)a3 iconSpacing:(CGSize)a4 inDomain:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  uint64_t v21 = 0;
  double v22 = (double *)&v21;
  uint64_t v23 = 0x3010000000;
  v24 = &unk_1D821E08B;
  long long v25 = *MEMORY[0x1E4F1DB30];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__SBHIconGridSizeClassIconImageInfoMap_extraIconImageSizeForGridSizeClassSizes_iconSpacing_inDomain___block_invoke;
  v16[3] = &unk_1E6AB5308;
  v16[4] = self;
  id v11 = v9;
  CGFloat v19 = width;
  CGFloat v20 = height;
  id v17 = v11;
  double v18 = &v21;
  [v10 enumerateGridSizeClassesUsingBlock:v16];
  double v12 = v22[4];
  double v13 = v22[5];

  _Block_object_dispose(&v21, 8);
  double v14 = v12;
  double v15 = v13;
  result.CGFloat height = v15;
  result.CGFloat width = v14;
  return result;
}

uint64_t __101__SBHIconGridSizeClassIconImageInfoMap_extraIconImageSizeForGridSizeClassSizes_iconSpacing_inDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "extraIconImageSizeForGridSizeClass:gridSizeClassSizes:iconSpacing:", a2, *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v4 > *(double *)(v6 + 32))
  {
    *(double *)(v6 + 32) = v4;
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  if (v5 > *(double *)(v6 + 40)) {
    *(double *)(v6 + 40) = v5;
  }
  return result;
}

- (void)enumerateIconImageInfosUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, uint64_t, char *))a3;
  [(SBHIconGridSizeClassIconImageInfoMap *)self _iconImageInfos];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      [(SBHIconGridSizeClassIconImageInfoMap *)self iconImageInfoForGridSizeClass:v10];
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_iconImageInfos
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SBHIconGridSizeClassIconImageInfoMap *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = v4;
      uint64_t v8 = [(SBHIconGridSizeClassIconImageInfoMap *)self _iconImageInfos];
      uint64_t v9 = [(SBHIconGridSizeClassIconImageInfoMap *)v7 _iconImageInfos];

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
  v2 = [(SBHIconGridSizeClassIconImageInfoMap *)self _iconImageInfos];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  [(SBHIconGridSizeClassIconImageInfoMap *)self appendDescriptionToFormatter:v3];
  double v4 = [v3 description];

  return (NSString *)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = +[SBHIconGridSizeClassIconImageInfoMap allocWithZone:a3];
  return [(SBHIconGridSizeClassIconImageInfoMap *)v4 initWithIconGridSizeClassIconImageInfoMap:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AACA90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

void __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke_2;
  v2[3] = &unk_1E6AB5330;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateIconImageInfosUsingBlock:v2];
}

void __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  SBHStringForIconImageInfo(a3, a4, a5, a6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  long long v12 = SBHStringForIconGridSizeClass(v11);

  [*(id *)(a1 + 32) appendString:v13 withName:v12 skipIfEmpty:0];
}

@end