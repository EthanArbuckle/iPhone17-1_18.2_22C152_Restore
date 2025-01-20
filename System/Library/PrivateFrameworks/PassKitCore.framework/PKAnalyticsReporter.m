@interface PKAnalyticsReporter
+ (id)_authMethodFromResult:(id)a3;
+ (id)_eventTypeFromError:(id)a3;
+ (id)_isDTOSupported;
+ (id)_isDTOUserEnabled;
+ (id)_stringFromBool:(BOOL)a3;
+ (id)analyticsErrorTextForError:(int64_t)a3;
+ (id)archivedSessionTokenForAnalyticsSubject:(id)a3;
+ (id)pageTagForAppleCashSenderError:(id)a3;
+ (id)reporterForAnalyticsSubject:(id)a3;
+ (id)subjectDictionary;
+ (id)subjectSessionStateDateDictionary;
+ (id)subjectToReportDashboardAnalyticsForAccount:(id)a3;
+ (id)subjectToReportDashboardAnalyticsForFeature:(unint64_t)a3;
+ (id)subjectToReportDashboardAnalyticsForPass:(id)a3;
+ (id)virtualCardReferralSource:(unint64_t)a3;
+ (int)clientTypeForSubject:(id)a3;
+ (void)_attachFeatureTypeToEvent:(id)a3 forSubject:(id)a4;
+ (void)_isDTOPasscodeFallbackAllowed:(id)a3;
+ (void)beginSubjectReporting:(id)a3;
+ (void)beginSubjectReporting:(id)a3 withArchivedParent:(id)a4;
+ (void)endSubjectReporting:(id)a3;
+ (void)reportAccountRewardsEventIfNecessary:(id)a3;
+ (void)reportAppleCashSenderErrorPage:(id)a3;
+ (void)reportAppleCashSenderErrorPage:(id)a3 buttonTag:(id)a4;
+ (void)reportDTOAuthEndedWithResult:(id)a3 error:(id)a4 forSubject:(id)a5;
+ (void)reportDTOAuthEvent:(id)a3 forSubject:(id)a4;
+ (void)reportDashboardEventIfNecessary:(id)a3 forPass:(id)a4;
+ (void)sendSingularEvent:(id)a3;
+ (void)subject:(id)a3 category:(int64_t)a4 sendEvent:(id)a5;
+ (void)subject:(id)a3 sendEvent:(id)a4;
+ (void)subjects:(id)a3 category:(int64_t)a4 sendEvent:(id)a5;
+ (void)subjects:(id)a3 sendEvent:(id)a4;
+ (void)updateIdentityEventToReportDashboardAnalytics:(id)a3 forPass:(id)a4;
- (PKAnalyticsReporter)initWithArchivedParent:(id)a3 subject:(id)a4;
- (PKAnalyticsReporter)initWithParent:(id)a3 subject:(id)a4;
- (PKAnalyticsReporter)initWithParentToken:(id)a3 subject:(id)a4;
- (PKAnalyticsReporter)initWithSubject:(id)a3;
- (id)_reportingSessionID;
- (id)archivedSessionToken;
- (int64_t)bucketedSessionDurationFromDuration:(int64_t)a3;
- (void)sendEvent:(id)a3;
- (void)sendEvent:(id)a3 withCategory:(int64_t)a4;
@end

@implementation PKAnalyticsReporter

+ (void)subject:(id)a3 sendEvent:(id)a4
{
}

+ (void)beginSubjectReporting:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [[PKAnalyticsReporter alloc] initWithSubject:v3];
  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  v5 = +[PKAnalyticsReporter subjectDictionary];
  v6 = +[PKAnalyticsReporter subjectSessionStateDateDictionary];
  v7 = [v5 objectForKey:v3];
  v8 = [v6 objectForKey:v3];
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setObject:v9 forKey:v3];
  }
  [v5 setObject:v4 forKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
  if (v7)
  {
    v17 = @"eventType";
    v18[0] = @"reporterCollision";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [v7 sendEvent:v10];
  }
  v11 = (__CFString *)v3;
  v12 = v11;
  if (v11 == @"appleCardEngagement"
    || v11
    && (int v13 = [(__CFString *)v11 isEqualToString:@"appleCardEngagement"],
        v12,
        v13))
  {
    v15[0] = @"eventType";
    v15[1] = @"dnuIsEnabled";
    v16[0] = @"reportDNUState";
    v16[1] = @"false";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    +[PKAnalyticsReporter subject:v12 sendEvent:v14];
  }
}

