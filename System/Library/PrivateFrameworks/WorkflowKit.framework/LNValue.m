@interface LNValue
@end

@implementation LNValue

uint64_t __114__LNValue_Serialization__valueFromSerializedRepresentation_valueType_variableProvider_parameter_bundleIdentifier___block_invoke(void *a1, uint64_t a2)
{
  return [MEMORY[0x1E4F72E10] valueFromSerializedRepresentation:a2 valueType:a1[4] variableProvider:a1[5] parameter:a1[6]];
}

uint64_t __114__LNValue_Serialization__valueFromSerializedRepresentation_valueType_variableProvider_parameter_bundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 identifier];
  v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

@end