@interface PBFPosterDataStoreEventBuilder
+ (id)activeChargerIdentifierDidUpdate:(id)a3 from:(id)a4;
+ (id)descriptorsUpdatedForProvider:(id)a3 role:(id)a4 from:(id)a5 to:(id)a6;
+ (id)extensionsUpdatedFrom:(id)a3 to:(id)a4 supportedRoles:(id)a5;
+ (id)posterActivated:(id)a3 previous:(id)a4;
+ (id)posterAdded:(id)a3;
+ (id)posterDeleted:(id)a3;
+ (id)posterSelected:(id)a3 previous:(id)a4;
+ (id)posterUpdatedFrom:(id)a3 to:(id)a4;
+ (id)postersReorderedFrom:(id)a3 to:(id)a4;
+ (id)resetRole:(id)a3;
+ (id)staticDescriptorsUpdatedForProvider:(id)a3 role:(id)a4 from:(id)a5 to:(id)a6;
- (NSDictionary)userInfo;
- (NSString)eventType;
- (PBFPosterRoleCoordinatorChange)originatingRoleCoordinatorChange;
- (id)buildWithError:(id *)a3;
- (id)fromValue;
- (id)revertBlock;
- (id)toValue;
- (void)relatePoster:(id)a3;
- (void)relateProvider:(id)a3;
- (void)reset;
- (void)setEventType:(id)a3;
- (void)setFromValue:(id)a3;
- (void)setOriginatingRoleCoordinatorChange:(id)a3;
- (void)setRevertBlock:(id)a3;
- (void)setToValue:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)unrelatePoster:(id)a3;
- (void)unrelateProvider:(id)a3;
@end

@implementation PBFPosterDataStoreEventBuilder

+ (id)extensionsUpdatedFrom:(id)a3 to:(id)a4 supportedRoles:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 count];
  if (![v9 count])
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[supportedRoles count] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder extensionsUpdatedFrom:to:supportedRoles:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A0670);
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke;
  v39[3] = &unk_1E6980DF8;
  id v10 = v9;
  id v40 = v10;
  v11 = objc_msgSend(v7, "bs_filter:", v39);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke_2;
  v37[3] = &unk_1E6980DF8;
  id v12 = v10;
  id v38 = v12;
  v13 = objc_msgSend(v8, "bs_filter:", v37);
  v14 = objc_opt_new();
  [v14 setEventType:@"PBFPosterDataStoreEventTypeExtensionsUpdated"];
  [v14 setFromValue:v11];
  [v14 setToValue:v13];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v33 + 1) + 8 * i) posterExtensionBundleIdentifier];
        [v14 relateProvider:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v17);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v8;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v29 + 1) + 8 * j) posterExtensionBundleIdentifier];
        [v14 relateProvider:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v23);
  }

  return v14;
}

uint64_t __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 supportedRoles];
  uint64_t v4 = [v2 intersectsSet:v3];

  return v4;
}

uint64_t __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 supportedRoles];
  uint64_t v4 = [v2 intersectsSet:v3];

  return v4;
}

+ (id)descriptorsUpdatedForProvider:(id)a3 role:(id)a4 from:(id)a5 to:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (![v9 length])
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[provider length] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:role:from:to:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A0940);
  }
  uint64_t v24 = v10;
  v13 = objc_opt_new();
  [v13 setEventType:@"PBFPosterDataStoreEventTypeDescriptorsUpdated"];
  [v13 setFromValue:v11];
  [v13 setToValue:v12];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) _path];
        v20 = [v19 serverIdentity];
        id v21 = [v20 provider];
        [v13 relateProvider:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  [v13 relateProvider:v9];
  return v13;
}

