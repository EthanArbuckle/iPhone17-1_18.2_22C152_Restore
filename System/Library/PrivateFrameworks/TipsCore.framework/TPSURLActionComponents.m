@interface TPSURLActionComponents
+ (id)componentsWithURL:(id)a3;
+ (unint64_t)_actionTypeForString:(id)a3;
- (NSString)bundleID;
- (NSString)identifier;
- (NSURL)URL;
- (TPSURLActionComponents)initWithString:(id)a3;
- (TPSURLActionComponents)initWithURL:(id)a3;
- (unint64_t)actionType;
- (void)_parseURL:(id)a3;
- (void)setActionType:(unint64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation TPSURLActionComponents

- (unint64_t)actionType
{
  return self->_actionType;
}

+ (id)componentsWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

- (TPSURLActionComponents)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSURLActionComponents;
  v5 = [(TPSURLActionComponents *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TPSURLActionComponents *)v5 _parseURL:v4];
  }

  return v6;
}

- (void)_parseURL:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 absoluteString];
  v6 = [MEMORY[0x1E4F29088] componentsWithString:v5];
  [(TPSURLActionComponents *)self setActionType:0];
  v7 = [v6 scheme];
  int v8 = [v7 isEqualToString:@"tips"];

  if (!v8) {
    goto LABEL_37;
  }
  v9 = [v6 path];
  int v10 = [v9 isEqualToString:@"open"];

  if (!v10) {
    goto LABEL_37;
  }
  id v35 = v4;
  v36 = self;
  v33 = v6;
  v34 = v5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v11 = [v6 queryItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v12)
  {
    v14 = 0;
    v37 = 0;
    v15 = 0;
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  v14 = 0;
  v37 = 0;
  v15 = 0;
  uint64_t v16 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v39 != v16) {
        objc_enumerationMutation(v11);
      }
      v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      v19 = [v18 name];
      int v20 = [v19 isEqualToString:@"type"];

      if (v20)
      {
        [v18 value];
        v15 = v21 = v15;
      }
      else
      {
        v22 = [v18 name];
        int v23 = [v22 isEqualToString:@"url"];

        if (v23)
        {
          [v18 value];
          v14 = v21 = v14;
        }
        else
        {
          v24 = [v18 name];
          int v25 = [v24 isEqualToString:@"bundleId"];

          if (v25)
          {
            [v18 value];
            v37 = v21 = v37;
          }
          else
          {
            v26 = [v18 name];
            int v27 = [v26 isEqualToString:@"identifier"];

            if (!v27) {
              continue;
            }
            v21 = [v18 value];
            [(TPSURLActionComponents *)v36 setIdentifier:v21];
          }
        }
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  }
  while (v13);
LABEL_21:

  if ([v14 length])
  {
    -[TPSURLActionComponents setActionType:](v36, "setActionType:", [(id)objc_opt_class() _actionTypeForString:v15]);
    v28 = v37;
    if ([(TPSURLActionComponents *)v36 actionType]) {
      goto LABEL_23;
    }
    goto LABEL_36;
  }
  v28 = v37;
  if ([v15 isEqualToString:@"userGuide"])
  {
    [(TPSURLActionComponents *)v36 setActionType:9];
    [(TPSURLActionComponents *)v36 setBundleID:v37];
    goto LABEL_36;
  }
  if ([v37 length])
  {
    if (![v15 isEqualToString:@"app"]) {
      goto LABEL_36;
    }
    v30 = +[TPSCommonDefines sharedInstance];
    v29 = [v30 appBundleIDForInstalledAppWithIdentifier:v37];

    if (v29)
    {
      [(TPSURLActionComponents *)v36 setActionType:1];
      [(TPSURLActionComponents *)v36 setBundleID:v29];
    }
LABEL_24:

    goto LABEL_36;
  }
  if ([v15 isEqualToString:@"client"])
  {
    v31 = v36;
    uint64_t v32 = 8;
  }
  else
  {
    if (![v15 isEqualToString:@"tryit"]) {
      goto LABEL_36;
    }
    v31 = v36;
    uint64_t v32 = 11;
  }
  [(TPSURLActionComponents *)v31 setActionType:v32];
  if (v14)
  {
LABEL_23:
    v29 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
    [(TPSURLActionComponents *)v36 setURL:v29];
    goto LABEL_24;
  }
LABEL_36:

  v5 = v34;
  id v4 = v35;
  v6 = v33;
LABEL_37:
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (void)setURL:(id)a3
{
}

+ (unint64_t)_actionTypeForString:(id)a3
{
  uint64_t v3 = _actionTypeForString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_actionTypeForString__onceToken, &__block_literal_global_4);
  }
  v5 = [(id)_actionTypeForString__actionTypeMap objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntValue];
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

void __47__TPSURLActionComponents__actionTypeForString___block_invoke()
{
  v0 = (void *)_actionTypeForString__actionTypeMap;
  _actionTypeForString__actionTypeMap = (uint64_t)&unk_1EED9B008;
}

- (TPSURLActionComponents)initWithString:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  if (v4)
  {
    self = [(TPSURLActionComponents *)self initWithURL:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

@end