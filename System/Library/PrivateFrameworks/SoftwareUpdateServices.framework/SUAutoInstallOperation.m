@interface SUAutoInstallOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDateExpired:(id)a3;
- (BOOL)_isEffectivelyScheduled;
- (BOOL)_isValidForScheduling;
- (BOOL)_isValidTillDate:(id)a3;
- (BOOL)isCanceled;
- (BOOL)isExpired;
- (NSString)description;
- (NSUUID)id;
- (SUAutoInstallForecast)forecast;
- (SUAutoInstallOperation)init;
- (SUAutoInstallOperation)initWithAutoInstallOperationModel:(id)a3 client:(id)a4;
- (SUAutoInstallOperation)initWithCoder:(id)a3;
- (SUAutoInstallOperationDelegate)delegate;
- (id)_initWithClient:(id)a3 clientOwned:(BOOL)a4 id:(id)a5 forecast:(id)a6 agreementStatus:(int)a7 cancelled:(BOOL)a8 expired:(BOOL)a9;
- (id)uniqueIdentifier;
- (int)agreementStatus;
- (void)_noteAutoInstallOperationDidConsent;
- (void)_noteAutoInstallOperationDidExpireWithError:(id)a3;
- (void)_noteAutoInstallOperationIsReadyToInstall:(id)a3;
- (void)_noteAutoInstallOperationPasscodePolicyChanged:(unint64_t)a3;
- (void)_noteAutoInstallOperationWasCancelled;
- (void)cancel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAgreementStatus:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SUAutoInstallOperation

- (SUAutoInstallOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUAutoInstallOperation;
  result = [(SUAutoInstallOperation *)&v3 init];
  if (result)
  {
    result->_agreementStatus = 0;
    *(_WORD *)&result->_canceled = 0;
  }
  return result;
}

- (id)_initWithClient:(id)a3 clientOwned:(BOOL)a4 id:(id)a5 forecast:(id)a6 agreementStatus:(int)a7 cancelled:(BOOL)a8 expired:(BOOL)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  if (!v16)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SUAutoInstallOperation.m", 52, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
LABEL_9:
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SUAutoInstallOperation.m", 53, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v17) {
    goto LABEL_9;
  }
LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)SUAutoInstallOperation;
  v19 = [(SUAutoInstallOperation *)&v25 init];
  v20 = v19;
  if (v19)
  {
    v19->_clientOwned = a4;
    objc_storeStrong((id *)&v19->_client, a3);
    objc_storeStrong((id *)&v20->_id, a5);
    objc_storeStrong((id *)&v20->_forecast, a6);
    v20->_agreementStatus = a7;
    v20->_canceled = a8;
    v20->_expired = a9;
    if (!a8 && !a9) {
      [v16 _registerAutoInstallOperationClientHandler:v20];
    }
  }

  return v20;
}

- (SUAutoInstallOperation)initWithAutoInstallOperationModel:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 id];
  v9 = [v7 forecast];
  uint64_t v10 = [v7 agreementStatus];

  LOBYTE(v13) = 0;
  v11 = [(SUAutoInstallOperation *)self _initWithClient:v6 clientOwned:0 id:v8 forecast:v9 agreementStatus:v10 cancelled:0 expired:v13];

  return v11;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  if (self->_clientOwned) {
    [(SUManagerClient *)self->_client invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUAutoInstallOperation;
  [(SUAutoInstallOperation *)&v3 dealloc];
}

- (void)setAgreementStatus:(int)a3
{
  self->_agreementStatus = a3;
  if (a3 == 1)
  {
    client = self->_client;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__SUAutoInstallOperation_setAgreementStatus___block_invoke;
    v6[3] = &unk_26447CF50;
    v6[4] = self;
    [(SUManagerClient *)client _consentAutoInstallOperation:self withResult:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained autoInstallOperationDidConsent:self];
  }
}

void __45__SUAutoInstallOperation_setAgreementStatus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cancel
{
  self->_canceled = 1;
  [(SUManagerClient *)self->_client _unregisterAutoInstallOperationClientHandler:self];
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__SUAutoInstallOperation_cancel__block_invoke;
  v9[3] = &unk_26447CF50;
  v9[4] = self;
  [(SUManagerClient *)client _cancelAutoInstallOperation:self withResult:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 autoInstallOperationWasCancelled:self];
    }
  }
}

