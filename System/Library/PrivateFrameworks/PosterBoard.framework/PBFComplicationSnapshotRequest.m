@interface PBFComplicationSnapshotRequest
+ (id)requestForComplicationLookupInfo:(id)a3;
+ (id)requestsForPreview:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CHSWidget)widget;
- (CHSWidgetMetrics)metrics;
- (PBFComplicationSnapshotRequest)initWithWidget:(id)a3 metrics:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PBFComplicationSnapshotRequest

+ (id)requestsForPreview:(id)a3
{
  id v4 = a3;
  v5 = [v4 subtitleComplication];
  if (v5
    || ([v4 suggestedComplications],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 count]))
  {
  }
  else
  {
    v21 = [v4 suggestedLandscapeComplications];
    uint64_t v22 = [v21 count];

    if (!v22)
    {
      id v19 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_7;
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke;
  aBlock[3] = &__block_descriptor_40_e92___PBFComplicationSnapshotRequest_24__0___PBFComplicationLookupInfo__8___PBFPosterPreview__16l;
  aBlock[4] = a1;
  v6 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  v7 = objc_opt_new();
  v8 = [v4 subtitleComplication];

  if (v8)
  {
    v9 = [v4 subtitleComplication];
    v10 = v6[2](v6, v9, v4);

    objc_msgSend(v7, "bs_safeAddObject:", v10);
  }
  v11 = [v4 suggestedComplications];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_2;
  v27[3] = &unk_1E6983410;
  v12 = v6;
  v30 = v12;
  id v13 = v4;
  id v28 = v13;
  id v14 = v7;
  id v29 = v14;
  objc_msgSend(v11, "bs_each:", v27);

  v15 = [v13 suggestedLandscapeComplications];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_3;
  v23[3] = &unk_1E6983410;
  v26 = v12;
  id v24 = v13;
  id v16 = v14;
  id v25 = v16;
  v17 = v12;
  objc_msgSend(v15, "bs_each:", v23);

  v18 = v25;
  id v19 = v16;

LABEL_7:
  return v19;
}

uint64_t __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) requestForComplicationLookupInfo:a2];
}

void __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bs_safeAddObject:", v2);
}

void __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bs_safeAddObject:", v2);
}

+ (id)requestForComplicationLookupInfo:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 complicationExtensionBundleIdentifier];
    v6 = [v4 complicationContainingBundleIdentifier];
    v7 = [v4 complicationWidgetKind];
    v8 = [v4 complicationWidgetFamily];
    uint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [v4 complicationIntent];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F58DD8]) initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 kind:v7 family:v9 intent:v10];
    if (v11)
    {
      v12 = [MEMORY[0x1E4F92730] sharedInstance];
      id v13 = [v12 systemMetricsForWidget:v11];

      id v14 = (void *)[objc_alloc((Class)a1) initWithWidget:v11 metrics:v13];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (PBFComplicationSnapshotRequest)initWithWidget:(id)a3 metrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Chswidget.isa);
  if (!v9)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:]();
    }
LABEL_19:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325D314);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:CHSWidgetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325D378);
  }

  id v10 = v8;
  NSClassFromString(&cfstr_Chswidgetmetri.isa);
  if (!v10)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325D3DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:CHSWidgetMetricsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:]();
    }
    goto LABEL_19;
  }

  v20.receiver = self;
  v20.super_class = (Class)PBFComplicationSnapshotRequest;
  v11 = [(PBFComplicationSnapshotRequest *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_widget, a3);
    objc_storeStrong((id *)&v12->_metrics, a4);
    id v13 = [MEMORY[0x1E4F4F758] builder];
    id v14 = (id)[v13 appendObject:v12->_widget];
    id v15 = (id)[v13 appendObject:v10];
    v12->_hash = [v13 hash];
  }
  return v12;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBFComplicationSnapshotRequest *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      char v6 = 1;
    }
    else
    {
      v5 = v4;
      if (BSEqualObjects()) {
        char v6 = BSEqualObjects();
      }
      else {
        char v6 = 0;
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendUnsignedInteger:self->_hash withName:@"_hash"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __45__PBFComplicationSnapshotRequest_description__block_invoke;
  v11 = &unk_1E69808E8;
  id v12 = v3;
  id v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:@"content" multilinePrefix:0 block:&v8];
  char v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

id __45__PBFComplicationSnapshotRequest_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"_widget"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"_metrics"];
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

- (void)initWithWidget:metrics:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithWidget:metrics:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end