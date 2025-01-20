@interface MODictionaryEncoder
+ (id)decodeToDictionary:(id)a3;
+ (id)encodeDictionary:(id)a3;
@end

@implementation MODictionaryEncoder

+ (id)encodeDictionary:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[MODictionaryEncoder encodeDictionary:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    v5 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:0 error:&v10];
    id v6 = v10;
    if (v6 || !v5)
    {
      v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[MODictionaryEncoder encodeDictionary:]((uint64_t)v6, v8);
      }

      id v7 = 0;
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
LABEL_10:
    id v7 = 0;
  }

  return v7;
}

+ (id)decodeToDictionary:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[MODictionaryEncoder decodeToDictionary:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    v5 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:&v10];
    id v6 = v10;
    if (v6 || !v5)
    {
      v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[MODictionaryEncoder decodeToDictionary:]((uint64_t)v6, v8);
      }

      id v7 = 0;
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
LABEL_10:
    id v7 = 0;
  }

  return v7;
}

+ (void)encodeDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_259147000, a2, OS_LOG_TYPE_ERROR, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)encodeDictionary:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  int v2 = 23;
  _os_log_error_impl(&dword_259147000, v0, OS_LOG_TYPE_ERROR, "Object is not of dictionary type (in %s:%d)", v1, 0x12u);
}

+ (void)decodeToDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_259147000, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to dictionary, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)decodeToDictionary:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  int v2 = 46;
  _os_log_error_impl(&dword_259147000, v0, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", v1, 0x12u);
}

@end