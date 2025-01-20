@interface RERelevanceEngineConfiguration
+ (id)_defaultModelFileURL;
+ (id)defaultConfiguration;
+ (id)defaultUpNextConfiguration;
+ (id)sampleUpNextConfiguration;
- (BOOL)allowsDiagnosticExtension;
- (BOOL)allowsRemoteTraining;
- (BOOL)allowsUpdatingModelFile;
- (BOOL)disableAutomaticContentManagement;
- (BOOL)ignoreDeviceLockState;
- (BOOL)ignoresInstalledApplications;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsBackup;
- (BOOL)wantsImmutableContent;
- (NSArray)interactionDescriptors;
- (NSArray)sectionDescriptors;
- (NSArray)whitelistedDataSourceClassNames;
- (NSString)preferenceDomain;
- (NSURL)baseModelFileURL;
- (NSURL)modelFileURL;
- (OS_dispatch_queue)engineQueue;
- (OS_dispatch_queue)observerQueue;
- (REDataSourceLoader)dataSourceLoader;
- (REFeatureSet)primaryFeatures;
- (RELocationManager)locationManager;
- (RERelevanceEngineConfiguration)init;
- (RERelevanceEngineConfiguration)initWithDictionary:(id)a3;
- (RERelevanceEngineMetricsRecorder)metricsRecorder;
- (RERelevanceProviderManagerLoader)relevanceProviderManagerLoader;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3 ofClass:(Class)a4 defaultValue:(id)a5;
- (unint64_t)hash;
- (unint64_t)modelStorageBehavior;
- (unint64_t)modelVersion;
- (unint64_t)trainingBehavior;
- (void)setValue:(id)a3 forKey:(id)a4 ofClass:(Class)a5;
@end

@implementation RERelevanceEngineConfiguration

void __53__RERelevanceEngineConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (objc_class *)MEMORY[0x263EFF980];
LABEL_5:
    id v7 = (id)[[v6 alloc] initWithArray:v10 copyItems:1];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (objc_class *)MEMORY[0x263EFF8C0];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)MEMORY[0x263EFF9A0];
LABEL_10:
    id v7 = (id)[[v8 alloc] initWithDictionary:v10 copyItems:1];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)NSDictionary;
    goto LABEL_10;
  }
  if ([v10 conformsToProtocol:&unk_26CFCE740]) {
    id v7 = (id)[v10 copy];
  }
  else {
    id v7 = v10;
  }
LABEL_11:
  v9 = v7;

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v9 forKeyedSubscript:v5];
}

- (BOOL)wantsImmutableContent
{
  v3 = NSStringFromSelector(sel_wantsImmutableContent);
  v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA80]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSArray)interactionDescriptors
{
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  v4 = NSStringFromSelector(sel_interactionDescriptors);
  char v5 = [(RERelevanceEngineConfiguration *)self valueForKey:v4 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA68]];
  v6 = (void *)[v3 initWithArray:v5 copyItems:1];

  return (NSArray *)v6;
}

- (NSArray)sectionDescriptors
{
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  v4 = NSStringFromSelector(sel_sectionDescriptors);
  char v5 = [(RERelevanceEngineConfiguration *)self valueForKey:v4 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA68]];
  v6 = (void *)[v3 initWithArray:v5 copyItems:1];

  return (NSArray *)v6;
}

- (id)valueForKey:(id)a3 ofClass:(Class)a4 defaultValue:(id)a5
{
  id v8 = a5;
  v9 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:a3];
  if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = v8;
  }
  id v11 = v10;

  return v11;
}

- (REFeatureSet)primaryFeatures
{
  id v3 = NSStringFromSelector(sel_primaryFeatures);
  uint64_t v4 = objc_opt_class();
  char v5 = +[REFeatureSet featureSet];
  v6 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:v4 defaultValue:v5];

  return (REFeatureSet *)v6;
}

- (OS_dispatch_queue)observerQueue
{
  id v3 = NSStringFromSelector(sel_observerQueue);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:0 defaultValue:MEMORY[0x263EF83A0]];

  return (OS_dispatch_queue *)v4;
}

- (void)setValue:(id)a3 forKey:(id)a4 ofClass:(Class)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v12 = 0;
  }
  if (setValue_forKey_ofClass__onceToken != -1) {
    dispatch_once(&setValue_forKey_ofClass__onceToken, &__block_literal_global_179);
  }
  v9 = [(id)setValue_forKey_ofClass__EmptyConfig valueForKey:v8];
  int v10 = [v9 isEqual:v12];

  if (v10)
  {

    id v11 = 0;
  }
  else
  {
    id v11 = v12;
  }
  id v13 = v11;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedDataSourceClassNames, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (RERelevanceProviderManagerLoader)relevanceProviderManagerLoader
{
  id v3 = NSStringFromSelector(sel_relevanceProviderManagerLoader);
  uint64_t v4 = objc_opt_class();
  char v5 = +[RERelevanceProviderManagerLoader disabledRelevanceProviderManagerLoader];
  v6 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:v4 defaultValue:v5];

  return (RERelevanceProviderManagerLoader *)v6;
}

