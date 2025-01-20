@interface REMutableRelevanceEngineConfiguration
+ (id)defaultConfiguration;
+ (id)defaultUpNextConfiguration;
+ (id)sampleUpNextConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_indexOfInteractionWithName:(id)a3;
- (int64_t)_indexOfSectionWithName:(id)a3;
- (void)addInteractionWithDescriptor:(id)a3;
- (void)addSectionWithDescriptor:(id)a3;
- (void)insertInteractionWithDescriptor:(id)a3 atIndex:(unint64_t)a4;
- (void)insertSectionWithDescriptor:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllInteractions;
- (void)removeAllSections;
- (void)removeInteractionAtIndex:(unint64_t)a3;
- (void)removeSectionAtIndex:(unint64_t)a3;
- (void)removeSectionWithName:(id)a3;
- (void)setAllowsDiagnosticExtension:(BOOL)a3;
- (void)setAllowsRemoteTraining:(BOOL)a3;
- (void)setAllowsUpdatingModelFile:(BOOL)a3;
- (void)setBaseModelFileURL:(id)a3;
- (void)setDataSourceLoader:(id)a3;
- (void)setDisableAutomaticContentManagement:(BOOL)a3;
- (void)setEngineQueue:(id)a3;
- (void)setIgnoreDeviceLockState:(BOOL)a3;
- (void)setIgnoresInstalledApplications:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setMetricsRecorder:(id)a3;
- (void)setModelFileURL:(id)a3;
- (void)setModelStorageBehavior:(unint64_t)a3;
- (void)setModelVersion:(unint64_t)a3;
- (void)setObserverQueue:(id)a3;
- (void)setPreferenceDomain:(id)a3;
- (void)setPrimaryFeatures:(id)a3;
- (void)setRelevanceProviderManagerLoader:(id)a3;
- (void)setTrainingBehavior:(unint64_t)a3;
- (void)setWantsBackup:(BOOL)a3;
- (void)setWantsImmutableContent:(BOOL)a3;
@end

@implementation REMutableRelevanceEngineConfiguration

- (void)insertInteractionWithDescriptor:(id)a3 atIndex:(unint64_t)a4
{
  id v26 = a3;
  v6 = [v26 name];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v14 = [v26 name];
    int64_t v15 = [(REMutableRelevanceEngineConfiguration *)self _indexOfInteractionWithName:v14];

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      values = self->super._values;
      v17 = NSStringFromSelector(sel_interactionDescriptors);
      v18 = [(NSMutableDictionary *)values objectForKeyedSubscript:v17];

      [v18 insertObject:v26 atIndex:a4];
    }
    else
    {
      v19 = (void *)*MEMORY[0x263EFF4A0];
      v18 = [v26 name];
      RERaiseInternalException(v19, @"Already contains interaction descriptor with name \"%@\"", v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Interaction descriptor %@ must have name", v8, v9, v10, v11, v12, v13, (uint64_t)v26);
  }
}

- (void)removeAllSections
{
  for (i = self; ; self = i)
  {
    v3 = [(RERelevanceEngineConfiguration *)self sectionDescriptors];
    uint64_t v4 = [v3 count];

    if (!v4) {
      break;
    }
    [(REMutableRelevanceEngineConfiguration *)i removeSectionAtIndex:0];
  }
}

- (void)addSectionWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(RERelevanceEngineConfiguration *)self sectionDescriptors];
  -[REMutableRelevanceEngineConfiguration insertSectionWithDescriptor:atIndex:](self, "insertSectionWithDescriptor:atIndex:", v4, [v5 count]);
}

uint64_t __65__REMutableRelevanceEngineConfiguration__indexOfSectionWithName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)insertSectionWithDescriptor:(id)a3 atIndex:(unint64_t)a4
{
  id v26 = a3;
  v6 = [v26 name];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v14 = [v26 name];
    int64_t v15 = [(REMutableRelevanceEngineConfiguration *)self _indexOfSectionWithName:v14];

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      values = self->super._values;
      v17 = NSStringFromSelector(sel_sectionDescriptors);
      v18 = [(NSMutableDictionary *)values objectForKeyedSubscript:v17];

      [v18 insertObject:v26 atIndex:a4];
    }
    else
    {
      v19 = (void *)*MEMORY[0x263EFF4A0];
      v18 = [v26 name];
      RERaiseInternalException(v19, @"Already contains section descriptor with name \"%@\"", v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Section descriptor %@ must have name", v8, v9, v10, v11, v12, v13, (uint64_t)v26);
  }
}

- (int64_t)_indexOfSectionWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(RERelevanceEngineConfiguration *)self sectionDescriptors];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__REMutableRelevanceEngineConfiguration__indexOfSectionWithName___block_invoke;
  v9[3] = &unk_2644BE890;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

