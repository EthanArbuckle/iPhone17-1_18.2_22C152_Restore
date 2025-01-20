@interface NNMKMailboxSelection
+ (BOOL)supportsSecureCoding;
+ (id)mailboxChangesApplyingSelection:(id)a3 previousSelection:(id)a4;
+ (unint64_t)firstFilterTypeFromTypes:(unint64_t)a3;
- (BOOL)containsMailboxFilter:(id)a3;
- (BOOL)hasAggregateMailboxesForAllMessagesOnly;
- (BOOL)hasSelection;
- (BOOL)hasSingleMailboxSelectionOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMailboxFilterEnabled:(unint64_t)a3;
- (NNMKMailboxSelection)initWithAccounts:(id)a3;
- (NNMKMailboxSelection)initWithCoder:(id)a3;
- (NNMKMailboxSelection)initWithMailboxes:(id)a3;
- (NSArray)aggregatedMailboxes;
- (NSArray)allMailboxesSyncEnabled;
- (NSArray)mailboxesWithAllMessagesSyncEnabled;
- (NSMutableDictionary)allMailboxesSyncEnabledById;
- (NSSet)aggregatedMailboxesId;
- (NSSet)mailboxesWithAllMessagesSyncEnabledIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mailboxWithId:(id)a3;
- (unint64_t)aggregatedMailboxesFilterTypes;
- (void)_setupWithAccounts:(id)a3;
- (void)_setupWithMailboxes:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregatedMailboxes:(id)a3;
- (void)setAggregatedMailboxesFilterTypes:(unint64_t)a3;
- (void)setAggregatedMailboxesId:(id)a3;
- (void)setAllMailboxesSyncEnabled:(id)a3;
- (void)setAllMailboxesSyncEnabledById:(id)a3;
- (void)setMailboxesWithAllMessagesSyncEnabled:(id)a3;
- (void)setMailboxesWithAllMessagesSyncEnabledIds:(id)a3;
@end

@implementation NNMKMailboxSelection

- (NNMKMailboxSelection)initWithAccounts:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NNMKMailboxSelection;
  v5 = [(NNMKMailboxSelection *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NNMKMailboxSelection *)v5 _setupWithAccounts:v4];
  }

  return v6;
}

- (NNMKMailboxSelection)initWithMailboxes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NNMKMailboxSelection;
  v5 = [(NNMKMailboxSelection *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NNMKMailboxSelection *)v5 _setupWithMailboxes:v4];
  }

  return v6;
}

- (NNMKMailboxSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NNMKMailboxSelection;
  v5 = [(NNMKMailboxSelection *)&v18 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyInboxesFilterTypes"];
    v5->_aggregatedMailboxesFilterTypes = [v6 unsignedIntegerValue];

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"kNSCodingKeyMailboxesWithAllMessagesSyncEnabled"];
    mailboxesWithAllMessagesSyncEnabled = v5->_mailboxesWithAllMessagesSyncEnabled;
    v5->_mailboxesWithAllMessagesSyncEnabled = (NSArray *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kNSCodingKeyInboxes"];
    aggregatedMailboxes = v5->_aggregatedMailboxes;
    v5->_aggregatedMailboxes = (NSArray *)v15;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NNMKMailboxSelection alloc];
  v5 = [(NNMKMailboxSelection *)self allMailboxesSyncEnabled];
  v6 = [(NNMKMailboxSelection *)v4 initWithMailboxes:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t aggregatedMailboxesFilterTypes = self->_aggregatedMailboxesFilterTypes;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedInteger:aggregatedMailboxesFilterTypes];
  [v7 encodeObject:v6 forKey:@"kNSCodingKeyInboxesFilterTypes"];

  [v7 encodeObject:self->_mailboxesWithAllMessagesSyncEnabled forKey:@"kNSCodingKeyMailboxesWithAllMessagesSyncEnabled"];
  [v7 encodeObject:self->_aggregatedMailboxes forKey:@"kNSCodingKeyInboxes"];
}

- (BOOL)hasSelection
{
  return [(NSArray *)self->_mailboxesWithAllMessagesSyncEnabled count]
      || [(NSArray *)self->_aggregatedMailboxes count] != 0;
}

