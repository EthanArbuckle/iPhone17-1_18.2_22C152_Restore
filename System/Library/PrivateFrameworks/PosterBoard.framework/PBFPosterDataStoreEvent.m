@interface PBFPosterDataStoreEvent
- (BOOL)couldRevert;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)revert;
- (NSDictionary)userInfo;
- (NSSet)relatedPosters;
- (NSSet)relatedProviders;
- (NSString)eventType;
- (NSUUID)uniqueIdentifier;
- (PBFPosterDataStoreEvent)init;
- (PBFPosterDataStoreEvent)initWithType:(id)a3;
- (PBFPosterRoleCoordinatorChange)originatingRoleCoordinatorChange;
- (id)description;
- (id)fromValue;
- (id)revertBlock;
- (id)toValue;
- (unint64_t)hash;
- (void)dumpLongDescriptionWithPreamble:(id)a3 log:(id)a4 type:(unsigned __int8)a5;
- (void)setFromValue:(id)a3;
- (void)setOriginatingRoleCoordinatorChange:(id)a3;
- (void)setRelatedPosters:(id)a3;
- (void)setRelatedProviders:(id)a3;
- (void)setRevertBlock:(id)a3;
- (void)setToValue:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PBFPosterDataStoreEvent

- (PBFPosterDataStoreEvent)initWithType:(id)a3
{
  id v5 = a3;
  if (PBFPosterDataStoreEventTypeIsValid(v5))
  {
    v12.receiver = self;
    v12.super_class = (Class)PBFPosterDataStoreEvent;
    v6 = [(PBFPosterDataStoreEvent *)&v12 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_eventType, a3);
      uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
      uniqueIdentifier = v7->_uniqueIdentifier;
      v7->_uniqueIdentifier = (NSUUID *)v8;
    }
    return v7;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PBFPosterDataStoreEventTypeIsValid(type)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterDataStoreEvent initWithType:]();
    }
    [v11 UTF8String];
    result = (PBFPosterDataStoreEvent *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PBFPosterDataStoreEvent)init
{
  v4 = [NSString stringWithFormat:@"Unsupported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    objc_super v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"PBFPosterDataStoreEvent.m";
    __int16 v17 = 1024;
    int v18 = 85;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (PBFPosterDataStoreEvent *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unint64_t)hash
{
  unint64_t v2 = [(NSUUID *)self->_uniqueIdentifier hash];
  unint64_t v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) >> 27));
  return v3 ^ (v3 >> 31);
}

- (BOOL)isEqualToEvent:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  id v5 = [(PBFPosterDataStoreEvent *)self uniqueIdentifier];
  v6 = [v4 uniqueIdentifier];

  LOBYTE(v4) = BSEqualObjects();
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBFPosterDataStoreEvent *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && [(PBFPosterDataStoreEvent *)self isEqualToEvent:v4];
  }

  return v7;
}

