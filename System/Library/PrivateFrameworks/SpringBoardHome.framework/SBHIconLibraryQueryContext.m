@interface SBHIconLibraryQueryContext
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQueryContext:(id)a3;
- (NSUUID)UUID;
- (SBHIconLibraryQuery)query;
- (SBHIconLibraryQueryContext)init;
- (SBHIconLibraryQueryContext)initWithQuery:(id)a3;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation SBHIconLibraryQueryContext

- (SBHIconLibraryQueryContext)initWithQuery:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBHIconLibraryQueryContext;
  v5 = [(SBHIconLibraryQueryContext *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    query = v5->_query;
    v5->_query = (SBHIconLibraryQuery *)v6;

    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    uint64_t v10 = objc_opt_new();
    contextStorage = v5->_contextStorage;
    v5->_contextStorage = (NSMutableDictionary *)v10;

    uint64_t v12 = _gQueryContextIdx++;
    v5->_queryContextIdx = v12;
  }

  return v5;
}

- (SBHIconLibraryQueryContext)init
{
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_query withName:@"query"];
  id v5 = (id)[v3 appendObject:self->_UUID withName:@"UUID"];
  [v3 appendDictionarySection:self->_contextStorage withName:@"contextStorage" skipIfEmpty:1];
  id v6 = (id)[v3 appendInteger:self->_queryContextIdx withName:@"queryContextIdx"];
  v7 = [v3 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHIconLibraryQueryContext *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(SBHIconLibraryQueryContext *)self isEqualToQueryContext:v4];
  }

  return v5;
}

- (BOOL)isEqualToQueryContext:(id)a3
{
  id v4 = (SBHIconLibraryQueryContext *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    id v6 = [(SBHIconLibraryQueryContext *)v4 UUID];
    v7 = [(SBHIconLibraryQueryContext *)self UUID];
    int v8 = [v6 isEqual:v7];

    if (v8
      && ([p_isa query],
          v9 = objc_claimAutoreleasedReturnValue(),
          [(SBHIconLibraryQueryContext *)self query],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v9 isEqual:v10],
          v10,
          v9,
          v11))
    {
      char v12 = [p_isa[1] isEqual:self->_contextStorage];
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_contextStorage objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (SBHIconLibraryQuery)query
{
  return self->_query;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_contextStorage, 0);
}

@end