- (void)_setupWithMailboxes:(id)a3
{
  v23 = self;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v24 = [MEMORY[0x263EFF9C0] set];
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", v23) == 1)
        {
          v14 = (void *)[v13 copy];
          [v4 addObject:v14];
        }
        if (([v13 syncEnabled] & 1) != 0 || objc_msgSend(v13, "syncRequested"))
        {
          if ([v13 type] == 1
            && (([v13 syncEnabled] & 1) != 0 || objc_msgSend(v13, "syncRequested")))
          {
            ++v10;
            uint64_t v15 = [v13 filterType];
            unsigned int v16 = [v13 hasFilterType:1];
            v9 += v16;
            v8 |= v15 ^ v16;
          }
          if ([v13 hasFilterType:1])
          {
            v17 = (void *)[v13 copy];
            [v24 addObject:v17];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }

  if ((unint64_t)[v4 count] < 2)
  {
    objc_super v18 = v23;
  }
  else
  {
    objc_super v18 = v23;
    if ([v4 count] == v10) {
      v8 |= [v4 count] == v9;
    }
  }
  uint64_t v19 = objc_msgSend(v24, "allObjects", v23);
  mailboxesWithAllMessagesSyncEnabled = v18->_mailboxesWithAllMessagesSyncEnabled;
  v18->_mailboxesWithAllMessagesSyncEnabled = (NSArray *)v19;

  v18->_unint64_t aggregatedMailboxesFilterTypes = v8;
  if (v8)
  {
    uint64_t v21 = [v4 allObjects];
    aggregatedMailboxes = v18->_aggregatedMailboxes;
    v18->_aggregatedMailboxes = (NSArray *)v21;
  }
}

- (void)_setupWithAccounts:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "mailboxes", (void)v12);
        [v5 addObjectsFromArray:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(NNMKMailboxSelection *)self _setupWithMailboxes:v5];
}

- (NSSet)mailboxesWithAllMessagesSyncEnabledIds
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  mailboxesWithAllMessagesSyncEnabledIds = self->_mailboxesWithAllMessagesSyncEnabledIds;
  if (mailboxesWithAllMessagesSyncEnabledIds) {
    goto LABEL_10;
  }
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_mailboxesWithAllMessagesSyncEnabled;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "mailboxId", (void)v14);
        [(NSSet *)v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = self->_mailboxesWithAllMessagesSyncEnabledIds;
  self->_mailboxesWithAllMessagesSyncEnabledIds = v4;

  mailboxesWithAllMessagesSyncEnabledIds = self->_mailboxesWithAllMessagesSyncEnabledIds;
  if (mailboxesWithAllMessagesSyncEnabledIds)
  {
LABEL_10:
    long long v12 = mailboxesWithAllMessagesSyncEnabledIds;
  }
  else
  {
    long long v12 = [MEMORY[0x263EFFA08] set];
  }
  return v12;
}

- (NSSet)aggregatedMailboxesId
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  aggregatedMailboxesId = self->_aggregatedMailboxesId;
  if (aggregatedMailboxesId) {
    goto LABEL_10;
  }
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_aggregatedMailboxes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "mailboxId", (void)v14);
        [(NSSet *)v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = self->_aggregatedMailboxesId;
  self->_aggregatedMailboxesId = v4;

  aggregatedMailboxesId = self->_aggregatedMailboxesId;
  if (aggregatedMailboxesId)
  {
LABEL_10:
    long long v12 = aggregatedMailboxesId;
  }
  else
  {
    long long v12 = [MEMORY[0x263EFFA08] set];
  }
  return v12;
}

- (NSArray)allMailboxesSyncEnabled
{
  v2 = [(NNMKMailboxSelection *)self allMailboxesSyncEnabledById];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (BOOL)hasSingleMailboxSelectionOnly
{
  id v3 = [(NNMKMailboxSelection *)self mailboxesWithAllMessagesSyncEnabled];
  if ([v3 count] == 1)
  {
    id v4 = [(NNMKMailboxSelection *)self aggregatedMailboxes];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasAggregateMailboxesForAllMessagesOnly
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(NNMKMailboxSelection *)self aggregatedMailboxes];
  if ((unint64_t)[v3 count] < 2)
  {
  }
  else
  {
    unint64_t aggregatedMailboxesFilterTypes = self->_aggregatedMailboxesFilterTypes;

    if (aggregatedMailboxesFilterTypes == 1)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      BOOL v5 = [(NNMKMailboxSelection *)self mailboxesWithAllMessagesSyncEnabled];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v23;
LABEL_5:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v22 + 1) + 8 * v9) type] != 1) {
            break;
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
            if (v7) {
              goto LABEL_5;
            }
            goto LABEL_23;
          }
        }
