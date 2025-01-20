@interface NTKFaceConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)resourceDirectoryExists;
- (NSString)name;
- (NTKFaceConfiguration)init;
- (NTKFaceConfiguration)initWithCoder:(id)a3;
- (NTKFaceConfiguration)initWithJSONDictionary:(id)a3 editModeMapping:(id)a4 forDevice:(id)a5;
- (id)_dateMetricsKeys;
- (id)colorEditModeConfigurationWithJsonRepresentation:(id)a3 editMode:(int64_t)a4 editModeMapping:(id)a5 forDevice:(id)a6;
- (id)complicationForSlot:(id)a3;
- (id)complications;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customData;
- (id)customDataForKey:(id)a3;
- (id)description;
- (id)editModeConfigurations;
- (id)metricForKey:(id)a3;
- (id)metrics;
- (id)optionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)validationString;
- (unint64_t)hash;
- (void)_applyComplicationsDescription:(id)a3;
- (void)_applyCustomData:(id)a3;
- (void)_applyCustomizationDescription:(id)a3 editModeMapping:(id)a4 forDevice:(id)a5;
- (void)_applyMetrics:(id)a3;
- (void)_enumerateComplicationsWithBlock:(id)a3;
- (void)_enumerateCustomDataWithBlock:(id)a3;
- (void)_enumerateEditModeConfigurationsWithBlock:(id)a3;
- (void)_invalidateDescription;
- (void)addConfigurationKeysToJSONDictionary:(id)a3 face:(id)a4;
- (void)appendCustomDataToDailySnapshotKey:(id)a3;
- (void)appendEditModesToDailySnapshotKey:(id)a3;
- (void)clearMetrics;
- (void)encodeWithCoder:(id)a3;
- (void)incrementMetricForKey:(id)a3;
- (void)setComplication:(id)a3 forSlot:(id)a4;
- (void)setCustomData:(id)a3 forKey:(id)a4;
- (void)setCustomDataFromConfiguration:(id)a3;
- (void)setMetric:(id)a3 forKey:(id)a4;
- (void)setMetricsFromConfiguration:(id)a3;
- (void)setName:(id)a3;
- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)setResourceDirectoryExists:(BOOL)a3;
@end

@implementation NTKFaceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_editModeConfigurations, 0);
  objc_storeStrong((id *)&self->_complications, 0);
}

- (NTKFaceConfiguration)init
{
  v12.receiver = self;
  v12.super_class = (Class)NTKFaceConfiguration;
  v2 = [(NTKFaceConfiguration *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    complications = v2->_complications;
    v2->_complications = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    editModeConfigurations = v2->_editModeConfigurations;
    v2->_editModeConfigurations = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    metrics = v2->_metrics;
    v2->_metrics = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    customData = v2->_customData;
    v2->_customData = v9;

    *(void *)&v2->_complicationsLock._os_unfair_lock_opaque = 0;
    *(void *)&v2->_metricsLock._os_unfair_lock_opaque = 0;
    *(void *)&v2->_cachedDescriptionLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)optionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  p_editModeConfigurationsLock = &self->_editModeConfigurationsLock;
  id v7 = a4;
  os_unfair_lock_lock(p_editModeConfigurationsLock);
  editModeConfigurations = self->_editModeConfigurations;
  v9 = [NSNumber numberWithInteger:a3];
  v10 = [(NSMutableDictionary *)editModeConfigurations objectForKey:v9];

  v11 = [v10 editOptionForSlot:v7];

  os_unfair_lock_unlock(p_editModeConfigurationsLock);
  return v11;
}

- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  os_unfair_lock_lock(&self->_editModeConfigurationsLock);
  editModeConfigurations = self->_editModeConfigurations;
  v10 = [NSNumber numberWithInteger:a4];
  v11 = [(NSMutableDictionary *)editModeConfigurations objectForKey:v10];

  if (!v11)
  {
    v11 = objc_alloc_init(NTKEditModeConfiguration);
    objc_super v12 = self->_editModeConfigurations;
    v13 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v11 forKey:v13];
  }
  [(NTKEditModeConfiguration *)v11 setEditOption:v14 forSlot:v8];
  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(&self->_editModeConfigurationsLock);
}