- (BOOL)couldRevert
{
  unint64_t v2 = [(PBFPosterDataStoreEvent *)self revertBlock];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)revert
{
  BOOL v3 = [(PBFPosterDataStoreEvent *)self couldRevert];
  if (v3)
  {
    id v4 = [(PBFPosterDataStoreEvent *)self revertBlock];
    char v5 = v4[2]();

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (PBFPosterDataStoreEventTypeIsValid(self->_eventType))
  {
    __int16 v15 = @"eventDescription";
    uint64_t v5 = [(PBFPosterDataStoreEvent *)self description];
    v6 = (void *)v5;
    BOOL v7 = @"(null)";
    if (v5) {
      BOOL v7 = (__CFString *)v5;
    }
    v16 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    if ([(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypeDescriptorsUpdated"]|| [(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypeExtensionsUpdated"]|| [(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypePosterActivated"]|| [(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypePosterSelected"])
    {
      if (*(_OWORD *)&self->_fromValue == 0 || (BSEqualObjects() & 1) != 0) {
        goto LABEL_10;
      }
      goto LABEL_29;
    }
    if (![(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypePosterDeleted"])
    {
      if ([(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypePosterAdded"])
      {
        if (!self->_toValue) {
          goto LABEL_10;
        }
        goto LABEL_29;
      }
      if (![(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypePosterUpdated"])
      {
        if ([(NSString *)self->_eventType isEqualToString:@"PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"]&& BSEqualStrings())
        {
LABEL_10:
          int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PBFPosterDataStoreEventErrorDomain" code:-3453 userInfo:v8];
          id v10 = v9;
          BOOL v11 = v9 == 0;
          if (a3 && v9)
          {
            id v10 = v9;
            BOOL v11 = 0;
            *a3 = v10;
          }
          goto LABEL_30;
        }
LABEL_29:
        id v10 = 0;
        BOOL v11 = 1;
LABEL_30:

LABEL_31:
        return v11;
      }
      if (self->_toValue) {
        goto LABEL_29;
      }
    }
    if (!self->_fromValue) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
  if (a3)
  {
    objc_super v12 = (void *)MEMORY[0x1E4F28C58];
    eventType = @"(null event type)";
    if (self->_eventType) {
      eventType = (__CFString *)self->_eventType;
    }
    __int16 v17 = @"eventType";
    v18[0] = eventType;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [v12 errorWithDomain:@"PBFPosterDataStoreEventErrorDomain" code:-3454 userInfo:v10];
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  return 0;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_eventType withName:@"eventType"];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[PBFPosterDataStoreEvent couldRevert](self, "couldRevert"), @"couldRevert", 1);
  id v5 = (id)[v3 appendObject:self->_originatingRoleCoordinatorChange withName:@"_originatingRoleCoordinatorChange" skipIfNil:1];
  [v3 appendDictionarySection:self->_userInfo withName:@"userInfo" skipIfEmpty:1];
  if (self->_fromValue || self->_toValue)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __38__PBFPosterDataStoreEvent_description__block_invoke;
    __int16 v15 = &unk_1E69808E8;
    id v16 = v3;
    __int16 v17 = self;
    [v16 appendBodySectionWithName:@"changes" multilinePrefix:@"\n" block:&v12];
  }
  v6 = [(PBFPosterDataStoreEvent *)self relatedProviders];
  BOOL v7 = [v6 allObjects];
  [v3 appendArraySection:v7 withName:@"relatedProviders" skipIfEmpty:1];

  uint64_t v8 = [(PBFPosterDataStoreEvent *)self relatedPosters];
  int v9 = [v8 allObjects];
  [v3 appendArraySection:v9 withName:@"relatedPosters" skipIfEmpty:1];

  id v10 = [v3 build];

  return v10;
}

id __38__PBFPosterDataStoreEvent_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"fromValue" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"toValue" skipIfNil:1];
}

- (void)dumpLongDescriptionWithPreamble:(id)a3 log:(id)a4 type:(unsigned __int8)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = a4;
  if (os_log_type_enabled(v9, (os_log_type_t)a5))
  {
    eventType = self->_eventType;
    *(_DWORD *)buf = 138543618;
    id v68 = v8;
    __int16 v69 = 2114;
    id v70 = eventType;
    _os_log_impl(&dword_1D31CE000, v9, (os_log_type_t)a5, "[%{public}@]\tEventType: %{public}@", buf, 0x16u);
  }
  BOOL v11 = v9;
  if (os_log_type_enabled(v11, (os_log_type_t)a5))
  {
    BOOL v12 = [(PBFPosterDataStoreEvent *)self couldRevert];
    *(_DWORD *)buf = 138543618;
    id v68 = v8;
    __int16 v69 = 1024;
    LODWORD(v70) = v12;
    _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\tcouldRevert: %{BOOL}u", buf, 0x12u);
  }

  if (self->_originatingRoleCoordinatorChange && os_log_type_enabled(v11, (os_log_type_t)a5))
  {
    originatingRoleCoordinatorChange = self->_originatingRoleCoordinatorChange;
    *(_DWORD *)buf = 138543618;
    id v68 = v8;
    __int16 v69 = 2114;
    id v70 = originatingRoleCoordinatorChange;
    _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\toriginatingRoleCoordinatorChange: %{public}@", buf, 0x16u);
  }
  v47 = self;
  if (self->_fromValue)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      id fromValue = self->_fromValue;
      *(_DWORD *)buf = 138543618;
      id v68 = v8;
      __int16 v69 = 2114;
      id v70 = fromValue;
      _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\tfromValue: %{public}@", buf, 0x16u);
    }
    if ([self->_fromValue conformsToProtocol:&unk_1F2B03160])
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v15 = self->_fromValue;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        int v18 = 0;
        uint64_t v19 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v61 != v19) {
              objc_enumerationMutation(v15);
            }
            if (os_log_type_enabled(v11, (os_log_type_t)a5))
            {
              uint64_t v21 = *(void *)(*((void *)&v60 + 1) + 8 * i);
              *(_DWORD *)buf = 138543874;
              id v68 = v8;
              __int16 v69 = 2048;
              id v70 = v18;
              __int16 v71 = 2114;
              uint64_t v72 = v21;
              _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\tfromValue @ idx %lu: %{public}@", buf, 0x20u);
              ++v18;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v73 count:16];
        }
        while (v17);
      }

      self = v47;
    }
  }
  if (self->_toValue)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      id toValue = self->_toValue;
      *(_DWORD *)buf = 138543618;
      id v68 = v8;
      __int16 v69 = 2114;
      id v70 = toValue;
      _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\ttoValue: %{public}@", buf, 0x16u);
    }
    if ([self->_toValue conformsToProtocol:&unk_1F2B03160])
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v23 = self->_toValue;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        v26 = 0;
        uint64_t v27 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v57 != v27) {
              objc_enumerationMutation(v23);
            }
            if (os_log_type_enabled(v11, (os_log_type_t)a5))
            {
              uint64_t v29 = *(void *)(*((void *)&v56 + 1) + 8 * j);
              *(_DWORD *)buf = 138543874;
              id v68 = v8;
              __int16 v69 = 2048;
              id v70 = v26;
              __int16 v71 = 2114;
              uint64_t v72 = v29;
              _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\ttoValue @ idx %lu: %{public}@", buf, 0x20u);
              ++v26;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v25);
      }

      self = v47;
    }
  }
  v30 = [(PBFPosterDataStoreEvent *)self relatedPosters];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = v8;
      _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\trelatedPosters:", buf, 0xCu);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v32 = [(PBFPosterDataStoreEvent *)self relatedPosters];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(v32);
          }
          if (os_log_type_enabled(v11, (os_log_type_t)a5))
          {
            v37 = *(void **)(*((void *)&v52 + 1) + 8 * k);
            *(_DWORD *)buf = 138543618;
            id v68 = v8;
            __int16 v69 = 2114;
            id v70 = v37;
            _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\t\t %{public}@", buf, 0x16u);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v65 count:16];
      }
      while (v34);
    }

    self = v47;
  }
  v38 = [(PBFPosterDataStoreEvent *)self relatedProviders];
  uint64_t v39 = [v38 count];

  if (v39)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = v8;
      _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\trelatedProviders:", buf, 0xCu);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v40 = [(PBFPosterDataStoreEvent *)self relatedProviders];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v49;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v49 != v43) {
            objc_enumerationMutation(v40);
          }
          if (os_log_type_enabled(v11, (os_log_type_t)a5))
          {
            v45 = *(void **)(*((void *)&v48 + 1) + 8 * m);
            *(_DWORD *)buf = 138543618;
            id v68 = v8;
            __int16 v69 = 2114;
            id v70 = v45;
            _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\t\t %{public}@", buf, 0x16u);
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
      }
      while (v42);
    }

    self = v47;
  }
  if (self->_userInfo && os_log_type_enabled(v11, (os_log_type_t)a5))
  {
    userInfo = self->_userInfo;
    *(_DWORD *)buf = 138543618;
    id v68 = v8;
    __int16 v69 = 2114;
    id v70 = userInfo;
    _os_log_impl(&dword_1D31CE000, v11, (os_log_type_t)a5, "[%{public}@]\t\tuserInfo: %{public}@", buf, 0x16u);
  }
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
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

- (NSSet)relatedProviders
{
  return self->_relatedProviders;
}

- (void)setRelatedProviders:(id)a3
{
}

- (NSSet)relatedPosters
{
  return self->_relatedPosters;
}

- (void)setRelatedPosters:(id)a3
{
}

- (PBFPosterRoleCoordinatorChange)originatingRoleCoordinatorChange
{
  return self->_originatingRoleCoordinatorChange;
}

- (void)setOriginatingRoleCoordinatorChange:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (id)revertBlock
{
  return self->_revertBlock;
}

- (void)setRevertBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_revertBlock, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_originatingRoleCoordinatorChange, 0);
  objc_storeStrong((id *)&self->_relatedPosters, 0);
  objc_storeStrong((id *)&self->_relatedProviders, 0);
  objc_storeStrong(&self->_toValue, 0);
  objc_storeStrong(&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

- (void)initWithType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end