@interface PBFPosterSnapshotRequest
+ (BOOL)areRequestsFulfilled:(id)a3 modelCoordinatorProvider:(id)a4;
+ (BOOL)isRequestFulfilled:(id)a3 modelCoordinatorProvider:(id)a4;
+ (id)snapshotRequestForConfiguration:(id)a3 context:(id)a4;
+ (id)snapshotRequestForConfiguration:(id)a3 withinSwitcherConfiguration:(id)a4 variant:(int64_t)a5 snapshotDefinitions:(id)a6 displayContext:(id)a7;
+ (id)snapshotRequestForPreview:(id)a3 context:(id)a4;
+ (id)snapshotRequestForPreview:(id)a3 context:(id)a4 definition:(id)a5;
- (BOOL)_isEqualToRequest:(id)a3 allowingOtherDefinitionsAreSubset:(BOOL)a4;
- (BOOL)containsRequest:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (BOOL)loadFromCacheIfAvailable;
- (NSArray)definitions;
- (NSString)identifier;
- (NSString)previewIdentifier;
- (NSString)provider;
- (PBFDisplayContext)displayContext;
- (PBFPosterSnapshotRequest)initWithConfiguration:(id)a3 definitions:(id)a4 context:(id)a5;
- (PBFPosterSnapshotRequest)initWithDescriptor:(id)a3 configuredProperties:(id)a4 definitions:(id)a5 context:(id)a6;
- (PBFPosterSnapshotRequest)initWithPath:(id)a3 provider:(id)a4 configuredProperties:(id)a5 definitions:(id)a6 context:(id)a7;
- (PBFPosterSnapshotRequest)requestWithDefinitions:(id)a3;
- (PBFPosterSnapshotRequest)requestWithDisplayContext:(id)a3;
- (PBFPosterSnapshotRequest)requestWithIntention:(unint64_t)a3;
- (PBFPosterSnapshotRequest)requestWithLoadFromCacheIfAvailable:(BOOL)a3;
- (PBFPosterSnapshotRequest)requestWithPowerLogReason:(int64_t)a3;
- (PBFPosterSnapshotRequest)requestWithPreviewIdentifier:(id)a3;
- (PBFPosterSnapshotRequest)requestWithSignificantEventsCounter:(unint64_t)a3;
- (PFServerPosterPath)path;
- (PRPosterConfiguredProperties)configuredProperties;
- (id)buildPUIPosterSnapshotRequestsForOutput:(unint64_t)a3 priority:(int64_t)a4 timeout:(double)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)snapshotURLForDefinition:(id)a3;
- (int64_t)powerLogReason;
- (unint64_t)hash;
- (unint64_t)intention;
- (unint64_t)significantEventsCounter;
@end

@implementation PBFPosterSnapshotRequest

+ (id)snapshotRequestForPreview:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v7];
  v9 = [a1 snapshotRequestForPreview:v7 context:v6 definition:v8];

  return v9;
}

+ (id)snapshotRequestForPreview:(id)a3 context:(id)a4 definition:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  if (!v10)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323E354);
  }
  v11 = v10;
  if (([v10 conformsToProtocol:&unk_1F2AE1B50] & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFPosterPreview)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323E3B8);
  }

  id v12 = v9;
  NSClassFromString(&cfstr_Pbfpostersnaps_5.isa);
  if (!v12)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323E41CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323E480);
  }

  v13 = [v11 posterDescriptorLookupInfo];
  v14 = [v13 posterDescriptorPath];

  v15 = [v11 posterDescriptorLookupInfo];
  v16 = [v15 posterDescriptorExtension];
  v17 = [v16 posterExtensionBundleIdentifier];

  v18 = objc_msgSend(MEMORY[0x1E4F92640], "pbf_configuredPropertiesForPreview:", v11);
  v28[0] = v12;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v20 = [[PBFPosterSnapshotRequest alloc] initWithPath:v14 provider:v17 configuredProperties:v18 definitions:v19 context:v8];
  uint64_t v21 = [v11 previewUniqueIdentifier];
  previewIdentifier = v20->_previewIdentifier;
  v20->_previewIdentifier = (NSString *)v21;

  return v20;
}

+ (id)snapshotRequestForConfiguration:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v7)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:]();
    }
