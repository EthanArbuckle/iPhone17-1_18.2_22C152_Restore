@interface ICExpansionState
+ (ICExpansionState)sharedExpansionState;
- (BOOL)isSectionIdentiferExpanded:(id)a3 inContext:(id)a4;
- (ICExpansionState)init;
- (NSDictionary)archiveDictionary;
- (NSManagedObjectContext)legacyViewContext;
- (NSManagedObjectContext)modernViewContext;
- (NSMutableDictionary)expansionState;
- (id)archivableIdentifierForItemIdentifier:(id)a3;
- (id)collapsedItemIdentifiersWithItemType:(int64_t)a3 context:(id)a4;
- (id)collapsedObjectIDsInContext:(id)a3;
- (id)description;
- (id)expandedItemIdentifiersWithItemType:(int64_t)a3 context:(id)a4;
- (id)expandedObjectIDsInContext:(id)a3;
- (id)identifierForArchivableIdentifier:(id)a3 itemType:(int64_t)a4;
- (id)itemIdentifiersExpanded:(BOOL)a3 itemType:(int64_t)a4 context:(id)a5;
- (id)normalizedContext:(id)a3;
- (id)normalizedItemIdentifier:(id)a3;
- (int64_t)itemTypeForItemIdentifier:(id)a3;
- (void)applyArchiveDictionary:(id)a3;
- (void)collapseItemIdentifier:(id)a3 context:(id)a4;
- (void)collapseItemIdentifier:(id)a3 itemType:(int64_t)a4 context:(id)a5;
- (void)collapseItemIdentifiers:(id)a3 itemType:(int64_t)a4 context:(id)a5;
- (void)expandItemIdentifier:(id)a3 context:(id)a4;
- (void)expandItemIdentifier:(id)a3 itemType:(int64_t)a4 context:(id)a5;
- (void)expandItemIdentifiers:(id)a3 itemType:(int64_t)a4 context:(id)a5;
- (void)setExpanded:(BOOL)a3 itemIdentifier:(id)a4 itemType:(int64_t)a5 context:(id)a6;
- (void)setExpansionState:(id)a3;
- (void)setLegacyViewContext:(id)a3;
- (void)setModernViewContext:(id)a3;
@end

@implementation ICExpansionState

+ (ICExpansionState)sharedExpansionState
{
  if (sharedExpansionState_onceToken != -1) {
    dispatch_once(&sharedExpansionState_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedExpansionState_instance;
  return (ICExpansionState *)v2;
}

- (id)expandedObjectIDsInContext:(id)a3
{
  v3 = [(ICExpansionState *)self expandedItemIdentifiersWithItemType:0 context:a3];
  v4 = objc_msgSend(v3, "ic_objectsOfClass:", objc_opt_class());

  return v4;
}

- (id)expandedItemIdentifiersWithItemType:(int64_t)a3 context:(id)a4
{
  return [(ICExpansionState *)self itemIdentifiersExpanded:1 itemType:a3 context:a4];
}

- (BOOL)isSectionIdentiferExpanded:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  v7 = [(ICExpansionState *)self normalizedContext:a4];
  v8 = [(ICExpansionState *)self expansionState];
  v9 = [v8 objectForKeyedSubscript:v7];
  v10 = [v9 objectForKeyedSubscript:@"ICExpansionStateItemTypeSectionIdentifier"];

  v11 = [v6 expansionStateContext];

  v12 = [v10 objectForKeyedSubscript:v11];

  if (v12) {
    char v13 = [v12 BOOLValue];
  }
  else {
    char v13 = 1;
  }

  return v13;
}

- (id)itemIdentifiersExpanded:(BOOL)a3 itemType:(int64_t)a4 context:(id)a5
{
  int v6 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(ICExpansionState *)self normalizedContext:a5];
  v9 = [(ICExpansionState *)self expansionState];
  v25 = (void *)v8;
  v10 = [v9 objectForKeyedSubscript:v8];
  v11 = v10;
  if ((unint64_t)a4 > 2) {
    v12 = @"ICExpansionStateItemTypeUnknown";
  }
  else {
    v12 = off_1E5FDA068[a4];
  }
  char v13 = [v10 objectForKeyedSubscript:v12];

  v14 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v15 = [v13 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v21 = [v13 objectForKeyedSubscript:v20];
        int v22 = [v21 BOOLValue];

        if (v22 == v6) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  v23 = (void *)[v14 copy];
  return v23;
}

- (id)normalizedContext:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return @"ICExpansionStateGlobalContext";
  }
}

