@interface TUDialRequest
+ (BOOL)dialTypeShouldForceTelephony:(int64_t)a3;
+ (BOOL)isHandleEmergencyNumber:(id)a3 telephonyProvider:(id)a4;
+ (BOOL)originatingUITypeShouldForceTelephony:(int)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)ttyTypeShouldForceTelephony:(int64_t)a3;
+ (BOOL)urlSchemeMatchesDefaultProvider:(id)a3 provider:(id)a4;
+ (id)callProviderManagerGeneratorBlock;
+ (id)contactStore;
+ (id)defaultAppCallProviderForDialType:(int64_t)a3 originatingUIType:(int)a4 isSOS:(BOOL)a5 handles:(id)a6 ttyType:(int64_t)a7;
+ (id)legacyAddressBookIdentifierToContactIdentifierTransformBlock;
+ (id)providerForIntentPreferredCallProvider:(int64_t)a3 recentCallProviderId:(id)a4 callCapability:(int64_t)a5 providerManager:(id)a6;
+ (id)senderIdentityClientGeneratorBlock;
+ (id)stringForDialType:(int64_t)a3;
+ (id)stringForOriginatingUIType:(int)a3;
+ (id)stringForTTYType:(int64_t)a3;
+ (int)originatingUITypeForExecutionContext:(int64_t)a3;
+ (int)originatingUITypeForString:(id)a3;
+ (int64_t)dialRequestTTYTypeForCHRecentCallTTYType:(int64_t)a3;
+ (int64_t)dialRequestTypeForIntentDestinationType:(int64_t)a3;
+ (int64_t)handleTypeForQueryItem:(id)a3;
+ (int64_t)intentTTYTypeForTTYType:(int64_t)a3;
+ (int64_t)ttyTypeForIntentTTYType:(int64_t)a3;
+ (int64_t)ttyTypeForString:(id)a3;
+ (void)setCallProviderManagerGeneratorBlock:(id)a3;
+ (void)setLegacyAddressBookIdentifierToContactIdentifierTransformBlock:(id)a3;
+ (void)setSenderIdentityClientGeneratorBlock:(id)a3;
- (BOOL)BOOLValueForQueryItemWithName:(id)a3 inURLComponents:(id)a4;
- (BOOL)allowProviderFallback;
- (BOOL)endpointOnCurrentDevice;
- (BOOL)hostOnCurrentDevice;
- (BOOL)isDialAssisted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDialRequest:(id)a3;
- (BOOL)isRTTAvailable;
- (BOOL)isRedial;
- (BOOL)isSOS;
- (BOOL)isTTYAvailable;
- (BOOL)isValid;
- (BOOL)isVideo;
- (BOOL)performDialAssist;
- (BOOL)performLocalDialAssist;
- (BOOL)preferDefaultApp;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)showUIPrompt;
- (BOOL)useTTY;
- (BSProcessHandle)processHandle;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (CNGeminiManager)contactGeminiManager;
- (IDSDestination)endpointIDSDestination;
- (NSArray)validityErrors;
- (NSDate)dateDialed;
- (NSSet)handles;
- (NSString)audioSourceIdentifier;
- (NSString)contactIdentifier;
- (NSString)description;
- (NSString)destinationID;
- (NSString)endpointIDSDestinationURI;
- (NSString)endpointRapportEffectiveIdentifier;
- (NSString)endpointRapportMediaSystemIdentifier;
- (NSString)failureNotification;
- (NSString)hostIDSIdentifier;
- (NSString)providerCustomIdentifier;
- (NSString)successNotification;
- (NSString)uniqueProxyIdentifier;
- (NSURL)URL;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (NSUserActivity)userActivity;
- (TUCallProvider)provider;
- (TUCallProviderManager)providerManager;
- (TUDialRequest)dialRequestWithURLStripping;
- (TUDialRequest)init;
- (TUDialRequest)initWithCoder:(id)a3;
- (TUDialRequest)initWithDialIntent:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6;
- (TUDialRequest)initWithDialIntent:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6 isEmergencyServicesOverrideEnabled:(BOOL)a7;
- (TUDialRequest)initWithProvider:(id)a3;
- (TUDialRequest)initWithService:(int)a3;
- (TUDialRequest)initWithURL:(id)a3;
- (TUDialRequest)initWithURL:(id)a3 featureFlags:(id)a4;
- (TUDialRequest)initWithUserActivity:(id)a3;
- (TUDialRequest)initWithUserActivity:(id)a3 providerManager:(id)a4;
- (TUDialRequest)initWithUserActivity:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6;
- (TUFeatureFlags)featureFlags;
- (TUHandle)handle;
- (TUSenderIdentity)localSenderIdentity;
- (TUSenderIdentityClient)senderIdentityClient;
- (id)URLHost;
- (id)URLQueryItems;
- (id)URLScheme;
- (id)_contactFromINPerson:(id)a3 contactsDataSource:(id)a4 bestGuessHandle:(id *)a5;
- (id)_validityErrorsForRelay:(BOOL)a3;
- (id)allowProviderFallbackQueryItem;
- (id)audioSourceIdentifierURLQueryItem;
- (id)bundleIdentifier;
- (id)callProviderFromURLComponents:(id)a3 handles:(id)a4 dialType:(int64_t)a5 originatingUIType:(int)a6 isSOS:(BOOL)a7 ttyType:(int64_t)a8 video:(BOOL *)a9 featureFlags:(id)a10;
- (id)callProviderIdentiferFromURLComponents:(id)a3;
- (id)callProviderIdentifierURLQueryItem;
- (id)contactIdentifierFromURLComponents:(id)a3;
- (id)contactIdentifierURLQueryItem;
- (id)contactNamesByHandleWithContactsDataSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationIDFromURL:(id)a3;
- (id)dialAssistedURLQueryItem;
- (id)dialRequestByReplacingProvider:(id)a3;
- (id)endpointIDSDestinationURIQueryItem;
- (id)endpointRapportEffectiveIdentifierQueryItem;
- (id)endpointRapportMediaSystemIdentifierQueryItem;
- (id)failureNotificationQueryItem;
- (id)forceAssistURLQueryItem;
- (id)handleFromURL:(id)a3;
- (id)handleTypeURLQueryItem;
- (id)isEmergencyNumberBlock;
- (id)isEmergencyNumberOrIsWhitelistedBlock;
- (id)isVoicemailURLQueryItem;
- (id)legacyAddressBookIdentifierQueryItemName;
- (id)localSenderIdentityAccountUUIDURLQueryItem;
- (id)localSenderIdentityUUIDURLQueryItem;
- (id)noPromptURLQueryItem;
- (id)originatingUIURLQueryItem;
- (id)providerCustomIdentifierURLQueryItem;
- (id)redialURLQueryItem;
- (id)sanitizedHandles;
- (id)shouldSuppressInCallUIQueryItem;
- (id)sosURLQueryItem;
- (id)successNotificationQueryItem;
- (id)suppressAssistURLQueryItem;
- (id)ttyTypeURLQueryItem;
- (id)userActivityUsingDeprecatedCallingIntents:(BOOL)a3;
- (id)validityErrorForDestinationIDWithVoicemail;
- (id)validityErrorForEmergencyCall;
- (id)validityErrorForEndpointNotOnCurrentDeviceForNonRelayableService;
- (id)validityErrorForNonNormalDialTypeWithoutTelephony;
- (id)validityErrorForNormalDialTypeWithUnknownDestination;
- (id)validityErrorForSOS;
- (id)validityErrorForUnspecifiedProvider;
- (id)validityErrorForUnsupportedHandleType;
- (id)validityErrorForVideoUnsupported;
- (int)legacyAddressBookIdentifierFromURLComponents:(id)a3;
- (int)originatingUIType;
- (int)service;
- (int64_t)dialType;
- (int64_t)ttyType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowProviderFallback:(BOOL)a3;
- (void)setAudioSourceIdentifier:(id)a3;
- (void)setContactGeminiManager:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDateDialed:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setDialAssisted:(BOOL)a3;
- (void)setDialType:(int64_t)a3;
- (void)setEndpointIDSDestinationURI:(id)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setEndpointRapportEffectiveIdentifier:(id)a3;
- (void)setEndpointRapportMediaSystemIdentifier:(id)a3;
- (void)setFailureNotification:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandles:(id)a3;
- (void)setHostIDSIdentifier:(id)a3;
- (void)setHostOnCurrentDevice:(BOOL)a3;
- (void)setIsEmergencyNumberBlock:(id)a3;
- (void)setIsEmergencyNumberOrIsWhitelistedBlock:(id)a3;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setPerformDialAssist:(BOOL)a3;
- (void)setPerformLocalDialAssist:(BOOL)a3;
- (void)setPreferDefaultApp:(BOOL)a3;
- (void)setProcessHandle:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderCustomIdentifier:(id)a3;
- (void)setRedial:(BOOL)a3;
- (void)setSOS:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setShowUIPrompt:(BOOL)a3;
- (void)setSuccessNotification:(id)a3;
- (void)setTtyType:(int64_t)a3;
- (void)setUniqueProxyIdentifier:(id)a3;
- (void)setVideo:(BOOL)a3;
@end

@implementation TUDialRequest

+ (int64_t)dialRequestTTYTypeForCHRecentCallTTYType:(int64_t)a3
{
  if ((unint64_t)a3 < 3) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isRTTAvailable
{
  v3 = [(TUDialRequest *)self senderIdentityClient];
  v4 = [(TUDialRequest *)self localSenderIdentityUUID];
  char v5 = [v3 isRTTAvailableForSenderIdentityUUID:v4];

  return v5;
}

- (BOOL)isTTYAvailable
{
  v3 = [(TUDialRequest *)self senderIdentityClient];
  v4 = [(TUDialRequest *)self localSenderIdentityUUID];
  char v5 = [v3 isTTYAvailableForSenderIdentityUUID:v4];

  return v5;
}

+ (id)defaultAppCallProviderForDialType:(int64_t)a3 originatingUIType:(int)a4 isSOS:(BOOL)a5 handles:(id)a6 ttyType:(int64_t)a7
{
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  v13 = [a1 callProviderManagerGeneratorBlock];
  v14 = v13[2]();

  if (([a1 dialTypeShouldForceTelephony:a3] & 1) != 0
    || ([a1 originatingUITypeShouldForceTelephony:v9] & 1) != 0
    || ([a1 ttyTypeShouldForceTelephony:a7] & 1) != 0
    || v8)
  {
    v20 = TUDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 134218752;
      int64_t v24 = a3;
      __int16 v25 = 2048;
      uint64_t v26 = (int)v9;
      __int16 v27 = 1024;
      BOOL v28 = v8;
      __int16 v29 = 2048;
      int64_t v30 = a7;
      _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "Using telephonyProvider for TUDialRequest dialType: %ld originatingUIType: %ld isSOS: %d ttyType:%ld", (uint8_t *)&v23, 0x26u);
    }

    v21 = [v14 telephonyProvider];
  }
  else
  {
    v15 = [v12 anyObject];
    if (v15
      && ([v14 telephonyProvider],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [a1 isHandleEmergencyNumber:v15 telephonyProvider:v16],
          v16,
          v17))
    {
      v18 = TUDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        int64_t v24 = (int64_t)v15;
        _os_log_impl(&dword_19C496000, v18, OS_LOG_TYPE_DEFAULT, "Using telephonyProvider due to emergency number TUDialRequest handle %@", (uint8_t *)&v23, 0xCu);
      }

      uint64_t v19 = [v14 telephonyProvider];
    }
    else
    {
      uint64_t v19 = [v14 defaultAppProvider];
    }
    v21 = (void *)v19;
  }

  return v21;
}

+ (BOOL)dialTypeShouldForceTelephony:(int64_t)a3
{
  return a3 != 0;
}

+ (BOOL)originatingUITypeShouldForceTelephony:(int)a3
{
  return (a3 < 0x33) & (0x70648E6400906uLL >> a3);
}

+ (BOOL)ttyTypeShouldForceTelephony:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (BOOL)isHandleEmergencyNumber:(id)a3 telephonyProvider:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  BOOL v8 = [v7 emergencyHandles];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if (([v6 isEquivalentToHandle:v13] & 1) != 0
          || [v6 isEqualToHandle:v13])
        {
          int64_t v24 = TUDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19C496000, v24, OS_LOG_TYPE_DEFAULT, "TUHandle is in TelephonyProvider emergencyHandles", buf, 2u);
          }
          LOBYTE(v25) = 1;
          goto LABEL_39;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  BOOL v8 = [v7 emergencyLabeledHandles];
  uint64_t v14 = [v8 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    while (2)
    {
      id v17 = v7;
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        v20 = [v19 handle];
        if ([v6 isEquivalentToHandle:v20])
        {

LABEL_32:
          int64_t v24 = TUDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19C496000, v24, OS_LOG_TYPE_DEFAULT, "TUHandle is in TelephonyProvider emergencyLabeledHandles", buf, 2u);
          }
          LOBYTE(v25) = 1;
          id v7 = v17;
          goto LABEL_39;
        }
        v21 = [v19 handle];
        int v22 = [v6 isEqualToHandle:v21];

        if (v22) {
          goto LABEL_32;
        }
      }
      uint64_t v15 = [v8 countByEnumeratingWithState:&v38 objects:v51 count:16];
      id v7 = v17;
      if (v15) {
        continue;
      }
      break;
    }
  }

  int v23 = [a1 senderIdentityClientGeneratorBlock];
  BOOL v8 = v23[2]();

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int64_t v24 = [v7 prioritizedSenderIdentities];
  __int16 v25 = [v24 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v25)
  {
    id v33 = v7;
    uint64_t v26 = *(void *)v35;
    while (2)
    {
      for (k = 0; k != v25; k = ((char *)k + 1))
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v24);
        }
        BOOL v28 = *(void **)(*((void *)&v34 + 1) + 8 * (void)k);
        __int16 v29 = [v6 value];
        int64_t v30 = [v28 UUID];
        int v31 = [v8 isEmergencyNumberForDigits:v29 senderIdentityUUID:v30];

        if (v31)
        {
          __int16 v25 = TUDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v47 = v28;
            __int16 v48 = 2112;
            id v49 = v6;
            _os_log_impl(&dword_19C496000, v25, OS_LOG_TYPE_DEFAULT, "TUSenderIdentity %@ recognizing handle %@ as emergency number", buf, 0x16u);
          }

          LOBYTE(v25) = 1;
          goto LABEL_38;
        }
      }
      __int16 v25 = [v24 countByEnumeratingWithState:&v34 objects:v50 count:16];
      if (v25) {
        continue;
      }
      break;
    }
LABEL_38:
    id v7 = v33;
  }
LABEL_39:

  return (char)v25;
}

- (TUDialRequest)initWithProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TUDialRequest.m", 201, @"Invalid parameter not satisfying: %@", @"provider != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)TUDialRequest;
  id v7 = [(TUDialRequest *)&v16 init];
  BOOL v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_provider, a3);
    *(_WORD *)&v8->_performDialAssist = 257;
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    uniqueProxyIdentifier = v8->_uniqueProxyIdentifier;
    v8->_uniqueProxyIdentifier = (NSString *)v10;

    *(_WORD *)&v8->_hostOnCurrentDevice = 257;
    id v12 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v8->_featureFlags;
    v8->_featureFlags = v12;

    v8->_preferDefaultApp = TUDefaultAppsEnabled(v8->_featureFlags);
  }

  return v8;
}

- (TUDialRequest)initWithService:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v10 = 0;
  char v5 = [(id)objc_opt_class() callProviderManagerGeneratorBlock];
  id v6 = v5[2]();

  id v7 = [v6 providerWithService:v3 video:&v10];
  if (v7 && (BOOL v8 = [(TUDialRequest *)self initWithProvider:v7], (self = v8) != 0))
  {
    v8->_video = v10;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (TUDialRequest)initWithURL:(id)a3
{
  id v4 = a3;
  char v5 = objc_alloc_init(TUFeatureFlags);
  id v6 = [(TUDialRequest *)self initWithURL:v4 featureFlags:v5];

  return v6;
}

- (TUDialRequest)initWithURL:(id)a3 featureFlags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v6 resolvingAgainstBaseURL:0];
  BOOL v91 = 0;
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
  BOOL v10 = [v8 scheme];
  uint64_t v11 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeTelephony];
  id v90 = v6;
  if ([v10 isEqualToString:v11])
  {
    char v12 = [v8 containsQueryItemWithName:@"isVoicemail"];

    if (v12)
    {
      int64_t v13 = 2;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v14 = [v8 scheme];
  unsigned int v15 = [v14 isEqualToString:@"telemergencycall"];

  int64_t v13 = v15;
  objc_super v16 = [(TUDialRequest *)self handleFromURL:v6];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];

    uint64_t v9 = (void *)v17;
  }