- (id)complicationForSlot:(id)a3
{
  p_complicationsLock = &self->_complicationsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_complicationsLock);
  v6 = [(NSMutableDictionary *)self->_complications objectForKey:v5];

  os_unfair_lock_unlock(p_complicationsLock);
  return v6;
}

- (void)setComplication:(id)a3 forSlot:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_complicationsLock);
  complications = self->_complications;
  if (v8) {
    [(NSMutableDictionary *)complications setObject:v8 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)complications removeObjectForKey:v6];
  }

  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(&self->_complicationsLock);
}

- (id)description
{
  p_descriptionLock = &self->_descriptionLock;
  os_unfair_lock_lock(&self->_descriptionLock);
  os_unfair_lock_lock(&self->_cachedDescriptionLock);
  v4 = self->_cachedDescription;
  os_unfair_lock_unlock(&self->_cachedDescriptionLock);
  if (!v4)
  {
    v4 = [(NTKFaceConfiguration *)self validationString];
    os_unfair_lock_lock(&self->_cachedDescriptionLock);
    objc_storeStrong((id *)&self->_cachedDescription, v4);
    os_unfair_lock_unlock(&self->_cachedDescriptionLock);
  }
  os_unfair_lock_unlock(p_descriptionLock);
  return v4;
}

- (void)_invalidateDescription
{
  p_cachedDescriptionLock = &self->_cachedDescriptionLock;
  os_unfair_lock_lock(&self->_cachedDescriptionLock);
  cachedDescription = self->_cachedDescription;
  self->_cachedDescription = 0;

  os_unfair_lock_unlock(p_cachedDescriptionLock);
}

- (id)validationString
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = v3;
  if (self->_resourceDirectoryExists) {
    [v3 appendString:@"resource-directory "];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v5 = (void *)MEMORY[0x1C1875BE0]();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __40__NTKFaceConfiguration_validationString__block_invoke;
  v25[3] = &unk_1E62C8EA0;
  v27 = &v28;
  id v6 = v4;
  id v26 = v6;
  [(NTKFaceConfiguration *)self _enumerateEditModeConfigurationsWithBlock:v25];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v7 = (void *)MEMORY[0x1C1875BE0]();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__NTKFaceConfiguration_validationString__block_invoke_2;
  v18[3] = &unk_1E62C8EC8;
  v20 = &v21;
  id v8 = v6;
  id v19 = v8;
  [(NTKFaceConfiguration *)self _enumerateComplicationsWithBlock:v18];
  if (*((unsigned char *)v22 + 24)) {
    [v8 appendString:@">"];
  }

  *((unsigned char *)v29 + 24) = 0;
  v9 = (void *)MEMORY[0x1C1875BE0]();
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __40__NTKFaceConfiguration_validationString__block_invoke_3;
  v15 = &unk_1E62C8EF0;
  v17 = &v28;
  id v10 = v8;
  id v16 = v10;
  [(NTKFaceConfiguration *)self _enumerateCustomDataWithBlock:&v12];
  if (*((unsigned char *)v29 + 24)) {
    objc_msgSend(v10, "appendString:", @">", v12, v13, v14, v15);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v28, 8);
  return v10;
}

void __40__NTKFaceConfiguration_validationString__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  else {
    *(unsigned char *)(v4 + 24) = 1;
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [v7 description];
  [v5 appendFormat:@"%@", v6];
}

void __40__NTKFaceConfiguration_validationString__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = a3;
  id v8 = a2;
  if (v6)
  {
    [v5 appendString:@", "];
  }
  else
  {
    [v5 appendString:@" <"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  [*(id *)(a1 + 32) appendFormat:@"%@:%@", v8, v7];
}

void __40__NTKFaceConfiguration_validationString__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  int v6 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v6 appendString:@", "];
  }
  else
  {
    [v6 appendString:@" custom-data<"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v5 description];
  }
  else
  {
    id v7 = @"#";
  }
  [*(id *)(a1 + 32) appendFormat:@"%@:%@", v8, v7];
}

- (void)appendEditModesToDailySnapshotKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__NTKFaceConfiguration_appendEditModesToDailySnapshotKey___block_invoke;
  v6[3] = &unk_1E62C8F18;
  id v7 = v4;
  id v5 = v4;
  [(NTKFaceConfiguration *)self _enumerateEditModeConfigurationsWithBlock:v6];
}

void __58__NTKFaceConfiguration_appendEditModesToDailySnapshotKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 dailySnapshotKey];
  id v5 = (void *)v4;
  int v6 = &stru_1F1635E90;
  if (v4) {
    int v6 = (__CFString *)v4;
  }
  id v7 = v6;

  [*(id *)(a1 + 32) appendFormat:@"(%@)", v7];
}

- (void)appendCustomDataToDailySnapshotKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NTKFaceConfiguration *)self customData];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v5 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 appendFormat:@"(%@)", v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = [v10 stringValue];
            [v4 appendFormat:@"(%@)", v11];
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)metricForKey:(id)a3
{
  p_metricsLock = &self->_metricsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_metricsLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_metrics objectForKey:v5];

  os_unfair_lock_unlock(p_metricsLock);
  return v6;
}

- (void)setMetric:(id)a3 forKey:(id)a4
{
  p_metricsLock = &self->_metricsLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_metricsLock);
  [(NSMutableDictionary *)self->_metrics setObject:v8 forKey:v7];

  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(p_metricsLock);
}

- (void)incrementMetricForKey:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_metricsLock);
  id v4 = [(NSMutableDictionary *)self->_metrics objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue") + 1);
    [(NSMutableDictionary *)self->_metrics setObject:v5 forKey:v6];
  }
  else if (!v4)
  {
    [(NSMutableDictionary *)self->_metrics setObject:&unk_1F16E4440 forKey:v6];
  }
  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(&self->_metricsLock);
}

- (void)setMetricsFromConfiguration:(id)a3
{
  p_metricsLock = &self->_metricsLock;
  id v6 = (id *)a3;
  os_unfair_lock_lock(p_metricsLock);
  if (a3) {
    id v7 = (NSMutableDictionary *)v6[3];
  }
  else {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  metrics = self->_metrics;
  self->_metrics = v7;

  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(p_metricsLock);
}

- (void)clearMetrics
{
  p_metricsLock = &self->_metricsLock;
  os_unfair_lock_lock(&self->_metricsLock);
  [(NSMutableDictionary *)self->_metrics removeAllObjects];
  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(p_metricsLock);
}

- (void)_enumerateEditModeConfigurationsWithBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, unsigned char *))a3;
  id v5 = [(NTKFaceConfiguration *)self editModeConfigurations];
  id v6 = [v5 allKeys];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  char v20 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      uint64_t v14 = objc_msgSend(v13, "integerValue", (void)v16);
      long long v15 = [v5 objectForKey:v13];
      v4[2](v4, v14, v15, &v20);

      if (v20) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_enumerateCustomDataWithBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, char *))a3;
  p_customDataLock = &self->_customDataLock;
  os_unfair_lock_lock(&self->_customDataLock);
  id v6 = (void *)[(NSMutableDictionary *)self->_customData copy];
  os_unfair_lock_unlock(p_customDataLock);
  id v7 = [v6 allKeys];
  id v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  char v20 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
      long long v15 = objc_msgSend(v6, "objectForKeyedSubscript:", v14, (void)v16);
      v4[2](v4, v14, v15, &v20);

      if (v20) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_enumerateComplicationsWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, char *))a3;
  id v5 = [(NTKFaceConfiguration *)self complications];
  id v6 = [v5 allKeys];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
      uint64_t v14 = objc_msgSend(v5, "objectForKey:", v13, (void)v15);
      v4[2](v4, v13, v14, &v19);

      if (v19) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setName:self->_name];
  [v4 setResourceDirectoryExists:self->_resourceDirectoryExists];
  os_unfair_lock_lock(&self->_metricsLock);
  uint64_t v5 = [(NSMutableDictionary *)self->_metrics mutableCopy];
  id v6 = (void *)v4[3];
  v4[3] = v5;

  os_unfair_lock_unlock(&self->_metricsLock);
  os_unfair_lock_lock(&self->_customDataLock);
  uint64_t v7 = [(NSMutableDictionary *)self->_customData mutableCopy];
  id v8 = (void *)v4[4];
  v4[4] = v7;

  os_unfair_lock_unlock(&self->_customDataLock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__NTKFaceConfiguration_copyWithZone___block_invoke;
  v19[3] = &unk_1E62C2A58;
  uint64_t v9 = v4;
  id v20 = v9;
  [(NTKFaceConfiguration *)self _enumerateComplicationsWithBlock:v19];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __37__NTKFaceConfiguration_copyWithZone___block_invoke_2;
  long long v17 = &unk_1E62C8F18;
  uint64_t v10 = v9;
  id v18 = v10;
  [(NTKFaceConfiguration *)self _enumerateEditModeConfigurationsWithBlock:&v14];
  objc_msgSend(v10, "_invalidateDescription", v14, v15, v16, v17);
  uint64_t v11 = v18;
  uint64_t v12 = v10;

  return v12;
}

