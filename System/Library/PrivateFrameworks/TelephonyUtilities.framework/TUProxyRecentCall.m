@interface TUProxyRecentCall
- (BOOL)mostRecentCallWasMissed;
- (CHRecentCall)recentCall;
- (CNContact)backingContact;
- (NSArray)handles;
- (NSArray)idsCanonicalDestinations;
- (NSString)backingContactId;
- (NSString)backingContactIdentifier;
- (NSString)destinationId;
- (NSString)displayName;
- (NSString)mostRecentCallInfo;
- (TUProxyRecentCall)init;
- (TUProxyRecentCall)initWithRecentCall:(id)a3;
- (TUSearchController)searchController;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)mostRecentCallType;
- (void)backingContact;
- (void)setRecentCall:(id)a3;
- (void)setSearchController:(id)a3;
@end

@implementation TUProxyRecentCall

- (TUProxyRecentCall)initWithRecentCall:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUProxyRecentCall;
  v6 = [(TUProxyRecentCall *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recentCall, a3);
  }

  return v7;
}

- (TUProxyRecentCall)init
{
  v4 = NSString;
  id v5 = [NSString stringWithUTF8String:"-[TUProxyRecentCall init]"];
  v6 = [v4 stringWithFormat:@"Don't call %@, call designated initializer instead.", v5];
  NSLog(&cfstr_TuassertionFai.isa, v6);

  if (_TUAssertShouldCrashApplication())
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"-[TUProxyRecentCall init]"];
    [v7 handleFailureInMethod:a2, self, @"TUProxyRecentCall.m", 52, @"Don't call %@, call designated initializer instead.", v8 object file lineNumber description];
  }
  return 0;
}

- (NSString)mostRecentCallInfo
{
  unint64_t v3 = [(TUProxyRecentCall *)self mostRecentCallType];
  if (v3 - 2 < 2)
  {
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 localizedStringForKey:@"FaceTime" value:&stru_1EECEA668 table:0];
    goto LABEL_5;
  }
  if (v3 <= 1)
  {
    v4 = [(TUProxyRecentCall *)self recentCall];
    uint64_t v5 = [v4 callerIdSubStringForDisplay];
LABEL_5:
    v6 = (void *)v5;

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (sel_callerId == a3 || sel_isoCountryCode == a3)
  {
    v4 = [(TUProxyRecentCall *)self recentCall];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TUProxyRecentCall;
    v4 = -[TUProxyRecentCall forwardingTargetForSelector:](&v6, sel_forwardingTargetForSelector_);
  }

  return v4;
}

- (NSString)displayName
{
  unint64_t v3 = [(TUProxyRecentCall *)self backingContact];
  v4 = [v3 displayName];

  if ([v4 length])
  {
    id v5 = v4;
    goto LABEL_8;
  }
  objc_super v6 = [(TUProxyRecentCall *)self recentCall];
  v7 = [v6 callerIdForDisplay];
  uint64_t v8 = [v7 length];

  objc_super v9 = [(TUProxyRecentCall *)self recentCall];
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 callerIdForDisplay];
LABEL_7:
    id v5 = (id)v11;

    goto LABEL_8;
  }
  v12 = [v9 callerNameForDisplay];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v10 = [(TUProxyRecentCall *)self recentCall];
    uint64_t v11 = [v10 callerNameForDisplay];
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_8:

  return (NSString *)v5;
}

- (CNContact)backingContact
{
  unint64_t v3 = [(TUProxyRecentCall *)self recentCall];
  v4 = [v3 contactIdentifier];

  if (!v4)
  {
    uint64_t v8 = 0;
    id v9 = 0;
    goto LABEL_12;
  }
  id v5 = [(TUProxyRecentCall *)self searchController];
  objc_super v6 = [v5 contactStore];
  v7 = [MEMORY[0x1E4F1B8F8] keysToFetchForFaceTime];
  id v14 = 0;
  uint64_t v8 = [v6 unifiedContactWithIdentifier:v4 keysToFetch:v7 error:&v14];
  id v9 = v14;

  if (v8) {
    goto LABEL_12;
  }
  v10 = [v9 domain];
  if (([v10 isEqualToString:*MEMORY[0x1E4F1AFD8]] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v11 = [v9 code];

  if (v11 != 200)
  {
LABEL_8:
    v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(TUProxyRecentCall *)(uint64_t)self backingContact];
    }
  }
  uint64_t v8 = 0;
LABEL_12:

  return (CNContact *)v8;
}