LABEL_8:
  v18 = [v8 firstQueryItemWithName:@"originatingUI"];
  uint64_t v19 = objc_opt_class();
  v89 = v18;
  v20 = [v18 value];
  uint64_t v21 = [v19 originatingUITypeForString:v20];

  BOOL v22 = [(TUDialRequest *)self BOOLValueForQueryItemWithName:@"sos" inURLComponents:v8];
  int v23 = [v8 firstQueryItemWithName:@"ttyType"];
  int64_t v24 = objc_opt_class();
  v88 = v23;
  __int16 v25 = [v23 value];
  uint64_t v26 = [v24 ttyTypeForString:v25];

  __int16 v27 = v7;
  int64_t v87 = v26;
  BOOL v28 = [(TUDialRequest *)self callProviderFromURLComponents:v8 handles:v9 dialType:v13 originatingUIType:v21 isSOS:v22 ttyType:v26 video:&v91 featureFlags:v7];
  if (v28 && (__int16 v29 = [(TUDialRequest *)self initWithProvider:v28], (self = v29) != 0))
  {
    objc_storeStrong((id *)&v29->_featureFlags, a4);
    self->_dialType = v13;
    objc_storeStrong((id *)&self->_handles, v9);
    self->_originatingUIType = v21;
    self->_sos = v22;
    int64_t v30 = [(TUDialRequest *)self contactIdentifierFromURLComponents:v8];
    contactIdentifier = self->_contactIdentifier;
    self->_contactIdentifier = v30;

    if (TUDefaultAppsEnabled(v7))
    {
      v32 = (void *)MEMORY[0x1E4F1CB10];
      id v33 = [v8 scheme];
      self->_preferDefaultApp = [v32 isDefaultAppScheme:v33];
    }
    else
    {
      self->_preferDefaultApp = 0;
    }
    id v86 = v7;
    if (!self->_contactIdentifier)
    {
      long long v37 = (void (**)(uint64_t, void *, int))legacyAddressBookIdentifierToContactIdentifierTransformBlock;
      long long v38 = [(id)objc_opt_class() contactStore];
      v37[2]((uint64_t)v37, v38, [(TUDialRequest *)self legacyAddressBookIdentifierFromURLComponents:v8]);
      long long v39 = (NSString *)objc_claimAutoreleasedReturnValue();
      long long v40 = self->_contactIdentifier;
      self->_contactIdentifier = v39;
    }
    long long v41 = [v8 firstQueryItemWithName:@"providerCustomIdentifier"];
    long long v42 = [v41 value];
    providerCustomIdentifier = self->_providerCustomIdentifier;
    self->_providerCustomIdentifier = v42;

    id v44 = objc_alloc(MEMORY[0x1E4F29128]);
    long long v45 = [v8 firstQueryItemWithName:@"localSenderIdentityUUID"];
    v46 = [v45 value];
    v47 = (NSUUID *)[v44 initWithUUIDString:v46];
    localSenderIdentityUUID = self->_localSenderIdentityUUID;
    self->_localSenderIdentityUUID = v47;

    id v49 = objc_alloc(MEMORY[0x1E4F29128]);
    v50 = [v8 firstQueryItemWithName:@"localSenderIdentityAccountUUID"];
    v51 = [v50 value];
    v52 = (NSUUID *)[v49 initWithUUIDString:v51];
    localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
    self->_localSenderIdentityAccountUUID = v52;

    v54 = [v8 firstQueryItemWithName:@"TUCallSourceIdentifierKey"];
    v55 = [v54 value];
    audioSourceIdentifier = self->_audioSourceIdentifier;
    self->_audioSourceIdentifier = v55;

    self->_redial = [(TUDialRequest *)self BOOLValueForQueryItemWithName:@"redial" inURLComponents:v8];
    v57 = [v8 firstQueryItemWithName:@"endpointIDSDestinationURI"];
    v58 = [v57 value];
    endpointIDSDestinationURI = self->_endpointIDSDestinationURI;
    self->_endpointIDSDestinationURI = v58;

    v60 = [v8 firstQueryItemWithName:@"endpointRapportMediaSystemIdentifier"];
    v61 = [v60 value];
    endpointRapportMediaSystemIdentifier = self->_endpointRapportMediaSystemIdentifier;
    self->_endpointRapportMediaSystemIdentifier = v61;

    v63 = [v8 firstQueryItemWithName:@"endpointRapportEffectiveIdentifier"];
    v64 = [v63 value];
    endpointRapportEffectiveIdentifier = self->_endpointRapportEffectiveIdentifier;
    self->_endpointRapportEffectiveIdentifier = v64;

    v66 = [v8 firstQueryItemWithName:@"relayHostIdentifier"];
    v67 = [v66 value];
    hostIDSIdentifier = self->_hostIDSIdentifier;
    self->_hostIDSIdentifier = v67;

    self->_performDialAssist = ![(TUDialRequest *)self BOOLValueForQueryItemWithName:@"suppressAssist" inURLComponents:v8];
    if ([(TUDialRequest *)self BOOLValueForQueryItemWithName:@"suppressAssist" inURLComponents:v8])
    {
      LOBYTE(v69) = 0;
    }
    else
    {
      BOOL v69 = ![(TUDialRequest *)self BOOLValueForQueryItemWithName:@"forceAssist" inURLComponents:v8];
    }
    long long v34 = v90;
    self->_performLocalDialAssist = v69;
    self->_dialAssisted = [(TUDialRequest *)self BOOLValueForQueryItemWithName:@"wasAssisted" inURLComponents:v8];
    self->_video = v91;
    v70 = [v8 firstQueryItemWithName:@"successNotification"];
    v71 = [v70 value];
    successNotification = self->_successNotification;
    self->_successNotification = v71;

    v73 = [v8 firstQueryItemWithName:@"failureNotification"];
    v74 = [v73 value];
    failureNotification = self->_failureNotification;
    self->_failureNotification = v74;

    v76 = [v8 scheme];
    __int16 v27 = v86;
    if ([v76 isEqualToIgnoringCase:@"facetime-prompt"])
    {
      self->_showUIPrompt = 1;
    }
    else
    {
      v77 = [v8 scheme];
      if ([v77 isEqualToIgnoringCase:@"facetime-audio-prompt"])
      {
        self->_showUIPrompt = 1;
      }
      else
      {
        v78 = [v8 scheme];
        if ([v78 isEqualToIgnoringCase:@"telprompt"])
        {
          self->_showUIPrompt = 1;
        }
        else
        {
          v79 = [v8 scheme];
          v80 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeForceTelephonyPrompt];
          if ([v79 isEqualToIgnoringCase:v80])
          {
            self->_showUIPrompt = 1;
          }
          else
          {
            v81 = [v8 scheme];
            self->_showUIPrompt = [v81 isEqualToIgnoringCase:@"callkit-audio-prompt"];

            __int16 v27 = v86;
          }

          long long v34 = v90;
        }
      }
    }

    self->_ttyType = v87;
    self->_shouldSuppressInCallUI = [(TUDialRequest *)self BOOLValueForQueryItemWithName:@"shouldSuppressInCallUI" inURLComponents:v8];
    v82 = (void *)MEMORY[0x1E4F1CB10];
    v83 = [v34 scheme];
    if ([v82 isDefaultAppScheme:v83]) {
      int v84 = [v28 isTelephonyProvider] ^ 1;
    }
    else {
      LOBYTE(v84) = 0;
    }

    self->_allowProviderFallback = [(TUDialRequest *)self BOOLValueForQueryItemWithName:@"allowProviderFallback" inURLComponents:v8] | v84;
    long long v36 = v88;
    long long v35 = v89;
  }
  else
  {
    long long v35 = v89;
    long long v34 = v90;
    long long v36 = v88;

    self = 0;
  }

  return self;
}

- (TUDialRequest)initWithUserActivity:(id)a3
{
  id v4 = a3;
  char v5 = [(id)objc_opt_class() callProviderManagerGeneratorBlock];
  id v6 = v5[2]();
  id v7 = [(TUDialRequest *)self initWithUserActivity:v4 providerManager:v6];

  return v7;
}

- (TUDialRequest)initWithUserActivity:(id)a3 providerManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(id)objc_opt_class() contactStore];
  uint64_t v9 = [(TUDialRequest *)self initWithUserActivity:v7 providerManager:v6 contactsDataSource:v8 senderIdentityClient:0];

  return v9;
}

- (TUDialRequest)initWithUserActivity:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = [v10 interaction];
  unsigned int v15 = [v14 intent];
  objc_super v16 = [(TUDialRequest *)self initWithDialIntent:v15 providerManager:v11 contactsDataSource:v13 senderIdentityClient:v12];

  if (v16)
  {
    uint64_t v17 = [v10 userInfo];
    v18 = [v17 objectForKeyedSubscript:@"providerIdentifier"];
    if (v18)
    {
      uint64_t v19 = [v11 providerWithIdentifier:v18];
      if (v19) {
        objc_storeStrong((id *)&v16->_provider, v19);
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    v20 = [v17 objectForKeyedSubscript:@"sos"];

    if (v20)
    {
      uint64_t v21 = [v17 objectForKeyedSubscript:@"sos"];
      v16->_sos = [v21 BOOLValue];
    }
    BOOL v22 = [v17 objectForKeyedSubscript:@"redial"];

    if (v22)
    {
      int v23 = [v17 objectForKeyedSubscript:@"redial"];
      v16->_redial = [v23 BOOLValue];
    }
    int64_t v24 = [v17 objectForKeyedSubscript:@"localSenderIdentityUUID"];

    if (v24)
    {
      uint64_t v25 = [v17 objectForKeyedSubscript:@"localSenderIdentityUUID"];
      localSenderIdentityUUID = v16->_localSenderIdentityUUID;
      v16->_localSenderIdentityUUID = (NSUUID *)v25;
    }
    __int16 v27 = [v17 objectForKeyedSubscript:@"localSenderIdentityAccountUUID"];

    if (v27)
    {
      uint64_t v28 = [v17 objectForKeyedSubscript:@"localSenderIdentityAccountUUID"];
      localSenderIdentityAccountUUID = v16->_localSenderIdentityAccountUUID;
      v16->_localSenderIdentityAccountUUID = (NSUUID *)v28;
    }
    int64_t v30 = [v17 objectForKeyedSubscript:@"TUCallSourceIdentifierKey"];

    if (v30)
    {
      uint64_t v31 = [v17 objectForKeyedSubscript:@"TUCallSourceIdentifierKey"];
      audioSourceIdentifier = v16->_audioSourceIdentifier;
      v16->_audioSourceIdentifier = (NSString *)v31;
    }
    id v33 = [v17 objectForKeyedSubscript:@"performDialAssist"];

    if (v33)
    {
      long long v34 = [v17 objectForKeyedSubscript:@"performDialAssist"];
      v16->_performDialAssist = [v34 BOOLValue];
    }
    long long v35 = [v17 objectForKeyedSubscript:@"performLocalDialAssist"];

    if (v35)
    {
      long long v36 = [v17 objectForKeyedSubscript:@"performLocalDialAssist"];
      v16->_performLocalDialAssist = [v36 BOOLValue];
    }
    long long v37 = [v17 objectForKeyedSubscript:@"dialAssisted"];

    if (v37)
    {
      long long v38 = [v17 objectForKeyedSubscript:@"dialAssisted"];
      v16->_dialAssisted = [v38 BOOLValue];
    }
    long long v39 = [v17 objectForKeyedSubscript:@"originatingUI"];

    if (v39)
    {
      long long v40 = objc_opt_class();
      long long v41 = [v17 objectForKeyedSubscript:@"originatingUI"];
      v16->_originatingUIType = [v40 originatingUITypeForString:v41];
    }
    long long v42 = [v17 objectForKeyedSubscript:@"preferDefaultApp"];

    if (v42)
    {
      long long v43 = [v17 objectForKeyedSubscript:@"preferDefaultApp"];
      v16->_preferDefaultApp = [v43 BOOLValue];
    }
  }

  return v16;
}

- (TUDialRequest)initWithDialIntent:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6
{
  return [(TUDialRequest *)self initWithDialIntent:a3 providerManager:a4 contactsDataSource:a5 senderIdentityClient:a6 isEmergencyServicesOverrideEnabled:0];
}

- (TUDialRequest)initWithDialIntent:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6 isEmergencyServicesOverrideEnabled:(BOOL)a7
{
  BOOL v145 = a7;
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v11 = (TUDialRequest *)a3;
  id v12 = a4;
  id v153 = a5;
  obuint64_t j = a6;
  id v148 = a6;
  id v13 = TUDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v160 = v11;
    __int16 v161 = 2048;
    uint64_t v162 = [(TUDialRequest *)v11 triggerMethod];
    _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "intent: %@ intent.triggerMethod: %ld", buf, 0x16u);
  }

  int v143 = objc_msgSend((id)objc_opt_class(), "originatingUITypeForExecutionContext:", -[TUDialRequest _executionContext](v11, "_executionContext"));
  CUTWeakLinkClass();
  CUTWeakLinkClass();
  CUTWeakLinkClass();
  uint64_t v14 = (void *)CUTWeakLinkSymbol();
  if ([(TUDialRequest *)v11 _idiom] != 4)
  {
    uint64_t v23 = 0;
    v152 = 0;
    id v150 = 0;
    char v142 = 1;
    goto LABEL_23;
  }
  id v15 = v12;
  objc_super v16 = self;
  uint64_t v17 = [(TUDialRequest *)v11 _originatingDeviceIDSIdentifier];
  if ([v17 length])
  {
    [(TUDialRequest *)v11 _isOwnedByCurrentUser];
    uint64_t v19 = v18 = v14;
    int v20 = [v19 BOOLValue];

    uint64_t v14 = v18;
    if (v20)
    {
      uint64_t v21 = [(TUDialRequest *)v11 _originatingDeviceIDSIdentifier];
      BOOL v22 = TUDefaultLog();
      id v150 = (id)v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v160 = (TUDialRequest *)v21;
        _os_log_impl(&dword_19C496000, v22, OS_LOG_TYPE_DEFAULT, "Intent contains an originatingDeviceIDSIdentifier: %@", buf, 0xCu);
      }
      uint64_t v23 = 0;
      v152 = 0;
      id v12 = v15;
      goto LABEL_20;
    }
  }
  else
  {
  }
  int64_t v24 = [(TUDialRequest *)v11 _originatingDeviceRapportMediaSystemIdentifier];

  BOOL v25 = v24 == 0;
  if (v24)
  {
    v152 = [(TUDialRequest *)v11 _originatingDeviceRapportMediaSystemIdentifier];
    uint64_t v26 = TUDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v160 = v152;
      _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "Intent contains an _originatingDeviceRapportMediaSystemIdentifier: %@", buf, 0xCu);
    }
  }
  else
  {
    v152 = 0;
  }
  id v12 = v15;
  __int16 v27 = [(TUDialRequest *)v11 _originatingDeviceRapportEffectiveIdentifier];

  if (!v27)
  {
    char v142 = v25;
    uint64_t v23 = 0;
    id v150 = 0;
    goto LABEL_22;
  }
  uint64_t v23 = [(TUDialRequest *)v11 _originatingDeviceRapportEffectiveIdentifier];
  BOOL v22 = TUDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v160 = (TUDialRequest *)v23;
    _os_log_impl(&dword_19C496000, v22, OS_LOG_TYPE_DEFAULT, "Intent contains an originatingDeviceRapportEffectiveIdentifier: %@", buf, 0xCu);
  }
  id v150 = 0;
LABEL_20:

  char v142 = 0;
LABEL_22:
  self = v16;
