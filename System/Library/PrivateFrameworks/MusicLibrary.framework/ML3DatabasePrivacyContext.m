@interface ML3DatabasePrivacyContext
+ (BOOL)supportsSecureCoding;
+ (id)sharedContext;
+ (void)logDatabasePrivacyAccessWithAuditToken:(id *)a3;
- (ML3DatabasePrivacyContext)init;
- (ML3DatabasePrivacyContext)initWithAuditToken:(id *)a3;
- (ML3DatabasePrivacyContext)initWithClientIdentity:(id)a3;
- (ML3DatabasePrivacyContext)initWithCoder:(id)a3;
- (NSString)bundleID;
- (id)_initWithPAApplication:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logDatabasePrivacyAccess;
@end

@implementation ML3DatabasePrivacyContext

- (void)logDatabasePrivacyAccess
{
  if (self->_clientApplication)
  {
    v3 = [MEMORY[0x1E4F934D0] sharedInstance];
    if ([v3 loggingEnabled])
    {
      id v4 = objc_alloc(MEMORY[0x1E4F93508]);
      v5 = (void *)[v4 initWithAccessor:self->_clientApplication forService:*MEMORY[0x1E4FA9AA0]];
      [v3 log:v5];
    }
  }
  greenTeaLogger = self->_greenTeaLogger;

  [(ML3GreenTeaLogger *)greenTeaLogger logAccess];
}

- (ML3DatabasePrivacyContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ML3DatabasePrivacyContextClientApplicationsKey"];

  v6 = [(ML3DatabasePrivacyContext *)self _initWithPAApplication:v5];
  return v6;
}

- (ML3DatabasePrivacyContext)initWithClientIdentity:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F934E0];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithTCCIdentity:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(ML3DatabasePrivacyContext *)self _initWithPAApplication:v6];

  return v7;
}

- (id)_initWithPAApplication:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ML3DatabasePrivacyContext;
  id v5 = [(ML3DatabasePrivacyContext *)&v17 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (PAApplication *)v4;
      clientApplication = v5->_clientApplication;
      v5->_clientApplication = v6;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E4F934E0];
      clientApplication = [MEMORY[0x1E4F28B50] mainBundle];
      v9 = [clientApplication bundleIdentifier];
      uint64_t v10 = [v8 applicationWithBundleID:v9];
      v11 = v5->_clientApplication;
      v5->_clientApplication = (PAApplication *)v10;
    }
    v12 = [ML3GreenTeaLogger alloc];
    v13 = [(PAApplication *)v5->_clientApplication bundleID];
    uint64_t v14 = [(ML3GreenTeaLogger *)v12 initWithAccessorName:v13];
    greenTeaLogger = v5->_greenTeaLogger;
    v5->_greenTeaLogger = (ML3GreenTeaLogger *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenTeaLogger, 0);

  objc_storeStrong((id *)&self->_clientApplication, 0);
}

- (NSString)bundleID
{
  return (NSString *)[(PAApplication *)self->_clientApplication bundleID];
}

- (ML3DatabasePrivacyContext)initWithAuditToken:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F934E0]);
  long long v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  v7 = (void *)[v5 initWithAuditToken:v10];
  v8 = [(ML3DatabasePrivacyContext *)self _initWithPAApplication:v7];

  return v8;
}

- (ML3DatabasePrivacyContext)init
{
  return (ML3DatabasePrivacyContext *)[(ML3DatabasePrivacyContext *)self _initWithPAApplication:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedContext
{
  if (sharedContext_onceToken != -1) {
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_1417);
  }
  v2 = (void *)sharedContext___sharedContext;

  return v2;
}

uint64_t __42__ML3DatabasePrivacyContext_sharedContext__block_invoke()
{
  sharedContext___sharedContext = objc_alloc_init(ML3DatabasePrivacyContext);

  return MEMORY[0x1F41817F8]();
}

+ (void)logDatabasePrivacyAccessWithAuditToken:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  long long v10 = *(_OWORD *)a3->var0;
  long long v11 = v4;
  id v5 = MSVBundleIDForAuditToken();
  +[ML3GreenTeaLogger logOnceForAccessor:](ML3GreenTeaLogger, "logOnceForAccessor:", v5, v10, v11);
  long long v6 = [MEMORY[0x1E4F934D0] sharedInstance];
  if ([v6 loggingEnabled])
  {
    uint64_t v7 = *MEMORY[0x1E4FA9AA0];
    long long v8 = *(_OWORD *)&a3->var0[4];
    long long v10 = *(_OWORD *)a3->var0;
    long long v11 = v8;
    v9 = [MEMORY[0x1E4F93508] accessWithAuditToken:&v10 forService:v7];
    [v6 log:v9];
  }
}

@end