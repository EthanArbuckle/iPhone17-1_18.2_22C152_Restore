@interface BYLocaleCountry
+ (id)comparatorForLocale:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)code;
- (NSString)name;
- (id)description;
- (void)setCode:(id)a3;
- (void)setName:(id)a3;
@end

@implementation BYLocaleCountry

+ (id)comparatorForLocale:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__BYLocaleCountry_comparatorForLocale___block_invoke;
  v8[3] = &unk_1E5D2C2A8;
  id v9 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x1AD0DBFE0](v8);
  v6 = (void *)MEMORY[0x1AD0DBFE0]();

  return v6;
}

uint64_t __39__BYLocaleCountry_comparatorForLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [v6 name];
  v8 = [v5 name];

  id v9 = [v6 name];

  uint64_t v10 = objc_msgSend(v7, "compare:options:range:locale:", v8, 1, 0, objc_msgSend(v9, "length"), *(void *)(a1 + 32));
  return v10;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(BYLocaleCountry *)self code];
  id v5 = [(BYLocaleCountry *)self name];
  id v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(BYLocaleCountry *)self code];
    id v6 = [v4 code];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end