@interface TPSDeliveryPrecondition
- (NSArray)conditions;
- (NSString)label;
- (TPSDeliveryPrecondition)initWithDictionary:(id)a3;
- (id)conditionsForType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)registrableEvents;
- (int64_t)joinType;
- (int64_t)statusType;
- (void)setConditions:(id)a3;
- (void)setJoinType:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setStatusType:(int64_t)a3;
@end

@implementation TPSDeliveryPrecondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_conditions, 0);
}

- (TPSDeliveryPrecondition)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TPSDeliveryPrecondition;
  v5 = [(TPSSerializableObject *)&v25 initWithDictionary:v4];
  v6 = v5;
  if (v5)
  {
    v5->_statusType = 0;
    if ([v4 TPSSafeIntegerForKey:@"statusType"] == 1) {
      v6->_statusType = 1;
    }
    v7 = [v4 TPSSafeStringForKey:@"joinType"];
    v6->_joinType = 0;
    if ([v7 isEqualToString:@"OR"]) {
      v6->_joinType = 1;
    }
    v8 = [v4 TPSSafeArrayForKey:@"conditions"];
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = +[TPSCondition conditionFromDictionary:](TPSCondition, "conditionFromDictionary:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [v9 copy];
    conditions = v6->_conditions;
    v6->_conditions = (NSArray *)v16;

    uint64_t v18 = [v4 TPSSafeStringForKey:@"label"];
    label = v6->_label;
    v6->_label = (NSString *)v18;
  }
  return v6;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (id)registrableEvents
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__6;
  uint64_t v13 = __Block_byref_object_dispose__6;
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(TPSDeliveryPrecondition *)self conditions];
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [(TPSDeliveryPrecondition *)self conditions];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__TPSDeliveryPrecondition_registrableEvents__block_invoke;
  v8[3] = &unk_1E6E6BFF8;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  if ([(id)v10[5] count]) {
    v6 = (void *)[(id)v10[5] copy];
  }
  else {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __44__TPSDeliveryPrecondition_registrableEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 values];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __44__TPSDeliveryPrecondition_registrableEvents__block_invoke_2;
      v5[3] = &unk_1E6E6BFD0;
      v5[4] = *(void *)(a1 + 32);
      [v4 enumerateObjectsUsingBlock:v5];
    }
  }
}

void __44__TPSDeliveryPrecondition_registrableEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 type] == 2
    && ([v10 key],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEqualToString:@"ContextualEvent"],
        v3,
        v4))
  {
    v5 = +[TPSCustomCapabilityValidationBuilder targetValidationForCapability:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  if ([v7 isRegistrable])
  {
    v8 = [v10 value];
    uint64_t v9 = +[TPSContextualEventValidation contextualEventFromEventDictionary:v8];

    if (v9)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v9];
    }
  }
}

- (id)conditionsForType:(int64_t)a3
{
  if (a3)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__6;
    v15 = __Block_byref_object_dispose__6;
    v5 = (void *)MEMORY[0x1E4F1CA48];
    v6 = [(TPSDeliveryPrecondition *)self conditions];
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    id v7 = [(TPSDeliveryPrecondition *)self conditions];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__TPSDeliveryPrecondition_conditionsForType___block_invoke;
    v10[3] = &unk_1E6E6C020;
    v10[4] = &v11;
    v10[5] = a3;
    [v7 enumerateObjectsUsingBlock:v10];

    if ([(id)v12[5] count]) {
      v8 = (void *)[(id)v12[5] copy];
    }
    else {
      v8 = 0;
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = [(TPSDeliveryPrecondition *)self conditions];
  }

  return v8;
}

void __45__TPSDeliveryPrecondition_conditionsForType___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 targetingValidationsForType:*(void *)(a1 + 40)];
  if ([v3 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setStatusType:self->_statusType];
  [v4 setJoinType:self->_joinType];
  v5 = (void *)[(NSArray *)self->_conditions copy];
  [v4 setConditions:v5];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSDeliveryPrecondition;
  id v4 = [(TPSSerializableObject *)&v9 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"\n%@ = %zd\n", @"statusType", -[TPSDeliveryPrecondition statusType](self, "statusType")];
  [v5 appendFormat:@"%@ = %zd\n", @"joinType", -[TPSDeliveryPrecondition joinType](self, "joinType")];
  v6 = [(TPSDeliveryPrecondition *)self conditions];
  id v7 = [v6 debugDescription];
  [v5 appendFormat:@"%@ = %@\n", @"conditions", v7];

  return v5;
}

- (void)setStatusType:(int64_t)a3
{
  self->_statusType = a3;
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

- (void)setConditions:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

@end