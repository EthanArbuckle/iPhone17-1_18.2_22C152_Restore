@interface FCCKPrivateDatabaseServerChangeToken
+ (BOOL)supportsSecureCoding;
+ (id)_keyForDestination:(int64_t)a3;
+ (id)tokenByAddingCKToken:(id)a3 forDestination:(int64_t)a4 toToken:(id)a5;
- (BOOL)isEqual:(id)a3;
- (FCCKPrivateDatabaseServerChangeToken)init;
- (FCCKPrivateDatabaseServerChangeToken)initWithChangeTokensByDestination:(id)a3;
- (FCCKPrivateDatabaseServerChangeToken)initWithChangeTokensByDestinationKey:(id)a3;
- (FCCKPrivateDatabaseServerChangeToken)initWithCoder:(id)a3;
- (NSDictionary)changeTokensByDestinationKey;
- (id)changeTokenForDestination:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeTokensByDestinationKey:(id)a3;
@end

@implementation FCCKPrivateDatabaseServerChangeToken

- (FCCKPrivateDatabaseServerChangeToken)initWithChangeTokensByDestinationKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCKPrivateDatabaseServerChangeToken;
  v5 = [(FCCKPrivateDatabaseServerChangeToken *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    changeTokensByDestinationKey = v5->_changeTokensByDestinationKey;
    v5->_changeTokensByDestinationKey = (NSDictionary *)v6;
  }
  return v5;
}

- (FCCKPrivateDatabaseServerChangeToken)initWithChangeTokensByDestination:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__FCCKPrivateDatabaseServerChangeToken_initWithChangeTokensByDestination___block_invoke;
  v8[3] = &unk_1E5B55A00;
  id v4 = self;
  objc_super v9 = v4;
  v5 = objc_msgSend(a3, "fc_dictionaryByTransformingKeysWithBlock:", v8);
  uint64_t v6 = [(FCCKPrivateDatabaseServerChangeToken *)v4 initWithChangeTokensByDestinationKey:v5];

  return v6;
}

uint64_t __74__FCCKPrivateDatabaseServerChangeToken_initWithChangeTokensByDestination___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  uint64_t v4 = [v2 integerValue];

  return [v3 _keyForDestination:v4];
}

- (FCCKPrivateDatabaseServerChangeToken)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
    int v5 = 136315906;
    uint64_t v6 = "-[FCCKPrivateDatabaseServerChangeToken init]";
    __int16 v7 = 2080;
    v8 = "FCCKPrivateDatabaseServerChangeToken.m";
    __int16 v9 = 1024;
    int v10 = 43;
    __int16 v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      int v5 = v4;
    }
    else {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }
  id v6 = v5;

  __int16 v7 = (void *)MEMORY[0x1E4FBA8A8];
  v8 = [(FCCKPrivateDatabaseServerChangeToken *)self changeTokensByDestinationKey];
  __int16 v9 = [v6 changeTokensByDestinationKey];
  LOBYTE(v7) = objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9);

  return (char)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int v5 = [(FCCKPrivateDatabaseServerChangeToken *)self changeTokensByDestinationKey];
  id v6 = (void *)[v4 initWithChangeTokensByDestinationKey:v5];

  return v6;
}

- (FCCKPrivateDatabaseServerChangeToken)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  __int16 v9 = [v5 decodeObjectOfClasses:v8 forKey:@"changeTokensByDestinationKey"];

  int v10 = [(FCCKPrivateDatabaseServerChangeToken *)self initWithChangeTokensByDestinationKey:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCKPrivateDatabaseServerChangeToken *)self changeTokensByDestinationKey];
  [v4 encodeObject:v5 forKey:@"changeTokensByDestinationKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenByAddingCKToken:(id)a3 forDestination:(int64_t)a4 toToken:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  __int16 v9 = [(id)objc_opt_class() _keyForDestination:a4];
  v16 = v9;
  v17[0] = v8;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  __int16 v11 = (void *)MEMORY[0x1E4F1C9E8];
  v12 = [v7 changeTokensByDestinationKey];

  uint64_t v13 = objc_msgSend(v11, "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v10, v12);

  v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChangeTokensByDestinationKey:v13];
  return v14;
}

- (id)changeTokenForDestination:(int64_t)a3
{
  id v4 = [(FCCKPrivateDatabaseServerChangeToken *)self changeTokensByDestinationKey];
  id v5 = [(id)objc_opt_class() _keyForDestination:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

+ (id)_keyForDestination:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) < 2) {
    return @"Database";
  }
  if (a3)
  {
    if (a3 == 3) {
      return @"SecureDatabase";
    }
    else {
      return &stru_1EF8299B8;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v4 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
      int v5 = 136315906;
      uint64_t v6 = "+[FCCKPrivateDatabaseServerChangeToken _keyForDestination:]";
      __int16 v7 = 2080;
      id v8 = "FCCKPrivateDatabaseServerChangeToken.m";
      __int16 v9 = 1024;
      int v10 = 123;
      __int16 v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
    }
    return &stru_1EF8299B8;
  }
}

- (NSDictionary)changeTokensByDestinationKey
{
  return self->_changeTokensByDestinationKey;
}

- (void)setChangeTokensByDestinationKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end