uint64_t __37__NTKFaceConfiguration_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

void __37__NTKFaceConfiguration_copyWithZone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__NTKFaceConfiguration_copyWithZone___block_invoke_3;
  v7[3] = &unk_1E62C5858;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = a2;
  id v6 = v5;
  [v6 enumerateSlotsWithBlock:v7];
}

void __37__NTKFaceConfiguration_copyWithZone___block_invoke_3(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 editOptionForSlot:v5];
  [v3 setOption:v6 forCustomEditMode:a1[6] slot:v5];
}

- (id)complications
{
  p_complicationsLock = &self->_complicationsLock;
  os_unfair_lock_lock(&self->_complicationsLock);
  id v4 = (void *)[(NSMutableDictionary *)self->_complications copy];
  os_unfair_lock_unlock(p_complicationsLock);
  return v4;
}

- (id)editModeConfigurations
{
  p_editModeConfigurationsLock = &self->_editModeConfigurationsLock;
  os_unfair_lock_lock(&self->_editModeConfigurationsLock);
  id v4 = (void *)[(NSMutableDictionary *)self->_editModeConfigurations copy];
  os_unfair_lock_unlock(p_editModeConfigurationsLock);
  return v4;
}

- (id)metrics
{
  p_metricsLock = &self->_metricsLock;
  os_unfair_lock_lock(&self->_metricsLock);
  id v4 = (void *)[(NSMutableDictionary *)self->_metrics copy];
  os_unfair_lock_unlock(p_metricsLock);
  return v4;
}