LABEL_19:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323E64CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323E6B0);
  }

  id v8 = [v7 _path];
  if (([v8 isServerPosterPath] & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323E714);
  }
  id v9 = [v8 identity];
  uint64_t v10 = [v9 type];

  if (v10 != 3)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[path identity] type] == PFServerPosterTypeConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:]();
    }
    goto LABEL_19;
  }
  v11 = [v7 loadConfiguredPropertiesWithError:0];
  id v12 = [PBFPosterSnapshotRequest alloc];
  v13 = [v8 serverIdentity];
  v14 = [v13 provider];
  v15 = +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions];
  v16 = [(PBFPosterSnapshotRequest *)v12 initWithPath:v8 provider:v14 configuredProperties:v11 definitions:v15 context:v6];

  return v16;
}

+ (BOOL)isRequestFulfilled:(id)a3 modelCoordinatorProvider:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 loadFromCacheIfAvailable])
  {
    id v7 = [v5 path];
    id v8 = [v7 serverIdentity];
    id v9 = objc_msgSend(v6, "pbf_posterSnapshotCoordinatorForIdentity:", v8);

    uint64_t v10 = [v5 configuredProperties];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v11 = [v5 definitions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v20 = v7;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v17 = [v5 displayContext];
          LODWORD(v16) = [v9 snapshotExistsForDefinition:v16 configuredProperties:v10 context:v17];

          if (!v16)
          {
            BOOL v18 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v18 = 1;
LABEL_13:
      id v7 = v20;
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)areRequestsFulfilled:(id)a3 modelCoordinatorProvider:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    uint64_t v26 = v7;
    v27 = v6;
    uint64_t v24 = *(void *)v33;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v25 = v9;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        if (![v12 loadFromCacheIfAvailable])
        {
          BOOL v22 = 0;
          goto LABEL_20;
        }
        uint64_t v13 = v6[2](v6, v12);
        uint64_t v14 = [v12 configuredProperties];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v15 = [v12 definitions];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              long long v21 = [v12 displayContext];
              LODWORD(v20) = [v13 snapshotExistsForDefinition:v20 configuredProperties:v14 context:v21];

              if (!v20)
              {

                BOOL v22 = 0;
                id v7 = v26;
                id v6 = v27;
                goto LABEL_20;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        ++v11;
        id v7 = v26;
        id v6 = v27;
        uint64_t v10 = v24;
      }
      while (v11 != v25);
      uint64_t v9 = [v26 countByEnumeratingWithState:&v32 objects:v37 count:16];
      BOOL v22 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v22 = 1;
  }
LABEL_20:

  return v22;
}

- (PBFPosterSnapshotRequest)initWithConfiguration:(id)a3 definitions:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 _path];
  if (([v11 isServerPosterPath] & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:]();
    }
LABEL_9:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323ED0CLL);
  }
  uint64_t v12 = [v11 identity];
  uint64_t v13 = [v12 type];

  if (v13 != 3)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[path identity] type] == PFServerPosterTypeConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:]();
    }
    goto LABEL_9;
  }
  uint64_t v14 = [v8 loadConfiguredPropertiesWithError:0];
  v15 = [v11 serverIdentity];
  uint64_t v16 = [v15 provider];
  uint64_t v17 = [(PBFPosterSnapshotRequest *)self initWithPath:v11 provider:v16 configuredProperties:v14 definitions:v9 context:v10];

  return v17;
}

- (PBFPosterSnapshotRequest)initWithDescriptor:(id)a3 configuredProperties:(id)a4 definitions:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 _path];
  if (([v14 isServerPosterPath] & 1) == 0)
  {
    long long v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithDescriptor:configuredProperties:definitions:context:]();
    }
LABEL_9:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323EEE4);
  }
  v15 = [v14 identity];
  uint64_t v16 = [v15 type];

  if (v16 != 3)
  {
    long long v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[path identity] type] == PFServerPosterTypeConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithDescriptor:configuredProperties:definitions:context:]();
    }
    goto LABEL_9;
  }
  uint64_t v17 = [v14 serverIdentity];
  uint64_t v18 = [v17 provider];
  v19 = [(PBFPosterSnapshotRequest *)self initWithPath:v14 provider:v18 configuredProperties:v11 definitions:v12 context:v13];

  return v19;
}

- (PBFPosterSnapshotRequest)initWithPath:(id)a3 provider:(id)a4 configuredProperties:(id)a5 definitions:(id)a6 context:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  PBFPosterSnapshotRequestIdentifierForPath(v13);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v18)
  {
    long long v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:]();
    }
