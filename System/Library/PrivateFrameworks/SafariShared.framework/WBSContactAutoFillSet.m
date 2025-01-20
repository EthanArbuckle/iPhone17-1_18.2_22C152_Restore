@interface WBSContactAutoFillSet
+ (id)displayStringsForFillMatches:(id)a3 skipMatches:(id)a4 matchesForForm:(id)a5 label:(id)a6 formDataController:(id)a7;
+ (id)displayStringsForSkipMatches:(id)a3 matchesForForm:(id)a4 formDataController:(id)a5;
- (NSArray)fillDisplayProperties;
- (NSArray)skipDisplayProperties;
- (NSDictionary)controlIDToValueMap;
- (NSSet)propertiesToFillOrSkip;
- (NSString)label;
- (WBSContactAutoFillSet)initWithControlIDToValueMap:(id)a3 label:(id)a4 fillDisplayProperties:(id)a5 skipDisplayProperties:(id)a6 propertiesToFillOrSkip:(id)a7;
@end

@implementation WBSContactAutoFillSet

- (WBSContactAutoFillSet)initWithControlIDToValueMap:(id)a3 label:(id)a4 fillDisplayProperties:(id)a5 skipDisplayProperties:(id)a6 propertiesToFillOrSkip:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSContactAutoFillSet;
  v17 = [(WBSContactAutoFillSet *)&v30 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    controlIDToValueMap = v17->_controlIDToValueMap;
    v17->_controlIDToValueMap = (NSDictionary *)v18;

    uint64_t v20 = [v13 copy];
    label = v17->_label;
    v17->_label = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    fillDisplayProperties = v17->_fillDisplayProperties;
    v17->_fillDisplayProperties = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    skipDisplayProperties = v17->_skipDisplayProperties;
    v17->_skipDisplayProperties = (NSArray *)v24;

    uint64_t v26 = [v16 copy];
    propertiesToFillOrSkip = v17->_propertiesToFillOrSkip;
    v17->_propertiesToFillOrSkip = (NSSet *)v26;

    v28 = v17;
  }

  return v17;
}

+ (id)displayStringsForSkipMatches:(id)a3 matchesForForm:(id)a4 formDataController:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F1CA80] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v30 + 1) + 8 * i) property];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v13);
  }

  v17 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "property", (void)v26);
        if ([v10 containsObject:v23])
        {
          uint64_t v24 = addressBookStringToBeDisplayed(0, v23, 0, v9);
          [v17 addObject:v24];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  return v17;
}

+ (id)displayStringsForFillMatches:(id)a3 skipMatches:(id)a4 matchesForForm:(id)a5 label:(id)a6 formDataController:(id)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v40 = a4;
  id v11 = a5;
  id v46 = a6;
  id v45 = a7;
  id v47 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v11;
  uint64_t v44 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v61 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v15 = v43;
        uint64_t v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v66, 16, v40);
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v57;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v57 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v56 + 1) + 8 * j);
              if ([v20 isEqual:v14])
              {
                uint64_t v21 = [v20 property];
                [v12 addObject:v21];
                if (+[WBSFormDataController isNameProperty:v21])
                {

                  goto LABEL_18;
                }
                uint64_t v22 = [v20 label];
                v23 = addressBookStringToBeDisplayed(v46, v21, v22, v45);
                [v47 addObject:v23];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v56 objects:v66 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v44);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v24 = v40;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * k), "property", v40);
        [v12 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v26);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v30 = obj;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v64 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v49;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v48 + 1) + 8 * m);
        uint64_t v36 = objc_msgSend(v35, "property", v40);
        if (([v12 containsObject:v36] & 1) == 0
          && !+[WBSFormDataController isNameProperty:v36])
        {
          v37 = [v35 label];
          v38 = addressBookStringToBeDisplayed(v46, v36, v37, v45);
          [v47 addObject:v38];

          [v12 addObject:v36];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v48 objects:v64 count:16];
    }
    while (v32);
  }

  return v47;
}

- (NSDictionary)controlIDToValueMap
{
  return self->_controlIDToValueMap;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)fillDisplayProperties
{
  return self->_fillDisplayProperties;
}

- (NSArray)skipDisplayProperties
{
  return self->_skipDisplayProperties;
}

- (NSSet)propertiesToFillOrSkip
{
  return self->_propertiesToFillOrSkip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToFillOrSkip, 0);
  objc_storeStrong((id *)&self->_skipDisplayProperties, 0);
  objc_storeStrong((id *)&self->_fillDisplayProperties, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_controlIDToValueMap, 0);
}

@end