- (NSMutableDictionary)expansionState
{
  return self->_expansionState;
}

uint64_t __40__ICExpansionState_sharedExpansionState__block_invoke()
{
  sharedExpansionState_instance = objc_alloc_init(ICExpansionState);
  return MEMORY[0x1F41817F8]();
}

- (ICExpansionState)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICExpansionState;
  v2 = [(ICExpansionState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    expansionState = v2->_expansionState;
    v2->_expansionState = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)applyArchiveDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v21 = a3;
  id obj = [v21 allKeys];
  uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v4;
        uint64_t v5 = *(void *)(*((void *)&v37 + 1) + 8 * v4);
        objc_super v6 = [v21 objectForKeyedSubscript:v5];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v26 = v6;
        id v24 = [v6 allKeys];
        uint64_t v27 = [v24 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v27)
        {
          uint64_t v25 = *(void *)v34;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v24);
              }
              uint64_t v28 = v7;
              uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
              v9 = [v26 objectForKeyedSubscript:v8];
              uint64_t v10 = ICExpansionStateItemTypeFromString(v8);
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              v11 = [v9 allKeys];
              uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v30;
                do
                {
                  for (uint64_t i = 0; i != v13; ++i)
                  {
                    if (*(void *)v30 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                    uint64_t v17 = [(ICExpansionState *)self identifierForArchivableIdentifier:v16 itemType:v10];
                    uint64_t v18 = [v9 objectForKeyedSubscript:v16];
                    -[ICExpansionState setExpanded:itemIdentifier:itemType:context:](self, "setExpanded:itemIdentifier:itemType:context:", [v18 BOOLValue], v17, v10, v5);
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
                }
                while (v13);
              }

              uint64_t v7 = v28 + 1;
            }
            while (v28 + 1 != v27);
            uint64_t v27 = [v24 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v27);
        }

        uint64_t v4 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v22);
  }
}

- (NSDictionary)archiveDictionary
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v26 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v3 = [(ICExpansionState *)self expansionState];
  uint64_t v4 = [v3 allKeys];

  id obj = v4;
  uint64_t v27 = [v4 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v45;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v5;
        uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8 * v5);
        uint64_t v7 = [(ICExpansionState *)self expansionState];
        uint64_t v28 = v6;
        uint64_t v8 = [v7 objectForKeyedSubscript:v6];

        long long v32 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v33 = v8;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v30 = [v8 allKeys];
        uint64_t v34 = [v30 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v34)
        {
          uint64_t v31 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v41 != v31) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              uint64_t v10 = objc_msgSend(v33, "objectForKeyedSubscript:");
              v11 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              uint64_t v12 = [v10 allKeys];
              uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v48 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v37;
                do
                {
                  for (uint64_t j = 0; j != v14; ++j)
                  {
                    if (*(void *)v37 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * j);
                    uint64_t v18 = [(ICExpansionState *)self archivableIdentifierForItemIdentifier:v17];
                    v19 = [v10 objectForKeyedSubscript:v17];
                    [v11 setObject:v19 forKeyedSubscript:v18];
                  }
                  uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v48 count:16];
                }
                while (v14);
              }

              uint64_t v20 = (void *)[v11 copy];
              [v32 setObject:v20 forKeyedSubscript:v35];
            }
            uint64_t v34 = [v30 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v34);
        }

        id v21 = (void *)[v32 copy];
        [v26 setObject:v21 forKeyedSubscript:v28];

        uint64_t v5 = v29 + 1;
      }
      while (v29 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v27);
  }

  uint64_t v22 = (void *)[v26 copy];
  return (NSDictionary *)v22;
}

- (id)collapsedObjectIDsInContext:(id)a3
{
  uint64_t v3 = [(ICExpansionState *)self collapsedItemIdentifiersWithItemType:0 context:a3];
  uint64_t v4 = objc_msgSend(v3, "ic_objectsOfClass:", objc_opt_class());

  return v4;
}