LABEL_48:
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F208);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F26CLL);
  }

  id v19 = v14;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v19)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:]();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F2D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:]();
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F334);
  }

  id v20 = v13;
  NSClassFromString(&cfstr_Pfserverposter_0.isa);
  if (!v20)
  {
    v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:]();
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F398);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:]();
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F3FCLL);
  }

  id v21 = v15;
  if (v21)
  {
    NSClassFromString(&cfstr_Prposterconfig_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.8();
      }
      goto LABEL_48;
    }
  }

  id v22 = v16;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v22)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.4();
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F460);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.4();
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F4C4);
  }

  id v23 = v17;
  if (!v23)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.5();
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F528);
  }
  uint64_t v24 = v23;
  if (([v23 conformsToProtocol:&unk_1F2AE68B8] & 1) == 0)
  {
    v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.5();
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323F58CLL);
  }

  v45.receiver = self;
  v45.super_class = (Class)PBFPosterSnapshotRequest;
  uint64_t v25 = [(PBFPosterSnapshotRequest *)&v45 init];
  if (v25)
  {
    uint64_t v26 = PBFPosterSnapshotRequestIdentifierForPath(v20);
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    objc_storeStrong((id *)&v25->_path, a3);
    uint64_t v28 = [v21 copy];
    configuredProperties = v25->_configuredProperties;
    v25->_configuredProperties = (PRPosterConfiguredProperties *)v28;

    uint64_t v30 = [v22 copy];
    definitions = v25->_definitions;
    v25->_definitions = (NSArray *)v30;

    v25->_cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    v25->_intention = 2;
    v25->_powerLogReason = 0;
    uint64_t v32 = [v19 copy];
    provider = v25->_provider;
    v25->_provider = (NSString *)v32;

    objc_storeStrong((id *)&v25->_displayContext, a7);
    v25->_loadFromCacheIfAvailable = 1;
    v25->_significantEventsCounter = 0;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPath:provider:configuredProperties:definitions:context:", self->_path, self->_provider, self->_configuredProperties, self->_definitions, self->_displayContext);
  *(void *)(v4 + 72) = self->_intention;
  *(void *)(v4 + 88) = self->_powerLogReason;
  uint64_t v5 = [(NSString *)self->_previewIdentifier copy];
  id v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(unsigned char *)(v4 + 32) = self->_loadFromCacheIfAvailable;
  *(void *)(v4 + 80) = self->_significantEventsCounter;
  return (id)v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier"];
  [v3 appendString:self->_previewIdentifier withName:@"previewIdentifier" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_path withName:@"path"];
  id v5 = (id)[v3 appendObject:self->_definitions withName:@"definitions"];
  id v6 = (id)[v3 appendBool:self->_loadFromCacheIfAvailable withName:@"loadFromCacheIfAvailable"];
  unint64_t significantEventsCounter = self->_significantEventsCounter;
  if (significantEventsCounter) {
    id v8 = (id)[v3 appendUnsignedInteger:significantEventsCounter withName:@"_significantEventsCounter"];
  }
  id v9 = NSStringFromPBFPosterSnapshotRequestIntention(self->_intention);
  [v3 appendString:v9 withName:@"intention"];

  id v10 = [v3 build];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBFPosterSnapshotRequest *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(PBFPosterSnapshotRequest *)self isEqualToRequest:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToRequest:(id)a3
{
  return [(PBFPosterSnapshotRequest *)self _isEqualToRequest:a3 allowingOtherDefinitionsAreSubset:0];
}

- (BOOL)containsRequest:(id)a3
{
  return [(PBFPosterSnapshotRequest *)self _isEqualToRequest:a3 allowingOtherDefinitionsAreSubset:1];
}

- (BOOL)_isEqualToRequest:(id)a3 allowingOtherDefinitionsAreSubset:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (PBFPosterSnapshotRequest *)a3;
  id v7 = v6;
  if (v6 == self)
  {
    LOBYTE(v23) = 1;
    goto LABEL_18;
  }
  if (!v6) {
    goto LABEL_17;
  }
  id v8 = [(PBFPosterSnapshotRequest *)self identifier];
  id v9 = [(PBFPosterSnapshotRequest *)v7 identifier];
  int v10 = BSEqualObjects();

  if (!v10) {
    goto LABEL_17;
  }
  id v11 = [(PBFPosterSnapshotRequest *)self path];
  int v12 = [v11 isServerPosterPath];
  id v13 = [(PBFPosterSnapshotRequest *)v7 path];
  int v14 = [v13 isServerPosterPath];

  if (v12 != v14) {
    goto LABEL_17;
  }
  id v15 = [(PBFPosterSnapshotRequest *)self path];
  if (([v15 isServerPosterPath] & 1) == 0)
  {

LABEL_11:
    uint64_t v24 = [(PBFPosterSnapshotRequest *)self path];
    uint64_t v25 = [v24 contentsURL];
    uint64_t v26 = [(PBFPosterSnapshotRequest *)v7 path];
    v27 = [v26 contentsURL];
    int v28 = BSEqualObjects();

    if (!v28)
    {
LABEL_17:
      LOBYTE(v23) = 0;
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  id v16 = [(PBFPosterSnapshotRequest *)v7 path];
  int v17 = [v16 isServerPosterPath];

  if (!v17) {
    goto LABEL_11;
  }
  id v18 = [(PBFPosterSnapshotRequest *)self path];
  id v19 = [v18 identity];
  id v20 = [(PBFPosterSnapshotRequest *)v7 path];
  id v21 = [v20 identity];
  char v22 = BSEqualObjects();

  if ((v22 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_12:
  long long v29 = [(PBFPosterSnapshotRequest *)self displayContext];
  uint64_t v30 = [(PBFPosterSnapshotRequest *)v7 displayContext];
  int v31 = BSEqualObjects();

  if (!v31) {
    goto LABEL_17;
  }
  unint64_t v32 = [(PBFPosterSnapshotRequest *)self significantEventsCounter];
  if (v32 != [(PBFPosterSnapshotRequest *)v7 significantEventsCounter]) {
    goto LABEL_17;
  }
  long long v33 = [(PBFPosterSnapshotRequest *)self configuredProperties];
  long long v34 = [(PBFPosterSnapshotRequest *)v7 configuredProperties];
  int v35 = [v33 isEqualToConfiguredProperties:v34 comparingPropertiesAffectingSnapshotsOnly:1];

  if (!v35) {
    goto LABEL_17;
  }
  v36 = (void *)MEMORY[0x1E4F1CAD0];
  v37 = [(PBFPosterSnapshotRequest *)self definitions];
  uint64_t v38 = [v36 setWithArray:v37];

  v39 = (void *)MEMORY[0x1E4F1CAD0];
  v40 = [(PBFPosterSnapshotRequest *)v7 definitions];
  v41 = [v39 setWithArray:v40];

  if (v4)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __80__PBFPosterSnapshotRequest__isEqualToRequest_allowingOtherDefinitionsAreSubset___block_invoke;
    v43[3] = &unk_1E6982B08;
    id v44 = v38;
    int v23 = objc_msgSend(v41, "bs_containsObjectPassingTest:", v43) ^ 1;
  }
  else
  {
    int v23 = BSEqualObjects();
  }

LABEL_18:
  return v23;
}

uint64_t __80__PBFPosterSnapshotRequest__isEqualToRequest_allowingOtherDefinitionsAreSubset___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (unint64_t)hash
{
  uint64_t cachedHash = self->_cachedHash;
  if (cachedHash == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = [MEMORY[0x1E4F4F758] builder];
    id v5 = (id)[v4 appendString:self->_identifier];
    id v6 = (id)[v4 appendString:self->_previewIdentifier];
    id v7 = [(PFServerPosterPath *)self->_path contentsURL];
    id v8 = (id)[v4 appendObject:v7];

    id v9 = [(PRPosterConfiguredProperties *)self->_configuredProperties persistenceIdentifierWithComplications:0];
    id v10 = (id)[v4 appendObject:v9];

    id v11 = (id)[v4 appendObject:self->_definitions];
    int v12 = [(PBFPosterSnapshotRequest *)self displayContext];
    id v13 = (id)[v4 appendObject:v12];

    id v14 = (id)[v4 appendObject:self->_provider];
    id v15 = (id)[v4 appendInteger:self->_significantEventsCounter];
    uint64_t cachedHash = [v4 hash];
    self->_uint64_t cachedHash = cachedHash;
  }
  return cachedHash;
}

- (id)snapshotURLForDefinition:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PBFPosterSnapshotRequest.m", 304, @"Invalid parameter not satisfying: %@", @"snapshotDefinition" object file lineNumber description];
  }
  id v6 = [(PBFPosterSnapshotRequest *)self definitions];
  int v7 = [v6 containsObject:v5];

  if (v7 && [(PFServerPosterPath *)self->_path isServerPosterPath])
  {
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    path = self->_path;
    configuredProperties = self->_configuredProperties;
    id v11 = [(PBFPosterSnapshotRequest *)self displayContext];
    int v12 = objc_msgSend(v8, "pbf_snapshotURLForPath:definition:configuredProperties:context:", path, v5, configuredProperties, v11);
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (PBFPosterSnapshotRequest)requestWithPowerLogReason:(int64_t)a3
{
  if (self->_powerLogReason == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)[(PBFPosterSnapshotRequest *)self copy];
    v3->_powerLogReason = a3;
  }
  return v3;
}

- (PBFPosterSnapshotRequest)requestWithIntention:(unint64_t)a3
{
  if (self->_intention == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)[(PBFPosterSnapshotRequest *)self copy];
    v3->_intention = a3;
  }
  return v3;
}

- (PBFPosterSnapshotRequest)requestWithDisplayContext:(id)a3
{
  id v5 = a3;
  if ([(PBFDisplayContext *)self->_displayContext isEqualToDisplayContext:v5])
  {
    id v6 = self;
  }
  else
  {
    id v6 = (PBFPosterSnapshotRequest *)[(PBFPosterSnapshotRequest *)self copy];
    objc_storeStrong((id *)&v6->_displayContext, a3);
  }

  return v6;
}

- (PBFPosterSnapshotRequest)requestWithDefinitions:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_definitions];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  int v7 = [v5 isEqualToSet:v6];

  if (v7)
  {
    id v8 = self;
  }
  else
  {
    id v8 = (PBFPosterSnapshotRequest *)[(PBFPosterSnapshotRequest *)self copy];
    uint64_t v9 = [v4 copy];
    definitions = v8->_definitions;
    v8->_definitions = (NSArray *)v9;
  }
  return v8;
}

