@interface SignpostSupportExactProcessNameFilter
- (BOOL)_wantsNotEqual;
- (BOOL)passesProcessName:(id)a3;
- (NSPredicate)predicateEquivalent;
- (NSSet)processNameSet;
- (SignpostSupportExactProcessNameFilter)init;
- (unint64_t)_compoundPredicateType;
- (void)addProcessName:(id)a3;
- (void)addProcessNameSet:(id)a3;
@end

@implementation SignpostSupportExactProcessNameFilter

- (SignpostSupportExactProcessNameFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SignpostSupportExactProcessNameFilter;
  v2 = [(SignpostSupportExactProcessNameFilter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    processNameSet = v2->_processNameSet;
    v2->_processNameSet = (NSSet *)v3;
  }
  return v2;
}

- (BOOL)passesProcessName:(id)a3
{
  return 0;
}

- (void)addProcessName:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostSupportExactProcessNameFilter *)self processNameSet];
  [v5 addObject:v4];
}

- (void)addProcessNameSet:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostSupportExactProcessNameFilter *)self processNameSet];
  [v5 unionSet:v4];
}

- (NSPredicate)predicateEquivalent
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(SignpostSupportExactProcessNameFilter *)self processNameSet];
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
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E4F28F60];
        if ([(SignpostSupportExactProcessNameFilter *)self _wantsNotEqual]) {
          v10 = @"process != %@";
        }
        else {
          v10 = @"process == %@";
        }
        v11 = objc_msgSend(v9, "predicateWithFormat:", v10, v8);
        [v3 addObject:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", -[SignpostSupportExactProcessNameFilter _compoundPredicateType](self, "_compoundPredicateType"), v3);

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

- (NSSet)processNameSet
{
  return self->_processNameSet;
}

- (void).cxx_destruct
{
}

@end