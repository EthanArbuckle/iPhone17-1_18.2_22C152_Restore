@interface SignpostSupportPIDFilter
- (BOOL)_wantsNotEqual;
- (BOOL)_wantsNotSubsystem;
- (BOOL)passesPIDNumber:(id)a3;
- (NSPredicate)predicateEquivalent;
- (NSSet)pidSet;
- (SignpostSupportPIDFilter)init;
- (unint64_t)_compoundPredicateType;
- (void)addPIDNumber:(id)a3;
- (void)addPIDNumberSet:(id)a3;
@end

@implementation SignpostSupportPIDFilter

- (SignpostSupportPIDFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SignpostSupportPIDFilter;
  v2 = [(SignpostSupportPIDFilter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    pidSet = v2->_pidSet;
    v2->_pidSet = (NSSet *)v3;
  }
  return v2;
}

- (BOOL)passesPIDNumber:(id)a3
{
  return 0;
}

- (BOOL)_wantsNotSubsystem
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (NSPredicate)predicateEquivalent
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(SignpostSupportPIDFilter *)self pidSet];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E4F28F60];
        if ([(SignpostSupportPIDFilter *)self _wantsNotEqual]) {
          v10 = @"processIdentifier != %llu";
        }
        else {
          v10 = @"processIdentifier == %llu";
        }
        v11 = objc_msgSend(v9, "predicateWithFormat:", v10, objc_msgSend(v8, "unsignedLongLongValue"));
        [v3 addObject:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", -[SignpostSupportPIDFilter _compoundPredicateType](self, "_compoundPredicateType"), v3);

  return (NSPredicate *)v12;
}

- (void)addPIDNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostSupportPIDFilter *)self pidSet];
  [v5 addObject:v4];
}

- (void)addPIDNumberSet:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostSupportPIDFilter *)self pidSet];
  [v5 unionSet:v4];
}

- (NSSet)pidSet
{
  return self->_pidSet;
}

- (BOOL)_wantsNotEqual
{
  return self->__wantsNotEqual;
}

- (void).cxx_destruct
{
}

@end