+ (id)staticDescriptorsUpdatedForProvider:(id)a3 role:(id)a4 from:(id)a5 to:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (![v9 length])
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[provider length] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:role:from:to:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A0B80);
  }
  uint64_t v24 = v10;
  v13 = objc_opt_new();
  [v13 setEventType:@"PBFPosterDataStoreEventTypeStaticDescriptorsUpdated"];
  [v13 setFromValue:v11];
  [v13 setToValue:v12];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) _path];
        v20 = [v19 serverIdentity];
        id v21 = [v20 provider];
        [v13 relateProvider:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  [v13 relateProvider:v9];
  return v13;
}

+ (id)posterUpdatedFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 role];
  id v8 = [v6 role];
  char v9 = BSEqualObjects();

  if ((v9 & 1) == 0)
  {
    long long v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"BSEqualObjects([from role], [to role])"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:].cold.4();
    }
LABEL_19:
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A0E94);
  }
  id v10 = [v5 _path];
  char v11 = [v10 isServerPosterPath];

  if ((v11 & 1) == 0)
  {
    long long v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[from _path] isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A0EF8);
  }
  id v12 = [v6 _path];
  char v13 = [v12 isServerPosterPath];

  if ((v13 & 1) == 0)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[to _path] isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:]();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A0F5CLL);
  }
  id v14 = [v5 _path];
  uint64_t v15 = [v14 serverIdentity];
  uint64_t v16 = [v15 posterUUID];
  uint64_t v17 = [v6 _path];
  uint64_t v18 = [v17 serverIdentity];
  v19 = [v18 posterUUID];
  char v20 = BSEqualObjects();

  if ((v20 & 1) == 0)
  {
    long long v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"BSEqualObjects([[[from _path] serverIdentity] posterUUID], [[[to _path] serverIdentity] posterUUID])"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:]();
    }
    goto LABEL_19;
  }
  id v21 = objc_opt_new();
  [v21 setEventType:@"PBFPosterDataStoreEventTypePosterUpdated"];
  [v21 setFromValue:v5];
  [v21 setToValue:v6];
  uint64_t v22 = [v6 _path];
  uint64_t v23 = [v22 serverIdentity];
  uint64_t v24 = [v23 posterUUID];
  [v21 relatePoster:v24];

  long long v25 = [v6 _path];
  long long v26 = [v25 serverIdentity];
  long long v27 = [v26 provider];
  [v21 relateProvider:v27];

  long long v28 = [v5 _path];
  long long v29 = [v28 serverIdentity];
  uint64_t v30 = [v29 posterUUID];
  [v21 relatePoster:v30];

  long long v31 = [v5 _path];
  long long v32 = [v31 serverIdentity];
  long long v33 = [v32 provider];
  [v21 relateProvider:v33];

  return v21;
}

+ (id)posterSelected:(id)a3 previous:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 _path];
  char v8 = [v7 isServerPosterPath];

  if (v8)
  {
    char v9 = objc_opt_new();
    [v9 setEventType:@"PBFPosterDataStoreEventTypePosterSelected"];
    [v9 setFromValue:v6];
    [v9 setToValue:v5];
    id v10 = [v5 _path];
    char v11 = [v10 serverIdentity];
    id v12 = [v11 posterUUID];
    [v9 relatePoster:v12];

    char v13 = [v5 _path];
    id v14 = [v13 serverIdentity];
    uint64_t v15 = [v14 provider];
    [v9 relateProvider:v15];

    uint64_t v16 = [v6 _path];
    LODWORD(v14) = [v16 isServerPosterPath];

    if (v14)
    {
      uint64_t v17 = [v6 _path];
      uint64_t v18 = [v17 serverIdentity];
      v19 = [v18 posterUUID];
      [v9 relatePoster:v19];

      char v20 = [v6 _path];
      id v21 = [v20 serverIdentity];
      uint64_t v22 = [v21 provider];
      [v9 relateProvider:v22];
    }
    return v9;
  }
  else
  {
    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[to _path] isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterSelected:previous:]();
    }
    [v24 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)posterActivated:(id)a3 previous:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    char v8 = [v6 _path];
    char v9 = [v8 isServerPosterPath];

    if ((v9 & 1) == 0)
    {
      long long v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[from _path] isServerPosterPath]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PBFPosterDataStoreEventBuilder posterActivated:previous:]();
      }