LABEL_23:
  v151 = self;
  id v149 = (id)v23;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = v11;
    __int16 v29 = TUDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v28 audioRoute];
      uint64_t v31 = [v28 ttyType];
      uint64_t v32 = [v28 preferredCallProvider];
      *(_DWORD *)buf = 134218496;
      v160 = (TUDialRequest *)v30;
      self = v151;
      __int16 v161 = 2048;
      uint64_t v162 = v31;
      __int16 v163 = 2048;
      uint64_t v164 = v32;
      _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, "Start call intent has audioRoute: %ld ttyType: %ld preferredCallProvider: %ld", buf, 0x20u);
    }

    id v33 = [v28 contacts];
    long long v34 = [v33 firstObject];

    BOOL v141 = [v28 callCapability] == 2;
    if ([v28 audioRoute] == 1)
    {
      long long v35 = TUDefaultLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v35, OS_LOG_TYPE_DEFAULT, "Intent contains a speakerphone audio route, setting audioSourceIdentifier to TUCallSourceIdentifierSpeakerRoute", buf, 2u);
      }

      long long v36 = (id *)&TUCallSourceIdentifierSpeakerRoute;
    }
    else
    {
      if (!v14 || [v28 audioRoute] != *v14)
      {
        id v49 = [v28 recordDeviceUID];
        v50 = [v49 UUIDString];
        uint64_t v51 = [v50 length];

        if (v51)
        {
          v52 = [v28 recordDeviceUID];
          long long v45 = [v52 UUIDString];

          uint64_t v53 = TUDefaultLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v160 = v45;
            _os_log_impl(&dword_19C496000, v53, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceUID, setting audioSourceIdentifier to \"%@\"", buf, 0xCu);
          }
        }
        else
        {
          v63 = [v28 recordDeviceIdentifier];
          uint64_t v64 = [v63 length];

          if (v64)
          {
            long long v45 = [v28 recordDeviceIdentifier];
            v65 = TUDefaultLog();
            self = v151;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v160 = v45;
              _os_log_impl(&dword_19C496000, v65, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceIdentifier, setting audioSourceIdentifier to \"%@\"", buf, 0xCu);
            }

LABEL_68:
            uint64_t v48 = objc_msgSend((id)objc_opt_class(), "dialRequestTypeForIntentDestinationType:", -[NSObject destinationType](v28, "destinationType"));
            if (_TUIsInternalInstall()
              && v145
              && [v28 destinationType] == 2)
            {
              v66 = TUDefaultLog();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19C496000, v66, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
              }

              uint64_t v48 = 0;
            }
            uint64_t v67 = objc_msgSend((id)objc_opt_class(), "ttyTypeForIntentTTYType:", -[NSObject ttyType](v28, "ttyType"));
            if (!v67)
            {
              if ([v28 _idiom] == 4)
              {
                v68 = TUDefaultLog();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19C496000, v68, OS_LOG_TYPE_DEFAULT, "Request is from a homepod, setting ttyType to none", buf, 2u);
                }

                uint64_t v67 = 1;
              }
              else
              {
                uint64_t v67 = 0;
              }
            }
            uint64_t v140 = v67;
            BOOL v69 = [(TUDialRequest *)v34 personHandle];
            uint64_t v70 = [v69 emergencyType];

            if (v70 == 1)
            {
              uint64_t v47 = [v12 emergencyProvider];
              if (_TUIsInternalInstall()
                && v145
                && [v28 destinationType] == 2)
              {
                v71 = TUDefaultLog();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19C496000, v71, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
                }

LABEL_91:
                uint64_t v48 = 0;
LABEL_101:
                v78 = TUDefaultLog();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v160 = (TUDialRequest *)v47;
                  _os_log_impl(&dword_19C496000, v78, OS_LOG_TYPE_DEFAULT, "Determined call intent provider: %@", buf, 0xCu);
                }

                goto LABEL_139;
              }
            }
            else
            {
              if (v48 == 2)
              {
                uint64_t v47 = [v12 voicemailProvider];
                goto LABEL_101;
              }
              if (v48 != 1)
              {
                if (v48)
                {
                  uint64_t v47 = 0;
                  goto LABEL_101;
                }
                v146 = objc_opt_class();
                uint64_t v72 = [v28 preferredCallProvider];
                v73 = [v28 callRecordToCallBack];
                v74 = [v73 providerId];
                uint64_t v75 = objc_msgSend(v146, "providerForIntentPreferredCallProvider:recentCallProviderId:callCapability:providerManager:", v72, v74, -[NSObject callCapability](v28, "callCapability"), v12);

                self = v151;
                uint64_t v47 = v75;
                goto LABEL_91;
              }
              uint64_t v47 = [v12 emergencyProvider];
            }
            if ([v28 triggerMethod] == 4 && ![(TUDialRequest *)v45 length])
            {
              v76 = TUDefaultLog();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19C496000, v76, OS_LOG_TYPE_DEFAULT, "It's an emergency call. Siri was triggered by HeySiri, and audioSourceIdentifier isn't set already. setting audioSourceIdentifier to speaker phone.", buf, 2u);
              }

              v77 = @"TUCallSourceIdentifierSpeakerRoute";
              uint64_t v48 = 1;
              long long v45 = (TUDialRequest *)v77;
            }
            else
            {
              uint64_t v48 = 1;
            }
            goto LABEL_101;
          }
          long long v45 = 0;
        }
        self = v151;
        goto LABEL_68;
      }
      id v44 = TUDefaultLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v44, OS_LOG_TYPE_DEFAULT, "Intent contains a Hey Siri audio route, setting audioSourceIdentifier to TUCallSourceIdentifierHeySiri", buf, 2u);
      }

      long long v36 = (id *)&TUCallSourceIdentifierHeySiri;
    }
    long long v45 = (TUDialRequest *)*v36;
    goto LABEL_68;
  }
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = v11;
    long long v37 = TUDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = [v28 audioRoute];
      uint64_t v39 = [v28 ttyType];
      uint64_t v40 = [v28 preferredCallProvider];
      *(_DWORD *)buf = 134218496;
      v160 = (TUDialRequest *)v38;
      self = v151;
      __int16 v161 = 2048;
      uint64_t v162 = v39;
      __int16 v163 = 2048;
      uint64_t v164 = v40;
      _os_log_impl(&dword_19C496000, v37, OS_LOG_TYPE_DEFAULT, "Start call audio intent has audioRoute: %ld ttyType: %ld preferredCallProvider: %ld", buf, 0x20u);
    }

    long long v41 = [v28 contacts];
    long long v34 = [v41 firstObject];

    if ([v28 audioRoute] == 1)
    {
      long long v42 = TUDefaultLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v42, OS_LOG_TYPE_DEFAULT, "Intent contains a speakerphone audio route, setting audioSourceIdentifier to TUCallSourceIdentifierSpeakerRoute", buf, 2u);
      }

      long long v43 = (id *)&TUCallSourceIdentifierSpeakerRoute;
    }
    else
    {
      if (!v14 || [v28 audioRoute] != *v14)
      {
        v58 = [v28 recordDeviceUID];
        v59 = [v58 UUIDString];
        uint64_t v60 = [v59 length];

        if (v60)
        {
          v61 = [v28 recordDeviceUID];
          long long v45 = [v61 UUIDString];

          v62 = TUDefaultLog();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v160 = v45;
            _os_log_impl(&dword_19C496000, v62, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceUID, setting audioSourceIdentifier to \"%@\"", buf, 0xCu);
          }
        }
        else
        {
          v79 = [v28 recordDeviceIdentifier];
          uint64_t v80 = [v79 length];

          if (v80)
          {
            long long v45 = [v28 recordDeviceIdentifier];
            v81 = TUDefaultLog();
            self = v151;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v160 = v45;
              _os_log_impl(&dword_19C496000, v81, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceIdentifier, setting audioSourceIdentifier to \"%@\"", buf, 0xCu);
            }

LABEL_108:
            uint64_t v48 = objc_msgSend((id)objc_opt_class(), "dialRequestTypeForIntentDestinationType:", -[NSObject destinationType](v28, "destinationType"));
            if (_TUIsInternalInstall()
              && v145
              && [v28 destinationType] == 2)
            {
              v82 = TUDefaultLog();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19C496000, v82, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
              }

              uint64_t v48 = 0;
            }
            uint64_t v83 = objc_msgSend((id)objc_opt_class(), "ttyTypeForIntentTTYType:", -[NSObject ttyType](v28, "ttyType"));
            if (!v83)
            {
              if ([v28 _idiom] == 4)
              {
                int v84 = TUDefaultLog();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19C496000, v84, OS_LOG_TYPE_DEFAULT, "Request is from a homepod, setting ttyType to none", buf, 2u);
                }

                uint64_t v83 = 1;
              }
              else
              {
                uint64_t v83 = 0;
              }
            }
            uint64_t v140 = v83;
            v85 = [(TUDialRequest *)v34 personHandle];
            uint64_t v86 = [v85 emergencyType];

            if (v86 == 1)
            {
              uint64_t v47 = [v12 emergencyProvider];
              uint64_t v48 = 1;
              if (_TUIsInternalInstall() && v145)
              {
                if ([v28 destinationType] == 2)
                {
                  int64_t v87 = TUDefaultLog();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19C496000, v87, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
                  }

                  uint64_t v48 = 0;
                }
                else
                {
                  uint64_t v48 = 1;
                }
              }
              goto LABEL_136;
            }
            if (v48 == 2)
            {
              uint64_t v88 = [v12 voicemailProvider];
            }
            else if (v48 == 1)
            {
              uint64_t v88 = [v12 emergencyProvider];
            }
            else
            {
              if (v48)
              {
                uint64_t v47 = 0;
                goto LABEL_136;
              }
              uint64_t v88 = objc_msgSend((id)objc_opt_class(), "providerForIntentPreferredCallProvider:recentCallProviderId:callCapability:providerManager:", -[NSObject preferredCallProvider](v28, "preferredCallProvider"), 0, 1, v12);
            }
            uint64_t v47 = v88;
LABEL_136:
            v89 = TUDefaultLog();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v160 = (TUDialRequest *)v47;
              _os_log_impl(&dword_19C496000, v89, OS_LOG_TYPE_DEFAULT, "Determined audio call intent provider: %@", buf, 0xCu);
            }

            BOOL v141 = 0;
            goto LABEL_139;
          }
          long long v45 = 0;
        }
        self = v151;
        goto LABEL_108;
      }
      v54 = TUDefaultLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v54, OS_LOG_TYPE_DEFAULT, "Intent contains a Hey Siri audio route, setting audioSourceIdentifier to TUCallSourceIdentifierHeySiri", buf, 2u);
      }

      long long v43 = (id *)&TUCallSourceIdentifierHeySiri;
    }
    long long v45 = (TUDialRequest *)*v43;
    goto LABEL_108;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v34 = 0;
    v55 = 0;
    long long v45 = 0;
    v56 = 0;
    v57 = 0;
    uint64_t v47 = 0;
    goto LABEL_183;
  }
  v46 = [(TUDialRequest *)v11 contacts];
  long long v34 = [v46 firstObject];

  uint64_t v47 = [v12 faceTimeProvider];
  uint64_t v28 = TUDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v160 = (TUDialRequest *)v47;
    _os_log_impl(&dword_19C496000, v28, OS_LOG_TYPE_DEFAULT, "Determined video call intent provider: %@", buf, 0xCu);
  }
  long long v45 = 0;
  uint64_t v48 = 0;
  uint64_t v140 = 0;
  BOOL v141 = 1;
LABEL_139:

  if (!v47)
  {
    v55 = 0;
    v56 = 0;
    v57 = 0;
    goto LABEL_183;
  }
  v147 = (void *)v47;
  id v90 = TUDefaultLog();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v91 = [(TUDialRequest *)v34 personHandle];
    v92 = [(TUDialRequest *)v34 personHandle];
    v93 = [v92 value];
    v94 = [(TUDialRequest *)v34 contactIdentifier];
    *(_DWORD *)buf = 138413058;
    v160 = v34;
    __int16 v161 = 2112;
    uint64_t v162 = (uint64_t)v91;
    __int16 v163 = 2112;
    uint64_t v164 = (uint64_t)v93;
    __int16 v165 = 2112;
    v166 = v94;
    _os_log_impl(&dword_19C496000, v90, OS_LOG_TYPE_DEFAULT, "Determining destinationID and contactIdentifier for INPerson: %@ (personHandle=%@, personHandle.value=%@, contactIdentifier=%@)", buf, 0x2Au);

    self = v151;
  }

  v95 = [(TUDialRequest *)v34 personHandle];
  v96 = [v95 value];
  if ([v96 length])
  {
    v97 = [(TUDialRequest *)v34 contactIdentifier];
    uint64_t v98 = [v97 length];

    if (v98)
    {
      v57 = +[TUHandle handleWithPerson:v34];
      v56 = [(TUDialRequest *)v34 contactIdentifier];
      goto LABEL_155;
    }
  }
  else
  {
  }
  if (v34)
  {
    if (v153)
    {
      id v99 = v153;
    }
    else
    {
      id v99 = [(id)objc_opt_class() contactStore];
    }
    v100 = v99;
    id v156 = 0;
    v101 = [(TUDialRequest *)self _contactFromINPerson:v34 contactsDataSource:v99 bestGuessHandle:&v156];
    id v102 = v156;
    v103 = TUDefaultLog();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v160 = v101;
      _os_log_impl(&dword_19C496000, v103, OS_LOG_TYPE_DEFAULT, "Obtained CNContact from INPerson: %@", buf, 0xCu);
    }

    v57 = (TUDialRequest *)v102;
    v56 = [(TUDialRequest *)v101 identifier];
  }
  else
  {
    v56 = 0;
    v57 = 0;
  }
LABEL_155:
  v104 = TUDefaultLog();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v160 = v57;
    __int16 v161 = 2112;
    uint64_t v162 = (uint64_t)v56;
    _os_log_impl(&dword_19C496000, v104, OS_LOG_TYPE_DEFAULT, "Using the following handle and contactIdentifier: %@, %@", buf, 0x16u);
  }
  v139 = v34;

  v105 = [v12 telephonyProvider];
  v106 = TUDefaultLog();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    v107 = [v105 prioritizedSenderIdentities];
    *(_DWORD *)buf = 138412290;
    v160 = v107;
    _os_log_impl(&dword_19C496000, v106, OS_LOG_TYPE_DEFAULT, "Sender identities the device holds %@", buf, 0xCu);

    self = v151;
  }

  v108 = [v105 prioritizedSenderIdentities];
  v137 = v105;
  v138 = v11;
  uint64_t v135 = v48;
  if ((unint64_t)[v108 count] < 2)
  {
    v122 = v45;
    id v123 = v12;
    v117 = self;
    self = 0;
    v124 = 0;
    v136 = 0;
    id v120 = 0;
LABEL_176:

    goto LABEL_177;
  }
  uint64_t v109 = [v56 length];

  if (v109)
  {
    id v134 = v12;
    v110 = (void *)MEMORY[0x1E4F1B8F8];
    v158 = v56;
    v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v158 count:1];
    uint64_t v112 = [v110 predicateForContactsWithIdentifiers:v111];

    v113 = [MEMORY[0x1E4F1B9F8] descriptorForRequiredKeys];
    v157 = v113;
    v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v157 count:1];

    id v155 = 0;
    v133 = (void *)v112;
    v114 = [v153 unifiedContactsMatchingPredicate:v112 keysToFetch:v108 error:&v155];
    id v115 = v155;
    v132 = v114;
    if (!v114)
    {
      v117 = v151;
      v119 = TUDefaultLog();
      v122 = v45;
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v160 = v139;
        __int16 v161 = 2112;
        uint64_t v162 = (uint64_t)v115;
        _os_log_impl(&dword_19C496000, v119, OS_LOG_TYPE_DEFAULT, "[WARN] Error obtaining contact from INPerson %@: %@", buf, 0x16u);
      }
      self = 0;
      v136 = 0;
      id v120 = v115;
      goto LABEL_175;
    }
    uint64_t v116 = objc_msgSend(v114, "firstObject", v114);
    v117 = v151;
    v118 = [(TUDialRequest *)v151 contactGeminiManager];
    id v154 = v115;
    v136 = (void *)v116;
    v119 = [v118 bestSenderIdentityForContact:v116 error:&v154];
    id v120 = v154;

    if (v119)
    {
      self = [v119 accountUUID];
      v121 = TUDefaultLog();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v160 = self;
        _os_log_impl(&dword_19C496000, v121, OS_LOG_TYPE_DEFAULT, "Contact preferred accountUUIDData %@", buf, 0xCu);
      }
    }
    else
    {
      if (!v120)
      {
        v122 = v45;
        self = 0;
        goto LABEL_175;
      }
      v121 = TUDefaultLog();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
        -[TUDialRequest initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:]((uint64_t)v120, v121);
      }
      self = 0;
    }
    v122 = v45;

LABEL_175:
    v124 = v133;
    id v123 = v134;
    goto LABEL_176;
  }
  v122 = v45;
  id v123 = v12;
  v117 = self;
  self = 0;
  v124 = 0;
  v136 = 0;
  id v120 = 0;
LABEL_177:
  long long v34 = v139;
  v125 = [(TUDialRequest *)v139 displayName];
  [(TUDialRequest *)v57 setSiriDisplayName:v125];

  uint64_t v47 = [(TUDialRequest *)v117 initWithProvider:v147];
  id v11 = v138;
  if (v47)
  {
    if (v57) {
      [MEMORY[0x1E4F1CAD0] setWithObject:v57];
    }
    else {
    uint64_t v126 = [MEMORY[0x1E4F1CAD0] set];
    }
    v127 = *(void **)(v47 + 64);
    *(void *)(v47 + 64) = v126;

    objc_storeStrong((id *)(v47 + 72), v56);
    uint64_t v128 = [(TUDialRequest *)v139 customIdentifier];
    v129 = *(void **)(v47 + 80);
    *(void *)(v47 + 80) = v128;

    *(unsigned char *)(v47 + 8) = v141;
    *(void *)(v47 + 56) = v135;
    *(void *)(v47 + 96) = v140;
    *(_DWORD *)(v47 + 20) = v143;
    objc_storeStrong((id *)(v47 + 88), v122);
    objc_storeStrong((id *)(v47 + 32), obj);
    objc_storeStrong((id *)(v47 + 144), v150);
    objc_storeStrong((id *)(v47 + 152), v152);
    objc_storeStrong((id *)(v47 + 160), v149);
    *(unsigned char *)(v47 + 14) = v142;
    objc_storeStrong((id *)(v47 + 184), self);
    *(unsigned char *)(v47 + 15) = 0;
  }

  id v12 = v123;
  long long v45 = v122;
  v55 = v147;
LABEL_183:

  v130 = (TUDialRequest *)(id)v47;
  return v130;
}

- (TUDialRequest)init
{
  id v4 = NSString;
  char v5 = [NSString stringWithUTF8String:"-[TUDialRequest init]"];
  id v6 = [v4 stringWithFormat:@"Don't call %@, call designated initializer instead.", v5];
  NSLog(&cfstr_TuassertionFai.isa, v6);

  if (_TUAssertShouldCrashApplication())
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v8 = [NSString stringWithUTF8String:"-[TUDialRequest init]"];
    [v7 handleFailureInMethod:a2, self, @"TUDialRequest.m", 647, @"Don't call %@, call designated initializer instead.", v8 object file lineNumber description];
  }
  return 0;
}

- (TUHandle)handle
{
  v2 = [(TUDialRequest *)self handles];
  uint64_t v3 = [v2 anyObject];

  return (TUHandle *)v3;
}