- (id)customData
{
  p_customDataLock = &self->_customDataLock;
  os_unfair_lock_lock(&self->_customDataLock);
  id v4 = (void *)[(NSMutableDictionary *)self->_customData copy];
  os_unfair_lock_unlock(p_customDataLock);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && NTKEqualObjects(self->_name, v4[10])
    && self->_resourceDirectoryExists == *((unsigned __int8 *)v4 + 72))
  {
    id v5 = [(NTKFaceConfiguration *)self metrics];
    id v6 = [v4 metrics];
    if (NTKEqualObjects(v5, v6))
    {
      uint64_t v7 = [(NTKFaceConfiguration *)self customData];
      id v8 = [v4 customData];
      if (NTKEqualObjects(v7, v8))
      {
        id v9 = [(NTKFaceConfiguration *)self complications];
        uint64_t v10 = [v4 complications];
        if (NTKEqualObjects(v9, v10))
        {
          uint64_t v11 = [(NTKFaceConfiguration *)self editModeConfigurations];
          uint64_t v12 = [v4 editModeConfigurations];
          char v13 = NTKEqualObjects(v11, v12);
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  id v4 = [(NTKFaceConfiguration *)self complications];
  uint64_t v5 = [v4 hash];
  id v6 = [(NTKFaceConfiguration *)self editModeConfigurations];
  NSUInteger v7 = v5 + [v6 hash] + self->_resourceDirectoryExists + v3;
  id v8 = [(NTKFaceConfiguration *)self metrics];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [(NTKFaceConfiguration *)self customData];
  unint64_t v11 = v7 + v9 + [v10 hash];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"Name"];
  [v5 encodeBool:self->_resourceDirectoryExists forKey:@"ResourceDirectoryExists"];
  id v6 = [(NTKFaceConfiguration *)self metrics];
  NSUInteger v7 = (void *)[v6 mutableCopy];
  [v5 encodeObject:v7 forKey:@"Metrics"];

  id v8 = [(NTKFaceConfiguration *)self customData];
  uint64_t v9 = (void *)[v8 mutableCopy];
  [v5 encodeObject:v9 forKey:@"CustomData"];

  uint64_t v10 = [(NTKFaceConfiguration *)self editModeConfigurations];
  unint64_t v11 = (void *)[v10 mutableCopy];
  [v5 encodeObject:v11 forKey:@"EditModeConfigurations"];

  id v13 = [(NTKFaceConfiguration *)self complications];
  uint64_t v12 = (void *)[v13 mutableCopy];
  [v5 encodeObject:v12 forKey:@"Complications"];
}

- (NTKFaceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NTKFaceConfiguration;
  id v5 = [(NTKFaceConfiguration *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_resourceDirectoryExists = [v4 decodeBoolForKey:@"ResourceDirectoryExists"];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Metrics"];
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"CustomData"];
    customData = v5->_customData;
    v5->_customData = (NSMutableDictionary *)v19;

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    char v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);

    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"EditModeConfigurations"];
    editModeConfigurations = v5->_editModeConfigurations;
    v5->_editModeConfigurations = (NSMutableDictionary *)v25;

    v27 = v5->_editModeConfigurations;
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    NTKValidateDictionary(v27, v28, v29);
    uint64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, v35, objc_opt_class(), 0);

    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"Complications"];
    complications = v5->_complications;
    v5->_complications = (NSMutableDictionary *)v37;

    v39 = v5->_complications;
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    NTKValidateDictionary(v39, v40, v41);
  }
  return v5;
}

- (void)addConfigurationKeysToJSONDictionary:(id)a3 face:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setObject:self->_name forKeyedSubscript:@"face name"];
  if (self->_resourceDirectoryExists)
  {
    id v8 = [NSNumber numberWithBool:1];
    [v6 setObject:v8 forKeyedSubscript:@"resource directory"];
  }
  uint64_t v9 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke;
  aBlock[3] = &unk_1E62C8F40;
  id v10 = v9;
  id v37 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = [(NTKFaceConfiguration *)self metrics];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_2;
  v33[3] = &unk_1E62C8F68;
  v33[4] = self;
  id v13 = v11;
  id v35 = v13;
  id v14 = v10;
  id v34 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v33];

  if ([v14 count]) {
    [v6 setObject:v14 forKeyedSubscript:@"metrics"];
  }
  uint64_t v15 = objc_opt_new();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_3;
  v30[3] = &unk_1E62C8F90;
  id v16 = v15;
  id v31 = v16;
  id v17 = v7;
  id v32 = v17;
  [(NTKFaceConfiguration *)self _enumerateEditModeConfigurationsWithBlock:v30];
  if ([v16 count]) {
    [v6 setObject:v16 forKeyedSubscript:@"customization"];
  }
  id v18 = objc_opt_new();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_4;
  v28[3] = &unk_1E62C2A58;
  id v19 = v18;
  id v29 = v19;
  [(NTKFaceConfiguration *)self _enumerateComplicationsWithBlock:v28];
  if ([v19 count]) {
    [v6 setObject:v19 forKeyedSubscript:@"complications"];
  }
  id v20 = objc_opt_new();
  uint64_t v21 = [(NTKFaceConfiguration *)self customData];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_5;
  id v26 = &unk_1E62C8FB8;
  id v22 = v20;
  id v27 = v22;
  [v21 enumerateKeysAndObjectsUsingBlock:&v23];

  if (objc_msgSend(v22, "count", v23, v24, v25, v26)) {
    [v6 setObject:v22 forKeyedSubscript:@"customData"];
  }
}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 timeIntervalSince1970];
    id v6 = *(void **)(a1 + 32);
    id v7 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v6 setObject:v7 forKey:v8];
  }
}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  id v7 = [v5 _dateMetricsKeys];
  LODWORD(v5) = [v7 containsObject:v8];

  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [*(id *)(a1 + 40) setObject:v6 forKey:v8];
  }
}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  NTKFaceBundleStringFromCustomEditMode(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 JSONObjectRepresentationForFace:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 JSONObjectRepresentation];
  id v6 = *(void **)(a1 + 32);
  id v7 = NTKFaceBundleStringFromComplicationSlot(v5);

  [v6 setObject:v8 forKeyedSubscript:v7];
}