LABEL_14:
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32A1450);
    }
  }
  id v10 = [v5 _path];
  char v11 = [v10 isServerPosterPath];

  if ((v11 & 1) == 0)
  {
    long long v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[to _path] isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterActivated:previous:]();
    }
    goto LABEL_14;
  }
  id v12 = objc_opt_new();
  [v12 setEventType:@"PBFPosterDataStoreEventTypePosterActivated"];
  [v12 setFromValue:v7];
  [v12 setToValue:v5];
  char v13 = [v5 _path];
  id v14 = [v13 serverIdentity];
  uint64_t v15 = [v14 posterUUID];
  [v12 relatePoster:v15];

  uint64_t v16 = [v5 _path];
  uint64_t v17 = [v16 serverIdentity];
  uint64_t v18 = [v17 provider];
  [v12 relateProvider:v18];

  if (v7)
  {
    v19 = [v7 _path];
    char v20 = [v19 serverIdentity];
    id v21 = [v20 posterUUID];
    [v12 relatePoster:v21];

    uint64_t v22 = [v7 _path];
    uint64_t v23 = [v22 serverIdentity];
    uint64_t v24 = [v23 provider];
    [v12 relateProvider:v24];
  }
  return v12;
}

+ (id)posterDeleted:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _path];
  char v5 = [v4 isServerPosterPath];

  if (v5)
  {
    id v6 = objc_opt_new();
    [v6 setEventType:@"PBFPosterDataStoreEventTypePosterDeleted"];
    [v6 setFromValue:v3];
    [v6 setToValue:0];
    id v7 = [v3 _path];
    char v8 = [v7 serverIdentity];
    char v9 = [v8 posterUUID];
    [v6 relatePoster:v9];

    id v10 = [v3 _path];
    char v11 = [v10 serverIdentity];
    id v12 = [v11 provider];
    [v6 relateProvider:v12];

    return v6;
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[poster _path] isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterDeleted:]();
    }
    [v14 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)posterAdded:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _path];
  char v5 = [v4 isServerPosterPath];

  if (v5)
  {
    id v6 = objc_opt_new();
    [v6 setEventType:@"PBFPosterDataStoreEventTypePosterAdded"];
    [v6 setFromValue:0];
    [v6 setToValue:v3];
    id v7 = [v3 _path];
    char v8 = [v7 serverIdentity];
    char v9 = [v8 posterUUID];
    [v6 relatePoster:v9];

    id v10 = [v3 _path];
    char v11 = [v10 serverIdentity];
    id v12 = [v11 provider];
    [v6 relateProvider:v12];

    return v6;
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[poster _path] isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder posterAdded:]();
    }
    [v14 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)postersReorderedFrom:(id)a3 to:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setEventType:@"PBFPosterDataStoreEventTypePostersReordered"];
  [v7 setFromValue:v5];
  [v7 setToValue:v6];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v14 = [v13 _path];
        uint64_t v15 = [v14 serverIdentity];
        uint64_t v16 = [v15 posterUUID];
        [v7 relatePoster:v16];

        uint64_t v17 = [v13 _path];
        uint64_t v18 = [v17 serverIdentity];
        v19 = [v18 provider];
        [v7 relateProvider:v19];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        long long v26 = objc_msgSend(v25, "_path", (void)v33);
        long long v27 = [v26 serverIdentity];
        long long v28 = [v27 posterUUID];
        [v7 relatePoster:v28];

        long long v29 = [v25 _path];
        uint64_t v30 = [v29 serverIdentity];
        long long v31 = [v30 provider];
        [v7 relateProvider:v31];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v22);
  }

  return v7;
}

+ (id)activeChargerIdentifierDidUpdate:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (BSEqualStrings())
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"BSEqualStrings(activeChargerIdentifier, previousChargerIdentifier) == NO"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterDataStoreEventBuilder activeChargerIdentifierDidUpdate:from:]();
    }
    [v9 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    id v7 = objc_opt_new();
    [v7 setEventType:@"PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"];
    [v7 setFromValue:v6];
    [v7 setToValue:v5];

    return v7;
  }
  return result;
}