- (void)setHandle:(id)a3
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
  }
  else {
  id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  [(TUDialRequest *)self setHandles:v4];
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = objc_msgSend((id)objc_opt_class(), "stringForDialType:", -[TUDialRequest dialType](self, "dialType"));
  [v3 appendFormat:@" dialType=%@", v4];

  char v5 = [(TUDialRequest *)self handles];
  [v3 appendFormat:@" handles=%@", v5];

  id v6 = [(TUDialRequest *)self contactIdentifier];
  [v3 appendFormat:@" contactIdentifier=%@", v6];

  id v7 = [(TUDialRequest *)self providerCustomIdentifier];
  [v3 appendFormat:@" providerCustomIdentifier=%@", v7];

  BOOL v8 = [(TUDialRequest *)self localSenderIdentityUUID];
  [v3 appendFormat:@" localSenderIdentityUUID=%@", v8];

  uint64_t v9 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
  [v3 appendFormat:@" localSenderIdentityAccountUUID=%@", v9];

  id v10 = [(TUDialRequest *)self audioSourceIdentifier];
  [v3 appendFormat:@" audioSourceIdentifier=%@", v10];

  objc_msgSend(v3, "appendFormat:", @" video=%d", -[TUDialRequest isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", @" performDialAssist=%d", -[TUDialRequest performDialAssist](self, "performDialAssist"));
  objc_msgSend(v3, "appendFormat:", @" performLocalDialAssist=%d", -[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"));
  objc_msgSend(v3, "appendFormat:", @" dialAssisted=%d", -[TUDialRequest isDialAssisted](self, "isDialAssisted"));
  id v11 = objc_msgSend((id)objc_opt_class(), "stringForTTYType:", -[TUDialRequest ttyType](self, "ttyType"));
  [v3 appendFormat:@" ttyType=%@", v11];

  objc_msgSend(v3, "appendFormat:", @" showUIPrompt=%d", -[TUDialRequest showUIPrompt](self, "showUIPrompt"));
  id v12 = [(TUDialRequest *)self uniqueProxyIdentifier];
  [v3 appendFormat:@" uniqueProxyIdentifier=%@", v12];

  objc_msgSend(v3, "appendFormat:", @" hostOnCurrentDevice=%d", -[TUDialRequest hostOnCurrentDevice](self, "hostOnCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", @" endpointOnCurrentDevice=%d", -[TUDialRequest endpointOnCurrentDevice](self, "endpointOnCurrentDevice"));
  id v13 = [(TUDialRequest *)self endpointIDSDestinationURI];
  [v3 appendFormat:@" endpointIDSDestinationURI=%@", v13];

  uint64_t v14 = [(TUDialRequest *)self endpointRapportMediaSystemIdentifier];
  [v3 appendFormat:@" endpointRapportMediaSystemIdentifier=%@", v14];

  id v15 = [(TUDialRequest *)self endpointRapportEffectiveIdentifier];
  [v3 appendFormat:@" endpointRapportEffectiveIdentifier=%@", v15];

  objc_msgSend(v3, "appendFormat:", @" originatingUI=%ld", -[TUDialRequest originatingUIType](self, "originatingUIType"));
  objc_msgSend(v3, "appendFormat:", @" sos=%d", -[TUDialRequest isSOS](self, "isSOS"));
  objc_msgSend(v3, "appendFormat:", @" shouldSuppressInCallUI=%d", -[TUDialRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v3, "appendFormat:", @" valid=%d", -[TUDialRequest isValid](self, "isValid"));
  objc_msgSend(v3, "appendFormat:", @" redial=%d", -[TUDialRequest isRedial](self, "isRedial"));
  objc_msgSend(v3, "appendFormat:", @" preferDefaultApp=%d", -[TUDialRequest preferDefaultApp](self, "preferDefaultApp"));
  objc_super v16 = [(TUDialRequest *)self provider];
  [v3 appendFormat:@" provider=%@", v16];

  uint64_t v17 = [(TUDialRequest *)self validityErrors];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = [(TUDialRequest *)self validityErrors];
    int v20 = [v19 componentsJoinedByString:@", "];
    [v3 appendFormat:@" validityErrors=%@", v20];
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

+ (id)stringForDialType:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %ld>", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E58E82B8[a3];
  }

  return v3;
}

+ (int64_t)handleTypeForQueryItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  int v5 = [v4 isEqualToString:@"handleType"];

  if (v5)
  {
    id v6 = [v3 value];
    id v7 = v6;
    if (v6)
    {
      if ([v6 isEqualToString:@"emailAddress"])
      {
        int64_t v8 = 3;
      }
      else if ([v7 isEqualToString:@"generic"])
      {
        int64_t v8 = 1;
      }
      else if ([v7 isEqualToString:@"phoneNumber"])
      {
        int64_t v8 = 2;
      }
      else
      {
        int64_t v8 = 0;
      }
    }
    else
    {
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)stringForTTYType:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %ld>", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E58E82D0[a3];
  }

  return v3;
}

+ (int64_t)ttyTypeForString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"none"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"direct"])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"relay"])
    {
      int64_t v5 = 3;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (int64_t)dialRequestTypeForIntentDestinationType:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

+ (int64_t)intentTTYTypeForTTYType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)ttyTypeForIntentTTYType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)providerForIntentPreferredCallProvider:(int64_t)a3 recentCallProviderId:(id)a4 callCapability:(int64_t)a5 providerManager:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = v10;
  switch(a3)
  {
    case 0:
      if ((unint64_t)a5 < 2)
      {
        uint64_t v12 = [v10 defaultProvider];
        goto LABEL_11;
      }
      if (a5 != 2) {
        goto LABEL_12;
      }
      goto LABEL_10;
    case 1:
      uint64_t v12 = [v10 telephonyProvider];
      goto LABEL_11;
    case 2:
LABEL_10:
      uint64_t v12 = [v10 faceTimeProvider];
LABEL_11:
      id v13 = (void *)v12;
      break;
    case 3:
      if (!v9) {
        goto LABEL_12;
      }
      id v13 = [v10 providerWithIdentifier:v9];
      uint64_t v14 = TUDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        +[TUDialRequest providerForIntentPreferredCallProvider:recentCallProviderId:callCapability:providerManager:](v13, v14);
      }

      break;
    default:
LABEL_12:
      id v13 = 0;
      break;
  }

  return v13;
}

+ (int)originatingUITypeForExecutionContext:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA) {
    return 11;
  }
  else {
    return dword_19C608008[a3];
  }
}

+ (id)stringForOriginatingUIType:(int)a3
{
  if ((a3 - 1) > 0x32) {
    return 0;
  }
  else {
    return off_1E58E82F0[a3 - 1];
  }
}

- (void)setOriginatingUIType:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Setting originating UI type to =%d", (uint8_t *)v6, 8u);
  }

  self->_originatingUIType = a3;
}

+ (int)originatingUITypeForString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"dialer"])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:@"emergencyDialerLockscreen"])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:@"sideButtonPresses"])
    {
      int v5 = 3;
    }
    else if ([v4 isEqualToString:@"volumeLockHold"])
    {
      int v5 = 4;
    }
    else if ([v4 isEqualToString:@"sideButtonHold"])
    {
      int v5 = 5;
    }
    else if ([v4 isEqualToString:@"fallDetection"])
    {
      int v5 = 6;
    }
    else if ([v4 isEqualToString:@"fallDetectionUserResponsive"])
    {
      int v5 = 13;
    }
    else if ([v4 isEqualToString:@"ecg"])
    {
      int v5 = 7;
    }
    else if ([v4 isEqualToString:@"phoneRecents"])
    {
      int v5 = 8;
    }
    else if ([v4 isEqualToString:@"phoneFavorites"])
    {
      int v5 = 9;
    }
    else if ([v4 isEqualToString:@"facetimeRecents"])
    {
      int v5 = 14;
    }
    else if ([v4 isEqualToString:@"facetimeLink"])
    {
      int v5 = 15;
    }
    else if ([v4 isEqualToString:@"contactCard"])
    {
      int v5 = 16;
    }
    else if ([v4 isEqualToString:@"messagesContactCard"])
    {
      int v5 = 17;
    }
    else if ([v4 isEqualToString:@"messagesAvatarBar"])
    {
      int v5 = 18;
    }
    else if ([v4 isEqualToString:@"messagesBubble"])
    {
      int v5 = 19;
    }
    else if ([v4 isEqualToString:@"facetimeMissedCallNotification"])
    {
      int v5 = 23;
    }
    else if ([v4 isEqualToString:@"facetimeGFTNotification"])
    {
      int v5 = 24;
    }
    else if ([v4 isEqualToString:@"facetimeOngoing"])
    {
      int v5 = 20;
    }
    else if ([v4 isEqualToString:@"facetimeSpotlight"])
    {
      int v5 = 22;
    }
    else if ([v4 isEqualToString:@"facetimeCreateCall"])
    {
      int v5 = 21;
    }
    else if ([v4 isEqualToString:@"crashDetection"])
    {
      int v5 = 10;
    }
    else if ([v4 isEqualToString:@"crashDetectionUserResponsive"])
    {
      int v5 = 12;
    }
    else if ([v4 isEqualToString:@"siri"])
    {
      int v5 = 11;
    }
    else if ([v4 isEqualToString:@"dialerCallButtonDoubleTap"])
    {
      int v5 = 26;
    }
    else if ([v4 isEqualToString:@"inCallUI"])
    {
      int v5 = 27;
    }
    else if ([v4 isEqualToString:@"inCallDFR"])
    {
      int v5 = 28;
    }
    else if ([v4 isEqualToString:@"assistiveAccessDialer"])
    {
      int v5 = 29;
    }
    else if ([v4 isEqualToString:@"assistiveAccessContact"])
    {
      int v5 = 30;
    }
    else if ([v4 isEqualToString:@"assistiveAccessRecents"])
    {
      int v5 = 31;
    }
    else if ([v4 isEqualToString:@"messagesScreenSharing"])
    {
      int v5 = 32;
    }
    else if ([v4 isEqualToString:@"fromStaging"])
    {
      int v5 = 33;
    }
    else if ([v4 isEqualToString:@"fromApp"])
    {
      int v5 = 34;
    }
    else if ([v4 isEqualToString:@"tuTool"])
    {
      int v5 = 35;
    }
    else if ([v4 isEqualToString:@"fromTests"])
    {
      int v5 = 36;
    }
    else if ([v4 isEqualToString:@"userActivity"])
    {
      int v5 = 37;
    }
    else if ([v4 isEqualToString:@"explicitCallTransfer"])
    {
      int v5 = 38;
    }
    else if ([v4 isEqualToString:@"callButtonTap"])
    {
      int v5 = 39;
    }
    else if ([v4 isEqualToString:@"fieldModeSendButtonTap"])
    {
      int v5 = 40;
    }
    else if ([v4 isEqualToString:@"dialVoicemail"])
    {
      int v5 = 41;
    }
    else if ([v4 isEqualToString:@"voiceDial"])
    {
      int v5 = 42;
    }
    else if ([v4 isEqualToString:@"handoff"])
    {
      int v5 = 43;
    }
    else if ([v4 isEqualToString:@"fromNAC"])
    {
      int v5 = 44;
    }
    else if (([v4 isEqualToString:@"answerIncoming"] & 1) != 0 {
           || ([v4 isEqualToString:@"answerIncomingFromCarPlay"] & 1) != 0)
    }
    {
      int v5 = 45;
    }
    else if ([v4 isEqualToString:@"answerIncomingCarPlayRecents"])
    {
      int v5 = 47;
    }
    else if ([v4 isEqualToString:@"answerIncomingCarPlayCallBackButtonTap"])
    {
      int v5 = 48;
    }
    else if ([v4 isEqualToString:@"recentsSearchCall"])
    {
      int v5 = 49;
    }
    else if ([v4 isEqualToString:@"recentsSearchVoicemail"])
    {
      int v5 = 50;
    }
    else if ([v4 isEqualToString:@"fallbackToTelephony"])
    {
      int v5 = 51;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (BOOL)urlSchemeMatchesDefaultProvider:(id)a3 provider:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v7 = [a3 scheme];
  if ([v6 isDefaultAppScheme:v7]) {
    int v8 = [v5 isTelephonyProvider] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (int)service
{
  v2 = self;
  id v3 = [(TUDialRequest *)self provider];
  LODWORD(v2) = +[TUCallProviderManager serviceForProvider:v3 video:[(TUDialRequest *)v2 isVideo]];

  return (int)v2;
}

- (BOOL)useTTY
{
  return ([(TUDialRequest *)self ttyType] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)contactStore
{
  return +[TUCallCenter sharedContactStore];
}

- (TUSenderIdentity)localSenderIdentity
{
  id v3 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
  if (!v3
    || ([(TUDialRequest *)self provider],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 senderIdentityForAccountUUID:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v6 = [(TUDialRequest *)self provider];
    uint64_t v7 = [v6 prioritizedSenderIdentities];
    id v5 = [v7 firstObject];
  }

  return (TUSenderIdentity *)v5;
}

- (TUSenderIdentityClient)senderIdentityClient
{
  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    id v4 = [(id)objc_opt_class() senderIdentityClientGeneratorBlock];
    v4[2]();
    id v5 = (TUSenderIdentityClient *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_senderIdentityClient;
    self->_senderIdentityClient = v5;

    senderIdentityClient = self->_senderIdentityClient;
  }

  return senderIdentityClient;
}

- (id)isEmergencyNumberBlock
{
  id isEmergencyNumberBlock = self->_isEmergencyNumberBlock;
  if (!isEmergencyNumberBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__TUDialRequest_isEmergencyNumberBlock__block_invoke;
    v8[3] = &unk_1E58E8238;
    objc_copyWeak(&v9, &location);
    id v4 = _Block_copy(v8);
    id v5 = self->_isEmergencyNumberBlock;
    self->_id isEmergencyNumberBlock = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id isEmergencyNumberBlock = self->_isEmergencyNumberBlock;
  }
  id v6 = _Block_copy(isEmergencyNumberBlock);

  return v6;
}

uint64_t __39__TUDialRequest_isEmergencyNumberBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained senderIdentityClient];
    id v10 = [v6 UUID];
    uint64_t v11 = [v9 isEmergencyNumberForDigits:v5 senderIdentityUUID:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)isEmergencyNumberOrIsWhitelistedBlock
{
  id isEmergencyNumberOrIsWhitelistedBlock = self->_isEmergencyNumberOrIsWhitelistedBlock;
  if (!isEmergencyNumberOrIsWhitelistedBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__TUDialRequest_isEmergencyNumberOrIsWhitelistedBlock__block_invoke;
    v8[3] = &unk_1E58E8238;
    objc_copyWeak(&v9, &location);
    id v4 = _Block_copy(v8);
    id v5 = self->_isEmergencyNumberOrIsWhitelistedBlock;
    self->_id isEmergencyNumberOrIsWhitelistedBlock = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id isEmergencyNumberOrIsWhitelistedBlock = self->_isEmergencyNumberOrIsWhitelistedBlock;
  }
  id v6 = _Block_copy(isEmergencyNumberOrIsWhitelistedBlock);

  return v6;
}

uint64_t __54__TUDialRequest_isEmergencyNumberOrIsWhitelistedBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained senderIdentityClient];
    id v10 = [v6 UUID];
    uint64_t v11 = [v9 isWhitelistedEmergencyNumberForDigits:v5 senderIdentityUUID:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSString)destinationID
{
  v2 = [(TUDialRequest *)self handle];
  id v3 = [v2 value];

  return (NSString *)v3;
}

- (void)setDestinationID:(id)a3
{
  id v8 = a3;
  id v4 = [(TUDialRequest *)self handle];
  id v5 = [v4 value];
  char v6 = TUStringsAreEqualOrNil((unint64_t)v5, (uint64_t)v8);

  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      uint64_t v7 = +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:");
      [(TUDialRequest *)self setHandle:v7];
    }
    else
    {
      -[TUDialRequest setHandle:](self, "setHandle:");
    }
  }
}

- (IDSDestination)endpointIDSDestination
{
  id v3 = [(TUDialRequest *)self endpointIDSDestinationURI];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F6B438];
    id v5 = [(TUDialRequest *)self endpointIDSDestinationURI];
    char v6 = [v4 destinationWithURI:v5];
  }
  else
  {
    char v6 = 0;
  }

  return (IDSDestination *)v6;
}

- (NSUUID)localSenderIdentityUUID
{
  localSenderIdentityUUID = self->_localSenderIdentityUUID;
  if (!localSenderIdentityUUID)
  {
    if (self->_localSenderIdentityAccountUUID)
    {
      id v4 = [(TUDialRequest *)self provider];
      id v5 = [v4 senderIdentityForAccountUUID:self->_localSenderIdentityAccountUUID];
      char v6 = [v5 UUID];
      uint64_t v7 = self->_localSenderIdentityUUID;
      self->_localSenderIdentityUUID = v6;

      localSenderIdentityUUID = self->_localSenderIdentityUUID;
    }
    else
    {
      localSenderIdentityUUID = 0;
    }
  }

  return localSenderIdentityUUID;
}

- (NSUUID)localSenderIdentityAccountUUID
{
  localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
  if (!localSenderIdentityAccountUUID)
  {
    if (self->_localSenderIdentityUUID)
    {
      id v4 = [(TUDialRequest *)self provider];
      id v5 = [v4 senderIdentityForUUID:self->_localSenderIdentityUUID];
      char v6 = [v5 accountUUID];
      uint64_t v7 = self->_localSenderIdentityAccountUUID;
      self->_localSenderIdentityAccountUUID = v6;

      localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
    }
    else
    {
      localSenderIdentityAccountUUID = 0;
    }
  }

  return localSenderIdentityAccountUUID;
}

- (id)bundleIdentifier
{
  v2 = [(TUDialRequest *)self provider];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)sanitizedHandles
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(TUDialRequest *)self handles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 normalizedValue];
        uint64_t v11 = [MEMORY[0x1E4F28B88] controlCharacterSet];
        uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

        if (![v12 length])
        {
          id v13 = [v9 value];
          uint64_t v14 = [MEMORY[0x1E4F28B88] controlCharacterSet];
          uint64_t v15 = [v13 stringByTrimmingCharactersInSet:v14];

          uint64_t v12 = (void *)v15;
        }
        if ([v12 length]) {
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  objc_super v16 = (void *)[v3 copy];

  return v16;
}

