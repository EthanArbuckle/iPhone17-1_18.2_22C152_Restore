@interface PPSMetricType
+ (BOOL)isValidMetricType:(int)a3 value:(unint64_t)a4;
+ (BOOL)isValidMetricTypeJSON:(id)a3;
+ (PPSMetricType)metricTypeWithJSONObject:(id)a3;
+ (PPSMetricType)metricTypeWithProto:(id)a3;
+ (id)absoluteMeasure;
+ (id)accumulatedNegativeMeasure;
+ (id)accumulatedPositiveMeasure;
+ (id)deltaMeasure;
+ (id)genericDimension;
+ (id)stateDimension;
- (PPSMetricType)initWithCategory:(int)a3 value:(unint64_t)a4;
- (id)json;
- (id)proto;
- (int)category;
- (unint64_t)value;
@end

@implementation PPSMetricType

- (id)json
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"category";
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PPSMetricType category](self, "category"));
  v7[1] = @"value";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PPSMetricType value](self, "value"));
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (PPSMetricType)metricTypeWithJSONObject:(id)a3
{
  id v3 = a3;
  if (+[PPSMetricType isValidMetricTypeJSON:v3])
  {
    v4 = [PPSMetricType alloc];
    v5 = [v3 objectForKeyedSubscript:@"category"];
    uint64_t v6 = [v5 unsignedIntValue];
    v7 = [v3 objectForKeyedSubscript:@"value"];
    v8 = -[PPSMetricType initWithCategory:value:](v4, "initWithCategory:value:", v6, [v7 unsignedIntegerValue]);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidMetricTypeJSON:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = PPSStorageLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.6();
    }
    goto LABEL_22;
  }
  v4 = [v3 objectForKeyedSubscript:@"category"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v24 = PPSStorageLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.5(v3);
    }
    goto LABEL_22;
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:@"category"];
  if (![v6 unsignedIntValue])
  {

LABEL_20:
    v24 = PPSMetricLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:](v3);
    }
    goto LABEL_22;
  }
  v7 = [v3 objectForKeyedSubscript:@"type"];
  unsigned int v8 = [v7 unsignedIntValue];

  if (v8 >= 3) {
    goto LABEL_20;
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:@"value"];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [v3 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
    {
      v24 = PPSStorageLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.4(v3);
      }
      goto LABEL_22;
    }
  }
  v13 = [v3 objectForKeyedSubscript:@"category"];
  int v14 = [v13 unsignedIntValue];

  if (v14 == 1)
  {
    v15 = [v3 objectForKeyedSubscript:@"value"];
    if ([v15 unsignedIntValue])
    {
      v16 = [v3 objectForKeyedSubscript:@"value"];
      unsigned int v17 = [v16 unsignedIntValue];

      if (v17 < 3) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v24 = PPSStorageLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:]();
    }
    goto LABEL_22;
  }
LABEL_11:
  v18 = [v3 objectForKeyedSubscript:@"category"];
  int v19 = [v18 unsignedIntValue];

  if (v19 == 2)
  {
    v20 = [v3 objectForKeyedSubscript:@"value"];
    if ([v20 unsignedIntValue])
    {
      v21 = [v3 objectForKeyedSubscript:@"value"];
      unsigned int v22 = [v21 unsignedIntValue];

      if (v22 < 5) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    v24 = PPSStorageLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:]();
    }
LABEL_22:

    BOOL v23 = 0;
    goto LABEL_23;
  }
LABEL_14:
  BOOL v23 = 1;
LABEL_23:

  return v23;
}

+ (PPSMetricType)metricTypeWithProto:(id)a3
{
  id v3 = a3;
  v4 = [PPSMetricType alloc];
  uint64_t v5 = [v3 category];
  uint64_t v6 = [v3 value];

  v7 = [(PPSMetricType *)v4 initWithCategory:v5 value:v6];
  return v7;
}

- (id)proto
{
  id v3 = objc_alloc_init(PPSPBMetricType);
  [(PPSPBMetricType *)v3 setCategory:[(PPSMetricType *)self category]];
  [(PPSPBMetricType *)v3 setValue:[(PPSMetricType *)self value]];
  return v3;
}