- (NSString)backingContactId
{
  v2 = [(TUProxyRecentCall *)self recentCall];
  unint64_t v3 = [v2 addressBookRecordId];

  return (NSString *)v3;
}

- (NSString)backingContactIdentifier
{
  v2 = [(TUProxyRecentCall *)self recentCall];
  unint64_t v3 = [v2 contactIdentifier];

  return (NSString *)v3;
}

- (NSString)destinationId
{
  unint64_t v3 = [(TUProxyRecentCall *)self recentCall];
  v4 = [v3 contactIdentifier];

  if (v4)
  {
    id v5 = [(TUProxyRecentCall *)self backingContact];
    [v5 anyDestinationID];
  }
  else
  {
    id v5 = [(TUProxyRecentCall *)self recentCall];
    [v5 callerId];
  objc_super v6 = };

  return (NSString *)v6;
}

- (NSArray)handles
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(TUProxyRecentCall *)self backingContact];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 phoneNumberStrings];
    objc_super v6 = [v4 emailAddressStrings];
    v7 = [v5 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    uint64_t v8 = [(TUProxyRecentCall *)self destinationId];
    id v5 = (void *)v8;
    if (v8)
    {
      v10[0] = v8;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return (NSArray *)v7;
}

- (int64_t)mostRecentCallType
{
  if (!mostRecentCallType__kCHServiceProviderTelephony)
  {
    unint64_t v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      v4 = *v3;
    }
    else {
      v4 = 0;
    }
    objc_storeStrong((id *)&mostRecentCallType__kCHServiceProviderTelephony, v4);
  }
  if (!mostRecentCallType__kCHServiceProviderFaceTime)
  {
    id v5 = (void **)CUTWeakLinkSymbol();
    if (v5) {
      objc_super v6 = *v5;
    }
    else {
      objc_super v6 = 0;
    }
    objc_storeStrong((id *)&mostRecentCallType__kCHServiceProviderFaceTime, v6);
  }
  if (mostRecentCallType__kCHServiceProviderTelephony)
  {
    v7 = [(TUProxyRecentCall *)self recentCall];
    uint64_t v8 = [v7 serviceProvider];
    char v9 = [v8 isEqualToString:mostRecentCallType__kCHServiceProviderTelephony];

    if (v9) {
      return 1;
    }
  }
  if (!mostRecentCallType__kCHServiceProviderFaceTime) {
    return 0;
  }
  uint64_t v11 = [(TUProxyRecentCall *)self recentCall];
  v12 = [v11 serviceProvider];
  int v13 = [v12 isEqualToString:mostRecentCallType__kCHServiceProviderFaceTime];

  if (!v13) {
    return 0;
  }
  id v14 = [(TUProxyRecentCall *)self recentCall];
  uint64_t v15 = [v14 mediaType];

  int64_t v16 = 3;
  if (v15 != 2) {
    int64_t v16 = 0;
  }
  if (v15 == 1) {
    return 2;
  }
  else {
    return v16;
  }
}

- (BOOL)mostRecentCallWasMissed
{
  v2 = [(TUProxyRecentCall *)self recentCall];
  int v3 = [v2 callStatus];
  if (__CUTWeakkCHCallStatusMissed__pred_kCHCallStatusMissedCallHistory != -1) {
    dispatch_once(&__CUTWeakkCHCallStatusMissed__pred_kCHCallStatusMissedCallHistory, &__block_literal_global_15);
  }
  BOOL v4 = v3 == __CUTStaticWeak_kCHCallStatusMissed;

  return v4;
}

- (NSArray)idsCanonicalDestinations
{
  v10[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(TUProxyRecentCall *)self backingContact];
  BOOL v4 = [(TUProxyRecentCall *)self recentCall];
  id v5 = [v4 callerId];

  if (v3)
  {
    objc_super v6 = [v3 allIDSDestinations];
  }
  else if ([v5 length])
  {
    uint64_t v7 = [v5 IDSFormattedDestinationID];
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      v10[0] = v7;
      objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      objc_super v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
}

- (TUSearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (TUSearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchController);

  objc_storeStrong((id *)&self->_recentCall, 0);
}

- (void)backingContact
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "Error fetching backing contact for recent call %@: %@", (uint8_t *)&v3, 0x16u);
}

@end