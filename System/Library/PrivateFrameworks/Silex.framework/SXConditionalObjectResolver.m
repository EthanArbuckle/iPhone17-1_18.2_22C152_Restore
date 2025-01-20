@interface SXConditionalObjectResolver
- (SXConditionValidating)conditionValidator;
- (SXConditionalObjectResolver)initWithConditionValidator:(id)a3 objectMerger:(id)a4;
- (SXJSONObjectMerger)objectMerger;
- (id)resolveObjects:(id)a3 context:(id)a4;
@end

@implementation SXConditionalObjectResolver

- (SXConditionalObjectResolver)initWithConditionValidator:(id)a3 objectMerger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXConditionalObjectResolver;
  v9 = [(SXConditionalObjectResolver *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditionValidator, a3);
    objc_storeStrong((id *)&v10->_objectMerger, a4);
  }

  return v10;
}

- (id)resolveObjects:(id)a3 context:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v28 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263EFF9C0] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v6;
  uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v9;
        v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        [v28 addObject:v10];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v27 = [v10 conditional];
        uint64_t v30 = [v27 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v30)
        {
          uint64_t v29 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v37 != v29) {
                objc_enumerationMutation(v27);
              }
              objc_super v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              long long v32 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              v31 = v12;
              v13 = [v12 conditions];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v33;
                while (2)
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v33 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    v18 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                    v19 = [v18 types];
                    [v8 unionSet:v19];

                    if ([(SXConditionValidating *)self->_conditionValidator validateCondition:v18 context:v7])
                    {
                      [v28 addObject:v31];
                      goto LABEL_21;
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
                  if (v15) {
                    continue;
                  }
                  break;
                }
              }
LABEL_21:
            }
            uint64_t v30 = [v27 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v30);
        }

        uint64_t v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v25);
  }

  v20 = [(SXJSONObjectMerger *)self->_objectMerger mergeObjects:v28];
  id v21 = [[SXResolvedObject alloc] initWitObject:v20 conditionTypes:v8];

  return v21;
}

- (SXJSONObjectMerger)objectMerger
{
  return self->_objectMerger;
}

- (SXConditionValidating)conditionValidator
{
  return self->_conditionValidator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionValidator, 0);
  objc_storeStrong((id *)&self->_objectMerger, 0);
}

@end