- (unint64_t)modelVersion
{
  id v3 = NSStringFromSelector(sel_modelVersion);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:&unk_26CFCD218];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (unint64_t)trainingBehavior
{
  id v3 = NSStringFromSelector(sel_trainingBehavior);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:&unk_26CFCD230];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (RERelevanceEngineConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RERelevanceEngineConfiguration;
  unint64_t v5 = [(RERelevanceEngineConfiguration *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    values = v5->_values;
    v5->_values = (NSMutableDictionary *)v6;

    id v8 = [MEMORY[0x263EFF980] array];
    v9 = v5->_values;
    int v10 = NSStringFromSelector(sel_sectionDescriptors);
    [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];

    id v11 = [MEMORY[0x263EFF980] array];
    id v12 = v5->_values;
    id v13 = NSStringFromSelector(sel_interactionDescriptors);
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    v14 = [(id)objc_opt_class() _defaultModelFileURL];
    v15 = v5->_values;
    v16 = NSStringFromSelector(sel_baseModelFileURL);
    [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__RERelevanceEngineConfiguration_initWithDictionary___block_invoke;
    v18[3] = &unk_2644BC4E8;
    v19 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v18];
  }
  return v5;
}

+ (id)_defaultModelFileURL
{
  v2 = NSHomeDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"Library/RelevanceEngine/Model/model.mdl"];

  id v4 = [NSURL fileURLWithPath:v3];

  return v4;
}

- (REDataSourceLoader)dataSourceLoader
{
  id v3 = NSStringFromSelector(sel_dataSourceLoader);
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = +[REDataSourceLoader defaultDataSourceLoader];
  uint64_t v6 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:v4 defaultValue:v5];

  return (REDataSourceLoader *)v6;
}

+ (id)defaultConfiguration
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(REInteractionDescriptor);
  [(REInteractionDescriptor *)v2 setName:@"tap"];
  id v3 = NSStringFromSelector(sel_sectionDescriptors);
  v12[0] = v3;
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  unint64_t v5 = +[RESectionDescriptor defaultSectionDescriptorForIdentifier:@"defaultSectionIdentifier"];
  uint64_t v6 = [v4 arrayWithObject:v5];
  v13[0] = v6;
  id v7 = NSStringFromSelector(sel_interactionDescriptors);
  v12[1] = v7;
  id v8 = [MEMORY[0x263EFF980] arrayWithObject:v2];
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  int v10 = [[RERelevanceEngineConfiguration alloc] initWithDictionary:v9];
  return v10;
}

void __67__RERelevanceEngineConfiguration_disableAutomaticContentManagement__block_invoke()
{
  id v1 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v1 processName];
  disableAutomaticContentManagement_isHealthProcess = [v0 isEqual:@"com.apple.healthappd"];
}

uint64_t __58__RERelevanceEngineConfiguration_setValue_forKey_ofClass___block_invoke()
{
  setValue_forKey_ofClass__EmptyConfig = [[RERelevanceEngineConfiguration alloc] initWithDictionary:0];
  return MEMORY[0x270F9A758]();
}

- (NSString)preferenceDomain
{
  id v3 = NSStringFromSelector(sel_preferenceDomain);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:0];

  return (NSString *)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [REMutableRelevanceEngineConfiguration alloc];
  values = self->_values;
  return [(RERelevanceEngineConfiguration *)v4 initWithDictionary:values];
}

- (unint64_t)modelStorageBehavior
{
  id v3 = NSStringFromSelector(sel_modelStorageBehavior);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:&unk_26CFCD248];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (NSURL)modelFileURL
{
  id v3 = NSStringFromSelector(sel_modelFileURL);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:0];

  return (NSURL *)v4;
}

- (RERelevanceEngineMetricsRecorder)metricsRecorder
{
  id v3 = NSStringFromSelector(sel_metricsRecorder);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:0 defaultValue:0];

  return (RERelevanceEngineMetricsRecorder *)v4;
}

- (RELocationManager)locationManager
{
  id v3 = NSStringFromSelector(sel_locationManager);
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = +[RELocationManager simulatedLocationManager];
  uint64_t v6 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:v4 defaultValue:v5];

  return (RELocationManager *)v6;
}

- (BOOL)ignoresInstalledApplications
{
  id v3 = NSStringFromSelector(sel_ignoresInstalledApplications);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA80]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)ignoreDeviceLockState
{
  id v3 = NSStringFromSelector(sel_ignoreDeviceLockState);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA80]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (OS_dispatch_queue)engineQueue
{
  id v3 = NSStringFromSelector(sel_engineQueue);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:0 defaultValue:0];

  return (OS_dispatch_queue *)v4;
}

- (BOOL)disableAutomaticContentManagement
{
  if (disableAutomaticContentManagement_onceToken != -1) {
    dispatch_once(&disableAutomaticContentManagement_onceToken, &__block_literal_global_236);
  }
  if (disableAutomaticContentManagement_isHealthProcess) {
    return 1;
  }
  uint64_t v4 = NSStringFromSelector(sel_disableAutomaticContentManagement);
  char v5 = [(RERelevanceEngineConfiguration *)self valueForKey:v4 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA80]];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (NSURL)baseModelFileURL
{
  id v3 = NSStringFromSelector(sel_baseModelFileURL);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:0];

  return (NSURL *)v4;
}

