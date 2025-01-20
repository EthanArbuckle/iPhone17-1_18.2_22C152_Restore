@interface HKSPSleepEvent
+ (BOOL)supportsSecureCoding;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5 type:(unint64_t)a6 expirationDate:(id)a7 isUserVisible:(BOOL)a8;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 expirationDate:(id)a5 isUserVisible:(BOOL)a6;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 isUserVisible:(BOOL)a5;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5 expirationDate:(id)a6 isUserVisible:(BOOL)a7;
+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5 isUserVisible:(BOOL)a6;
+ (id)standardEventIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired:(id)a3;
- (BOOL)isUserVisible;
- (HKSPSleepEvent)initWithCoder:(id)a3;
- (HKSPSleepEvent)initWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5 type:(unint64_t)a6 expirationDate:(id)a7 isUserVisible:(BOOL)a8;
- (HKSPSyncAnchor)syncAnchor;
- (NSDate)dueDate;
- (NSDate)expirationDate;
- (NSDictionary)context;
- (NSString)identifier;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)objectWithSyncAnchor:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepEvent

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(HKSPSleepEvent *)self dueDate];
  v6 = [v4 dueDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dateByAddingTimeInterval:900.0];
  v12 = [a1 sleepEventWithIdentifier:v10 dueDate:v9 context:v8 type:0 expirationDate:v11 isUserVisible:1];

  return v12;
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5 type:(unint64_t)a6 expirationDate:(id)a7 isUserVisible:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v16 dueDate:v15 context:v14 type:a6 expirationDate:v13 isUserVisible:v8];

  return v17;
}

- (HKSPSleepEvent)initWithIdentifier:(id)a3 dueDate:(id)a4 context:(id)a5 type:(unint64_t)a6 expirationDate:(id)a7 isUserVisible:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HKSPSleepEvent;
  v18 = [(HKSPSleepEvent *)&v25 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_dueDate, a4);
    uint64_t v21 = [v16 copy];
    context = v18->_context;
    v18->_context = (NSDictionary *)v21;

    objc_storeStrong((id *)&v18->_expirationDate, a7);
    v18->_isUserVisible = a8;
    v18->_type = a6;
    v23 = v18;
  }

  return v18;
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4
{
  return (id)[a1 sleepEventWithIdentifier:a3 dueDate:a4 context:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5
{
  return (id)[a1 sleepEventWithIdentifier:a3 dueDate:a4 type:a5 isUserVisible:1];
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 isUserVisible:(BOOL)a5
{
  return (id)[a1 sleepEventWithIdentifier:a3 dueDate:a4 type:0 isUserVisible:a5];
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5 isUserVisible:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [v10 dateByAddingTimeInterval:900.0];
  id v13 = [a1 sleepEventWithIdentifier:v11 dueDate:v10 type:a5 expirationDate:v12 isUserVisible:v6];

  return v13;
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 expirationDate:(id)a5 isUserVisible:(BOOL)a6
{
  return (id)[a1 sleepEventWithIdentifier:a3 dueDate:a4 type:0 expirationDate:a5 isUserVisible:a6];
}

+ (id)sleepEventWithIdentifier:(id)a3 dueDate:(id)a4 type:(unint64_t)a5 expirationDate:(id)a6 isUserVisible:(BOOL)a7
{
  return (id)[a1 sleepEventWithIdentifier:a3 dueDate:a4 context:0 type:a5 expirationDate:a6 isUserVisible:a7];
}

- (BOOL)isExpired:(id)a3
{
  id v4 = a3;
  v5 = [(HKSPSleepEvent *)self expirationDate];
  if (v5)
  {
    BOOL v6 = [(HKSPSleepEvent *)self expirationDate];
    char v7 = objc_msgSend(v4, "hksp_isAfterOrSameAsDate:", v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)objectWithSyncAnchor:(id)a3
{
  id v4 = a3;
  v5 = [[HKSPSleepEvent alloc] initWithIdentifier:self->_identifier dueDate:self->_dueDate context:self->_context type:self->_type expirationDate:self->_expirationDate isUserVisible:self->_isUserVisible];
  uint64_t v6 = [v4 copyWithZone:0];

  syncAnchor = v5->_syncAnchor;
  v5->_syncAnchor = (HKSPSyncAnchor *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPSleepEvent *)a3;
  if (self == v4)
  {
    char v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      char v7 = [(HKSPSleepEvent *)self identifier];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __26__HKSPSleepEvent_isEqual___block_invoke;
      v40[3] = &unk_1E5D32588;
      BOOL v8 = v5;
      v41 = v8;
      id v9 = (id)[v6 appendObject:v7 counterpart:v40];

      id v10 = [(HKSPSleepEvent *)self dueDate];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __26__HKSPSleepEvent_isEqual___block_invoke_2;
      v38[3] = &unk_1E5D325B0;
      id v11 = v8;
      v39 = v11;
      id v12 = (id)[v6 appendObject:v10 counterpart:v38];

      id v13 = [(HKSPSleepEvent *)self context];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __26__HKSPSleepEvent_isEqual___block_invoke_3;
      v36[3] = &unk_1E5D32320;
      id v14 = v11;
      v37 = v14;
      id v15 = (id)[v6 appendObject:v13 counterpart:v36];

      id v16 = [(HKSPSleepEvent *)self expirationDate];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __26__HKSPSleepEvent_isEqual___block_invoke_4;
      v34[3] = &unk_1E5D325B0;
      id v17 = v14;
      v35 = v17;
      id v18 = (id)[v6 appendObject:v16 counterpart:v34];

      BOOL v19 = [(HKSPSleepEvent *)self isUserVisible];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __26__HKSPSleepEvent_isEqual___block_invoke_5;
      v32[3] = &unk_1E5D325D8;
      v20 = v17;
      v33 = v20;
      id v21 = (id)[v6 appendBool:v19 counterpart:v32];
      unint64_t v22 = [(HKSPSleepEvent *)self type];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __26__HKSPSleepEvent_isEqual___block_invoke_6;
      v30 = &unk_1E5D32600;
      v31 = v20;
      v23 = v20;
      id v24 = (id)[v6 appendUnsignedInteger:v22 counterpart:&v27];
      char v25 = objc_msgSend(v6, "isEqual", v27, v28, v29, v30);
    }
    else
    {
      char v25 = 0;
    }
  }

  return v25;
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dueDate];
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) context];
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) expirationDate];
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUserVisible];
}