void __32__SUAutoInstallOperation_cancel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"[<SUAutoInstallOperation:%p> ", self);
  [v3 appendString:v4];

  v5 = NSString;
  id v6 = [(SUAutoInstallOperation *)self id];
  char v7 = [v6 UUIDString];
  id v8 = [v5 stringWithFormat:@"ID=%@, ", v7];
  [v3 appendString:v8];

  v9 = NSString;
  if ([(SUAutoInstallOperation *)self agreementStatus] == 1) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  v11 = [v9 stringWithFormat:@"AcceptedAgreementStatus=%@, ", v10];
  [v3 appendString:v11];

  v12 = NSString;
  if ([(SUAutoInstallOperation *)self isExpired]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  v14 = [v12 stringWithFormat:@"isExpired=%@, ", v13];
  [v3 appendString:v14];

  v15 = NSString;
  if ([(SUAutoInstallOperation *)self _isEffectivelyScheduled]) {
    id v16 = @"YES";
  }
  else {
    id v16 = @"NO";
  }
  id v17 = [v15 stringWithFormat:@"isScheduled=%@, ", v16];
  [v3 appendString:v17];

  id v18 = NSString;
  if ([(SUAutoInstallOperation *)self isCanceled]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  v20 = [v18 stringWithFormat:@"isCancelled=%@, ", v19];
  [v3 appendString:v20];

  v21 = NSString;
  if ([(SUAutoInstallOperation *)self _isValidForScheduling]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  v23 = [v21 stringWithFormat:@"isValidForScheduling=%@, ", v22];
  [v3 appendString:v23];

  v24 = [NSString stringWithFormat:@"ForecastDetails=%@", self->_forecast];
  [v3 appendString:v24];

  [v3 appendString:@"]"];
  return (NSString *)v3;
}

- (BOOL)isExpired
{
  return self->_expired;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUAutoInstallOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SUManagerClient);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__id"];
  char v7 = [v4 decodeBoolForKey:@"__expired"];
  uint64_t v8 = [v4 decodeBoolForKey:@"__cancelled"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"__agreementStatus"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__forecast"];

  LOBYTE(v13) = v7;
  v11 = [(SUAutoInstallOperation *)self _initWithClient:v5 clientOwned:1 id:v6 forecast:v10 agreementStatus:v9 cancelled:v8 expired:v13];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUAutoInstallOperation *)self id];
  [v4 encodeObject:v5 forKey:@"__id"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUAutoInstallOperation isExpired](self, "isExpired"), @"__expired");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUAutoInstallOperation isCanceled](self, "isCanceled"), @"__cancelled");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SUAutoInstallOperation agreementStatus](self, "agreementStatus"), @"__agreementStatus");
  id v6 = [(SUAutoInstallOperation *)self forecast];
  [v4 encodeObject:v6 forKey:@"__forecast"];
}

- (id)uniqueIdentifier
{
  return [(NSUUID *)self->_id UUIDString];
}

- (void)_noteAutoInstallOperationWasCancelled
{
  if (!self->_canceled)
  {
    self->_canceled = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained autoInstallOperationWasCancelled:self];
  }
  client = self->_client;
  [(SUManagerClient *)client _unregisterAutoInstallOperationClientHandler:self];
}

- (void)_noteAutoInstallOperationDidExpireWithError:(id)a3
{
  id v10 = a3;
  if (!self->_expired)
  {
    self->_expired = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      char v6 = objc_opt_respondsToSelector();

      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      id v8 = v7;
      if (v6)
      {
        [v7 autoInstallOperationDidExpire:self withError:v10];
      }
      else
      {
        char v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) == 0) {
          goto LABEL_8;
        }
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 autoInstallOperationDidExpire:self];
      }
    }
  }
LABEL_8:
  [(SUManagerClient *)self->_client _unregisterAutoInstallOperationClientHandler:self];
}

- (void)_noteAutoInstallOperationDidConsent
{
  if (self->_agreementStatus != 1)
  {
    self->_agreementStatus = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained autoInstallOperationDidConsent:self];
  }
}

- (void)_noteAutoInstallOperationIsReadyToInstall:(id)a3
{
  id v18 = (void (**)(id, void, void *))a3;
  if (*(_WORD *)&self->_canceled)
  {
    SULogInfo(@"auto install operation (%@) not ready: canceled: %@, expired: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)self->_id);
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 49;
LABEL_3:
    uint64_t v13 = [v11 errorWithDomain:@"com.apple.softwareupdateservices.errors" code:v12 userInfo:0];
    v18[2](v18, 0, v13);
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained
    || (v15 = WeakRetained,
        id v16 = objc_loadWeakRetained((id *)&self->_delegate),
        char v17 = objc_opt_respondsToSelector(),
        v16,
        v15,
        (v17 & 1) == 0))
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 48;
    goto LABEL_3;
  }
  uint64_t v13 = objc_loadWeakRetained((id *)&self->_delegate);
  [v13 autoInstallOperationIsReadyToInstall:self withResponse:v18];
LABEL_4:
}

- (void)_noteAutoInstallOperationPasscodePolicyChanged:(unint64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 autoInstallOperationPasscodePolicyDidChange:self passcodePolicyType:a3];
    }
  }
}

- (BOOL)_isEffectivelyScheduled
{
  v2 = self;
  id v3 = [(SUAutoInstallOperation *)self forecast];
  uint64_t v4 = [v3 suEndDate];
  LOBYTE(v2) = [(SUAutoInstallOperation *)v2 _isValidTillDate:v4];

  return (char)v2;
}

- (BOOL)_isValidForScheduling
{
  v2 = self;
  id v3 = [(SUAutoInstallOperation *)self forecast];
  uint64_t v4 = [v3 suEndDate];
  LOBYTE(v2) = [(SUAutoInstallOperation *)v2 _isValidTillDate:v4];

  return (char)v2;
}

- (BOOL)_isValidTillDate:(id)a3
{
  id v4 = a3;
  if ([(SUAutoInstallOperation *)self isExpired]
    || [(SUAutoInstallOperation *)self isCanceled])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = ![(SUAutoInstallOperation *)self _isDateExpired:v4];
  }

  return v5;
}

- (BOOL)_isDateExpired:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  BOOL v5 = [v3 date];
  uint64_t v6 = [v4 laterDate:v5];

  return v6 == v5;
}

- (NSUUID)id
{
  return self->_id;
}

- (SUAutoInstallOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUAutoInstallOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUAutoInstallForecast)forecast
{
  return self->_forecast;
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (int)agreementStatus
{
  return self->_agreementStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecast, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end