- (id)collapsedItemIdentifiersWithItemType:(int64_t)a3 context:(id)a4
{
  return [(ICExpansionState *)self itemIdentifiersExpanded:0 itemType:a3 context:a4];
}

- (void)expandItemIdentifier:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
}

- (void)expandItemIdentifier:(id)a3 context:(id)a4
{
}

- (void)expandItemIdentifiers:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v8);
        }
        [(ICExpansionState *)self expandItemIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * v13++) itemType:a4 context:v9];
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)collapseItemIdentifier:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
}

- (void)collapseItemIdentifier:(id)a3 context:(id)a4
{
}

- (void)collapseItemIdentifiers:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v8);
        }
        [(ICExpansionState *)self collapseItemIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * v13++) itemType:a4 context:v9];
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ICExpansionState *)self archiveDictionary];
  uint64_t v7 = [v3 stringWithFormat:@"%@[%@]", v5, v6];

  return v7;
}

- (void)setExpanded:(BOOL)a3 itemIdentifier:(id)a4 itemType:(int64_t)a5 context:(id)a6
{
  BOOL v8 = a3;
  id v20 = a4;
  uint64_t v10 = [(ICExpansionState *)self normalizedContext:a6];
  uint64_t v11 = [(ICExpansionState *)self expansionState];
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];

  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v13 = [(ICExpansionState *)self expansionState];
    [v13 setObject:v12 forKeyedSubscript:v10];
  }
  if (a5 == -1) {
    a5 = [(ICExpansionState *)self itemTypeForItemIdentifier:v20];
  }
  uint64_t v14 = [(ICExpansionState *)self normalizedItemIdentifier:v20];
  long long v15 = (void *)v14;
  if (a5 != -1 && v14)
  {
    if ((unint64_t)a5 > 2) {
      long long v16 = @"ICExpansionStateItemTypeUnknown";
    }
    else {
      long long v16 = off_1E5FDA068[a5];
    }
    long long v17 = [v12 objectForKeyedSubscript:v16];
    if (!v17)
    {
      long long v17 = [MEMORY[0x1E4F1CA60] dictionary];
      if ((unint64_t)a5 > 2) {
        uint64_t v18 = @"ICExpansionStateItemTypeUnknown";
      }
      else {
        uint64_t v18 = off_1E5FDA068[a5];
      }
      [v12 setObject:v17 forKeyedSubscript:v18];
    }
    uint64_t v19 = [NSNumber numberWithBool:v8];
    [v17 setObject:v19 forKeyedSubscript:v15];
  }
}

- (int64_t)itemTypeForItemIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F09C3948])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)normalizedItemIdentifier:(id)a3
{
  id v3 = a3;
  int64_t v4 = v3;
  if ([v3 conformsToProtocol:&unk_1F09C3948])
  {
    int64_t v4 = [v3 expansionStateContext];
  }
  return v4;
}

- (id)archivableIdentifierForItemIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = [v3 URIRepresentation];
    uint64_t v5 = [v4 absoluteString];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v3;
    }
    else
    {
      id v6 = [NSString stringWithFormat:@"%@", v3];
    }
    uint64_t v5 = v6;
  }

  return v5;
}

- (id)identifierForArchivableIdentifier:(id)a3 itemType:(int64_t)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F83428] sharedContext];
  uint64_t v7 = [v6 persistentStoreCoordinator];

  BOOL v8 = [MEMORY[0x1E4F82D78] persistentStoreCoordinator];
  if (a4)
  {
    id v9 = v5;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    if (v10)
    {
      uint64_t v11 = objc_msgSend(v7, "ic_managedObjectIDForURIRepresentation:", v10);
      uint64_t v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        objc_msgSend(v8, "ic_managedObjectIDForURIRepresentation:", v10);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v9 = v13;
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

- (void)setExpansionState:(id)a3
{
}

- (NSManagedObjectContext)modernViewContext
{
  return self->_modernViewContext;
}

- (void)setModernViewContext:(id)a3
{
}

- (NSManagedObjectContext)legacyViewContext
{
  return self->_legacyViewContext;
}

- (void)setLegacyViewContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
  objc_storeStrong((id *)&self->_expansionState, 0);
}

@end