- (PKAnalyticsReporter)initWithSubject:(id)a3
{
  return [(PKAnalyticsReporter *)self initWithParent:0 subject:a3];
}

- (PKAnalyticsReporter)initWithParentToken:(id)a3 subject:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)PKAnalyticsReporter;
  v8 = [(PKAnalyticsReporter *)&v33 init];
  if (v8)
  {
    v9 = PKLogFacilityTypeGetObject(0x15uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Initiating RTC reporting for subject: %@", buf, 0xCu);
    }

    v8->_lockArchive._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_subject, a4);
    uint64_t v10 = [MEMORY[0x1E4F94620] newHierarchyTokenFromParentToken:v6];
    sessionToken = v8->_sessionToken;
    v8->_sessionToken = v10;

    v12 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];
    v14 = (void *)v13;
    v15 = &stru_1EE0F5368;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    v16 = v15;

    v36[0] = *MEMORY[0x1E4F94658];
    v17 = objc_msgSend(NSNumber, "numberWithInt:", +[PKAnalyticsReporter clientTypeForSubject:](PKAnalyticsReporter, "clientTypeForSubject:", v7));
    uint64_t v18 = *MEMORY[0x1E4F94660];
    v37[0] = v17;
    v37[1] = &unk_1EE22E5F0;
    uint64_t v19 = *MEMORY[0x1E4F94650];
    v36[1] = v18;
    v36[2] = v19;
    uint64_t v20 = *MEMORY[0x1E4F94680];
    v37[2] = v16;
    v37[3] = &unk_1EE22C308;
    uint64_t v21 = *MEMORY[0x1E4F94648];
    v36[3] = v20;
    v36[4] = v21;
    v37[4] = MEMORY[0x1E4F1CC38];
    v36[5] = *MEMORY[0x1E4F94670];
    v37[5] = v8->_sessionToken;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:6];

    uint64_t v23 = *MEMORY[0x1E4F94690];
    v34[0] = *MEMORY[0x1E4F94688];
    v34[1] = v23;
    v35[0] = @"wallet";
    v35[1] = v7;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    id v25 = objc_alloc(MEMORY[0x1E4F94620]);
    uint64_t v26 = [v25 initWithSessionInfo:v22 userInfo:v24 frameworksToCheck:MEMORY[0x1E4F1CBF0]];
    session = v8->_session;
    v8->_session = (RTCReporting *)v26;

    objc_initWeak((id *)buf, v8->_session);
    v28 = v8->_session;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __51__PKAnalyticsReporter_initWithParentToken_subject___block_invoke;
    v30[3] = &unk_1E56EF470;
    objc_copyWeak(&v32, (id *)buf);
    id v31 = v7;
    [(RTCReporting *)v28 startConfigurationWithCompletionHandler:v30];

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
  return v8;
}

- (PKAnalyticsReporter)initWithParent:(id)a3 subject:(id)a4
{
  if (a3) {
    a3 = (id)*((void *)a3 + 3);
  }
  return [(PKAnalyticsReporter *)self initWithParentToken:a3 subject:a4];
}

+ (int)clientTypeForSubject:(id)a3
{
  uint64_t v3 = _MergedGlobals_262;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_MergedGlobals_262, &__block_literal_global_169);
  }
  int v5 = [(id)qword_1EB403328 containsObject:v4];

  if (v5) {
    return 31;
  }
  else {
    return 55;
  }
}

- (void)sendEvent:(id)a3
{
}

+ (void)subjects:(id)a3 category:(int64_t)a4 sendEvent:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = [a1 reporterForSubject:*(void *)(*((void *)&v15 + 1) + 8 * v13)];
        [v14 sendEvent:v9 withCategory:a4];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

+ (void)subject:(id)a3 category:(int64_t)a4 sendEvent:(id)a5
{
  id v8 = a5;
  id v9 = [a1 reporterForSubject:a3];
  [v9 sendEvent:v8 withCategory:a4];
}

+ (id)reporterForAnalyticsSubject:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  id v4 = +[PKAnalyticsReporter subjectDictionary];
  int v5 = [v4 objectForKey:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
  return v5;
}

