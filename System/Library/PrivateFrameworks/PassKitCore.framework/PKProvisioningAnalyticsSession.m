@interface PKProvisioningAnalyticsSession
+ (id)continueAnalyticsSessionForEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5 archivedParent:(id)a6;
+ (id)startAnalyticsSessionForEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5;
- (PKProvisioningAnalyticsSession)initWithEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5;
- (PKProvisioningAnalyticsSession)initWithEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5 archivedParent:(id)a6;
- (id)archivedParentToken;
- (id)createStepReporter;
- (id)createViewReporterForPage:(id)a3;
- (void)_clearEnvironmentValues;
- (void)_reportEvent:(id)a3;
- (void)didReceiveEvent:(id)a3;
- (void)resetForNewProductSetup;
- (void)setPass:(id)a3;
- (void)setProductType:(id)a3 subtype:(id)a4;
- (void)setSetupProduct:(id)a3;
- (void)stop;
@end

@implementation PKProvisioningAnalyticsSession

+ (id)startAnalyticsSessionForEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[PKProvisioningAnalyticsSession alloc] initWithEnvironment:v9 intent:v8 referralSource:v7];

  return v10;
}

+ (id)continueAnalyticsSessionForEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5 archivedParent:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[PKProvisioningAnalyticsSession alloc] initWithEnvironment:v12 intent:v11 referralSource:v10 archivedParent:v9];

  return v13;
}

- (PKProvisioningAnalyticsSession)initWithEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5
{
  return [(PKProvisioningAnalyticsSession *)self initWithEnvironment:a3 intent:a4 referralSource:a5 archivedParent:0];
}

- (PKProvisioningAnalyticsSession)initWithEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5 archivedParent:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKProvisioningAnalyticsSession;
  v15 = [(PKProvisioningAnalyticsSession *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a3);
    objc_storeStrong((id *)&v16->_intent, a4);
    uint64_t v17 = [v13 copy];
    referralSource = v16->_referralSource;
    v16->_referralSource = (NSString *)v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uint64_t v20 = [v19 UUIDString];
    sessionID = v16->_sessionID;
    v16->_sessionID = (NSString *)v20;

    objc_storeStrong((id *)&v16->_subject, @"walletProvisioning");
    if (v14)
    {
      v16->_didBeginWalletProvisioningSubject = 1;
      +[PKAnalyticsReporter beginSubjectReporting:v16->_subject withArchivedParent:v14];
    }
    v22 = +[PKAnalyticsReporter reporterForSubject:v16->_subject];

    if (!v22)
    {
      v16->_didBeginWalletProvisioningSubject = 1;
      +[PKAnalyticsReporter beginSubjectReporting:v16->_subject];
    }
  }

  return v16;
}

- (id)createViewReporterForPage:(id)a3
{
  id v4 = a3;
  v5 = [[PKProvisioningAnalyticsSessionUIReporter alloc] initWithResponder:self sessionID:self->_sessionID pageTag:v4];

  return v5;
}

- (id)createStepReporter
{
  v2 = [(PKProvisioningAnalyticsSessionReporter *)[PKProvisioningAnalyticsSessionStepReporter alloc] initWithResponder:self sessionID:self->_sessionID];
  return v2;
}

- (void)stop
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"sessionFinished" forKeyedSubscript:@"eventType"];
  [(PKProvisioningAnalyticsSession *)self _reportEvent:v3];
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    +[PKAnalyticsReporter endSubjectReporting:self->_subject];
  }
}

- (void)_clearEnvironmentValues
{
  productTypeDescriptor = self->_productTypeDescriptor;
  self->_productTypeDescriptor = 0;

  productSubtypeDescriptor = self->_productSubtypeDescriptor;
  self->_productSubtypeDescriptor = 0;

  productMetadata = self->_productMetadata;
  self->_productMetadata = 0;

  passMetadata = self->_passMetadata;
  self->_passMetadata = 0;
}

- (void)resetForNewProductSetup
{
  [(PKProvisioningAnalyticsSession *)self _clearEnvironmentValues];
  id v5 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v3 = [v5 UUIDString];
  sessionID = self->_sessionID;
  self->_sessionID = v3;
}

- (id)archivedParentToken
{
  return +[PKAnalyticsReporter archivedSessionTokenForSubject:self->_subject];
}

- (void)_reportEvent:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setObject:self->_environment forKeyedSubscript:@"environment"];
  [v4 setObject:self->_productTypeDescriptor forKeyedSubscript:@"productType"];
  [v4 setObject:self->_productSubtypeDescriptor forKeyedSubscript:@"productSubType"];
  [v4 setObject:self->_sessionID forKeyedSubscript:@"provisioningSessionID"];
  if (self->_productMetadata) {
    objc_msgSend(v4, "addEntriesFromDictionary:");
  }
  if (self->_passMetadata) {
    objc_msgSend(v4, "addEntriesFromDictionary:");
  }
  v6[0] = self->_subject;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  +[PKAnalyticsReporter subjects:v5 sendEvent:v4];
}

- (void)didReceiveEvent:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(PKProvisioningAnalyticsSession *)self _reportEvent:v4];
}

- (void)setProductType:(id)a3 subtype:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = (NSString *)a4;
  productTypeDescriptor = self->_productTypeDescriptor;
  self->_productTypeDescriptor = v6;
  id v13 = v6;

  productSubtypeDescriptor = self->_productSubtypeDescriptor;
  self->_productSubtypeDescriptor = v7;
  id v10 = v7;

  passMetadata = self->_passMetadata;
  self->_passMetadata = 0;

  productMetadata = self->_productMetadata;
  self->_productMetadata = 0;
}

