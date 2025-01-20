@interface ATXModeFeatureSet
+ (BOOL)supportsSecureCoding;
- (ATXModeFeatureSet)init;
- (ATXModeFeatureSet)initWithCoder:(id)a3;
- (ATXModeFeatureSet)initWithDictionary:(id)a3;
- (BOOL)BOOLValueForFeatureType:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringForFeatureType:(int)a3;
- (id)valueForFeatureType:(int)a3;
- (void)_enumerateFeaturesUsingBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithFeatures:(id)a3;
- (void)setNullForFeatureType:(int)a3;
- (void)setString:(id)a3 forFeatureType:(int)a4;
- (void)setValue:(BOOL)a3 forBinaryFeatureOfType:(int)a4;
- (void)setValue:(id)a3 forFeatureType:(int)a4;
@end

@implementation ATXModeFeatureSet

- (ATXModeFeatureSet)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXModeFeatureSet;
  v2 = [(ATXModeFeatureSet *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    features = v2->_features;
    v2->_features = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (ATXModeFeatureSet)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXModeFeatureSet;
  v5 = [(ATXModeFeatureSet *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    features = v5->_features;
    v5->_features = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)setValue:(BOOL)a3 forBinaryFeatureOfType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [NSNumber numberWithBool:a3];
  [(ATXModeFeatureSet *)self setValue:v6 forFeatureType:v4];
}

- (void)setValue:(id)a3 forFeatureType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = (id)[a3 copy];
  features = self->_features;
  objc_super v7 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)features setObject:v8 forKeyedSubscript:v7];
}

- (void)setNullForFeatureType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [MEMORY[0x1E4F1CA98] null];
  features = self->_features;
  id v6 = [NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)features setObject:v7 forKeyedSubscript:v6];
}

- (void)setString:(id)a3 forFeatureType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = (id)[a3 copy];
  features = self->_features;
  id v7 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)features setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)BOOLValueForFeatureType:(int)a3
{
  uint64_t v3 = [(ATXModeFeatureSet *)self valueForFeatureType:*(void *)&a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)valueForFeatureType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  features = self->_features;
  id v6 = objc_msgSend(NSNumber, "numberWithInt:");
  id v7 = [(NSMutableDictionary *)features objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = self->_features;
    v9 = [NSNumber numberWithInt:v3];
    objc_super v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)stringForFeatureType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  features = self->_features;
  id v6 = objc_msgSend(NSNumber, "numberWithInt:");
  id v7 = [(NSMutableDictionary *)features objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = self->_features;
    v9 = [NSNumber numberWithInt:v3];
    objc_super v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (void)_enumerateFeaturesUsingBlock:(id)a3
{
  id v4 = a3;
  features = self->_features;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATXModeFeatureSet__enumerateFeaturesUsingBlock___block_invoke;
  v7[3] = &unk_1E6BE7020;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)features enumerateKeysAndObjectsUsingBlock:v7];
}

void __50__ATXModeFeatureSet__enumerateFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, [a2 intValue], v7, a4);
}

- (void)mergeWithFeatures:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__ATXModeFeatureSet_mergeWithFeatures___block_invoke;
  v3[3] = &unk_1E6BE7048;
  v3[4] = self;
  [a3 _enumerateFeaturesUsingBlock:v3];
}

void __39__ATXModeFeatureSet_mergeWithFeatures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) setValue:v5 forFeatureType:a2];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) setString:v5 forFeatureType:a2];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*(id *)(a1 + 32) setNullForFeatureType:a2];
      }
    }
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  objc_super v10 = __Block_byref_object_dispose__8;
  id v11 = (id)objc_opt_new();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ATXModeFeatureSet_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E6BE7070;
  v5[4] = &v6;
  [(ATXModeFeatureSet *)self _enumerateFeaturesUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__ATXModeFeatureSet_dictionaryRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = (id)[a3 copy];
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (a2 >= 0x1D)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = off_1E6BE7090[(int)a2];
  }
  [v5 setObject:v7 forKeyedSubscript:v6];
}

- (id)description
{
  v2 = NSString;
  id v3 = [(ATXModeFeatureSet *)self dictionaryRepresentation];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXModeFeatureSet)initWithCoder:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  objc_super v10 = [v4 decodeObjectOfClasses:v9 forKey:@"fs"];

  if (!v10)
  {
    v12 = [v4 error];

    if (v12)
    {
      v13 = __atxlog_handle_modes();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXModeFeatureSet initWithCoder:](v4, v13);
      }

      goto LABEL_10;
    }
    int v21 = [v4 containsValueForKey:@"fs"];
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    if (v21)
    {
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@"archive contains illegal nil value for key \"%@\", @"fs""];
      v28[0] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      v17 = v22;
      uint64_t v18 = -1;
    }
    else
    {
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@"key \"%@\" not present", @"fs"];
      v26 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v17 = v22;
      uint64_t v18 = -2;
    }
LABEL_9:
    v19 = (void *)[v17 initWithDomain:@"com.apple.duetexpertd.modes" code:v18 userInfo:v16];

    [v4 failWithError:v19];
LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v15 = [NSString stringWithFormat:@"key \"%@\" maps to unexpected class", @"fs"];
    v24 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v17 = v14;
    uint64_t v18 = -3;
    goto LABEL_9;
  }
  self = [(ATXModeFeatureSet *)self initWithDictionary:v10];
  id v11 = self;
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_ERROR, "ATXModeFeatureSet: error initWithCoder: %@", (uint8_t *)&v4, 0xCu);
}

@end