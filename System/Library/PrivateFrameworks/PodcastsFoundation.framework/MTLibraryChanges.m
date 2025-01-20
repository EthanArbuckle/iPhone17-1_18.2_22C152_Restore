@interface MTLibraryChanges
- (BOOL)hasChanges;
- (BOOL)hasChangesForEntityNames:(id)a3;
- (BOOL)hasDeletes;
- (BOOL)hasDeletesForEntityNames:(id)a3;
- (BOOL)hasInserts;
- (BOOL)hasInsertsForEntityNames:(id)a3;
- (BOOL)hasUpdates;
- (BOOL)hasUpdatesForEntityNames:(id)a3;
- (MTLibraryChanges)init;
- (MTLibraryChanges)initWithContextName:(id)a3;
- (NSMutableDictionary)changesByEntityName;
- (NSString)contextName;
- (id)changesForEntityName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityNames;
- (void)addChangeWith:(id)a3 entityName:(id)a4 changeType:(int)a5;
- (void)combineChanges:(id)a3;
- (void)removeAllChanges;
- (void)setChangesByEntityName:(id)a3;
@end

@implementation MTLibraryChanges

- (void)addChangeWith:(id)a3 entityName:(id)a4 changeType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v11 = a3;
  id v8 = a4;
  v9 = [(MTLibraryChanges *)self changesForEntityName:v8];
  if (!v9)
  {
    v9 = [[MTLibraryEntityChanges alloc] initWithEntityName:v8];
    v10 = [(MTLibraryChanges *)self changesByEntityName];
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
  [(MTLibraryEntityChanges *)v9 add:v11 changeType:v5];
}

- (MTLibraryChanges)initWithContextName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTLibraryChanges;
  uint64_t v5 = [(MTLibraryChanges *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contextName = v5->_contextName;
    v5->_contextName = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    changesByEntityName = v5->_changesByEntityName;
    v5->_changesByEntityName = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (BOOL)hasInsertsForEntityNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        char v10 = [v9 hasInserts];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)hasChanges
{
  v2 = self;
  v3 = [(MTLibraryChanges *)self changesByEntityName];
  id v4 = [v3 allKeys];

  LOBYTE(v2) = [(MTLibraryChanges *)v2 hasChangesForEntityNames:v4];
  return (char)v2;
}

- (id)changesForEntityName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTLibraryChanges *)self changesByEntityName];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSMutableDictionary)changesByEntityName
{
  return self->_changesByEntityName;
}

- (BOOL)hasChangesForEntityNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        char v10 = [v9 hasChanges];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesByEntityName, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
}

- (MTLibraryChanges)init
{
  return [(MTLibraryChanges *)self initWithContextName:&stru_1F03A51F0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(MTLibraryChanges *)self changesByEntityName];
  uint64_t v7 = (void *)[v5 initWithDictionary:v6 copyItems:1];
  [v4 setChangesByEntityName:v7];

  return v4;
}

- (id)description
{
  v2 = [(MTLibraryChanges *)self changesByEntityName];
  v3 = [v2 allValues];
  id v4 = [v3 componentsJoinedByString:@"\n\t"];

  id v5 = [NSString stringWithFormat:@"library changes: {\n\t%@\n}", v4];

  return v5;
}

- (id)entityNames
{
  v2 = [(MTLibraryChanges *)self changesByEntityName];
  v3 = [v2 allKeys];

  return v3;
}

- (void)removeAllChanges
{
  id v2 = [(MTLibraryChanges *)self changesByEntityName];
  [v2 removeAllObjects];
}

- (void)combineChanges:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v4, "entityNames", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        BOOL v11 = [v4 changesForEntityName:v10];
        v12 = [(MTLibraryChanges *)self changesForEntityName:v10];
        if (!v12)
        {
          v12 = [[MTLibraryEntityChanges alloc] initWithEntityName:v10];
          long long v13 = [(MTLibraryChanges *)self changesByEntityName];
          [v13 setObject:v12 forKeyedSubscript:v10];
        }
        [(MTLibraryEntityChanges *)v12 combineChanges:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (BOOL)hasInserts
{
  id v2 = self;
  v3 = [(MTLibraryChanges *)self changesByEntityName];
  id v4 = [v3 allKeys];

  LOBYTE(v2) = [(MTLibraryChanges *)v2 hasInsertsForEntityNames:v4];
  return (char)v2;
}

- (BOOL)hasDeletes
{
  id v2 = self;
  v3 = [(MTLibraryChanges *)self changesByEntityName];
  id v4 = [v3 allKeys];

  LOBYTE(v2) = [(MTLibraryChanges *)v2 hasDeletesForEntityNames:v4];
  return (char)v2;
}

- (BOOL)hasUpdates
{
  id v2 = self;
  v3 = [(MTLibraryChanges *)self changesByEntityName];
  id v4 = [v3 allKeys];

  LOBYTE(v2) = [(MTLibraryChanges *)v2 hasUpdatesForEntityNames:v4];
  return (char)v2;
}

- (BOOL)hasDeletesForEntityNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        char v10 = [v9 hasDeletes];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)hasUpdatesForEntityNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        char v10 = [v9 hasUpdates];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setChangesByEntityName:(id)a3
{
}

@end