- (PBFPosterSnapshotRequest)requestWithLoadFromCacheIfAvailable:(BOOL)a3
{
  if (self->_loadFromCacheIfAvailable == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)[(PBFPosterSnapshotRequest *)self copy];
    v3->_loadFromCacheIfAvailable = a3;
  }
  return v3;
}

- (PBFPosterSnapshotRequest)requestWithPreviewIdentifier:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self->_previewIdentifier isEqualToString:v4])
  {
    id v5 = self;
  }
  else
  {
    id v5 = (PBFPosterSnapshotRequest *)[(PBFPosterSnapshotRequest *)self copy];
    uint64_t v6 = [v4 copy];
    previewIdentifier = v5->_previewIdentifier;
    v5->_previewIdentifier = (NSString *)v6;
  }
  return v5;
}

- (PBFPosterSnapshotRequest)requestWithSignificantEventsCounter:(unint64_t)a3
{
  if (self->_significantEventsCounter == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)[(PBFPosterSnapshotRequest *)self copy];
    v3->_unint64_t significantEventsCounter = a3;
  }
  return v3;
}

- (id)buildPUIPosterSnapshotRequestsForOutput:(unint64_t)a3 priority:(int64_t)a4 timeout:(double)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = [(PBFPosterSnapshotRequest *)self path];
  if (([v8 isServerPosterPath] & 1) == 0)
  {
    int v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotRequest buildPUIPosterSnapshotRequestsForOutput:priority:timeout:](a2);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3240540);
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  id v44 = __Block_byref_object_dispose__3;
  uint64_t v9 = (void *)MEMORY[0x1E4F62918];
  id v10 = [(PBFPosterSnapshotRequest *)self displayContext];
  objc_msgSend(v9, "pbf_displayConfigurationForDisplayContext:", v10);
  id v45 = (id)objc_claimAutoreleasedReturnValue();

  if (!v41[5])
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      id v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
      uint64_t v12 = [v11 displayConfiguration];
      id v13 = (void *)v41[5];
      v41[5] = v12;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__PBFPosterSnapshotRequest_buildPUIPosterSnapshotRequestsForOutput_priority_timeout___block_invoke;
      block[3] = &unk_1E6980C98;
      block[4] = &v40;
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
  }
  long long v33 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = [(PBFPosterSnapshotRequest *)self definitions];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v15)
  {
    id obj = v14;
    uint64_t v30 = *(void *)v36;
    do
    {
      uint64_t v34 = v15;
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v18 = [v17 uniqueIdentifier];
        id v19 = objc_opt_new();
        objc_msgSend(v19, "setSnapshotOptions:", objc_msgSend(MEMORY[0x1E4F926C8], "snapshotOptionsForDefinition:", v17));
        id v20 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithUserInterfaceStyle:", UIUserInterfaceStyleFromPBFUserInterfaceStyle(-[PBFDisplayContext pbf_userInterfaceStyle](self->_displayContext, "pbf_userInterfaceStyle")));
        [v19 setTraitCollection:v20];

        [v19 setDisplayConfiguration:v41[5]];
        objc_msgSend(v19, "setInterfaceOrientation:", -[PBFDisplayContext pbf_interfaceOrientation](self->_displayContext, "pbf_interfaceOrientation"));
        id v21 = [v19 buildWithPath:v8 provider:self->_provider configuredProperties:self->_configuredProperties snapshotDefinition:v17];
        char v22 = objc_opt_new();
        [v21 applyToMutableSceneSettings:v22];
        int v23 = [v17 levelSets];
        uint64_t v24 = objc_msgSend(v23, "bs_mapNoNulls:", &__block_literal_global_10);

        uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F92820]) initWithPath:v8 snapshotCacheIdentifier:v18 settings:v22 output:a3 priority:a4 snapshotLevelSets:v24 snapshotLegibilityProcessingRequest:a5 attachments:0 timeout:0];
        [v33 setObject:v25 forKey:v17];
      }
      id v14 = obj;
      uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v15);
  }

  uint64_t v26 = (void *)[v33 copy];
  _Block_object_dispose(&v40, 8);

  return v26;
}

