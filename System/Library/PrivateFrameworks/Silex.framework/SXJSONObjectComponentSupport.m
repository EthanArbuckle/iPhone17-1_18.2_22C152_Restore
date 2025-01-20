@interface SXJSONObjectComponentSupport
+ (id)shared;
- (NSString)specVersion;
- (SXJSONObjectComponentSupport)initWithSpecVersion:(id)a3;
- (id)objectValueClassBlock;
- (id)purgeClassBlock;
@end

@implementation SXJSONObjectComponentSupport

BOOL __47__SXJSONObjectComponentSupport_purgeClassBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 objectForKey:@"type"];
    v8 = [v5 objectForKey:@"role"];
    if (v7)
    {
      uint64_t v9 = +[SXLegacySupport deprecatedComponentForType:andVersion:]((uint64_t)SXLegacySupport, v7, v6);
      v10 = (void *)v9;
      if (v9)
      {
        v11 = -[SXFullscreenCaption caption](v9);
        BOOL v12 = v11 == 0;
      }
      else
      {
        v11 = +[SXComponentClassification classificationForComponentWithType:v7];
        uint64_t v14 = objc_opt_class();
        BOOL v12 = v14 == objc_opt_class();
      }
      BOOL v13 = v12;
    }
    else
    {
      BOOL v13 = 0;
    }
    v15 = [v5 valueForKey:@"conditions"];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [(SXJSONObject *)[SXComponentConditions alloc] initWithJSONObject:v15 andVersion:v6];
        v17 = [(SXComponentConditions *)v16 greaterThanSpecVersion];
        if (v17) {
          char v18 = v13;
        }
        else {
          char v18 = 1;
        }

        if ((v18 & 1) == 0)
        {
          v19 = [(SXComponentConditions *)v16 greaterThanSpecVersion];
          v20 = [*(id *)(a1 + 32) specVersion];
          BOOL v13 = SXSpecVersionCompare(v19, v20) != -1;
        }
        v21 = [(SXComponentConditions *)v16 lessThanSpecVersion];

        if (v21 && !v13)
        {
          v22 = [(SXComponentConditions *)v16 lessThanSpecVersion];
          v23 = [*(id *)(a1 + 32) specVersion];
          BOOL v13 = SXSpecVersionCompare(v22, v23) != 1;
        }
      }
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

id __53__SXJSONObjectComponentSupport_objectValueClassBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKey:@"role"];
  v8 = [v6 objectForKey:@"type"];

  uint64_t v9 = +[SXComponentClassification classificationForComponentWithType:v8 role:v7];
  v10 = (void *)[v9 componentModelClass];
  if (!v10 || (uint64_t v11 = objc_opt_class(), v11 == objc_opt_class()))
  {
    BOOL v12 = +[SXLegacySupport deprecatedComponentForType:andVersion:]((uint64_t)SXLegacySupport, v8, v5);
    BOOL v13 = -[SXFullscreenCaption caption]((uint64_t)v12);

    if (v13)
    {
      uint64_t v14 = -[SXFullscreenCaption caption]((uint64_t)v12);
      v10 = (void *)[v14 componentModelClass];
    }
  }
  id v15 = v10;

  return v15;
}

- (id)purgeClassBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SXJSONObjectComponentSupport_purgeClassBlock__block_invoke;
  v4[3] = &unk_2646531C0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x223CA5030](v4, a2);
  return v2;
}

- (id)objectValueClassBlock
{
  return &__block_literal_global_3_0;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)shared_shared;
  return v2;
}

uint64_t __38__SXJSONObjectComponentSupport_shared__block_invoke()
{
  v0 = [[SXJSONObjectComponentSupport alloc] initWithSpecVersion:@"1.28"];
  uint64_t v1 = shared_shared;
  shared_shared = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SXJSONObjectComponentSupport)initWithSpecVersion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXJSONObjectComponentSupport;
  id v6 = [(SXJSONObjectComponentSupport *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specVersion, a3);
  }

  return v7;
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void).cxx_destruct
{
}

@end