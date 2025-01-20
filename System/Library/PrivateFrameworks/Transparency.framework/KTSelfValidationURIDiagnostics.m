@interface KTSelfValidationURIDiagnostics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KTSelfValidationURIDiagnostics)initWithCoder:(id)a3;
- (NSDate)requestTime;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSDictionary)ktVerificationInfoDiagnosticsJson;
- (NSDictionary)transparentDataDiagnosticsJson;
- (NSError)error;
- (NSString)result;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setKtVerificationInfoDiagnosticsJson:(id)a3;
- (void)setRequestTime:(id)a3;
- (void)setResult:(id)a3;
- (void)setTransparentDataDiagnosticsJson:(id)a3;
@end

@implementation KTSelfValidationURIDiagnostics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  v4 = [(KTSelfValidationURIDiagnostics *)self ktVerificationInfoDiagnosticsJson];
  [v13 encodeObject:v4 forKey:@"KTVerificationInfo"];

  v5 = [(KTSelfValidationURIDiagnostics *)self transparentDataDiagnosticsJson];
  [v13 encodeObject:v5 forKey:@"transparentData"];

  v6 = [(KTSelfValidationURIDiagnostics *)self result];
  [v13 encodeObject:v6 forKey:@"result"];

  v7 = [(KTSelfValidationURIDiagnostics *)self requestTime];

  if (v7)
  {
    v8 = [(KTSelfValidationURIDiagnostics *)self requestTime];
    [v13 encodeObject:v8 forKey:@"requestTime"];
  }
  v9 = [(KTSelfValidationURIDiagnostics *)self error];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F16D80];
    v11 = [(KTSelfValidationURIDiagnostics *)self error];
    v12 = [v10 cleanseErrorForXPC:v11];
    [v13 encodeObject:v12 forKey:@"error"];
  }
}

- (KTSelfValidationURIDiagnostics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[KTSelfValidationDiagnostics jsonClasses];
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"KTVerificationInfo"];

  v7 = +[KTSelfValidationDiagnostics jsonClasses];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"transparentData"];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
  v10 = [MEMORY[0x263F16D80] safeErrorClasses];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"error"];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestTime"];

  if (!v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_0 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_0, &__block_literal_global_1);
    }
    id v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v13, OS_LOG_TYPE_ERROR, "KTSelfValidationURIDiagnostics: ktVerificationInfoDiagnosticsJson missing", buf, 2u);
    }
  }
  v14 = v8;
  if (!v8)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_0 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_0, &__block_literal_global_21);
    }
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_226345000, v15, OS_LOG_TYPE_ERROR, "KTSelfValidationURIDiagnostics: transparentDataDiagnosticsJson missing", v23, 2u);
    }
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_0 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_0, &__block_literal_global_24);
    }
    v16 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_226345000, v16, OS_LOG_TYPE_ERROR, "KTSelfValidationURIDiagnostics: result missing", v22, 2u);
    }
    v14 = (void *)MEMORY[0x263EFFA78];
  }
  v17 = objc_alloc_init(KTSelfValidationURIDiagnostics);
  v18 = v17;
  if (v6) {
    v19 = v6;
  }
  else {
    v19 = (void *)MEMORY[0x263EFFA78];
  }
  [(KTSelfValidationURIDiagnostics *)v17 setKtVerificationInfoDiagnosticsJson:v19];
  [(KTSelfValidationURIDiagnostics *)v18 setTransparentDataDiagnosticsJson:v14];
  if (v9) {
    v20 = v9;
  }
  else {
    v20 = @"-";
  }
  [(KTSelfValidationURIDiagnostics *)v18 setResult:v20];
  [(KTSelfValidationURIDiagnostics *)v18 setError:v11];
  [(KTSelfValidationURIDiagnostics *)v18 setRequestTime:v12];

  return v18;
}

