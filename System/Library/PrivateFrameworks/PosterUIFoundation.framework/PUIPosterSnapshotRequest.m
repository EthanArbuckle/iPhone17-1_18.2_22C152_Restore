@interface PUIPosterSnapshotRequest
+ (BOOL)supportsSecureCoding;
- (FBSSceneSettings)settings;
- (NSArray)attachments;
- (NSArray)snapshotLevelSets;
- (NSDate)date;
- (NSString)provider;
- (NSString)snapshotCacheIdentifier;
- (NSUUID)uniqueIdentifier;
- (PFPosterPath)path;
- (PUIPosterSnapshotLegibilityProcessingRequest)legibilityProcessingRequest;
- (PUIPosterSnapshotRequest)initWithCoder:(id)a3;
- (PUIPosterSnapshotRequest)initWithPath:(id)a3 snapshotCacheIdentifier:(id)a4 settings:(id)a5 output:(unint64_t)a6 priority:(int64_t)a7 snapshotLevelSets:(id)a8 snapshotLegibilityProcessingRequest:(id)a9 attachments:(id)a10 timeout:(double)a11;
- (double)timeoutInterval;
- (int64_t)priority;
- (unint64_t)hash;
- (unint64_t)output;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIPosterSnapshotRequest

- (PUIPosterSnapshotRequest)initWithPath:(id)a3 snapshotCacheIdentifier:(id)a4 settings:(id)a5 output:(unint64_t)a6 priority:(int64_t)a7 snapshotLevelSets:(id)a8 snapshotLegibilityProcessingRequest:(id)a9 attachments:(id)a10 timeout:(double)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v17)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:]();
    }
LABEL_20:
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D5E88);
  }
  if (!v19)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settings"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:]();
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D5EECLL);
  }
  if (!v18)
  {
    v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"snapshotCacheIdentifier"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:]();
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D5F50);
  }
  v23 = v22;
  id v24 = v20;
  if (v24)
  {
    NSClassFromString(&cfstr_Nsarray.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:].cold.4();
      }
      goto LABEL_20;
    }
  }

  v47.receiver = self;
  v47.super_class = (Class)PUIPosterSnapshotRequest;
  v25 = [(PUIPosterSnapshotRequest *)&v47 init];
  if (v25)
  {
    uint64_t v26 = [MEMORY[0x263EFF910] date];
    date = v25->_date;
    v25->_date = (NSDate *)v26;

    objc_storeStrong((id *)&v25->_path, a3);
    uint64_t v28 = [v18 copy];
    snapshotCacheIdentifier = v25->_snapshotCacheIdentifier;
    v25->_snapshotCacheIdentifier = (NSString *)v28;

    v30 = [v17 serverIdentity];
    uint64_t v31 = [v30 provider];
    provider = v25->_provider;
    v25->_provider = (NSString *)v31;

    objc_storeStrong((id *)&v25->_settings, a5);
    v25->_priority = a7;
    v25->_output = a6;
    uint64_t v33 = [v24 copy];
    snapshotLevelSets = v25->_snapshotLevelSets;
    v25->_snapshotLevelSets = (NSArray *)v33;

    v25->_timeoutInterval = a11;
    uint64_t v35 = [v21 copy];
    legibilityProcessingRequest = v25->_legibilityProcessingRequest;
    v25->_legibilityProcessingRequest = (PUIPosterSnapshotLegibilityProcessingRequest *)v35;

    uint64_t v37 = [v23 copy];
    attachments = v25->_attachments;
    v25->_attachments = (NSArray *)v37;

    uint64_t v39 = [MEMORY[0x263F08C38] UUID];
    uniqueIdentifier = v25->_uniqueIdentifier;
    v25->_uniqueIdentifier = (NSUUID *)v39;
  }
  return v25;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uniqueIdentifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIPosterSnapshotRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = self;
  uint64_t v5 = [v3 decodeObjectOfClass:v4 forKey:@"path"];

  v6 = self;
  v7 = [v3 decodeObjectOfClass:v6 forKey:@"serverPosterPath"];

  uint64_t v53 = [v3 decodeIntegerForKey:@"priority"];
  uint64_t v54 = [v3 decodeIntegerForKey:@"output"];
  v8 = self;
  v52 = [v3 decodeObjectOfClass:v8 forKey:@"legibilityProcessingRequest"];

  v9 = (void *)MEMORY[0x263EFFA08];
  v10 = self;
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v57 = [v3 decodeObjectOfClasses:v11 forKey:@"_attachments"];

  [v3 decodeDoubleForKey:@"timeoutInterval"];
  double v13 = v12;
  v14 = (void *)MEMORY[0x263EFFA08];
  v15 = self;
  v16 = self;
  id v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, 0);
  id v18 = [v3 decodeObjectOfClasses:v17 forKey:@"snapshotLevelSets"];

  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_snapshotCacheIdentifier"];
  id v20 = self;
  id v21 = [v3 decodeObjectOfClass:v20 forKey:@"sceneSettingsOtherSettings"];

  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sceneSettingsFrame"];
  [v22 CGRectValue];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  uint64_t v31 = [v3 decodeIntegerForKey:@"sceneSettingsInterfaceOrientation"];
  v32 = self;
  uint64_t v33 = [v3 decodeObjectOfClass:v32 forKey:@"sceneSettingsDisplayConfigurationIdentifier"];

  v34 = objc_msgSend(MEMORY[0x263F3F6F0], "pui_displayConfigurationForHardwareIdentifier:", v33);
  uint64_t v35 = [MEMORY[0x263F3F770] settings];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke;
  v60[3] = &unk_2654713D8;
  id v36 = v35;
  id v61 = v36;
  [v21 enumerateObjectsWithBlock:v60];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke_2;
  v58[3] = &unk_265471400;
  id v37 = v36;
  id v59 = v37;
  [v21 enumerateFlagsWithBlock:v58];
  [v37 setDisplayConfiguration:v34];
  objc_msgSend(v37, "setFrame:", v24, v26, v28, v30);
  [v37 setInterfaceOrientation:v31];
  v56 = (void *)v5;
  if (v7) {
    v38 = v7;
  }
  else {
    v38 = (void *)v5;
  }
  uint64_t v39 = (void *)v19;
  v40 = [(PUIPosterSnapshotRequest *)self initWithPath:v38 snapshotCacheIdentifier:v19 settings:v37 output:v54 priority:v53 snapshotLevelSets:v18 snapshotLegibilityProcessingRequest:v13 attachments:v52 timeout:v57];
  if (v40)
  {
    self;
    v42 = v41 = v18;
    uint64_t v43 = [v3 decodeObjectOfClass:v42 forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v40->_uniqueIdentifier;
    v40->_uniqueIdentifier = (NSUUID *)v43;

    v45 = self;
    uint64_t v46 = [v3 decodeObjectOfClass:v45 forKey:@"date"];
    date = v40->_date;
    v40->_date = (NSDate *)v46;

    v48 = self;
    uint64_t v49 = [v3 decodeObjectOfClass:v48 forKey:@"provider"];
    provider = v40->_provider;
    v40->_provider = (NSString *)v49;

    id v18 = v41;
  }

  return v40;
}