uint64_t __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (NTKFaceConfiguration)initWithJSONDictionary:(id)a3 editModeMapping:(id)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NTKFaceConfiguration *)self init];
  if (v11)
  {
    id v25 = v10;
    id v26 = v9;
    uint64_t v12 = [v8 objectForKeyedSubscript:@"face name"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v13 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.6();
        }

        uint64_t v12 = 0;
      }
    }
    objc_storeStrong((id *)&v11->_name, v12);
    id v14 = [v8 objectForKeyedSubscript:@"resource directory"];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v15 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.5();
        }
      }
    }
    v11->_resourceDirectoryExists = [v14 BOOLValue];
    id v16 = [v8 objectForKeyedSubscript:@"metrics"];
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v17 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:]();
        }

        id v16 = 0;
      }
    }
    [(NTKFaceConfiguration *)v11 _applyMetrics:v16];
    id v18 = [v8 objectForKeyedSubscript:@"customData"];
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v19 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:]();
        }

        id v18 = 0;
      }
    }
    [(NTKFaceConfiguration *)v11 _applyCustomData:v18];
    id v20 = [v8 objectForKeyedSubscript:@"customization"];
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v21 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:]();
        }

        id v20 = 0;
      }
    }
    [(NTKFaceConfiguration *)v11 _applyCustomizationDescription:v20 editModeMapping:v26 forDevice:v25];
    id v22 = [v8 objectForKeyedSubscript:@"complications"];
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v23 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:]();
        }

        id v22 = 0;
      }
    }
    [(NTKFaceConfiguration *)v11 _applyComplicationsDescription:v22];

    id v10 = v25;
    id v9 = v26;
  }

  return v11;
}