+ (void)endSubjectReporting:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  id v4 = +[PKAnalyticsReporter subjectDictionary];
  int v5 = [v4 objectForKey:v3];

  id v6 = PKLogFacilityTypeGetObject(0x15uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 _reportingSessionID];
    int v10 = 138412546;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Terminating RTC reporting for subject: %@ session ID: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = +[PKAnalyticsReporter subjectDictionary];
  [v8 removeObjectForKey:v3];

  id v9 = +[PKAnalyticsReporter subjectSessionStateDateDictionary];
  [v9 removeObjectForKey:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
}

+ (id)subjectDictionary
{
  v2 = (void *)subjectDictionary_subjectDictionary;
  if (!subjectDictionary_subjectDictionary)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)subjectDictionary_subjectDictionary;
    subjectDictionary_subjectDictionary = (uint64_t)v3;

    v2 = (void *)subjectDictionary_subjectDictionary;
  }
  return v2;
}

+ (id)subjectSessionStateDateDictionary
{
  v2 = (void *)subjectSessionStateDateDictionary_dateDictionary;
  if (!subjectSessionStateDateDictionary_dateDictionary)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)subjectSessionStateDateDictionary_dateDictionary;
    subjectSessionStateDateDictionary_dateDictionary = (uint64_t)v3;

    v2 = (void *)subjectSessionStateDateDictionary_dateDictionary;
  }
  return v2;
}

