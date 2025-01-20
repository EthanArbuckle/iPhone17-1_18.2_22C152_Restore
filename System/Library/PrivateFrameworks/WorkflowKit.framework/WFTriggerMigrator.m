@interface WFTriggerMigrator
+ (id)migrateTriggerUponUnarchival:(id)a3;
+ (id)migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:(id)a3;
+ (id)migratedUserFocusActivityTriggerFromLegacyDNDTrigger:(id)a3;
- (id)unarchiver:(id)a3 didDecodeObject:(id)a4;
@end

@implementation WFTriggerMigrator

+ (id)migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "+[WFTriggerMigrator migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:]";
    __int16 v30 = 2112;
    id v31 = v3;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s [Migration] Migrating from unique identifier to semantic identifier on WFUserFocusActivityTrigger (%@)", buf, 0x16u);
  }

  v5 = [v3 activitySemanticIdentifier];

  if (v5)
  {
    v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[WFTriggerMigrator migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:]";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s [Migration] Trigger already has a semantic identifier, moving on", buf, 0xCu);
    }

    id v7 = v3;
  }
  else
  {
    v8 = [v3 activityUniqueIdentifier];
    +[WFFocusModesManager availableModes];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "activityUniqueIdentifier", (void)v23);
          v16 = [v15 UUIDString];
          int v17 = [v16 isEqualToString:v8];

          if (v17)
          {
            v20 = [v14 activityIdentifier];
            [v3 setActivitySemanticIdentifier:v20];

            id v21 = v3;
            goto LABEL_19;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v18 = getWFTriggersLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[WFTriggerMigrator migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:]";
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s [Migration] Unable to find a focus that matches the trigger. Returning the original trigger without a semantic identifier.", buf, 0xCu);
    }

    id v19 = v3;
LABEL_19:
  }
  return v3;
}

+ (id)migratedUserFocusActivityTriggerFromLegacyDNDTrigger:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[WFTriggerMigrator migratedUserFocusActivityTriggerFromLegacyDNDTrigger:]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s [Migration] Migrating from pre-Sky WFDNDTrigger to WFUserFocusActivityTrigger", buf, 0xCu);
  }

  +[WFFocusModesManager availableModes];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "activityIdentifier", (void)v16);
        char v12 = [v11 isEqualToString:@"com.apple.donotdisturb.mode.default"];

        if (v12)
        {
          v14 = [[WFUserFocusActivityTrigger alloc] initWithActivity:v10];
          -[WFUserFocusActivityTrigger setOnEnable:](v14, "setOnEnable:", [v3 onEnable]);
          -[WFUserFocusActivityTrigger setOnDisable:](v14, "setOnDisable:", [v3 onDisable]);

          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v13 = getWFTriggersLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[WFTriggerMigrator migratedUserFocusActivityTriggerFromLegacyDNDTrigger:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s [Migration] Unable to find Do Not Disturb focus so unable to migrate to a WFUserFocusActivityTrigger. Returning the original WFDNDTrigger.", buf, 0xCu);
  }

  v14 = (WFUserFocusActivityTrigger *)v3;
LABEL_15:

  return v14;
}

+ (id)migrateTriggerUponUnarchival:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 migratedUserFocusActivityTriggerFromLegacyDNDTrigger:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a1 migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:v4];
    }
    else
    {
      id v5 = v4;
    }
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  id v5 = [(id)objc_opt_class() migrateTriggerUponUnarchival:a4];

  return v5;
}

@end