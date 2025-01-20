@interface SignpostSupportUniquePIDFilter
- (BOOL)_wantsNotEqual;
- (BOOL)passesUniquePIDNumber:(id)a3;
- (NSPredicate)predicateEquivalent;
- (NSSet)uniquePidSet;
- (SignpostSupportUniquePIDFilter)init;
- (unint64_t)_compoundPredicateType;
- (void)addUniquePIDNumber:(id)a3;
- (void)addUniquePIDNumberSet:(id)a3;
@end

@implementation SignpostSupportUniquePIDFilter

- (NSPredicate)predicateEquivalent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(SignpostSupportUniquePIDFilter *)self uniquePidSet];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E4F28F60];
        [(SignpostSupportUniquePIDFilter *)self _wantsNotEqual];
        v11 = objc_msgSend(v10, "predicateWithFormat:", @"creatorProcessUniqueIdentifier != %llu", objc_msgSend(v9, "unsignedLongLongValue"));
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", -[SignpostSupportUniquePIDFilter _compoundPredicateType](self, "_compoundPredicateType"), v3);

  return (NSPredicate *)v12;
}

- (BOOL)_wantsNotEqual
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (SignpostSupportUniquePIDFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SignpostSupportUniquePIDFilter;
  v2 = [(SignpostSupportUniquePIDFilter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    uniquePidSet = v2->_uniquePidSet;
    v2->_uniquePidSet = (NSSet *)v3;
  }
  return v2;
}

- (BOOL)passesUniquePIDNumber:(id)a3
{
  return 0;
}

- (void)addUniquePIDNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostSupportUniquePIDFilter *)self uniquePidSet];
  [v5 addObject:v4];
}

- (void)addUniquePIDNumberSet:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostSupportUniquePIDFilter *)self uniquePidSet];
  [v5 unionSet:v4];
}

- (NSSet)uniquePidSet
{
  return self->_uniquePidSet;
}

- (void).cxx_destruct
{
}

@end