@interface KTVerifierResult
+ (BOOL)supportsSecureCoding;
- (BOOL)everOptedIn;
- (BOOL)isEqual:(id)a3;
- (BOOL)optedIn;
- (BOOL)recentlyOptedIn;
- (BOOL)staticAccountKeyEnforced;
- (KTAccountPublicID)publicID;
- (KTVerifierResult)initWithCoder:(id)a3;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 failure:(id)a5;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 failure:(id)a6;
- (NSArray)loggableDatas;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSError)failure;
- (NSString)application;
- (NSString)uri;
- (id)description;
- (id)initPendingForUri:(id)a3 application:(id)a4;
- (id)initUnavailableForUri:(id)a3 application:(id)a4;
- (unint64_t)staticAccountKeyStatus;
- (unint64_t)succeed;
- (unint64_t)uiStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setApplication:(id)a3;
- (void)setEverOptedIn:(BOOL)a3;
- (void)setFailure:(id)a3;
- (void)setLoggableDatas:(id)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setPublicID:(id)a3;
- (void)setRecentlyOptedIn:(BOOL)a3;
- (void)setStaticAccountKeyEnforced:(BOOL)a3;
- (void)setStaticAccountKeyStatus:(unint64_t)a3;
- (void)setSucceed:(unint64_t)a3;
- (void)setUiStatus:(unint64_t)a3;
- (void)setUri:(id)a3;
- (void)updateWithStaticKeyEnforced:(unint64_t)a3 isFailureIgnoredForDate:(BOOL)a4;
@end