- (void)removeAllInteractions
{
  for (i = self; ; self = i)
  {
    v3 = [(RERelevanceEngineConfiguration *)self interactionDescriptors];
    uint64_t v4 = [v3 count];

    if (!v4) {
      break;
    }
    [(REMutableRelevanceEngineConfiguration *)i removeInteractionAtIndex:0];
  }
}

- (void)setWantsImmutableContent:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  uint64_t v4 = NSStringFromSelector(sel_wantsImmutableContent);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setTrainingBehavior:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v4 = NSStringFromSelector(sel_trainingBehavior);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setRelevanceProviderManagerLoader:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_relevanceProviderManagerLoader);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:objc_opt_class()];
}

- (void)setPrimaryFeatures:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_primaryFeatures);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:objc_opt_class()];
}

- (void)setObserverQueue:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_observerQueue);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:0];
}

- (void)setModelVersion:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = NSStringFromSelector(sel_modelVersion);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setModelFileURL:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_modelFileURL);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:objc_opt_class()];
}

- (void)setMetricsRecorder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_metricsRecorder);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:0];
}

- (void)setDataSourceLoader:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_dataSourceLoader);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:objc_opt_class()];
}

- (void)setBaseModelFileURL:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_baseModelFileURL);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:objc_opt_class()];
}

- (void)removeSectionAtIndex:(unint64_t)a3
{
  values = self->super._values;
  id v5 = NSStringFromSelector(sel_sectionDescriptors);
  id v6 = [(NSMutableDictionary *)values objectForKeyedSubscript:v5];

  [v6 removeObjectAtIndex:a3];
}

- (void)removeInteractionAtIndex:(unint64_t)a3
{
  values = self->super._values;
  id v5 = NSStringFromSelector(sel_interactionDescriptors);
  id v6 = [(NSMutableDictionary *)values objectForKeyedSubscript:v5];

  [v6 removeObjectAtIndex:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RERelevanceEngineConfiguration alloc];
  values = self->super._values;
  return [(RERelevanceEngineConfiguration *)v4 initWithDictionary:values];
}

- (void)addInteractionWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(RERelevanceEngineConfiguration *)self interactionDescriptors];
  -[REMutableRelevanceEngineConfiguration insertInteractionWithDescriptor:atIndex:](self, "insertInteractionWithDescriptor:atIndex:", v4, [v5 count]);
}

- (int64_t)_indexOfInteractionWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(RERelevanceEngineConfiguration *)self interactionDescriptors];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__REMutableRelevanceEngineConfiguration__indexOfInteractionWithName___block_invoke;
  v9[3] = &unk_2644BE8B8;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

+ (id)defaultConfiguration
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___REMutableRelevanceEngineConfiguration;
  v2 = objc_msgSendSuper2(&v5, sel_defaultConfiguration);
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (void)setEngineQueue:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_engineQueue);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:0];
}

- (void)setAllowsUpdatingModelFile:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = NSStringFromSelector(sel_allowsUpdatingModelFile);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setModelStorageBehavior:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = NSStringFromSelector(sel_modelStorageBehavior);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setLocationManager:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_locationManager);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:objc_opt_class()];
}

- (void)removeSectionWithName:(id)a3
{
  int64_t v4 = [(REMutableRelevanceEngineConfiguration *)self _indexOfSectionWithName:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(REMutableRelevanceEngineConfiguration *)self removeSectionAtIndex:v4];
  }
}

uint64_t __69__REMutableRelevanceEngineConfiguration__indexOfInteractionWithName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)setPreferenceDomain:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_preferenceDomain);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RERelevanceEngineConfiguration *)self setValue:v4 forKey:v5 ofClass:objc_opt_class()];
}

- (void)setAllowsRemoteTraining:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithBool:");
  id v6 = NSStringFromSelector(sel_allowsRemoteTraining);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v6 ofClass:objc_opt_class()];

  if (v3) {
    id v7 = +[RERemoteTrainingClientListener sharedTrainingClientListener];
  }
}

- (void)setWantsBackup:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = NSStringFromSelector(sel_wantsBackup);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setIgnoreDeviceLockState:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = NSStringFromSelector(sel_ignoreDeviceLockState);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setAllowsDiagnosticExtension:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = NSStringFromSelector(sel_allowsDiagnosticExtension);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setIgnoresInstalledApplications:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = NSStringFromSelector(sel_ignoresInstalledApplications);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

- (void)setDisableAutomaticContentManagement:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = NSStringFromSelector(sel_disableAutomaticContentManagement);
  [(RERelevanceEngineConfiguration *)self setValue:v5 forKey:v4 ofClass:objc_opt_class()];
}

+ (id)defaultUpNextConfiguration
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___REMutableRelevanceEngineConfiguration;
  v2 = objc_msgSendSuper2(&v5, sel_defaultUpNextConfiguration);
  BOOL v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)sampleUpNextConfiguration
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___REMutableRelevanceEngineConfiguration;
  v2 = objc_msgSendSuper2(&v5, sel_sampleUpNextConfiguration);
  BOOL v3 = (void *)[v2 mutableCopy];

  return v3;
}

@end