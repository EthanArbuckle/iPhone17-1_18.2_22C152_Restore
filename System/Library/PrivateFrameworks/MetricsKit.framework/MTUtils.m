@interface MTUtils
- (id)applyFieldsMap:(id)a3 sectionName:(id)a4;
@end

@implementation MTUtils

- (id)applyFieldsMap:(id)a3 sectionName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTObject *)self metricsKit];
  v9 = [v8 config];
  v10 = [v9 sources];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__MTUtils_applyFieldsMap_sectionName___block_invoke;
  v15[3] = &unk_26430F780;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  v13 = [v10 thenWithBlock:v15];

  return v13;
}

id __38__MTUtils_applyFieldsMap_sectionName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) metricsKit];
  v5 = [v4 config];
  id v6 = [v5 configValueForKeyPath:@"fieldsMap" sources:v3];

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v21 = 0;
  v9 = +[MTEventFieldsUtil applyFieldsMap:v6 data:v7 sectionName:v8 error:&v21];
  id v10 = v21;
  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [*(id *)(a1 + 32) metricsKit];
      id v12 = [v11 config];
      v13 = [@"treatmentProfiles." stringByAppendingString:*(void *)(a1 + 48)];
      v14 = [v12 configValueForKeyPath:v13 sources:v3];

      if (v14)
      {
        v15 = +[MTTreatmentProfile treatmentProfileWithConfigData:v14];
        id v16 = v15;
        if (v15)
        {
          v9 = [v15 performTreatments:*(void *)(a1 + 40)];

          id v10 = 0;
        }
        else
        {
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  if (v10)
  {
    uint64_t v17 = +[MTPromise promiseWithError:v10];
  }
  else
  {
    if (v9) {
      v18 = v9;
    }
    else {
      v18 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v17 = +[MTPromise promiseWithResult:v18];
  }
  v19 = (void *)v17;

  return v19;
}

@end