@interface MODictionaryEncoder
+ (id)decodeToDictionary:(id)a3;
+ (id)encodeDictionary:(id)a3;
@end

@implementation MODictionaryEncoder

+ (id)encodeDictionary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MODictionaryEncoder encodeDictionary:]();
    }

    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MODictionaryEncoder.m", 23, @"Object is not of dictionary type (in %s:%d)", "+[MODictionaryEncoder encodeDictionary:]", 23);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = 0;
    v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v13];
    id v9 = v13;
    if (v9 || !v8)
    {
      v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[MODictionaryEncoder encodeDictionary:]((uint64_t)v9, v11);
      }

      id v10 = 0;
    }
    else
    {
      id v10 = v8;
    }
  }
  else
  {
LABEL_10:
    id v10 = 0;
  }

  return v10;
}

+ (id)decodeToDictionary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MODictionaryEncoder decodeToDictionary:]();
    }

    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MODictionaryEncoder.m", 46, @"Object is not of data type (in %s:%d)", "+[MODictionaryEncoder decodeToDictionary:]", 46);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = 0;
    v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v13];
    id v9 = v13;
    if (v9 || !v8)
    {
      v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[MODictionaryEncoder decodeToDictionary:]((uint64_t)v9, v11);
      }

      id v10 = 0;
    }
    else
    {
      id v10 = v8;
    }
  }
  else
  {
LABEL_10:
    id v10 = 0;
  }

  return v10;
}

+ (void)encodeDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)encodeDictionary:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  int v2 = 23;
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "Object is not of dictionary type (in %s:%d)", v1, 0x12u);
}

+ (void)decodeToDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to dictionary, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)decodeToDictionary:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  int v2 = 46;
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", v1, 0x12u);
}

@end