- (void)_applyCustomizationDescription:(id)a3 editModeMapping:(id)a4 forDevice:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v26 = a4;
  id v25 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = v8;
  id v9 = [(__CFString *)v8 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v10)
  {
    os_unfair_lock_t lock = &self->_editModeConfigurationsLock;
    uint64_t v12 = *(void *)v31;
    *(void *)&long long v11 = 138412802;
    long long v24 = v11;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v29 = 0;
          if (NTKFaceBundleGetCustomEditModeFromString(v14, &v29))
          {
            uint64_t v15 = -[__CFString objectForKey:](v27, "objectForKey:", v14, v24);
            if (v29 == 10)
            {
              id v16 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                id v35 = v27;
                _os_log_debug_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEBUG, "applying color option %{public}@", buf, 0xCu);
              }

              id v17 = [(NTKFaceConfiguration *)self colorEditModeConfigurationWithJsonRepresentation:v15 editMode:v29 editModeMapping:v26 forDevice:v25];
LABEL_19:
              p_super = &v17->super;
              os_unfair_lock_lock(lock);
              editModeConfigurations = self->_editModeConfigurations;
              id v22 = [NSNumber numberWithInteger:v29];
              [(NSMutableDictionary *)editModeConfigurations setObject:p_super forKeyedSubscript:v22];

              [(NTKFaceConfiguration *)self _invalidateDescription];
              os_unfair_lock_unlock(lock);
            }
            else
            {
              uint64_t v19 = [v26 editOptionClassFromEditMode:v29 resourceDirectoryExists:self->_resourceDirectoryExists];
              if (v19)
              {
                id v17 = [[NTKEditModeConfiguration alloc] initWithJSONObjectRepresentation:v15 editOptionClass:v19 forDevice:v25];
                goto LABEL_19;
              }
              p_super = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v35 = @"customization";
                __int16 v36 = 2112;
                id v37 = v14;
                _os_log_error_impl(&dword_1BC5A9000, p_super, OS_LOG_TYPE_ERROR, "Face bundle warning: invalid key in %@ dictionary: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            uint64_t v15 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v35 = @"customization";
              __int16 v36 = 2112;
              id v37 = v14;
              _os_log_error_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_ERROR, "Face bundle warning: invalid key in %@ dictionary: %@", buf, 0x16u);
            }
          }

          goto LABEL_22;
        }
        id v18 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v35 = @"customization";
          __int16 v36 = 2112;
          id v37 = v14;
          _os_log_error_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_ERROR, "Face bundle warning: keys in %@ dictionary must be strings - invalid key: %@", buf, 0x16u);
        }

LABEL_22:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v23 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
      uint64_t v10 = v23;
    }
    while (v23);
  }
}

- (id)colorEditModeConfigurationWithJsonRepresentation:(id)a3 editMode:(int64_t)a4 editModeMapping:(id)a5 forDevice:(id)a6
{
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__NTKFaceConfiguration_colorEditModeConfigurationWithJsonRepresentation_editMode_editModeMapping_forDevice___block_invoke;
  aBlock[3] = &unk_1E62C8FE0;
  uint64_t v19 = self;
  int64_t v20 = a4;
  id v18 = v10;
  id v11 = v10;
  id v12 = a6;
  id v13 = a3;
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = [[NTKEditModeConfiguration alloc] initWithJSONObjectRepresentation:v13 device:v12 editOptionFactory:v14];

  return v15;
}

id __108__NTKFaceConfiguration_colorEditModeConfigurationWithJsonRepresentation_editMode_editModeMapping_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) deviceSupportsPigmentEditOption];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(a1 + 32);
  BOOL v10 = *(unsigned char *)(*(void *)(a1 + 40) + 72) != 0;
  if (v7)
  {
    id v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "editOptionClassFromEditMode:resourceDirectoryExists:", v8, v10)), "initWithJSONObjectRepresentation:forDevice:", v5, v6);
    if (!v11)
    {
      id v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "legacyEditOptionClassFromCustomEditMode:resourceDirectoryExists:", *(void *)(a1 + 48), *(unsigned __int8 *)(*(void *)(a1 + 40) + 72))), "initWithJSONObjectRepresentation:forDevice:", v5, v6);
      if ([v12 conformsToProtocol:&unk_1FCDEF740])
      {
        id v13 = [v12 pigmentEditOption];
      }
      else
      {
        id v13 = v12;
      }
      id v11 = v13;
    }
  }
  else
  {
    id v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "editOptionClassFromEditMode:resourceDirectoryExists:", v8, v10)), "initWithJSONObjectRepresentation:forDevice:", v5, v6);
  }

  return v11;
}

- (void)_applyComplicationsDescription:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v14 = a3;
  NSUInteger v3 = [v14 allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = 0;
          BOOL ComplicationSlotFromString = NTKFaceBundleGetComplicationSlotFromString(v7, &v15);
          id v9 = v15;
          if (ComplicationSlotFromString)
          {
            BOOL v10 = [v14 objectForKey:v7];
            id v11 = +[NTKComplication complicationWithJSONObjectRepresentation:v10];
            [(NSMutableDictionary *)self->_complications setObject:v11 forKeyedSubscript:v9];
          }
          else
          {
            id v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v21 = @"complications";
              __int16 v22 = 2112;
              uint64_t v23 = v7;
              _os_log_error_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_ERROR, "Face bundle warning: invalid key in %@ dictionary: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v21 = @"complications";
            __int16 v22 = 2112;
            uint64_t v23 = v7;
            _os_log_error_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_ERROR, "Face bundle warning: keys in '%@' dictionary must be strings - invalid key: %@", buf, 0x16u);
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v4);
  }
}