- (BOOL)allowsRemoteTraining
{
  id v3 = NSStringFromSelector(sel_allowsRemoteTraining);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA80]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)allowsDiagnosticExtension
{
  id v3 = NSStringFromSelector(sel_allowsDiagnosticExtension);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA80]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (RERelevanceEngineConfiguration)init
{
  return [(RERelevanceEngineConfiguration *)self initWithDictionary:0];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RERelevanceEngineConfiguration *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      values = self->_values;
      char v6 = v4->_values;
      id v7 = values;
      id v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSMutableDictionary *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_values hash];
}

- (id)description
{
  return [(RERelevanceEngineConfiguration *)self descriptionWithIndent:0];
}

- (BOOL)allowsUpdatingModelFile
{
  id v3 = NSStringFromSelector(sel_allowsUpdatingModelFile);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA88]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)wantsBackup
{
  id v3 = NSStringFromSelector(sel_wantsBackup);
  uint64_t v4 = [(RERelevanceEngineConfiguration *)self valueForKey:v3 ofClass:objc_opt_class() defaultValue:MEMORY[0x263EFFA80]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSArray)whitelistedDataSourceClassNames
{
  return self->_whitelistedDataSourceClassNames;
}

+ (id)defaultUpNextConfiguration
{
  if (defaultUpNextConfiguration_onceToken != -1) {
    dispatch_once(&defaultUpNextConfiguration_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)defaultUpNextConfiguration_defaultConfiguration;
  return v2;
}

void __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke()
{
  v378[1] = *MEMORY[0x263EF8340];
  v0 = NSHomeDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"Library/RelevanceEngine/Model"];

  v2 = [MEMORY[0x263F08850] defaultManager];
  [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:0];

  v237 = v1;
  v229 = [v1 stringByAppendingPathComponent:@"model.mdl"];
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:@"allDaySectionIdentifier"];
  [v3 addObject:v4];

  char v5 = +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:@"defaultSectionIdentifier"];
  [v3 addObject:v5];

  char v6 = +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:@"tomorrowSectionIdentifier"];
  [v3 addObject:v6];

  id v7 = +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:@"upcomingSectionIdentifier"];
  v231 = v3;
  [v3 addObject:v7];

  id v8 = [MEMORY[0x263EFF980] array];
  char v9 = objc_alloc_init(REInteractionDescriptor);
  [(REInteractionDescriptor *)v9 setName:@"tap"];
  LODWORD(v10) = 4.0;
  [(REInteractionDescriptor *)v9 setWeight:v10];
  v236 = v9;
  [v8 addObject:v9];
  id v11 = objc_alloc_init(REInteractionDescriptor);
  [(REInteractionDescriptor *)v11 setName:@"app-action"];
  LODWORD(v12) = 1.5;
  [(REInteractionDescriptor *)v11 setWeight:v12];
  [(REInteractionDescriptor *)v11 setEnableExploreExploit:0];
  id v13 = +[REFeature dataSourceFeature];
  [(REInteractionDescriptor *)v11 setIdentificationFeature:v13];

  v235 = v11;
  [v8 addObject:v11];
  v14 = objc_alloc_init(REInteractionDescriptor);
  [(REInteractionDescriptor *)v14 setName:@"action"];
  LODWORD(v15) = 1.0;
  [(REInteractionDescriptor *)v14 setWeight:v15];
  [(REInteractionDescriptor *)v14 setEnableExploreExploit:0];
  v16 = +[REFeature dataSourceFeature];
  [(REInteractionDescriptor *)v14 setIdentificationFeature:v16];

  v232 = v8;
  v234 = v14;
  [v8 addObject:v14];
  v17 = +[REFeatureTransformer hashTransform];
  v18 = +[REFeature dataSourceFeature];
  v378[0] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v378 count:1];
  objc_super v20 = +[REFeature transformedFeatureWithTransformer:v17 features:v19];

  v21 = +[REFeatureTransformer maskTransformWithWidth:9];
  v377 = v20;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v377 count:1];
  v304 = +[REFeature transformedFeatureWithTransformer:v21 features:v22];

  v23 = +[REFeatureTransformer maskTransformWithWidth:9];
  v24 = +[REFeature itemIdentifierFeature];
  v376 = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v376 count:1];
  v26 = +[REFeature transformedFeatureWithTransformer:v23 features:v25];

  v375[0] = v304;
  v375[1] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v375 count:2];
  v303 = +[REFeature crossedFeatureWithFeatures:v27];

  v28 = +[REFeatureValue featureValueWithDouble:0.0];
  v29 = +[REFeatureValue featureValueWithDouble:1.0];
  uint64_t v30 = +[REFeatureTransformer bucketTransformerWithCount:10 minValue:v28 maxValue:v29];

  v31 = +[REFeatureValue featureValueWithDouble:0.0];
  v32 = +[REFeatureValue featureValueWithDouble:1.0];
  uint64_t v33 = +[REFeatureTransformer bucketTransformerWithCount:25 minValue:v31 maxValue:v32];

  v34 = +[REFeature dateFeature];
  v374 = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v374 count:1];
  v233 = (void *)v33;
  v301 = +[REFeature transformedFeatureWithTransformer:v33 features:v35];

  v36 = +[REFeature locationFeature];
  v373 = v36;
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v373 count:1];
  v300 = +[REFeature transformedFeatureWithTransformer:v30 features:v37];

  v38 = +[REFeature geofenceFeature];
  v372 = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v372 count:1];
  v299 = +[REFeature transformedFeatureWithTransformer:v30 features:v39];

  v40 = +[REFeature priorityFeature];
  v371 = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v371 count:1];
  v302 = (void *)v30;
  v298 = +[REFeature transformedFeatureWithTransformer:v30 features:v41];

  v42 = +[REFeatureTransformer hashTransform];
  v43 = +[REFeature locationOfInterestFeature];
  v370 = v43;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v370 count:1];
  uint64_t v45 = +[REFeature transformedFeatureWithTransformer:v42 features:v44];

  v46 = +[REFeatureTransformer maskTransformWithWidth:9];
  v230 = (void *)v45;
  uint64_t v369 = v45;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v369 count:1];
  v297 = +[REFeature transformedFeatureWithTransformer:v46 features:v47];

  v48 = +[REFeatureTransformer maskTransformWithWidth:5];
  v49 = +[REFeature knownLocationOfInterestFeature];
  v368 = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v368 count:1];
  v296 = +[REFeature transformedFeatureWithTransformer:v48 features:v50];

  v51 = +[REFeature appUsageFeature];
  v367 = v51;
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v367 count:1];
  v295 = +[REFeature transformedFeatureWithTransformer:v30 features:v52];

  v53 = +[REFeatureValue featureValueWithDouble:0.0];
  v54 = +[REFeatureValue featureValueWithDouble:1.0];
  v55 = +[REFeatureTransformer bucketTransformerWithCount:24 minValue:v53 maxValue:v54];
  v56 = +[REFeature currentTimeFeature];
  v366 = v56;
  v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v366 count:1];
  v294 = +[REFeature transformedFeatureWithTransformer:v55 features:v57];

  v58 = +[REFeatureValue featureValueWithDouble:0.0];
  v59 = +[REFeatureValue featureValueWithDouble:1.0];
  v60 = +[REFeatureTransformer bucketTransformerWithCount:8 minValue:v58 maxValue:v59];
  v61 = +[REFeature currentTimeFeature];
  v365 = v61;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v365 count:1];
  v293 = +[REFeature transformedFeatureWithTransformer:v60 features:v62];

  v63 = +[REFeatureValue featureValueWithDouble:0.0];
  v64 = +[REFeatureValue featureValueWithDouble:1.0];
  v65 = +[REFeatureTransformer bucketTransformerWithCount:2 minValue:v63 maxValue:v64];
  v66 = +[REFeature currentTimeFeature];
  v364 = v66;
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v364 count:1];
  v292 = +[REFeature transformedFeatureWithTransformer:v65 features:v67];

  v68 = +[REFeatureTransformer maskTransformWithWidth:3];
  v69 = +[REFeature dayOfWeekFeature];
  v363 = v69;
  v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v363 count:1];
  v291 = +[REFeature transformedFeatureWithTransformer:v68 features:v70];

  v71 = +[REFeatureTransformer maskTransformWithWidth:1];
  v72 = +[REFeature isWeekendFeature];
  v362 = v72;
  v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v362 count:1];
  v290 = +[REFeature transformedFeatureWithTransformer:v71 features:v73];

  v361[0] = v304;
  v361[1] = v301;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v361 count:2];
  v289 = +[REFeature crossedFeatureWithFeatures:v74];

  v360[0] = v304;
  v360[1] = v300;
  v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v360 count:2];
  v288 = +[REFeature crossedFeatureWithFeatures:v75];

  v359[0] = v304;
  v359[1] = v299;
  v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v359 count:2];
  v287 = +[REFeature crossedFeatureWithFeatures:v76];

  v358[0] = v304;
  v358[1] = v298;
  v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v358 count:2];
  v286 = +[REFeature crossedFeatureWithFeatures:v77];

  v357[0] = v303;
  v357[1] = v301;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v357 count:2];
  v285 = +[REFeature crossedFeatureWithFeatures:v78];

  v356[0] = v303;
  v356[1] = v300;
  v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v356 count:2];
  v284 = +[REFeature crossedFeatureWithFeatures:v79];

  v355[0] = v303;
  v355[1] = v299;
  v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v355 count:2];
  v283 = +[REFeature crossedFeatureWithFeatures:v80];

  v354[0] = v303;
  v354[1] = v298;
  v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v354 count:2];
  v282 = +[REFeature crossedFeatureWithFeatures:v81];

  v353[0] = v304;
  v353[1] = v295;
  v82 = [MEMORY[0x263EFF8C0] arrayWithObjects:v353 count:2];
  v281 = +[REFeature crossedFeatureWithFeatures:v82];

  v352[0] = v304;
  v352[1] = v294;
  v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v352 count:2];
  v280 = +[REFeature crossedFeatureWithFeatures:v83];

  v351[0] = v304;
  v351[1] = v293;
  v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:v351 count:2];
  v279 = +[REFeature crossedFeatureWithFeatures:v84];

  v350[0] = v304;
  v350[1] = v292;
  v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v350 count:2];
  v278 = +[REFeature crossedFeatureWithFeatures:v85];

  v349[0] = v304;
  v349[1] = v291;
  v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v349 count:2];
  v277 = +[REFeature crossedFeatureWithFeatures:v86];

  v348[0] = v304;
  v348[1] = v290;
  v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:v348 count:2];
  v276 = +[REFeature crossedFeatureWithFeatures:v87];

  v347[0] = v303;
  v347[1] = v294;
  v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v347 count:2];
  v275 = +[REFeature crossedFeatureWithFeatures:v88];

  v346[0] = v303;
  v346[1] = v293;
  v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:v346 count:2];
  v274 = +[REFeature crossedFeatureWithFeatures:v89];

  v345[0] = v303;
  v345[1] = v292;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v345 count:2];
  v273 = +[REFeature crossedFeatureWithFeatures:v90];

  v344[0] = v303;
  v344[1] = v291;
  v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v344 count:2];
  v272 = +[REFeature crossedFeatureWithFeatures:v91];

  v343[0] = v303;
  v343[1] = v290;
  v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v343 count:2];
  v271 = +[REFeature crossedFeatureWithFeatures:v92];

  v342[0] = v304;
  v342[1] = v297;
  v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v342 count:2];
  v270 = +[REFeature crossedFeatureWithFeatures:v93];

  v341[0] = v304;
  v341[1] = v296;
  v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:v341 count:2];
  v269 = +[REFeature crossedFeatureWithFeatures:v94];

  v340[0] = v303;
  v340[1] = v297;
  v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v340 count:2];
  v268 = +[REFeature crossedFeatureWithFeatures:v95];

  v339[0] = v303;
  v339[1] = v296;
  v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:v339 count:2];
  v267 = +[REFeature crossedFeatureWithFeatures:v96];

  v97 = +[REFeature recentSiriActionFeature];
  v338 = v97;
  v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v338 count:1];
  v266 = +[REFeature transformedFeatureWithTransformer:v302 features:v98];

  v99 = +[REFeatureValue featureValueWithDouble:0.5];
  v100 = +[REFeatureTransformer binaryTransformerWithThreshold:v99];
  v101 = +[REFeature siriActionDailyAveragePerformedCountFeature];
  v337 = v101;
  v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v337 count:1];
  v265 = +[REFeature transformedFeatureWithTransformer:v100 features:v102];

  v103 = +[REFeatureTransformer customCategoricalTransformerWithName:@"multipleBy7" block:&__block_literal_global_43_1];
  v104 = +[REFeature siriActionDailyAveragePerformedCountFeature];
  v336 = v104;
  v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v336 count:1];
  v106 = +[REFeature transformedFeatureWithTransformer:v103 features:v105];

  v107 = +[REFeatureTransformer maskTransformWithWidth:5];
  v335 = v106;
  v108 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v335 count:1];
  v264 = +[REFeature transformedFeatureWithTransformer:v107 features:v108];

  v334[0] = v264;
  v334[1] = v304;
  v109 = [MEMORY[0x263EFF8C0] arrayWithObjects:v334 count:2];
  v263 = +[REFeature crossedFeatureWithFeatures:v109];

  v110 = +[REFeatureTransformer bucketTransformerWithBitWidth:3];
  v111 = +[REFeature siriActionPerformedCountFeature];
  v333 = v111;
  v112 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v333 count:1];
  v262 = +[REFeature transformedFeatureWithTransformer:v110 features:v112];

  v332[0] = v262;
  v332[1] = v304;
  v113 = [MEMORY[0x263EFF8C0] arrayWithObjects:v332 count:2];
  v261 = +[REFeature crossedFeatureWithFeatures:v113];

  v114 = +[REFeatureTransformer customCategoricalTransformerWithName:@"moreThanDailyAverage" featureCount:2 transformation:&__block_literal_global_49];
  v115 = +[REFeature siriActionPerformedCountFeature];
  v331[0] = v115;
  v116 = +[REFeature siriActionDailyAveragePerformedCountFeature];
  v331[1] = v116;
  v117 = [MEMORY[0x263EFF8C0] arrayWithObjects:v331 count:2];
  v118 = +[REFeature transformedFeatureWithTransformer:v114 features:v117];

  v119 = +[REFeatureTransformer maskTransformWithWidth:1];
  v260 = [v118 featureByUsingTransformer:v119];

  v330[0] = v260;
  v330[1] = v304;
  v120 = [MEMORY[0x263EFF8C0] arrayWithObjects:v330 count:2];
  v259 = +[REFeature crossedFeatureWithFeatures:v120];

  v258 = +[REFeature currentlyPlayingFromAppFeature];
  v329[0] = v258;
  v329[1] = v304;
  v121 = [MEMORY[0x263EFF8C0] arrayWithObjects:v329 count:2];
  v257 = +[REFeature crossedFeatureWithFeatures:v121];

  v256 = +[REFeature activeWorkoutFeature];
  v328[0] = v256;
  v328[1] = v304;
  v122 = [MEMORY[0x263EFF8C0] arrayWithObjects:v328 count:2];
  v255 = +[REFeature crossedFeatureWithFeatures:v122];

  v123 = +[REFeatureValue featureValueWithDouble:0.0];
  v124 = +[REFeatureValue featureValueWithDouble:3.0];
  uint64_t v125 = +[REFeatureTransformer bucketTransformerWithCount:18 minValue:v123 maxValue:v124];

  v126 = +[REFeature activeEnergyCompletionFeature];
  v254 = [v126 featureByUsingTransformer:v125];

  v127 = +[REFeature exerciseTimeCompletionFeature];
  v253 = [v127 featureByUsingTransformer:v125];

  v128 = +[REFeature standHourCompletionFeature];
  v228 = (void *)v125;
  v252 = [v128 featureByUsingTransformer:v125];

  v327[0] = v254;
  v327[1] = v304;
  v129 = [MEMORY[0x263EFF8C0] arrayWithObjects:v327 count:2];
  v251 = +[REFeature crossedFeatureWithFeatures:v129];

  uint64_t v130 = +[REFeatureTransformer customCategoricalTransformerWithName:@"ringClosed" featureCount:1 transformation:&__block_literal_global_54];
  v131 = +[REFeature activeEnergyCompletionFeature];
  v132 = [v131 featureByUsingTransformer:v130];
  v133 = +[REFeatureTransformer maskTransformWithWidth:1];
  v250 = [v132 featureByUsingTransformer:v133];

  v134 = +[REFeature exerciseTimeCompletionFeature];
  v135 = [v134 featureByUsingTransformer:v130];
  v136 = +[REFeatureTransformer maskTransformWithWidth:1];
  v249 = [v135 featureByUsingTransformer:v136];

  v137 = +[REFeature standHourCompletionFeature];
  v227 = (void *)v130;
  v138 = [v137 featureByUsingTransformer:v130];
  v139 = +[REFeatureTransformer maskTransformWithWidth:1];
  v248 = [v138 featureByUsingTransformer:v139];

  v326[0] = v250;
  v326[1] = v304;
  v140 = [MEMORY[0x263EFF8C0] arrayWithObjects:v326 count:2];
  v247 = +[REFeature crossedFeatureWithFeatures:v140];

  v141 = +[REFeatureTransformer customCategoricalTransformerWithName:@"allRingsClosed" featureCount:3 transformation:&__block_literal_global_59_0];
  v142 = +[REFeature activeEnergyCompletionFeature];
  v325[0] = v142;
  v143 = +[REFeature exerciseTimeCompletionFeature];
  v325[1] = v143;
  v144 = +[REFeature standHourCompletionFeature];
  v325[2] = v144;
  v145 = [MEMORY[0x263EFF8C0] arrayWithObjects:v325 count:3];
  v146 = +[REFeature transformedFeatureWithTransformer:v141 features:v145];

  v147 = +[REFeatureTransformer maskTransformWithWidth:1];
  v246 = [v146 featureByUsingTransformer:v147];

  v324[0] = v246;
  v324[1] = v304;
  v148 = [MEMORY[0x263EFF8C0] arrayWithObjects:v324 count:2];
  v245 = +[REFeature crossedFeatureWithFeatures:v148];

  v149 = +[REFeatureTransformer customCategoricalTransformerWithName:@"multipleBy7" block:&__block_literal_global_61];
  v150 = +[REFeature dailyAverageWorkoutCountFeature];
  v323 = v150;
  v151 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v323 count:1];
  v152 = +[REFeature transformedFeatureWithTransformer:v149 features:v151];

  v153 = +[REFeatureTransformer maskTransformWithWidth:3];
  v322 = v152;
  v154 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v322 count:1];
  v244 = +[REFeature transformedFeatureWithTransformer:v153 features:v154];

  v321[0] = v244;
  v321[1] = v304;
  v155 = [MEMORY[0x263EFF8C0] arrayWithObjects:v321 count:2];
  v243 = +[REFeature crossedFeatureWithFeatures:v155];

  v156 = +[REFeatureTransformer bucketTransformerWithBitWidth:3];
  v157 = +[REFeature performedWorkoutCountFeature];
  v320 = v157;
  v158 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v320 count:1];
  v242 = +[REFeature transformedFeatureWithTransformer:v156 features:v158];

  v319[0] = v242;
  v319[1] = v304;
  v159 = [MEMORY[0x263EFF8C0] arrayWithObjects:v319 count:2];
  v241 = +[REFeature crossedFeatureWithFeatures:v159];

  v160 = +[REFeatureValue featureValueWithDouble:0.0];
  v161 = +[REFeatureValue featureValueWithDouble:1.0];
  uint64_t v162 = +[REFeatureTransformer bucketTransformerWithCount:15 minValue:v160 maxValue:v161];

  v163 = +[REFeature sentimentAnalysisFeature];
  v318 = v163;
  v164 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v318 count:1];
  uint64_t v165 = +[REFeature transformedFeatureWithTransformer:v162 features:v164];

  v166 = +[REFeature negativeSentimentAnalysisFeature];
  v317 = v166;
  v167 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v317 count:1];
  uint64_t v168 = +[REFeature transformedFeatureWithTransformer:v162 features:v167];

  v169 = +[REFeature sentimentAnalysisCertaintyFeature];
  v316 = v169;
  v170 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v316 count:1];
  v226 = (void *)v162;
  uint64_t v171 = +[REFeature transformedFeatureWithTransformer:v162 features:v170];

  v172 = +[REFeature coreBehaviorTimePredictionFeature];
  v240 = [v172 featureByUsingTransformer:v302];

  v173 = +[REFeature coreBehaviorTimeCoarsePredictionFeature];
  v239 = [v173 featureByUsingTransformer:v302];

  v174 = +[REFeature coreBehaviorDayPredictionFeature];
  v238 = [v174 featureByUsingTransformer:v302];

  v175 = +[REFeature coreBehaviorDayCoarsePredictionFeature];
  uint64_t v176 = [v175 featureByUsingTransformer:v302];

  v177 = +[REFeature coreBehaviorLocationPredictionFeature];
  uint64_t v178 = [v177 featureByUsingTransformer:v302];

  v179 = +[REFeature coreBehaviorLocationCoarsePredictionFeature];
  uint64_t v180 = [v179 featureByUsingTransformer:v302];

  v216 = [REFeatureSet alloc];
  v315[0] = v304;
  v315[1] = v303;
  v315[2] = v301;
  v315[3] = v300;
  v315[4] = v299;
  v315[5] = v298;
  v315[6] = v297;
  v315[7] = v296;
  v315[8] = v289;
  v315[9] = v288;
  v315[10] = v287;
  v315[11] = v286;
  v315[12] = v285;
  v315[13] = v284;
  v315[14] = v283;
  v315[15] = v282;
  v219 = +[REFeature interactionFeature];
  v315[16] = v219;
  v218 = +[REFeature noContentFeature];
  v315[17] = v218;
  v217 = +[REFeature conditionalFeature];
  v315[18] = v217;
  v315[19] = v294;
  v315[20] = v293;
  v315[21] = v292;
  v315[22] = v291;
  v315[23] = v290;
  v315[24] = v280;
  v315[25] = v279;
  v315[26] = v278;
  v315[27] = v277;
  v315[28] = v276;
  v315[29] = v275;
  v315[30] = v274;
  v315[31] = v273;
  v315[32] = v272;
  v315[33] = v271;
  v315[34] = v270;
  v315[35] = v269;
  v315[36] = v268;
  v315[37] = v267;
  v315[38] = v295;
  v315[39] = v281;
  v215 = +[REFeature siriDomainFeature];
  v315[40] = v215;
  v214 = +[REFeature dailyRoutineFeature];
  v315[41] = v214;
  v213 = +[REFeature isInDailyRoutineFeature];
  v315[42] = v213;
  v212 = +[REFeature sessionFeature];
  v315[43] = v212;
  v315[44] = v266;
  v315[45] = v265;
  v315[46] = v264;
  v315[47] = v262;
  v315[48] = v260;
  v315[49] = v263;
  v315[50] = v261;
  v315[51] = v259;
  v224 = (void *)v168;
  v225 = (void *)v165;
  v315[52] = v165;
  v315[53] = v168;
  v223 = (void *)v171;
  v315[54] = v171;
  v211 = +[REFeature isSiriActionFeature];
  v315[55] = v211;
  v210 = +[REFeature isDeveloperDonationFeature];
  v315[56] = v210;
  v209 = +[REFeature nowPlayingStateFeature];
  v315[57] = v209;
  v315[58] = v258;
  v315[59] = v257;
  v315[60] = v256;
  v315[61] = v255;
  v181 = +[REFeature workoutStateFeature];
  v315[62] = v181;
  v315[63] = v244;
  v315[64] = v243;
  v315[65] = v242;
  v315[66] = v241;
  v182 = +[REFeature deviceMotionFeature];
  v315[67] = v182;
  v183 = +[REFeature motionFeature];
  v315[68] = v183;
  v184 = +[REFeature isConnectedToCarFeature];
  v315[69] = v184;
  v185 = +[REFeature isConnectedToBluetoothSpeakerFeature];
  v315[70] = v185;
  v315[71] = v254;
  v315[72] = v253;
  v315[73] = v252;
  v315[74] = v251;
  v315[75] = v250;
  v315[76] = v249;
  v315[77] = v248;
  v315[78] = v247;
  v315[79] = v246;
  v315[80] = v245;
  v315[81] = v240;
  v315[82] = v239;
  v315[83] = v238;
  v221 = (void *)v178;
  v222 = (void *)v176;
  v315[84] = v176;
  v315[85] = v178;
  v220 = (void *)v180;
  v315[86] = v180;
  v186 = +[REFeature coreBehaviorShortcutTypeFeature];
  v315[87] = v186;
  v187 = +[REFeature coreBehaviorEventIdentifierHashFeature];
  v315[88] = v187;
  v188 = +[REFeature coreBehaviorAppIdentifierHashFeature];
  v315[89] = v188;
  v189 = [MEMORY[0x263EFF8C0] arrayWithObjects:v315 count:90];
  v190 = [(REFeatureSet *)v216 initWithFeatures:v189];

  v191 = objc_opt_new();
  v192 = [NSURL URLWithString:v229];
  [v191 setModelFileURL:v192];

  [v191 setPrimaryFeatures:v190];
  [v191 setModelVersion:9];
  [v191 setAllowsDiagnosticExtension:1];
  [v191 setAllowsRemoteTraining:1];
  v193 = REBundle();
  v194 = [v193 pathForResource:@"upnext_model" ofType:@"mdl"];

  if (v194)
  {
    v195 = [NSURL fileURLWithPath:v194];
    [v191 setBaseModelFileURL:v195];
  }
  [v191 setWantsBackup:1];
  long long v311 = 0u;
  long long v312 = 0u;
  long long v309 = 0u;
  long long v310 = 0u;
  id v196 = v231;
  uint64_t v197 = [v196 countByEnumeratingWithState:&v309 objects:v314 count:16];
  if (v197)
  {
    uint64_t v198 = v197;
    uint64_t v199 = *(void *)v310;
    do
    {
      for (uint64_t i = 0; i != v198; ++i)
      {
        if (*(void *)v310 != v199) {
          objc_enumerationMutation(v196);
        }
        [v191 addSectionWithDescriptor:*(void *)(*((void *)&v309 + 1) + 8 * i)];
      }
      uint64_t v198 = [v196 countByEnumeratingWithState:&v309 objects:v314 count:16];
    }
    while (v198);
  }

  long long v307 = 0u;
  long long v308 = 0u;
  long long v305 = 0u;
  long long v306 = 0u;
  id v201 = v232;
  uint64_t v202 = [v201 countByEnumeratingWithState:&v305 objects:v313 count:16];
  if (v202)
  {
    uint64_t v203 = v202;
    uint64_t v204 = *(void *)v306;
    do
    {
      for (uint64_t j = 0; j != v203; ++j)
      {
        if (*(void *)v306 != v204) {
          objc_enumerationMutation(v201);
        }
        [v191 addInteractionWithDescriptor:*(void *)(*((void *)&v305 + 1) + 8 * j)];
      }
      uint64_t v203 = [v201 countByEnumeratingWithState:&v305 objects:v313 count:16];
    }
    while (v203);
  }

  v206 = objc_opt_new();
  [v191 setMetricsRecorder:v206];

  uint64_t v207 = [v191 copy];
  v208 = (void *)defaultUpNextConfiguration_defaultConfiguration;
  defaultUpNextConfiguration_defaultConfiguration = v207;
}