- (void)sendEvent:(id)a3 withCategory:(int64_t)a4
{
  v78[3] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[a3 mutableCopy];
  id v7 = self->_subject;
  if (v7 == @"appleCardEngagement") {
    goto LABEL_43;
  }
  id v8 = v7;
  if (v7)
  {
    char v9 = [(__CFString *)v7 isEqualToString:@"appleCardEngagement"];

    if (v9) {
      goto LABEL_43;
    }
  }
  int v10 = self->_subject;
  if (v10 == @"appleCardOnboarding") {
    goto LABEL_43;
  }
  id v11 = v10;
  if (v10)
  {
    char v12 = [(__CFString *)v10 isEqualToString:@"appleCardOnboarding"];

    if (v12) {
      goto LABEL_43;
    }
  }
  uint64_t v13 = self->_subject;
  if (v13 == @"fhOnboarding") {
    goto LABEL_43;
  }
  uint64_t v14 = v13;
  if (v13)
  {
    char v15 = [(__CFString *)v13 isEqualToString:@"fhOnboarding"];

    if (v15) {
      goto LABEL_43;
    }
  }
  long long v16 = self->_subject;
  if (v16 == @"shareInitiation") {
    goto LABEL_43;
  }
  long long v17 = v16;
  if (v16)
  {
    char v18 = [(__CFString *)v16 isEqualToString:@"shareInitiation"];

    if (v18) {
      goto LABEL_43;
    }
  }
  uint64_t v19 = self->_subject;
  if (v19 == @"shareRedemption") {
    goto LABEL_43;
  }
  uint64_t v20 = v19;
  if (v19)
  {
    char v21 = [(__CFString *)v19 isEqualToString:@"shareRedemption"];

    if (v21) {
      goto LABEL_43;
    }
  }
  v22 = self->_subject;
  if (v22 == @"orderManagement") {
    goto LABEL_43;
  }
  uint64_t v23 = v22;
  if (v22)
  {
    char v24 = [(__CFString *)v22 isEqualToString:@"orderManagement"];

    if (v24) {
      goto LABEL_43;
    }
  }
  id v25 = self->_subject;
  if (v25 == @"passManagement") {
    goto LABEL_43;
  }
  uint64_t v26 = v25;
  if (v25)
  {
    char v27 = [(__CFString *)v25 isEqualToString:@"passManagement"];

    if (v27) {
      goto LABEL_43;
    }
  }
  v28 = self->_subject;
  if (v28 == @"identityInApp") {
    goto LABEL_43;
  }
  v29 = v28;
  if (v28)
  {
    char v30 = [(__CFString *)v28 isEqualToString:@"identityInApp"];

    if (v30) {
      goto LABEL_43;
    }
  }
  id v31 = self->_subject;
  if (v31 == @"accessProvisioning") {
    goto LABEL_43;
  }
  id v32 = v31;
  if (v31)
  {
    char v33 = [(__CFString *)v31 isEqualToString:@"accessProvisioning"];

    if (v33) {
      goto LABEL_43;
    }
  }
  v34 = self->_subject;
  if (v34 == @"expressPresentment") {
    goto LABEL_43;
  }
  v35 = v34;
  if (v34)
  {
    char v36 = [(__CFString *)v34 isEqualToString:@"expressPresentment"];

    if (v36) {
      goto LABEL_43;
    }
  }
  v37 = self->_subject;
  if (v37 == @"inApp") {
    goto LABEL_43;
  }
  v38 = v37;
  if (v37)
  {
    char v39 = [(__CFString *)v37 isEqualToString:@"inApp"];

    if (v39) {
      goto LABEL_43;
    }
  }
  uint64_t v40 = self->_subject;
  if (v40 == @"vasPasses") {
    goto LABEL_43;
  }
  v41 = v40;
  if (v40)
  {
    char v42 = [(__CFString *)v40 isEqualToString:@"vasPasses"];

    if (v42) {
      goto LABEL_43;
    }
  }
  if ((v43 = self->_subject, v43 == @"walletProvisioning")
    || (v44 = v43) != 0
    && (char v45 = [(__CFString *)v43 isEqualToString:@"walletProvisioning"],
        v44,
        (v45 & 1) != 0)
    || (v46 = self->_subject, v46 == @"p2p"))
  {
LABEL_43:
    v49 = [MEMORY[0x1E4F1C9C8] date];
    v50 = PKDateIgnoringSmallerUnitsWithTimeZone(v49, 16, 0);

    v51 = NSNumber;
    [v50 timeIntervalSince1970];
    v52 = objc_msgSend(v51, "numberWithDouble:");
    [v6 setObject:v52 forKey:@"roundedClientTS"];

    int v48 = 1;
    goto LABEL_44;
  }
  v47 = v46;
  if (v46)
  {
    int v48 = [(__CFString *)v46 isEqualToString:@"p2p"];

    if (!v48) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  int v48 = 0;
LABEL_44:
  v53 = PKCurrentRegion();
  if (v53) {
    [v6 setObject:v53 forKey:@"Locale"];
  }
  if (v48)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
    v54 = +[PKAnalyticsReporter subjectSessionStateDateDictionary];
    v55 = [v54 objectForKey:self->_subject];
    if (v55)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
      v72 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v56 = [MEMORY[0x1E4F1C9C8] date];
      v57 = [v72 components:128 fromDate:v55 toDate:v56 options:0];
      uint64_t v58 = [v57 second];
    }
    else
    {
      v59 = PKLogFacilityTypeGetObject(0x15uLL);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        subject = self->_subject;
        *(_DWORD *)buf = 138412290;
        v74 = subject;
        _os_log_impl(&dword_190E10000, v59, OS_LOG_TYPE_DEFAULT, "Error: There is no analytics start date for subject: %@", buf, 0xCu);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
      uint64_t v58 = 0;
    }
    v61 = self->_subject;
    if (v61 == @"p2p"
      || (v62 = v61) != 0
      && (int v63 = [(__CFString *)v61 isEqualToString:@"p2p"], v62, v63))
    {
      uint64_t v58 = [(PKAnalyticsReporter *)self bucketedSessionDurationFromDuration:v58];
    }
    v64 = [NSNumber numberWithInteger:v58];
    [v6 setObject:v64 forKey:@"sessionDuration"];
  }
  v65 = (void *)[v6 copy];
  v77[0] = *MEMORY[0x1E4F94628];
  v66 = [NSNumber numberWithInteger:a4];
  uint64_t v67 = *MEMORY[0x1E4F94640];
  v78[0] = v66;
  v78[1] = &unk_1EE22C320;
  uint64_t v68 = *MEMORY[0x1E4F94638];
  v77[1] = v67;
  v77[2] = v68;
  v78[2] = v65;
  v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];

  [(RTCReporting *)self->_session sendMessageWithDictionary:v69 error:0];
  v70 = PKLogFacilityTypeGetObject(0x15uLL);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v71 = self->_subject;
    *(_DWORD *)buf = 138412546;
    v74 = v71;
    __int16 v75 = 2112;
    v76 = v65;
    _os_log_impl(&dword_190E10000, v70, OS_LOG_TYPE_DEFAULT, "subject: %@ event: %@", buf, 0x16u);
  }
}

+ (void)subjects:(id)a3 sendEvent:(id)a4
{
}