@implementation KTVerifierResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4
{
  return [(KTVerifierResult *)self initWithUri:a3 application:a4 ktResult:0 failure:0];
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 failure:(id)a5
{
  return [(KTVerifierResult *)self initWithUri:a3 application:a4 ktResult:0 failure:a5];
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5
{
  return [(KTVerifierResult *)self initWithUri:a3 application:a4 ktResult:a5 failure:0];
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 failure:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)KTVerifierResult;
  v13 = [(KTVerifierResult *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(KTVerifierResult *)v13 setUri:v10];
    [(KTVerifierResult *)v14 setApplication:v11];
    [(KTVerifierResult *)v14 setSucceed:a5];
    [(KTVerifierResult *)v14 setOptedIn:0];
    [(KTVerifierResult *)v14 setEverOptedIn:0];
    [(KTVerifierResult *)v14 setRecentlyOptedIn:0];
    [(KTVerifierResult *)v14 setStaticAccountKeyEnforced:0];
    [(KTVerifierResult *)v14 setStaticAccountKeyStatus:3];
    [(KTVerifierResult *)v14 setFailure:v12];
    [(KTVerifierResult *)v14 setUiStatus:0];
  }

  return v14;
}

- (id)initUnavailableForUri:(id)a3 application:(id)a4
{
  return [(KTVerifierResult *)self initWithUri:a3 application:a4 ktResult:2];
}

- (id)initPendingForUri:(id)a3 application:(id)a4
{
  v4 = [(KTVerifierResult *)self initWithUri:a3 application:a4 ktResult:2];
  [(KTVerifierResult *)v4 setUiStatus:3];

  return v4;
}

- (void)updateWithStaticKeyEnforced:(unint64_t)a3 isFailureIgnoredForDate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  -[KTVerifierResult setStaticAccountKeyStatus:](self, "setStaticAccountKeyStatus:");
  switch(a3)
  {
    case 0uLL:
      [(KTVerifierResult *)self setStaticAccountKeyEnforced:1];
      switch([(KTVerifierResult *)self uiStatus])
      {
        case 4uLL:
        case 13uLL:
          v7 = self;
          uint64_t v8 = 5;
          goto LABEL_22;
        case 6uLL:
          goto LABEL_14;
        case 8uLL:
          goto LABEL_21;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 1uLL:
      [(KTVerifierResult *)self setStaticAccountKeyEnforced:0];
      switch([(KTVerifierResult *)self uiStatus])
      {
        case 5uLL:
          v7 = self;
          uint64_t v8 = 4;
          goto LABEL_22;
        case 7uLL:
          v7 = self;
          uint64_t v8 = 6;
          goto LABEL_22;
        case 9uLL:
          v7 = self;
          uint64_t v8 = 8;
          goto LABEL_22;
        case 13uLL:
          v7 = self;
          uint64_t v8 = 3;
          goto LABEL_22;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 2uLL:
      [(KTVerifierResult *)self setStaticAccountKeyEnforced:0];
      unint64_t v9 = [(KTVerifierResult *)self uiStatus];
      if (v9 <= 0xD)
      {
        if (((1 << v9) & 0x20F9) != 0)
        {
          if (v4) {
            goto LABEL_21;
          }
          v7 = self;
          uint64_t v8 = 13;
          goto LABEL_22;
        }
        if (((1 << v9) & 0x1100) != 0) {
          goto LABEL_21;
        }
      }
      goto LABEL_23;
    case 4uLL:
      [(KTVerifierResult *)self setStaticAccountKeyEnforced:0];
      unint64_t v10 = [(KTVerifierResult *)self uiStatus];
      if (v10 > 0xD) {
        goto LABEL_23;
      }
      if (((1 << v10) & 0x30F9) != 0)
      {
        if (!v4)
        {
LABEL_14:
          v7 = self;
          uint64_t v8 = 7;
          goto LABEL_22;
        }
      }
      else if (v10 != 8)
      {
        goto LABEL_23;
      }
LABEL_21:
      v7 = self;
      uint64_t v8 = 9;
LABEL_22:
      [(KTVerifierResult *)v7 setUiStatus:v8];
LABEL_23:
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_8 != -1) {
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_8, &__block_literal_global_9);
      }
      id v11 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_8;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_8, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        v13 = KTStaticKeyPeerValidateResultGetString(a3);
        BOOL v14 = [(KTVerifierResult *)self staticAccountKeyEnforced];
        v15 = KTUIStatusGetString([(KTVerifierResult *)self uiStatus]);
        objc_super v16 = [(KTVerifierResult *)self uri];
        int v17 = 138413570;
        v18 = v13;
        __int16 v19 = 1024;
        int v20 = a3;
        __int16 v21 = 1024;
        BOOL v22 = v14;
        __int16 v23 = 2114;
        v24 = v15;
        __int16 v25 = 2160;
        uint64_t v26 = 1752392040;
        __int16 v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_DEFAULT, "updateWithStaticKeyEnforced (%@[%d], %{BOOL}d) updating UIStatus to %{public}@ for uri %{mask.hash}@", (uint8_t *)&v17, 0x36u);
      }
      return;
    default:
      [(KTVerifierResult *)self setStaticAccountKeyEnforced:0];
      goto LABEL_23;
  }
}

uint64_t __72__KTVerifierResult_updateWithStaticKeyEnforced_isFailureIgnoredForDate___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  BOOL v4 = [(KTVerifierResult *)self uri];
  [v20 encodeObject:v4 forKey:@"uri"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTVerifierResult succeed](self, "succeed"));
  [v20 encodeObject:v5 forKey:@"succeed"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[KTVerifierResult optedIn](self, "optedIn"));
  [v20 encodeObject:v6 forKey:@"optedIn"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[KTVerifierResult everOptedIn](self, "everOptedIn"));
  [v20 encodeObject:v7 forKey:@"everOptedIn"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[KTVerifierResult recentlyOptedIn](self, "recentlyOptedIn"));
  [v20 encodeObject:v8 forKey:@"recentlyOptedIn"];

  unint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[KTVerifierResult staticAccountKeyEnforced](self, "staticAccountKeyEnforced"));
  [v20 encodeObject:v9 forKey:@"accountKeyEnforced"];

  unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTVerifierResult staticAccountKeyStatus](self, "staticAccountKeyStatus"));
  [v20 encodeObject:v10 forKey:@"staticKeyStatus"];

  id v11 = [(KTVerifierResult *)self publicID];

  if (v11)
  {
    id v12 = [(KTVerifierResult *)self publicID];
    [v20 encodeObject:v12 forKey:@"accountKey"];
  }
  v13 = [(KTVerifierResult *)self loggableDatas];

  if (v13)
  {
    BOOL v14 = [(KTVerifierResult *)self loggableDatas];
    [v20 encodeObject:v14 forKey:@"loggableDatas"];
  }
  v15 = [(KTVerifierResult *)self failure];

  if (v15)
  {
    objc_super v16 = [(KTVerifierResult *)self failure];
    [v20 encodeObject:v16 forKey:@"failure"];
  }
  if ([(KTVerifierResult *)self uiStatus])
  {
    int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTVerifierResult uiStatus](self, "uiStatus"));
    [v20 encodeObject:v17 forKey:@"uiStatus"];
  }
  v18 = [(KTVerifierResult *)self application];

  if (v18)
  {
    __int16 v19 = [(KTVerifierResult *)self application];
    [v20 encodeObject:v19 forKey:@"application"];
  }
}

