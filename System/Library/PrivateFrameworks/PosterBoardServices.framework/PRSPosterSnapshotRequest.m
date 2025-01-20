@interface PRSPosterSnapshotRequest
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)contaminateRequestOptions:(id)a3;
+ (id)sanitizeRequestOptions:(id)a3;
+ (id)validOptions;
- (BOOL)_validateRequestOptionsOrAbort:(BOOL)a3;
- (NSDictionary)requestOptions;
- (PFServerPosterPath)path;
- (PRSPosterSnapshotRequest)initWithBSXPCCoder:(id)a3;
- (PRSPosterSnapshotRequest)initWithConfiguration:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5;
- (PRSPosterSnapshotRequest)initWithConfiguration:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5 orientation:(int64_t)a6;
- (PRSPosterSnapshotRequest)initWithConfigurationType:(int64_t)a3 variantType:(int64_t)a4 options:(unint64_t)a5;
- (PRSPosterSnapshotRequest)initWithConfigurationType:(int64_t)a3 variantType:(int64_t)a4 options:(unint64_t)a5 orientation:(int64_t)a6;
- (PRSPosterSnapshotRequest)initWithDescriptor:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5;
- (PRSPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 maxCount:(unint64_t)a7;
- (PRSPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 maxCount:(unint64_t)a4;
- (PRSPosterSnapshotRequest)initWithFocusPosterRequest:(id)a3;
- (PRSPosterSnapshotRequest)initWithPath:(id)a3 requestOptions:(id)a4;
- (double)imageScaleRelativeToScreen;
- (int64_t)configurationType;
- (int64_t)orientation;
- (int64_t)variantType;
- (unint64_t)maxCount;
- (unint64_t)options;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setImageScaleRelativeToScreen:(double)a3;
@end

@implementation PRSPosterSnapshotRequest

- (PRSPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = [[PRSFocusPosterSnapshotRequest alloc] initWithFocusModeUUID:v6 configurationType:1 variant:0 options:0 imageScaleRelativeToScreen:1 orientation:a4 maxCount:0.333333343];

  return (PRSPosterSnapshotRequest *)v7;
}

- (PRSPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 maxCount:(unint64_t)a7
{
  id v12 = a3;
  v13 = [[PRSFocusPosterSnapshotRequest alloc] initWithFocusModeUUID:v12 configurationType:a4 variant:a5 options:a6 imageScaleRelativeToScreen:1 orientation:a7 maxCount:0.333333343];

  return (PRSPosterSnapshotRequest *)v13;
}

- (PRSPosterSnapshotRequest)initWithConfiguration:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5
{
  return [(PRSPosterSnapshotRequest *)self initWithConfiguration:a3 variantType:a4 options:a5 orientation:1];
}

- (PRSPosterSnapshotRequest)initWithDescriptor:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  NSClassFromString(&cfstr_Prsposterdescr_0.isa);
  if (!v8)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithDescriptor:variantType:options:]();
    }
LABEL_11:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D7788);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterDescriptorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithDescriptor:variantType:options:]();
    }
    goto LABEL_11;
  }

  v17.receiver = self;
  v17.super_class = (Class)PRSPosterSnapshotRequest;
  v9 = [(PRSPosterSnapshotRequest *)&v17 init];
  if (v9)
  {
    v10 = objc_opt_new();
    v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
    [v10 setObject:v11 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionOptionsEnum"];

    id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [v10 setObject:v12 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionLegacyVariant"];

    uint64_t v13 = [v8 _path];
    path = v9->_path;
    v9->_path = (PFServerPosterPath *)v13;

    [(PRSPosterSnapshotRequest *)v9 _validateRequestOptionsOrAbort:1];
  }

  return v9;
}

- (PRSPosterSnapshotRequest)initWithConfiguration:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5 orientation:(int64_t)a6
{
  id v10 = a3;
  NSClassFromString(&cfstr_Prsposterconfi_1.isa);
  if (!v10)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithConfiguration:variantType:options:orientation:]();
    }