void __51__PKAnalyticsReporter_initWithParentToken_subject___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = PKLogFacilityTypeGetObject(0x15uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [WeakRetained getReportingSessionID];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "RTC reporting for subject: %@ initiated with session ID: %@", (uint8_t *)&v8, 0x16u);
  }
  if (!a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "No RTC backends found, no logs will be sent at this time.", (uint8_t *)&v8, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_archivedSessionToken, 0);
}

+ (id)virtualCardReferralSource:(unint64_t)a3
{
  id v3 = @"pushNotification";
  if (a3 == 1) {
    id v3 = @"summaryTile";
  }
  if (a3 == 2) {
    return @"wallet";
  }
  else {
    return v3;
  }
}

+ (id)subjectToReportDashboardAnalyticsForPass:(id)a3
{
  id v3 = a3;
  if ([v3 passType] != 1)
  {
    id v7 = 0;
    goto LABEL_16;
  }
  id v4 = v3;
  int v5 = [v4 associatedAccountServiceAccountIdentifier];

  if (!v5)
  {
    if ([v4 isPeerPaymentPass])
    {
      uint64_t v6 = PKAnalyticsSubjectAppleCash;
      goto LABEL_13;
    }
    if (([v4 isIdentityPass] & 1) != 0
      || ([v4 hasMerchantTokens] & 1) != 0
      || ![v4 associatedAccountFeatureIdentifier]
      || [v4 supportsVirtualCardNumber])
    {
      uint64_t v6 = PKAnalyticsSubjectPassManagement;
      goto LABEL_13;
    }
LABEL_14:
    id v7 = 0;
    goto LABEL_15;
  }
  if ([v4 associatedAccountFeatureIdentifier] != 2) {
    goto LABEL_14;
  }
  uint64_t v6 = PKAnalyticsSubjectAppleCardEngagement;
LABEL_13:
  id v7 = *v6;
LABEL_15:

LABEL_16:
  return v7;
}

+ (id)subjectToReportDashboardAnalyticsForAccount:(id)a3
{
  uint64_t v4 = [a3 feature];
  return (id)[a1 subjectToReportDashboardAnalyticsForFeature:v4];
}

+ (id)subjectToReportDashboardAnalyticsForFeature:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v4 = @"appleCardEngagement";
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (void)updateIdentityEventToReportDashboardAnalytics:(id)a3 forPass:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 secureElementPass];
  uint64_t v8 = [v7 identityType];

  if ((unint64_t)(v8 - 1) > 2) {
    uint64_t v9 = PKAnalyticsReportOtherValue;
  }
  else {
    uint64_t v9 = off_1E56DCDB8[v8 - 1];
  }
  uint64_t v12 = *v9;
  [v6 setObject:@"identity" forKeyedSubscript:@"productType"];
  [v6 setObject:v12 forKeyedSubscript:@"productSubType"];
  __int16 v10 = [v5 paymentPass];

  id v11 = [v10 issuerAdministrativeAreaCode];
  [v6 setObject:v11 forKeyedSubscript:@"issuer"];

  [v6 setObject:@"wallet" forKeyedSubscript:@"referralSource"];
}

+ (void)reportDashboardEventIfNecessary:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v9 = v6;
    id v7 = [a1 subjectToReportDashboardAnalyticsForPass:a4];
    if (v7)
    {
      uint64_t v8 = (void *)[v9 copy];
      +[PKAnalyticsReporter subject:v7 sendEvent:v8];
    }
    id v6 = v9;
  }
}

+ (void)reportAccountRewardsEventIfNecessary:(id)a3
{
  if (a3)
  {
    id v3 = (id)[a3 copy];
    +[PKAnalyticsReporter subject:@"appleCardEngagement" sendEvent:v3];
  }
}