- (KTVerifierResult)initWithCoder:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"application"];
  __int16 v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"succeed"];
  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"optedIn"];
  __int16 v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"everOptedIn"];
  BOOL v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"recentlyOptedIn"];
  __int16 v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accountKeyEnforced"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  unint64_t v9 = [v3 decodeObjectOfClasses:v8 forKey:@"loggableDatas"];

  unint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accountKey"];
  id v11 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  id v12 = [MEMORY[0x263F16D80] safeErrorClasses];
  v13 = [v11 setByAddingObjectsFromSet:v12];

  BOOL v14 = [v3 decodeObjectOfClasses:v13 forKey:@"failure"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"uiStatus"];
  objc_super v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"staticKeyStatus"];

  int v17 = [[KTVerifierResult alloc] initWithUri:v4 application:v5];
  if (v17)
  {
    -[KTVerifierResult setSucceed:](v17, "setSucceed:", [v19 unsignedIntegerValue]);
    -[KTVerifierResult setOptedIn:](v17, "setOptedIn:", [v24 BOOLValue]);
    -[KTVerifierResult setEverOptedIn:](v17, "setEverOptedIn:", [v23 BOOLValue]);
    -[KTVerifierResult setRecentlyOptedIn:](v17, "setRecentlyOptedIn:", [v22 BOOLValue]);
    -[KTVerifierResult setStaticAccountKeyEnforced:](v17, "setStaticAccountKeyEnforced:", [v21 BOOLValue]);
    [(KTVerifierResult *)v17 setPublicID:v10];
    [(KTVerifierResult *)v17 setLoggableDatas:v9];
    [(KTVerifierResult *)v17 setFailure:v14];
    -[KTVerifierResult setUiStatus:](v17, "setUiStatus:", [v15 unsignedIntegerValue]);
    -[KTVerifierResult setStaticAccountKeyStatus:](v17, "setStaticAccountKeyStatus:", [v16 unsignedIntegerValue]);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (KTVerifierResult *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      uint64_t v7 = [(KTVerifierResult *)self uri];
      if (v7 || ([(KTVerifierResult *)v6 uri], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v8 = [(KTVerifierResult *)self uri];
        unint64_t v9 = [(KTVerifierResult *)v6 uri];
        int v10 = [v8 isEqual:v9];

        if (v7)
        {

          if (!v10) {
            goto LABEL_34;
          }
        }
        else
        {

          if ((v10 & 1) == 0) {
            goto LABEL_34;
          }
        }
      }
      id v12 = [(KTVerifierResult *)self application];
      if (v12
        || ([(KTVerifierResult *)v6 application], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v13 = [(KTVerifierResult *)self application];
        BOOL v14 = [(KTVerifierResult *)v6 application];
        int v15 = [v13 isEqual:v14];

        if (v12)
        {

          if (!v15) {
            goto LABEL_34;
          }
        }
        else
        {

          if ((v15 & 1) == 0) {
            goto LABEL_34;
          }
        }
      }
      unint64_t v16 = [(KTVerifierResult *)self succeed];
      if (v16 != [(KTVerifierResult *)v6 succeed]) {
        goto LABEL_34;
      }
      BOOL v17 = [(KTVerifierResult *)self optedIn];
      if (v17 != [(KTVerifierResult *)v6 optedIn]) {
        goto LABEL_34;
      }
      BOOL v18 = [(KTVerifierResult *)self staticAccountKeyEnforced];
      if (v18 != [(KTVerifierResult *)v6 staticAccountKeyEnforced]) {
        goto LABEL_34;
      }
      unint64_t v19 = [(KTVerifierResult *)self staticAccountKeyStatus];
      if (v19 != [(KTVerifierResult *)v6 staticAccountKeyStatus]) {
        goto LABEL_34;
      }
      id v20 = [(KTVerifierResult *)self loggableDatas];
      if (v20
        || ([(KTVerifierResult *)v6 loggableDatas],
            (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        __int16 v21 = [(KTVerifierResult *)self loggableDatas];
        BOOL v22 = [(KTVerifierResult *)v6 loggableDatas];
        int v23 = [v21 isEqual:v22];

        if (v20)
        {

          if (!v23) {
            goto LABEL_34;
          }
        }
        else
        {

          if ((v23 & 1) == 0) {
            goto LABEL_34;
          }
        }
      }
      v24 = [(KTVerifierResult *)self publicID];
      if (v24
        || ([(KTVerifierResult *)v6 publicID], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        __int16 v25 = [(KTVerifierResult *)self publicID];
        uint64_t v26 = [(KTVerifierResult *)v6 publicID];
        int v27 = [v25 isEqual:v26];

        if (v24)
        {

          if (!v27) {
            goto LABEL_34;
          }
        }
        else
        {

          if ((v27 & 1) == 0) {
            goto LABEL_34;
          }
        }
      }
      BOOL v28 = [(KTVerifierResult *)self everOptedIn];
      if (v28 == [(KTVerifierResult *)v6 everOptedIn])
      {
        unint64_t v30 = [(KTVerifierResult *)self uiStatus];
        BOOL v11 = v30 == [(KTVerifierResult *)v6 uiStatus];
        goto LABEL_35;
      }
LABEL_34:
      BOOL v11 = 0;
LABEL_35:

      goto LABEL_36;
    }
    BOOL v11 = 0;
  }
LABEL_36:

  return v11;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  BOOL v4 = KTResultGetString([(KTVerifierResult *)self succeed]);
  v5 = KTUIStatusGetString([(KTVerifierResult *)self uiStatus]);
  v6 = [(KTVerifierResult *)self uri];
  uint64_t v7 = [(KTVerifierResult *)self application];
  uint64_t v8 = [v3 stringWithFormat:@"kt(%@) ui(%@) %@[%@]", v4, v5, v6, v7];

  unint64_t v9 = [(KTVerifierResult *)self failure];

  if (v9)
  {
    int v10 = [(KTVerifierResult *)self failure];
    [v8 appendFormat:@" failure: %@", v10];
  }
  [v8 appendFormat:@" optIn: %d, everOptedIn: %d", -[KTVerifierResult optedIn](self, "optedIn"), -[KTVerifierResult everOptedIn](self, "everOptedIn")];
  BOOL v11 = [(KTVerifierResult *)self staticAccountKeyEnforced];
  id v12 = KTStaticKeyPeerValidateResultGetString([(KTVerifierResult *)self staticAccountKeyStatus]);
  v13 = [(KTVerifierResult *)self publicID];
  BOOL v14 = [v13 publicAccountIdentity];
  [v8 appendFormat:@" staticKeyEnforced: %d, staticKeyStatus: %@, accountKey:%@ ", v11, v12, v14];

  int v15 = [(KTVerifierResult *)self loggableDatas];
  [v8 appendFormat:@" loggableDatas:%@", v15];

  return v8;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = [(KTVerifierResult *)self uri];

  if (v4)
  {
    v5 = [(KTVerifierResult *)self uri];
    [v3 setObject:v5 forKeyedSubscript:@"uri"];
  }
  v6 = [(KTVerifierResult *)self application];

  if (v6)
  {
    uint64_t v7 = [(KTVerifierResult *)self application];
    [v3 setObject:v7 forKeyedSubscript:@"application"];
  }
  uint64_t v8 = KTResultGetString([(KTVerifierResult *)self succeed]);
  [v3 setObject:v8 forKeyedSubscript:@"ktResult"];

  unint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[KTVerifierResult optedIn](self, "optedIn"));
  [v3 setObject:v9 forKeyedSubscript:@"optedIn"];

  int v10 = objc_msgSend(NSNumber, "numberWithBool:", -[KTVerifierResult everOptedIn](self, "everOptedIn"));
  [v3 setObject:v10 forKeyedSubscript:@"everOptedIn"];

  BOOL v11 = objc_msgSend(NSNumber, "numberWithBool:", -[KTVerifierResult staticAccountKeyEnforced](self, "staticAccountKeyEnforced"));
  [v3 setObject:v11 forKeyedSubscript:@"staticKeyEnforced"];

  id v12 = KTUIStatusGetString([(KTVerifierResult *)self uiStatus]);
  [v3 setObject:v12 forKeyedSubscript:@"uiStatus"];

  v13 = KTStaticKeyPeerValidateResultGetString([(KTVerifierResult *)self staticAccountKeyStatus]);
  [v3 setObject:v13 forKeyedSubscript:@"staticKeyStatus"];

  BOOL v14 = [(KTVerifierResult *)self loggableDatas];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = (void *)MEMORY[0x263EFF980];
    BOOL v17 = [(KTVerifierResult *)self loggableDatas];
    BOOL v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    unint64_t v19 = [(KTVerifierResult *)self loggableDatas];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v32 + 1) + 8 * i) diagnosticsJsonDictionary];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"loggableDatas"];
  }
  __int16 v25 = [(KTVerifierResult *)self publicID];

  if (v25)
  {
    uint64_t v26 = [(KTVerifierResult *)self publicID];
    int v27 = [v26 publicAccountIdentity];
    [v3 setObject:v27 forKeyedSubscript:@"publicID"];
  }
  BOOL v28 = [(KTVerifierResult *)self failure];

  if (v28)
  {
    uint64_t v29 = [(KTVerifierResult *)self failure];
    unint64_t v30 = [v29 description];
    [v3 setObject:v30 forKeyedSubscript:@"failure"];
  }

  return (NSDictionary *)v3;
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUri:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplication:(id)a3
{
}

