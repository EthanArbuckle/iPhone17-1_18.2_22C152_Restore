@interface TUConfiguration
- (BOOL)simulateFatalPersistentStoreError;
- (BOOL)simulateInternationalCall;
- (NSString)conversationLinkBaseURLString;
- (NSURL)conversationLinkBaseURL;
- (TUConfiguration)initWithDataSource:(id)a3;
- (TUDelegateController)delegateController;
- (TUKeyValueDataSource)dataSource;
- (id)numberForKey:(id)a3;
- (unint64_t)announceCalls;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setAnnounceCalls:(unint64_t)a3;
- (void)setConversationLinkBaseURL:(id)a3;
- (void)setConversationLinkBaseURLString:(id)a3;
- (void)setSimulateFatalPersistentStoreError:(BOOL)a3;
- (void)setSimulateInternationalCall:(BOOL)a3;
@end

@implementation TUConfiguration

- (TUConfiguration)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUConfiguration;
  v6 = [(TUConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(TUDelegateController);
    delegateController = v7->_delegateController;
    v7->_delegateController = v8;
  }
  return v7;
}

- (unint64_t)announceCalls
{
  v2 = [(TUConfiguration *)self numberForKey:@"announceCalls"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setAnnounceCalls:(unint64_t)a3
{
  id v5 = [(TUConfiguration *)self dataSource];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"announceCalls"];
}

- (NSString)conversationLinkBaseURLString
{
  v2 = [(TUConfiguration *)self dataSource];
  unint64_t v3 = [v2 stringForKey:@"conversationLinkBaseURL"];

  return (NSString *)v3;
}

- (NSURL)conversationLinkBaseURL
{
  v2 = [(TUConfiguration *)self conversationLinkBaseURLString];
  if (v2) {
    unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v2];
  }
  else {
    unint64_t v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setConversationLinkBaseURLString:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConfiguration *)self dataSource];
  [v5 setObject:v4 forKey:@"conversationLinkBaseURL"];
}

- (void)setConversationLinkBaseURL:(id)a3
{
  id v4 = a3;
  id v6 = [(TUConfiguration *)self dataSource];
  id v5 = [v4 absoluteString];

  [v6 setObject:v5 forKey:@"conversationLinkBaseURL"];
}

- (BOOL)simulateFatalPersistentStoreError
{
  int v3 = _TUIsInternalInstall();
  if (v3)
  {
    id v4 = [(TUConfiguration *)self numberForKey:@"simulateFatalPersistentStoreError"];
    char v5 = [v4 BOOLValue];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setSimulateFatalPersistentStoreError:(BOOL)a3
{
  BOOL v3 = a3;
  if (_TUIsInternalInstall())
  {
    id v6 = [(TUConfiguration *)self dataSource];
    char v5 = [NSNumber numberWithBool:v3];
    [v6 setObject:v5 forKey:@"simulateFatalPersistentStoreError"];
  }
}

- (BOOL)simulateInternationalCall
{
  int v3 = _TUIsInternalInstall();
  if (v3)
  {
    id v4 = [(TUConfiguration *)self numberForKey:@"simulateInternationalCall"];
    char v5 = [v4 BOOLValue];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setSimulateInternationalCall:(BOOL)a3
{
  BOOL v3 = a3;
  if (_TUIsInternalInstall())
  {
    id v6 = [(TUConfiguration *)self dataSource];
    char v5 = [NSNumber numberWithBool:v3];
    [v6 setObject:v5 forKey:@"simulateInternationalCall"];
  }
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(TUConfiguration *)self dataSource];
  id v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_5:
    v8 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConfiguration *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConfiguration *)self delegateController];
  [v5 removeDelegate:v4];
}

- (TUKeyValueDataSource)dataSource
{
  return self->_dataSource;
}

- (TUDelegateController)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end