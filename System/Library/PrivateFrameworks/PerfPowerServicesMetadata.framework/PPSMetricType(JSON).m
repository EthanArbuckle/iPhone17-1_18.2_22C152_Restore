@interface PPSMetricType(JSON)
@end

@implementation PPSMetricType(JSON)

+ (void)isValidMetricTypeJSON:()JSON .cold.1(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"type"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_258ED8000, v2, v3, "MetricType category is invalid %@", v4, v5, v6, v7, v8);
}

+ (void)isValidMetricTypeJSON:()JSON .cold.2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = [v1 objectForKeyedSubscript:@"value"];
  uint64_t v3 = [v0 objectForKeyedSubscript:@"category"];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_258ED8000, v4, v5, "Dimension value is incorrect %@ for %@", v6, v7, v8, v9, v10);
}

+ (void)isValidMetricTypeJSON:()JSON .cold.3()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = [v1 objectForKeyedSubscript:@"value"];
  uint64_t v3 = [v0 objectForKeyedSubscript:@"category"];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_258ED8000, v4, v5, "Measure value is incorrect %@ for %@", v6, v7, v8, v9, v10);
}

+ (void)isValidMetricTypeJSON:()JSON .cold.4(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"value"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_258ED8000, v2, v3, "MetricType category value is not a number: %@", v4, v5, v6, v7, v8);
}

+ (void)isValidMetricTypeJSON:()JSON .cold.5(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"type"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_258ED8000, v2, v3, "MetricType category is not a number: %@", v4, v5, v6, v7, v8);
}

+ (void)isValidMetricTypeJSON:()JSON .cold.6()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_258ED8000, v0, v1, "MetricType json is not a dictionary: %@", v2);
}

@end