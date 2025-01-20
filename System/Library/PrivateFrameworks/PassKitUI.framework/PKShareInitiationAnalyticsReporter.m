@interface PKShareInitiationAnalyticsReporter
- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3;
- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3 reuseExistingSession:(BOOL)a4;
- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3 sessionToken:(id)a4;
- (id)_initWithPass:(id)a3 sessionToken:(id)a4 reuseExistingSession:(BOOL)a5;
- (void)_sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 eventType:(id)a5 specifics:(id)a6;
- (void)sendAuthenticationEventForSuccess:(BOOL)a3 specifics:(id)a4;
- (void)sendDoneEventWithDidShare:(BOOL)a3 error:(id)a4 specifics:(id)a5;
- (void)sendEvent:(id)a3;
- (void)sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 specifics:(id)a5;
- (void)sendEventForPage:(unint64_t)a3 specifics:(id)a4;
@end

@implementation PKShareInitiationAnalyticsReporter

- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3
{
  return [(PKShareInitiationAnalyticsReporter *)self initWithPass:a3 sessionToken:0];
}

- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3 sessionToken:(id)a4
{
  return (PKShareInitiationAnalyticsReporter *)[(PKShareInitiationAnalyticsReporter *)self _initWithPass:a3 sessionToken:a4 reuseExistingSession:0];
}

- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3 reuseExistingSession:(BOOL)a4
{
  return (PKShareInitiationAnalyticsReporter *)[(PKShareInitiationAnalyticsReporter *)self _initWithPass:a3 sessionToken:0 reuseExistingSession:a4];
}

- (id)_initWithPass:(id)a3 sessionToken:(id)a4 reuseExistingSession:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F87048];
    v15.receiver = self;
    v15.super_class = (Class)PKShareInitiationAnalyticsReporter;
    v11 = [(PKSharingAnalyticsReporter *)&v15 initWithSubject:v10 sessionToken:a4 reuseExistingSession:v5];
    v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_pass, a3);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPass *)self->_pass secureElementPass];
  [v5 cardType];
  PKPaymentCardTypeToString();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = [(__CFString *)v6 lowercaseString];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

  v8 = self->_pass;
  if ([(PKPass *)v8 passType] == PKPassTypeSecureElement)
  {
    id v9 = [(PKPass *)v8 secureElementPass];
    unint64_t v10 = [v9 cardType];
    if (v10 <= 4) {
      v6 = (__CFString *)**((id **)&unk_1E59CBF48 + v10);
    }
  }
  else
  {
    v6 = @"other";
  }

  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
  v11 = [(PKPass *)self->_pass secureElementPass];
  if (![v11 isIdentityPass])
  {
    if ([v11 isAccessPass])
    {
      unint64_t v14 = [v11 accessType];
      if (v14 < 7)
      {
        v13 = off_1E59CC090[v14];
        goto LABEL_13;
      }
    }
LABEL_12:
    v13 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    goto LABEL_13;
  }
  uint64_t v12 = [v11 identityType];
  if ((unint64_t)(v12 - 1) >= 3) {
    goto LABEL_12;
  }
  v13 = off_1E59CBF70[v12 - 1];
LABEL_13:

  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
  v15.receiver = self;
  v15.super_class = (Class)PKShareInitiationAnalyticsReporter;
  [(PKSharingAnalyticsReporter *)&v15 sendEvent:v4];
}

- (void)sendEventForPage:(unint64_t)a3 specifics:(id)a4
{
}

- (void)sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 specifics:(id)a5
{
}

- (void)sendAuthenticationEventForSuccess:(BOOL)a3 specifics:(id)a4
{
  BOOL v4 = a3;
  v6 = (void *)[a4 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v10 = v8;

  if (v4) {
    id v9 = @"success";
  }
  else {
    id v9 = @"failure";
  }
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F86C50]];
  [(PKShareInitiationAnalyticsReporter *)self _sendEventForPage:3 button:0 eventType:*MEMORY[0x1E4F863F0] specifics:v10];
}

- (void)sendDoneEventWithDidShare:(BOOL)a3 error:(id)a4 specifics:(id)a5
{
  BOOL v6 = a3;
  id v15 = a4;
  id v8 = (void *)[a5 mutableCopy];
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v11 = v10;

  uint64_t v12 = *MEMORY[0x1E4F86CB0];
  if (v6)
  {
    v13 = (void *)MEMORY[0x1E4F86CB8];
  }
  else
  {
    if (v15)
    {
      [v11 setObject:*MEMORY[0x1E4F86CA8] forKeyedSubscript:v12];
      unint64_t v14 = ErrorTypeFromError(v15);
      [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F862F8]];

      goto LABEL_10;
    }
    v13 = (void *)MEMORY[0x1E4F86CA0];
  }
  [v11 setObject:*v13 forKeyedSubscript:v12];
LABEL_10:
  [(PKShareInitiationAnalyticsReporter *)self _sendEventForPage:4 button:0 eventType:*MEMORY[0x1E4F864A0] specifics:v11];
}

- (void)_sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 eventType:(id)a5 specifics:(id)a6
{
  id v10 = a5;
  v11 = (void *)[a6 mutableCopy];
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v20 = v13;

  [v20 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F86308]];
  uint64_t v14 = *MEMORY[0x1E4F86730];
  id v15 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F86730]];

  if (v15) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = a3 > 4;
  }
  if (!v16) {
    [v20 setObject:off_1E59CC068[a3] forKeyedSubscript:v14];
  }
  uint64_t v17 = *MEMORY[0x1E4F86120];
  v18 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F86120]];

  if (!v18)
  {
    if (a4 == 1)
    {
      v19 = (void *)MEMORY[0x1E4F86148];
    }
    else
    {
      if (a4 != 2) {
        goto LABEL_15;
      }
      v19 = (void *)MEMORY[0x1E4F861B8];
    }
    [v20 setObject:*v19 forKeyedSubscript:v17];
  }
LABEL_15:
  [(PKShareInitiationAnalyticsReporter *)self sendEvent:v20];
}

- (void).cxx_destruct
{
}

@end