- (void)setSetupProduct:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    productMetadata = self->_productMetadata;
    self->_productMetadata = v4;

    v6 = [v12 displayName];
    [(NSMutableDictionary *)self->_productMetadata setObject:v6 forKeyedSubscript:@"issuer"];

    id v7 = [v12 configuration];
    unint64_t v8 = [v7 type];
    if (v8 <= 0xB) {
      unint64_t v8 = *off_1E56DF3E8[v8];
    }
    productTypeDescriptor = self->_productTypeDescriptor;
    self->_productTypeDescriptor = (NSString *)v8;

    uint64_t v10 = 48;
  }
  else
  {
    uint64_t v10 = 56;
  }
  id v11 = *(Class *)((char *)&self->super.isa + v10);
  *(Class *)((char *)&self->super.isa + v10) = 0;
}

- (void)setPass:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  passMetadata = self->_passMetadata;
  self->_passMetadata = v5;

  id v7 = self->_passMetadata;
  id v8 = v4;
  id v41 = v8;
  if (!v8 || !v7) {
    goto LABEL_27;
  }
  uint64_t v9 = [v8 passType];
  if ((unint64_t)(v9 + 1) >= 3) {
    uint64_t v10 = @"unknown";
  }
  else {
    uint64_t v10 = off_1E56DF448[v9 + 1];
  }
  [(NSMutableDictionary *)v7 setObject:v10 forKeyedSubscript:@"passType"];

  unint64_t v11 = [v41 style];
  if (v11 < 0xD && ((0x13FFu >> v11) & 1) != 0) {
    id v12 = off_1E56DF460[v11];
  }
  else {
    id v12 = @"unknown";
  }
  [(NSMutableDictionary *)v7 setObject:v12 forKeyedSubscript:@"passStyle"];

  id v13 = [v41 nfcPayload];
  PKAnalyticsReportSwitchToggleResultValue(v13 != 0);
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)v7 setObject:v14 forKeyedSubscript:@"hasNFC"];

  id v15 = v41;
  if ([v15 passType] == 1)
  {
    v16 = [v15 secureElementPass];
    unint64_t v17 = [v16 cardType];
    if (v17 <= 4) {
      id v14 = *off_1E56DF4C8[v17];
    }
  }
  else
  {
    id v14 = @"other";
  }

  [(NSMutableDictionary *)v7 setObject:v14 forKeyedSubscript:@"productType"];
  v18 = [v15 secureElementPass];
  if ([v18 isIdentityPass])
  {
    uint64_t v19 = [v18 identityType];
    if ((unint64_t)(v19 - 1) < 3)
    {
      uint64_t v20 = off_1E56DF4F0[v19 - 1];
      goto LABEL_22;
    }
  }
  else if ([v18 isAccessPass])
  {
    unint64_t v21 = [v18 accessType];
    if (v21 < 7)
    {
      uint64_t v20 = off_1E56DF508[v21];
      goto LABEL_22;
    }
  }
  uint64_t v20 = @"unknown";
LABEL_22:

  [(NSMutableDictionary *)v7 setObject:v20 forKeyedSubscript:@"productSubType"];
  v22 = [v15 secureElementPass];
  v23 = [v22 devicePaymentApplications];
  BOOL v24 = (unint64_t)[v23 count] > 1;

  v25 = PKAnalyticsReportSwitchToggleResultValue(v24);

  [(NSMutableDictionary *)v7 setObject:v25 forKeyedSubscript:@"coBadgeEnable"];
  v26 = [v15 secureElementPass];
  v27 = @"unknown";
  v28 = [v26 organizationName];
  if ([v28 length])
  {
    unint64_t v29 = [v26 cardType];
    if (v29 <= 4 && ((1 << v29) & 0x16) != 0)
    {
      v30 = v28;

      v27 = v30;
    }
  }

  [(NSMutableDictionary *)v7 setObject:v27 forKeyedSubscript:@"issuer"];
LABEL_27:

  BOOL v31 = [v41 passType] == 1;
  v32 = v41;
  if (v31)
  {
    id v33 = v41;
    if (v41)
    {
      v34 = self->_passMetadata;
      if (v34)
      {
        v35 = v34;
        v36 = PKAnalyticsReportSwitchToggleResultValue([v33 isCobranded]);
        [(NSMutableDictionary *)v35 setObject:v36 forKeyedSubscript:@"isCobrandedCard"];

        v37 = [v33 cobrandName];
        [(NSMutableDictionary *)v35 setObject:v37 forKeyedSubscript:@"cobrandName"];

        v38 = [v33 issuerCountryCode];
        [(NSMutableDictionary *)v35 setObject:v38 forKeyedSubscript:@"issuerCountryCode"];

        v39 = [v33 devicePrimaryPaymentApplication];
        v40 = PKPaymentNetworkNameForPaymentCredentialType([v39 paymentNetworkIdentifier]);
        [(NSMutableDictionary *)v35 setObject:v40 forKeyedSubscript:@"networkName"];
      }
    }

    v32 = v41;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_passMetadata, 0);
  objc_storeStrong((id *)&self->_productMetadata, 0);
  objc_storeStrong((id *)&self->_productSubtypeDescriptor, 0);
  objc_storeStrong((id *)&self->_productTypeDescriptor, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end