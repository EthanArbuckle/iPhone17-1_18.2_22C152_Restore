@interface TPSContextualCondition
+ (BOOL)supportsSecureCoding;
+ (id)eventsForConditionDictionary:(id)a3;
- (NSArray)rules;
- (NSDate)matchedDate;
- (TPSContextualCondition)initWithCoder:(id)a3;
- (TPSContextualCondition)initWithDictionary:(id)a3;
- (TPSContextualCondition)initWithDictionary:(id)a3 type:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)eventIdentifiers;
- (unint64_t)joinType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)restartTracking;
- (void)setJoinType:(unint64_t)a3;
- (void)setMatchedDate:(id)a3;
- (void)setRules:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TPSContextualCondition

+ (id)eventsForConditionDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [a3 TPSSafeArrayForKey:@"rules"];
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = +[TPSContextualRule eventsForRuleDictionary:](TPSContextualRule, "eventsForRuleDictionary:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v4 addObjectsFromArray:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualCondition)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  self->_type = a4;
  return [(TPSContextualCondition *)self initWithDictionary:a3];
}

- (TPSContextualCondition)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TPSContextualCondition;
  id v5 = [(TPSSerializableObject *)&v26 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = [v4 TPSSafeStringForKey:@"joinType"];
  v5->_joinType = [v6 isEqualToString:@"AND"] ^ 1;
  uint64_t v7 = [v4 TPSSafeArrayForKey:@"rules"];
  unint64_t v8 = 0x1E9413000;
  if ([v7 count])
  {
    v21 = v6;
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = [[TPSContextualRule alloc] initWithDictionary:*(void *)(*((void *)&v22 + 1) + 8 * v14)];
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    unint64_t v8 = 0x1E9413000uLL;
    if ([v9 count])
    {
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];
      rules = v5->_rules;
      v5->_rules = (NSArray *)v16;
    }
    uint64_t v6 = v21;
  }
  uint64_t v18 = [*(id *)((char *)&v5->super.super.isa + *(int *)(v8 + 2524)) count];

  if (!v18) {
    v19 = 0;
  }
  else {
LABEL_16:
  }
    v19 = v5;

  return v19;
}

- (TPSContextualCondition)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSContextualCondition;
  id v5 = [(TPSSerializableObject *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_type = (int)[v4 decodeIntForKey:@"type"];
    v5->_joinType = (int)[v4 decodeIntForKey:@"joinType"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"rules"];
    rules = v5->_rules;
    v5->_rules = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchedDate"];
    matchedDate = v5->_matchedDate;
    v5->_matchedDate = (NSDate *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualCondition;
  id v4 = a3;
  [(TPSSerializableObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_joinType forKey:@"joinType"];
  [v4 encodeObject:self->_rules forKey:@"rules"];
  [v4 encodeObject:self->_matchedDate forKey:@"matchedDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualCondition;
  id v4 = [(TPSSerializableObject *)&v6 copyWithZone:a3];
  [v4 setType:self->_type];
  [v4 setJoinType:self->_joinType];
  [v4 setRules:self->_rules];
  [v4 setMatchedDate:self->_matchedDate];
  return v4;
}

- (id)eventIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_rules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "eventIdentifiers", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)restartTracking
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  matchedDate = self->_matchedDate;
  self->_matchedDate = 0;

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_rules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "restartTracking", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualCondition;
  id v4 = [(TPSSerializableObject *)&v9 debugDescription];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"%@ = %lu\n", @"type", self->_type];
  [v5 appendFormat:@"%@ = %lu\n", @"joinType", self->_joinType];
  matchedDate = self->_matchedDate;
  if (matchedDate) {
    [v5 appendFormat:@"%@ = %@\n", @"matchedDate", matchedDate];
  }
  if ([(NSArray *)self->_rules count])
  {
    uint64_t v7 = [(NSArray *)self->_rules debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"rules", v7];
  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)joinType
{
  return self->_joinType;
}

- (void)setJoinType:(unint64_t)a3
{
  self->_joinType = a3;
}

- (NSDate)matchedDate
{
  return self->_matchedDate;
}

- (void)setMatchedDate:(id)a3
{
}

- (NSArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_matchedDate, 0);
}

@end