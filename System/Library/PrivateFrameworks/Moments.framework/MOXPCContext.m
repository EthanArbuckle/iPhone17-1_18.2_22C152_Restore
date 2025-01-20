@interface MOXPCContext
+ (BOOL)supportsSecureCoding;
- (MOXPCContext)init;
- (MOXPCContext)initWithCoder:(id)a3;
- (NSString)xpcProcessName;
- (id)decodeToDictionary:(id)a3;
- (id)encodeDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOXPCContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOXPCContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)MOXPCContext;
  v2 = [(MOXPCContext *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    v5 = [MEMORY[0x1E4F28F80] processInfo];
    v6 = [v5 processName];
    [(NSMutableDictionary *)v2->_configuration setObject:v6 forKeyedSubscript:@"ProcessName"];

    v7 = v2;
  }

  return v2;
}

- (MOXPCContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MOXPCContext *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProcessName"];
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    configuration = v5->_configuration;
    v5->_configuration = v7;

    [(NSMutableDictionary *)v5->_configuration setObject:v6 forKeyedSubscript:@"ProcessName"];
    objc_super v9 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  configuration = self->_configuration;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)configuration objectForKeyedSubscript:@"ProcessName"];
  [v4 encodeObject:v5 forKey:@"ProcessName"];
}

- (NSString)xpcProcessName
{
  return (NSString *)[(NSMutableDictionary *)self->_configuration objectForKey:@"ProcessName"];
}

- (id)encodeDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v9 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MOXPCContext encodeDictionary:](v9);
    }

    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = v10;
    v11 = @"Invalid parameter not satisfying: value";
    SEL v12 = a2;
    v13 = self;
    uint64_t v14 = 62;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MOXPCContext encodeDictionary:](v15);
    }

    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = v10;
    v11 = @"Invalid parameter not satisfying: [value isKindOfClass:[NSDictionary class]]";
    SEL v12 = a2;
    v13 = self;
    uint64_t v14 = 63;
LABEL_12:
    [v10 handleFailureInMethod:v12 object:v13 file:@"MOXPCContext.m" lineNumber:v14 description:v11];
    id v8 = 0;
    goto LABEL_17;
  }
  id v18 = 0;
  v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v18];
  id v7 = v18;
  if (v7 || !v6)
  {
    v16 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[MODictionaryEncoder encodeDictionary:]((uint64_t)v7, v16);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = v6;
  }

LABEL_17:
  return v8;
}

- (id)decodeToDictionary:(id)a3
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
      -[MOXPCContext decodeToDictionary:](v6);
    }

    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOXPCContext.m", 83, @"Object is not of data type (in %s:%d)", "-[MOXPCContext decodeToDictionary:]", 83);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = 0;
    id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v13];
    id v9 = v13;
    if (v9 || !v8)
    {
      v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MOXPCContext decodeToDictionary:]((uint64_t)v9, v11);
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

- (void).cxx_destruct
{
}

- (void)encodeDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: value", v1, 2u);
}

- (void)encodeDictionary:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [value isKindOfClass:[NSDictionary class]]", v1, 2u);
}

- (void)decodeToDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "Error when serialization to dictionary, %@", (uint8_t *)&v2, 0xCu);
}

- (void)decodeToDictionary:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  int v2 = "-[MOXPCContext decodeToDictionary:]";
  __int16 v3 = 1024;
  int v4 = 83;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end