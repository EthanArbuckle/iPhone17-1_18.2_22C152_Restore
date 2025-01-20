@interface MTBaseEventDataProvider
- (id)app:(id)a3;
- (id)appVersion:(id)a3;
- (id)baseVersion:(id)a3;
- (id)capacityData:(id)a3;
- (id)capacityDataAvailable:(id)a3;
- (id)capacityDisk:(id)a3;
- (id)capacitySystem:(id)a3;
- (id)capacitySystemAvailable:(id)a3;
- (id)clientEventId:(id)a3;
- (id)clientId:(id)a3;
- (id)connection:(id)a3;
- (id)cookies:(id)a3;
- (id)dsId:(id)a3;
- (id)eventTime:(id)a3;
- (id)fetchAllCookies;
- (id)hardwareFamily:(id)a3;
- (id)hardwareModel:(id)a3;
- (id)hostApp:(id)a3;
- (id)hostAppVersion:(id)a3;
- (id)isSignedIn:(id)a3;
- (id)knownFields;
- (id)os:(id)a3;
- (id)osBuildNumber:(id)a3;
- (id)osVersion:(id)a3;
- (id)page:(id)a3;
- (id)pageContext:(id)a3;
- (id)pageDetails:(id)a3;
- (id)pageId:(id)a3;
- (id)pageType:(id)a3;
- (id)pageUrl:(id)a3;
- (id)parentPageUrl:(id)a3;
- (id)pixelRatio:(id)a3;
- (id)resourceRevNum:(id)a3;
- (id)screenHeight:(id)a3;
- (id)screenWidth:(id)a3;
- (id)storeFrontHeader:(id)a3;
- (id)timezoneOffset:(id)a3;
- (id)userAgent:(id)a3;
- (id)windowInnerHeight:(id)a3;
- (id)windowInnerWidth:(id)a3;
- (id)windowOuterHeight:(id)a3;
- (id)windowOuterWidth:(id)a3;
- (id)xpPostFrequency:(id)a3;
- (id)xpSendMethod:(id)a3;
- (id)xpVersionMetricsKit:(id)a3;
@end

@implementation MTBaseEventDataProvider

- (id)knownFields
{
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    v6 = [v5 knownFields];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)app:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 app:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"app"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 app];

LABEL_7:

  return v10;
}

- (id)appVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 appVersion:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"appVersion"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 appVersion];

LABEL_7:

  return v10;
}

- (id)baseVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 baseVersion:v4];
  }
  else
  {
    v9 = [v4 objectForKeyedSubscript:@"baseVersion"];
    v7 = v9;
    if (v9)
    {
      id v8 = v9;
      v7 = v8;
    }
    else
    {
      id v8 = (id)[objc_alloc(NSNumber) initWithInt:1];
    }
  }
  v10 = v8;

  return v10;
}

- (id)capacityData:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 capacityData:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"capacityData"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 capacityData];

LABEL_7:

  return v10;
}

- (id)capacityDataAvailable:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 capacityDataAvailable:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"capacityDataAvailable"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 capacityDataAvailable];

LABEL_7:

  return v10;
}

- (id)capacityDisk:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 capacityDisk:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"capacityDisk"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 capacityDisk];

LABEL_7:

  return v10;
}

- (id)capacitySystem:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 capacitySystem:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"capacitySystem"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 capacitySystem];

LABEL_7:

  return v10;
}

- (id)capacitySystemAvailable:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 capacitySystemAvailable:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"capacityDataAvailable"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 capacitySystemAvailable];

LABEL_7:

  return v10;
}

- (id)fetchAllCookies
{
  v2 = [(MTObject *)self metricsKit];
  v3 = [v2 system];
  id v4 = [v3 environment];
  v5 = [v4 cookies];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v6 = +[MTPromise promiseWithResult:v5];

    v5 = (void *)v6;
  }

  return v5;
}

