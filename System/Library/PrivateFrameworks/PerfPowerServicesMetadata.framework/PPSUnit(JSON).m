@interface PPSUnit(JSON)
@end

@implementation PPSUnit(JSON)

+ (void)isValidUnitJSON:()JSON .cold.1(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"symbol"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_258ED8000, v2, v3, "Unit symbol is not a string: %@", v4, v5, v6, v7, v8);
}

+ (void)isValidUnitJSON:()JSON .cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_258ED8000, v0, v1, "Unit json is not a dictionary: %@", v2);
}

@end