LABEL_26:
        BOOL v16 = 0;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
  }
  uint64_t v10 = [(NNMKMailboxSelection *)self aggregatedMailboxes];
  if ([v10 count] == 1)
  {
    unint64_t v11 = self->_aggregatedMailboxesFilterTypes;

    if (!v11)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      BOOL v5 = [(NNMKMailboxSelection *)self mailboxesWithAllMessagesSyncEnabled];
      uint64_t v12 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
LABEL_17:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v18 + 1) + 8 * v15) type] != 1) {
            goto LABEL_26;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              goto LABEL_17;
            }
            break;
          }
        }
      }
LABEL_23:
      BOOL v16 = 1;
LABEL_27:

      return v16;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)containsMailboxFilter:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 mailboxIds];
  if ([v5 count] == 1)
  {
    char v6 = [v4 isFilteredByType];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(NNMKMailboxSelection *)self mailboxesWithAllMessagesSyncEnabledIds];
      uint64_t v8 = [v4 mailboxIds];
      uint64_t v9 = [v8 firstObject];
      LOBYTE(v10) = [v7 containsObject:v9];

      goto LABEL_16;
    }
  }
  else
  {
  }
  int v10 = -[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", [v4 mailboxType]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v11 = objc_msgSend(v4, "mailboxIds", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v17 = [(NNMKMailboxSelection *)self aggregatedMailboxesId];
        v10 &= [v17 containsObject:v16];

        if (v10 != 1)
        {
          LOBYTE(v10) = 0;
          goto LABEL_15;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      int v10 = 1;
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_15:

LABEL_16:
  return v10;
}

+ (unint64_t)firstFilterTypeFromTypes:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t result = [&unk_26F131928 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    unint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(&unk_26F131928);
      }
      unint64_t result = [*(id *)(*((void *)&v8 + 1) + 8 * v7) unsignedIntegerValue];
      if ((result & a3) != 0) {
        break;
      }
      if (v5 == ++v7)
      {
        unint64_t result = [&unk_26F131928 countByEnumeratingWithState:&v8 objects:v12 count:16];
        unint64_t v5 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (NSMutableDictionary)allMailboxesSyncEnabledById
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  allMailboxesSyncEnabledById = self->_allMailboxesSyncEnabledById;
  if (allMailboxesSyncEnabledById) {
    goto LABEL_10;
  }
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = [(NNMKMailboxSelection *)self mailboxesWithAllMessagesSyncEnabled];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [v10 mailboxId];
        [(NSMutableDictionary *)v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v12 = self->_allMailboxesSyncEnabledById;
  self->_allMailboxesSyncEnabledById = v4;

  allMailboxesSyncEnabledById = self->_allMailboxesSyncEnabledById;
  if (allMailboxesSyncEnabledById)
  {
LABEL_10:
    uint64_t v13 = allMailboxesSyncEnabledById;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
  }
  return v13;
}

- (id)mailboxWithId:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NNMKMailboxSelection *)self allMailboxesSyncEnabledById];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)isMailboxFilterEnabled:(unint64_t)a3
{
  return (self->_aggregatedMailboxesFilterTypes & a3) != 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  unint64_t v5 = [(NNMKMailboxSelection *)self allMailboxesSyncEnabled];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v4 allMailboxesSyncEnabled];
  uint64_t v8 = [v7 count];

  if (v6 != v8) {
    goto LABEL_14;
  }
  unint64_t v9 = [(NNMKMailboxSelection *)self aggregatedMailboxesFilterTypes];
  if (v9 == [v4 aggregatedMailboxesFilterTypes])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v10 = [(NNMKMailboxSelection *)self allMailboxesSyncEnabled];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v16 = [v4 allMailboxesSyncEnabledById];
          long long v17 = [v15 mailboxId];
          long long v18 = [v16 objectForKeyedSubscript:v17];

          if (!v18 || (uint64_t v19 = [v18 filterType], v19 != objc_msgSend(v15, "filterType")))
          {

            BOOL v20 = 0;
            goto LABEL_18;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        BOOL v20 = 1;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v20 = 1;
    }