- (void)_applyMetrics:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__NTKFaceConfiguration__applyMetrics___block_invoke;
    aBlock[3] = &unk_1E62C8F40;
    id v6 = v5;
    id v20 = v6;
    int v7 = _Block_copy(aBlock);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __38__NTKFaceConfiguration__applyMetrics___block_invoke_2;
    id v15 = &unk_1E62C8F68;
    long long v16 = self;
    id v18 = v7;
    uint64_t v8 = (NSMutableDictionary *)v6;
    long long v17 = v8;
    id v9 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:&v12];

    os_unfair_lock_lock(&self->_metricsLock);
    metrics = self->_metrics;
    self->_metrics = v8;
    id v11 = v8;

    [(NTKFaceConfiguration *)self _invalidateDescription];
    os_unfair_lock_unlock(&self->_metricsLock);
  }
}

void __38__NTKFaceConfiguration__applyMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 doubleValue];
    if (v6 > 0.0)
    {
      int v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
      [*(id *)(a1 + 32) setObject:v7 forKey:v8];
    }
  }
}

void __38__NTKFaceConfiguration__applyMetrics___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) _dateMetricsKeys];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 40) setObject:v6 forKey:v5];
    }
    else
    {
      id v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __38__NTKFaceConfiguration__applyMetrics___block_invoke_2_cold_1((uint64_t)v6, v9);
      }
    }
  }
}

- (void)_applyCustomData:(id)a3
{
  p_customDataLock = &self->_customDataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_customDataLock);
  id v6 = (NSMutableDictionary *)[v5 mutableCopy];

  customData = self->_customData;
  self->_customData = v6;

  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(p_customDataLock);
}

- (id)_dateMetricsKeys
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"dateCreated";
  v4[1] = @"dateLastEdited";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)customDataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFaceConfiguration *)self customData];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setCustomData:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_customDataLock);
  customData = self->_customData;
  if (v8) {
    [(NSMutableDictionary *)customData setObject:v8 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)customData removeObjectForKey:v6];
  }

  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(&self->_customDataLock);
}

- (void)setCustomDataFromConfiguration:(id)a3
{
  p_customDataLock = &self->_customDataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_customDataLock);
  [(NSMutableDictionary *)self->_customData removeAllObjects];
  uint64_t v6 = v5[4];

  if (v6) {
    [(NSMutableDictionary *)self->_customData addEntriesFromDictionary:v6];
  }
  [(NTKFaceConfiguration *)self _invalidateDescription];
  os_unfair_lock_unlock(p_customDataLock);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)resourceDirectoryExists
{
  return self->_resourceDirectoryExists;
}

- (void)setResourceDirectoryExists:(BOOL)a3
{
  self->_resourceDirectoryExists = a3;
}

- (void)initWithJSONDictionary:editModeMapping:forDevice:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Face bundle warning: value for '%@' must be a dictionary - invalid value: %@");
}

- (void)initWithJSONDictionary:editModeMapping:forDevice:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Face bundle warning: value for '%@' must be a number - invalid value: %@");
}

- (void)initWithJSONDictionary:editModeMapping:forDevice:.cold.6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Face bundle warning: value for '%@' must be a string - invalid value: %@");
}

void __108__NTKFaceConfiguration_colorEditModeConfigurationWithJsonRepresentation_editMode_editModeMapping_forDevice___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)NSUInteger v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, (uint64_t)a2, a3, "Could not create a color option with class %{public}@, %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __38__NTKFaceConfiguration__applyMetrics___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Face metrics warning: allowableTypes does not contain metric:%@", (uint8_t *)&v2, 0xCu);
}

@end