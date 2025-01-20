@interface WFCoreDataChangeNotification
- (BOOL)appliesToResultState:(id)a3;
- (BOOL)hasChanges;
- (BOOL)invalidatedAllObjects;
- (BOOL)originatedInCurrentProcess;
- (NSSet)deleted;
- (NSSet)inserted;
- (NSSet)updated;
- (WFCoreDataChangeNotification)initWithDictionaryRepresentation:(id)a3;
- (WFCoreDataChangeNotification)initWithInvalidatedAllObjects:(BOOL)a3 updated:(id)a4 inserted:(id)a5 deleted:(id)a6 processIdentifier:(int)a7;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (id)notificationByMergingChangesFromNotification:(id)a3;
- (int)processIdentifier;
@end

@implementation WFCoreDataChangeNotification

- (BOOL)hasChanges
{
  if ([(WFCoreDataChangeNotification *)self invalidatedAllObjects]) {
    return 1;
  }
  v4 = [(WFCoreDataChangeNotification *)self updated];
  if ([v4 count])
  {
    BOOL v3 = 1;
  }
  else
  {
    v5 = [(WFCoreDataChangeNotification *)self inserted];
    if ([v5 count])
    {
      BOOL v3 = 1;
    }
    else
    {
      v6 = [(WFCoreDataChangeNotification *)self deleted];
      BOOL v3 = [v6 count] != 0;
    }
  }

  return v3;
}

- (NSSet)updated
{
  return self->_updated;
}

- (BOOL)invalidatedAllObjects
{
  return self->_invalidatedAllObjects;
}

- (NSSet)inserted
{
  return self->_inserted;
}

- (NSSet)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
}

- (WFCoreDataChangeNotification)initWithInvalidatedAllObjects:(BOOL)a3 updated:(id)a4 inserted:(id)a5 deleted:(id)a6 processIdentifier:(int)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFCoreDataChangeNotification;
  v15 = [(WFCoreDataChangeNotification *)&v25 init];
  v16 = v15;
  if (v15)
  {
    v15->_invalidatedAllObjects = a3;
    uint64_t v17 = [v12 copy];
    updated = v16->_updated;
    v16->_updated = (NSSet *)v17;

    uint64_t v19 = [v13 copy];
    inserted = v16->_inserted;
    v16->_inserted = (NSSet *)v19;

    uint64_t v21 = [v14 copy];
    deleted = v16->_deleted;
    v16->_deleted = (NSSet *)v21;

    v16->_processIdentifier = a7;
    v23 = v16;
  }

  return v16;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (id)debugDescription
{
  v2 = [(WFCoreDataChangeNotification *)self dictionaryRepresentation];
  BOOL v3 = [v2 debugDescription];

  return v3;
}

- (BOOL)appliesToResultState:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WFCoreDataChangeNotification *)self invalidatedAllObjects])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v6 = [(WFCoreDataChangeNotification *)self inserted];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) objectType];
          if (v11 == [v4 objectType])
          {
LABEL_22:
            LOBYTE(v5) = 1;
            goto LABEL_23;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [(WFCoreDataChangeNotification *)self updated];
    id v13 = [(WFCoreDataChangeNotification *)self deleted];
    v6 = [v12 setByAddingObjectsFromSet:v13];

    uint64_t v5 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v5)
    {
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t j = 0; j != v5; ++j)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * j);
          uint64_t v17 = [v4 state];
          if ([v17 containsObject:v16])
          {

            goto LABEL_22;
          }
          v18 = [v4 state];
          uint64_t v19 = [v18 count];

          if (!v19) {
            goto LABEL_22;
          }
        }
        uint64_t v5 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_23:
  }
  return v5;
}

- (BOOL)originatedInCurrentProcess
{
  int v2 = [(WFCoreDataChangeNotification *)self processIdentifier];
  return v2 == getpid();
}

- (id)dictionaryRepresentation
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"invalidatedAllObjects";
  BOOL v3 = objc_msgSend(NSNumber, "numberWithBool:", -[WFCoreDataChangeNotification invalidatedAllObjects](self, "invalidatedAllObjects"));
  v14[0] = v3;
  v13[1] = @"updated";
  id v4 = [(WFCoreDataChangeNotification *)self updated];
  uint64_t v5 = WFArrayFromChanges(v4);
  v14[1] = v5;
  v13[2] = @"inserted";
  v6 = [(WFCoreDataChangeNotification *)self inserted];
  uint64_t v7 = WFArrayFromChanges(v6);
  v14[2] = v7;
  v13[3] = @"deleted";
  uint64_t v8 = [(WFCoreDataChangeNotification *)self deleted];
  uint64_t v9 = WFArrayFromChanges(v8);
  v14[3] = v9;
  v13[4] = @"processIdentifier";
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[WFCoreDataChangeNotification processIdentifier](self, "processIdentifier"));
  v14[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

- (id)notificationByMergingChangesFromNotification:(id)a3
{
  id v4 = a3;
  uint64_t v16 = [WFCoreDataChangeNotification alloc];
  if ([(WFCoreDataChangeNotification *)self invalidatedAllObjects]) {
    unsigned int v15 = 1;
  }
  else {
    unsigned int v15 = [v4 invalidatedAllObjects];
  }
  uint64_t v17 = [(WFCoreDataChangeNotification *)self updated];
  uint64_t v5 = [v4 updated];
  v6 = [v17 setByAddingObjectsFromSet:v5];
  uint64_t v7 = [(WFCoreDataChangeNotification *)self inserted];
  uint64_t v8 = [v4 inserted];
  uint64_t v9 = [v7 setByAddingObjectsFromSet:v8];
  v10 = [(WFCoreDataChangeNotification *)self deleted];
  uint64_t v11 = [v4 deleted];
  id v12 = [v10 setByAddingObjectsFromSet:v11];
  id v13 = [(WFCoreDataChangeNotification *)v16 initWithInvalidatedAllObjects:v15 updated:v6 inserted:v9 deleted:v12 processIdentifier:[(WFCoreDataChangeNotification *)self processIdentifier]];

  return v13;
}

- (WFCoreDataChangeNotification)initWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"invalidatedAllObjects"];
  uint64_t v5 = [v4 BOOLValue];
  v6 = [v3 objectForKeyedSubscript:@"updated"];
  uint64_t v7 = WFChangesFromArray(v6);
  uint64_t v8 = [v3 objectForKeyedSubscript:@"inserted"];
  uint64_t v9 = WFChangesFromArray(v8);
  v10 = [v3 objectForKeyedSubscript:@"deleted"];
  uint64_t v11 = WFChangesFromArray(v10);
  id v12 = [v3 objectForKeyedSubscript:@"processIdentifier"];

  id v13 = -[WFCoreDataChangeNotification initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:](self, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", v5, v7, v9, v11, [v12 integerValue]);
  return v13;
}

@end