+ (id)pageTagForAppleCashSenderError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"PKDisplayableError"];

  if (v5)
  {
    id v6 = [v3 userInfo];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F28A50]];

    id v3 = (id)v7;
  }
  uint64_t v8 = [v3 domain];
  int v9 = [v8 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"];

  if (v9)
  {
    uint64_t v10 = [v3 code];
    char v11 = v10 - 113;
    if ((unint64_t)(v10 - 40305) > 0x28) {
      goto LABEL_12;
    }
    if (((1 << v11) & 3) != 0)
    {
      uint64_t v12 = @"exceededCumulativeLimit";
      goto LABEL_15;
    }
    if (((1 << v11) & 0x8000000040) != 0)
    {
      uint64_t v12 = @"issuerDeclined";
      goto LABEL_15;
    }
    if (((1 << v11) & 0x10000100000) != 0)
    {
      uint64_t v12 = @"restrictedFamilyOnly";
    }
    else
    {
LABEL_12:
      if (v10 == 40301) {
        uint64_t v12 = @"insufficientFunds";
      }
      else {
        uint64_t v12 = @"unexpectedCashError";
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_15:

  return v12;
}

+ (void)reportAppleCashSenderErrorPage:(id)a3
{
  v6[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    v5[0] = @"pageTag";
    v5[1] = @"p2pSide";
    v6[0] = v3;
    v6[1] = @"sender";
    v5[2] = @"featureType";
    v5[3] = @"eventType";
    v6[2] = @"cash";
    v6[3] = @"error";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
    +[PKAnalyticsReporter subject:@"p2p" sendEvent:v4];
  }
}

+ (void)reportAppleCashSenderErrorPage:(id)a3 buttonTag:(id)a4
{
  v9[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    v8[0] = @"pageTag";
    v8[1] = @"p2pSide";
    v9[0] = v5;
    v9[1] = @"sender";
    v8[2] = @"featureType";
    v8[3] = @"eventType";
    v9[2] = @"cash";
    v9[3] = @"buttonTap";
    v8[4] = @"buttonTag";
    v9[4] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
    +[PKAnalyticsReporter subject:@"p2p" sendEvent:v7];
  }
}

+ (void)reportDTOAuthEvent:(id)a3 forSubject:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v12[0] = @"eventType";
  v12[1] = @"pageTag";
  v13[0] = v8;
  v13[1] = @"authentication";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  char v11 = (void *)[v9 initWithDictionary:v10];

  [a1 _attachFeatureTypeToEvent:v11 forSubject:v7];
  +[PKAnalyticsReporter subject:v7 sendEvent:v11];
}

+ (void)reportDTOAuthEndedWithResult:(id)a3 error:(id)a4 forSubject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__PKAnalyticsReporter_LocalAuthentication__reportDTOAuthEndedWithResult_error_forSubject___block_invoke;
  v14[3] = &unk_1E56EED80;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v18 = a1;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [a1 _isDTOPasscodeFallbackAllowed:v14];
}

void __90__PKAnalyticsReporter_LocalAuthentication__reportDTOAuthEndedWithResult_error_forSubject___block_invoke(uint64_t a1, void *a2)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v12[0] = @"authentication";
  v11[0] = @"pageTag";
  v11[1] = @"isDTOEnabled";
  id v5 = [*(id *)(a1 + 56) _isDTOUserEnabled];
  v12[1] = v5;
  v11[2] = @"isDTOSupported";
  id v6 = [*(id *)(a1 + 56) _isDTOSupported];
  v11[3] = @"isDTOPasscodeFallbackAllowed";
  void v12[2] = v6;
  v12[3] = v3;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v8 = (void *)[v4 initWithDictionary:v7];

  if (*(void *)(a1 + 32))
  {
    id v9 = objc_msgSend(*(id *)(a1 + 56), "_eventTypeFromError:");
    if (![v9 length])
    {

      goto LABEL_7;
    }
    id v10 = @"eventType";
  }
  else
  {
    [v8 setObject:@"authenticationSuccess" forKey:@"eventType"];
    id v9 = [*(id *)(a1 + 56) _authMethodFromResult:*(void *)(a1 + 40)];
    id v10 = @"localAuthenticationEventType";
  }
  [v8 setObject:v9 forKey:v10];

  [*(id *)(a1 + 56) _attachFeatureTypeToEvent:v8 forSubject:*(void *)(a1 + 48)];
  +[PKAnalyticsReporter subject:*(void *)(a1 + 48) sendEvent:v8];
LABEL_7:
}

+ (void)_isDTOPasscodeFallbackAllowed:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    v10[0] = &unk_1EE22C290;
    v10[1] = &unk_1EE22C2A8;
    v11[0] = MEMORY[0x1E4F1CC38];
    v11[1] = MEMORY[0x1E4F1CC38];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PKAnalyticsReporter_LocalAuthentication___isDTOPasscodeFallbackAllowed___block_invoke;
    v7[3] = &unk_1E56EEDA8;
    id v8 = v4;
    id v9 = a1;
    [v5 evaluatePolicy:1025 options:v6 reply:v7];
  }
}

