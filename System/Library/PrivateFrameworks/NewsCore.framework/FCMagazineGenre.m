@interface FCMagazineGenre
+ (id)magazineGenreWithGenre:(id)a3 localizedDescription:(id)a4;
- (BOOL)isEqual:(id)a3;
- (FCMagazineGenre)init;
- (FCMagazineGenre)initWithConfigDictionary:(id)a3;
- (FCMagazineGenre)initWithGenre:(id)a3 localizedDescription:(id)a4;
- (NSString)genre;
- (NSString)localizedDescription;
- (unint64_t)hash;
- (void)setGenre:(id)a3;
- (void)setLocalizedDescription:(id)a3;
@end

@implementation FCMagazineGenre

- (FCMagazineGenre)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCMagazineGenre init]";
    __int16 v9 = 2080;
    v10 = "FCMagazineGenre.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCMagazineGenre init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCMagazineGenre)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"genre", 0);
  id v6 = FCAppConfigurationStringValue(v4, @"localizedDescription", 0);

  v7 = [(FCMagazineGenre *)self initWithGenre:v5 localizedDescription:v6];
  return v7;
}

- (FCMagazineGenre)initWithGenre:(id)a3 localizedDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCMagazineGenre;
  v8 = [(FCMagazineGenre *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    genre = v8->_genre;
    v8->_genre = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    localizedDescription = v8->_localizedDescription;
    v8->_localizedDescription = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4FBA8A8];
    v8 = [(FCMagazineGenre *)self genre];
    uint64_t v9 = [v6 genre];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E4FBA8A8];
      uint64_t v11 = [(FCMagazineGenre *)self localizedDescription];
      int v12 = [v6 localizedDescription];
      char v13 = objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12);
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(FCMagazineGenre *)self genre];
  uint64_t v4 = [v3 hash];
  v5 = [(FCMagazineGenre *)self localizedDescription];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (id)magazineGenreWithGenre:(id)a3 localizedDescription:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[FCMagazineGenre alloc] initWithGenre:v6 localizedDescription:v5];

  return v7;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_genre, 0);
}

@end