@interface _REAggregateRuleCondition
- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4;
- (BOOL)_needsProbability;
- (BOOL)_requiresTwoFeatures;
- (BOOL)_validForRanking;
- (BOOL)isEqual:(id)a3;
- (NSSet)conditions;
- (_REAggregateRuleCondition)initWithConditions:(id)a3 type:(unint64_t)a4;
- (id)_dependentFeatures;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation _REAggregateRuleCondition

- (unint64_t)hash
{
  return self->_type ^ [(NSSet *)self->_conditions hash];
}

- (void).cxx_destruct
{
}

- (_REAggregateRuleCondition)initWithConditions:(id)a3 type:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v27 = self;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (([v14 isMemberOfClass:objc_opt_class()] & 1) == 0)
        {
          unsigned int v15 = [v14 _validForRanking];
          v10 += v15;
          v11 += v15 ^ 1;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 type] == a4)
          {
            v16 = [v14 conditions];
            [v6 unionSet:v16];
          }
          else
          {
            objc_msgSend(v6, "addObject:", v14, v27);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);

    self = v27;
    if (v10 && v11) {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Cannot mix REComparisonCondition and RECondition in the same condition", v17, v18, v19, v20, v21, v22, (uint64_t)v27);
    }
  }
  else
  {
  }
  v29.receiver = self;
  v29.super_class = (Class)_REAggregateRuleCondition;
  v23 = [(_REAggregateRuleCondition *)&v29 init];
  if (v23)
  {
    uint64_t v24 = [v6 copy];
    conditions = v23->_conditions;
    v23->_conditions = (NSSet *)v24;

    v23->_type = a4;
  }

  return v23;
}

- (BOOL)_validForRanking
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![(NSSet *)self->_conditions count]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_conditions;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "_validForRanking", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)_inflectionFeatureValuePairs
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(NSSet *)self->_conditions count])
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = self->_conditions;
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_inflectionFeatureValuePairs", (void)v12);
          [v3 unionSet:v9];
        }
        uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    long long v10 = (void *)[v3 copy];
  }
  else
  {
    long long v10 = [MEMORY[0x263EFFA08] set];
  }
  return v10;
}

- (id)_dependentFeatures
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = +[REFeatureSet featureSet];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_conditions;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_dependentFeatures", (void)v12);
        [v3 unionFeatureSet:v9];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = (void *)[v3 copy];
  return v10;
}

- (id)_notCondition
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[NSSet count](self->_conditions, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_conditions;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_notCondition", (void)v14);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v10 = objc_alloc_init(_REAggregateRuleCondition);
  uint64_t v11 = [v3 copy];
  conditions = v10->_conditions;
  v10->_conditions = (NSSet *)v11;

  v10->_type = self->_type != 1;
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_REAggregateRuleCondition *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = v5;
      if (self->_type == v5->_type)
      {
        conditions = self->_conditions;
        BOOL v8 = v5->_conditions;
        uint64_t v9 = conditions;
        long long v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSSet *)v9 isEqual:v8];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)count
{
  return [(NSSet *)self->_conditions count];
}

- (BOOL)_requiresTwoFeatures
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_conditions;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "_requiresTwoFeatures", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_needsProbability
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_conditions;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "_needsProbability", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = a5;
  if ([(NSSet *)self->_conditions count])
  {
    BOOL v10 = self->_type != 1;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = self->_conditions;
    uint64_t v11 = [(NSSet *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    int v12 = v10;
    if (v11)
    {
      uint64_t v13 = *(void *)v28;
      int v12 = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          uint64_t v22 = __74___REAggregateRuleCondition__acceptsFeatureMap_predictionSet_explanation___block_invoke;
          v23 = &unk_2644BFF60;
          id v24 = v8;
          id v25 = v9;
          v26 = v31;
          int v16 = v22(v21, v15);
          unint64_t type = self->_type;
          if (type)
          {
            if (type == 1 && ((v12 | v16) & 1) != 0)
            {
              int v12 = 1;
LABEL_19:

              goto LABEL_20;
            }
            int v12 = 0;
          }
          else
          {
            if ((v12 & v16) != 1)
            {
              int v12 = 0;
              goto LABEL_19;
            }
            int v12 = 1;
          }
        }
        uint64_t v11 = [(NSSet *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    BOOL v18 = v12 != 0;
  }
  else
  {
    BOOL v18 = 1;
  }
  _Block_object_dispose(v31, 8);

  return v18;
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSSet *)self->_conditions count])
  {
    BOOL v8 = self->_type != 1;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = self->_conditions;
    uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "_acceptsLeftFeatureMap:rightFeatureMap:", v6, v7, (void)v18);
          unint64_t type = self->_type;
          if (type)
          {
            if (type == 1 && ((v8 | v14) & 1) != 0)
            {
              BOOL v16 = 1;
LABEL_19:

              goto LABEL_20;
            }
            BOOL v8 = 0;
          }
          else
          {
            if ((v8 & v14) != 1)
            {
              BOOL v16 = 0;
              goto LABEL_19;
            }
            BOOL v8 = 1;
          }
        }
        uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = v8;
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_20:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_conditions);
  v4[1] = self->_type;
  return v4;
}

- (NSSet)conditions
{
  return self->_conditions;
}

@end