+ (id)resetRole:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  [v4 setEventType:@"PBFPosterDataStoreEventTypeRoleCoordinatorReset"];
  [v4 setFromValue:v3];
  [v4 setToValue:v3];

  return v4;
}

- (void)setEventType:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  id v5 = @"PBFPosterDataStoreEventTypeUnknown";
  if (v4) {
    id v5 = v4;
  }
  eventType = self->_eventType;
  self->_eventType = &v5->isa;
}

- (void)relateProvider:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    relatedProviders = self->_relatedProviders;
    id v8 = v4;
    if (!relatedProviders)
    {
      id v6 = (NSMutableSet *)objc_opt_new();
      id v7 = self->_relatedProviders;
      self->_relatedProviders = v6;

      relatedProviders = self->_relatedProviders;
    }
    [(NSMutableSet *)relatedProviders addObject:v8];
    id v4 = v8;
  }
}

- (void)unrelateProvider:(id)a3
{
}

- (void)relatePoster:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    relatedPosters = self->_relatedPosters;
    id v8 = v4;
    if (!relatedPosters)
    {
      id v6 = (NSMutableSet *)objc_opt_new();
      id v7 = self->_relatedPosters;
      self->_relatedPosters = v6;

      relatedPosters = self->_relatedPosters;
    }
    [(NSMutableSet *)relatedPosters addObject:v8];
    id v4 = v8;
  }
}

- (void)unrelatePoster:(id)a3
{
}

- (void)reset
{
  relatedProviders = self->_relatedProviders;
  self->_relatedProviders = 0;

  relatedPosters = self->_relatedPosters;
  self->_relatedPosters = 0;

  id toValue = self->_toValue;
  self->_id toValue = 0;

  id fromValue = self->_fromValue;
  self->_id fromValue = 0;

  [(PBFPosterDataStoreEventBuilder *)self setEventType:0];
}

- (id)buildWithError:(id *)a3
{
  id v5 = [[PBFPosterDataStoreEvent alloc] initWithType:self->_eventType];
  [(PBFPosterDataStoreEvent *)v5 setRelatedProviders:self->_relatedProviders];
  [(PBFPosterDataStoreEvent *)v5 setRelatedPosters:self->_relatedPosters];
  [(PBFPosterDataStoreEvent *)v5 setUserInfo:self->_userInfo];
  [(PBFPosterDataStoreEvent *)v5 setToValue:self->_toValue];
  [(PBFPosterDataStoreEvent *)v5 setFromValue:self->_fromValue];
  if ([(PBFPosterDataStoreEvent *)v5 isValidWithError:a3]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (id)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
}

- (id)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
}

- (PBFPosterRoleCoordinatorChange)originatingRoleCoordinatorChange
{
  return self->_originatingRoleCoordinatorChange;
}

- (void)setOriginatingRoleCoordinatorChange:(id)a3
{
}

- (id)revertBlock
{
  return self->_revertBlock;
}

- (void)setRevertBlock:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong(&self->_revertBlock, 0);
  objc_storeStrong((id *)&self->_originatingRoleCoordinatorChange, 0);
  objc_storeStrong(&self->_toValue, 0);
  objc_storeStrong(&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_relatedRoles, 0);
  objc_storeStrong((id *)&self->_relatedPosters, 0);
  objc_storeStrong((id *)&self->_relatedProviders, 0);
}

+ (void)extensionsUpdatedFrom:to:supportedRoles:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)descriptorsUpdatedForProvider:role:from:to:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)staticDescriptorsUpdatedForProvider:role:from:to:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatedFrom:to:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatedFrom:to:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatedFrom:to:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatedFrom:to:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterSelected:previous:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterActivated:previous:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterActivated:previous:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterDeleted:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterAdded:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)activeChargerIdentifierDidUpdate:from:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end