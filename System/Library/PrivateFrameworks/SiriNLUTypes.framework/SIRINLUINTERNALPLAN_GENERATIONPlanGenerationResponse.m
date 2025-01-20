@interface SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse
+ (Class)mappingsType;
+ (Class)plansType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)mappings;
- (NSMutableArray)plans;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mappingsAtIndex:(unint64_t)a3;
- (id)plansAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mappingsCount;
- (unint64_t)plansCount;
- (void)addMappings:(id)a3;
- (void)addPlans:(id)a3;
- (void)clearMappings;
- (void)clearPlans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMappings:(id)a3;
- (void)setPlans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plans, 0);
  objc_storeStrong((id *)&self->_mappings, 0);
}

- (void)setMappings:(id)a3
{
}

- (NSMutableArray)mappings
{
  return self->_mappings;
}

- (void)setPlans:(id)a3
{
}

- (NSMutableArray)plans
{
  return self->_plans;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self addPlans:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse addMappings:](self, "addMappings:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_plans hash];
  return [(NSMutableArray *)self->_mappings hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((plans = self->_plans, !((unint64_t)plans | v4[2]))
     || -[NSMutableArray isEqual:](plans, "isEqual:")))
  {
    mappings = self->_mappings;
    if ((unint64_t)mappings | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](mappings, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_plans;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addPlans:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_mappings;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addMappings:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self plansCount])
  {
    [v12 clearPlans];
    unint64_t v4 = [(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self plansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self plansAtIndex:i];
        [v12 addPlans:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self mappingsCount])
  {
    [v12 clearMappings];
    unint64_t v8 = [(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self mappingsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self mappingsAtIndex:j];
        [v12 addMappings:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = self->_plans;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_mappings;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponseReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  plans = self->_plans;
  if (plans) {
    [v3 setObject:plans forKey:@"plans"];
  }
  if ([(NSMutableArray *)self->_mappings count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_mappings, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_mappings;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"mappings"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse;
  id v4 = [(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALPLAN_GENERATIONPlanGenerationResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)mappingsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mappings objectAtIndex:a3];
}

- (unint64_t)mappingsCount
{
  return [(NSMutableArray *)self->_mappings count];
}

- (void)addMappings:(id)a3
{
  id v4 = a3;
  mappings = self->_mappings;
  id v8 = v4;
  if (!mappings)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_mappings;
    self->_mappings = v6;

    id v4 = v8;
    mappings = self->_mappings;
  }
  [(NSMutableArray *)mappings addObject:v4];
}

- (void)clearMappings
{
}

- (id)plansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_plans objectAtIndex:a3];
}

- (unint64_t)plansCount
{
  return [(NSMutableArray *)self->_plans count];
}

- (void)addPlans:(id)a3
{
  id v4 = a3;
  plans = self->_plans;
  id v8 = v4;
  if (!plans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_plans;
    self->_plans = v6;

    id v4 = v8;
    plans = self->_plans;
  }
  [(NSMutableArray *)plans addObject:v4];
}

- (void)clearPlans
{
}

+ (Class)mappingsType
{
  return (Class)objc_opt_class();
}

+ (Class)plansType
{
  return (Class)objc_opt_class();
}

@end