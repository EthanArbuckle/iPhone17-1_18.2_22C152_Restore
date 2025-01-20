@interface PPSCadenceTuple
+ (BOOL)isValidCadenceTupleJSON:(id)a3;
+ (id)cadenceTupleWithJSONObject:(id)a3;
- (PPSCadenceTuple)initWithCadenceType:(int)a3 value:(unint64_t)a4;
- (int)type;
- (unint64_t)value;
@end

@implementation PPSCadenceTuple

+ (id)cadenceTupleWithJSONObject:(id)a3
{
  id v3 = a3;
  if (+[PPSCadenceTuple isValidCadenceTupleJSON:v3])
  {
    v4 = [PPSCadenceTuple alloc];
    v5 = [v3 objectForKeyedSubscript:@"type"];
    uint64_t v6 = [v5 unsignedIntValue];
    v7 = [v3 objectForKeyedSubscript:@"value"];
    v8 = -[PPSCadenceTuple initWithCadenceType:value:](v4, "initWithCadenceType:value:", v6, [v7 unsignedIntegerValue]);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidCadenceTupleJSON:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = PPSStorageLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.4();
    }
    goto LABEL_14;
  }
  v4 = [v3 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v11 = PPSStorageLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:](v3);
    }
    goto LABEL_14;
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    v11 = PPSStorageLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:](v3);
    }
    goto LABEL_14;
  }
  v8 = [v3 objectForKeyedSubscript:@"value"];
  uint64_t v9 = [v8 integerValue];

  if (v9 < 0)
  {
    v11 = PPSStorageLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:](v3);
    }
LABEL_14:

    BOOL v10 = 0;
    goto LABEL_15;
  }
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (PPSCadenceTuple)initWithCadenceType:(int)a3 value:(unint64_t)a4
{
  v5 = self;
  if ((a3 - 6) <= 0xFFFFFFFA)
  {
    uint64_t v6 = PPSMetricLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:](a3, v6);
    }
LABEL_4:

LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  if (a3 == 4 && a4)
  {
    v8 = PPSMetricLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:]();
    }
LABEL_13:

    goto LABEL_14;
  }
  if (a3 == 3 && a4 - 12 <= 0xFFFFFFFFFFFFFFF4)
  {
    v8 = PPSMetricLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:]();
    }
    goto LABEL_13;
  }
  if (a3 == 5 && !a4)
  {
    uint64_t v6 = PPSMetricLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:].cold.4(v6);
    }
    goto LABEL_4;
  }
  v12.receiver = self;
  v12.super_class = (Class)PPSCadenceTuple;
  v11 = [(PPSCadenceTuple *)&v12 init];
  if (v11)
  {
    v11->_type = a3;
    v11->_value = a4;
  }
  v5 = v11;
  uint64_t v9 = v5;
LABEL_15:

  return v9;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithCadenceType:(int)a1 value:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_258ED8000, a2, OS_LOG_TYPE_ERROR, "Invalid cadence type %d", (uint8_t *)v2, 8u);
}

- (void)initWithCadenceType:value:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  int v2 = 4;
  _os_log_error_impl(&dword_258ED8000, v0, OS_LOG_TYPE_ERROR, "Non zero value %llu sent for %d", v1, 0x12u);
}

- (void)initWithCadenceType:value:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  int v2 = 3;
  _os_log_error_impl(&dword_258ED8000, v0, OS_LOG_TYPE_ERROR, "Unknown event %llu sent for %d", v1, 0x12u);
}

- (void)initWithCadenceType:(os_log_t)log value:.cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_258ED8000, log, OS_LOG_TYPE_ERROR, "Invalid XPC cadence type  %llu", (uint8_t *)&v1, 0xCu);
}

@end