- (PPSMetricType)initWithCategory:(int)a3 value:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (+[PPSMetricType isValidMetricType:value:](PPSMetricType, "isValidMetricType:value:"))
  {
    v17.receiver = self;
    v17.super_class = (Class)PPSMetricType;
    v7 = [(PPSMetricType *)&v17 init];
    if (v7)
    {
      v7->_category = v5;
      v7->_value = a4;
    }
    self = v7;
    unsigned int v8 = self;
  }
  else
  {
    uint64_t v9 = PPSMetricLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricType initWithCategory:value:](v5, v9, v10, v11, v12, v13, v14, v15);
    }

    unsigned int v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidMetricType:(int)a3 value:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  if ((a3 - 3) <= 0xFFFFFFFD)
  {
    uint64_t v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType isValidMetricType:value:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_4:

    return 0;
  }
  if (a3 == 1)
  {
    if (!a4)
    {
      uint64_t v5 = PPSMetricLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:](v5, v13, v14, v15, v16, v17, v18, v19);
      }
      goto LABEL_4;
    }
    if (a4 >= 3)
    {
      uint64_t v5 = PPSMetricLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:]();
      }
      goto LABEL_4;
    }
  }
  else
  {
    if (!a4)
    {
      uint64_t v5 = PPSMetricLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:].cold.4(v5, v20, v21, v22, v23, v24, v25, v26);
      }
      goto LABEL_4;
    }
    if (a4 >= 5)
    {
      uint64_t v5 = PPSMetricLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:].cold.5();
      }
      goto LABEL_4;
    }
  }
  return 1;
}

+ (id)genericDimension
{
  if (genericDimension_onceToken != -1) {
    dispatch_once(&genericDimension_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)genericDimension__genericDimension;
  return v2;
}

uint64_t __33__PPSMetricType_genericDimension__block_invoke()
{
  genericDimension__genericDimension = [[PPSMetricType alloc] initWithCategory:1 value:1];
  return MEMORY[0x270F9A758]();
}

+ (id)stateDimension
{
  if (stateDimension_onceToken != -1) {
    dispatch_once(&stateDimension_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)stateDimension__stateDimension;
  return v2;
}

uint64_t __31__PPSMetricType_stateDimension__block_invoke()
{
  stateDimension__stateDimension = [[PPSMetricType alloc] initWithCategory:1 value:2];
  return MEMORY[0x270F9A758]();
}

+ (id)absoluteMeasure
{
  if (absoluteMeasure_onceToken != -1) {
    dispatch_once(&absoluteMeasure_onceToken, &__block_literal_global_4_0);
  }
  v2 = (void *)absoluteMeasure__absoluteMeasure;
  return v2;
}

uint64_t __32__PPSMetricType_absoluteMeasure__block_invoke()
{
  absoluteMeasure__absoluteMeasure = [[PPSMetricType alloc] initWithCategory:2 value:1];
  return MEMORY[0x270F9A758]();
}

+ (id)accumulatedNegativeMeasure
{
  if (accumulatedNegativeMeasure_onceToken != -1) {
    dispatch_once(&accumulatedNegativeMeasure_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)accumulatedNegativeMeasure__accumulatedNegativeMeasure;
  return v2;
}

uint64_t __43__PPSMetricType_accumulatedNegativeMeasure__block_invoke()
{
  accumulatedNegativeMeasure__accumulatedNegativeMeasure = [[PPSMetricType alloc] initWithCategory:2 value:2];
  return MEMORY[0x270F9A758]();
}

+ (id)accumulatedPositiveMeasure
{
  if (accumulatedPositiveMeasure_onceToken != -1) {
    dispatch_once(&accumulatedPositiveMeasure_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)accumulatedPositiveMeasure__accumulatedPositiveMeasure;
  return v2;
}

uint64_t __43__PPSMetricType_accumulatedPositiveMeasure__block_invoke()
{
  accumulatedPositiveMeasure__accumulatedPositiveMeasure = [[PPSMetricType alloc] initWithCategory:2 value:3];
  return MEMORY[0x270F9A758]();
}

+ (id)deltaMeasure
{
  if (deltaMeasure_onceToken != -1) {
    dispatch_once(&deltaMeasure_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)deltaMeasure__deltaMeasure;
  return v2;
}

uint64_t __29__PPSMetricType_deltaMeasure__block_invoke()
{
  deltaMeasure__deltaMeasure = [[PPSMetricType alloc] initWithCategory:2 value:4];
  return MEMORY[0x270F9A758]();
}

- (int)category
{
  return self->_category;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithCategory:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidMetricType:value:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  int v2 = 1;
  _os_log_error_impl(&dword_258ED8000, v0, OS_LOG_TYPE_ERROR, "Invalid value %llu for specified category %d", v1, 0x12u);
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidMetricType:value:.cold.5()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  int v2 = 2;
  _os_log_error_impl(&dword_258ED8000, v0, OS_LOG_TYPE_ERROR, "Invalid value %llu for specified category %d", v1, 0x12u);
}

@end