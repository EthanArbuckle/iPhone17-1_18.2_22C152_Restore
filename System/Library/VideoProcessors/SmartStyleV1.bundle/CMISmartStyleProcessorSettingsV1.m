@interface CMISmartStyleProcessorSettingsV1
+ (id)sharedInstance;
+ (id)tuningParametersForVariant:(unint64_t)a3;
- (id)tuningParametersForVariant:(uint64_t)a1;
- (uint64_t)loadTuningParameters;
- (void)initLoadingSmartStyleProcessorSettings;
@end

@implementation CMISmartStyleProcessorSettingsV1

+ (id)sharedInstance
{
  self;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v0 = (void *)sharedInstance_instance;

  return v0;
}

void __50__CMISmartStyleProcessorSettingsV1_sharedInstance__block_invoke(id a1)
{
  sharedInstance_instance = (uint64_t)-[CMISmartStyleProcessorSettingsV1 initLoadingSmartStyleProcessorSettings]([CMISmartStyleProcessorSettingsV1 alloc]);

  _objc_release_x1();
}

- (void)initLoadingSmartStyleProcessorSettings
{
  if (!a1) {
    return 0;
  }
  v4.receiver = a1;
  v4.super_class = (Class)CMISmartStyleProcessorSettingsV1;
  id v1 = objc_msgSendSuper2(&v4, "init");
  v2 = v1;
  if (!v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v2;
  }
  if ((-[CMISmartStyleProcessorSettingsV1 loadTuningParameters]((uint64_t)v1) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v2;
}

+ (id)tuningParametersForVariant:(unint64_t)a3
{
  objc_super v4 = +[CMISmartStyleProcessorSettingsV1 sharedInstance]();
  v5 = -[CMISmartStyleProcessorSettingsV1 tuningParametersForVariant:]((uint64_t)v4, a3);

  return v5;
}

- (id)tuningParametersForVariant:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    v3 = +[NSNumber numberWithUnsignedInteger:a2];
    objc_super v4 = [v2 objectForKeyedSubscript:v3];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (uint64_t)loadTuningParameters
{
  if (!a1) {
    return 0;
  }
  char v27 = 0;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = v2;
  if (!v2
    || ([v2 pathForResource:@"SmartStyleProcessorV1-Tuning" ofType:@"plist"],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        +[NSDictionary dictionaryWithContentsOfFile:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_26:
    uint64_t v6 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"SmartStyleProcessorV1"];
  if (v6)
  {
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend((id)v6, "count"));
    if (v22)
    {
      v20 = v5;
      v21 = v3;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = (id)v6;
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v24;
LABEL_8:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
          v13 = [v7 objectForKeyedSubscript:v12];
          v14 = [&off_18840 objectForKeyedSubscript:v12];
          if (!v14) {
            break;
          }
          v15 = objc_alloc_init(CMISmartStyleProcessorTuningV1);
          if (!v15) {
            break;
          }
          v16 = v15;
          objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"PersonMaskDilatedMaskVal", &v27, 0.0);
          -[CMISmartStyleProcessorTuningV1 setPersonMaskDilatedMaskVal:](v16, "setPersonMaskDilatedMaskVal:");
          if (!v27)
          {
            fig_log_get_emitter();
            FigDebugAssert3();

            goto LABEL_19;
          }
          [v22 setObject:v16 forKeyedSubscript:v14];

          if (v9 == (id)++v11)
          {
            id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
            if (v9) {
              goto LABEL_8;
            }
            goto LABEL_16;
          }
        }
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_19:

        uint64_t v6 = v27 != 0;
        goto LABEL_20;
      }
LABEL_16:

      v17 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v22;
      id v18 = v22;

      uint64_t v6 = 1;
      char v27 = 1;

LABEL_20:
      v3 = v21;
      goto LABEL_21;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_26;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

LABEL_21:
  return v6;
}

- (void).cxx_destruct
{
}

@end