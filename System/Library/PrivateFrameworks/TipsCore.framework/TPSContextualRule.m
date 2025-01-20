@interface TPSContextualRule
+ (BOOL)supportsSecureCoding;
+ (id)eventsForRuleDictionary:(id)a3;
- (NSArray)eventIdentifiers;
- (NSDate)matchedDate;
- (NSString)identifier;
- (TPSContextualRule)initWithCoder:(id)a3;
- (TPSContextualRule)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)restartTracking;
- (void)setEventIdentifiers:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMatchedDate:(id)a3;
@end

@implementation TPSContextualRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventsForRuleDictionary:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 TPSSafeArrayForKey:@"events"];
  if (!v4)
  {
    v5 = [v3 TPSSafeArrayForKey:@"conditions"];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v9[0] = v3;
      v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
    else
    {
      v4 = 0;
    }
  }
  if ([v4 count])
  {
    v7 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TPSContextualRule)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TPSContextualRule;
  v5 = [(TPSSerializableObject *)&v26 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t v6 = [v4 TPSSafeStringForKey:@"id"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  if (![(NSString *)v5->_identifier length]) {
    goto LABEL_18;
  }
  v8 = [v4 TPSSafeArrayForKey:@"events"];
  unint64_t v9 = 0x1E9413000;
  if ([v8 count])
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = +[TPSContextualEvent identifierFromEventInfoDictionary:](TPSContextualEvent, "identifierFromEventInfoDictionary:", *(void *)(*((void *)&v22 + 1) + 8 * v15), (void)v22);
          if ([v16 length]) {
            [v10 addObject:v16];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }

    unint64_t v9 = 0x1E9413000uLL;
    if ([v10 count])
    {
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];
      eventIdentifiers = v5->_eventIdentifiers;
      v5->_eventIdentifiers = (NSArray *)v17;
    }
  }
  uint64_t v19 = objc_msgSend(*(id *)((char *)&v5->super.super.isa + *(int *)(v9 + 2640)), "count", (void)v22);

  if (v19) {
LABEL_17:
  }
    v20 = v5;
  else {
LABEL_18:
  }
    v20 = 0;

  return v20;
}

- (TPSContextualRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSContextualRule;
  v5 = [(TPSSerializableObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"eventIdentifiers"];
    eventIdentifiers = v5->_eventIdentifiers;
    v5->_eventIdentifiers = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchedDate"];
    matchedDate = v5->_matchedDate;
    v5->_matchedDate = (NSDate *)v13;

    if (v5->_matchedDate)
    {
      if (objc_msgSend(MEMORY[0x1E4F1C9C8], "isDateExpired:maxTimeInterval:", -63072000.0))
      {
        uint64_t v15 = v5->_matchedDate;
        v5->_matchedDate = 0;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualRule;
  id v4 = a3;
  [(TPSSerializableObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"id", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_eventIdentifiers forKey:@"eventIdentifiers"];
  [v4 encodeObject:self->_matchedDate forKey:@"matchedDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualRule;
  id v4 = [(TPSSerializableObject *)&v6 copyWithZone:a3];
  [v4 setIdentifier:self->_identifier];
  [v4 setEventIdentifiers:self->_eventIdentifiers];
  [v4 setMatchedDate:self->_matchedDate];
  return v4;
}

- (void)restartTracking
{
  self->_matchedDate = 0;
  MEMORY[0x1F41817F8]();
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualRule;
  id v4 = [(TPSSerializableObject *)&v9 debugDescription];
  objc_super v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"%@ = %@\n", @"id", self->_identifier];
  if ([(NSArray *)self->_eventIdentifiers count])
  {
    objc_super v6 = [(NSArray *)self->_eventIdentifiers debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"eventIdentifiers", v6];
  }
  matchedDate = self->_matchedDate;
  if (matchedDate) {
    [v5 appendFormat:@"%@ = %@\n", @"matchedDate", matchedDate];
  }
  return v5;
}

- (NSDate)matchedDate
{
  return self->_matchedDate;
}

- (void)setMatchedDate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (void)setEventIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_matchedDate, 0);
}

@end