- (id)clientEventId:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 clientEventId:v4];
  }
  else
  {
    v9 = NSString;
    v7 = [MEMORY[0x263F08C38] UUID];
    v10 = objc_msgSend(v7, "mt_base62String");
    id v8 = [v9 stringWithFormat:@"1_1_%@", v10];
  }

  return v8;
}

- (id)clientId:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 clientId:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"clientId"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 config];
  v13 = [v12 configValueForKeyPath:@"ignoreClientIdCookie" default:MEMORY[0x263EFFA80]];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __36__MTBaseEventDataProvider_clientId___block_invoke;
  v15[3] = &unk_264310A18;
  v15[4] = self;
  v10 = [v13 thenWithBlock:v15];

LABEL_7:

  return v10;
}

id __36__MTBaseEventDataProvider_clientId___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    v3 = [MEMORY[0x263EFF9D0] null];
    +[MTPromise promiseWithResult:v3];
  }
  else
  {
    v3 = [*(id *)(a1 + 32) fetchAllCookies];
    [v3 thenWithBlock:&__block_literal_global_14];
  id v4 = };

  return v4;
}

id __36__MTBaseEventDataProvider_clientId___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"xp_ci"];
  if (v2)
  {
    v3 = +[MTPromise promiseWithResult:v2];
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
    v3 = +[MTPromise promiseWithResult:v4];
  }

  return v3;
}

- (id)connection:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 connection:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"connection"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 connectionType];

LABEL_7:

  return v10;
}

- (id)cookies:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    uint64_t v8 = [v7 cookies:v4];
  }
  else
  {
    v7 = [(MTBaseEventDataProvider *)self fetchAllCookies];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__MTBaseEventDataProvider_cookies___block_invoke;
    v11[3] = &unk_26430F898;
    v11[4] = self;
    uint64_t v8 = [v7 thenWithBlock:v11];
  }
  v9 = (void *)v8;

  return v9;
}

id __35__MTBaseEventDataProvider_cookies___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) metricsKit];
  v5 = [v4 config];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__MTBaseEventDataProvider_cookies___block_invoke_2;
  v9[3] = &unk_264310A40;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v6 = v3;
  v7 = [v5 computeWithConfigSources:v9];

  return v7;
}

id __35__MTBaseEventDataProvider_cookies___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) metricsKit];
  v5 = [v4 config];
  id v6 = [v5 configValueForKeyPath:@"fieldsMap.cookies" sources:v3];
  v7 = +[MTReflectUtil objectAsArray:v6];

  uint64_t v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = +[MTReflectUtil objectAsString:](MTReflectUtil, "objectAsString:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        if ([v14 length])
        {
          v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
          [v8 setValue:v15 forKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    v16 = (void *)[v8 copy];
  }
  else {
    v16 = 0;
  }

  return v16;
}

- (id)dsId:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 dsId:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"dsId"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 dsId];

LABEL_7:

  return v10;
}

- (id)eventTime:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 eventTime:v4];
  }
  else
  {
    id v9 = [v4 objectForKeyedSubscript:@"eventTime"];
    v7 = v9;
    if (v9)
    {
      id v8 = v9;
      v7 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x263EFF910], "mt_millisecondsSince1970");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v10 = v8;

  return v10;
}

- (id)hardwareFamily:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 hardwareFamily:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"hardwareFamily"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 hardwareFamily];

LABEL_7:

  return v10;
}

- (id)hardwareModel:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 hardwareModel:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"hardwareModel"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 hardwareModel];

LABEL_7:

  return v10;
}

- (id)hostApp:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 hostApp:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"hostApp"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 hostApp];

LABEL_7:

  return v10;
}

- (id)hostAppVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 hostAppVersion:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"hostAppVersion"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 hostAppVersion];

LABEL_7:

  return v10;
}

- (id)isSignedIn:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    uint64_t v8 = [v7 isSignedIn:v4];
    goto LABEL_3;
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@"isSignedIn"];

  if (!v10)
  {
    v7 = [(MTBaseEventDataProvider *)self dsId:v4];
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __38__MTBaseEventDataProvider_isSignedIn___block_invoke_2;
      v14[3] = &unk_264310A88;
      id v15 = &__block_literal_global_64;
      v13 = [v7 thenWithBlock:v14];
      id v9 = [v13 catchWithBlock:&__block_literal_global_69_0];

      goto LABEL_4;
    }
    uint64_t v8 = __38__MTBaseEventDataProvider_isSignedIn___block_invoke(isKindOfClass, v7);