void __74__PKAnalyticsReporter_LocalAuthentication___isDTOPasscodeFallbackAllowed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) _stringFromBool:a3 == 0];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

+ (id)_isDTOSupported
{
  uint64_t v3 = [MEMORY[0x1E4F30B78] sharedInstance];
  uint64_t v4 = [v3 isFeatureSupported];

  return (id)[a1 _stringFromBool:v4];
}

+ (id)_isDTOUserEnabled
{
  uint64_t v3 = [MEMORY[0x1E4F30B78] sharedInstance];
  uint64_t v4 = [v3 isFeatureEnabled];

  return (id)[a1 _stringFromBool:v4];
}

+ (id)_eventTypeFromError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F30B38]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    id v7 = @"authenticationError";
    if (v6 != -1) {
      id v7 = 0;
    }
    if (v6 == -2) {
      id v8 = @"authenticationCanceledByUser";
    }
    else {
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_authMethodFromResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:&unk_1EE22C2C0];

  if (v4)
  {
    int v5 = @"authenticationMethodBiometric";
  }
  else
  {
    uint64_t v6 = [v3 objectForKey:&unk_1EE22C2D8];

    if (v6) {
      int v5 = @"authenticationMethodPasscode";
    }
    else {
      int v5 = @"authenticationMethodOther";
    }
  }

  return v5;
}

+ (id)_stringFromBool:(BOOL)a3
{
  if (a3) {
    return @"true";
  }
  else {
    return @"false";
  }
}

+ (void)_attachFeatureTypeToEvent:(id)a3 forSubject:(id)a4
{
  id v9 = a3;
  int v5 = (__CFString *)a4;
  uint64_t v6 = @"p2p";
  if (v6 == v5)
  {

    goto LABEL_7;
  }
  id v7 = v6;
  if (!v5 || !v6)
  {

    goto LABEL_9;
  }
  int v8 = [(__CFString *)v5 isEqualToString:v6];

  if (v8) {
LABEL_7:
  }
    [v9 setObject:@"cash" forKey:@"featureType"];
LABEL_9:
}

+ (void)beginSubjectReporting:(id)a3 withArchivedParent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [[PKAnalyticsReporter alloc] initWithArchivedParent:v6 subject:v5];

  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  int v8 = +[PKAnalyticsReporter subjectDictionary];
  id v9 = [v8 objectForKey:v5];
  [v8 setObject:v7 forKey:v5];
  id v10 = +[PKAnalyticsReporter subjectSessionStateDateDictionary];
  id v11 = [v10 objectForKey:v5];
  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v10 setObject:v12 forKey:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
  if (v9)
  {
    id v13 = PKLogFacilityTypeGetObject(0x15uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Conflicting reporter found for subject: %@", buf, 0xCu);
    }

    id v15 = @"eventType";
    id v16 = @"reporterCollision";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v9 sendEvent:v14];
  }
}

void __44__PKAnalyticsReporter_clientTypeForSubject___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"wallet", @"fieldDetect", @"contactless", @"inApp", @"inAppProvisioning", @"appleCardEngagement", @"secureUIService", @"bridge", @"discoveryCard", @"appleCardOnboarding", @"fhOnboarding", @"appleCashOnboarding", @"shareInitiation", @"shareRedemption", @"passManagement", @"identityInApp", @"walletProvisioning",
         @"orderManagement",
         @"walletGeolocation",
         @"walletSettings",
         @"expressPresentment",
         @"general",
         @"tapToPay",
         @"identity",
         0);
  v1 = (void *)qword_1EB403328;
  qword_1EB403328 = v0;
}

+ (void)sendSingularEvent:(id)a3
{
  v25[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 mainBundle];
  uint64_t v7 = [v6 bundleIdentifier];
  int v8 = (void *)v7;
  id v9 = &stru_1EE0F5368;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  v24[0] = *MEMORY[0x1E4F94658];
  id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "clientTypeForSubject:", @"general"));
  uint64_t v12 = *MEMORY[0x1E4F94660];
  v25[0] = v11;
  v25[1] = &unk_1EE22E5F0;
  uint64_t v13 = *MEMORY[0x1E4F94650];
  v24[1] = v12;
  v24[2] = v13;
  uint64_t v14 = *MEMORY[0x1E4F94680];
  v25[2] = v10;
  v25[3] = &unk_1EE22C308;
  uint64_t v15 = *MEMORY[0x1E4F94648];
  v24[3] = v14;
  v24[4] = v15;
  v25[4] = MEMORY[0x1E4F1CC38];
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];

  uint64_t v17 = *MEMORY[0x1E4F94690];
  v22[0] = *MEMORY[0x1E4F94688];
  v22[1] = v17;
  v23[0] = @"wallet";
  v23[1] = @"general";
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPassKitErrorDomain" code:0 userInfo:0];
  id v21 = v19;
  [MEMORY[0x1E4F94620] sendOneMessageWithSessionInfo:v16 userInfo:v18 category:1 type:100 payload:v5 error:&v21];

  id v20 = v21;
}