- (id)contactNamesByHandleWithContactsDataSource:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v5 = [(TUDialRequest *)self handles];
  uint64_t v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(TUDialRequest *)self sanitizedHandles];
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
        uint64_t v28 = v12;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];

        if ([v11 length])
        {
          uint64_t v14 = [(TUDialRequest *)self contactIdentifier];
          uint64_t v15 = [v14 length];

          if (v15)
          {
            objc_super v16 = [(TUDialRequest *)self contactIdentifier];
            uint64_t v17 = [v23 contactForIdentifier:v16 keysToFetch:v13];
          }
          else
          {
            uint64_t v17 = [v23 contactForDestinationId:v11 keysToFetch:v13];
          }
          long long v18 = [v17 displayName];
          if ([v18 length]) {
            long long v19 = v18;
          }
          else {
            long long v19 = v11;
          }
          [v6 setObject:v19 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  long long v20 = (void *)[v6 copy];

  return v20;
}

+ (id)callProviderManagerGeneratorBlock
{
  v2 = _Block_copy((const void *)callProviderManagerGeneratorBlock);

  return v2;
}

+ (void)setCallProviderManagerGeneratorBlock:(id)a3
{
  callProviderManagerGeneratorBlock = (uint64_t)_Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

+ (id)senderIdentityClientGeneratorBlock
{
  v2 = _Block_copy((const void *)senderIdentityClientGeneratorBlock);

  return v2;
}

+ (void)setSenderIdentityClientGeneratorBlock:(id)a3
{
  senderIdentityClientGeneratorBlock = (uint64_t)_Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

- (CNGeminiManager)contactGeminiManager
{
  contactGeminiManager = self->_contactGeminiManager;
  if (!contactGeminiManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1B9F8]);
    uint64_t v5 = [(id)objc_opt_class() callProviderManagerGeneratorBlock];
    uint64_t v6 = v5[2]();
    uint64_t v7 = (CNGeminiManager *)[v4 initWithCallProviderManager:v6];
    uint64_t v8 = self->_contactGeminiManager;
    self->_contactGeminiManager = v7;

    contactGeminiManager = self->_contactGeminiManager;
  }

  return contactGeminiManager;
}

+ (void)setLegacyAddressBookIdentifierToContactIdentifierTransformBlock:(id)a3
{
  legacyAddressBookIdentifierToContactIdentifierTransformBlock = _Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

+ (id)legacyAddressBookIdentifierToContactIdentifierTransformBlock
{
  v2 = _Block_copy(legacyAddressBookIdentifierToContactIdentifierTransformBlock);

  return v2;
}

- (BOOL)BOOLValueForQueryItemWithName:(id)a3 inURLComponents:(id)a4
{
  id v4 = [a4 firstQueryItemWithName:a3];
  uint64_t v5 = [v4 value];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)callProviderFromURLComponents:(id)a3 handles:(id)a4 dialType:(int64_t)a5 originatingUIType:(int)a6 isSOS:(BOOL)a7 ttyType:(int64_t)a8 video:(BOOL *)a9 featureFlags:(id)a10
{
  BOOL v11 = a7;
  uint64_t v12 = *(void *)&a6;
  uint64_t v39 = a9;
  id v16 = a3;
  id v40 = a4;
  id v17 = a10;
  long long v18 = [(id)objc_opt_class() callProviderManagerGeneratorBlock];
  long long v19 = v18[2]();

  long long v20 = [v16 scheme];
  LODWORD(a4) = TUDefaultAppsEnabled(v17);

  if (a4 && [MEMORY[0x1E4F1CB10] isDefaultAppScheme:v20])
  {
    long long v21 = objc_opt_class();
    BOOL v22 = v11;
    id v23 = v40;
    uint64_t v24 = [v21 defaultAppCallProviderForDialType:a5 originatingUIType:v12 isSOS:v22 handles:v40 ttyType:a8];
LABEL_4:
    long long v25 = (void *)v24;
LABEL_5:
    char v26 = 0;
    goto LABEL_6;
  }
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "TUDialRequestSchemeTelephony", a9);
  if (([v20 isEqualToIgnoringCase:v28] & 1) != 0
    || ([v20 isEqualToIgnoringCase:@"telprompt"] & 1) != 0
    || ([v20 isEqualToIgnoringCase:@"telemergencycall"] & 1) != 0
    || ([v20 isEqualToIgnoringCase:@"callto"] & 1) != 0)
  {
    goto LABEL_14;
  }
  __int16 v29 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeForceTelephony];
  if ([v20 isEqualToIgnoringCase:v29])
  {

LABEL_14:
LABEL_15:
    long long v25 = [v19 telephonyProvider];
    char v26 = 0;
    goto LABEL_16;
  }
  uint64_t v31 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeForceTelephonyPrompt];
  char v32 = [v20 isEqualToIgnoringCase:v31];

  if (v32) {
    goto LABEL_15;
  }
  id v33 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeFaceTimeAudio];
  if (([v20 isEqualToIgnoringCase:v33] & 1) != 0
    || ([v20 isEqualToIgnoringCase:@"facetime-audio-prompt"] & 1) != 0)
  {
    goto LABEL_26;
  }
  long long v34 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeFaceTime];
  if ([v20 isEqualToIgnoringCase:v34])
  {

LABEL_26:
    id v23 = v40;
LABEL_27:
    long long v25 = [v19 faceTimeProvider];
    long long v35 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeFaceTime];
    if ([v20 isEqualToIgnoringCase:v35])
    {
    }
    else
    {
      char v36 = [v20 isEqualToIgnoringCase:@"facetime-prompt"];

      if ((v36 & 1) == 0) {
        goto LABEL_5;
      }
    }
    char v26 = 1;
    goto LABEL_6;
  }
  char v37 = [v20 isEqualToIgnoringCase:@"facetime-prompt"];

  id v23 = v40;
  if (v37) {
    goto LABEL_27;
  }
  if ([v20 isEqualToIgnoringCase:@"tincan"])
  {
    uint64_t v24 = [v19 tinCanProvider];
    goto LABEL_4;
  }
  if (([v20 isEqualToIgnoringCase:@"superbox-audio"] & 1) == 0
    && ![v20 isEqualToIgnoringCase:@"superbox-video"])
  {
    if (([v20 isEqualToIgnoringCase:@"callkit-audio"] & 1) != 0
      || ([v20 isEqualToIgnoringCase:@"callkit-video"] & 1) != 0
      || [v20 isEqualToIgnoringCase:@"callkit-audio-prompt"])
    {
      uint64_t v38 = [(TUDialRequest *)self callProviderIdentiferFromURLComponents:v16];
      if ([v38 length])
      {
        long long v25 = [v19 providerWithIdentifier:v38];
        char v26 = [v20 isEqualToIgnoringCase:@"callkit-video"];
      }
      else
      {
        char v26 = 0;
        long long v25 = 0;
      }
    }
    else
    {
      char v26 = 0;
      long long v25 = 0;
    }
LABEL_16:
    long long v27 = v39;
    id v23 = v40;
    if (!v39) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  long long v25 = [v19 superboxProvider];
  char v26 = [v20 isEqualToIgnoringCase:@"superbox-video"];
LABEL_6:
  long long v27 = v39;
  if (v39) {
LABEL_17:
  }
    *long long v27 = v26;
LABEL_18:

  return v25;
}

- (id)destinationIDFromURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];

  if (v4)
  {
    uint64_t v5 = [v3 host];
    char v6 = (void *)IMCopyStringWithLatinNumbers();

    uint64_t v7 = [v3 user];

    if (v7)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = [v3 user];
      uint64_t v10 = [v8 stringWithFormat:@"%@@%@", v9, v6];

      char v6 = (void *)v10;
    }
    BOOL v11 = [v3 fragment];

    if (v11)
    {
      uint64_t v12 = NSString;
      id v13 = [v3 fragment];
      uint64_t v14 = [v12 stringWithFormat:@"%@#%@", v6, v13];

      char v6 = (void *)v14;
    }
    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
    char v6 = [v3 _destinationIDConvertingNumbersToLatin:1];
    if (v6)
    {
LABEL_7:
      uint64_t v15 = [MEMORY[0x1E4F28B88] controlCharacterSet];
      id v16 = [v6 stringByTrimmingCharactersInSet:v15];

      goto LABEL_10;
    }
  }
  id v16 = 0;
LABEL_10:

  return v16;
}

- (id)handleFromURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUDialRequest *)self destinationIDFromURL:v4];
  if ([v5 length])
  {
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
    uint64_t v7 = [v6 firstQueryItemWithName:@"handleType"];
    if (!v7
      || (uint64_t v8 = [(id)objc_opt_class() handleTypeForQueryItem:v7]) == 0
      || (uint64_t v9 = [[TUHandle alloc] initWithType:v8 value:v5]) == 0)
    {
      uint64_t v9 = +[TUHandle handleWithDestinationID:v5];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)contactIdentifierFromURLComponents:(id)a3
{
  id v3 = [a3 firstQueryItemWithName:@"contactIdentifier"];
  id v4 = [v3 value];

  return v4;
}

- (id)callProviderIdentiferFromURLComponents:(id)a3
{
  id v3 = [a3 firstQueryItemWithName:@"providerIdentifier"];
  id v4 = [v3 value];

  return v4;
}

- (int)legacyAddressBookIdentifierFromURLComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUDialRequest *)self legacyAddressBookIdentifierQueryItemName];
  char v6 = [v4 firstQueryItemWithName:v5];

  if (v6)
  {
    uint64_t v7 = [v6 value];
    int v8 = [v7 intValue];
  }
  else
  {
    int v8 = -1;
  }

  return v8;
}

- (id)legacyAddressBookIdentifierQueryItemName
{
  id v3 = [(TUDialRequest *)self provider];
  char v4 = [v3 isTelephonyProvider];

  if (v4) {
    return @"abuid";
  }
  char v6 = [(TUDialRequest *)self provider];
  int v7 = [v6 isFaceTimeProvider];

  if (v7) {
    return @"uid";
  }
  else {
    return 0;
  }
}

- (NSURL)URL
{
  if ([(TUDialRequest *)self isValid])
  {
    id v3 = [(TUDialRequest *)self URLScheme];
    char v4 = [(TUDialRequest *)self URLHost];
    uint64_t v5 = [(TUDialRequest *)self URLQueryItems];
    if (v3)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v6 setScheme:v3];
      [v6 setEncodedHost:v4];
      [v6 setQueryItems:v5];
      int v7 = [v6 URL];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return (NSURL *)v7;
}

- (id)URLScheme
{
  id v3 = [(TUDialRequest *)self provider];
  int v4 = [v3 isTelephonyProvider];

  if (v4)
  {
    if ([(TUDialRequest *)self dialType] == 1)
    {
      uint64_t v5 = @"telemergencycall";
      goto LABEL_30;
    }
    int v8 = [(TUDialRequest *)self featureFlags];
    int v9 = TUDefaultAppsEnabled(v8);

    if (v9)
    {
      BOOL v10 = [(TUDialRequest *)self preferDefaultApp];
      BOOL v11 = [(TUDialRequest *)self showUIPrompt];
      if (v10)
      {
        if (v11) {
          [MEMORY[0x1E4F1CB10] TUDialRequestSchemeDefaultAppPrompt];
        }
        else {
          [MEMORY[0x1E4F1CB10] TUDialRequestSchemeDefaultApp];
        }
      }
      else if (v11)
      {
        [MEMORY[0x1E4F1CB10] TUDialRequestSchemeForceTelephonyPrompt];
      }
      else
      {
        [MEMORY[0x1E4F1CB10] TUDialRequestSchemeForceTelephony];
      }
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_29:
      uint64_t v5 = v12;
      goto LABEL_30;
    }
    uint64_t v5 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeTelephony];
    if ([(TUDialRequest *)self showUIPrompt])
    {

      uint64_t v5 = @"telprompt";
    }
  }
  else
  {
    id v6 = [(TUDialRequest *)self provider];
    int v7 = [v6 isFaceTimeProvider];

    if (v7)
    {
      if ([(TUDialRequest *)self isVideo])
      {
        uint64_t v5 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeFaceTime];
        if ([(TUDialRequest *)self showUIPrompt])
        {

          uint64_t v5 = @"facetime-prompt";
        }
      }
      else
      {
        uint64_t v5 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeFaceTimeAudio];
        if ([(TUDialRequest *)self showUIPrompt])
        {

          uint64_t v5 = @"facetime-audio-prompt";
        }
      }
    }
    else
    {
      id v13 = [(TUDialRequest *)self provider];
      int v14 = [v13 isTinCanProvider];

      if (v14)
      {
        uint64_t v5 = @"tincan";
        goto LABEL_30;
      }
      uint64_t v15 = [(TUDialRequest *)self provider];
      int v16 = [v15 isSuperboxProvider];

      BOOL v17 = [(TUDialRequest *)self isVideo];
      if (v16)
      {
        long long v18 = @"superbox-audio";
        if (v17) {
          long long v18 = @"superbox-video";
        }
        uint64_t v12 = v18;
        goto LABEL_29;
      }
      if (v17)
      {
        uint64_t v5 = @"callkit-video";
        goto LABEL_30;
      }
      long long v20 = [(TUDialRequest *)self featureFlags];
      if (TUDefaultAppsEnabled(v20))
      {
        BOOL v21 = [(TUDialRequest *)self showUIPrompt];

        if (v21)
        {
          uint64_t v5 = @"callkit-audio-prompt";
          goto LABEL_30;
        }
      }
      else
      {
      }
      uint64_t v5 = @"callkit-audio";
    }
  }
LABEL_30:

  return v5;
}

- (id)URLHost
{
  id v3 = [(TUDialRequest *)self handle];
  int v4 = [v3 value];

  if ([(__CFString *)v4 length])
  {
    uint64_t v5 = [(TUDialRequest *)self handle];
    uint64_t v6 = [v5 type];

    if (v6 == 2)
    {
      TUURLHostForTelephoneNumber(v4);
      int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ([(__CFString *)v7 length]
        && ([(TUDialRequest *)self service] == 2 || [(TUDialRequest *)self service] == 3)
        && ![(TUDialRequest *)self allowProviderFallback])
      {
        IMFormatPhoneNumber();
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v4 = v7;
      }
    }
  }
  if ([(__CFString *)v4 length])
  {
    int v8 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
    int v9 = (void *)[v8 mutableCopy];

    [v9 removeCharactersInString:@"[]:"];
    uint64_t v10 = [(__CFString *)v4 stringByAddingPercentEncodingWithAllowedCharacters:v9];

    int v4 = (__CFString *)v10;
  }
  if (v4) {
    BOOL v11 = v4;
  }
  else {
    BOOL v11 = &stru_1EECEA668;
  }
  uint64_t v12 = v11;

  return v12;
}

- (id)URLQueryItems
{
  id v3 = [(TUDialRequest *)self handleTypeURLQueryItem];
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F1CA48] array];
    [v4 addObject:v3];
  }
  else
  {
    int v4 = 0;
  }

  uint64_t v5 = [(TUDialRequest *)self isVoicemailURLQueryItem];
  if (v5)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v5];
  }

  uint64_t v6 = [(TUDialRequest *)self providerCustomIdentifierURLQueryItem];
  if (v6)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v6];
  }

  int v7 = [(TUDialRequest *)self localSenderIdentityUUIDURLQueryItem];
  if (v7)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v7];
  }

  int v8 = [(TUDialRequest *)self localSenderIdentityAccountUUIDURLQueryItem];
  if (v8)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v8];
  }

  int v9 = [(TUDialRequest *)self contactIdentifierURLQueryItem];
  if (v9)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v9];
  }

  uint64_t v10 = [(TUDialRequest *)self callProviderIdentifierURLQueryItem];
  if (v10)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v10];
  }

  BOOL v11 = [(TUDialRequest *)self audioSourceIdentifierURLQueryItem];
  if (v11)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v11];
  }

  uint64_t v12 = [(TUDialRequest *)self forceAssistURLQueryItem];
  if (v12)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v12];
  }

  id v13 = [(TUDialRequest *)self suppressAssistURLQueryItem];
  if (v13)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v13];
  }

  int v14 = [(TUDialRequest *)self dialAssistedURLQueryItem];
  if (v14)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v14];
  }

  uint64_t v15 = [(TUDialRequest *)self ttyTypeURLQueryItem];
  if (v15)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v15];
  }

  int v16 = [(TUDialRequest *)self originatingUIURLQueryItem];
  if (v16)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v16];
  }

  BOOL v17 = [(TUDialRequest *)self noPromptURLQueryItem];
  if (v17)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v17];
  }

  long long v18 = [(TUDialRequest *)self sosURLQueryItem];
  if (v18)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v18];
  }

  long long v19 = [(TUDialRequest *)self redialURLQueryItem];
  if (v19)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v19];
  }

  long long v20 = [(TUDialRequest *)self endpointIDSDestinationURIQueryItem];
  if (v20)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v20];
  }

  BOOL v21 = [(TUDialRequest *)self endpointRapportMediaSystemIdentifierQueryItem];
  if (v21)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v21];
  }

  BOOL v22 = [(TUDialRequest *)self endpointRapportEffectiveIdentifierQueryItem];
  if (v22)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v22];
  }

  id v23 = [(TUDialRequest *)self shouldSuppressInCallUIQueryItem];
  if (v23)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v23];
  }

  uint64_t v24 = [(TUDialRequest *)self successNotificationQueryItem];
  if (v24)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v24];
  }

  long long v25 = [(TUDialRequest *)self failureNotificationQueryItem];
  if (v25)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v25];
  }

  char v26 = [(TUDialRequest *)self allowProviderFallbackQueryItem];
  if (v26)
  {
    if (!v4)
    {
      int v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:v26];
  }

  long long v27 = (void *)[v4 copy];

  return v27;
}

