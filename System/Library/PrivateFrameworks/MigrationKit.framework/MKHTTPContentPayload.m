@interface MKHTTPContentPayload
- (BOOL)isExcludedFromBackup;
- (BOOL)isRequired;
- (MKHTTPContentPayload)initWithHeaderValue:(id)a3;
- (void)setIsExcludedFromBackup:(BOOL)a3;
- (void)setIsRequired:(BOOL)a3;
@end

@implementation MKHTTPContentPayload

- (MKHTTPContentPayload)initWithHeaderValue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKHTTPContentPayload;
  v5 = [(MKHTTPContentPayload *)&v15 init];
  if (v5)
  {
    if (!v4)
    {
LABEL_12:
      v12 = 0;
      goto LABEL_13;
    }
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v4 options:0];
    id v14 = 0;
    v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v14];
    id v8 = v14;
    if (v8)
    {
      v9 = +[MKLog log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(MKHTTPContentPayload *)(uint64_t)v5 initWithHeaderValue:v9];
      }
LABEL_11:

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = +[MKLog log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MKHTTPContentPayload initWithHeaderValue:]((uint64_t)v5, v9);
      }
      goto LABEL_11;
    }
    v10 = [v7 objectForKeyedSubscript:@"is_required"];
    -[MKHTTPContentPayload setIsRequired:](v5, "setIsRequired:", [v10 BOOLValue]);

    v11 = [v7 objectForKeyedSubscript:@"is_excluded_from_backup"];
    -[MKHTTPContentPayload setIsExcludedFromBackup:](v5, "setIsExcludedFromBackup:", [v11 BOOLValue]);
  }
  v12 = v5;
LABEL_13:

  return v12;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setIsRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (BOOL)isExcludedFromBackup
{
  return self->_isExcludedFromBackup;
}

- (void)setIsExcludedFromBackup:(BOOL)a3
{
  self->_isExcludedFromBackup = a3;
}

- (void)initWithHeaderValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ could not initialize because it received an unexpected format.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithHeaderValue:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_22BFAC000, a3, OS_LOG_TYPE_ERROR, "%@ could not initialize because there was a json error. error=%@", (uint8_t *)&v6, 0x16u);
}

@end