+ (id)archivedSessionTokenForAnalyticsSubject:(id)a3
{
  id v3 = +[PKAnalyticsReporter reporterForSubject:a3];
  uint64_t v4 = [v3 archivedSessionToken];

  return v4;
}

+ (id)analyticsErrorTextForError:(int64_t)a3
{
  if (a3 <= 60001)
  {
    if (a3 > 40455)
    {
      if (a3 == 40456) {
        return @"invalidVerificationCode";
      }
      if (a3 == 40457) {
        return @"expiredVerificationCode";
      }
    }
    else
    {
      if (a3 == 40423) {
        return @"verificationRequestLimitReached";
      }
      if (a3 == 40454) {
        return @"verificationAttemptLimitReached";
      }
    }
    return @"invalidUndefinedField";
  }
  else
  {
    id result = @"invalidFirstName";
    switch(a3)
    {
      case 60039:
        return result;
      case 60040:
        return @"invalidLastName";
      case 60041:
        return @"invalidDateOfBirth";
      case 60042:
        return @"POBoxNotAllowed";
      case 60043:
        return @"invalidStreet1";
      case 60044:
        return @"invalidStreet2";
      case 60045:
        return @"invalidPhoneNumber";
      case 60046:
        return @"invalidIncome";
      case 60047:
        return @"invalidCitizenship";
      case 60048:
        return @"invalidSSNSuffix";
      case 60049:
        return @"invalidSSN";
      case 60050:
        return @"invalidPostalCode";
      case 60051:
      case 60054:
      case 60055:
      case 60057:
      case 60058:
      case 60059:
      case 60060:
      case 60061:
      case 60062:
      case 60063:
      case 60064:
      case 60065:
      case 60066:
      case 60067:
      case 60068:
        return @"invalidUndefinedField";
      case 60052:
        return @"invalidCity";
      case 60053:
        return @"invalidState";
      case 60056:
        return @"invalidRegion";
      case 60069:
        return @"invalidTotalIncome";
      case 60070:
        return @"invalidTotalAssets";
      default:
        if (a3 == 60002)
        {
          id result = @"minimumAgeRequirementsNotMet";
        }
        else
        {
          if (a3 != 60092) {
            return @"invalidUndefinedField";
          }
          id result = @"verificationAlreadyCompleted";
        }
        break;
    }
  }
  return result;
}

- (PKAnalyticsReporter)initWithArchivedParent:(id)a3 subject:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  id v19 = 0;
  uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v13 fromData:v8 error:&v19];

  id v15 = v19;
  if (v15)
  {
    id v16 = PKLogFacilityTypeGetObject(0x15uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v15;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Failed to unarchive parent token with error %@", buf, 0xCu);
    }
  }
  uint64_t v17 = [(PKAnalyticsReporter *)self initWithParentToken:v14 subject:v6];

  return v17;
}

- (id)_reportingSessionID
{
  return (id)[(RTCReporting *)self->_session getReportingSessionID];
}

- (id)archivedSessionToken
{
  p_lockArchive = &self->_lockArchive;
  os_unfair_lock_lock(&self->_lockArchive);
  if (!self->_archivedSessionToken)
  {
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_sessionToken requiringSecureCoding:1 error:0];
    archivedSessionToken = self->_archivedSessionToken;
    self->_archivedSessionToken = v4;
  }
  os_unfair_lock_unlock(p_lockArchive);
  id v6 = self->_archivedSessionToken;
  return v6;
}

- (int64_t)bucketedSessionDurationFromDuration:(int64_t)a3
{
  if (a3 <= 119) {
    return 5 * (a3 / 5);
  }
  else {
    return 120;
  }
}

@end