LABEL_11:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D79A8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithConfiguration:variantType:options:orientation:]();
    }
    goto LABEL_11;
  }

  v21.receiver = self;
  v21.super_class = (Class)PRSPosterSnapshotRequest;
  v11 = [(PRSPosterSnapshotRequest *)&v21 init];
  if (v11)
  {
    id v12 = objc_opt_new();
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
    [v12 setObject:v13 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionOptionsEnum"];

    v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [v12 setObject:v14 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionLegacyVariant"];

    uint64_t v15 = [v10 _path];
    path = v11->_path;
    v11->_path = (PFServerPosterPath *)v15;

    uint64_t v17 = [v12 copy];
    requestOptions = v11->_requestOptions;
    v11->_requestOptions = (NSDictionary *)v17;

    v11->_orientation = a6;
    [(PRSPosterSnapshotRequest *)v11 _validateRequestOptionsOrAbort:1];
  }
  return v11;
}

- (PRSPosterSnapshotRequest)initWithConfigurationType:(int64_t)a3 variantType:(int64_t)a4 options:(unint64_t)a5 orientation:(int64_t)a6
{
  v18.receiver = self;
  v18.super_class = (Class)PRSPosterSnapshotRequest;
  id v10 = [(PRSPosterSnapshotRequest *)&v18 init];
  if (v10)
  {
    v11 = objc_opt_new();
    id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
    [v11 setObject:v12 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionOptionsEnum"];

    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [v11 setObject:v13 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionLegacyVariant"];

    v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    [v11 setObject:v14 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionLegacyConfigurationType"];

    uint64_t v15 = [v11 copy];
    requestOptions = v10->_requestOptions;
    v10->_requestOptions = (NSDictionary *)v15;

    v10->_orientation = a6;
    [(PRSPosterSnapshotRequest *)v10 _validateRequestOptionsOrAbort:1];
  }
  return v10;
}

- (PRSPosterSnapshotRequest)initWithConfigurationType:(int64_t)a3 variantType:(int64_t)a4 options:(unint64_t)a5
{
  return [(PRSPosterSnapshotRequest *)self initWithConfigurationType:a3 variantType:a4 options:a5 orientation:1];
}

- (PRSPosterSnapshotRequest)initWithPath:(id)a3 requestOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (v9)
  {
    NSClassFromString(&cfstr_Pfserverposter.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterSnapshotRequest initWithPath:requestOptions:]();
      }
LABEL_16:
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78D7CB4);
    }
  }

  id v10 = v8;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v10)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithPath:requestOptions:]();
    }
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithPath:requestOptions:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D7D18);
  }

  v18.receiver = self;
  v18.super_class = (Class)PRSPosterSnapshotRequest;
  v11 = [(PRSPosterSnapshotRequest *)&v18 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_path, a3);
    uint64_t v13 = [v10 copy];
    requestOptions = v12->_requestOptions;
    v12->_requestOptions = (NSDictionary *)v13;

    [(PRSPosterSnapshotRequest *)v12 _validateRequestOptionsOrAbort:1];
  }

  return v12;
}