uint64_t __48__KTSelfValidationURIDiagnostics_initWithCoder___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __48__KTSelfValidationURIDiagnostics_initWithCoder___block_invoke_19()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __48__KTSelfValidationURIDiagnostics_initWithCoder___block_invoke_22()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTSelfValidationURIDiagnostics *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(KTSelfValidationURIDiagnostics *)self ktVerificationInfoDiagnosticsJson];
      v7 = [(KTSelfValidationURIDiagnostics *)v5 ktVerificationInfoDiagnosticsJson];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        v9 = [(KTSelfValidationURIDiagnostics *)self transparentDataDiagnosticsJson];
        v10 = [(KTSelfValidationURIDiagnostics *)v5 transparentDataDiagnosticsJson];
        int v11 = [v9 isEqual:v10];

        if (v11)
        {
          v12 = [(KTSelfValidationURIDiagnostics *)self result];
          id v13 = [(KTSelfValidationURIDiagnostics *)v5 result];
          v14 = (void *)[v12 isEqual:v13];

          if (v14)
          {
            v15 = [(KTSelfValidationURIDiagnostics *)self error];
            if (v15)
            {
            }
            else
            {
              v17 = [(KTSelfValidationURIDiagnostics *)v5 error];

              if (!v17) {
                goto LABEL_13;
              }
            }
            v18 = [(KTSelfValidationURIDiagnostics *)v5 error];

            if (v18)
            {
              v19 = (void *)MEMORY[0x263F16D80];
              id v13 = [(KTSelfValidationURIDiagnostics *)self error];
              v20 = [v19 cleanseErrorForXPC:v13];
              v21 = (void *)MEMORY[0x263F16D80];
              v22 = [(KTSelfValidationURIDiagnostics *)v5 error];
              v14 = [v21 cleanseErrorForXPC:v22];
              int v23 = [v20 isEqual:v14];

              if (v23)
              {
LABEL_13:
                v24 = [(KTSelfValidationURIDiagnostics *)self requestTime];
                if (v24
                  && ([(KTSelfValidationURIDiagnostics *)self requestTime],
                      id v13 = objc_claimAutoreleasedReturnValue(),
                      [(KTSelfValidationURIDiagnostics *)v5 requestTime],
                      v14 = objc_claimAutoreleasedReturnValue(),
                      [v13 compare:v14]))
                {
                  BOOL v25 = 1;
                }
                else
                {
                  v27 = [(KTSelfValidationURIDiagnostics *)self requestTime];
                  if (v27)
                  {
                    BOOL v25 = 0;
                  }
                  else
                  {
                    v28 = [(KTSelfValidationURIDiagnostics *)v5 requestTime];
                    BOOL v25 = v28 != 0;
                  }
                  if (!v24) {
                    goto LABEL_24;
                  }
                }

LABEL_24:
                char v16 = !v25;
                goto LABEL_17;
              }
            }
          }
        }
      }
      char v16 = 0;
LABEL_17:

      goto LABEL_18;
    }
    char v16 = 0;
  }
LABEL_18:

  return v16;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(KTSelfValidationURIDiagnostics *)self result];

  if (v4)
  {
    v5 = [(KTSelfValidationURIDiagnostics *)self result];
    [v3 setObject:v5 forKeyedSubscript:@"result"];
  }
  v6 = [(KTSelfValidationURIDiagnostics *)self transparentDataDiagnosticsJson];

  if (v6)
  {
    v7 = [(KTSelfValidationURIDiagnostics *)self transparentDataDiagnosticsJson];
    [v3 setObject:v7 forKeyedSubscript:@"transparentData"];
  }
  int v8 = [(KTSelfValidationURIDiagnostics *)self ktVerificationInfoDiagnosticsJson];

  if (v8)
  {
    v9 = [(KTSelfValidationURIDiagnostics *)self ktVerificationInfoDiagnosticsJson];
    [v3 setObject:v9 forKeyedSubscript:@"KTVerificationInfo"];
  }
  v10 = [(KTSelfValidationURIDiagnostics *)self error];

  if (v10)
  {
    int v11 = [(KTSelfValidationURIDiagnostics *)self error];
    v12 = +[TransparencyError diagnosticError:v11];
    [v3 setObject:v12 forKeyedSubscript:@"error"];
  }
  id v13 = [(KTSelfValidationURIDiagnostics *)self requestTime];

  if (v13)
  {
    v14 = [(KTSelfValidationURIDiagnostics *)self requestTime];
    v15 = objc_msgSend(v14, "kt_dateToString");
    [v3 setObject:v15 forKeyedSubscript:@"requestTime"];

    char v16 = [(KTSelfValidationURIDiagnostics *)self requestTime];
    v17 = objc_msgSend(v16, "kt_toISO_8601_UTCString");
    [v3 setObject:v17 forKeyedSubscript:@"requestTimeReadable"];
  }
  if ([MEMORY[0x263F08900] isValidJSONObject:v3]) {
    id v18 = v3;
  }
  else {
    id v18 = 0;
  }

  return (NSDictionary *)v18;
}

- (id)description
{
  v2 = [(KTSelfValidationURIDiagnostics *)self diagnosticsJsonDictionary];
  v3 = [v2 description];

  return v3;
}

- (NSDictionary)ktVerificationInfoDiagnosticsJson
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKtVerificationInfoDiagnosticsJson:(id)a3
{
}

- (NSDictionary)transparentDataDiagnosticsJson
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransparentDataDiagnosticsJson:(id)a3
{
}

- (NSString)result
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
}

- (NSDate)requestTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequestTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_transparentDataDiagnosticsJson, 0);

  objc_storeStrong((id *)&self->_ktVerificationInfoDiagnosticsJson, 0);
}

@end