- (id)isVoicemailURLQueryItem
{
  if ([(TUDialRequest *)self service] == 1 && [(TUDialRequest *)self dialType] == 2)
  {
    id v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"isVoicemail" value:@"1"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)contactIdentifierURLQueryItem
{
  id v3 = [(TUDialRequest *)self contactIdentifier];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self contactIdentifier];
    uint64_t v6 = [v4 queryItemWithName:@"contactIdentifier" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)callProviderIdentifierURLQueryItem
{
  id v3 = [(TUDialRequest *)self provider];
  if ([v3 isSystemProvider])
  {
    int v4 = 0;
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v5 = [(TUDialRequest *)self provider];
  uint64_t v6 = [v5 identifier];

  if (v6)
  {
    int v7 = (void *)MEMORY[0x1E4F290C8];
    id v3 = [(TUDialRequest *)self provider];
    int v8 = [v3 identifier];
    int v4 = [v7 queryItemWithName:@"providerIdentifier" value:v8];

    goto LABEL_5;
  }
  int v4 = 0;
LABEL_7:

  return v4;
}

- (id)providerCustomIdentifierURLQueryItem
{
  id v3 = [(TUDialRequest *)self providerCustomIdentifier];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self providerCustomIdentifier];
    uint64_t v6 = [v4 queryItemWithName:@"providerCustomIdentifier" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)localSenderIdentityUUIDURLQueryItem
{
  id v3 = [(TUDialRequest *)self localSenderIdentityUUID];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self localSenderIdentityUUID];
    uint64_t v6 = [v5 UUIDString];
    int v7 = [v4 queryItemWithName:@"localSenderIdentityUUID" value:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)localSenderIdentityAccountUUIDURLQueryItem
{
  id v3 = [(TUDialRequest *)self localSenderIdentityAccountUUID];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
    uint64_t v6 = [v5 UUIDString];
    int v7 = [v4 queryItemWithName:@"localSenderIdentityAccountUUID" value:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)audioSourceIdentifierURLQueryItem
{
  id v3 = [(TUDialRequest *)self audioSourceIdentifier];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self audioSourceIdentifier];
    uint64_t v6 = [v4 queryItemWithName:@"TUCallSourceIdentifierKey" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)forceAssistURLQueryItem
{
  if ([(TUDialRequest *)self performDialAssist]
    && ![(TUDialRequest *)self performLocalDialAssist])
  {
    id v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"forceAssist" value:@"1"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)suppressAssistURLQueryItem
{
  if ([(TUDialRequest *)self performDialAssist]
    || [(TUDialRequest *)self performLocalDialAssist])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"suppressAssist" value:@"1"];
  }

  return v3;
}

- (id)dialAssistedURLQueryItem
{
  if ([(TUDialRequest *)self isDialAssisted])
  {
    v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"wasAssisted" value:@"1"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)handleTypeURLQueryItem
{
  id v3 = [(TUDialRequest *)self handle];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self handle];
    uint64_t v6 = objc_msgSend(v4, "queryItemForHandleType:", objc_msgSend(v5, "type"));
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)ttyTypeURLQueryItem
{
  if ([(TUDialRequest *)self ttyType])
  {
    id v3 = (void *)MEMORY[0x1E4F290C8];
    int v4 = objc_msgSend((id)objc_opt_class(), "stringForTTYType:", -[TUDialRequest ttyType](self, "ttyType"));
    uint64_t v5 = [v3 queryItemWithName:@"ttyType" value:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)originatingUIURLQueryItem
{
  v2 = objc_msgSend((id)objc_opt_class(), "stringForOriginatingUIType:", -[TUDialRequest originatingUIType](self, "originatingUIType"));
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"originatingUI" value:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)noPromptURLQueryItem
{
  return 0;
}

- (id)sosURLQueryItem
{
  if ([(TUDialRequest *)self isSOS])
  {
    v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"sos" value:@"1"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)redialURLQueryItem
{
  if ([(TUDialRequest *)self isRedial])
  {
    v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"redial" value:@"1"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)endpointIDSDestinationURIQueryItem
{
  id v3 = [(TUDialRequest *)self endpointIDSDestinationURI];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self endpointIDSDestinationURI];
    uint64_t v6 = [v4 queryItemWithName:@"endpointIDSDestinationURI" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)endpointRapportMediaSystemIdentifierQueryItem
{
  id v3 = [(TUDialRequest *)self endpointRapportMediaSystemIdentifier];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self endpointRapportMediaSystemIdentifier];
    uint64_t v6 = [v4 queryItemWithName:@"endpointRapportMediaSystemIdentifier" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)endpointRapportEffectiveIdentifierQueryItem
{
  id v3 = [(TUDialRequest *)self endpointRapportEffectiveIdentifier];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self endpointRapportEffectiveIdentifier];
    uint64_t v6 = [v4 queryItemWithName:@"endpointRapportEffectiveIdentifier" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)shouldSuppressInCallUIQueryItem
{
  if ([(TUDialRequest *)self shouldSuppressInCallUI])
  {
    v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"shouldSuppressInCallUI" value:@"1"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)successNotificationQueryItem
{
  id v3 = [(TUDialRequest *)self successNotification];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self successNotification];
    uint64_t v6 = [v4 queryItemWithName:@"successNotification" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)failureNotificationQueryItem
{
  id v3 = [(TUDialRequest *)self failureNotification];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v5 = [(TUDialRequest *)self failureNotification];
    uint64_t v6 = [v4 queryItemWithName:@"failureNotification" value:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)allowProviderFallbackQueryItem
{
  if ([(TUDialRequest *)self allowProviderFallback])
  {
    v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"allowProviderFallback" value:@"1"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (NSUserActivity)userActivity
{
  return (NSUserActivity *)[(TUDialRequest *)self userActivityUsingDeprecatedCallingIntents:0];
}

- (id)userActivityUsingDeprecatedCallingIntents:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = self;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (![(TUDialRequest *)self isValid])
  {
    BOOL v17 = 0;
    goto LABEL_46;
  }
  uint64_t v5 = [(TUDialRequest *)v4 handles];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    BOOL v68 = v3;
    uint64_t v70 = [MEMORY[0x1E4F1CA48] array];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    int v7 = v4;
    obuint64_t j = [(TUDialRequest *)v4 handles];
    uint64_t v8 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v72 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v71 + 1) + 8 * i) personHandle];
          id v13 = objc_alloc((Class)CUTWeakLinkClass());
          int v14 = [(TUDialRequest *)v7 contactIdentifier];
          uint64_t v15 = [(TUDialRequest *)v7 providerCustomIdentifier];
          int v16 = (void *)[v13 initWithPersonHandle:v12 nameComponents:0 displayName:0 image:0 contactIdentifier:v14 customIdentifier:v15];

          [v70 addObject:v16];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v9);
    }

    int v4 = v7;
    BOOL v3 = v68;
  }
  else
  {
    uint64_t v70 = 0;
  }
  long long v18 = [(TUDialRequest *)v4 provider];
  int v19 = [v18 isSystemProvider];

  if (v19)
  {
    unint64_t v20 = [(TUDialRequest *)v4 dialType];
    if (v20 < 3) {
      unint64_t v21 = v20 + 1;
    }
    else {
      unint64_t v21 = 0;
    }
    uint64_t v22 = objc_msgSend((id)objc_opt_class(), "intentTTYTypeForTTYType:", -[TUDialRequest ttyType](v4, "ttyType"));
  }
  else
  {
    uint64_t v22 = 0;
    unint64_t v21 = 0;
  }
  uint64_t v23 = 1;
  if ([(TUDialRequest *)v4 isVideo]) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = 1;
  }
  long long v25 = [(TUDialRequest *)v4 provider];
  char v26 = [v25 isTelephonyProvider];

  if ((v26 & 1) == 0)
  {
    long long v27 = [(TUDialRequest *)v4 provider];
    int v28 = [v27 isFaceTimeProvider];

    if (v28) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 0;
    }
  }
  if (![(NSString *)v4->_audioSourceIdentifier isEqualToString:@"TUCallSourceIdentifierSpeakerRoute"])
  {
    if ([(NSString *)v4->_audioSourceIdentifier isEqualToString:@"TUCallSourceIdentifierHeySiri"]&& (uint64_t v30 = (uint64_t *)CUTWeakLinkSymbol()) != 0)
    {
      uint64_t v29 = *v30;
      if (v3) {
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v29 = 0;
      if (v3) {
        goto LABEL_40;
      }
    }
LABEL_32:
    uint64_t v31 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:v29 destinationType:v21 preferredCallProvider:v23 contacts:v70 ttyType:v22 callCapability:v24];
    char v32 = [(TUDialRequest *)v4 provider];
    id v33 = [v32 bundleIdentifier];
    long long v34 = [v31 _metadata];
    [v34 setLaunchId:v33];

    long long v35 = [(TUDialRequest *)v4 endpointIDSDestinationURI];
    uint64_t v36 = [v35 length];

    if (v36)
    {
      char v37 = [(TUDialRequest *)v4 endpointIDSDestinationURI];
      [v31 _setOriginatingDeviceIdsIdentifier:v37];
    }
    uint64_t v38 = [(TUDialRequest *)v4 endpointRapportMediaSystemIdentifier];
    uint64_t v39 = [v38 length];

    if (v39)
    {
      id v40 = [(TUDialRequest *)v4 endpointRapportMediaSystemIdentifier];
      [v31 _setOriginatingDeviceRapportMediaSystemIdentifier:v40];
    }
    long long v41 = [(TUDialRequest *)v4 endpointRapportEffectiveIdentifier];
    uint64_t v42 = [v41 length];

    if (v42)
    {
      long long v43 = [(TUDialRequest *)v4 endpointRapportEffectiveIdentifier];
      [v31 _setOriginatingDeviceRapportEffectiveIdentifier:v43];
    }
    id v44 = @"INStartCallIntent";
    goto LABEL_43;
  }
  uint64_t v29 = 1;
  if (!v3) {
    goto LABEL_32;
  }
LABEL_40:
  if ([(TUDialRequest *)v4 isVideo])
  {
    id v44 = @"INStartVideoCallIntent";
    uint64_t v31 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithContacts:v70];
    long long v45 = [(TUDialRequest *)v4 provider];
    v46 = [v45 bundleIdentifier];
    uint64_t v47 = [v31 _metadata];
    [v47 setLaunchId:v46];
  }
  else
  {
    id v44 = @"INStartAudioCallIntent";
    uint64_t v31 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithDestinationType:v21 contacts:v70];
    uint64_t v48 = [(TUDialRequest *)v4 provider];
    id v49 = [v48 bundleIdentifier];
    v50 = [v31 _metadata];
    [v50 setLaunchId:v49];

    [v31 setTTYType:v22];
    [v31 setPreferredCallProvider:v23];
  }
LABEL_43:
  uint64_t v51 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithIntent:v31 response:0];
  [v51 setDirection:1];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:v44];
  [v17 _setInteraction:v51 donate:0];
  v52 = [(TUDialRequest *)v4 provider];
  int v53 = [v52 isSystemProvider];

  if (v53)
  {
    id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v55 = objc_msgSend(NSNumber, "numberWithBool:", -[TUDialRequest isSOS](v4, "isSOS"));
    [v54 setObject:v55 forKeyedSubscript:@"sos"];

    v56 = objc_msgSend(NSNumber, "numberWithBool:", -[TUDialRequest isRedial](v4, "isRedial"));
    [v54 setObject:v56 forKeyedSubscript:@"redial"];

    v57 = [(TUDialRequest *)v4 provider];
    v58 = [v57 identifier];
    [v54 setObject:v58 forKeyedSubscript:@"providerIdentifier"];

    v59 = [(TUDialRequest *)v4 localSenderIdentityUUID];
    [v54 setObject:v59 forKeyedSubscript:@"localSenderIdentityUUID"];

    uint64_t v60 = [(TUDialRequest *)v4 localSenderIdentityAccountUUID];
    [v54 setObject:v60 forKeyedSubscript:@"localSenderIdentityAccountUUID"];

    v61 = [(TUDialRequest *)v4 audioSourceIdentifier];
    [v54 setObject:v61 forKeyedSubscript:@"TUCallSourceIdentifierKey"];

    v62 = objc_msgSend(NSNumber, "numberWithBool:", -[TUDialRequest performDialAssist](v4, "performDialAssist"));
    [v54 setObject:v62 forKeyedSubscript:@"performDialAssist"];

    v63 = objc_msgSend(NSNumber, "numberWithBool:", -[TUDialRequest performLocalDialAssist](v4, "performLocalDialAssist"));
    [v54 setObject:v63 forKeyedSubscript:@"performLocalDialAssist"];

    uint64_t v64 = objc_msgSend(NSNumber, "numberWithBool:", -[TUDialRequest isDialAssisted](v4, "isDialAssisted"));
    [v54 setObject:v64 forKeyedSubscript:@"dialAssisted"];

    v65 = objc_msgSend((id)objc_opt_class(), "stringForOriginatingUIType:", -[TUDialRequest originatingUIType](v4, "originatingUIType"));
    [v54 setObject:v65 forKeyedSubscript:@"originatingUI"];

    v66 = objc_msgSend(NSNumber, "numberWithBool:", -[TUDialRequest preferDefaultApp](v4, "preferDefaultApp"));
    [v54 setObject:v66 forKeyedSubscript:@"preferDefaultApp"];

    [v17 setUserInfo:v54];
  }

LABEL_46:

  return v17;
}

- (BOOL)isValid
{
  v2 = [(TUDialRequest *)self validityErrors];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)_validityErrorsForRelay:(BOOL)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  uint64_t v5 = [(TUDialRequest *)self validityErrorForUnspecifiedProvider];
  if (v5) {
    [v4 addObject:v5];
  }
  uint64_t v6 = [(TUDialRequest *)self validityErrorForDestinationIDWithVoicemail];

  if (v6) {
    [v4 addObject:v6];
  }
  int v7 = [(TUDialRequest *)self validityErrorForNonNormalDialTypeWithoutTelephony];

  if (v7) {
    [v4 addObject:v7];
  }
  uint64_t v8 = [(TUDialRequest *)self validityErrorForEndpointNotOnCurrentDeviceForNonRelayableService];

  if (v8) {
    [v4 addObject:v8];
  }
  uint64_t v9 = [(TUDialRequest *)self validityErrorForEmergencyCall];

  if (v9) {
    [v4 addObject:v9];
  }
  uint64_t v10 = [(TUDialRequest *)self validityErrorForVideoUnsupported];

  if (v10) {
    [v4 addObject:v10];
  }
  BOOL v11 = [(TUDialRequest *)self validityErrorForNormalDialTypeWithUnknownDestination];

  if (v11) {
    [v4 addObject:v11];
  }
  uint64_t v12 = [(TUDialRequest *)self validityErrorForUnsupportedHandleType];

  if (v12) {
    [v4 addObject:v12];
  }
  id v13 = [(TUDialRequest *)self validityErrorForSOS];

  if (v13) {
    [v4 addObject:v13];
  }
  int v14 = (void *)[v4 copy];

  return v14;
}

- (NSArray)validityErrors
{
  BOOL v3 = [(TUDialRequest *)self hostIDSIdentifier];
  int v4 = [(TUDialRequest *)self _validityErrorsForRelay:v3 != 0];

  return (NSArray *)v4;
}

- (id)validityErrorForUnspecifiedProvider
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(TUDialRequest *)self provider];

  if (v2)
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F28568];
    int v4 = [NSString stringWithFormat:@"No provider specified"];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    BOOL v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:1 userInfo:v5];
  }

  return v3;
}

- (id)validityErrorForDestinationIDWithVoicemail
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUDialRequest *)self handle];
  if (v3 && (v4 = (void *)v3, int64_t v5 = [(TUDialRequest *)self dialType], v4, v5 == 2))
  {
    uint64_t v12 = *MEMORY[0x1E4F28568];
    uint64_t v6 = NSString;
    uint64_t v7 = [(TUDialRequest *)self handle];
    uint64_t v8 = [v6 stringWithFormat:@"handle is non-nil (%@) and dialType is Voicemail", v7];
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:2 userInfo:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)validityErrorForNonNormalDialTypeWithoutTelephony
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(TUDialRequest *)self service] == 1 || ![(TUDialRequest *)self dialType])
  {
    int64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F28568];
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"dialType (%lu) is not Normal but service (%d) is not Telephony", -[TUDialRequest dialType](self, "dialType"), -[TUDialRequest service](self, "service"));
    v8[0] = v3;
    int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    int64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:3 userInfo:v4];
  }

  return v5;
}

- (id)validityErrorForEndpointNotOnCurrentDeviceForNonRelayableService
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(TUDialRequest *)self service] == 3
    && ![(TUDialRequest *)self endpointOnCurrentDevice])
  {
    uint64_t v7 = *MEMORY[0x1E4F28568];
    int v4 = objc_msgSend(NSString, "stringWithFormat:", @"service (%d) is not relayable but endpointOnCurrentDevice is set", -[TUDialRequest service](self, "service"));
    v8[0] = v4;
    int64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:4 userInfo:v5];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)validityErrorForEmergencyCall
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUDialRequest *)self handle];
  if (!v3 || (v4 = (void *)v3, int64_t v5 = [(TUDialRequest *)self dialType], v4, v5 != 1))
  {
    uint64_t v7 = 0;
    goto LABEL_55;
  }
  if ([(TUDialRequest *)self originatingUIType] == 2 || [(TUDialRequest *)self isSOS])
  {
    uint64_t v6 = [(TUDialRequest *)self isEmergencyNumberOrIsWhitelistedBlock];
  }
  else
  {
    uint64_t v6 = [(TUDialRequest *)self isEmergencyNumberBlock];
  }
  uint64_t v8 = v6;
  uint64_t v60 = (uint64_t (**)(void *, void *, id))_Block_copy(v6);

  uint64_t v9 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
  v59 = (void *)v9;
  if (v9)
  {
    uint64_t v10 = v9;
    BOOL v11 = [(TUDialRequest *)self provider];
    id v12 = [v11 senderIdentityForAccountUUID:v10];

    id v13 = TUDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [(TUDialRequest *)self handle];
      *(_DWORD *)buf = 138412546;
      id v79 = v14;
      __int16 v80 = 2112;
      id v81 = v12;
      _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "Checking whether %@ is an emergency number for sender identity %@", buf, 0x16u);
    }
    if (v12)
    {
      uint64_t v15 = [(TUDialRequest *)self handle];
      int v16 = [v15 value];
      char v17 = v60[2](v60, v16, v12);

      if (v17) {
        goto LABEL_30;
      }
    }
  }
  long long v18 = [(TUDialRequest *)self provider];
  int v19 = [v18 prioritizedSenderIdentities];

  uint64_t v20 = [v19 count];
  unint64_t v21 = TUDefaultLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      uint64_t v23 = [(TUDialRequest *)self handle];
      *(_DWORD *)buf = 138412546;
      id v79 = v23;
      __int16 v80 = 2112;
      id v81 = v19;
      _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "Checking whether %@ is an emergency number for any of the following sender identities %@", buf, 0x16u);
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v24 = v19;
    id v12 = (id)[v24 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v12)
    {
      uint64_t v25 = *(void *)v70;
      while (2)
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v70 != v25) {
            objc_enumerationMutation(v24);
          }
          long long v27 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          int v28 = [(TUDialRequest *)self handle];
          uint64_t v29 = [v28 value];
          int v30 = v60[2](v60, v29, v27);

          if (v30)
          {
            id v12 = v27;

            goto LABEL_30;
          }
        }
        id v12 = (id)[v24 countByEnumeratingWithState:&v69 objects:v77 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    char v31 = 0;
    goto LABEL_33;
  }
  if (v22)
  {
    char v32 = [(TUDialRequest *)self provider];
    *(_DWORD *)buf = 138412290;
    id v79 = v32;
    _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "No sender identities found on provider %@", buf, 0xCu);
  }
  id v33 = [(TUDialRequest *)self handle];
  long long v34 = [v33 value];
  char v35 = v60[2](v60, v34, 0);

  id v12 = 0;
  if (v35)
  {
LABEL_30:
    uint64_t v36 = TUDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v79 = v12;
      _os_log_impl(&dword_19C496000, v36, OS_LOG_TYPE_DEFAULT, "Emergency or whitelisted number detected; updating dial request with emergency sender identity %@",
        buf,
        0xCu);
    }

    char v37 = [v12 UUID];
    [(TUDialRequest *)self setLocalSenderIdentityUUID:v37];

    id v24 = [v12 accountUUID];
    [(TUDialRequest *)self setLocalSenderIdentityAccountUUID:v24];
    char v31 = 1;
LABEL_33:

    goto LABEL_34;
  }
  char v31 = 0;
LABEL_34:
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v38 = [(TUDialRequest *)self provider];
  uint64_t v39 = [v38 emergencyLabeledHandles];

  uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v66;
LABEL_36:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v66 != v42) {
        objc_enumerationMutation(v39);
      }
      id v44 = *(void **)(*((void *)&v65 + 1) + 8 * v43);
      long long v45 = [(TUDialRequest *)self handle];
      v46 = [v44 handle];
      char v47 = [v45 isEqualToHandle:v46];

      if (v47) {
        goto LABEL_52;
      }
      if (v41 == ++v43)
      {
        uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v76 count:16];
        if (v41) {
          goto LABEL_36;
        }
        break;
      }
    }
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v48 = [(TUDialRequest *)self provider];
  uint64_t v39 = [v48 emergencyHandles];

  uint64_t v49 = [v39 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v62;
LABEL_44:
    uint64_t v52 = 0;
    while (1)
    {
      if (*(void *)v62 != v51) {
        objc_enumerationMutation(v39);
      }
      uint64_t v53 = *(void *)(*((void *)&v61 + 1) + 8 * v52);
      id v54 = [(TUDialRequest *)self handle];
      LOBYTE(v53) = [v54 isEqualToHandle:v53];

      if (v53) {
        break;
      }
      if (v50 == ++v52)
      {
        uint64_t v50 = [v39 countByEnumeratingWithState:&v61 objects:v75 count:16];
        if (v50) {
          goto LABEL_44;
        }
        goto LABEL_50;
      }
    }
LABEL_52:
    uint64_t v7 = 0;
LABEL_53:

    goto LABEL_54;
  }