unint64_t __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  return (unint64_t)(v2 * 7.0);
}

BOOL __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 objectAtIndexedSubscript:0];
  [v3 doubleValue];
  double v5 = v4;
  char v6 = [v2 objectAtIndexedSubscript:1];

  [v6 doubleValue];
  BOOL v8 = v5 > v7;

  return v8;
}

BOOL __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 objectAtIndexedSubscript:0];
  [v2 doubleValue];
  BOOL v4 = v3 >= 1.0;

  return v4;
}

BOOL __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 objectAtIndexedSubscript:0];
  [v3 doubleValue];
  BOOL v4 = 0;
  if (v5 >= 1.0)
  {
    char v6 = [v2 objectAtIndexedSubscript:1];
    [v6 doubleValue];
    if (v7 >= 1.0)
    {
      BOOL v8 = [v2 objectAtIndexedSubscript:2];
      [v8 doubleValue];
      BOOL v4 = v9 >= 1.0;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

unint64_t __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_6(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  return (unint64_t)(v2 * 7.0);
}

+ (id)sampleUpNextConfiguration
{
  v38[2] = *MEMORY[0x263EF8340];
  double v2 = +[RERelevanceEngineConfiguration defaultUpNextConfiguration];
  double v3 = (void *)[v2 mutableCopy];

  BOOL v4 = [v3 sectionDescriptors];
  uint64_t v5 = [v4 count];

  unint64_t v6 = 0x263EFF000uLL;
  uint64_t v35 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    do
    {
      BOOL v8 = objc_msgSend(v3, "sectionDescriptors", v35);
      double v9 = [v8 objectAtIndexedSubscript:v7];

      double v10 = RESampleFeature();
      id v11 = +[RECondition conditionHasValueForFeature:v10];

      double v12 = [RERankingRule alloc];
      id v13 = RESampleFeature();
      v14 = RESampleFeature();
      double v15 = +[REComparisonCondition conditionForLeftFeature:v13 relation:-2 rightFeature:v14];
      v16 = [(RERankingRule *)v12 initWithLeftCondition:v11 rightCondition:v11 comparisonCondition:v15 order:1];

      v17 = [REFilteringRule alloc];
      v18 = +[RECondition trueCondition];
      v19 = [(REFilteringRule *)v17 initWithCondition:v18 type:1];

      objc_super v20 = (void *)MEMORY[0x263EFFA08];
      v38[0] = v16;
      v38[1] = v19;
      v21 = [*(id *)(v6 + 2240) arrayWithObjects:v38 count:2];
      v22 = [v20 setWithArray:v21];
      [v9 setRules:v22];

      v23 = [v9 historicSectionDescriptor];
      if (v23)
      {
        v24 = (void *)MEMORY[0x263EFFA08];
        v37[0] = v16;
        v37[1] = v19;
        [*(id *)(v6 + 2240) arrayWithObjects:v37 count:2];
        v26 = unint64_t v25 = v6;
        v27 = [v24 setWithArray:v26];
        [v23 setRules:v27];

        unint64_t v6 = v25;
        [v9 setHistoricSectionDescriptor:v23];
      }
      [v3 removeSectionAtIndex:v7];
      [v3 insertSectionWithDescriptor:v9 atIndex:v7];

      ++v7;
    }
    while (v35 != v7);
  }
  objc_msgSend(v3, "setAllowsRemoteTraining:", 0, v35);
  [v3 setWantsImmutableContent:1];
  [v3 setAllowsUpdatingModelFile:0];
  [v3 setIgnoreDeviceLockState:1];
  [v3 setTrainingBehavior:0];
  v28 = [REFeatureSet alloc];
  v29 = RESampleFeature();
  v36[0] = v29;
  uint64_t v30 = +[REFeature noContentFeature];
  v36[1] = v30;
  v31 = [*(id *)(v6 + 2240) arrayWithObjects:v36 count:2];
  v32 = [(REFeatureSet *)v28 initWithFeatures:v31];
  [v3 setPrimaryFeatures:v32];

  uint64_t v33 = (void *)[v3 copy];
  return v33;
}

@end