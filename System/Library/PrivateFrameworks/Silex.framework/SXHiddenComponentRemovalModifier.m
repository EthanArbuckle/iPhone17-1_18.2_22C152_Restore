@interface SXHiddenComponentRemovalModifier
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXHiddenComponentRemovalModifier

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
    v17 = [v5 components];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__SXHiddenComponentRemovalModifier_modifyDOM_context___block_invoke;
    v18[3] = &unk_264654728;
    id v19 = v5;
    [v17 enumerateComponentsWithBlock:v18];
  }
}

uint64_t __54__SXHiddenComponentRemovalModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 hidden])
  {
    v7 = [v6 identifier];
    [v5 removeComponentWithIdentifier:v7];

    v8 = [*(id *)(a1 + 32) analysis];
    uint64_t v9 = [v8 conditionalObjectAnalysis];
    unint64_t v10 = [v6 identifier];
    v11 = SXConditionTypes();
    [v9 removeComponentIdentifier:v10 conditionTypes:v11];
  }
  return 1;
}

@end