LABEL_50:

  if ((v31 & 1) == 0)
  {
    uint64_t v73 = *MEMORY[0x1E4F28568];
    v56 = NSString;
    v57 = [(TUDialRequest *)self handle];
    v58 = [v56 stringWithFormat:@"handle (%@) for emergency call dial request is not an emergency number (isEmergencyOrWhitelistedSOSNumber=%d isTelephonyApprovedEmergencyHandle=%d originatingUIType=%ld)", v57, 0, 0, -[TUDialRequest originatingUIType](self, "originatingUIType"), v59];
    long long v74 = v58;
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];

    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:5 userInfo:v39];
    goto LABEL_53;
  }
  uint64_t v7 = 0;
LABEL_54:

LABEL_55:

  return v7;
}

- (id)validityErrorForVideoUnsupported
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(TUDialRequest *)self isVideo]
    && ([(TUDialRequest *)self provider],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 supportsAudioAndVideo],
        v3,
        (v4 & 1) == 0))
  {
    uint64_t v9 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [NSString stringWithFormat:@"Requested video for a provider which doesn't support it"];
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

    int64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:6 userInfo:v7];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)validityErrorForNormalDialTypeWithUnknownDestination
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUDialRequest *)self handle];
  char v4 = [v3 value];
  if ([v4 length]) {
    goto LABEL_4;
  }
  int64_t v5 = [(TUDialRequest *)self contactIdentifier];
  if ([v5 length])
  {

LABEL_4:
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  int64_t v8 = [(TUDialRequest *)self dialType];

  if (v8) {
    goto LABEL_5;
  }
  uint64_t v11 = *MEMORY[0x1E4F28568];
  uint64_t v9 = [NSString stringWithFormat:@"destinationID and contactIdentifier are both nil/empty and dialType is Normal"];
  v12[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:7 userInfo:v10];

LABEL_6:

  return v6;
}

- (id)validityErrorForUnsupportedHandleType
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUDialRequest *)self handle];
  if (v3)
  {
    char v4 = [(TUDialRequest *)self provider];
    int64_t v5 = [(TUDialRequest *)self handle];
    char v6 = objc_msgSend(v4, "supportsHandleType:", objc_msgSend(v5, "type"));

    if (v6)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v10 = *MEMORY[0x1E4F28568];
      uint64_t v7 = [NSString stringWithFormat:@"Provider does not support the specified handle type"];
      v11[0] = v7;
      int64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

      uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:8 userInfo:v8];
    }
  }

  return v3;
}

- (id)validityErrorForSOS
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(TUDialRequest *)self dialType] == 1 || ![(TUDialRequest *)self isSOS])
  {
    int64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F28568];
    uint64_t v3 = [NSString stringWithFormat:@"Requested SOS for non emergency dialType"];
    v8[0] = v3;
    char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    int64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUDialRequestValidityErrorDomain" code:9 userInfo:v4];
  }

  return v5;
}

- (id)dialRequestByReplacingProvider:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)[(TUDialRequest *)self copy];
  [v5 setProvider:v4];

  return v5;
}

- (TUDialRequest)dialRequestWithURLStripping
{
  BOOL v3 = [(TUDialRequest *)self allowProviderFallback];
  [(TUDialRequest *)self setAllowProviderFallback:0];
  id v4 = [TUDialRequest alloc];
  int64_t v5 = [(TUDialRequest *)self URL];
  char v6 = [(TUDialRequest *)v4 initWithURL:v5];

  [(TUDialRequest *)self setAllowProviderFallback:v3];

  return v6;
}

- (id)_contactFromINPerson:(id)a3 contactsDataSource:(id)a4 bestGuessHandle:(id *)a5
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  *a5 = 0;
  uint64_t v9 = [v7 contactIdentifier];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1B8F8];
    id v12 = [v7 contactIdentifier];
    v64[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
    uint64_t v14 = [v11 predicateForContactsWithIdentifiers:v13];
LABEL_3:
    uint64_t v15 = (void *)v14;
LABEL_4:

    goto LABEL_5;
  }
  uint64_t v23 = [v7 personHandle];
  id v24 = [v23 value];
  uint64_t v25 = [v24 length];

  if (!v25)
  {
    char v31 = [v7 displayName];
    uint64_t v32 = [v31 length];

    if (!v32) {
      goto LABEL_22;
    }
    id v33 = (void *)MEMORY[0x1E4F1B8F8];
    id v12 = [v7 displayName];
    uint64_t v34 = [v33 predicateForContactsMatchingName:v12];
    goto LABEL_47;
  }
  char v26 = [v7 personHandle];
  id v12 = [v26 value];

  long long v27 = [v7 personHandle];
  uint64_t v28 = [v27 type];

  if (v28)
  {
    if (v28 != 1)
    {
      if (v28 == 2)
      {
        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v12];
        if (!v13)
        {
          uint64_t v29 = TUDefaultLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = (uint64_t)v12;
            int v30 = "[WARN] Could not create CNPhoneNumber from personHandle.value with phone number type: %@";
LABEL_54:
            _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
            goto LABEL_55;
          }
          goto LABEL_55;
        }
        goto LABEL_43;
      }
      goto LABEL_51;
    }
    goto LABEL_46;
  }
  uint64_t v52 = TUDefaultLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = (uint64_t)v7;
    _os_log_impl(&dword_19C496000, v52, OS_LOG_TYPE_DEFAULT, "[WARN] INPersonHandle has no type, attempting to infer from value %@", buf, 0xCu);
  }

  if ([v12 _appearsToBePhoneNumber])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v12];
    if (!v13)
    {
      uint64_t v29 = TUDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = (uint64_t)v12;
        int v30 = "[WARN] Could not create CNPhoneNumber from personHandle.value with unknown type: %@";
        goto LABEL_54;
      }
LABEL_55:

      uint64_t v15 = 0;
      goto LABEL_4;
    }
LABEL_43:
    uint64_t v14 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v13];
    goto LABEL_3;
  }
  uint64_t v53 = [v7 personHandle];
  id v54 = [v53 value];
  int v55 = [v54 _appearsToBeEmail];

  if (v55)
  {
LABEL_46:
    uint64_t v34 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v12];
LABEL_47:
    uint64_t v15 = (void *)v34;
    goto LABEL_5;
  }
  v56 = TUDefaultLog();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = [v7 personHandle];
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = (uint64_t)v57;
    _os_log_impl(&dword_19C496000, v56, OS_LOG_TYPE_DEFAULT, "[WARN] Could not infer INPersonHandleType for person %@", buf, 0xCu);
  }
LABEL_51:
  uint64_t v15 = 0;
LABEL_5:

  if (v15)
  {
    uint64_t v16 = *MEMORY[0x1E4F1AEE0];
    v63[0] = *MEMORY[0x1E4F1ADC8];
    v63[1] = v16;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    id v58 = 0;
    long long v18 = [v8 unifiedContactsMatchingPredicate:v15 keysToFetch:v17 error:&v58];
    id v19 = v58;
    if (v18)
    {
      uint64_t v20 = [v18 firstObject];
      unint64_t v21 = TUDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v18 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v60 = v22;
        __int16 v61 = 2112;
        id v62 = v20;
        _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "Found %ld contacts matching INPerson, using %@", buf, 0x16u);
      }
    }
    else
    {
      unint64_t v21 = TUDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v60 = (uint64_t)v7;
        __int16 v61 = 2112;
        id v62 = v19;
        _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Error obtaining contact from INPerson %@: %@", buf, 0x16u);
      }
      uint64_t v20 = 0;
    }

    goto LABEL_25;
  }
LABEL_22:
  char v17 = TUDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = (uint64_t)v7;
    _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not create contact search predicate for INPerson: %@", buf, 0xCu);
  }
  uint64_t v15 = 0;
  id v19 = 0;
  uint64_t v20 = 0;
LABEL_25:

  char v35 = [v7 personHandle];
  uint64_t v36 = [v35 value];
  uint64_t v37 = [v36 length];

  if (!v37)
  {
    uint64_t v41 = [v20 phoneNumbers];
    uint64_t v42 = [v41 count];

    if (v42)
    {
      uint64_t v43 = [v20 phoneNumbers];
      id v44 = [v43 firstObject];
      long long v45 = [v44 value];
      v46 = [v45 stringValue];

      uint64_t v47 = 2;
    }
    else
    {
      uint64_t v48 = [v20 emailAddresses];
      uint64_t v49 = [v48 count];

      if (!v49)
      {
        v46 = 0;
        uint64_t v47 = 1;
LABEL_34:
        if ([v46 length])
        {
          uint64_t v50 = [TUHandle alloc];
          uint64_t v51 = [v7 displayName];
          uint64_t v38 = [(TUHandle *)v50 initWithType:v47 value:v46 siriDisplayName:v51];
        }
        else
        {
          uint64_t v38 = 0;
        }

        if (v38) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      uint64_t v43 = [v20 emailAddresses];
      id v44 = [v43 firstObject];
      v46 = [v44 value];
      uint64_t v47 = 3;
    }

    goto LABEL_34;
  }
  uint64_t v38 = +[TUHandle handleWithPerson:v7];
  if (v38) {
LABEL_27:
  }
    *a5 = v38;
LABEL_28:
  id v39 = v20;

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUDialRequest *)self isEqualToDialRequest:v4];

  return v5;
}