- (PRSPosterSnapshotRequest)initWithFocusPosterRequest:(id)a3
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSClassFromString(&cfstr_Prsfocusposter.isa);
  if (!v4)
  {
    objc_super v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithFocusPosterRequest:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D8090);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSFocusPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest initWithFocusPosterRequest:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D80F4);
  }

  v23.receiver = self;
  v23.super_class = (Class)PRSPosterSnapshotRequest;
  v5 = [(PRSPosterSnapshotRequest *)&v23 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA60];
    v24[0] = @"PRSPosterSnapshotRequestOptionLegacyVariant";
    id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "variant"));
    v25[0] = v7;
    v24[1] = @"PRSPosterSnapshotRequestOptionLegacyConfigurationType";
    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "configurationType"));
    v25[1] = v8;
    v24[2] = @"PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen";
    id v9 = (void *)MEMORY[0x1E4F28ED0];
    [v4 imageScaleRelativeToScreen];
    id v10 = objc_msgSend(v9, "numberWithDouble:");
    v25[2] = v10;
    v24[3] = @"PRSPosterSnapshotRequestOptionLegacyMaxCount";
    v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "maxCount"));
    v25[3] = v11;
    v24[4] = @"PRSPosterSnapshotRequestOptionOptionsEnum";
    id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "options"));
    v24[5] = @"PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest";
    v25[4] = v12;
    v25[5] = MEMORY[0x1E4F1CC38];
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];
    v14 = [v6 dictionaryWithDictionary:v13];

    uint64_t v15 = [v4 focusModeUUID];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v17 = [v4 focusModeUUID];
      objc_super v18 = (void *)[v16 initWithUUIDString:v17];
      [(NSDictionary *)v14 setObject:v18 forKeyedSubscript:@"PRSPosterSnapshotRequestOptionFocusUUID"];
    }
    requestOptions = v5->_requestOptions;
    v5->_requestOptions = v14;

    v5->_orientation = [v4 orientation];
    [(PRSPosterSnapshotRequest *)v5 _validateRequestOptionsOrAbort:1];
  }

  return v5;
}

