@interface ICScheme
- (BOOL)canLaunchApp;
- (BOOL)isAvailable;
- (BOOL)isCallbackScheme;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesURL:(id)a3;
- (ICApp)app;
- (ICScheme)initWithDefinition:(id)a3 app:(id)a4;
- (NSArray)actions;
- (NSArray)capabilities;
- (NSDictionary)definition;
- (NSString)callbackCancelURLKey;
- (NSString)callbackErrorURLKey;
- (NSString)callbackSourceNameKey;
- (NSString)callbackSuccessURLKey;
- (NSString)scheme;
- (NSURL)universalLinkBaseURL;
- (id)description;
- (unint64_t)hash;
@end

@implementation ICScheme

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_destroyWeak((id *)&self->_app);
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (ICApp)app
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_app);
  return (ICApp *)WeakRetained;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)ICScheme;
  v4 = [(ICScheme *)&v10 description];
  v5 = [(ICScheme *)self scheme];
  v6 = [(ICScheme *)self app];
  v7 = [v6 localizedName];
  v8 = [v3 stringWithFormat:@"%@: %@ from %@", v4, v5, v7];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ICScheme *)self definition];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICScheme *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(ICScheme *)self definition];
      v6 = [(ICScheme *)v4 definition];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)callbackErrorURLKey
{
  unint64_t v3 = [(ICScheme *)self capabilities];
  char v4 = [v3 containsObject:@"x-callback"];

  if (v4)
  {
    v5 = @"x-error";
  }
  else
  {
    v6 = [(ICScheme *)self definition];
    v5 = [v6 objectForKey:@"CallbackErrorURLKey"];
  }
  return (NSString *)v5;
}

- (NSString)callbackCancelURLKey
{
  unint64_t v3 = [(ICScheme *)self capabilities];
  char v4 = [v3 containsObject:@"x-callback"];

  if (v4)
  {
    v5 = @"x-cancel";
  }
  else
  {
    v6 = [(ICScheme *)self definition];
    v5 = [v6 objectForKey:@"CallbackCancelURLKey"];
  }
  return (NSString *)v5;
}

- (NSString)callbackSuccessURLKey
{
  unint64_t v3 = [(ICScheme *)self capabilities];
  char v4 = [v3 containsObject:@"x-callback"];

  if (v4)
  {
    v5 = @"x-success";
  }
  else
  {
    v6 = [(ICScheme *)self definition];
    v5 = [v6 objectForKey:@"CallbackSuccessURLKey"];
  }
  return (NSString *)v5;
}

- (NSString)callbackSourceNameKey
{
  unint64_t v3 = [(ICScheme *)self capabilities];
  char v4 = [v3 containsObject:@"x-callback"];

  if (v4)
  {
    v5 = @"x-source";
  }
  else
  {
    v6 = [(ICScheme *)self definition];
    v5 = [v6 objectForKey:@"CallbackSourceNameKey"];
  }
  return (NSString *)v5;
}

- (BOOL)isCallbackScheme
{
  unint64_t v3 = [(ICScheme *)self capabilities];
  if ([v3 containsObject:@"x-callback"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(ICScheme *)self capabilities];
    char v4 = [v5 containsObject:@"custom-callback"];
  }
  return v4;
}

- (BOOL)matchesURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 scheme];
  v6 = [v5 lowercaseString];

  char v7 = [(ICScheme *)self scheme];
  v8 = [v7 lowercaseString];
  char v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    char v10 = 1;
  }
  else if (([v6 isEqualToString:@"http"] & 1) != 0 {
         || [v6 isEqualToString:@"https"])
  }
  {
    v11 = [(ICScheme *)self universalLinkBaseURL];
    if (v11)
    {
      v12 = [v4 host];
      v13 = [v11 host];
      if ([v12 isEqualToString:v13])
      {
        v14 = [v4 path];
        v15 = [v11 path];
        char v10 = [v14 hasPrefix:v15];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSURL)universalLinkBaseURL
{
  v2 = [(ICScheme *)self definition];
  unint64_t v3 = [v2 objectForKey:@"UniversalLinkBaseURL"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)canLaunchApp
{
  v2 = [(ICScheme *)self definition];
  unint64_t v3 = [v2 objectForKey:@"SchemeCannotLaunchApp"];
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (BOOL)isAvailable
{
  unint64_t v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  char v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [(ICScheme *)self scheme];
  v6 = [v5 stringByAppendingString:@":"];
  char v7 = [v4 URLWithString:v6];
  char v8 = [v3 canOpenURL:v7];

  return v8;
}

- (ICScheme)initWithDefinition:(id)a3 app:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = [(ICScheme *)self init];
  char v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_app, v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v7 copy];
      scheme = v10->_scheme;
      v10->_scheme = (NSString *)v11;

LABEL_42:
      v19 = v10;
      goto LABEL_43;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v7 copy];
      definition = v10->_definition;
      v10->_definition = (NSDictionary *)v13;

      v15 = [(ICScheme *)v10 definition];
      v16 = [v15 objectForKey:@"Scheme"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v18 = v17;
          }
          else {
            v18 = 0;
          }
        }
        else
        {
          v18 = 0;
        }
        v22 = v18;

        v23 = v10->_scheme;
        v10->_scheme = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_26:
          if (!v10->_scheme)
          {
            v46 = [MEMORY[0x1E4F28B00] currentHandler];
            [v46 handleFailureInMethod:a2 object:v10 file:@"ICScheme.m" lineNumber:71 description:@"ICScheme definitions must include a Scheme key."];
          }
          v28 = [(ICScheme *)v10 definition];
          uint64_t v29 = [v28 objectForKey:@"Capabilities"];
          capabilities = v10->_capabilities;
          v10->_capabilities = (NSArray *)v29;

          v31 = [(ICScheme *)v10 definition];
          v32 = [v31 objectForKey:@"Actions"];

          if ([v32 count])
          {
            v48 = v16;
            id v49 = v8;
            id v50 = v7;
            v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            v47 = v32;
            id v34 = v32;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v55 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v52;
              do
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v52 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v39 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                  objc_msgSend(v39, "objectForKey:", @"ActionClass", v47);
                  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v41 = NSClassFromString(v40);
                  if (!v41) {
                    v41 = (objc_class *)objc_opt_class();
                  }
                  v42 = (void *)[[v41 alloc] initWithDefinition:v39 scheme:v10];
                  if (v42) {
                    [v33 addObject:v42];
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v55 count:16];
              }
              while (v36);
            }

            uint64_t v43 = [v33 copy];
            actions = v10->_actions;
            v10->_actions = (NSArray *)v43;

            id v8 = v49;
            id v7 = v50;
            v32 = v47;
            v16 = v48;
          }

          goto LABEL_42;
        }
        id v20 = v16;
        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v21 = v20;
          }
          else {
            v21 = 0;
          }
        }
        else
        {
          v21 = 0;
        }
        v23 = v21;

        v24 = [(NSString *)v23 objectForKey:@"Phone"];
        if (v24)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v25 = v24;
          }
          else {
            v25 = 0;
          }
        }
        else
        {
          v25 = 0;
        }
        v26 = v25;

        v27 = v10->_scheme;
        v10->_scheme = v26;
      }
      goto LABEL_26;
    }
  }
  v19 = 0;
LABEL_43:

  return v19;
}

@end