@interface PTRow(PhotosUICore)
+ (id)px_rowWithTitle:()PhotosUICore action:;
+ (id)px_rowWithTitle:()PhotosUICore asynchronousOutputProducer:;
+ (id)px_rowWithTitle:()PhotosUICore continuousOutputProducer:;
+ (id)px_rowWithTitle:()PhotosUICore output:;
+ (id)px_rowWithTitle:()PhotosUICore postDismissalAction:;
+ (id)px_rowWithTitle:()PhotosUICore urlString:;
+ (id)px_rowWithTitle:()PhotosUICore valueKeyPath:condition:;
- (id)px_conditionFormat:()PhotosUICore possibleValues:;
- (void)px_increment:()PhotosUICore;
@end

@implementation PTRow(PhotosUICore)

- (id)px_conditionFormat:()PhotosUICore possibleValues:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v6, *(void *)(*((void *)&v18 + 1) + 8 * i), 0, (void)v18);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    v15 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v8];
    id v16 = [a1 condition:v15];
  }
  else
  {
    id v16 = a1;
  }

  return v16;
}

- (void)px_increment:()PhotosUICore
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PTRow_PhotosUICore__px_increment___block_invoke;
  v4[3] = &__block_descriptor_40_e11__24__0_8_16l;
  *(double *)&v4[4] = a2;
  [a1 setValueValidatator:v4];
  return a1;
}

+ (id)px_rowWithTitle:()PhotosUICore valueKeyPath:condition:
{
  id v8 = a5;
  id v9 = [a1 rowWithTitle:a3 valueKeyPath:a4];
  [v9 setCondition:v8];

  return v9;
}

+ (id)px_rowWithTitle:()PhotosUICore urlString:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PTRow_PhotosUICore__px_rowWithTitle_urlString___block_invoke;
  v10[3] = &unk_1E5DBFCB0;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore postDismissalAction:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 row];
  [v8 setStaticTitle:v7];

  id v9 = (void *)MEMORY[0x1E4F94190];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke;
  v13[3] = &unk_1E5DB5510;
  id v14 = v6;
  id v10 = v6;
  id v11 = [v9 actionWithHandler:v13];
  [v8 setAction:v11];

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore action:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 row];
  [v8 setStaticTitle:v7];

  id v9 = (void *)MEMORY[0x1E4F94190];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__PTRow_PhotosUICore__px_rowWithTitle_action___block_invoke;
  v13[3] = &unk_1E5DB5510;
  id v14 = v6;
  id v10 = v6;
  id v11 = [v9 actionWithHandler:v13];
  [v8 setAction:v11];

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore continuousOutputProducer:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PTRow_PhotosUICore__px_rowWithTitle_continuousOutputProducer___block_invoke;
  v10[3] = &unk_1E5DB54E8;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore asynchronousOutputProducer:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PTRow_PhotosUICore__px_rowWithTitle_asynchronousOutputProducer___block_invoke;
  v10[3] = &unk_1E5DB54E8;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore output:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PTRow_PhotosUICore__px_rowWithTitle_output___block_invoke;
  v10[3] = &unk_1E5DB54C0;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "px_rowWithTitle:asynchronousOutputProducer:", a3, v10);

  return v8;
}

@end