+ (id)validOptions
{
  if (validOptions_onceToken != -1) {
    dispatch_once(&validOptions_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)validOptions_validOptions;
  return v2;
}

uint64_t __40__PRSPosterSnapshotRequest_validOptions__block_invoke()
{
  validOptions_validOptions = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen", @"PRSPosterSnapshotRequestOptionLegacyVariant", @"PRSPosterSnapshotRequestOptionLegacyConfigurationType", @"PRSPosterSnapshotRequestOptionLegacyMaxCount", @"PRSPosterSnapshotRequestOptionOptionsEnum", @"PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier", @"PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest", @"PRSPosterSnapshotRequestOptionFocusUUID", 0);
  return MEMORY[0x1F41817F8]();
}

- (int64_t)variantType
{
  v2 = [(PRSPosterSnapshotRequest *)self requestOptions];
  v3 = [v2 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyVariant"];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)configurationType
{
  v2 = [(PRSPosterSnapshotRequest *)self requestOptions];
  v3 = [v2 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyConfigurationType"];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)options
{
  v2 = [(PRSPosterSnapshotRequest *)self requestOptions];
  v3 = [v2 objectForKey:@"PRSPosterSnapshotRequestOptionOptionsEnum"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)imageScaleRelativeToScreen
{
  v2 = [(PRSPosterSnapshotRequest *)self requestOptions];
  v3 = [v2 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (unint64_t)maxCount
{
  v2 = [(PRSPosterSnapshotRequest *)self requestOptions];
  v3 = [v2 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyMaxCount"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)_validateRequestOptionsOrAbort:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(NSDictionary *)self->_requestOptions allKeys];
  id v7 = [v5 setWithArray:v6];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v9)
  {
    BOOL v28 = 1;
    goto LABEL_53;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v37;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v37 != v11) {
      objc_enumerationMutation(v8);
    }
    uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
    v14 = [(id)objc_opt_class() validOptions];
    char v15 = [v14 containsObject:v13];

    if ((v15 & 1) == 0)
    {
      if (!v3) {
        goto LABEL_52;
      }
      v29 = [NSString stringWithFormat:@"PRSPosterSnapshotRequest contained undefined key '%@'", v13];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.7();
      }
      goto LABEL_62;
    }
    if ([v13 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"])
    {
      id v16 = [(NSDictionary *)self->_requestOptions objectForKey:v13];
      [v16 doubleValue];
      double v18 = v17;

      if (v18 < 0.0) {
        break;
      }
    }
    if ([v13 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyMaxCount"])
    {
      v19 = [(NSDictionary *)self->_requestOptions objectForKey:v13];
      [v19 unsignedIntegerValue];
    }
    if ([v13 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyConfigurationType"])
    {
      v20 = [(NSDictionary *)self->_requestOptions objectForKey:v13];
      uint64_t v21 = [v20 unsignedIntegerValue];

      if ((unint64_t)(v21 + 1) >= 3)
      {
        if (v3)
        {
          v31 = [NSString stringWithFormat:@"PRSPosterSnapshotRequest key '%@' was outside acceptable bounds", v13];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:]();
          }
          [v31 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A78D87A0);
        }
        goto LABEL_52;
      }
      goto LABEL_23;
    }
    if ([v13 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyVariant"])
    {
      v22 = [(NSDictionary *)self->_requestOptions objectForKey:v13];
      uint64_t v23 = [v22 unsignedIntegerValue];

      if ((unint64_t)(v23 + 1) >= 3)
      {
        if (v3)
        {
          v32 = [NSString stringWithFormat:@"PRSPosterSnapshotRequest key '%@' was outside acceptable bounds", v13];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:]();
          }
          [v32 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A78D8814);
        }
        goto LABEL_52;
      }
      goto LABEL_23;
    }
    if ([v13 isEqualToString:@"PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier"])
    {
      v24 = [(NSDictionary *)self->_requestOptions objectForKey:v13];
      if (![v24 length])
      {
        if (v3)
        {
          v35 = [NSString stringWithFormat:@"PRSPosterSnapshotRequest key '%@' was outside acceptable bounds", v13];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:]();
          }
          [v35 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A78D8924);
        }

        goto LABEL_52;
      }
    }
    else
    {
      if (![v13 isEqualToString:@"PRSPosterSnapshotRequestOptionOptionsEnum"])
      {
        if ([v13 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest"])
        {
          v25 = [(NSDictionary *)self->_requestOptions objectForKey:v13];
          v26 = v25;
          if (!v25 && v3)
          {
            v34 = [NSString stringWithFormat:@"PRSPosterSnapshotRequest key '%@' was outside acceptable bounds", v13];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.5();
            }
            [v34 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A78D88C8);
          }

          if (!v26) {
            goto LABEL_52;
          }
        }
        goto LABEL_23;
      }
      v24 = [(NSDictionary *)self->_requestOptions objectForKey:v13];
      if (!v24)
      {
        if (!v3) {
          goto LABEL_52;
        }
        v29 = [NSString stringWithFormat:@"PRSPosterSnapshotRequest key '%@' was outside acceptable bounds", v13];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.4();
        }
LABEL_62:
        [v29 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A78D86D8);
      }
    }

LABEL_23:
    if (v10 == ++v12)
    {
      uint64_t v27 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      uint64_t v10 = v27;
      BOOL v28 = 1;
      if (!v27) {
        goto LABEL_53;
      }
      goto LABEL_3;
    }
  }
  if (v3)
  {
    v30 = [NSString stringWithFormat:@"PRSPosterSnapshotRequest key '%@' was outside acceptable bounds", v13];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.6();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D873CLL);
  }
LABEL_52:
  BOOL v28 = 0;
LABEL_53:

  return v28;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(id)objc_opt_class() sanitizeRequestOptions:self->_requestOptions];
  [v5 encodeXPCObject:v4 forKey:@"_requestOptions"];

  [v5 encodeObject:self->_path forKey:@"_path"];
  [v5 encodeInt64:self->_orientation forKey:@"_orientation"];
}

- (PRSPosterSnapshotRequest)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PRSPosterSnapshotRequest;
  id v5 = [(PRSPosterSnapshotRequest *)&v16 init];
  if (v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_path"];
    path = v5->_path;
    v5->_path = (PFServerPosterPath *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"_requestOptions"];
    uint64_t v11 = [v9 contaminateRequestOptions:v10];
    requestOptions = v5->_requestOptions;
    v5->_requestOptions = (NSDictionary *)v11;

    unint64_t v13 = [v4 decodeInt64ForKey:@"_orientation"];
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    v5->_orientation = v14;
  }

  return v5;
}

+ (id)sanitizeRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = [a1 validOptions];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PRSPosterSnapshotRequest_sanitizeRequestOptions___block_invoke;
  v12[3] = &unk_1E5D00FC8;
  id v13 = v5;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __51__PRSPosterSnapshotRequest_sanitizeRequestOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v13])
  {
    xpc_object_t v6 = (void *)MEMORY[0x1AD0D2CA0]();
    id v7 = v13;
    id v8 = (const char *)[v7 UTF8String];
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"])
    {
      uint64_t v9 = *(void **)(a1 + 40);
      [v5 doubleValue];
      xpc_dictionary_set_double(v9, v8, v10);
    }
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyVariant"]) {
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, [v5 unsignedIntegerValue]);
    }
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyConfigurationType"])xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, objc_msgSend(v5, "unsignedIntegerValue")); {
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyMaxCount"])
    }
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, [v5 unsignedIntegerValue]);
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionOptionsEnum"]) {
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, [v5 unsignedIntegerValue]);
    }
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier"])xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), v8, (const char *)objc_msgSend(v5, "UTF8String")); {
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest"])xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), v8, objc_msgSend(v5, "BOOLValue"));
    }
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionFocusUUID"])
    {
      uint64_t v11 = *(void **)(a1 + 40);
      id v12 = [v5 UUIDString];
      xpc_dictionary_set_string(v11, v8, (const char *)[v12 UTF8String]);
    }
  }
}