void __85__PBFPosterSnapshotRequest_buildPUIPosterSnapshotRequestsForOutput_priority_timeout___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v2 = [v5 displayConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __85__PBFPosterSnapshotRequest_buildPUIPosterSnapshotRequestsForOutput_priority_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F927F8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 levels];

  uint64_t v6 = (void *)[v4 initWithSet:v5];
  return v6;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (NSArray)definitions
{
  return self->_definitions;
}

- (unint64_t)intention
{
  return self->_intention;
}

- (unint64_t)significantEventsCounter
{
  return self->_significantEventsCounter;
}

- (int64_t)powerLogReason
{
  return self->_powerLogReason;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)previewIdentifier
{
  return self->_previewIdentifier;
}

- (NSString)provider
{
  return self->_provider;
}

- (BOOL)loadFromCacheIfAvailable
{
  return self->_loadFromCacheIfAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_previewIdentifier, 0);
}

+ (id)snapshotRequestForConfiguration:(id)a3 withinSwitcherConfiguration:(id)a4 variant:(int64_t)a5 snapshotDefinitions:(id)a6 displayContext:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ((unint64_t)(a5 + 1) < 2)
  {
    id v15 = v11;
    if (!v15) {
      goto LABEL_13;
    }
LABEL_12:
    id v20 = [[PBFPosterSnapshotRequest alloc] initWithConfiguration:v15 definitions:v13 context:v14];

    goto LABEL_14;
  }
  if (a5 == 1)
  {
    id v16 = [v12 configuredPropertiesForPoster:v11];
    int v17 = [v16 homeScreenConfiguration];

    uint64_t v18 = [v17 selectedAppearanceType];
    if (v18 == 3)
    {
      id v19 = [v12 _childPosterConfigurationForConfiguration:v11];
    }
    else
    {
      if (v18)
      {
        id v15 = 0;
LABEL_11:

        if (v15) {
          goto LABEL_12;
        }
        goto LABEL_13;
      }
      id v19 = v11;
    }
    id v15 = v19;
    goto LABEL_11;
  }
LABEL_13:
  id v20 = 0;
LABEL_14:

  return v20;
}

+ (void)snapshotRequestForPreview:context:definition:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)snapshotRequestForPreview:context:definition:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)snapshotRequestForConfiguration:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)snapshotRequestForConfiguration:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)snapshotRequestForConfiguration:context:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:definitions:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:definitions:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDescriptor:configuredProperties:definitions:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDescriptor:configuredProperties:definitions:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.8()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)buildPUIPosterSnapshotRequestsForOutput:(const char *)a1 priority:timeout:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end