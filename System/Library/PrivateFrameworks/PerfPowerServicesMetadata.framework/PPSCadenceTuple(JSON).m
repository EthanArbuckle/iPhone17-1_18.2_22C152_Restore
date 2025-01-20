@interface PPSCadenceTuple(JSON)
@end

@implementation PPSCadenceTuple(JSON)

+ (void)isValidCadenceTupleJSON:()JSON .cold.1(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"value"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_258ED8000, v2, v3, "Cadence value cannot be negative: %@", v4, v5, v6, v7, v8);
}

+ (void)isValidCadenceTupleJSON:()JSON .cold.2(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"value"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_258ED8000, v2, v3, "Cadence value is not a number: %@", v4, v5, v6, v7, v8);
}

+ (void)isValidCadenceTupleJSON:()JSON .cold.3(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"type"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_258ED8000, v2, v3, "Cadence type is not a number: %@", v4, v5, v6, v7, v8);
}

+ (void)isValidCadenceTupleJSON:()JSON .cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_258ED8000, v0, v1, "Cadence Tuple json is not a dictionary: %@", v2);
}

@end