void __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 otherSettings];
  [v6 setObject:v5 forSetting:a2];
}

void __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) otherSettings];
  [v5 setFlag:a3 forSetting:a2];
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v14 = a3;
  id v5 = [(PFPosterPath *)path extendContentsReadAccessToAuditToken:0 error:0];
  id v6 = v5;
  if (!v5) {
    id v6 = self->_path;
  }
  v7 = v6;

  if ([(PFPosterPath *)self->_path isServerPosterPath]) {
    v8 = @"serverPosterPath";
  }
  else {
    v8 = @"path";
  }
  [v14 encodeObject:v7 forKey:v8];
  v9 = [(FBSSceneSettings *)self->_settings otherSettings];
  [v14 encodeObject:v9 forKey:@"sceneSettingsOtherSettings"];

  v10 = (void *)MEMORY[0x263F08D40];
  [(FBSSceneSettings *)self->_settings frame];
  v11 = objc_msgSend(v10, "valueWithCGRect:");
  [v14 encodeObject:v11 forKey:@"sceneSettingsFrame"];

  double v12 = [(FBSSceneSettings *)self->_settings displayConfiguration];
  double v13 = objc_msgSend(v12, "pui_displayConfigurationIdentifier");
  [v14 encodeObject:v13 forKey:@"sceneSettingsDisplayConfigurationIdentifier"];

  objc_msgSend(v14, "encodeInteger:forKey:", -[FBSSceneSettings interfaceOrientation](self->_settings, "interfaceOrientation"), @"sceneSettingsInterfaceOrientation");
  [v14 encodeObject:self->_provider forKey:@"provider"];
  [v14 encodeObject:self->_date forKey:@"date"];
  [v14 encodeObject:self->_snapshotLevelSets forKey:@"snapshotLevelSets"];
  [v14 encodeInteger:self->_priority forKey:@"priority"];
  [v14 encodeInteger:self->_output forKey:@"output"];
  [v14 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v14 encodeDouble:@"timeoutInterval" forKey:self->_timeoutInterval];
  [v14 encodeObject:self->_legibilityProcessingRequest forKey:@"legibilityProcessingRequest"];
  [v14 encodeObject:self->_snapshotCacheIdentifier forKey:@"_snapshotCacheIdentifier"];
  [v14 encodeObject:self->_attachments forKey:@"_attachments"];
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (PFPosterPath)path
{
  return self->_path;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)snapshotCacheIdentifier
{
  return self->_snapshotCacheIdentifier;
}

- (NSArray)snapshotLevelSets
{
  return self->_snapshotLevelSets;
}

- (PUIPosterSnapshotLegibilityProcessingRequest)legibilityProcessingRequest
{
  return self->_legibilityProcessingRequest;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (int64_t)priority
{
  return self->_priority;
}

- (unint64_t)output
{
  return self->_output;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_legibilityProcessingRequest, 0);
  objc_storeStrong((id *)&self->_snapshotLevelSets, 0);
  objc_storeStrong((id *)&self->_snapshotCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end