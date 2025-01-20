@interface SXComponentInsertionConditionEngine
- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5;
- (NSMutableSet)conditions;
- (SXComponentInsertionConditionEngine)init;
- (void)addCondition:(id)a3;
- (void)insertedComponent:(id)a3 approximateLocation:(CGPoint)a4;
- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5;
@end

@implementation SXComponentInsertionConditionEngine

- (SXComponentInsertionConditionEngine)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXComponentInsertionConditionEngine;
  v2 = [(SXComponentInsertionConditionEngine *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    conditions = v2->_conditions;
    v2->_conditions = (NSMutableSet *)v3;
  }
  return v2;
}

- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = [(SXComponentInsertionConditionEngine *)self conditions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 prepareWithComponents:v8 layoutProvider:v9 DOMObjectProvider:v10];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)insertedComponent:(id)a3 approximateLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(SXComponentInsertionConditionEngine *)self conditions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "insertedComponent:approximateLocation:", v7, x, y);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [(SXComponentInsertionConditionEngine *)self conditions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (![*(id *)(*((void *)&v17 + 1) + 8 * i) validateMarker:v8 componentTraits:a4 layoutProvider:v9])
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (void)addCondition:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXComponentInsertionConditionEngine *)self conditions];
    [v5 addObject:v4];
  }
}

- (NSMutableSet)conditions
{
  return self->_conditions;
}

- (void).cxx_destruct
{
}

@end