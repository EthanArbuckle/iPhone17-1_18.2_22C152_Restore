@interface FCAdStatusCondition
+ (id)adStatusConditionsFromConditionsArray:(id)a3;
- (FCAdStatusCondition)initWithStatusConditionType:(unint64_t)a3 identifier:(id)a4;
- (NSString)identifier;
- (unint64_t)type;
- (void)setIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FCAdStatusCondition

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

+ (id)adStatusConditionsFromConditionsArray:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = @"statusConditionType";
    uint64_t v8 = *(void *)v23;
    unint64_t v9 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v11 objectForKey:v7];
        v13 = [v11 objectForKey:@"identifier"];
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v13)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v14 = v7;
                unint64_t v15 = v9;
                id v16 = v4;
                uint64_t v17 = adStatusConditionTypeForType(v12);
                v18 = [[FCAdStatusCondition alloc] initWithStatusConditionType:v17 identifier:v13];
                v19 = [NSNumber numberWithUnsignedInteger:v17];
                [v21 setObject:v18 forKey:v19];

                id v4 = v16;
                unint64_t v9 = v15;
                v7 = v14;
              }
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  return v21;
}

- (FCAdStatusCondition)initWithStatusConditionType:(unint64_t)a3 identifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCAdStatusCondition;
  uint64_t v8 = [(FCAdStatusCondition *)&v11 init];
  unint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    v9->_type = a3;
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setIdentifier:(id)a3
{
}

@end