LABEL_18:
  }
  else
  {
LABEL_14:
    BOOL v20 = 0;
  }

  return v20;
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F089D8] stringWithString:@"Mailboxes: ["];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(NNMKMailboxSelection *)self mailboxesWithAllMessagesSyncEnabledIds];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@ ,", *(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"], "];
  [v3 appendString:@"Aggregated: ["];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v9 = [(NNMKMailboxSelection *)self aggregatedMailboxesId];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 appendFormat:@"%@ ,", *(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  [v3 appendString:@"], "];
  [v3 appendString:@"Filters: ["];
  if ([(NNMKMailboxSelection *)self isMailboxFilterEnabled:1]) {
    [v3 appendString:@"All, "];
  }
  if ([(NNMKMailboxSelection *)self isMailboxFilterEnabled:2]) {
    [v3 appendString:@"VIP, "];
  }
  if ([(NNMKMailboxSelection *)self isMailboxFilterEnabled:8]) {
    [v3 appendString:@"Unread, "];
  }
  if ([(NNMKMailboxSelection *)self isMailboxFilterEnabled:4]) {
    [v3 appendString:@"Flagged, "];
  }
  if ([(NNMKMailboxSelection *)self isMailboxFilterEnabled:16]) {
    [v3 appendString:@"ToOrCC, "];
  }
  if ([(NNMKMailboxSelection *)self isMailboxFilterEnabled:32]) {
    [v3 appendString:@"ImportThread, "];
  }
  if ([(NNMKMailboxSelection *)self isMailboxFilterEnabled:64]) {
    [v3 appendString:@"Today"];
  }
  [v3 appendString:@"]"];
  return v3;
}

+ (id)mailboxChangesApplyingSelection:(id)a3 previousSelection:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v25 = v6;
  unint64_t v9 = [v6 allMailboxesSyncEnabledById];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v26 = v5;
  uint64_t v10 = [v5 allMailboxesSyncEnabledById];
  uint64_t v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v17 = [v16 mailboxId];
        long long v18 = [v9 objectForKeyedSubscript:v17];

        if (!v18)
        {
          [v7 addObject:v16];
LABEL_12:
          [v8 addObject:v16];
          goto LABEL_13;
        }
        long long v19 = [v16 mailboxId];
        [v9 removeObjectForKey:v19];

        if (([v16 isEqual:v18] & 1) == 0)
        {
          [v7 addObject:v16];
          int v20 = [v18 hasFilterType:1];
          char v21 = [v16 hasFilterType:1];
          if (!v20 || (v21 & 1) == 0) {
            goto LABEL_12;
          }
        }
LABEL_13:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  long long v22 = objc_opt_new();
  [v22 setMailboxesToUpdate:v7];
  [v22 setMailboxesToReSync:v8];
  long long v23 = [v9 allValues];
  [v22 setMailboxesToDisableSync:v23];

  return v22;
}

- (NSArray)mailboxesWithAllMessagesSyncEnabled
{
  return self->_mailboxesWithAllMessagesSyncEnabled;
}

- (void)setMailboxesWithAllMessagesSyncEnabled:(id)a3
{
}

- (void)setMailboxesWithAllMessagesSyncEnabledIds:(id)a3
{
}

- (NSArray)aggregatedMailboxes
{
  return self->_aggregatedMailboxes;
}

- (void)setAggregatedMailboxes:(id)a3
{
}

- (void)setAggregatedMailboxesId:(id)a3
{
}

- (unint64_t)aggregatedMailboxesFilterTypes
{
  return self->_aggregatedMailboxesFilterTypes;
}

- (void)setAggregatedMailboxesFilterTypes:(unint64_t)a3
{
  self->_unint64_t aggregatedMailboxesFilterTypes = a3;
}

- (void)setAllMailboxesSyncEnabled:(id)a3
{
}

- (void)setAllMailboxesSyncEnabledById:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMailboxesSyncEnabledById, 0);
  objc_storeStrong((id *)&self->_allMailboxesSyncEnabled, 0);
  objc_storeStrong((id *)&self->_aggregatedMailboxesId, 0);
  objc_storeStrong((id *)&self->_aggregatedMailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxesWithAllMessagesSyncEnabledIds, 0);
  objc_storeStrong((id *)&self->_mailboxesWithAllMessagesSyncEnabled, 0);
}

@end