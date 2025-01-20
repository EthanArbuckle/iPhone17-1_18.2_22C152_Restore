@interface MKAccount
- (MKAccount)initWithData:(id)a3;
- (NSString)name;
- (NSString)type;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MKAccount

- (MKAccount)initWithData:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKAccount;
  v5 = [(MKAccount *)&v17 init];
  if (v5)
  {
    id v16 = 0;
    v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v16];
    id v7 = v16;
    if (v7)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(MKAccount *)(uint64_t)v5 initWithData:v8];
      }
LABEL_12:

      v14 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKAccount initWithData:]((uint64_t)v5, v8);
      }
      goto LABEL_12;
    }
    id v9 = v6;
    v10 = [v9 objectForKey:@"name"];
    [(MKAccount *)v5 setName:v10];

    v11 = [v9 objectForKey:@"type"];
    [(MKAccount *)v5 setType:v11];

    v12 = +[MKLog log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      type = v5->_type;
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = type;
      _os_log_impl(&dword_22BFAC000, v12, OS_LOG_TYPE_INFO, "%@ did receive an account. type=%@", buf, 0x16u);
    }
  }
  v14 = v5;
LABEL_13:

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ could not initialize because an invalid json format was received.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithData:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "%@ could not initialize because an underlying error occurred unexpectedly. error=%@", (uint8_t *)&v3, 0x16u);
}

@end