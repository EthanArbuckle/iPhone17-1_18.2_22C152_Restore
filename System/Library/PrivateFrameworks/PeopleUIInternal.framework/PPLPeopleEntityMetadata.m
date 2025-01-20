@interface PPLPeopleEntityMetadata
- (BOOL)_isValidURL:(id)a3;
- (NSURL)url;
- (PPLPeopleEntityMetadata)initWithURL:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation PPLPeopleEntityMetadata

- (PPLPeopleEntityMetadata)initWithURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PPLPeopleEntityMetadata.m", 24, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PPLPeopleEntityMetadata;
  v7 = [(PPLPeopleEntityMetadata *)&v13 init];
  p_isa = (id *)&v7->super.isa;
  if (!v7) {
    goto LABEL_6;
  }
  if ([(PPLPeopleEntityMetadata *)v7 _isValidURL:v6])
  {
    objc_storeStrong(p_isa + 1, a3);
LABEL_6:
    v9 = p_isa;
    goto LABEL_10;
  }
  v10 = PPLPeopleViewServiceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[PPLPeopleEntityMetadata initWithURL:]((uint64_t)v6, v10);
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)_isValidURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"people"];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = [v6 queryItems];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v18 = v6;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_super v13 = [v12 name];
          if ([v13 isEqualToString:@"contactIdentifier"])
          {
          }
          else
          {
            v14 = [v12 name];
            int v15 = [v14 isEqualToString:@"priorities"];

            if (!v15)
            {
              BOOL v16 = 0;
              goto LABEL_15;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v16 = 1;
LABEL_15:
      id v6 = v18;
    }
    else
    {
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2225B4000, a2, OS_LOG_TYPE_ERROR, "this url is not supported: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end