- (BOOL)isEqualToDialRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(TUDialRequest *)self service];
  if (v5 == [v4 service])
  {
    int64_t v6 = [(TUDialRequest *)self dialType];
    if (v6 == [v4 dialType])
    {
      id v7 = [(TUDialRequest *)self handle];
      id v8 = [v4 handle];
      if (!TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
      {
        LOBYTE(v20) = 0;
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v9 = [(TUDialRequest *)self contactIdentifier];
      uint64_t v10 = [v4 contactIdentifier];
      if (!TUStringsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        LOBYTE(v20) = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v11 = [(TUDialRequest *)self providerCustomIdentifier];
      id v12 = [v4 providerCustomIdentifier];
      if (!TUStringsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
      {
        LOBYTE(v20) = 0;
LABEL_32:

        goto LABEL_33;
      }
      id v13 = [(TUDialRequest *)self localSenderIdentityUUID];
      uint64_t v14 = [v4 localSenderIdentityUUID];
      if (!TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14))
      {
        LOBYTE(v20) = 0;
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v50 = v13;
      unint64_t v15 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
      uint64_t v48 = [v4 localSenderIdentityAccountUUID];
      uint64_t v49 = (void *)v15;
      if (!TUObjectsAreEqualOrNil(v15, (uint64_t)v48))
      {
        LOBYTE(v20) = 0;
        id v13 = v50;
LABEL_30:

        goto LABEL_31;
      }
      unint64_t v16 = [(TUDialRequest *)self audioSourceIdentifier];
      v46 = [v4 audioSourceIdentifier];
      uint64_t v47 = (void *)v16;
      if (!TUStringsAreEqualOrNil(v16, (uint64_t)v46))
      {
        LOBYTE(v20) = 0;
        id v13 = v50;
LABEL_29:

        goto LABEL_30;
      }
      unint64_t v17 = [(TUDialRequest *)self contactIdentifier];
      id v44 = [v4 contactIdentifier];
      long long v45 = (void *)v17;
      if (!TUStringsAreEqualOrNil(v17, (uint64_t)v44)) {
        goto LABEL_26;
      }
      int v18 = [(TUDialRequest *)self performDialAssist];
      BOOL v19 = v18 == [v4 performDialAssist];
      id v13 = v50;
      if (!v19
        || (int v39 = [(TUDialRequest *)self performLocalDialAssist],
            v39 != [v4 performLocalDialAssist])
        || (int v40 = [(TUDialRequest *)self isDialAssisted],
            v40 != [v4 isDialAssisted])
        || (int64_t v41 = -[TUDialRequest ttyType](self, "ttyType"), v41 != [v4 ttyType])
        || (int v42 = [(TUDialRequest *)self showUIPrompt],
            v42 != [v4 showUIPrompt]))
      {
        LOBYTE(v20) = 0;
LABEL_28:

        goto LABEL_29;
      }
      int v21 = [(TUDialRequest *)self isVideo];
      if (v21 == [v4 isVideo]
        && (int v22 = -[TUDialRequest isSOS](self, "isSOS"), v22 == [v4 isSOS]))
      {
        id v24 = [(TUDialRequest *)self uniqueProxyIdentifier];
        uint64_t v43 = [v4 uniqueProxyIdentifier];
        if (TUStringsAreEqualOrNil((unint64_t)v24, (uint64_t)v43)
          && (int v35 = [(TUDialRequest *)self hostOnCurrentDevice],
              v35 == [v4 hostOnCurrentDevice])
          && (int v36 = [(TUDialRequest *)self originatingUIType],
              v36 == [v4 originatingUIType])
          && (int v37 = [(TUDialRequest *)self endpointOnCurrentDevice],
              v37 == [v4 endpointOnCurrentDevice]))
        {
          uint64_t v38 = [(TUDialRequest *)self endpointIDSDestinationURI];
          uint64_t v34 = [v4 endpointIDSDestinationURI];
          if (TUStringsAreEqualOrNil((unint64_t)v38, (uint64_t)v34))
          {
            id v33 = [(TUDialRequest *)self endpointRapportMediaSystemIdentifier];
            uint64_t v32 = [v4 endpointRapportMediaSystemIdentifier];
            if (TUStringsAreEqualOrNil((unint64_t)v33, (uint64_t)v32))
            {
              char v31 = [(TUDialRequest *)self endpointRapportEffectiveIdentifier];
              int v30 = [v4 endpointRapportEffectiveIdentifier];
              if (TUStringsAreEqualOrNil((unint64_t)v31, (uint64_t)v30)
                && (int v28 = [(TUDialRequest *)self shouldSuppressInCallUI],
                    v28 == [v4 shouldSuppressInCallUI]))
              {
                uint64_t v29 = [(TUDialRequest *)self hostIDSIdentifier];
                long long v27 = [v4 hostIDSIdentifier];
                if (TUStringsAreEqualOrNil((unint64_t)v29, (uint64_t)v27)
                  && (int v26 = [(TUDialRequest *)self preferDefaultApp],
                      v26 == [v4 preferDefaultApp]))
                {
                  BOOL v25 = [(TUDialRequest *)self allowProviderFallback];
                  int v20 = v25 ^ [v4 allowProviderFallback] ^ 1;
                }
                else
                {
                  LOBYTE(v20) = 0;
                }
              }
              else
              {
                LOBYTE(v20) = 0;
              }
            }
            else
            {
              LOBYTE(v20) = 0;
            }
          }
          else
          {
            LOBYTE(v20) = 0;
          }
        }
        else
        {
          LOBYTE(v20) = 0;
        }
      }
      else
      {
LABEL_26:
        LOBYTE(v20) = 0;
      }
      id v13 = v50;
      goto LABEL_28;
    }
  }
  LOBYTE(v20) = 0;
LABEL_35:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TUDialRequest *)self service];
  int64_t v4 = [(TUDialRequest *)self dialType] - v3 + 32 * v3;
  int v5 = [(TUDialRequest *)self handle];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  id v7 = [(TUDialRequest *)self contactIdentifier];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  uint64_t v9 = [(TUDialRequest *)self providerCustomIdentifier];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  uint64_t v11 = [(TUDialRequest *)self localSenderIdentityUUID];
  uint64_t v12 = [v11 hash] - v10 + 32 * v10;

  id v13 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
  uint64_t v14 = [v13 hash] - v12 + 32 * v12;

  unint64_t v15 = [(TUDialRequest *)self audioSourceIdentifier];
  uint64_t v16 = [v15 hash] - v14 + 32 * v14;

  if ([(TUDialRequest *)self performDialAssist]) {
    uint64_t v17 = 1231;
  }
  else {
    uint64_t v17 = 1237;
  }
  uint64_t v18 = v17 - v16 + 32 * v16;
  if ([(TUDialRequest *)self performLocalDialAssist]) {
    uint64_t v19 = 1231;
  }
  else {
    uint64_t v19 = 1237;
  }
  uint64_t v20 = v19 - v18 + 32 * v18;
  if ([(TUDialRequest *)self isDialAssisted]) {
    uint64_t v21 = 1231;
  }
  else {
    uint64_t v21 = 1237;
  }
  int64_t v22 = [(TUDialRequest *)self ttyType] - (v21 - v20 + 32 * v20) + 32 * (v21 - v20 + 32 * v20);
  if ([(TUDialRequest *)self showUIPrompt]) {
    uint64_t v23 = 1231;
  }
  else {
    uint64_t v23 = 1237;
  }
  uint64_t v24 = v23 - v22 + 32 * v22;
  if ([(TUDialRequest *)self isVideo]) {
    uint64_t v25 = 1231;
  }
  else {
    uint64_t v25 = 1237;
  }
  uint64_t v26 = v25 - v24 + 32 * v24;
  long long v27 = [(TUDialRequest *)self uniqueProxyIdentifier];
  uint64_t v28 = [v27 hash] - v26 + 32 * v26;

  if ([(TUDialRequest *)self hostOnCurrentDevice]) {
    uint64_t v29 = 1231;
  }
  else {
    uint64_t v29 = 1237;
  }
  uint64_t v30 = 31 * (v29 - v28 + 32 * v28) + [(TUDialRequest *)self originatingUIType];
  if ([(TUDialRequest *)self isSOS]) {
    uint64_t v31 = 1231;
  }
  else {
    uint64_t v31 = 1237;
  }
  uint64_t v32 = v31 - v30 + 32 * v30;
  if ([(TUDialRequest *)self isRedial]) {
    uint64_t v33 = 1231;
  }
  else {
    uint64_t v33 = 1237;
  }
  uint64_t v34 = v33 - v32 + 32 * v32;
  if ([(TUDialRequest *)self endpointOnCurrentDevice]) {
    uint64_t v35 = 1231;
  }
  else {
    uint64_t v35 = 1237;
  }
  uint64_t v36 = v35 - v34 + 32 * v34;
  int v37 = [(TUDialRequest *)self endpointIDSDestinationURI];
  uint64_t v38 = [v37 hash] - v36 + 32 * v36;

  int v39 = [(TUDialRequest *)self endpointRapportMediaSystemIdentifier];
  uint64_t v40 = [v39 hash] - v38 + 32 * v38;

  int64_t v41 = [(TUDialRequest *)self endpointRapportEffectiveIdentifier];
  uint64_t v42 = [v41 hash] - v40 + 32 * v40;

  if ([(TUDialRequest *)self shouldSuppressInCallUI]) {
    uint64_t v43 = 1231;
  }
  else {
    uint64_t v43 = 1237;
  }
  uint64_t v44 = v43 - v42 + 32 * v42;
  if ([(TUDialRequest *)self preferDefaultApp]) {
    uint64_t v45 = 1231;
  }
  else {
    uint64_t v45 = 1237;
  }
  uint64_t v46 = v45 - v44 + 32 * v44;
  if ([(TUDialRequest *)self allowProviderFallback]) {
    uint64_t v47 = 1231;
  }
  else {
    uint64_t v47 = 1237;
  }
  return v47 - v46 + 32 * v46 + 0x6DBA7597395110C1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUDialRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provider"];
  uint64_t v6 = [(TUDialRequest *)self initWithProvider:v5];

  if (v6)
  {
    v6->_dialType = [v4 decodeIntegerForKey:@"dialType"];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = NSStringFromSelector(sel_handles);
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:v8 forKey:v9];
    uint64_t v11 = [v7 setWithArray:v10];
    handles = v6->_handles;
    v6->_handles = (NSSet *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioSourceIdentifier"];
    uint64_t v14 = [v13 copy];
    audioSourceIdentifier = v6->_audioSourceIdentifier;
    v6->_audioSourceIdentifier = (NSString *)v14;

    v6->_video = [v4 decodeBoolForKey:@"video"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    uint64_t v17 = [v16 copy];
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerCustomIdentifier"];
    uint64_t v20 = [v19 copy];
    providerCustomIdentifier = v6->_providerCustomIdentifier;
    v6->_providerCustomIdentifier = (NSString *)v20;

    int64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localSenderIdentityUUID"];
    uint64_t v23 = [v22 copy];
    localSenderIdentityUUID = v6->_localSenderIdentityUUID;
    v6->_localSenderIdentityUUID = (NSUUID *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localSenderIdentityAccountUUID"];
    uint64_t v26 = [v25 copy];
    localSenderIdentityAccountUUID = v6->_localSenderIdentityAccountUUID;
    v6->_localSenderIdentityAccountUUID = (NSUUID *)v26;

    v6->_performDialAssist = [v4 decodeBoolForKey:@"performDialAssist"];
    v6->_performLocalDialAssist = [v4 decodeBoolForKey:@"performLocalDialAssist"];
    v6->_dialAssisted = [v4 decodeBoolForKey:@"dialAssisted"];
    v6->_ttyType = [v4 decodeIntegerForKey:@"ttyType"];
    v6->_showUIPrompt = [v4 decodeBoolForKey:@"showUIPrompt"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueProxyIdentifier"];
    uniqueProxyIdentifier = v6->_uniqueProxyIdentifier;
    v6->_uniqueProxyIdentifier = (NSString *)v28;

    v6->_hostOnCurrentDevice = [v4 decodeBoolForKey:@"hostOnCurrentDevice"];
    v6->_originatingUIType = [v4 decodeIntForKey:@"originatingUIType"];
    v6->_sos = [v4 decodeBoolForKey:@"sos"];
    v6->_redial = [v4 decodeBoolForKey:@"redial"];
    v6->_endpointOnCurrentDevice = [v4 decodeBoolForKey:@"endpointOnCurrentDevice"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpointIDSDestinationURI"];
    endpointIDSDestinationURI = v6->_endpointIDSDestinationURI;
    v6->_endpointIDSDestinationURI = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpointRapportMediaSystemIdentifier"];
    endpointRapportMediaSystemIdentifier = v6->_endpointRapportMediaSystemIdentifier;
    v6->_endpointRapportMediaSystemIdentifier = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpointRapportEffectiveIdentifier"];
    endpointRapportEffectiveIdentifier = v6->_endpointRapportEffectiveIdentifier;
    v6->_endpointRapportEffectiveIdentifier = (NSString *)v34;

    v6->_shouldSuppressInCallUI = [v4 decodeBoolForKey:@"shouldSuppressInCallUI"];
    [v4 decodeSizeForKey:@"localLandscapeAspectRatio"];
    v6->_localLandscapeAspectRatio.width = v36;
    v6->_localLandscapeAspectRatio.height = v37;
    [v4 decodeSizeForKey:@"localPortraitAspectRatio"];
    v6->_localPortraitAspectRatio.width = v38;
    v6->_localPortraitAspectRatio.height = v39;
    uint64_t v40 = objc_opt_class();
    int64_t v41 = NSStringFromSelector(sel_dateDialed);
    uint64_t v42 = [v4 decodeObjectOfClass:v40 forKey:v41];
    dateDialed = v6->_dateDialed;
    v6->_dateDialed = (NSDate *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processHandle"];
    processHandle = v6->_processHandle;
    v6->_processHandle = (BSProcessHandle *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostIDSIdentifier"];
    hostIDSIdentifier = v6->_hostIDSIdentifier;
    v6->_hostIDSIdentifier = (NSString *)v46;

    v6->_preferDefaultApp = [v4 decodeBoolForKey:@"preferDefaultApp"];
    v6->_allowProviderFallback = [v4 decodeBoolForKey:@"allowProviderFallback"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  provider = self->_provider;
  id v9 = a3;
  [v9 encodeObject:provider forKey:@"provider"];
  [v9 encodeInteger:self->_dialType forKey:@"dialType"];
  int v5 = [(NSSet *)self->_handles allObjects];
  uint64_t v6 = NSStringFromSelector(sel_handles);
  [v9 encodeObject:v5 forKey:v6];

  [v9 encodeObject:self->_audioSourceIdentifier forKey:@"audioSourceIdentifier"];
  [v9 encodeBool:self->_video forKey:@"video"];
  [v9 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
  [v9 encodeObject:self->_providerCustomIdentifier forKey:@"providerCustomIdentifier"];
  [v9 encodeObject:self->_localSenderIdentityUUID forKey:@"localSenderIdentityUUID"];
  [v9 encodeObject:self->_localSenderIdentityAccountUUID forKey:@"localSenderIdentityAccountUUID"];
  [v9 encodeBool:self->_performDialAssist forKey:@"performDialAssist"];
  [v9 encodeBool:self->_performLocalDialAssist forKey:@"performLocalDialAssist"];
  [v9 encodeBool:self->_dialAssisted forKey:@"dialAssisted"];
  [v9 encodeInteger:self->_ttyType forKey:@"ttyType"];
  [v9 encodeBool:self->_showUIPrompt forKey:@"showUIPrompt"];
  [v9 encodeObject:self->_uniqueProxyIdentifier forKey:@"uniqueProxyIdentifier"];
  [v9 encodeBool:self->_hostOnCurrentDevice forKey:@"hostOnCurrentDevice"];
  [v9 encodeInteger:self->_originatingUIType forKey:@"originatingUIType"];
  [v9 encodeBool:self->_sos forKey:@"sos"];
  [v9 encodeBool:self->_redial forKey:@"redial"];
  [v9 encodeBool:self->_endpointOnCurrentDevice forKey:@"endpointOnCurrentDevice"];
  [v9 encodeObject:self->_endpointIDSDestinationURI forKey:@"endpointIDSDestinationURI"];
  [v9 encodeObject:self->_endpointRapportMediaSystemIdentifier forKey:@"endpointRapportMediaSystemIdentifier"];
  [v9 encodeObject:self->_endpointRapportEffectiveIdentifier forKey:@"endpointRapportEffectiveIdentifier"];
  [v9 encodeObject:self->_hostIDSIdentifier forKey:@"hostIDSIdentifier"];
  [v9 encodeBool:self->_shouldSuppressInCallUI forKey:@"shouldSuppressInCallUI"];
  [v9 encodeObject:self->_successNotification forKey:@"successNotification"];
  [v9 encodeObject:self->_failureNotification forKey:@"failureNotification"];
  objc_msgSend(v9, "encodeSize:forKey:", @"localLandscapeAspectRatio", self->_localLandscapeAspectRatio.width, self->_localLandscapeAspectRatio.height);
  objc_msgSend(v9, "encodeSize:forKey:", @"localPortraitAspectRatio", self->_localPortraitAspectRatio.width, self->_localPortraitAspectRatio.height);
  dateDialed = self->_dateDialed;
  uint64_t v8 = NSStringFromSelector(sel_dateDialed);
  [v9 encodeObject:dateDialed forKey:v8];

  [v9 encodeObject:self->_processHandle forKey:@"processHandle"];
  [v9 encodeBool:self->_preferDefaultApp forKey:@"preferDefaultApp"];
  [v9 encodeBool:self->_allowProviderFallback forKey:@"allowProviderFallback"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(TUDialRequest *)self provider];
  id v7 = (void *)[v5 initWithProvider:v6];

  if (v7)
  {
    objc_msgSend(v7, "setDialType:", -[TUDialRequest dialType](self, "dialType"));
    uint64_t v8 = [(TUDialRequest *)self handles];
    id v9 = (void *)[v8 copyWithZone:a3];
    [v7 setHandles:v9];

    uint64_t v10 = [(TUDialRequest *)self contactIdentifier];
    uint64_t v11 = (void *)[v10 copyWithZone:a3];
    [v7 setContactIdentifier:v11];

    uint64_t v12 = [(TUDialRequest *)self providerCustomIdentifier];
    id v13 = (void *)[v12 copyWithZone:a3];
    [v7 setProviderCustomIdentifier:v13];

    uint64_t v14 = [(TUDialRequest *)self localSenderIdentityUUID];
    unint64_t v15 = (void *)[v14 copyWithZone:a3];
    [v7 setLocalSenderIdentityUUID:v15];

    uint64_t v16 = [(TUDialRequest *)self localSenderIdentityAccountUUID];
    uint64_t v17 = (void *)[v16 copyWithZone:a3];
    [v7 setLocalSenderIdentityAccountUUID:v17];

    uint64_t v18 = [(TUDialRequest *)self audioSourceIdentifier];
    uint64_t v19 = (void *)[v18 copyWithZone:a3];
    [v7 setAudioSourceIdentifier:v19];

    objc_msgSend(v7, "setVideo:", -[TUDialRequest isVideo](self, "isVideo"));
    objc_msgSend(v7, "setPerformDialAssist:", -[TUDialRequest performDialAssist](self, "performDialAssist"));
    objc_msgSend(v7, "setPerformLocalDialAssist:", -[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"));
    objc_msgSend(v7, "setDialAssisted:", -[TUDialRequest isDialAssisted](self, "isDialAssisted"));
    objc_msgSend(v7, "setTtyType:", -[TUDialRequest ttyType](self, "ttyType"));
    objc_msgSend(v7, "setShowUIPrompt:", -[TUDialRequest showUIPrompt](self, "showUIPrompt"));
    uint64_t v20 = [(TUDialRequest *)self uniqueProxyIdentifier];
    uint64_t v21 = (void *)[v20 copyWithZone:a3];
    [v7 setUniqueProxyIdentifier:v21];

    objc_msgSend(v7, "setHostOnCurrentDevice:", -[TUDialRequest hostOnCurrentDevice](self, "hostOnCurrentDevice"));
    objc_msgSend(v7, "setOriginatingUIType:", -[TUDialRequest originatingUIType](self, "originatingUIType"));
    objc_msgSend(v7, "setSOS:", -[TUDialRequest isSOS](self, "isSOS"));
    objc_msgSend(v7, "setRedial:", -[TUDialRequest isRedial](self, "isRedial"));
    objc_msgSend(v7, "setEndpointOnCurrentDevice:", -[TUDialRequest endpointOnCurrentDevice](self, "endpointOnCurrentDevice"));
    int64_t v22 = [(TUDialRequest *)self endpointIDSDestinationURI];
    uint64_t v23 = (void *)[v22 copyWithZone:a3];
    [v7 setEndpointIDSDestinationURI:v23];

    uint64_t v24 = [(TUDialRequest *)self endpointRapportMediaSystemIdentifier];
    uint64_t v25 = (void *)[v24 copyWithZone:a3];
    [v7 setEndpointRapportMediaSystemIdentifier:v25];

    uint64_t v26 = [(TUDialRequest *)self endpointRapportEffectiveIdentifier];
    long long v27 = (void *)[v26 copyWithZone:a3];
    [v7 setEndpointRapportEffectiveIdentifier:v27];

    uint64_t v28 = [(TUDialRequest *)self hostIDSIdentifier];
    uint64_t v29 = (void *)[v28 copyWithZone:a3];
    [v7 setHostIDSIdentifier:v29];

    objc_msgSend(v7, "setShouldSuppressInCallUI:", -[TUDialRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
    uint64_t v30 = [(TUDialRequest *)self successNotification];
    [v7 setSuccessNotification:v30];

    uint64_t v31 = [(TUDialRequest *)self failureNotification];
    [v7 setFailureNotification:v31];

    uint64_t v32 = [(TUDialRequest *)self dateDialed];
    [v7 setDateDialed:v32];

    uint64_t v33 = [(TUDialRequest *)self processHandle];
    [v7 setProcessHandle:v33];

    objc_msgSend(v7, "setPreferDefaultApp:", -[TUDialRequest preferDefaultApp](self, "preferDefaultApp"));
    objc_msgSend(v7, "setAllowProviderFallback:", -[TUDialRequest allowProviderFallback](self, "allowProviderFallback"));
  }
  return v7;
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->_localPortraitAspectRatio.width;
  double height = self->_localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (CGSize)localLandscapeAspectRatio
{
  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (void)setContactGeminiManager:(id)a3
{
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (int64_t)dialType
{
  return self->_dialType;
}

- (void)setDialType:(int64_t)a3
{
  self->_dialType = a3;
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)providerCustomIdentifier
{
  return self->_providerCustomIdentifier;
}

- (void)setProviderCustomIdentifier:(id)a3
{
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (NSString)audioSourceIdentifier
{
  return self->_audioSourceIdentifier;
}

- (void)setAudioSourceIdentifier:(id)a3
{
}

- (BOOL)performDialAssist
{
  return self->_performDialAssist;
}

- (void)setPerformDialAssist:(BOOL)a3
{
  self->_performDialAssist = a3;
}

- (BOOL)performLocalDialAssist
{
  return self->_performLocalDialAssist;
}

- (void)setPerformLocalDialAssist:(BOOL)a3
{
  self->_performLocalDialAssist = a3;
}

- (BOOL)isDialAssisted
{
  return self->_dialAssisted;
}

- (void)setDialAssisted:(BOOL)a3
{
  self->_dialAssisted = a3;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (BOOL)showUIPrompt
{
  return self->_showUIPrompt;
}

- (void)setShowUIPrompt:(BOOL)a3
{
  self->_showUIPrompt = a3;
}

- (TUCallProviderManager)providerManager
{
  return self->_providerManager;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void)setIsEmergencyNumberBlock:(id)a3
{
}

- (void)setIsEmergencyNumberOrIsWhitelistedBlock:(id)a3
{
}

- (NSDate)dateDialed
{
  return self->_dateDialed;
}

- (void)setDateDialed:(id)a3
{
}

- (BOOL)hostOnCurrentDevice
{
  return self->_hostOnCurrentDevice;
}

- (void)setHostOnCurrentDevice:(BOOL)a3
{
  self->_hostOnCurrentDevice = a3;
}

- (BOOL)endpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (NSString)endpointIDSDestinationURI
{
  return self->_endpointIDSDestinationURI;
}

- (void)setEndpointIDSDestinationURI:(id)a3
{
}

- (NSString)endpointRapportMediaSystemIdentifier
{
  return self->_endpointRapportMediaSystemIdentifier;
}

- (void)setEndpointRapportMediaSystemIdentifier:(id)a3
{
}

- (NSString)endpointRapportEffectiveIdentifier
{
  return self->_endpointRapportEffectiveIdentifier;
}

- (void)setEndpointRapportEffectiveIdentifier:(id)a3
{
}

- (NSString)hostIDSIdentifier
{
  return self->_hostIDSIdentifier;
}

- (void)setHostIDSIdentifier:(id)a3
{
}

- (BOOL)preferDefaultApp
{
  return self->_preferDefaultApp;
}

- (void)setPreferDefaultApp:(BOOL)a3
{
  self->_preferDefaultApp = a3;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSOS:(BOOL)a3
{
  self->_sos = a3;
}

- (BOOL)isRedial
{
  return self->_redial;
}

- (void)setRedial:(BOOL)a3
{
  self->_redial = a3;
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (NSString)successNotification
{
  return self->_successNotification;
}

- (void)setSuccessNotification:(id)a3
{
}

- (NSString)failureNotification
{
  return self->_failureNotification;
}

- (void)setFailureNotification:(id)a3
{
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
}

- (BOOL)allowProviderFallback
{
  return self->_allowProviderFallback;
}

- (void)setAllowProviderFallback:(BOOL)a3
{
  self->_allowProviderFallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_failureNotification, 0);
  objc_storeStrong((id *)&self->_successNotification, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_hostIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRapportMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIDSDestinationURI, 0);
  objc_storeStrong((id *)&self->_dateDialed, 0);
  objc_storeStrong(&self->_isEmergencyNumberOrIsWhitelistedBlock, 0);
  objc_storeStrong(&self->_isEmergencyNumberBlock, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_providerManager, 0);
  objc_storeStrong((id *)&self->_audioSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_providerCustomIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_contactGeminiManager, 0);
  objc_storeStrong((id *)&self->_senderIdentityClient, 0);

  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
}

- (void)initWithDialIntent:(uint64_t)a1 providerManager:(NSObject *)a2 contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Could not find sender identity for contact %@", (uint8_t *)&v2, 0xCu);
}

+ (void)providerForIntentPreferredCallProvider:(void *)a1 recentCallProviderId:(NSObject *)a2 callCapability:providerManager:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_debug_impl(&dword_19C496000, a2, OS_LOG_TYPE_DEBUG, "Using third-party provider: %@", (uint8_t *)&v4, 0xCu);
}

@end