LABEL_3:
    id v9 = (void *)v8;
LABEL_4:

    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"isSignedIn"];
LABEL_7:

  return v9;
}

id __38__MTBaseEventDataProvider_isSignedIn___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (void *)MEMORY[0x263F08708];
    id v4 = v2;
    v5 = [v3 whitespaceCharacterSet];
    char v6 = [v4 stringByTrimmingCharactersInSet:v5];

    v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "length") != 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "integerValue") != 0);
    }
    else
    {
      v7 = (void *)MEMORY[0x263EFFA80];
    }
  }

  return v7;
}

id __38__MTBaseEventDataProvider_isSignedIn___block_invoke_2(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = +[MTPromise promiseWithResult:v1];

  return v2;
}

MTPromise *__38__MTBaseEventDataProvider_isSignedIn___block_invoke_3()
{
  return +[MTPromise promiseWithResult:MEMORY[0x263EFFA80]];
}

- (id)os:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 os:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"os"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 os];

LABEL_7:

  return v10;
}

- (id)osBuildNumber:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 osBuildNumber:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"osBuildNumber"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 osBuildNumber];

LABEL_7:

  return v10;
}

- (id)osVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 osVersion:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"osVersion"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 osVersion];

LABEL_7:

  return v10;
}

- (id)page:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 page:v4];
LABEL_3:

    goto LABEL_10;
  }
  id v9 = [v4 objectForKeyedSubscript:@"page"];

  if (v9)
  {
    id v8 = [v4 objectForKeyedSubscript:@"page"];
  }
  else
  {
    uint64_t v10 = [v4 objectForKeyedSubscript:@"pageType"];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [v4 objectForKeyedSubscript:@"pageId"];

      if (v12)
      {
        v13 = [v4 objectForKeyedSubscript:@"pageType"];
        v14 = [v4 objectForKeyedSubscript:@"pageId"];
        id v15 = [(MTObject *)self metricsKit];
        v16 = [v15 config];
        v17 = [v16 configValueForKeyPath:@"compoundSeparator" default:@"_"];

        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __32__MTBaseEventDataProvider_page___block_invoke;
        v20[3] = &unk_264310AD0;
        id v21 = v13;
        id v22 = v14;
        id v18 = v14;
        id v7 = v13;
        id v8 = [v17 thenWithBlock:v20];

        goto LABEL_3;
      }
    }
    id v8 = 0;
  }
LABEL_10:

  return v8;
}

id __32__MTBaseEventDataProvider_page___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithFormat:@"%@%@%@", *(void *)(a1 + 32), a2, *(void *)(a1 + 40)];
  id v3 = +[MTPromise promiseWithResult:v2];

  return v3;
}

- (id)pageContext:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 pageContext:v4];
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"pageContext"];
  }

  return v8;
}

- (id)pageDetails:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 pageDetails:v4];
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"pageDetails"];
  }

  return v8;
}

- (id)pageId:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 pageId:v4];
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"pageId"];
  }

  return v8;
}

- (id)pageType:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 pageType:v4];
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"pageType"];
  }

  return v8;
}

- (id)pageUrl:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 pageUrl:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"pageUrl"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 pageUrl];

LABEL_7:

  return v10;
}

- (id)parentPageUrl:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 parentPageUrl:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"parentPageUrl"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 parentPageUrl];

LABEL_7:

  return v10;
}

- (id)pixelRatio:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 pixelRatio:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"pixelRatio"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 pixelRatio];

LABEL_7:

  return v10;
}

- (id)resourceRevNum:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 resourceRevNum:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"resourceRevNum"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 resourceRevNum];

LABEL_7:

  return v10;
}

