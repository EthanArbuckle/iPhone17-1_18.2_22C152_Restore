@interface STBlueprintBackedDowntimeOverrideModifier
- (BOOL)_saveWithError:(id *)a3;
- (BOOL)applyDowntimeOverride:(id)a3 error:(id *)a4;
- (BOOL)removeDowntimeOverrideWithError:(id *)a3;
- (STBlueprint)downtimeBlueprint;
- (STBlueprintBackedDowntimeOverrideModifier)initWithDowntimeBlueprint:(id)a3;
- (STDowntimeOverride)activeOverride;
- (void)_deleteOrphanedOrTombstonedDowntimeOverridesInContext:(id)a3;
- (void)_tombstoneDowntimeOverride;
@end

@implementation STBlueprintBackedDowntimeOverrideModifier

- (STBlueprintBackedDowntimeOverrideModifier)initWithDowntimeBlueprint:(id)a3
{
  v4 = (STBlueprint *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STBlueprintBackedDowntimeOverrideModifier;
  v5 = [(STBlueprintBackedDowntimeOverrideModifier *)&v8 init];
  downtimeBlueprint = v5->_downtimeBlueprint;
  v5->_downtimeBlueprint = v4;

  return v5;
}

- (STDowntimeOverride)activeOverride
{
  v2 = [(STBlueprintBackedDowntimeOverrideModifier *)self downtimeBlueprint];
  v3 = [v2 activeOverride];

  return (STDowntimeOverride *)v3;
}

- (BOOL)applyDowntimeOverride:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(STBlueprintBackedDowntimeOverrideModifier *)self downtimeBlueprint];
  objc_super v8 = [v7 managedObjectContext];
  v9 = [v7 override];
  v10 = +[STDowntimeOverrideTransformer coreOverrideFromDowntimeOverride:v6 existingDowntimeOverride:v9 inContext:v8];

  [v7 setOverride:v10];
  [v7 setIsDirty:1];
  [(STBlueprintBackedDowntimeOverrideModifier *)self _deleteOrphanedOrTombstonedDowntimeOverridesInContext:v8];
  id v21 = 0;
  BOOL v11 = [(STBlueprintBackedDowntimeOverrideModifier *)self _saveWithError:&v21];
  id v12 = v21;
  if (v11)
  {
    v13 = +[STLog blueprint];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_1DA519000, v13, OS_LOG_TYPE_DEFAULT, "Saved downtime override: %@", buf, 0xCu);
    }
  }
  else
  {
    v13 = +[STLog persistence];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[STBlueprintBackedDowntimeOverrideModifier applyDowntimeOverride:error:]((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  if (a4) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)removeDowntimeOverrideWithError:(id *)a3
{
  [(STBlueprintBackedDowntimeOverrideModifier *)self _tombstoneDowntimeOverride];
  BOOL v5 = [(STBlueprintBackedDowntimeOverrideModifier *)self _saveWithError:a3];
  if (v5)
  {
    id v6 = +[STLog blueprint];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1DA519000, v6, OS_LOG_TYPE_DEFAULT, "Removed downtime override", v15, 2u);
    }
  }
  else
  {
    id v6 = +[STLog persistence];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STBlueprintBackedDowntimeOverrideModifier removeDowntimeOverrideWithError:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return v5;
}

- (BOOL)_saveWithError:(id *)a3
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  id v6 = [(STBlueprintBackedDowntimeOverrideModifier *)self downtimeBlueprint];
  uint64_t v7 = [v6 managedObjectContext];

  if ([v7 hasChanges])
  {
    id v10 = 0;
    char v5 = [v7 save:&v10];
    id v8 = v10;
    if (a3)
    {
      id v8 = v8;
      *a3 = v8;
    }
  }
  else
  {
    id v8 = 0;
    char v5 = 1;
  }

  return v5;
}

- (void)_deleteOrphanedOrTombstonedDowntimeOverridesInContext:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[STCoreDowntimeOverride fetchRequest];
  char v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil OR %K == YES", @"downtime", @"isTombstoned");
  [v4 setPredicate:v5];

  id v25 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v25];
  id v7 = v25;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          [v3 deleteObject:*(void *)(*((void *)&v21 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v10);
    }

    uint64_t v13 = +[STLog blueprint];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl(&dword_1DA519000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %@ orphaned/tombstoned downtime overrides", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v13 = +[STLog blueprint];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[STBlueprintBackedDowntimeOverrideModifier _deleteOrphanedOrTombstonedDowntimeOverridesInContext:]((uint64_t)v7, v13, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)_tombstoneDowntimeOverride
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(STBlueprintBackedDowntimeOverrideModifier *)self downtimeBlueprint];
  id v3 = [v2 override];
  v4 = v3;
  if (v3)
  {
    [v3 setIsTombstoned:1];
    [v2 setIsDirty:1];
    char v5 = +[STLog blueprint];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v4;
      id v6 = "Tombstoning existing downtime override: %@";
      id v7 = v5;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1DA519000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else
  {
    char v5 = +[STLog blueprint];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      id v6 = "No existing downtime override - nothing to do";
      id v7 = v5;
      uint32_t v8 = 2;
      goto LABEL_6;
    }
  }
}

- (STBlueprint)downtimeBlueprint
{
  return (STBlueprint *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)applyDowntimeOverride:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeDowntimeOverrideWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_deleteOrphanedOrTombstonedDowntimeOverridesInContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end