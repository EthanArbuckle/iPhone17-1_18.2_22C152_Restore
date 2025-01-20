@interface PPSRounding
+ (BOOL)isValidRounding:(int)a3 value:(unint64_t)a4;
+ (BOOL)isValidRoundingJSON:(id)a3;
+ (PPSRounding)roundingWithJSONObject:(id)a3;
+ (PPSRounding)roundingWithProto:(id)a3;
+ (id)roundDown;
+ (id)roundNearest;
+ (id)roundUp;
- (PPSRounding)initWithType:(int)a3 value:(unint64_t)a4;
- (id)json;
- (id)proto;
- (int)type;
- (unint64_t)value;
@end

@implementation PPSRounding

- (id)json
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"type";
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PPSRounding type](self, "type"));
  v7[1] = @"value";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PPSRounding value](self, "value"));
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (PPSRounding)roundingWithJSONObject:(id)a3
{
  id v3 = a3;
  if (+[PPSRounding isValidRoundingJSON:v3])
  {
    v4 = [PPSRounding alloc];
    v5 = [v3 objectForKeyedSubscript:@"type"];
    uint64_t v6 = [v5 unsignedIntValue];
    v7 = [v3 objectForKeyedSubscript:@"value"];
    v8 = -[PPSRounding initWithType:value:](v4, "initWithType:value:", v6, [v7 unsignedIntegerValue]);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidRoundingJSON:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = PPSStorageLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.6();
    }
    goto LABEL_17;
  }
  v4 = [v3 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v14 = PPSStorageLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.5(v3);
    }
    goto LABEL_17;
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:@"type"];
  if (![v6 unsignedIntValue])
  {

LABEL_15:
    v14 = PPSMetricLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:](v3);
    }
    goto LABEL_17;
  }
  v7 = [v3 objectForKeyedSubscript:@"type"];
  unsigned int v8 = [v7 unsignedIntValue];

  if (v8 >= 6) {
    goto LABEL_15;
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
      v14 = PPSStorageLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[PPSRounding(JSON) isValidRoundingJSON:].cold.4(v3);
      }
      goto LABEL_17;
    }
  }
  v13 = [v3 objectForKeyedSubscript:@"type"];
  if ([v13 unsignedIntValue] == 4)
  {
  }
  else
  {
    v16 = [v3 objectForKeyedSubscript:@"type"];
    int v17 = [v16 unsignedIntValue];

    if (v17 != 5) {
      goto LABEL_20;
    }
  }
  v18 = [v3 objectForKeyedSubscript:@"value"];

  if (!v18)
  {
    v14 = PPSStorageLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:](v3);
    }
    goto LABEL_17;
  }
LABEL_20:
  v19 = [v3 objectForKeyedSubscript:@"value"];
  [v19 doubleValue];
  double v21 = v20;

  v22 = [v3 objectForKeyedSubscript:@"value"];
  unint64_t v23 = [v22 unsignedIntegerValue];

  if (v21 >= 0.0 && round(v21) == (double)v23)
  {
LABEL_24:
    BOOL v15 = 1;
    goto LABEL_25;
  }
  v14 = PPSStorageLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[PPSRounding(JSON) isValidRoundingJSON:](v3);
  }
LABEL_17:

  BOOL v15 = 0;
LABEL_25:

  return v15;
}

+ (PPSRounding)roundingWithProto:(id)a3
{
  id v3 = a3;
  v4 = [PPSRounding alloc];
  uint64_t v5 = [v3 type];
  uint64_t v6 = [v3 value];

  v7 = [(PPSRounding *)v4 initWithType:v5 value:v6];
  return v7;
}

- (id)proto
{
  id v3 = objc_alloc_init(PPSPBRounding);
  [(PPSPBRounding *)v3 setType:[(PPSRounding *)self type]];
  [(PPSPBRounding *)v3 setValue:[(PPSRounding *)self value]];
  return v3;
}

- (PPSRounding)initWithType:(int)a3 value:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (+[PPSRounding isValidRounding:value:](PPSRounding, "isValidRounding:value:"))
  {
    v17.receiver = self;
    v17.super_class = (Class)PPSRounding;
    v7 = [(PPSRounding *)&v17 init];
    if (v7)
    {
      v7->_type = v5;
      v7->_value = a4;
    }
    self = v7;
    unsigned int v8 = self;
  }
  else
  {
    uint64_t v9 = PPSMetricLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PPSRounding initWithType:value:](v5, v9, v10, v11, v12, v13, v14, v15);
    }

    unsigned int v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidRounding:(int)a3 value:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  if ((a3 - 6) <= 0xFFFFFFFA)
  {
    uint64_t v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PPSRounding initWithType:value:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_8:

    return 0;
  }
  BOOL result = 1;
  if ((a3 & 0xFFFFFFFE) == 4 && !a4)
  {
    uint64_t v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding isValidRounding:value:](v4, v5, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_8;
  }
  return result;
}

+ (id)roundNearest
{
  if (roundNearest_onceToken != -1) {
    dispatch_once(&roundNearest_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)roundNearest__nearest;
  return v2;
}

uint64_t __27__PPSRounding_roundNearest__block_invoke()
{
  roundNearest__nearest = [[PPSRounding alloc] initWithType:3 value:0];
  return MEMORY[0x270F9A758]();
}

+ (id)roundDown
{
  if (roundDown_onceToken != -1) {
    dispatch_once(&roundDown_onceToken, &__block_literal_global_2_0);
  }
  v2 = (void *)roundDown__down;
  return v2;
}

uint64_t __24__PPSRounding_roundDown__block_invoke()
{
  roundDown__down = [[PPSRounding alloc] initWithType:1 value:0];
  return MEMORY[0x270F9A758]();
}

+ (id)roundUp
{
  if (roundUp_onceToken != -1) {
    dispatch_once(&roundUp_onceToken, &__block_literal_global_4_1);
  }
  v2 = (void *)roundUp__up;
  return v2;
}

uint64_t __22__PPSRounding_roundUp__block_invoke()
{
  roundUp__up = [[PPSRounding alloc] initWithType:2 value:0];
  return MEMORY[0x270F9A758]();
}

- (int)type
{
  return self->_type;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithType:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidRounding:(uint64_t)a3 value:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end