- (id)screenHeight:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 screenHeight:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"screenHeight"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 screenHeight];

LABEL_7:

  return v10;
}

- (id)screenWidth:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 screenWidth:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"screenWidth"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 screenWidth];

LABEL_7:

  return v10;
}

- (id)storeFrontHeader:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 storeFrontHeader:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"storeFrontHeader"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  v13 = [v12 environment];
  uint64_t v10 = [v13 storeFrontHeader];

LABEL_7:

  return v10;
}

- (id)timezoneOffset:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 timezoneOffset:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"timezoneOffset"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = NSNumber;
  uint64_t v12 = [MEMORY[0x263EFFA18] localTimeZone];
  uint64_t v13 = [v12 secondsFromGMT];
  uint64_t v14 = ((unsigned __int128)(v13 * (__int128)0x7777777777777777) >> 64) - v13;
  uint64_t v10 = [v11 numberWithInteger:(v14 >> 5) + ((unint64_t)v14 >> 63)];

LABEL_7:

  return v10;
}

- (id)userAgent:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 userAgent:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"userAgent"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  uint64_t v13 = [v12 environment];
  uint64_t v10 = [v13 userAgent];

LABEL_7:

  return v10;
}

- (id)windowInnerHeight:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 windowInnerHeight:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"windowInnerHeight"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  uint64_t v13 = [v12 environment];
  uint64_t v10 = [v13 windowInnerHeight];

LABEL_7:

  return v10;
}

- (id)windowInnerWidth:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 windowInnerWidth:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"windowInnerWidth"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  uint64_t v13 = [v12 environment];
  uint64_t v10 = [v13 windowInnerWidth];

LABEL_7:

  return v10;
}

- (id)windowOuterHeight:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 windowOuterHeight:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"windowOuterHeight"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  uint64_t v13 = [v12 environment];
  uint64_t v10 = [v13 windowOuterHeight];

LABEL_7:

  return v10;
}

- (id)windowOuterWidth:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 windowOuterWidth:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"windowOuterWidth"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  uint64_t v13 = [v12 environment];
  uint64_t v10 = [v13 windowOuterWidth];

LABEL_7:

  return v10;
}

- (id)xpPostFrequency:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 xpPostFrequency:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"xpPostFrequency"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 config];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__MTBaseEventDataProvider_xpPostFrequency___block_invoke;
  v14[3] = &unk_26430F7F8;
  void v14[4] = self;
  uint64_t v10 = [v12 computeWithConfigSources:v14];

LABEL_7:

  return v10;
}

id __43__MTBaseEventDataProvider_xpPostFrequency___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  v5 = [v4 config];
  char v6 = [v5 configValueForKeyPath:@"postFrequency" sources:v3];

  return v6;
}

- (id)xpSendMethod:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 xpSendMethod:v4];
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"xpSendMethod"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    id v7 = v8;
    goto LABEL_5;
  }
  uint64_t v11 = [(MTObject *)self metricsKit];
  uint64_t v12 = [v11 system];
  uint64_t v13 = [v12 eventRecorder];
  uint64_t v10 = [v13 sendMethod];

LABEL_7:

  return v10;
}

- (id)xpVersionMetricsKit:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 xpVersionMetricsKit:v4];
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"xpVersionMetricsKit"];
    if (!v8)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__MTBaseEventDataProvider_xpVersionMetricsKit___block_invoke;
      block[3] = &unk_26430FB90;
      block[4] = self;
      if (xpVersionMetricsKit__onceToken != -1) {
        dispatch_once(&xpVersionMetricsKit__onceToken, block);
      }
      id v8 = (id)xpVersionMetricsKit__bundleVersion;
    }
  }

  return v8;
}

void __47__MTBaseEventDataProvider_xpVersionMetricsKit___block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 infoDictionary];

  uint64_t v1 = [v3 valueForKey:@"CFBundleShortVersionString"];
  id v2 = (void *)xpVersionMetricsKit__bundleVersion;
  xpVersionMetricsKit__bundleVersion = v1;
}

@end