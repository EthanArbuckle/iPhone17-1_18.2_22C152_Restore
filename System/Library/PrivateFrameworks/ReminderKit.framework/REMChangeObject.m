@interface REMChangeObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isCoalesced;
- (BOOL)isEqual:(id)a3;
- (NSSet)updatedProperties;
- (REMChangeObject)initWithCoder:(id)a3;
- (REMChangeTombstone)tombstone;
- (REMChangeTransaction)transaction;
- (REMObjectID)changedObjectID;
- (id)coalescedChanges;
- (id)copyForCoalescing;
- (int64_t)changeID;
- (int64_t)changeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMChangeObject

+ (BOOL)supportsSecureCoding
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  uint64_t v6 = objc_opt_class();
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"Abstract method called -[%@ %@]", v6, v7 format];
}

- (REMChangeObject)initWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_opt_class();
  v8 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v7, v8 format];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (REMChangeObject *)a3;
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v8, v9 format];

  return self == v7;
}

- (BOOL)isCoalesced
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (id)coalescedChanges
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (id)copyForCoalescing
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return self;
}

- (NSSet)updatedProperties
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (REMChangeTransaction)transaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transaction);

  return (REMChangeTransaction *)WeakRetained;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (REMObjectID)changedObjectID
{
  return self->_changedObjectID;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (REMChangeTombstone)tombstone
{
  return self->_tombstone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tombstone, 0);
  objc_storeStrong((id *)&self->_changedObjectID, 0);

  objc_destroyWeak((id *)&self->_transaction);
}

@end