- (unint64_t)succeed
{
  return self->_succeed;
}

- (void)setSucceed:(unint64_t)a3
{
  self->_succeed = a3;
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  self->_optedIn = a3;
}

- (BOOL)staticAccountKeyEnforced
{
  return self->_staticAccountKeyEnforced;
}

- (void)setStaticAccountKeyEnforced:(BOOL)a3
{
  self->_staticAccountKeyEnforced = a3;
}

- (unint64_t)staticAccountKeyStatus
{
  return self->_staticAccountKeyStatus;
}

- (void)setStaticAccountKeyStatus:(unint64_t)a3
{
  self->_staticAccountKeyStatus = a3;
}

- (KTAccountPublicID)publicID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPublicID:(id)a3
{
}

- (NSArray)loggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLoggableDatas:(id)a3
{
}

- (BOOL)everOptedIn
{
  return self->_everOptedIn;
}

- (void)setEverOptedIn:(BOOL)a3
{
  self->_everOptedIn = a3;
}

- (BOOL)recentlyOptedIn
{
  return self->_recentlyOptedIn;
}

- (void)setRecentlyOptedIn:(BOOL)a3
{
  self->_recentlyOptedIn = a3;
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFailure:(id)a3
{
}

- (unint64_t)uiStatus
{
  return self->_uiStatus;
}

- (void)setUiStatus:(unint64_t)a3
{
  self->_uiStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_loggableDatas, 0);
  objc_storeStrong((id *)&self->_publicID, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_uri, 0);
}

@end