uint64_t __26__HKSPSleepEvent_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_dueDate forKey:@"dueDate"];
  [v5 encodeObject:self->_context forKey:@"context"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeBool:self->_isUserVisible forKey:@"isUserVisible"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_syncAnchor forKey:@"syncAnchor"];
}

- (HKSPSleepEvent)initWithCoder:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKSPSleepEvent;
  id v5 = [(HKSPSleepEvent *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    id v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    v5->_isUserVisible = [v4 decodeBoolForKey:@"isUserVisible"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v17 = [v4 decodeObjectOfClass:HKSPSyncAnchorClass() forKey:@"syncAnchor"];
    syncAnchor = v5->_syncAnchor;
    v5->_syncAnchor = (HKSPSyncAnchor *)v17;

    BOOL v19 = v5;
  }

  return v5;
}

+ (id)standardEventIdentifiers
{
  if (qword_1EB538560 != -1) {
    dispatch_once(&qword_1EB538560, &__block_literal_global_340);
  }
  v2 = (void *)_MergedGlobals_9;
  return v2;
}

void __42__HKSPSleepEvent_standardEventIdentifiers__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"HKSPSleepEventIdentifierWakeUp";
  v4[1] = @"HKSPSleepEventIdentifierBedtime";
  v4[2] = @"HKSPSleepEventIdentifierWindDown";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = v2;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(HKSPSleepEvent *)self identifier];
  id v5 = (id)[v3 appendObject:v4];

  uint64_t v6 = [(HKSPSleepEvent *)self dueDate];
  id v7 = (id)[v3 appendObject:v6];

  uint64_t v8 = [(HKSPSleepEvent *)self context];
  id v9 = (id)[v3 appendObject:v8];

  id v10 = [(HKSPSleepEvent *)self expirationDate];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = (id)objc_msgSend(v3, "appendBool:", -[HKSPSleepEvent isUserVisible](self, "isUserVisible"));
  id v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[HKSPSleepEvent type](self, "type"));
  unint64_t v14 = [v3 hash];

  return v14;
}

- (id)succinctDescription
{
  uint64_t v2 = [(HKSPSleepEvent *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(HKSPSleepEvent *)self identifier];
  [v3 appendString:v4 withName:@"identifier"];

  id v5 = [(HKSPSleepEvent *)self dueDate];
  uint64_t v6 = [v5 hkspDescription];
  id v7 = (id)[v3 appendObject:v6 withName:@"dueDate"];

  uint64_t v8 = [(HKSPSleepEvent *)self context];
  id v9 = (id)[v3 appendObject:v8 withName:@"context" skipIfNil:1];

  id v10 = [(HKSPSleepEvent *)self expirationDate];
  id v11 = [v10 hkspDescription];
  id v12 = (id)[v3 appendObject:v11 withName:@"expirationDate" skipIfNil:1];

  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepEvent isUserVisible](self, "isUserVisible"), @"isUserVisible");
  if ([(HKSPSleepEvent *)self type]) {
    id v14 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HKSPSleepEvent type](self, "type"), @"type");
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPSleepEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)context
{
  return self->_context;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

@end