+ (id)contaminateRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = [a1 validOptions];
  xpc_object_t v6 = objc_opt_new();
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __54__PRSPosterSnapshotRequest_contaminateRequestOptions___block_invoke;
  applier[3] = &unk_1E5D00FF0;
  id v13 = v5;
  id v14 = v6;
  id v15 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = v5;
  xpc_dictionary_apply(v7, applier);
  double v10 = (void *)[v8 copy];

  return v10;
}

uint64_t __54__PRSPosterSnapshotRequest_contaminateRequestOptions___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  xpc_object_t v6 = (void *)MEMORY[0x1AD0D2CA0]();
  id v7 = [NSString stringWithUTF8String:a2];
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"])
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 48), a2));
    }
    else if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyVariant"] {
           || [v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyConfigurationType"]|| objc_msgSend(v7, "isEqualToString:", @"PRSPosterSnapshotRequestOptionLegacyMaxCount")|| objc_msgSend(v7, "isEqualToString:", @"PRSPosterSnapshotRequestOptionOptionsEnum"))
    }
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 48), a2));
    }
    else if ([v7 isEqualToString:@"PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier"])
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), a2));
    }
    else
    {
      if (![v7 isEqualToString:@"PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest"])
      {
        if (![v7 isEqualToString:@"PRSPosterSnapshotRequestOptionFocusUUID"]) {
          goto LABEL_11;
        }
        id v12 = *(void **)(a1 + 40);
        id v13 = objc_alloc(MEMORY[0x1E4F29128]);
        double v10 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), a2));
        id v14 = (void *)[v13 initWithUUIDString:v10];
        [v12 setObject:v14 forKey:v7];

        goto LABEL_10;
      }
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 48), a2));
    }
    double v10 = (void *)v9;
    [v8 setObject:v9 forKey:v7];
LABEL_10:
  }
LABEL_11:

  return 1;
}

- (void)setImageScaleRelativeToScreen:(double)a3
{
  self->_imageScaleRelativeToScreen = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (NSDictionary)requestOptions
{
  return self->_requestOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithDescriptor:variantType:options:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:variantType:options:orientation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:requestOptions:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPath:requestOptions:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithFocusPosterRequest:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_validateRequestOptionsOrAbort:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_validateRequestOptionsOrAbort:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_validateRequestOptionsOrAbort:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_validateRequestOptionsOrAbort:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_validateRequestOptionsOrAbort:.cold.5()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_validateRequestOptionsOrAbort:.cold.6()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_validateRequestOptionsOrAbort:.cold.7()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end