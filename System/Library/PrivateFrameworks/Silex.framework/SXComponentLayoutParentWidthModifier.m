@interface SXComponentLayoutParentWidthModifier
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXComponentLayoutParentWidthModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5 = a3;
  v6 = [a4 specVersion];
  v7 = [@"1.6" componentsSeparatedByString:@"."];
  v8 = [v6 componentsSeparatedByString:@"."];
  uint64_t v9 = [v7 count];
  if ([v8 count] | v9)
  {
    unint64_t v10 = 0;
    while (1)
    {
      v11 = @"0";
      if (v10 < [v7 count])
      {
        v11 = [v7 objectAtIndex:v10];
      }
      v12 = @"0";
      if (v10 < [v8 count])
      {
        v12 = [v8 objectAtIndex:v10];
      }
      uint64_t v13 = [(__CFString *)v11 compare:v12 options:64];

      if (v13) {
        break;
      }
      ++v10;
      unint64_t v14 = [v7 count];
      unint64_t v15 = [v8 count];
      if (v14 <= v15) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v10 >= v16) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    uint64_t v13 = 0;
  }

  if (v13 != 1)
  {
    v17 = [v5 componentLayouts];
    v18 = (void *)[v17 copy];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__SXComponentLayoutParentWidthModifier_modifyDOM_context___block_invoke;
    v19[3] = &unk_264651F00;
    id v20 = v5;
    [v18 enumerateKeysAndObjectsUsingBlock:v19];
  }
}

void __58__SXComponentLayoutParentWidthModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  [v5 minimumWidth];
  uint64_t v7 = v6;
  [v5 maximumWidth];
  uint64_t v9 = v8;
  if (v7 == 7 || v8 == 7)
  {
    unint64_t v10 = [v5 JSONRepresentation];
    v11 = (void *)[v10 mutableCopy];

    if (v7 == 7)
    {
      uint64_t v12 = [v5 minimumWidth];
      uint64_t v13 = [NSString stringWithFormat:@"%f%@", v12, @"pw"];
      [v11 setObject:v13 forKey:@"minimumWidth"];
    }
    if (v9 == 7)
    {
      uint64_t v14 = [v5 maximumWidth];
      unint64_t v15 = [NSString stringWithFormat:@"%f%@", v14, @"pw"];
      [v11 setObject:v15 forKey:@"maximumWidth"];
    }
    unint64_t v16 = [SXComponentLayout alloc];
    v17 = [v5 specificationVersion];
    v18 = [(SXJSONObject *)v16 initWithJSONObject:v11 andVersion:v17];

    v19 = [*(id *)(a1 + 32) componentLayouts];
    [v19 setObject:v18 forKey:v20];
  }
}

@end