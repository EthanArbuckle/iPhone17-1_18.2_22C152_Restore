@interface StartCallIntentHandler
- (AppResolving)appResolver;
- (BOOL)anyContactsHaveSameName:(id)a3;
- (BOOL)haveAlreadyConfirmedRecipient:(id)a3;
- (BOOL)intentHasUnresolvedLocalEmergencyContact:(id)a3;
- (BOOL)isChinaSKUDevice;
- (BOOL)isEmergencyCall:(id)a3;
- (BOOL)isEmergencyHandle:(id)a3;
- (BOOL)isFaceTimeInvitationEnabled;
- (BOOL)isFaceTimeNoFanOutEnabled;
- (BOOL)isGFTDisabledForChinaSKU:(id)a3;
- (BOOL)isUnresolvedLocalEmergencyContact:(id)a3;
- (BOOL)requireScoreBasedResolutionForGFT:(unint64_t)a3 numberOfContactsCount:(unint64_t)a4;
- (BOOL)shouldForceAudioOnlyWithIdiom:(int64_t)a3 withDisplayDisabled:(BOOL)a4;
- (BOOL)shouldInferAudioCapabilityForRequestedCallCapability:(int64_t)a3 idiom:(int64_t)a4 isDisplayDisabled:(BOOL)a5;
- (BOOL)shouldRequireInvalidNumberConfirmationForRecipient:(id)a3;
- (BOOL)shouldRequireUnknownRecipientConfirmationForRequestedRecipient:(id)a3 resolvedToRecipient:(id)a4 contact:(id)a5;
- (FaceTimeUtilities)faceTimeUtilities;
- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger;
- (IntentHandlerFeatureFlags)featureFlags;
- (NSCache)identifierToContactCache;
- (NSMutableOrderedSet)contactIdentifiersConfirmed;
- (NSMutableOrderedSet)handlesConfirmed;
- (StartCallIntentHandler)init;
- (StartCallIntentHandler)initWithFeatureFlags:(id)a3;
- (StartCallIntentHandler)initWithFeatureFlags:(id)a3 faceTimeUtilities:(id)a4;
- (StartCallIntentHandlerDataSource)dataSource;
- (id)_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:(id)a3 requestedHandleType:(int64_t)a4 preferredCallProvider:(int64_t)a5;
- (id)_inPersonsFromContact:(id)a3 withRequestedType:(int64_t)a4 requestedLabel:(id)a5 isoCountryCodes:(id)a6;
- (id)allCountryCodesRelevantToCall:(id)a3;
- (id)callRecordForRecentCall:(id)a3;
- (id)emergencyTypeToString:(int64_t)a3;
- (id)generateAdditionalMatchingHandles:(id)a3 resolvedContacts:(id)a4 requestedHandleType:(int64_t)a5 requestedHandleLabel:(id)a6;
- (id)getAlternativesForContact:(id)a3 forRequestedHandleType:(int64_t)a4 forCallProvider:(int64_t)a5;
- (id)globalEmergencyNumbers;
- (id)localizedEmergencyString:(id)a3;
- (id)personResolutionResultsForIntent:(id)a3;
- (id)recentCallRecordToRedialForIntent:(id)a3;
- (id)recentCallToRedialForQuery:(id)a3;
- (id)recentCallsWithHandles:(id)a3 telephonyOnly:(BOOL)a4;
- (id)relayCRRRecommendationForPerson:(id)a3 intent:(id)a4;
- (id)resolutionResultForCallCapability:(int64_t)a3 idiom:(int64_t)a4 withDisplayDisabled:(BOOL)a5;
- (id)resolutionResultForEmergency;
- (id)resolutionResultForPersonWithResolvedContactName:(id)a3 resolvedPerson:(id)a4 resolvedContact:(id)a5 contactIdentifiersRequiringConfirmation:(id)a6;
- (id)resolutionResultForPersonWithResolvedHandleValue:(id)a3;
- (id)resolveContactsFromCallGroups:(id)a3;
- (id)resolvePreferredContactFromContacts:(id)a3;
- (id)resolvePreferredHandleFromHandles:(id)a3 contactIdentifiersRequiringConfirmation:(id)a4 telephonyOnly:(BOOL)a5;
- (id)responseForDialRequest:(id)a3 intent:(id)a4;
- (id)responseForJoinRequest:(id)a3 intent:(id)a4 callProvider:(id)a5;
- (int64_t)callCapabilityFromRecentCall:(id)a3;
- (int64_t)inferCallCapabilityForPreferredCallProvider:(int64_t)a3 recentCall:(id)a4 initialCallCapability:(int64_t)a5 idiom:(int64_t)a6 isDisplayDisabled:(BOOL)a7 executionContext:(int64_t)a8;
- (void)confirmStartCall:(id)a3 completion:(id)a4;
- (void)extractHandlesFromIntent:(id)a3 faceTimeMemberHandles:(id)a4 nonFaceTimeMemberHandles:(id)a5;
- (void)handleStartCall:(id)a3 completion:(id)a4;
- (void)parseEmergencyContacts:(id)a3 usingExistingResult:(id)a4;
- (void)resolveCallCapabilityForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveCallRecordToCallBackForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveContactsForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveDestinationTypeForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveFaceTimeLinkForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolvePreferredCallProviderForStartCall:(id)a3 withCompletion:(id)a4;
- (void)setAppResolver:(id)a3;
- (void)setContactIdentifiersConfirmed:(id)a3;
- (void)setCoreAnalyticsLogger:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFaceTimeUtilities:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHandlesConfirmed:(id)a3;
- (void)sortFaceTimeHandles:(id)a3 faceTimeHandles:(id)a4 nonFaceTimeHandles:(id)a5;
- (void)updateHandlerStateForContactResolutionResults:(id)a3;
- (void)updateScoreBasedContactResolver:(id)a3 forFavoritesAmongContacts:(id)a4;
- (void)updateScoreBasedContactResolver:(id)a3 forRecentCallsMatchingContacts:(id)a4;
- (void)updateScoreBasedHandleResolver:(id)a3 forFavoritesAmongHandles:(id)a4;
- (void)updateScoreBasedHandleResolver:(id)a3 forRecentCallsMatchingHandles:(id)a4 telephonyOnly:(BOOL)a5;
@end

@implementation StartCallIntentHandler

- (StartCallIntentHandler)init
{
  v3 = objc_alloc_init(IntentHandlerFeatureFlags);
  v4 = +[FaceTimeUtilities sharedInstance];
  v5 = [(StartCallIntentHandler *)self initWithFeatureFlags:v3 faceTimeUtilities:v4];

  return v5;
}

- (StartCallIntentHandler)initWithFeatureFlags:(id)a3
{
  id v4 = a3;
  v5 = +[FaceTimeUtilities sharedInstance];
  v6 = [(StartCallIntentHandler *)self initWithFeatureFlags:v4 faceTimeUtilities:v5];

  return v6;
}

- (StartCallIntentHandler)initWithFeatureFlags:(id)a3 faceTimeUtilities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)StartCallIntentHandler;
  v9 = [(StartCallIntentHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureFlags, a3);
    objc_storeStrong((id *)&v10->_faceTimeUtilities, a4);
  }

  return v10;
}

- (StartCallIntentHandlerDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    id v4 = +[NSString stringWithFormat:@"com.apple.TelephonyUtilities.PhoneIntentHandler.%@", objc_opt_class()];
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);

    v6 = [[StartCallIntentHandlerDataSource alloc] initWithDispatchQueue:v5 featureFlags:self->_featureFlags];
    id v7 = self->_dataSource;
    self->_dataSource = v6;

    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (NSCache)identifierToContactCache
{
  identifierToContactCache = self->_identifierToContactCache;
  if (!identifierToContactCache)
  {
    id v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    dispatch_queue_t v5 = self->_identifierToContactCache;
    self->_identifierToContactCache = v4;

    identifierToContactCache = self->_identifierToContactCache;
  }

  return identifierToContactCache;
}

- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger
{
  coreAnalyticsLogger = self->_coreAnalyticsLogger;
  if (!coreAnalyticsLogger)
  {
    id v4 = objc_alloc_init(IntentHandlerCoreAnalyticsLogger);
    dispatch_queue_t v5 = self->_coreAnalyticsLogger;
    self->_coreAnalyticsLogger = (IntentHandlerCoreAnalyticsLogging *)v4;

    coreAnalyticsLogger = self->_coreAnalyticsLogger;
  }

  return coreAnalyticsLogger;
}

- (AppResolving)appResolver
{
  appResolver = self->_appResolver;
  if (!appResolver)
  {
    id v4 = objc_alloc_init(AppResolver);
    dispatch_queue_t v5 = self->_appResolver;
    self->_appResolver = (AppResolving *)v4;

    appResolver = self->_appResolver;
  }

  return appResolver;
}

- (BOOL)isChinaSKUDevice
{
  v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 isGreenTea];

  return v3;
}

- (BOOL)isFaceTimeNoFanOutEnabled
{
  unsigned __int8 v3 = [(StartCallIntentHandler *)self featureFlags];
  unsigned int v4 = [v3 faceTimeNoFanOutEnabled];

  if (v4)
  {
    dispatch_queue_t v5 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Facetime No Fan Out is true", v9, 2u);
    }
  }
  v6 = [(StartCallIntentHandler *)self featureFlags];
  unsigned __int8 v7 = [v6 faceTimeNoFanOutEnabled];

  return v7;
}

- (BOOL)isFaceTimeInvitationEnabled
{
  v2 = [(StartCallIntentHandler *)self featureFlags];
  unsigned __int8 v3 = [v2 faceTimeInvitationEnabled];

  return v3;
}

- (void)handleStartCall:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v77 = (void (**)(id, void *))a4;
  v6 = IntentHandlerDefaultLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = IntentHandlerDefaultLog();
  v9 = v8;
  unint64_t v76 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "handleStartCall", " enableTelemetry=YES ", buf, 2u);
  }
  os_signpost_id_t spid = v7;

  v10 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v89 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Handling start call intent: %@", buf, 0xCu);
  }

  id v11 = objc_alloc((Class)TUDialRequest);
  objc_super v12 = [(StartCallIntentHandler *)self dataSource];
  v13 = [v12 providerManager];
  v14 = [(StartCallIntentHandler *)self dataSource];
  [v14 contactsDataSource];
  v15 = v78 = v5;
  v16 = [(StartCallIntentHandler *)self dataSource];
  v17 = [v16 senderIdentityClient];
  v18 = [(StartCallIntentHandler *)self featureFlags];
  id v75 = objc_msgSend(v11, "initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:", v5, v13, v15, v17, objc_msgSend(v18, "emergencyServicesOverrideEnabled"));

  if ([(StartCallIntentHandler *)self isFaceTimeInvitationEnabled])
  {
    v19 = [v5 faceTimeLink];
    id v20 = [v19 length];

    if (v20)
    {
      v21 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v5 faceTimeLink];
        *(_DWORD *)buf = 138412290;
        id v89 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FaceTimeInvitation Enabled for faceTime link: %@", buf, 0xCu);
      }
      v23 = +[NSMutableSet set];
      v24 = +[NSMutableSet set];
      [(StartCallIntentHandler *)self extractHandlesFromIntent:v5 faceTimeMemberHandles:v23 nonFaceTimeMemberHandles:v24];
      v25 = [v5 faceTimeLink];
      v26 = +[NSString stringWithFormat:@"%@", v25];
      v27 = +[NSURL URLWithString:v26];

      v28 = +[TUConversationLink conversationLinkForURL:v27];
      if (v28)
      {
        id v29 = [objc_alloc((Class)TUJoinConversationRequest) initWithConversationLink:v28 otherInvitedHandles:v24 sendLetMeInRequest:0];
        [v29 setWantsStagingArea:0];
        if ([v5 callCapability] == (id)2) {
          [v29 setVideoEnabled:1];
        }
        v30 = v23;
        v31 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Configuring invitation preferences on FaceTime join request.", buf, 2u);
        }

        id v32 = [objc_alloc((Class)TUConversationInvitationPreference) initWithHandleType:2 notificationStyles:1];
        v93[0] = v32;
        id v33 = [objc_alloc((Class)TUConversationInvitationPreference) initWithHandleType:3 notificationStyles:1];
        v93[1] = v33;
        id v34 = [objc_alloc((Class)TUConversationInvitationPreference) initWithHandleType:1 notificationStyles:2];
        v93[2] = v34;
        v35 = +[NSArray arrayWithObjects:v93 count:3];
        v36 = +[NSSet setWithArray:v35];
        [v29 setInvitationPreferences:v36];

        v23 = v30;
      }
      else
      {
        id v29 = 0;
      }

      id v5 = v78;
      if (v29) {
        goto LABEL_29;
      }
    }
  }
  id v37 = objc_alloc((Class)NSMutableArray);
  v38 = [v5 contacts];
  id v39 = objc_msgSend(v37, "initWithCapacity:", objc_msgSend(v38, "count"));

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = [v5 contacts];
  id v40 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v85;
    uint64_t v79 = *(void *)v85;
    v80 = v39;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v85 != v42) {
          objc_enumerationMutation(obj);
        }
        v44 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        v45 = [v44 personHandle];
        id v46 = [v45 type];

        if (v46 == (id)2)
        {
          v47 = [(StartCallIntentHandler *)self dataSource];
          v48 = [v47 coreTelephonyDataSource];
          v49 = [v48 allRelevantISOCountryCodes];
          v83 = [v49 firstObject];

          id v50 = objc_alloc((Class)CNPhoneNumber);
          v51 = [v44 personHandle];
          v52 = [v51 value];
          id v53 = [v50 initWithStringValue:v52 countryCode:v83];

          id v54 = objc_alloc((Class)INPersonHandle);
          v55 = [v53 formattedInternationalStringValue];
          v56 = [v44 personHandle];
          id v57 = [v56 type];
          v58 = [v44 personHandle];
          v59 = [v58 label];
          id v60 = [v54 initWithValue:v55 type:v57 label:v59];

          id v39 = v80;
          [v44 setPersonHandle:v60];
          [v80 addObject:v44];

          uint64_t v42 = v79;
        }
        else
        {
          [v39 addObject:v44];
        }
      }
      id v41 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v41);
  }

  id v5 = v78;
  [v78 setContacts:v39];
  id v61 = [objc_alloc((Class)NSUserActivity) _initWithIntent:v78];
  id v29 = [objc_alloc((Class)TUJoinConversationRequest) initWithUserActivity:v61];

  if (v29)
  {
LABEL_29:
    v62 = [v29 remoteMembers];
    if ((unint64_t)[v62 count] >= 2)
    {

      v63 = v75;
LABEL_32:
      v65 = [v63 provider];
      v66 = [(StartCallIntentHandler *)self responseForJoinRequest:v29 intent:v5 callProvider:v65];
LABEL_33:

      goto LABEL_38;
    }
    v64 = [v29 conversationLink];

    v63 = v75;
    if (v64) {
      goto LABEL_32;
    }
  }
  else
  {
    v63 = v75;
  }
  v66 = [(StartCallIntentHandler *)self responseForDialRequest:v63 intent:v5];
  if ([v66 code] == (id)2)
  {
    v67 = [v63 provider];
    unsigned int v68 = [v67 isTelephonyProvider];

    if (v68)
    {
      v65 = [(StartCallIntentHandler *)self dataSource];
      v69 = [v63 handle];
      [v65 logOutgoingCallToHandle:v69];

      goto LABEL_33;
    }
  }
LABEL_38:
  v70 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v71 = [v66 userActivity];
    *(_DWORD *)buf = 138412546;
    id v89 = v66;
    __int16 v90 = 2112;
    v91 = v71;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Calling completion block with response: %@ user activity: %@", buf, 0x16u);
  }
  v72 = IntentHandlerDefaultLog();
  v73 = v72;
  if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_END, spid, "handleStartCall", "", buf, 2u);
  }

  v77[2](v77, v66);
}

- (void)sortFaceTimeHandles:(id)a3 faceTimeHandles:(id)a4 nonFaceTimeHandles:(id)a5
{
  id v8 = a3;
  id v24 = a4;
  id v23 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v26;
    *(void *)&long long v10 = 138412290;
    long long v22 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v15 = [(StartCallIntentHandler *)self faceTimeUtilities];
        uint64_t v31 = v14;
        v16 = +[NSArray arrayWithObjects:&v31 count:1];
        unsigned int v17 = [v15 isFaceTimeable:v16];

        v18 = IntentHandlerDefaultLog();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            *(_DWORD *)buf = v22;
            uint64_t v30 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "found a FaceTimeable personHandle: %@", buf, 0xCu);
          }

          id v20 = +[TUHandle normalizedHandleWithDestinationID:v14];
          v21 = v24;
        }
        else
        {
          if (v19)
          {
            *(_DWORD *)buf = v22;
            uint64_t v30 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "found a non-FaceTimeable personHandle: %@", buf, 0xCu);
          }

          id v20 = +[TUHandle normalizedHandleWithDestinationID:v14];
          v21 = v23;
        }
        [v21 addObject:v20];
      }
      id v11 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v11);
  }
}

- (void)extractHandlesFromIntent:(id)a3 faceTimeMemberHandles:(id)a4 nonFaceTimeMemberHandles:(id)a5
{
  id v7 = a3;
  id v36 = a4;
  id v35 = a5;
  id v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 contacts];
    *(_DWORD *)buf = 138412290;
    id v42 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Extracting Handles From Intent: %@", buf, 0xCu);
  }
  id v33 = v7;
  id v34 = objc_alloc_init((Class)NSMutableArray);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v10 = [v7 contacts];
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v16 = [v15 personHandle];
        unsigned int v17 = [v16 value];
        id v18 = [v17 length];

        if (v18)
        {
          BOOL v19 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v15 personHandle];
            id v21 = [v20 faceTimeType];
            *(_DWORD *)buf = 134218242;
            id v42 = v21;
            __int16 v43 = 2112;
            v44 = v15;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "faceTimeType is %ld for %@", buf, 0x16u);
          }
          long long v22 = [v15 personHandle];
          id v23 = [v22 faceTimeType];

          if (v23 == (id)2)
          {
            id v24 = [v15 personHandle];
            long long v25 = [v24 value];
            long long v26 = +[TUHandle normalizedHandleWithDestinationID:v25];
            long long v27 = v35;
          }
          else
          {
            if (v23 != (id)1)
            {
              if (v23) {
                continue;
              }
              id v24 = [v15 personHandle];
              long long v25 = [v24 value];
              [v34 addObject:v25];
              goto LABEL_18;
            }
            id v24 = [v15 personHandle];
            long long v25 = [v24 value];
            long long v26 = +[TUHandle normalizedHandleWithDestinationID:v25];
            long long v27 = v36;
          }
          [v27 addObject:v26];

LABEL_18:
          continue;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v12);
  }

  if ([v34 count])
  {
    long long v28 = [(StartCallIntentHandler *)self faceTimeUtilities];
    [v28 runIDSQueryForStartCallIntent:v34];

    uint64_t v30 = v35;
    id v29 = v36;
    [(StartCallIntentHandler *)self sortFaceTimeHandles:v34 faceTimeHandles:v36 nonFaceTimeHandles:v35];
  }
  else
  {
    uint64_t v31 = IntentHandlerDefaultLog();
    uint64_t v30 = v35;
    id v29 = v36;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Skipping IDS query lookup as all handles have been resolved.", buf, 2u);
    }
  }
}

- (id)responseForDialRequest:(id)a3 intent:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  long long v10 = IntentHandlerDefaultLog();
  id v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "responseForDialRequest", "", buf, 2u);
  }

  uint64_t v13 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v62 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Determining response for dial request: %@", buf, 0xCu);
  }

  if ([v7 preferredCallProvider] == (id)3
    && ([v7 destinationType] == (id)4 || objc_msgSend(v7, "destinationType") == (id)5))
  {
    uint64_t v14 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Redial/callback to 3P call history entry.", buf, 2u);
    }

    v15 = [(StartCallIntentHandler *)self appResolver];
    v16 = [(__CFString *)v6 bundleIdentifier];
    id v17 = [v15 appSupportsDeprecatedCallingIntents:v16];

    id v18 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = @"NO";
      if (v17) {
        CFStringRef v19 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v62 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "useDeprecatedCallingIntents: %@", buf, 0xCu);
    }

    uint64_t v20 = [(__CFString *)v6 userActivityUsingDeprecatedCallingIntents:v17];
  }
  else
  {
    uint64_t v20 = +[NSUserActivity makeActivityWithIntent:v7 dialRequestAttachment:v6];
  }
  id v21 = (void *)v20;
  long long v22 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:2 userActivity:v20];
  id v23 = [(StartCallIntentHandler *)self dataSource];
  id v24 = (char *)[v23 callFilterStatusForDialRequest:v6];

  if (v24 != (char *)3)
  {
    if ((unint64_t)(v24 - 1) <= 1)
    {
      long long v28 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100031848();
      }

      id v26 = objc_alloc((Class)INStartCallIntentResponse);
      long long v27 = (uint64_t *)&_INStartCallIntentResponseCodeFailureDownTimeRestrictionEnabled;
      goto LABEL_25;
    }
    if ([v7 _idiom] == (id)4)
    {
      id v34 = [(StartCallIntentHandler *)self dataSource];
      unsigned int v35 = [v34 callRinging];

      if (v35)
      {
        id v36 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10003187C();
        }

        id v26 = objc_alloc((Class)INStartCallIntentResponse);
        uint64_t v29 = 12;
        goto LABEL_26;
      }
    }
    if ([v7 _idiom] == (id)4)
    {
      long long v37 = [(StartCallIntentHandler *)self dataSource];
      unsigned int v38 = [v37 callsInProgress];

      if (v38)
      {
        long long v39 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_1000318B0();
        }

        id v26 = objc_alloc((Class)INStartCallIntentResponse);
        uint64_t v29 = 11;
        goto LABEL_26;
      }
    }
    os_signpost_id_t v60 = v9;
    long long v40 = [(__CFString *)v6 provider];
    if ([v40 isFaceTimeProvider]
      && ([(__CFString *)v6 isVideo] & 1) != 0)
    {
      id v41 = [(StartCallIntentHandler *)self dataSource];
      unsigned __int8 v42 = [v41 supportsFaceTimeVideoCalls];

      if ((v42 & 1) == 0)
      {
        __int16 v43 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_100031A90();
        }
        goto LABEL_69;
      }
    }
    else
    {
    }
    v44 = [(__CFString *)v6 provider];
    if ([v44 isFaceTimeProvider] && !-[__CFString isVideo](v6, "isVideo"))
    {
      v48 = [(StartCallIntentHandler *)self dataSource];
      unsigned __int8 v49 = [v48 supportsFaceTimeAudioCalls];

      if ((v49 & 1) == 0)
      {
        __int16 v43 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_100031A5C();
        }
        goto LABEL_69;
      }
    }
    else
    {
    }
    if (v21)
    {
      os_signpost_id_t v9 = v60;
      if (([(__CFString *)v6 isValid] & 1) != 0
        || _TUIsInternalInstall() && (TUShouldUseSuperboxTelephonyProvider() & 1) != 0)
      {
        v45 = [(__CFString *)v6 provider];
        unsigned int v46 = [v45 isTelephonyProvider];

        if (!v46) {
          goto LABEL_28;
        }
        if ([(__CFString *)v6 dialType] == (id)1)
        {
          uint64_t v30 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Emergency call requested, will always try to place the call, skipping provider and cellular service availability checks.", buf, 2u);
          }
          goto LABEL_27;
        }
        if ([v7 _idiom] == (id)3)
        {
          uint64_t v30 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            sub_100031918();
          }
          goto LABEL_27;
        }
        id v50 = [(StartCallIntentHandler *)self dataSource];
        unsigned __int8 v51 = [v50 supportsTelephonyCalls];

        if (v51)
        {
          v52 = [(StartCallIntentHandler *)self dataSource];
          unsigned __int8 v53 = [v52 canAttemptTelephonyCallsWithoutCellularConnection];

          if (v53) {
            goto LABEL_28;
          }
          id v54 = [(StartCallIntentHandler *)self dataSource];
          unsigned int v55 = [v54 isAirplaneModeEnabled];

          if (v55)
          {
            v56 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              sub_10003194C();
            }

            id v26 = objc_alloc((Class)INStartCallIntentResponse);
            uint64_t v29 = 8;
            goto LABEL_26;
          }
          uint64_t v30 = [(StartCallIntentHandler *)self dataSource];
          if (![v30 supportsPrimaryCalling]) {
            goto LABEL_27;
          }
          id v57 = [(StartCallIntentHandler *)self dataSource];
          v58 = [v57 coreTelephonyDataSource];
          unsigned __int8 v59 = [v58 isCellularServiceAvailable];

          if (v59)
          {
            os_signpost_id_t v9 = v60;
            goto LABEL_28;
          }
          __int16 v43 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_100031980();
          }
LABEL_69:

          uint64_t v30 = v22;
          long long v22 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:6 userActivity:0];
          os_signpost_id_t v9 = v60;
          goto LABEL_27;
        }
        v47 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_1000319B4();
        }
      }
      else
      {
        v47 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_1000319E8();
        }
      }
    }
    else
    {
      v47 = IntentHandlerDefaultLog();
      os_signpost_id_t v9 = v60;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_1000318E4();
      }
    }

    id v26 = objc_alloc((Class)INStartCallIntentResponse);
    uint64_t v29 = 4;
    goto LABEL_26;
  }
  long long v25 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100031814();
  }

  id v26 = objc_alloc((Class)INStartCallIntentResponse);
  long long v27 = (uint64_t *)&_INStartCallIntentResponseCodeFailureScreenTimeRestrictionEnabled;
LABEL_25:
  uint64_t v29 = *v27;
LABEL_26:
  uint64_t v30 = v22;
  long long v22 = [v26 initWithCode:v29 userActivity:0];
LABEL_27:

LABEL_28:
  uint64_t v31 = IntentHandlerDefaultLog();
  id v32 = v31;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v9, "responseForDialRequest", "", buf, 2u);
  }

  return v22;
}

- (id)responseForJoinRequest:(id)a3 intent:(id)a4 callProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = IntentHandlerDefaultLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = IntentHandlerDefaultLog();
  uint64_t v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "responseForJoinRequest", "", buf, 2u);
  }
  os_signpost_id_t spid = v12;

  v16 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Determining response for join request: %@", buf, 0xCu);
  }

  id v17 = +[NSUserActivity makeActivityWithIntent:v9 joinRequestAttachment:v8];
  id v18 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:2 userActivity:v17];
  CFStringRef v19 = [(StartCallIntentHandler *)self dataSource];
  uint64_t v20 = [v9 contacts];
  id v21 = [v19 restrictedContacts:v20 callProvider:v10];

  if (v21)
  {
    id v22 = [v21 count];
    id v23 = [v9 contacts];
    id v24 = [v23 count];

    if (v22 == v24)
    {
      long long v25 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100031B2C();
      }

      id v26 = objc_alloc((Class)INStartCallIntentResponse);
      uint64_t v27 = _INStartCallIntentResponseCodeFailureDownTimeRestrictionEnabled;
      goto LABEL_24;
    }
  }
  if ([v8 isVideoEnabled])
  {
    long long v28 = [(StartCallIntentHandler *)self dataSource];
    unsigned __int8 v29 = [v28 supportsFaceTimeVideoCalls];

    if ((v29 & 1) == 0)
    {
      id v33 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100031AF8();
      }
      goto LABEL_23;
    }
  }
  if (([v8 isVideoEnabled] & 1) == 0)
  {
    uint64_t v30 = [(StartCallIntentHandler *)self dataSource];
    unsigned __int8 v31 = [v30 supportsFaceTimeAudioCalls];

    if ((v31 & 1) == 0)
    {
      id v33 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100031AC4();
      }
LABEL_23:

      id v26 = objc_alloc((Class)INStartCallIntentResponse);
      uint64_t v27 = 6;
LABEL_24:
      id v34 = [v26 initWithCode:v27 userActivity:0];

      id v18 = v34;
      goto LABEL_25;
    }
  }
  if (!v17)
  {
    id v32 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000318E4();
    }

    id v26 = objc_alloc((Class)INStartCallIntentResponse);
    uint64_t v27 = 4;
    goto LABEL_24;
  }
LABEL_25:
  unsigned int v35 = IntentHandlerDefaultLog();
  id v36 = v35;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, spid, "responseForJoinRequest", "", buf, 2u);
  }

  return v18;
}

- (BOOL)isEmergencyCall:(id)a3
{
  id v4 = a3;
  if ([v4 destinationType] == (id)2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(StartCallIntentHandler *)self intentHasUnresolvedLocalEmergencyContact:v4];
  }

  return v5;
}

- (void)confirmStartCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v71 = (void (**)(id, id))a4;
  id v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = IntentHandlerDefaultLog();
  id v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "confirmStartCall", "", buf, 2u);
  }

  os_signpost_id_t v12 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v74 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Confirm start audio call: %@", buf, 0xCu);
  }
  os_signpost_id_t spid = v8;

  id v13 = [objc_alloc((Class)NSUserActivity) _initWithIntent:v6];
  id v14 = [objc_alloc((Class)TUJoinConversationRequest) initWithUserActivity:v13];
  v72 = v14;
  if (v14
    && ([v14 remoteMembers],
        unint64_t v15 = objc_claimAutoreleasedReturnValue(),
        id v16 = [v15 count],
        v15,
        (unint64_t)v16 >= 2))
  {
    id v17 = objc_alloc((Class)TUDialRequest);
    id v18 = [(StartCallIntentHandler *)self dataSource];
    [v18 providerManager];
    v19 = id v68 = v13;
    [(StartCallIntentHandler *)self dataSource];
    uint64_t v20 = v67 = v8 - 1;
    id v21 = [v20 contactsDataSource];
    id v22 = [(StartCallIntentHandler *)self dataSource];
    id v23 = [v22 senderIdentityClient];
    id v24 = [v17 initWithDialIntent:v6 providerManager:v19 contactsDataSource:v21 senderIdentityClient:v23];

    unint64_t v11 = v67;
    id v13 = v68;

    long long v25 = [(StartCallIntentHandler *)self dataSource];
    id v26 = [v6 contacts];
    uint64_t v27 = [v24 provider];
    long long v28 = [v25 restrictedContacts:v26 callProvider:v27];
  }
  else
  {
    long long v28 = 0;
  }
  if ([v6 preferredCallProvider] == (id)2)
  {
LABEL_17:
    if (!v28) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  unsigned __int8 v29 = [(StartCallIntentHandler *)self dataSource];
  if ([v29 isAirplaneModeEnabled])
  {
    id v30 = v13;
    unint64_t v31 = v11;
    unsigned int v32 = [(StartCallIntentHandler *)self isEmergencyCall:v6];
    if (v32
      && ([(StartCallIntentHandler *)self dataSource],
          id v13 = (id)objc_claimAutoreleasedReturnValue(),
          ([v13 canAttemptEmergencyCallsWithoutCellularConnection] & 1) == 0))
    {

      unint64_t v11 = v31;
      id v13 = v30;
    }
    else
    {
      id v33 = [(StartCallIntentHandler *)self dataSource];
      unsigned __int8 v34 = [v33 canAttemptTelephonyCallsWithoutCellularConnection];

      if (v32) {
      unint64_t v11 = v31;
      }
      id v13 = v30;
      if (v34) {
        goto LABEL_17;
      }
    }
    CFStringRef v62 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      sub_100031B60();
    }

    id v60 = objc_alloc((Class)INStartCallIntentResponse);
    uint64_t v61 = 8;
    goto LABEL_50;
  }

  if (!v28)
  {
LABEL_25:
    if ([(StartCallIntentHandler *)self intentHasUnresolvedLocalEmergencyContact:v6])
    {
      id v40 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v41 = "Even though destinationType is normal, user specifically asked for a emergency number";
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
        goto LABEL_44;
      }
      goto LABEL_44;
    }
    if ([v6 destinationType] == (id)4 || objc_msgSend(v6, "destinationType") == (id)5)
    {
      unsigned __int8 v42 = [v6 contacts];
      id v43 = [v42 count];

      if (v43 == (id)1)
      {
        id v69 = v13;
        v44 = [v6 contacts];
        v45 = [v44 firstObject];

        uint64_t v46 = [v45 personHandle];
        if (v46)
        {
          v47 = (void *)v46;
          v48 = self;
          unint64_t v49 = v11;
          id v50 = [v45 personHandle];
          uint64_t v51 = [v50 value];
          if (v51)
          {
            v52 = (void *)v51;
            unsigned __int8 v53 = [v45 personHandle];
            id v54 = [v53 value];
            unsigned int v55 = [(StartCallIntentHandler *)v48 isEmergencyHandle:v54];

            unint64_t v11 = v49;
            if (v55)
            {
              v56 = IntentHandlerDefaultLog();
              id v13 = v69;
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Contact to redial/call back is an emergency number. Requiring intent confirmation.", buf, 2u);
              }

              if ([v6 destinationType] == (id)4) {
                uint64_t v57 = 2;
              }
              else {
                uint64_t v57 = 3;
              }
              id v39 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:3 userActivity:0];
              [v39 setShouldDoEmergencyCountdown:&__kCFBooleanFalse];
              [v39 setConfirmationReason:v57];
LABEL_62:

              goto LABEL_52;
            }
          }
          else
          {

            unint64_t v11 = v49;
          }
        }
        v66 = IntentHandlerDefaultLog();
        id v13 = v69;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Contact to redial/call back is NOT an emergency number.", buf, 2u);
        }

        id v39 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:1 userActivity:0];
        [v39 setShouldDoEmergencyCountdown:&__kCFBooleanFalse];
        goto LABEL_62;
      }
    }
    if ([v6 destinationType] == (id)2)
    {
      id v40 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v41 = "Making an emergency call, sending UserConfirmationRequired with emergency flag = YES";
        goto LABEL_43;
      }
LABEL_44:

      id v58 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:3 userActivity:0];
      id v39 = v58;
      unsigned __int8 v59 = &__kCFBooleanTrue;
LABEL_51:
      [v58 setShouldDoEmergencyCountdown:v59];
      goto LABEL_52;
    }
    id v60 = objc_alloc((Class)INStartCallIntentResponse);
    uint64_t v61 = 1;
LABEL_50:
    id v58 = [v60 initWithCode:v61 userActivity:0];
    id v39 = v58;
    unsigned __int8 v59 = &__kCFBooleanFalse;
    goto LABEL_51;
  }
LABEL_20:
  if (![v28 count]) {
    goto LABEL_25;
  }
  id v35 = [v28 count];
  id v36 = [v6 contacts];
  id v37 = [v36 count];

  if (v35 >= v37) {
    goto LABEL_25;
  }
  unsigned int v38 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Join request was restricted due to some restrictions with some members (but not all).", buf, 2u);
  }

  id v39 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:3 userActivity:0];
  [v39 setConfirmationReason:_INStartCallIntentConfirmationReasonHasRestrictedContacts];
  [v39 setRestrictedContacts:v28];
LABEL_52:
  v63 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v74 = v39;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Calling completion block with response: %@", buf, 0xCu);
  }

  v64 = IntentHandlerDefaultLog();
  v65 = v64;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, spid, "confirmStartCall", "", buf, 2u);
  }

  v71[2](v71, v39);
}

- (void)resolveCallRecordToCallBackForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  os_signpost_id_t v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolving callRecordToCallBack for start call: %@", (uint8_t *)&v19, 0xCu);
  }

  id v9 = IntentHandlerDefaultLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  unint64_t v11 = IntentHandlerDefaultLog();
  os_signpost_id_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "resolveCallRecordToCallBack", "", (uint8_t *)&v19, 2u);
  }

  id v13 = [v6 callRecordFilter];

  if (v13)
  {
    id v14 = [(StartCallIntentHandler *)self recentCallRecordToRedialForIntent:v6];
    if (v14) {
      +[INStartCallCallRecordToCallBackResolutionResult successWithResolvedCallRecord:v14];
    }
    else {
    unint64_t v15 = +[INStartCallCallRecordToCallBackResolutionResult unsupportedForReason:1];
    }
  }
  else
  {
    unint64_t v15 = +[INStartCallCallRecordToCallBackResolutionResult notRequired];
  }
  id v16 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling completion block with result: %@", (uint8_t *)&v19, 0xCu);
  }

  id v17 = IntentHandlerDefaultLog();
  id v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v10, "resolveCallRecordToCallBack", "", (uint8_t *)&v19, 2u);
  }

  v7[2](v7, v15);
}

- (void)resolveDestinationTypeForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  os_signpost_id_t v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = IntentHandlerDefaultLog();
  unint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveDestinationType", "", (uint8_t *)&v31, 2u);
  }

  id v13 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138412290;
    unsigned int v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resolve destination type for start call: %@", (uint8_t *)&v31, 0xCu);
  }

  id v14 = &_s10Foundation17KeyPathComparatorV_5orderACyxGs0bC0Cyxqd__G_AA9SortOrderOtcSLRd__lufC_ptr;
  if ([v6 destinationType]) {
    +[INCallDestinationTypeResolutionResult successWithResolvedCallDestinationType:[v6 destinationType]];
  }
  else {
  unint64_t v15 = +[INCallDestinationTypeResolutionResult notRequired];
  }
  id v16 = [v6 contacts];
  if ([v16 count] != (id)1 || -[NSObject destinationType](v6, "destinationType") == (id)4)
  {
    id v17 = 0;
LABEL_12:

    goto LABEL_13;
  }
  id v27 = [v6 destinationType];

  if (v27 != (id)5)
  {
    id v16 = [v6 contacts];
    [v16 firstObject];
    unsigned __int8 v29 = v28 = v9;
    id v30 = [v29 personHandle];
    id v17 = [v30 value];

    os_signpost_id_t v9 = v28;
    id v14 = &_s10Foundation17KeyPathComparatorV_5orderACyxGs0bC0Cyxqd__G_AA9SortOrderOtcSLRd__lufC_ptr;
    goto LABEL_12;
  }
  id v17 = 0;
LABEL_13:
  if (![v17 length])
  {
    int v19 = IntentHandlerDefaultLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    LOWORD(v31) = 0;
    id v21 = "Could not determine if handle to dial is an emergency handle because handle has not yet been resolved";
    id v22 = v19;
    uint32_t v23 = 2;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v31, v23);
    goto LABEL_23;
  }
  unsigned int v18 = [(StartCallIntentHandler *)self isEmergencyHandle:v17];
  int v19 = IntentHandlerDefaultLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    if (!v20) {
      goto LABEL_23;
    }
    int v31 = 138412290;
    unsigned int v32 = v17;
    id v21 = "%@ is not an emergency handle. Do not need special resolving.";
    id v22 = v19;
    uint32_t v23 = 12;
    goto LABEL_22;
  }
  if (v20)
  {
    int v31 = 138412290;
    unsigned int v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ is an emergency handle. Resolving to an emergency call", (uint8_t *)&v31, 0xCu);
  }

  [v14[272] successWithResolvedCallDestinationType:2];
  v15 = int v19 = v15;
LABEL_23:

  id v24 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138412290;
    unsigned int v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Calling completion block with result: %@", (uint8_t *)&v31, 0xCu);
  }

  long long v25 = IntentHandlerDefaultLog();
  id v26 = v25;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v9, "resolveDestinationType", "", (uint8_t *)&v31, 2u);
  }

  v7[2](v7, v15);
}

- (id)resolutionResultForEmergency
{
  v2 = [(StartCallIntentHandler *)self dataSource];
  unsigned __int8 v3 = [v2 siriEmergencyServices];

  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        os_signpost_id_t v9 = v4;
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v11 = objc_alloc((Class)INPerson);
        id v12 = objc_alloc((Class)INPersonHandle);
        id v13 = [v10 handle];
        id v14 = [v13 value];
        unint64_t v15 = [v10 label];
        id v16 = [(StartCallIntentHandler *)self localizedEmergencyString:v15];
        id v17 = [v12 initWithValue:v14 type:2 label:v16 emergencyType:1];
        id v18 = [v11 initWithPersonHandle:v17 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];

        id v4 = v9;
        [v9 addObject:v18];
      }
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }

  if ((unint64_t)[v4 count] >= 2)
  {
    int v19 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "There are more than one number that could be dialed. Prompting to disambiguate between them using these people: %@", buf, 0xCu);
    }

    uint64_t v20 = +[INStartCallContactResolutionResult resolutionResultDisambiguationWithItemsToDisambiguate:v4];
LABEL_19:
    long long v25 = (void *)v20;
    goto LABEL_20;
  }
  id v21 = [v4 count];
  id v22 = IntentHandlerDefaultLog();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21 != (id)1)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARN] User asked to call emergency services. Emergency provider does not have multiple handles, and call can be completed without specifying one. Returning not required.", buf, 2u);
    }

    uint64_t v20 = +[INStartCallContactResolutionResult notRequired];
    goto LABEL_19;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Only a single emergency number to call. Resolving to that number.", buf, 2u);
  }

  id v24 = [v4 firstObject];
  long long v25 = +[INStartCallContactResolutionResult successWithResolvedPerson:v24];

LABEL_20:

  return v25;
}

- (void)resolveContactsForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  os_signpost_id_t v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = IntentHandlerDefaultLog();
  id v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveContacts", " enableTelemetry=YES ", buf, 2u);
  }

  id v13 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v102 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resolving contacts for start call intent: %@", buf, 0xCu);
  }

  if (![(StartCallIntentHandler *)self intentHasUnresolvedLocalEmergencyContact:v6])goto LABEL_27; {
  id v14 = [(StartCallIntentHandler *)self dataSource];
  }
  unint64_t v15 = [v14 providerManager];
  id v16 = [v15 emergencyProvider];
  id v17 = [v16 emergencyLabeledHandles];
  id v18 = [v17 count];

  BOOL v19 = (unint64_t)v18 >= 2;
  unint64_t v12 = v9 - 1;
  if (!v19)
  {
LABEL_27:
    switch((unint64_t)[v6 destinationType])
    {
      case 0uLL:
      case 1uLL:
        id v30 = [(StartCallIntentHandler *)self personResolutionResultsForIntent:v6];
        goto LABEL_71;
      case 2uLL:
        unint64_t v80 = v12;
        v48 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Resolution for emergency destination", buf, 2u);
        }

        unint64_t v49 = [v6 contacts];
        id v50 = [v49 firstObject];
        uint64_t v51 = [v50 personHandle];
        v52 = [v51 value];
        id v53 = [v52 length];

        id v54 = IntentHandlerDefaultLog();
        BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        if (v53)
        {
          v56 = v7;
          if (v55)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Intent's contact has a personHandle.value set on an emergency call. Resolving to that value.", buf, 2u);
          }

          id v57 = objc_alloc_init((Class)NSMutableArray);
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v58 = [v6 contacts];
          id v59 = [v58 countByEnumeratingWithState:&v85 objects:v97 count:16];
          if (v59)
          {
            id v60 = v59;
            uint64_t v61 = *(void *)v86;
            do
            {
              for (i = 0; i != v60; i = (char *)i + 1)
              {
                if (*(void *)v86 != v61) {
                  objc_enumerationMutation(v58);
                }
                v63 = +[INPersonResolutionResult successWithResolvedPerson:*(void *)(*((void *)&v85 + 1) + 8 * i)];
                [v57 addObject:v63];
              }
              id v60 = [v58 countByEnumeratingWithState:&v85 objects:v97 count:16];
            }
            while (v60);
          }

          id v30 = [v57 copy];
          uint64_t v7 = v56;
          unint64_t v12 = v80;
        }
        else
        {
          if (v55)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Intent's contact has no display name. Looking up the list of emergency handles available on this device", buf, 2u);
          }

          v72 = [(StartCallIntentHandler *)self resolutionResultForEmergency];
          v98 = v72;
          id v30 = +[NSArray arrayWithObjects:&v98 count:1];

          unint64_t v12 = v80;
        }
        goto LABEL_71;
      case 3uLL:
        v64 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Resolution not required for voicemail destination", buf, 2u);
        }

        v65 = +[INStartCallContactResolutionResult notRequired];
        v99 = v65;
        id v30 = +[NSArray arrayWithObjects:&v99 count:1];

        goto LABEL_71;
      case 4uLL:
      case 5uLL:
        unsigned __int8 v34 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Resolution for redial", buf, 2u);
        }

        id v35 = [(StartCallIntentHandler *)self recentCallRecordToRedialForIntent:v6];
        id v36 = v35;
        if (v35)
        {
          id v37 = [v35 participants];
          id v38 = [v37 count];

          if ((unint64_t)v38 >= 2)
          {
            unint64_t v79 = v12;
            v78 = v7;
            id v39 = v6;
            id v40 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v102 = v36;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "recentCall for group facetime: %@", buf, 0xCu);
            }

            id v41 = objc_alloc_init((Class)NSMutableArray);
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            unsigned __int8 v42 = [v36 participants];
            id v43 = [v42 countByEnumeratingWithState:&v81 objects:v96 count:16];
            if (v43)
            {
              id v44 = v43;
              uint64_t v45 = *(void *)v82;
              do
              {
                for (j = 0; j != v44; j = (char *)j + 1)
                {
                  if (*(void *)v82 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  v47 = +[INPersonResolutionResult successWithResolvedPerson:*(void *)(*((void *)&v81 + 1) + 8 * (void)j)];
                  [v41 addObject:v47];
                }
                id v44 = [v42 countByEnumeratingWithState:&v81 objects:v96 count:16];
              }
              while (v44);
            }

            id v30 = [v41 copy];
            id v6 = v39;
            uint64_t v7 = v78;
            unint64_t v12 = v79;
            goto LABEL_70;
          }
          unint64_t v67 = [v36 participants];
          id v68 = [v67 count];

          if (v68 == (id)1)
          {
            id v41 = [v36 participants];
            [v41 firstObject];
            v70 = unint64_t v69 = v12;
            v71 = +[INStartCallContactResolutionResult successWithResolvedPerson:v70];
            v95 = v71;
            id v30 = +[NSArray arrayWithObjects:&v95 count:1];

            unint64_t v12 = v69;
LABEL_70:

LABEL_71:
            [(StartCallIntentHandler *)self updateHandlerStateForContactResolutionResults:v30];
            id v74 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v102 = v30;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Calling completion block with resolution results: %@", buf, 0xCu);
            }

            id v75 = IntentHandlerDefaultLog();
            unint64_t v76 = v75;
            if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_END, v9, "resolveContacts", "", buf, 2u);
            }

            v7[2](v7, v30);
            goto LABEL_77;
          }
          v73 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
            sub_100031B94();
          }

          id v41 = +[INStartCallContactResolutionResult unsupportedForReason:7];
          id v93 = v41;
          v66 = &v93;
        }
        else
        {
          id v41 = +[INStartCallContactResolutionResult unsupportedForReason:6];
          id v94 = v41;
          v66 = &v94;
        }
        id v30 = +[NSArray arrayWithObjects:v66 count:1];
        goto LABEL_70;
      default:
        id v30 = 0;
        goto LABEL_71;
    }
  }
  v77 = v7;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v21 = [v6 contacts];
  id v22 = [v21 countByEnumeratingWithState:&v89 objects:v100 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v90;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(void *)v90 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v89 + 1) + 8 * (void)k);
        if ([(StartCallIntentHandler *)self isUnresolvedLocalEmergencyContact:v26])
        {
          uint64_t v27 = [(StartCallIntentHandler *)self resolutionResultForEmergency];
        }
        else
        {
          os_signpost_id_t v28 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v102 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WARN] Intent includes an emergency person and a non-emergency person. Returning success for non-emergency person so emergency person can be properly resolved. Person: %@", buf, 0xCu);
          }

          uint64_t v27 = +[INStartCallContactResolutionResult successWithResolvedPerson:v26];
        }
        long long v29 = (void *)v27;
        [v20 addObject:v27];
      }
      id v23 = [v21 countByEnumeratingWithState:&v89 objects:v100 count:16];
    }
    while (v23);
  }

  id v30 = [v20 copy];
  [(StartCallIntentHandler *)self updateHandlerStateForContactResolutionResults:v30];
  long long v31 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v102 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Detected foreign emergency label, calling completion block early: %@", buf, 0xCu);
  }

  long long v32 = IntentHandlerDefaultLog();
  id v33 = v32;
  uint64_t v7 = v77;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v9, "resolveContacts", "", buf, 2u);
  }

  v77[2](v77, v30);
LABEL_77:
}

- (void)resolveCallCapabilityForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  os_signpost_id_t v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = IntentHandlerDefaultLog();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveCallCapability", "", (uint8_t *)&v18, 2u);
  }

  unint64_t v12 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resolving call capability for start call intent: %@", (uint8_t *)&v18, 0xCu);
  }

  id v13 = [(StartCallIntentHandler *)self recentCallRecordToRedialForIntent:v6];
  id v14 = -[StartCallIntentHandler resolutionResultForCallCapability:idiom:withDisplayDisabled:](self, "resolutionResultForCallCapability:idiom:withDisplayDisabled:", -[StartCallIntentHandler inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:](self, "inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:", [v6 preferredCallProvider], v13, objc_msgSend(v6, "callCapability"), objc_msgSend(v6, "_idiom"), objc_msgSend(v6, "_isPrimaryDisplayDisabled"), objc_msgSend(v6, "_executionContext")), objc_msgSend(v6, "_idiom"), objc_msgSend(v6, "_isPrimaryDisplayDisabled"));
  unint64_t v15 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Returning call capability resolution result: %@", (uint8_t *)&v18, 0xCu);
  }

  id v16 = IntentHandlerDefaultLog();
  id v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v9, "resolveCallCapability", "", (uint8_t *)&v18, 2u);
  }

  v7[2](v7, v14);
}

- (int64_t)callCapabilityFromRecentCall:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v6 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      os_signpost_id_t v8 = "[WARN] Unable to infer callCapability from call to redial because the recent call was nil";
      os_signpost_id_t v9 = (uint8_t *)&v14;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
LABEL_13:
    int64_t v7 = 0;
    goto LABEL_14;
  }
  id v5 = [v3 mediaType];
  if (!v5)
  {
    id v6 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      os_signpost_id_t v8 = "[WARN] Unable to infer callCapability from call to redial because media type of that call was unknown.";
      os_signpost_id_t v9 = (uint8_t *)&v11;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (v5 == (id)2)
  {
    id v6 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v12 = 0;
      int64_t v7 = 2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Inferring video call capability from call to redial", v12, 2u);
    }
    else
    {
      int64_t v7 = 2;
    }
  }
  else
  {
    if (v5 != (id)1)
    {
      int64_t v7 = 0;
      goto LABEL_15;
    }
    id v6 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Inferring audio call capability from call to redial", buf, 2u);
    }
    int64_t v7 = 1;
  }
LABEL_14:

LABEL_15:
  return v7;
}

- (BOOL)shouldInferAudioCapabilityForRequestedCallCapability:(int64_t)a3 idiom:(int64_t)a4 isDisplayDisabled:(BOOL)a5
{
  if (a3 == 1
    || (BOOL v6 = [(StartCallIntentHandler *)self shouldForceAudioOnlyWithIdiom:a4 withDisplayDisabled:a5]))
  {
    int64_t v7 = [(StartCallIntentHandler *)self dataSource];
    unsigned __int8 v8 = [v7 supportsFaceTimeAudioCalls];

    LOBYTE(v6) = v8;
  }
  return v6;
}

- (int64_t)inferCallCapabilityForPreferredCallProvider:(int64_t)a3 recentCall:(id)a4 initialCallCapability:(int64_t)a5 idiom:(int64_t)a6 isDisplayDisabled:(BOOL)a7 executionContext:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  unint64_t v15 = v14;
  if (a5 && a8 == 1)
  {
    id v16 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Call capability is already set in plugin, no inferring needed", (uint8_t *)&v31, 2u);
    }
    goto LABEL_46;
  }
  int64_t v17 = a5;
  if (v14) {
    int64_t v17 = (int64_t)[v14 callCapability];
  }
  if (a8 == 1 && v17) {
    goto LABEL_34;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      int v18 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        id v19 = "Inferring audio callCapability because provider is Telephony.";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v31, 2u);
        goto LABEL_40;
      }
      goto LABEL_40;
    }
LABEL_34:
    if (a5 || v17 != 2) {
      goto LABEL_43;
    }
    if (![(StartCallIntentHandler *)self shouldForceAudioOnlyWithIdiom:a6 withDisplayDisabled:v9])
    {
      int64_t v17 = 2;
      goto LABEL_43;
    }
    int v18 = IntentHandlerDefaultLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    LOWORD(v31) = 0;
    id v19 = "Changing callCapability from video to audio because the current idiom only supports audio";
    goto LABEL_39;
  }
  if (a8 == 1)
  {
    id v20 = [(StartCallIntentHandler *)self dataSource];
    unsigned int v21 = [v20 supportsFaceTimeVideoCalls];

    if (!v21)
    {
      uint64_t v27 = [(StartCallIntentHandler *)self dataSource];
      unsigned int v28 = [v27 supportsFaceTimeAudioCalls];

      int v18 = IntentHandlerDefaultLog();
      BOOL v29 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v29)
        {
          LOWORD(v31) = 0;
          id v19 = "Inferring audio callCapability because provider is FaceTime and audio is supported";
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      if (!v29) {
        goto LABEL_33;
      }
      LOWORD(v31) = 0;
      id v22 = "[WARN] Unable to infer callCapability. Execution Context is assistantDialog. Provider is Facetime, but neith"
            "er facetime audio nor video calling are supported.";
      goto LABEL_32;
    }
    int v18 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      id v22 = "Inferring video callCapability because provider is FaceTime and video is supported.";
      int64_t v17 = 2;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v31, 2u);
      goto LABEL_33;
    }
    int64_t v17 = 2;
    goto LABEL_33;
  }
  if (a5 == 2)
  {
    id v23 = [(StartCallIntentHandler *)self dataSource];
    unsigned int v24 = [v23 supportsFaceTimeVideoCalls];

    if (v24)
    {
      int v18 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        int64_t v17 = 2;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Inferring video callCapability because provider is FaceTime, requested callCapability was video and video is supported.", (uint8_t *)&v31, 2u);
      }
      else
      {
        int64_t v17 = 2;
      }
      goto LABEL_41;
    }
  }
  unsigned int v25 = [(StartCallIntentHandler *)self shouldInferAudioCapabilityForRequestedCallCapability:a5 idiom:a6 isDisplayDisabled:v9];
  int v18 = IntentHandlerDefaultLog();
  BOOL v26 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v25)
  {
    if (v26)
    {
      LOWORD(v31) = 0;
      id v22 = "[WARN] Unable to infer callCapability. Execution Context is not assistantDialog. Provider is Facetime, but n"
            "either facetime audio nor video calling are supported.";
      goto LABEL_32;
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v26)
  {
    LOWORD(v31) = 0;
    id v19 = "Inferring audio callCapability because provider is FaceTime, request callCapability was audio and audio is supported";
    goto LABEL_39;
  }
LABEL_40:
  int64_t v17 = 1;
LABEL_41:

LABEL_43:
  id v16 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 134217984;
    int64_t v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Returning call Capability %ld", (uint8_t *)&v31, 0xCu);
  }
  a5 = v17;
LABEL_46:

  return a5;
}

- (id)resolutionResultForCallCapability:(int64_t)a3 idiom:(int64_t)a4 withDisplayDisabled:(BOOL)a5
{
  if (!a3)
  {
    id v5 = +[INStartCallCallCapabilityResolutionResult notRequired];
    goto LABEL_13;
  }
  if (a3 != 2)
  {
    if (a3 != 1)
    {
      id v5 = 0;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (![(StartCallIntentHandler *)self shouldForceAudioOnlyWithIdiom:a4 withDisplayDisabled:a5])
  {
    a3 = 2;
LABEL_12:
    id v5 = +[INStartCallCallCapabilityResolutionResult successWithResolvedCallCapability:](INStartCallCallCapabilityResolutionResult, "successWithResolvedCallCapability:", a3, a4, a5);
    goto LABEL_13;
  }
  BOOL v6 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100031BC8();
  }

  id v5 = +[INStartCallCallCapabilityResolutionResult unsupportedForReason:1];
LABEL_13:

  return v5;
}

- (BOOL)shouldForceAudioOnlyWithIdiom:(int64_t)a3 withDisplayDisabled:(BOOL)a4
{
  char v4 = __stack_chk_guard;
  if ((unint64_t)a3 <= 7)
  {
    BOOL v5 = a4;
    if (((1 << a3) & 0x47) == 0)
    {
      if (((1 << a3) & 0x38) != 0)
      {
        __int16 v11 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 134217984;
          int64_t v19 = a3;
          unint64_t v12 = "deviceIdiom %ld is an audio only device idiom.";
          id v13 = v11;
          uint32_t v14 = 12;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      id v16 = [(StartCallIntentHandler *)self dataSource];
      unsigned __int8 v17 = [v16 hasCamera];

      if ((v17 & 1) == 0)
      {
        __int16 v11 = IntentHandlerDefaultLog();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        LOWORD(v18) = 0;
        unint64_t v12 = "This Mac has no attached camera.";
        goto LABEL_14;
      }
    }
    unsigned __int8 v8 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      int64_t v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deviceIdiom %ld supports video calling.", (uint8_t *)&v18, 0xCu);
    }

    BOOL v9 = [(StartCallIntentHandler *)self dataSource];
    unsigned __int8 v10 = [v9 supportsFaceTimeVideoCalls];

    if (v10)
    {
      if (!v5)
      {
        char v4 = 0;
        return v4 & 1;
      }
      __int16 v11 = IntentHandlerDefaultLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      LOWORD(v18) = 0;
      unint64_t v12 = "Devices primary display is disabled, e.g. user is on carDND mode. ";
      goto LABEL_14;
    }
    __int16 v11 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      unint64_t v12 = "Call capabilities do not support FaceTime video calls";
LABEL_14:
      id v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_15;
    }
LABEL_16:

    char v4 = 1;
  }
  return v4 & 1;
}

- (BOOL)isGFTDisabledForChinaSKU:(id)a3
{
  id v4 = a3;
  if ([(StartCallIntentHandler *)self isChinaSKUDevice]
    && ([v4 isGroupCall],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 BOOLValue],
        v5,
        v6))
  {
    int64_t v7 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GroupFaceTime is disabled for China SKU devices", v10, 2u);
    }

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)resolveFaceTimeLinkForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolving faceTimeLink for start call intent: %@", buf, 0xCu);
  }

  BOOL v9 = IntentHandlerDefaultLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  __int16 v11 = IntentHandlerDefaultLog();
  unint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "resolveFaceTimeLink", " enableTelemetry=YES ", buf, 2u);
  }

  id v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472;
  id v37 = sub_100016980;
  id v38 = &unk_10004CFB0;
  os_signpost_id_t v40 = v10;
  id v13 = v7;
  id v39 = v13;
  uint32_t v14 = objc_retainBlock(&v35);
  if (objc_msgSend(v6, "preferredCallProvider", v35, v36, v37, v38) == (id)2)
  {
    if ([(StartCallIntentHandler *)self isFaceTimeInvitationEnabled])
    {
      unint64_t v15 = [v6 contacts];
      id v16 = [v15 count];

      if (v16)
      {
        unsigned __int8 v17 = +[NSMutableSet set];
        int v18 = +[NSMutableSet set];
        [(StartCallIntentHandler *)self extractHandlesFromIntent:v6 faceTimeMemberHandles:v17 nonFaceTimeMemberHandles:v18];
        if ([v18 count])
        {
          id v19 = [v6 _idiom];
          if ([v6 _idiom] != (id)4)
          {
            id v25 = [v6 _idiom];
            if (v19 != (id)3 && v25 != (id)6)
            {
              BOOL v26 = [(StartCallIntentHandler *)self faceTimeUtilities];
              uint64_t v27 = [v26 generateFaceTimeLink:v17];

              if (v27
                && ([v27 URL],
                    unsigned int v28 = objc_claimAutoreleasedReturnValue(),
                    [v28 absoluteString],
                    BOOL v29 = objc_claimAutoreleasedReturnValue(),
                    id v30 = [v29 length],
                    v29,
                    v28,
                    v30))
              {
                int v31 = [v27 URL];
                int64_t v32 = [v31 absoluteString];
                id v23 = +[INStringResolutionResult successWithResolvedString:v32];
              }
              else
              {
                id v33 = IntentHandlerDefaultLog();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Link generation failed and nil was returned. Setting empty string.", buf, 2u);
                }

                id v23 = +[INStringResolutionResult successWithResolvedString:&stru_10004D938];
              }
              unsigned __int8 v34 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v42 = v23;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Returning FaceTimeLink resolution result: %@", buf, 0xCu);
              }

              ((void (*)(void ***, void *))v14[2])(v14, v23);
              goto LABEL_22;
            }
          }
          id v20 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "This is watchOS or tvOS. Sending a placeholder string for returning unsupported dialog", buf, 2u);
          }

          uint64_t v21 = +[INStringResolutionResult successWithResolvedString:@"NoLinkGenerated"];
        }
        else
        {
          unsigned int v24 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No non-FaceTime handles found. Returning nil.", buf, 2u);
          }

          uint64_t v21 = +[INStringResolutionResult notRequired];
        }
        id v23 = (void *)v21;
        ((void (*)(void ***, uint64_t))v14[2])(v14, v21);
LABEL_22:

        goto LABEL_17;
      }
    }
  }
  id v22 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Returning empty string as this is a telephony call or featureflag is disabled or destinations was empty", buf, 2u);
  }

  id v23 = +[INStringResolutionResult successWithResolvedString:&stru_10004D938];
  ((void (*)(void ***, void *))v14[2])(v14, v23);
LABEL_17:
}

- (void)resolvePreferredCallProviderForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  BOOL v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = IntentHandlerDefaultLog();
  __int16 v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolvePreferredCallProvider", "", buf, 2u);
  }

  id v13 = IntentHandlerDefaultLog();
  uint32_t v14 = &off_100039000;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resolving call provider for start call intent: %@", buf, 0xCu);
  }

  id v15 = [v6 preferredCallProvider];
  if (v15)
  {
    id v16 = 0;
LABEL_8:
    if (v15 == (id)3)
    {
      uint64_t v28 = 3;
      goto LABEL_52;
    }
    if (v15 != (id)2)
    {
      if (v15 == (id)1)
      {
        uint64_t v61 = v16;
        unint64_t v62 = v9 - 1;
        os_signpost_id_t v17 = v9;
        int v18 = [(StartCallIntentHandler *)self globalEmergencyNumbers];
        id v19 = [v6 contacts];
        id v20 = [v19 firstObject];
        uint64_t v21 = [v20 personHandle];
        id v22 = [v21 value];
        char v23 = ([v18 containsObject:v22] & 1) != 0
           || [v6 destinationType] == (id)2;

        id v39 = [v6 _idiom];
        os_signpost_id_t v40 = [(StartCallIntentHandler *)self dataSource];
        unsigned __int8 v41 = [v40 supportsTelephonyCalls];

        if ((v23 & 1) != 0 || v39 == (id)3)
        {
          os_signpost_id_t v9 = v17;
          id v16 = v61;
          unint64_t v12 = v62;
          uint32_t v14 = &off_100039000;
          if ((v41 & 1) == 0)
          {
            id v43 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
              sub_100031C90(v39 == (id)3, v23, v43);
            }
          }
        }
        else
        {
          os_signpost_id_t v9 = v17;
          id v16 = v61;
          unint64_t v12 = v62;
          uint32_t v14 = &off_100039000;
          if ((v41 & 1) == 0)
          {
            id v42 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              sub_100031D20();
            }

            uint64_t v38 = 1;
            goto LABEL_47;
          }
        }
        uint64_t v28 = 1;
LABEL_52:
        uint64_t v27 = +[INStartCallPreferredCallProviderResolutionResult successWithResolvedPreferredCallProvider:v28];
        goto LABEL_53;
      }
LABEL_18:
      uint64_t v27 = +[INStartCallPreferredCallProviderResolutionResult notRequired];
LABEL_53:
      BOOL v26 = (void *)v27;
      goto LABEL_54;
    }
    int64_t v29 = -[StartCallIntentHandler inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:](self, "inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:", 2, v16, [v6 callCapability], objc_msgSend(v6, "_idiom"), objc_msgSend(v6, "_isPrimaryDisplayDisabled"), objc_msgSend(v6, "_executionContext"));
    id v30 = [(StartCallIntentHandler *)self faceTimeUtilities];
    unsigned __int8 v31 = [v30 isFaceTimeEnabledInSettings];

    if ((v31 & 1) == 0)
    {
      id v37 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100031EC0();
      }

      uint64_t v38 = 6;
      goto LABEL_47;
    }
    if (v29 == 2)
    {
      if (-[StartCallIntentHandler shouldForceAudioOnlyWithIdiom:withDisplayDisabled:](self, "shouldForceAudioOnlyWithIdiom:withDisplayDisabled:", [v6 _idiom], objc_msgSend(v6, "_isPrimaryDisplayDisabled")))
      {
        id v44 = [(StartCallIntentHandler *)self dataSource];
        unsigned int v45 = [v44 isFaceTimeVideoBlocked];

        if (v45)
        {
          uint64_t v36 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
LABEL_45:
          }
            sub_100031D54();
LABEL_46:

          uint64_t v38 = 4;
LABEL_47:
          uint64_t v27 = +[INStartCallPreferredCallProviderResolutionResult unsupportedForReason:v38];
          goto LABEL_53;
        }
        v56 = [(StartCallIntentHandler *)self dataSource];
        int v57 = [v56 supportsDisplayingFaceTimeVideoCalls];

        if (v57)
        {
          id v58 = [(StartCallIntentHandler *)self dataSource];
          unsigned __int8 v59 = [v58 isDirectFaceTimeVideoCallingCurrentlyAvailable];

          id v54 = IntentHandlerDefaultLog();
          BOOL v60 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
          if (v59)
          {
            if (v60) {
              sub_100031E24();
            }
            goto LABEL_68;
          }
          if (v60) {
            sub_100031E58();
          }
LABEL_79:

          uint64_t v38 = 5;
          goto LABEL_47;
        }
        uint64_t v46 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          goto LABEL_72;
        }
        goto LABEL_73;
      }
      if ([(StartCallIntentHandler *)self isGFTDisabledForChinaSKU:v6])
      {
        uint64_t v46 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_100031E8C();
        }
        goto LABEL_73;
      }
    }
    else if (v29 == 1)
    {
      int64_t v32 = [(StartCallIntentHandler *)self dataSource];
      unsigned __int8 v33 = [v32 supportsFaceTimeAudioCalls];

      if ((v33 & 1) == 0)
      {
        unsigned __int8 v34 = [(StartCallIntentHandler *)self dataSource];
        unsigned int v35 = [v34 isFaceTimeAudioBlocked];

        if (v35)
        {
          uint64_t v36 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          goto LABEL_46;
        }
        id v50 = [(StartCallIntentHandler *)self dataSource];
        int v51 = [v50 supportsDisplayingFaceTimeAudioCalls];

        if (v51)
        {
          v52 = [(StartCallIntentHandler *)self dataSource];
          unsigned __int8 v53 = [v52 isDirectFaceTimeAudioCallingCurrentlyAvailable];

          id v54 = IntentHandlerDefaultLog();
          BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
          if (v53)
          {
            if (v55) {
              sub_100031D88();
            }
LABEL_68:

LABEL_74:
            uint64_t v27 = +[INStartCallPreferredCallProviderResolutionResult unsupported];
            goto LABEL_53;
          }
          if (v55) {
            sub_100031DBC();
          }
          goto LABEL_79;
        }
        uint64_t v46 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
LABEL_72:
        }
          sub_100031DF0();
LABEL_73:

        goto LABEL_74;
      }
    }
    uint64_t v28 = 2;
    goto LABEL_52;
  }
  unsigned int v24 = [(StartCallIntentHandler *)self recentCallRecordToRedialForIntent:v6];
  id v16 = v24;
  if (!v24) {
    goto LABEL_18;
  }
  id v15 = [v24 preferredCallProvider];
  if (v15) {
    goto LABEL_8;
  }
  id v25 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100031BFC(v16, v25);
  }

  BOOL v26 = +[INStartCallPreferredCallProviderResolutionResult unsupported];
  if (!v26) {
    goto LABEL_18;
  }
LABEL_54:
  v47 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v14 + 442);
    id v64 = v26;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Returning call provider resolution result: %@", buf, 0xCu);
  }

  v48 = IntentHandlerDefaultLog();
  unint64_t v49 = v48;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v9, "resolvePreferredCallProvider", "", buf, 2u);
  }

  v7[2](v7, v26);
}

- (id)recentCallRecordToRedialForIntent:(id)a3
{
  id v4 = a3;
  if ([v4 destinationType] == (id)4 || objc_msgSend(v4, "destinationType") == (id)5)
  {
    BOOL v5 = IntentHandlerDefaultLog();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    id v7 = IntentHandlerDefaultLog();
    BOOL v8 = v7;
    unint64_t v9 = v6 - 1;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "recentCallToRedial", "", buf, 2u);
    }

    os_signpost_id_t v10 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100031F90();
    }

    __int16 v11 = [v4 callRecordToCallBack];

    if (v11)
    {
      unint64_t v12 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100031F5C();
      }

      id v13 = [v4 callRecordToCallBack];
    }
    else
    {
      uint32_t v14 = [v4 callRecordFilter];

      id v15 = IntentHandlerDefaultLog();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      if (v14)
      {
        unsigned int v35 = self;
        unint64_t v36 = v6 - 1;
        os_signpost_id_t v37 = v6;
        if (v16) {
          sub_100031F28();
        }

        os_signpost_id_t v17 = [RecentCallQuery alloc];
        int v18 = [v4 callRecordFilter];
        id v19 = [v18 participants];
        id v20 = [v4 destinationType];
        uint64_t v21 = [v4 callRecordFilter];
        id v22 = [v21 callTypes];
        char v23 = [v4 callRecordFilter];
        id v24 = [v23 callCapability];
        id v25 = [v4 callRecordFilter];
        BOOL v26 = -[RecentCallQuery initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:](v17, "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:", v19, v20, v22, v24, [v25 preferredCallProvider], 1);

        uint64_t v27 = [(StartCallIntentHandler *)v35 recentCallToRedialForQuery:v26];
        if (v27)
        {
          id v13 = [(StartCallIntentHandler *)v35 callRecordForRecentCall:v27];
        }
        else
        {
          id v13 = 0;
        }
        unint64_t v9 = v36;
        os_signpost_id_t v6 = v37;
      }
      else
      {
        if (v16) {
          sub_100031EF4();
        }

        uint64_t v39 = 0;
        [v4 recordTypeForRedialing];
        INCallRecordTypeGetBackingType();
        INCallRecordTypeOptionsAddBackingType();
        uint64_t v28 = [RecentCallQuery alloc];
        int64_t v29 = [v4 contacts];
        id v30 = -[RecentCallQuery initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:](v28, "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:", v29, [v4 destinationType], 0, objc_msgSend(v4, "callCapability"), objc_msgSend(v4, "preferredCallProvider"));

        unsigned __int8 v31 = [(StartCallIntentHandler *)self recentCallToRedialForQuery:v30];
        if (v31)
        {
          id v13 = [(StartCallIntentHandler *)self callRecordForRecentCall:v31];
        }
        else
        {
          id v13 = 0;
        }
      }
    }
    int64_t v32 = IntentHandlerDefaultLog();
    unsigned __int8 v33 = v32;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)uint64_t v38 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v6, "recentCallToRedial", "", v38, 2u);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)callRecordForRecentCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CallRecordConverter sharedInstance];
  id v18 = v4;
  os_signpost_id_t v6 = +[NSArray arrayWithObjects:&v18 count:1];

  id v7 = [(StartCallIntentHandler *)self dataSource];
  BOOL v8 = [v7 contactsDataSource];
  unint64_t v9 = [(StartCallIntentHandler *)self dataSource];
  os_signpost_id_t v10 = [v9 providerManager];
  __int16 v11 = [(StartCallIntentHandler *)self dataSource];
  unint64_t v12 = [v11 coreTelephonyDataSource];
  id v13 = [v12 allRelevantISOCountryCodes];
  uint32_t v14 = [v5 callRecordsForRecentCalls:v6 withContactsDataSource:v8 withCallProviderManager:v10 withCurrentISOCountryCodes:v13];

  if ([v14 count] == (id)1)
  {
    id v15 = [v14 objectAtIndexedSubscript:0];
  }
  else
  {
    BOOL v16 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100031FC4();
    }

    id v15 = 0;
  }

  return v15;
}

- (id)recentCallToRedialForQuery:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(StartCallIntentHandler *)self dataSource];
  os_signpost_id_t v6 = [v5 contactsDataSource];
  id v7 = [(StartCallIntentHandler *)self identifierToContactCache];
  BOOL v8 = [(StartCallIntentHandler *)self dataSource];
  unint64_t v9 = [v8 coreTelephonyDataSource];
  os_signpost_id_t v10 = [v4 predicateForRecentCallWithContactsDataSource:v6 contactIdentifierCache:v7 coreTelephonyDataSource:v9];

  __int16 v11 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100032060();
  }

  unint64_t v12 = IntentHandlerDefaultLog();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  uint32_t v14 = IntentHandlerDefaultLog();
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "callHistoryDBCallToRedial", "", buf, 2u);
  }

  BOOL v16 = [(StartCallIntentHandler *)self dataSource];
  os_signpost_id_t v17 = [v16 callHistoryDataSource];
  id v18 = [v17 callsWithPredicate:v10 limit:1 offset:0 batchSize:1];
  id v19 = [v18 firstObject];

  id v20 = IntentHandlerDefaultLog();
  uint64_t v21 = v20;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)id v24 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v13, "callHistoryDBCallToRedial", "", v24, 2u);
  }

  id v22 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100031FF8();
  }

  return v19;
}

- (id)emergencyTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unset";
  }
  else {
    return off_10004D148[a3];
  }
}

- (BOOL)intentHasUnresolvedLocalEmergencyContact:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "contacts", 0);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([(StartCallIntentHandler *)self isUnresolvedLocalEmergencyContact:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isUnresolvedLocalEmergencyContact:(id)a3
{
  id v3 = a3;
  id v4 = [v3 personHandle];
  if ([v4 emergencyType] == (id)1)
  {
    id v5 = [v3 personHandle];
    id v6 = [v5 value];
    BOOL v7 = [v6 length] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)globalEmergencyNumbers
{
  if (qword_100058950 != -1) {
    dispatch_once(&qword_100058950, &stru_10004CFD0);
  }
  v2 = (void *)qword_100058948;

  return v2;
}

- (id)personResolutionResultsForIntent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contacts];
  id v6 = [v4 callGroups];
  id v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(StartCallIntentHandler *)self resolveContactsFromCallGroups:v4];

    id v5 = (void *)v8;
  }
  v231 = v5;
  if ([v5 count])
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v279 = 0u;
    long long v280 = 0u;
    long long v281 = 0u;
    long long v282 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v279 objects:v301 count:16];
    v251 = v4;
    v247 = v10;
    if (!v11) {
      goto LABEL_209;
    }
    id v12 = v11;
    uint64_t v250 = *(void *)v280;
    uint64_t v234 = _INStartCallContactUnsupportedReasonForeignEmergencyDisambiguation;
    v239 = v9;
    v253 = self;
    while (1)
    {
      long long v13 = 0;
      id v248 = v12;
      do
      {
        if (*(void *)v280 != v250) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(NSObject **)(*((void *)&v279 + 1) + 8 * (void)v13);
        id v15 = [v14 personHandle];
        BOOL v16 = [v15 value];

        if ((unint64_t)[v10 count] < 2 || objc_msgSend(v4, "preferredCallProvider") == (id)2)
        {
          os_signpost_id_t v17 = [v14 personHandle];
          id v18 = [v17 emergencyType];

          if (v18 == (id)1)
          {
            id v19 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v14 personHandle];
              [v14 personHandle];
              uint64_t v21 = v14;
              id v22 = v4;
              char v23 = v16;
              v25 = id v24 = v13;
              -[StartCallIntentHandler emergencyTypeToString:](self, "emergencyTypeToString:", [v25 emergencyType]);
              v27 = id v26 = v9;
              *(_DWORD *)buf = 138412546;
              v287 = v20;
              __int16 v288 = 2112;
              id v289 = v27;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Handle has the LocalEmergency flag. Resolving success. %@ with type: %@", buf, 0x16u);

              long long v13 = v24;
              uint64_t v28 = v22;
              long long v14 = v21;

              id v9 = v26;
              id v4 = v28;
              BOOL v16 = v23;
              id v10 = v247;
            }

            int64_t v29 = +[INStartCallContactResolutionResult successWithResolvedPerson:v14];
            [v9 addObject:v29];
            goto LABEL_33;
          }
          v249 = v13;
          if (![v16 length])
          {
            uint64_t v46 = [(StartCallIntentHandler *)self featureFlags];
            if ([v46 crrFullRecommendation])
            {
              v47 = [v14 scoredAlternatives];

              if (v47)
              {
                int64_t v29 = [(StartCallIntentHandler *)self relayCRRRecommendationForPerson:v14 intent:v4];
                [v9 addObject:v29];
                id v12 = v248;
                goto LABEL_34;
              }
            }
            else
            {
            }
            v246 = v16;
            v48 = v9;
            unint64_t v49 = [ContactResolver alloc];
            id v50 = [(StartCallIntentHandler *)self dataSource];
            int v51 = [v50 contactsDataSource];
            v52 = [(StartCallIntentHandler *)self coreAnalyticsLogger];
            int64_t v29 = [(ContactResolver *)v49 initWithDataSource:v51 logger:v52];

            unsigned __int8 v53 = [(ContactResolver *)v29 matchingContactsForPerson:v14];
            if (![v53 count])
            {
              v96 = IntentHandlerDefaultLog();
              id v12 = v248;
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v287 = v14;
                _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Found no matching contact from siriMatches or name search, returning unsupported. Person: %@", buf, 0xCu);
              }

              v97 = +[INStartCallContactResolutionResult unsupportedForReason:1];
              [v48 addObject:v97];
              long long v13 = v249;
              goto LABEL_204;
            }
            id v54 = [v14 personHandle];
            uint64_t v55 = [v54 label];

            v242 = v14;
            v56 = [v14 personHandle];
            id v57 = [v56 type];

            uint64_t v254 = (uint64_t)v57;
            if (!v57 && [v4 preferredCallProvider] == (id)1)
            {
              id v58 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Requested handle type is unknown, but preferredCallProvider is phone. Inferring handle type of phone number.", buf, 2u);
              }
              uint64_t v254 = 2;
              goto LABEL_47;
            }
            if ([v4 preferredCallProvider] == (id)2)
            {
              id v58 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "PreferredCallProvider is faceTime. Inferring handle type of unknown to present both phone number and email address.", buf, 2u);
              }
              uint64_t v254 = 0;
LABEL_47:
            }
            v252 = v55;
            v241 = v29;
            id v59 = objc_alloc_init((Class)NSMutableDictionary);
            long long v275 = 0u;
            long long v276 = 0u;
            long long v277 = 0u;
            long long v278 = 0u;
            v243 = v53;
            BOOL v60 = [v53 allContacts];
            id v61 = [v60 countByEnumeratingWithState:&v275 objects:v299 count:16];
            if (v61)
            {
              id v62 = v61;
              uint64_t v63 = *(void *)v276;
              do
              {
                for (i = 0; i != v62; i = (char *)i + 1)
                {
                  if (*(void *)v276 != v63) {
                    objc_enumerationMutation(v60);
                  }
                  uint64_t v65 = *(void *)(*((void *)&v275 + 1) + 8 * i);
                  v66 = [(StartCallIntentHandler *)v253 dataSource];
                  unint64_t v67 = [v66 coreTelephonyDataSource];
                  id v68 = [v67 allRelevantISOCountryCodes];
                  unint64_t v69 = [(StartCallIntentHandler *)v253 _inPersonsFromContact:v65 withRequestedType:v254 requestedLabel:v252 isoCountryCodes:v68];

                  if ([v69 count]) {
                    [v59 setObject:v69 forKeyedSubscript:v65];
                  }
                }
                id v62 = [v60 countByEnumeratingWithState:&v275 objects:v299 count:16];
              }
              while (v62);
            }

            id v70 = [v59 copy];
            id v4 = v251;
            v71 = -[StartCallIntentHandler _applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:requestedHandleType:preferredCallProvider:](v253, "_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:requestedHandleType:preferredCallProvider:", v70, v254, [v251 preferredCallProvider]);

            unsigned __int8 v53 = v243;
            v72 = [[ContactSlotResolutionHelper alloc] initWithUnresolvedPerson:v242 availableContacts:v243];
            id v73 = objc_alloc_init((Class)NSSet);
            id v74 = [v242 extractRecommendation];
            v238 = v74;
            v244 = v73;
            if ([v74 contactsAvailableInPool:v243])
            {
              id v75 = [(StartCallIntentHandler *)v253 dataSource];
              unsigned int v76 = [v75 expectUpstreamContactRecommendation];

              if (v76)
              {
                v77 = IntentHandlerDefaultLog();
                long long v13 = v249;
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Native flow contact resolver enabled.", buf, 2u);
                }

                int64_t v29 = v241;
                switch((unint64_t)[v74 type])
                {
                  case 0uLL:
                    v78 = IntentHandlerDefaultLog();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v287 = v242;
                      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "NCR found no matches for person: %@", buf, 0xCu);
                    }

                    id v79 = +[INStartCallContactResolutionResult unsupportedForReason:1];
                    [v239 addObject:v79];
                    unint64_t v80 = 0;
                    goto LABEL_201;
                  case 1uLL:
                    v236 = v72;
                    v115 = [v74 contactIdentifiers];
                    v116 = [v115 firstObject];
                    v117 = [v243 contactWithId:v116];
                    v298 = v117;
                    +[NSArray arrayWithObjects:&v298 count:1];
                    unint64_t v80 = v118 = v74;

                    long long v81 = IntentHandlerDefaultLog();
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                    {
                      v119 = [v118 contactIdentifiers];
                      v120 = [v119 firstObject];
                      *(_DWORD *)buf = 138412290;
                      v287 = v120;
                      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Confident match found by NCR, uuid %@", buf, 0xCu);
                    }
                    v72 = v236;
                    goto LABEL_123;
                  case 2uLL:
                    v121 = [v74 contactIdentifiers];
                    long long v81 = [v121 firstObject];

                    v122 = [v243 contactWithId:v81];
                    v297 = v122;
                    unint64_t v80 = +[NSArray arrayWithObjects:&v297 count:1];

                    uint64_t v123 = +[NSSet setWithObject:v81];

                    v124 = IntentHandlerDefaultLog();
                    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v287 = v81;
                      _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "Low-confidence (needsConfirmation) match found by NCR, uuid %@", buf, 0xCu);
                    }

                    v244 = (void *)v123;
                    id v4 = v251;
                    goto LABEL_123;
                  case 3uLL:
                    v125 = [v74 contactIdentifiers];
                    long long v81 = [v243 contactsWithIds:v125];

                    if ([(StartCallIntentHandler *)v253 anyContactsHaveSameName:v81])
                    {
                      v126 = IntentHandlerDefaultLog();
                      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "NCR recommended needsDisambiguation for contacts, but some have the same name. Proceeding to handle disambiguation.", buf, 2u);
                      }

                      long long v81 = v81;
                      unint64_t v80 = v81;
                    }
                    else
                    {
                      v127 = [v74 contactIdentifiers];
                      v128 = [(ContactSlotResolutionHelper *)v72 buildDisambiguationResultForContacts:v127];

                      [(StartCallIntentHandler *)v253 parseEmergencyContacts:v247 usingExistingResult:v128];
                      v129 = [(StartCallIntentHandler *)v253 featureFlags];
                      unsigned int v130 = [v129 crrHandleRecommendation];

                      if (v130)
                      {
                        v131 = [v242 siriMatches];
                        uint64_t v132 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v131];

                        v128 = (void *)v132;
                      }
                      [v239 addObject:v128];
                      v133 = IntentHandlerDefaultLog();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v287 = v81;
                        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "needsDisambiguation recommended by NCR, uuids %@", buf, 0xCu);
                      }

                      unint64_t v80 = 0;
                    }
                    goto LABEL_123;
                  default:
                    unint64_t v80 = 0;
                    break;
                }
LABEL_203:

                v48 = v239;
                id v10 = v247;
                id v12 = v248;
                v97 = v252;
                self = v253;
LABEL_204:

                id v9 = v48;
                BOOL v16 = v246;
                goto LABEL_34;
              }
            }
            if ([v71 count] != (id)1)
            {
              if ([v243 count] == (id)1)
              {
                unint64_t v80 = [v243 allContacts];
                long long v81 = IntentHandlerDefaultLog();
                int64_t v29 = v241;
                if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_123;
                }
                v98 = [v80 firstObject];
                *(_DWORD *)buf = 138412290;
                v287 = v98;
                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Only one matching contact (regardless of requested handle): %@", buf, 0xCu);
              }
              else
              {
                v99 = [(StartCallIntentHandler *)v253 dataSource];
                unsigned int v100 = [v99 useLegacyContactResolution];

                int64_t v29 = v241;
                if (v100)
                {
                  v235 = v72;
                  v101 = IntentHandlerDefaultLog();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Using legacy contact resolution", buf, 2u);
                  }

                  id v79 = objc_alloc_init((Class)NSMutableArray);
                  long long v271 = 0u;
                  long long v272 = 0u;
                  long long v273 = 0u;
                  long long v274 = 0u;
                  id v102 = [v243 allContacts];
                  id v103 = [v102 countByEnumeratingWithState:&v271 objects:v296 count:16];
                  if (v103)
                  {
                    id v104 = v103;
                    uint64_t v105 = *(void *)v272;
                    do
                    {
                      for (j = 0; j != v104; j = (char *)j + 1)
                      {
                        if (*(void *)v272 != v105) {
                          objc_enumerationMutation(v102);
                        }
                        v107 = +[StartCallIntentHandlerUtilities inPersonFromContact:*(void *)(*((void *)&v271 + 1) + 8 * (void)j) handleValue:0 handleType:v254 handleLabel:v252];
                        [v79 addObject:v107];
                      }
                      id v104 = [v102 countByEnumeratingWithState:&v271 objects:v296 count:16];
                    }
                    while (v104);
                  }

                  v108 = IntentHandlerDefaultLog();
                  unsigned __int8 v53 = v243;
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
                  {
                    v109 = [v243 count];
                    *(_DWORD *)buf = 134218242;
                    v287 = v109;
                    __int16 v288 = 2112;
                    id v289 = v79;
                    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "Resolved to %ld contacts, asking the user to disambiguate among persons: %@", buf, 0x16u);
                  }

                  v110 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v79];
                  [v239 addObject:v110];

                  unint64_t v80 = 0;
                  int64_t v29 = v241;
                  v72 = v235;
                  goto LABEL_201;
                }
                v111 = [v243 allContacts];
                long long v81 = [(StartCallIntentHandler *)v253 resolvePreferredContactFromContacts:v111];

                id v112 = [v81 resolutionResultType];
                v113 = [v81 resolvedEntities];
                v98 = v113;
                switch((unint64_t)v112)
                {
                  case 0uLL:
                    v114 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Unexpected score based contact resolution result type." userInfo:0];
                    [v114 raise];
                    goto LABEL_120;
                  case 1uLL:
                    v114 = [v113 firstObject];
                    [v243 contactWithId:v114];
                    v134 = v232 = v98;
                    v295 = v134;
                    unint64_t v80 = +[NSArray arrayWithObjects:&v295 count:1];

                    v98 = v232;
                    goto LABEL_121;
                  case 2uLL:
                    v114 = [v113 firstObject];
                    uint64_t v135 = [(ContactSlotResolutionHelper *)v72 buildConfirmationResultForContact:v114 withReason:3];
                    goto LABEL_119;
                  case 3uLL:
                    v114 = [v243 contactsWithIds:v113];
                    if ([(StartCallIntentHandler *)v253 anyContactsHaveSameName:v114])
                    {
                      v136 = IntentHandlerDefaultLog();
                      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "ScoreBasedResolutionResult is Disambiguate, but some contacts have the same name. Proceeding to handle disambiguation.", buf, 2u);
                      }

                      v114 = v114;
                      unint64_t v80 = v114;
                    }
                    else
                    {
                      uint64_t v135 = [(ContactSlotResolutionHelper *)v72 buildDisambiguationResultForContacts:v98];
LABEL_119:
                      v137 = v98;
                      v138 = (void *)v135;
                      [v239 addObject:v135];

                      v98 = v137;
LABEL_120:
                      unint64_t v80 = 0;
                    }
LABEL_121:

                    break;
                  default:
                    unint64_t v80 = 0;
                    break;
                }
              }

              goto LABEL_123;
            }
            unint64_t v80 = [v71 allKeys];
            long long v81 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              long long v82 = [v80 firstObject];
              *(_DWORD *)buf = 138412290;
              v287 = v82;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Only one matching contact for requested handle -- proceeding to handle disambiguation: %@", buf, 0xCu);
            }
            int64_t v29 = v241;
LABEL_123:

            if (!v80 || ![v80 count])
            {
LABEL_202:
              long long v13 = v249;
              goto LABEL_203;
            }
            v139 = v72;
            id v79 = objc_alloc_init((Class)NSMutableArray);
            long long v267 = 0u;
            long long v268 = 0u;
            long long v269 = 0u;
            long long v270 = 0u;
            unint64_t v80 = v80;
            id v140 = [v80 countByEnumeratingWithState:&v267 objects:v294 count:16];
            if (v140)
            {
              id v141 = v140;
              uint64_t v142 = *(void *)v268;
              do
              {
                for (k = 0; k != v141; k = (char *)k + 1)
                {
                  if (*(void *)v268 != v142) {
                    objc_enumerationMutation(v80);
                  }
                  v144 = [v71 objectForKeyedSubscript:*(void *)(*((void *)&v267 + 1) + 8 * (void)k)];
                  [v79 addObjectsFromArray:v144];
                }
                id v141 = [v80 countByEnumeratingWithState:&v267 objects:v294 count:16];
              }
              while (v141);
            }
            v237 = v139;

            id v145 = [v79 copy];
            v146 = +[INPersonDeduplicator dedupeINPersons:v145];

            if ([v146 count]
              || ([v242 personHandle],
                  v166 = objc_claimAutoreleasedReturnValue(),
                  v166,
                  !v166))
            {
              v147 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
              {
                v148 = [v80 count];
                id v149 = [v146 count];
                *(_DWORD *)buf = 134218754;
                v287 = v148;
                __int16 v288 = 2048;
                id v289 = v149;
                __int16 v290 = 2112;
                v291 = v80;
                __int16 v292 = 2112;
                v293 = v146;
                _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "Resolved to %ld matching contacts with %ld matching handles. Contact: %@ Handles: %@", buf, 0x2Au);
              }

              v150 = v146;
              v151 = v251;
              unsigned __int8 v53 = v243;
              v152 = v244;
              v72 = v237;
            }
            else
            {
              v167 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
              {
                v168 = [v242 personHandle];
                *(_DWORD *)buf = 138412290;
                v287 = v168;
                _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_DEFAULT, "No valid matching handle is found for the resolved contacts and this handle has been requested: %@. will attempt additional matching handles from siri matches.", buf, 0xCu);
              }
              v150 = [(StartCallIntentHandler *)v253 generateAdditionalMatchingHandles:v242 resolvedContacts:v80 requestedHandleType:v254 requestedHandleLabel:v252];

              v169 = IntentHandlerDefaultLog();
              v72 = v237;
              v152 = v244;
              if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
              {
                v170 = v150;
                v171 = [v80 count];
                id v172 = [v170 count];
                *(_DWORD *)buf = 134218754;
                v287 = v171;
                v150 = v170;
                __int16 v288 = 2048;
                id v289 = v172;
                __int16 v290 = 2112;
                v291 = v80;
                __int16 v292 = 2112;
                v293 = v170;
                _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_DEFAULT, "Resolved to %ld matching contacts with %ld additional matching handles. Contact: %@ Handles: %@", buf, 0x2Au);
              }

              v151 = v251;
              unsigned __int8 v53 = v243;
              if ([v150 count] == (id)1)
              {
                v173 = IntentHandlerDefaultLog();
                int64_t v29 = v241;
                v233 = v150;
                if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                {
                  v174 = [v150 firstObject];
                  *(_DWORD *)buf = 138412546;
                  v287 = v252;
                  __int16 v288 = 2112;
                  id v289 = v174;
                  _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "%@ was requested but the contact doesn't an exact match. Using the only alternative instead: %@", buf, 0x16u);

                  v150 = v233;
                }

                v165 = [v150 firstObject];
                v175 = [(StartCallIntentHandler *)v253 resolutionResultForPersonWithResolvedHandleValue:v165];
                [v239 addObject:v175];

                goto LABEL_166;
              }
            }
            v233 = v150;
            if (![v150 count])
            {
              v176 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "None of the resolved contacts have a valid matching handle. Offering all handles as alternatives", buf, 2u);
              }

              v165 = objc_alloc_init((Class)NSMutableArray);
              long long v263 = 0u;
              long long v264 = 0u;
              long long v265 = 0u;
              long long v266 = 0u;
              v177 = v80;
              id v178 = [v177 countByEnumeratingWithState:&v263 objects:v285 count:16];
              if (v178)
              {
                id v179 = v178;
                uint64_t v180 = *(void *)v264;
                do
                {
                  for (m = 0; m != v179; m = (char *)m + 1)
                  {
                    if (*(void *)v264 != v180) {
                      objc_enumerationMutation(v177);
                    }
                    v182 = -[StartCallIntentHandler getAlternativesForContact:forRequestedHandleType:forCallProvider:](v253, "getAlternativesForContact:forRequestedHandleType:forCallProvider:", *(void *)(*((void *)&v263 + 1) + 8 * (void)m), v254, [v251 preferredCallProvider]);
                    [v165 addObjectsFromArray:v182];
                  }
                  id v179 = [v177 countByEnumeratingWithState:&v263 objects:v285 count:16];
                }
                while (v179);
              }

              id v183 = [v165 copy];
              v184 = +[INPersonDeduplicator dedupeINPersons:v183];

              v185 = IntentHandlerDefaultLog();
              v151 = v251;
              if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_DEFAULT, "Offering all handles as alternatives", buf, 2u);
              }

              v186 = +[INStartCallContactResolutionResult resolutionResultUnsupportedWithReason:3 alternativeItems:v184];
              [v239 addObject:v186];

              int64_t v29 = v241;
              unsigned __int8 v53 = v243;
              v72 = v237;
LABEL_166:
              v187 = v233;
              id v4 = v151;
              goto LABEL_200;
            }
            v244 = v152;
            v153 = [(StartCallIntentHandler *)v253 featureFlags];
            unsigned int v154 = [v153 crrHandleRecommendation];

            int64_t v29 = v241;
            if (v154)
            {
              v155 = IntentHandlerDefaultLog();
              id v4 = v151;
              if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
              {
                v156 = [v242 siriMatches];
                *(_DWORD *)buf = 138412290;
                v287 = v156;
                _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "Using CRR based recommendation results: %@", buf, 0xCu);
              }
              v157 = [v242 siriMatches];
              id v158 = [v157 count];

              if (v158)
              {
                v159 = [v242 siriMatches];
                id v160 = [v159 count];

                if (v160 == (id)1)
                {
                  v161 = [v242 siriMatches];
                  v162 = [v161 firstObject];

                  v163 = IntentHandlerDefaultLog();
                  if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v287 = v162;
                    _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "Resolved to one CRR recommended handle: %@", buf, 0xCu);
                  }

                  v164 = [v80 firstObject];
                  v165 = [(StartCallIntentHandler *)v253 resolutionResultForPersonWithResolvedContactName:v242 resolvedPerson:v162 resolvedContact:v164 contactIdentifiersRequiringConfirmation:v244];

                  goto LABEL_178;
                }
                v192 = IntentHandlerDefaultLog();
                v72 = v237;
                if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
                {
                  v193 = [v242 siriMatches];
                  *(_DWORD *)buf = 138412290;
                  v287 = v193;
                  _os_log_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_DEFAULT, "Resolved to more than one CRR recommended handle: %@", buf, 0xCu);
                }
                v162 = [v242 siriMatches];
                v165 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v162];
              }
              else
              {
                v165 = +[INStartCallContactResolutionResult unsupportedForReason:1];
                v162 = IntentHandlerDefaultLog();
                if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEFAULT, "No resolution result resolved, adding an unsupported result", buf, 2u);
                }
LABEL_178:
                v72 = v237;
              }
              v187 = v233;

              [v239 addObject:v165];
              unsigned __int8 v53 = v243;
LABEL_200:

LABEL_201:
              goto LABEL_202;
            }
            v187 = v233;
            id v4 = v151;
            if ([v233 count] == (id)1)
            {
              v165 = [v233 firstObject];
              v188 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v287 = v165;
                _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_DEFAULT, "Resolved to one handle: %@", buf, 0xCu);
              }

              v189 = [v80 firstObject];
              v190 = [(StartCallIntentHandler *)v253 resolutionResultForPersonWithResolvedContactName:v242 resolvedPerson:v165 resolvedContact:v189 contactIdentifiersRequiringConfirmation:v244];

              [v239 addObject:v190];
              unsigned __int8 v53 = v243;
              goto LABEL_171;
            }
            if ([v151 preferredCallProvider] == (id)2 || objc_msgSend(v151, "callCapability") == (id)2)
            {
              if ([v80 count] == (id)1)
              {
                uint64_t v191 = [v80 firstObject];
LABEL_187:
                v165 = v191;
                if (v191)
                {
                  if (-[StartCallIntentHandler requireScoreBasedResolutionForGFT:numberOfContactsCount:](v253, "requireScoreBasedResolutionForGFT:numberOfContactsCount:", -[NSObject count](v233, "count"), [v247 count])|| (-[StartCallIntentHandler featureFlags](v253, "featureFlags"), v195 = objc_claimAutoreleasedReturnValue(), unsigned int v196 = objc_msgSend(v195, "faceTimeNoFanOutEnabled"), v195, v196))
                  {
                    v197 = IntentHandlerDefaultLog();
                    if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v287 = v233;
                      _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_DEFAULT, "Facetime call contact resolved to multiple handles. Using score based resolution model to resolve handles: %@", buf, 0xCu);
                    }

                    v198 = [(StartCallIntentHandler *)v253 resolvePreferredHandleFromHandles:v233 contactIdentifiersRequiringConfirmation:v244 telephonyOnly:0];
                    [v239 addObject:v198];

                    v187 = v233;
                    unsigned __int8 v53 = v243;
                    v72 = v237;
                    goto LABEL_200;
                  }
                  v202 = +[StartCallIntentHandlerUtilities inPersonFromContact:v165 handleValue:0 handleType:v254 handleLabel:v252];
                  v203 = IntentHandlerDefaultLog();
                  if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v287 = v202;
                    _os_log_impl((void *)&_mh_execute_header, v203, OS_LOG_TYPE_DEFAULT, "Facetime call resolved to multiple handles for a distinct person, preserving ambiguity. Will ring all handles. Person: %@", buf, 0xCu);
                  }

                  v204 = [(StartCallIntentHandler *)v253 resolutionResultForPersonWithResolvedContactName:v242 resolvedPerson:v202 resolvedContact:v165 contactIdentifiersRequiringConfirmation:v244];
                  [v239 addObject:v204];

                  id v4 = v251;
                  unsigned __int8 v53 = v243;
                  v72 = v237;
LABEL_171:
                  v187 = v233;
                  goto LABEL_200;
                }
              }
              else if (+[StartCallIntentHandlerUtilities contactsShareHandleValue:v80])
              {
                v194 = IntentHandlerDefaultLog();
                if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v287 = v80;
                  _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEFAULT, "Resolved contacts all share a handle: treating them as the same person. Contacts: %@", buf, 0xCu);
                }

                uint64_t v191 = +[StartCallIntentHandlerUtilities contactWithMostHandles:v80];
                goto LABEL_187;
              }
              v199 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_DEFAULT, "Facetime call resolved to multiple contacts with the same name, none of which share a handle. Disambiguating between handles.", buf, 2u);
              }

              uint64_t v200 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v233];
            }
            else
            {
              v201 = IntentHandlerDefaultLog();
              if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v287 = v233;
                _os_log_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_DEFAULT, "Resolved to multiple handles, using score based resolution model to resolve handles: %@", buf, 0xCu);
              }

              uint64_t v200 = [(StartCallIntentHandler *)v253 resolvePreferredHandleFromHandles:v233 contactIdentifiersRequiringConfirmation:v244 telephonyOnly:1];
            }
            v165 = v200;
            [v239 addObject:v200];
            goto LABEL_200;
          }
          id v30 = v16;
          unsigned __int8 v31 = v9;
          v245 = v30;
          int64_t v32 = [(StartCallIntentHandler *)self globalEmergencyNumbers];
          unsigned __int8 v33 = [v14 personHandle];
          unsigned __int8 v34 = [v33 value];
          unsigned int v35 = [v32 containsObject:v34];

          unint64_t v36 = IntentHandlerDefaultLog();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (!v35)
          {
            if (v37)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Number is not on the global emergency numbers list", buf, 2u);
            }

            int64_t v29 = [(StartCallIntentHandler *)self resolutionResultForPersonWithResolvedHandleValue:v14];
            id v9 = v31;
            [v31 addObject:v29];
            long long v13 = v249;
LABEL_32:
            BOOL v16 = v245;
LABEL_33:
            id v12 = v248;
            goto LABEL_34;
          }
          if (v37)
          {
            uint64_t v38 = [v14 personHandle];
            uint64_t v39 = [v14 personHandle];
            os_signpost_id_t v40 = -[StartCallIntentHandler emergencyTypeToString:](self, "emergencyTypeToString:", [v39 emergencyType]);
            *(_DWORD *)buf = 138412546;
            v287 = v38;
            __int16 v288 = 2112;
            id v289 = v40;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Handle %@ is in the global emergency numbers list. EmergencyType is %@", buf, 0x16u);
          }
          unsigned __int8 v41 = [v14 personHandle];
          id v42 = [v41 emergencyType];

          id v43 = IntentHandlerDefaultLog();
          BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
          long long v13 = v249;
          if (v42)
          {
            id v9 = v31;
            if (v44)
            {
              *(_DWORD *)buf = 138412290;
              v287 = v14;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Number is on the global emergency numbers list, but INPersonHandle already has the emergencyType set: %@", buf, 0xCu);
            }

            int64_t v29 = [(StartCallIntentHandler *)self resolutionResultForPersonWithResolvedHandleValue:v14];
            [v31 addObject:v29];
            goto LABEL_32;
          }
          if (v44)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "It's unclear if the user literally wanted this number, or if they meant to call emergency services. Disambiguate between local and nonlocal emergency services.", buf, 2u);
          }

          id v83 = objc_alloc((Class)INPersonHandle);
          long long v84 = [v14 personHandle];
          long long v85 = [v84 value];
          long long v86 = [v14 personHandle];
          id v87 = [v86 type];
          long long v88 = [v14 personHandle];
          long long v89 = [v88 label];
          int64_t v29 = (ContactResolver *)[v83 initWithValue:v85 type:v87 label:v89 emergencyType:2];

          id v90 = [objc_alloc((Class)INPerson) initWithPersonHandle:v29 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
          id v91 = [objc_alloc((Class)INPersonHandle) initWithValue:&stru_10004D938 type:2 label:0 emergencyType:1];
          id v92 = [objc_alloc((Class)INPerson) initWithPersonHandle:v91 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
          v300[0] = v90;
          v300[1] = v92;
          id v93 = +[NSArray arrayWithObjects:v300 count:2];
          id v94 = +[INStartCallContactResolutionResult resolutionResultUnsupportedWithReason:v234 alternativeItems:v93];
          [v239 addObject:v94];

          v95 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v287 = v93;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Returning _INStartCallContactUnsupportedReasonForeignEmergencyDisambiguation with alternative items: %@", buf, 0xCu);
          }

          id v10 = v247;
          id v12 = v248;
          self = v253;
          long long v13 = v249;
          BOOL v16 = v245;
          id v4 = v251;
          id v9 = v239;
        }
        else
        {
          unsigned int v45 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Attempting to resolve more than one call participant. Returning multiple contacts unsupported for each recipient.", buf, 2u);
          }

          int64_t v29 = +[INStartCallContactResolutionResult unsupportedForReason:2];
          [v9 addObject:v29];
        }
LABEL_34:

        long long v13 = (char *)v13 + 1;
      }
      while (v13 != v12);
      id v205 = [v10 countByEnumeratingWithState:&v279 objects:v301 count:16];
      id v12 = v205;
      if (!v205)
      {
LABEL_209:

        v206 = [v9 copy];
        v207 = [v4 contacts];
        id v208 = [v207 count];

        if ((unint64_t)v208 < 2) {
          goto LABEL_235;
        }
        v209 = v4;
        id v210 = objc_alloc_init((Class)NSMutableArray);
        long long v259 = 0u;
        long long v260 = 0u;
        long long v261 = 0u;
        long long v262 = 0u;
        id v211 = v9;
        id v212 = [v211 countByEnumeratingWithState:&v259 objects:v284 count:16];
        if (!v212) {
          goto LABEL_222;
        }
        id v213 = v212;
        int v214 = 0;
        uint64_t v215 = *(void *)v260;
        while (1)
        {
          v216 = 0;
          uint64_t v217 = v214;
          do
          {
            if (*(void *)v260 != v215) {
              objc_enumerationMutation(v211);
            }
            v218 = *(void **)(*((void *)&v259 + 1) + 8 * (void)v216);
            if ([v218 resolutionResultCode])
            {
              if ([v247 count] <= (char *)v216 + v217) {
                goto LABEL_220;
              }
              uint64_t v219 = [v247 objectAtIndexedSubscript:(char *)v216 + v217];
            }
            else
            {
              uint64_t v219 = [v218 resolvedValue];
            }
            v220 = (void *)v219;
            [v210 addObject:v219];

LABEL_220:
            v216 = (char *)v216 + 1;
          }
          while (v213 != v216);
          id v213 = [v211 countByEnumeratingWithState:&v259 objects:v284 count:16];
          int v214 = v217 + v216;
          if (!v213)
          {
LABEL_222:
            id v240 = v211;

            [v209 setValue:v210 forKey:@"contacts"];
            long long v257 = 0u;
            long long v258 = 0u;
            long long v255 = 0u;
            long long v256 = 0u;
            v221 = [v209 contacts];
            id v222 = [v221 countByEnumeratingWithState:&v255 objects:v283 count:16];
            if (v222)
            {
              id v223 = v222;
              uint64_t v224 = *(void *)v256;
              do
              {
                for (n = 0; n != v223; n = (char *)n + 1)
                {
                  if (*(void *)v256 != v224) {
                    objc_enumerationMutation(v221);
                  }
                  v226 = *(NSObject **)(*((void *)&v255 + 1) + 8 * (void)n);
                  v227 = IntentHandlerDefaultLog();
                  if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v287 = v226;
                    _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_DEFAULT, "Updated contact in intent: %@", buf, 0xCu);
                  }
                }
                id v223 = [v221 countByEnumeratingWithState:&v255 objects:v283 count:16];
              }
              while (v223);
            }

            id v4 = v251;
            id v9 = v240;
            goto LABEL_235;
          }
        }
      }
    }
  }
  v228 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "Resolution needs a value for zero contacts", buf, 2u);
  }

  id v9 = +[INStartCallContactResolutionResult needsValue];
  id v302 = v9;
  v206 = +[NSArray arrayWithObjects:&v302 count:1];
LABEL_235:

  v229 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v287 = v206;
    _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_DEFAULT, "resolutionResults: %@", buf, 0xCu);
  }

  return v206;
}

- (id)relayCRRRecommendationForPerson:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "relaying CRR recommendations", buf, 2u);
  }

  id v9 = [v6 scoredAlternatives];
  if ([v9 count])
  {
    if ([v9 count] != (id)1)
    {
      id v22 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v9 count];
        *(_DWORD *)buf = 134217984;
        id v56 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found %ld candidates; returning disambiguate",
          buf,
          0xCu);
      }

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10001A800;
      v54[3] = &unk_10004CFF8;
      v54[4] = self;
      id v11 = objc_msgSend(v9, "tu_mapObjectsUsingBlock:", v54);
      uint64_t v24 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v11];
      goto LABEL_44;
    }
    id v10 = [v9 objectAtIndexedSubscript:0];
    id v11 = [v10 person];

    id v12 = [v9 objectAtIndexedSubscript:0];
    id v13 = [v12 recommendation];

    long long v14 = [v11 personHandle];
    id v15 = [v14 value];

    if (v15)
    {
      BOOL v16 = [v11 personHandle];
      id v17 = [v16 type];

      id v18 = [v11 personHandle];
      BOOL v19 = [v18 type] == (id)1 && objc_msgSend(v7, "preferredCallProvider") == (id)2;

      if (v17 == (id)2 || v19)
      {
        unint64_t v36 = [(StartCallIntentHandler *)self dataSource];
        BOOL v37 = [v36 coreTelephonyDataSource];
        uint64_t v38 = [v37 allRelevantISOCountryCodes];
        uint64_t v39 = objc_msgSend(v11, "tu_personWithFormattedHandleForISOCountryCodes:", v38);

        os_signpost_id_t v40 = [(StartCallIntentHandler *)self dataSource];
        unsigned __int8 v41 = [v39 personHandle];
        id v42 = [v41 value];
        LODWORD(v37) = [v40 isMMIOrUSSDNumber:v42];

        if (v37)
        {
          id v43 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v44 = [v39 personHandle];
            unsigned int v45 = [v44 value];
            *(_DWORD *)buf = 138412290;
            id v56 = v45;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Found 1 candidate with unsupported MMI or USSD handle %@", buf, 0xCu);
          }
          uint64_t v46 = +[INStartCallContactResolutionResult unsupportedForReason:5];
        }
        else
        {
          int v51 = IntentHandlerDefaultLog();
          BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v52)
            {
              *(_DWORD *)buf = 138412290;
              id v56 = v39;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Found 1 low-confidence candidate; returning confirm: %@",
                buf,
                0xCu);
            }

            uint64_t v46 = +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:v39];
          }
          else
          {
            if (v52)
            {
              *(_DWORD *)buf = 138412290;
              id v56 = v39;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Found 1 high-confidence candidate; returning success: %@",
                buf,
                0xCu);
            }

            uint64_t v46 = +[INStartCallContactResolutionResult successWithResolvedPerson:v39];
          }
        }
        uint64_t v21 = (void *)v46;
        id v11 = v39;
        goto LABEL_45;
      }
      unsigned __int8 v34 = IntentHandlerDefaultLog();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138412290;
      id v56 = v11;
      unsigned int v35 = "Found 1 candidate with an invalid handle type; returning unsupported. Person: %@";
      goto LABEL_42;
    }
    id v25 = [v6 personHandle];

    if (!v25)
    {
      unsigned __int8 v34 = IntentHandlerDefaultLog();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        uint64_t v24 = +[INStartCallContactResolutionResult unsupportedForReason:3];
LABEL_44:
        uint64_t v21 = (void *)v24;
LABEL_45:

        goto LABEL_46;
      }
      *(_DWORD *)buf = 138412290;
      id v56 = v11;
      unsigned int v35 = "Found 1 candidate with a no handle; returning unsupported. Person: %@";
LABEL_42:
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
      goto LABEL_43;
    }
    id v26 = [(StartCallIntentHandler *)self dataSource];
    uint64_t v27 = [v26 contactsDataSource];
    uint64_t v28 = [v11 contactIdentifier];
    int64_t v29 = +[ContactResolver keysToFetch];
    id v30 = [v27 contactForIdentifier:v28 keysToFetch:v29];

    unsigned __int8 v31 = [v6 personHandle];
    uint64_t v32 = (uint64_t)[v31 type];

    if (v32 || [v7 preferredCallProvider] != (id)1)
    {
      if ([v7 preferredCallProvider] != (id)2)
      {
LABEL_33:
        v47 = -[StartCallIntentHandler getAlternativesForContact:forRequestedHandleType:forCallProvider:](self, "getAlternativesForContact:forRequestedHandleType:forCallProvider:", v30, v32, [v7 preferredCallProvider]);
        id v48 = [v47 copy];
        unint64_t v49 = +[INPersonDeduplicator dedupeINPersons:v48];

        id v50 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Found 1 candidate with no matching handle; offering other handles as alternatives",
            buf,
            2u);
        }

        uint64_t v21 = +[INStartCallContactResolutionResult resolutionResultUnsupportedWithReason:3 alternativeItems:v49];

        goto LABEL_45;
      }
      unsigned __int8 v33 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "PreferredCallProvider is faceTime. Inferring handle type of unknown to present both phone number and email address.", buf, 2u);
      }
      uint64_t v32 = 0;
    }
    else
    {
      unsigned __int8 v33 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v32 = 2;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Requested handle type is unknown, but preferredCallProvider is phone. Inferring handle type of phone number.", buf, 2u);
      }
      else
      {
        uint64_t v32 = 2;
      }
    }

    goto LABEL_33;
  }
  id v20 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No candidates from CRR. Returning unsupported. Person: %@", buf, 0xCu);
  }

  uint64_t v21 = +[INStartCallContactResolutionResult unsupportedForReason:1];
LABEL_46:

  return v21;
}

- (BOOL)requireScoreBasedResolutionForGFT:(unint64_t)a3 numberOfContactsCount:(unint64_t)a4
{
  return a3 > 1 && a4 > 1;
}

- (void)parseEmergencyContacts:(id)a3 usingExistingResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] == (id)1)
  {
    id v7 = [v5 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 displayName];
    if ([v8 isEqualToString:@"emergency contact"])
    {
      id v9 = [v5 objectAtIndexedSubscript:0];
      id v10 = [v9 alternatives];
      id v11 = [v10 count];
      id v12 = [v6 disambiguationItems];
      id v13 = [v12 count];

      if (v11 == v13)
      {
        long long v14 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Emergency contacts detected. Inserting personHandles.", v26, 2u);
        }

        id v15 = [v6 disambiguationItems];
        id v16 = [v15 count];

        if (v16)
        {
          unint64_t v17 = 0;
          do
          {
            id v18 = [v6 disambiguationItems];
            BOOL v19 = [v18 objectAtIndexedSubscript:v17];

            id v20 = [v5 objectAtIndexedSubscript:0];
            uint64_t v21 = [v20 alternatives];
            id v22 = [v21 objectAtIndexedSubscript:v17];

            id v23 = [v22 personHandle];
            [v19 setPersonHandle:v23];

            ++v17;
            uint64_t v24 = [v6 disambiguationItems];
            id v25 = [v24 count];
          }
          while ((unint64_t)v25 > v17);
        }
      }
    }
    else
    {
    }
  }
}

- (id)generateAdditionalMatchingHandles:(id)a3 resolvedContacts:(id)a4 requestedHandleType:(int64_t)a5 requestedHandleLabel:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v43 = objc_msgSend(a3, "tu_matchingINPersonHandlesByContactIdentifier");
  id v48 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v42 = [INPersonHandleLabelMobile isEqualToString:v10];
  uint64_t v38 = v10;
  unsigned int v41 = [INPersonHandleLabeliPhone isEqualToString:v10];
  if ((v41 & 1) != 0 || v42)
  {
    id v11 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Either a mobile handle or an iPhone label was requested without any matching handle. Checking if an alternative for mobile or iPhone handles exists.", buf, 2u);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v9;
  id v44 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v44)
  {
    uint64_t v40 = *(void *)v55;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v55 != v40) {
          objc_enumerationMutation(obj);
        }
        unint64_t v49 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v13 = [v49 identifier];
        long long v14 = [v43 objectForKeyedSubscript:v13];

        if (v14)
        {
          unsigned int v45 = v14;
          uint64_t v46 = i;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v51;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v51 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
                if (v20)
                {
                  uint64_t v21 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) label];

                  if (v21)
                  {
                    id v22 = [v20 label];
                    id v23 = [(StartCallIntentHandler *)self dataSource];
                    uint64_t v24 = [v23 coreTelephonyDataSource];
                    id v25 = [v24 allRelevantISOCountryCodes];
                    id v26 = [(StartCallIntentHandler *)self _inPersonsFromContact:v49 withRequestedType:a5 requestedLabel:v22 isoCountryCodes:v25];

                    [v48 addObjectsFromArray:v26];
                  }
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
            }
            while (v17);
          }

          long long v14 = v45;
          i = v46;
        }
        if (v41)
        {
          uint64_t v27 = [(StartCallIntentHandler *)self dataSource];
          uint64_t v28 = [v27 coreTelephonyDataSource];
          int64_t v29 = [v28 allRelevantISOCountryCodes];
          id v30 = [(StartCallIntentHandler *)self _inPersonsFromContact:v49 withRequestedType:a5 requestedLabel:INPersonHandleLabelMobile isoCountryCodes:v29];

          [v48 addObjectsFromArray:v30];
        }
        if (v42)
        {
          unsigned __int8 v31 = [(StartCallIntentHandler *)self dataSource];
          uint64_t v32 = [v31 coreTelephonyDataSource];
          unsigned __int8 v33 = [v32 allRelevantISOCountryCodes];
          unsigned __int8 v34 = [(StartCallIntentHandler *)self _inPersonsFromContact:v49 withRequestedType:a5 requestedLabel:INPersonHandleLabeliPhone isoCountryCodes:v33];

          [v48 addObjectsFromArray:v34];
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v44);
  }

  id v35 = [v48 copy];
  unint64_t v36 = +[INPersonDeduplicator dedupeINPersons:v35];

  return v36;
}

- (id)resolutionResultForPersonWithResolvedHandleValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 personHandle];
  id v6 = [v5 value];

  id v7 = [(StartCallIntentHandler *)self dataSource];
  unsigned int v8 = [v7 isMMIOrUSSDNumber:v6];

  if (v8)
  {
    id v9 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handle %@ is MMI or USSD which is unsupported. Returning error for person: %@", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v10 = +[INStartCallContactResolutionResult unsupportedForReason:5];
LABEL_9:
    long long v14 = (void *)v10;
    goto LABEL_13;
  }
  unsigned int v11 = [(StartCallIntentHandler *)self shouldRequireInvalidNumberConfirmationForRecipient:v4];
  id v12 = IntentHandlerDefaultLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "The user requested a potentially invalid phone number or email, returning confirmationRequired.", (uint8_t *)&v20, 2u);
    }

    uint64_t v10 = +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:v4 forReason:1];
    goto LABEL_9;
  }
  if (v13)
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There is a handle on the single contact. Format the person handle and return success with that person.", (uint8_t *)&v20, 2u);
  }

  id v15 = [(StartCallIntentHandler *)self dataSource];
  id v16 = [v15 coreTelephonyDataSource];
  id v17 = [v16 allRelevantISOCountryCodes];
  uint64_t v18 = objc_msgSend(v4, "tu_personWithFormattedHandleForISOCountryCodes:", v17);

  long long v14 = +[INStartCallContactResolutionResult successWithResolvedPerson:v18];

LABEL_13:

  return v14;
}

- (id)resolutionResultForPersonWithResolvedContactName:(id)a3 resolvedPerson:(id)a4 resolvedContact:(id)a5 contactIdentifiersRequiringConfirmation:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(StartCallIntentHandler *)self shouldRequireUnknownRecipientConfirmationForRequestedRecipient:a3 resolvedToRecipient:v10 contact:v11])
  {
    BOOL v13 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Returning confirmationRequired with person: %@", (uint8_t *)&v23, 0xCu);
    }

    id v14 = v10;
    uint64_t v15 = 4;
LABEL_9:
    uint64_t v20 = +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:v14 forReason:v15];
    goto LABEL_13;
  }
  id v16 = [v11 identifier];
  unsigned int v17 = [v12 containsObject:v16];

  uint64_t v18 = IntentHandlerDefaultLog();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      int v23 = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Returning confirmationRequired with person (as upstream contact resolver recommended): %@", (uint8_t *)&v23, 0xCu);
    }

    id v14 = v10;
    uint64_t v15 = 3;
    goto LABEL_9;
  }
  if (v19)
  {
    int v23 = 138412290;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Returning success with person: %@", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v20 = +[INStartCallContactResolutionResult successWithResolvedPerson:v10];
LABEL_13:
  uint64_t v21 = (void *)v20;

  return v21;
}

- (id)resolvePreferredHandleFromHandles:(id)a3 contactIdentifiersRequiringConfirmation:(id)a4 telephonyOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(StartCallIntentHandler *)self dataSource];
  unsigned int v11 = [v10 useLegacyHandleResolution];

  id v12 = IntentHandlerDefaultLog();
  BOOL v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Using legacy handle resolution.", buf, 2u);
    }

    id v14 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v8];
  }
  else
  {
    os_signpost_id_t v15 = os_signpost_id_generate(v12);

    id v16 = IntentHandlerDefaultLog();
    unsigned int v17 = v16;
    unint64_t v62 = v15 - 1;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "scoreBasedHandleResolution", "", buf, 2u);
    }
    os_signpost_id_t spid = v15;

    uint64_t v18 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Beginning score based handle resolution.", buf, 2u);
    }
    id v66 = v9;

    id v19 = objc_alloc_init((Class)NSMutableOrderedSet);
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    id v63 = v8;
    +[StartCallIntentHandlerUtilities populatePersonsByTUHandleFrom:v8 personsByTUHandle:v20 tuHandleOrderedSet:v19];
    id v61 = v19;
    uint64_t v21 = [v19 array];
    __int16 v22 = [[ScoreBasedResolver alloc] initWithEntities:v21];
    [(ScoreBasedResolver *)v22 setConfirmationEnabled:0];
    [(ScoreBasedResolver *)v22 setConfirmationMargin:2];
    [(ScoreBasedResolver *)v22 setSuccessfulResolutionMargin:4];
    [(StartCallIntentHandler *)self updateScoreBasedHandleResolver:v22 forRecentCallsMatchingHandles:v21 telephonyOnly:v5];
    id v64 = (void *)v21;
    [(StartCallIntentHandler *)self updateScoreBasedHandleResolver:v22 forFavoritesAmongHandles:v21];
    uint64_t v65 = v22;
    int v23 = [(ScoreBasedResolver *)v22 result];
    id v24 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Completed score based handle resolution.", buf, 2u);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    unint64_t v67 = v23;
    id v25 = [v23 resolutionSummary];
    id v26 = [v25 countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v73;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v73 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          unsigned __int8 v31 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }
        id v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v72, v79, 16, spid);
      }
      while (v27);
    }

    uint64_t v32 = v67;
    switch((unint64_t)[v67 resolutionResultType])
    {
      case 0uLL:
        id v33 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Unexpected score based handle resolution result type." userInfo:0];
        [v33 raise];
        id v14 = 0;
        goto LABEL_53;
      case 1uLL:
        BOOL v37 = [v67 resolvedEntities];
        id v33 = [v37 firstObject];

        uint64_t v38 = [v20 objectForKeyedSubscript:v33];
        if (!v38)
        {
          uint64_t v39 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Persons matching resolved handle should not be nil." userInfo:0];
          [v39 raise];
        }
        if ((unint64_t)objc_msgSend(v38, "count", spid) >= 2)
        {
          uint64_t v40 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v38;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[WARN] More than one INPerson matches the same handle (e.g. multiple labels with the same number). As either handle will produce the same result, resolving to the first one. %@", buf, 0xCu);
          }
        }
        unsigned int v41 = [v38 firstObject];
        unsigned int v42 = [v41 contactIdentifier];
        if ([v9 containsObject:v42]) {
          +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:v41 forReason:2];
        }
        else {
        id v14 = +[INStartCallContactResolutionResult successWithResolvedPerson:v41];
        }
        id v35 = v61;
        unint64_t v34 = v62;

        id v8 = v63;
        goto LABEL_56;
      case 2uLL:
        id v43 = [v67 resolvedEntities];
        id v33 = [v43 firstObject];

        id v44 = [v20 objectForKeyedSubscript:v33];
        if (!v44)
        {
          unsigned int v45 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Persons matching handle to confirm should not be nil." userInfo:0];
          [v45 raise];
        }
        if ((unint64_t)objc_msgSend(v44, "count", spid) >= 2)
        {
          uint64_t v46 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v44;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[WARN] More than one INPerson matches the same handle (e.g. multiple labels with the same number). As either handle will produce the same result, confirming just the first one. %@", buf, 0xCu);
          }
        }
        v47 = [v44 firstObject];
        id v14 = +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:v47 forReason:2];

        goto LABEL_53;
      case 3uLL:
        id v33 = objc_alloc_init((Class)NSMutableArray);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v48 = [v67 resolvedEntities];
        id v49 = [v48 countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v69;
          do
          {
            for (j = 0; j != v50; j = (char *)j + 1)
            {
              if (*(void *)v69 != v51) {
                objc_enumerationMutation(v48);
              }
              long long v53 = objc_msgSend(v20, "objectForKeyedSubscript:", *(void *)(*((void *)&v68 + 1) + 8 * (void)j), spid);
              if (!v53)
              {
                long long v54 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Persons matching handle to disambiguate should not be nil." userInfo:0];
                [v54 raise];
              }
              if ((unint64_t)[v53 count] >= 2)
              {
                long long v55 = IntentHandlerDefaultLog();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v53;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[WARN] More than one INPerson matches the same handle (e.g. multiple labels with the same number). Including those multiples in the disambiguation list. %@", buf, 0xCu);
                }
              }
              [v33 addObjectsFromArray:v53];
            }
            id v50 = [v48 countByEnumeratingWithState:&v68 objects:v76 count:16];
          }
          while (v50);
        }

        id v56 = [v33 copy];
        id v14 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v56];

        id v9 = v66;
LABEL_53:
        id v35 = v61;
        unint64_t v34 = v62;
LABEL_56:

        unint64_t v36 = v64;
        uint64_t v32 = v67;
        break;
      default:
        id v14 = 0;
        unint64_t v34 = v62;
        id v35 = v61;
        unint64_t v36 = v64;
        break;
    }
    long long v57 = IntentHandlerDefaultLog();
    id v58 = v57;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, spid, "scoreBasedHandleResolution", "", buf, 2u);
    }
  }

  return v14;
}

- (id)allCountryCodesRelevantToCall:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = [v4 isoCountryCode];

  if ([v6 length]) {
    [v5 addObject:v6];
  }
  id v7 = [(StartCallIntentHandler *)self dataSource];
  id v8 = [v7 coreTelephonyDataSource];
  id v9 = [v8 allRelevantISOCountryCodes];
  [v5 addObjectsFromArray:v9];

  id v10 = [v5 array];

  return v10;
}

- (void)updateScoreBasedHandleResolver:(id)a3 forRecentCallsMatchingHandles:(id)a4 telephonyOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v45 = a4;
  id v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  unsigned int v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "recentCallsMatchingHandles", "", buf, 2u);
  }

  BOOL v13 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Beginning call recency for handles check.", buf, 2u);
  }

  id v14 = [(StartCallIntentHandler *)self recentCallsWithHandles:v45 telephonyOnly:v5];
  if ([v14 count])
  {
    unint64_t v36 = v9 - 1;
    os_signpost_id_t v37 = v9;
    uint64_t v38 = v7;
    id v51 = objc_alloc_init((Class)NSMutableOrderedSet);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v35 = v14;
    id obj = v14;
    id v42 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
    if (v42)
    {
      uint64_t v40 = *(void *)v66;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v66 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = v15;
          id v16 = *(void **)(*((void *)&v65 + 1) + 8 * v15);
          long long v52 = -[StartCallIntentHandler allCountryCodesRelevantToCall:](self, "allCountryCodesRelevantToCall:", v16, v35);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v49 = v16;
          id v44 = [v16 remoteParticipantHandles];
          id v47 = [v44 countByEnumeratingWithState:&v61 objects:v77 count:16];
          if (v47)
          {
            uint64_t v46 = *(void *)v62;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v62 != v46) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v48 = v17;
                uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * v17), "tu_tuHandle");
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                id v50 = v45;
                id v19 = [v50 countByEnumeratingWithState:&v57 objects:v76 count:16];
                if (v19)
                {
                  id v20 = v19;
                  uint64_t v21 = *(void *)v58;
                  do
                  {
                    for (i = 0; i != v20; i = (char *)i + 1)
                    {
                      if (*(void *)v58 != v21) {
                        objc_enumerationMutation(v50);
                      }
                      int v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                      long long v53 = 0u;
                      long long v54 = 0u;
                      long long v55 = 0u;
                      long long v56 = 0u;
                      id v24 = v52;
                      id v25 = [v24 countByEnumeratingWithState:&v53 objects:v75 count:16];
                      if (v25)
                      {
                        id v26 = v25;
                        uint64_t v27 = *(void *)v54;
                        while (2)
                        {
                          for (j = 0; j != v26; j = (char *)j + 1)
                          {
                            if (*(void *)v54 != v27) {
                              objc_enumerationMutation(v24);
                            }
                            uint64_t v29 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
                            if ([v23 isCanonicallyEqualToHandle:v18 isoCountryCode:v29])
                            {
                              id v30 = IntentHandlerDefaultLog();
                              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412802;
                                long long v70 = v23;
                                __int16 v71 = 2112;
                                long long v72 = v49;
                                __int16 v73 = 2112;
                                uint64_t v74 = v29;
                                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Handle %@ was a partipant in recent call %@ with country code %@.", buf, 0x20u);
                              }

                              [v51 addObject:v23];
                              goto LABEL_34;
                            }
                          }
                          id v26 = [v24 countByEnumeratingWithState:&v53 objects:v75 count:16];
                          if (v26) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_34:
                    }
                    id v20 = [v50 countByEnumeratingWithState:&v57 objects:v76 count:16];
                  }
                  while (v20);
                }

                uint64_t v17 = v48 + 1;
              }
              while ((id)(v48 + 1) != v47);
              id v47 = [v44 countByEnumeratingWithState:&v61 objects:v77 count:16];
            }
            while (v47);
          }

          uint64_t v15 = v43 + 1;
        }
        while ((id)(v43 + 1) != v42);
        id v42 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
      }
      while (v42);
    }

    unsigned __int8 v31 = [v51 array];
    id v7 = v38;
    [v38 addScore:6 forEntities:v31 reason:@"Call Recency"];

    unint64_t v12 = v36;
    os_signpost_id_t v9 = v37;
    id v14 = v35;
  }
  uint64_t v32 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Completed call recency for handles check.", buf, 2u);
  }

  id v33 = IntentHandlerDefaultLog();
  unint64_t v34 = v33;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v9, "recentCallsMatchingHandles", "", buf, 2u);
  }
}

- (void)updateScoreBasedHandleResolver:(id)a3 forFavoritesAmongHandles:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  id v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v9 = IntentHandlerDefaultLog();
  id v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v27 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "favoritesAmongHandles", "", buf, 2u);
  }

  unsigned int v11 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning favorites for handles check.", buf, 2u);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v30 = *(void *)v32;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v16 = [(StartCallIntentHandler *)self dataSource];
        uint64_t v17 = [v16 favoritesDataSource];
        uint64_t v18 = [(StartCallIntentHandler *)self dataSource];
        id v19 = [v18 coreTelephonyDataSource];
        id v20 = [v19 allRelevantISOCountryCodes];
        unsigned int v21 = [v17 hasFavoritesEntryForTelephonyCallWithPhoneNumber:v15 isoCountryCodes:v20];

        if (v21)
        {
          [v28 addScore:4 forEntity:v15 reason:@"Favorites entry for telephony call with this handle"];
        }
        else
        {
          __int16 v22 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v36 = v15;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No favorites entry for handle %@. No score adjustment.", buf, 0xCu);
          }
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v13);
  }

  int v23 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Completed favorites for handles check.", buf, 2u);
  }

  id v24 = IntentHandlerDefaultLog();
  id v25 = v24;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, spid, "favoritesAmongHandles", "", buf, 2u);
  }
}

- (id)resolvePreferredContactFromContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = IntentHandlerDefaultLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = v7;
  unint64_t v38 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "scoreBasedContactResolution", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;

  os_signpost_id_t v9 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning score based contact resolution.", buf, 2u);
  }

  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v18 = [v17 identifier];
        [v10 addObject:v18];
        [v11 setObject:v17 forKey:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v14);
  }

  id v19 = [ScoreBasedResolver alloc];
  id v20 = [v10 copy];
  unsigned int v21 = [(ScoreBasedResolver *)v19 initWithEntities:v20];

  [(ScoreBasedResolver *)v21 setConfirmationEnabled:0];
  [(ScoreBasedResolver *)v21 setConfirmationMargin:2];
  [(ScoreBasedResolver *)v21 setSuccessfulResolutionMargin:4];
  [(StartCallIntentHandler *)self updateScoreBasedContactResolver:v21 forRecentCallsMatchingContacts:v12];
  os_signpost_id_t v37 = v12;
  [(StartCallIntentHandler *)self updateScoreBasedContactResolver:v21 forFavoritesAmongContacts:v12];
  uint64_t v36 = v21;
  __int16 v22 = [(ScoreBasedResolver *)v21 result];
  int v23 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Completed score based contact resolution.", buf, 2u);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v35 = v22;
  id v24 = [v22 resolutionSummary];
  id v25 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
        uint64_t v30 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v48 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v26);
  }

  long long v31 = IntentHandlerDefaultLog();
  long long v32 = v31;
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, spid, "scoreBasedContactResolution", "", buf, 2u);
  }

  return v35;
}

- (void)updateScoreBasedContactResolver:(id)a3 forRecentCallsMatchingContacts:(id)a4
{
  id v49 = a3;
  id v5 = a4;
  os_signpost_id_t v6 = IntentHandlerDefaultLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  os_signpost_id_t v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v48 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "contactCallRecency", "", buf, 2u);
  }

  id v10 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Beginning call recency for contacts check.", buf, 2u);
  }

  id v58 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v63 = objc_alloc_init((Class)NSMutableDictionary);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = v5;
  id v70 = [obj countByEnumeratingWithState:&v95 objects:v111 count:16];
  if (v70)
  {
    id v68 = *(id *)v96;
    do
    {
      for (i = 0; i != v70; i = (char *)i + 1)
      {
        if (*(id *)v96 != v68) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        id v13 = [v12 allTUHandles];
        if ([v13 count])
        {
          [v58 addObjectsFromArray:v13];
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          id v14 = v13;
          id v15 = [v14 countByEnumeratingWithState:&v91 objects:v110 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v92;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v92 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v91 + 1) + 8 * (void)j);
                id v20 = [v63 objectForKeyedSubscript:v19];
                if (!v20)
                {
                  id v20 = objc_alloc_init((Class)NSMutableArray);
                  [v63 setObject:v20 forKeyedSubscript:v19];
                }
                [v20 addObject:v12];
              }
              id v16 = [v14 countByEnumeratingWithState:&v91 objects:v110 count:16];
            }
            while (v16);
          }
        }
      }
      id v70 = [obj countByEnumeratingWithState:&v95 objects:v111 count:16];
    }
    while (v70);
  }

  unsigned int v21 = [v58 array];
  __int16 v22 = [(StartCallIntentHandler *)self recentCallsWithHandles:v21 telephonyOnly:0];

  if ([v22 count])
  {
    id v23 = objc_alloc_init((Class)NSMutableOrderedSet);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v50 = v22;
    id v54 = [v50 countByEnumeratingWithState:&v87 objects:v109 count:16];
    if (v54)
    {
      uint64_t v52 = *(void *)v88;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v88 != v52) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = v24;
          id v25 = *(void **)(*((void *)&v87 + 1) + 8 * v24);
          long long v64 = [(StartCallIntentHandler *)self allCountryCodesRelevantToCall:v25];
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v56 = [v25 remoteParticipantHandles];
          id v59 = [v56 countByEnumeratingWithState:&v83 objects:v108 count:16];
          if (v59)
          {
            uint64_t v57 = *(void *)v84;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v84 != v57) {
                  objc_enumerationMutation(v56);
                }
                uint64_t v60 = v26;
                uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * v26), "tu_tuHandle");
                long long v79 = 0u;
                long long v80 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                id v61 = v58;
                id v66 = [v61 countByEnumeratingWithState:&v79 objects:v107 count:16];
                if (v66)
                {
                  uint64_t v65 = *(void *)v80;
                  long long v62 = v27;
                  do
                  {
                    for (k = 0; k != v66; k = (char *)k + 1)
                    {
                      if (*(void *)v80 != v65) {
                        objc_enumerationMutation(v61);
                      }
                      uint64_t v29 = *(void **)(*((void *)&v79 + 1) + 8 * (void)k);
                      long long v75 = 0u;
                      long long v76 = 0u;
                      long long v77 = 0u;
                      long long v78 = 0u;
                      id v69 = v64;
                      id v30 = [v69 countByEnumeratingWithState:&v75 objects:v106 count:16];
                      if (v30)
                      {
                        id v31 = v30;
                        uint64_t v32 = *(void *)v76;
                        while (2)
                        {
                          for (m = 0; m != v31; m = (char *)m + 1)
                          {
                            if (*(void *)v76 != v32) {
                              objc_enumerationMutation(v69);
                            }
                            uint64_t v34 = *(void *)(*((void *)&v75 + 1) + 8 * (void)m);
                            if ([v29 isCanonicallyEqualToHandle:v27 isoCountryCode:v34])
                            {
                              long long v67 = k;
                              id v35 = [v63 objectForKeyedSubscript:v29];
                              long long v71 = 0u;
                              long long v72 = 0u;
                              long long v73 = 0u;
                              long long v74 = 0u;
                              id v36 = [v35 countByEnumeratingWithState:&v71 objects:v105 count:16];
                              if (v36)
                              {
                                id v37 = v36;
                                uint64_t v38 = *(void *)v72;
                                do
                                {
                                  for (n = 0; n != v37; n = (char *)n + 1)
                                  {
                                    if (*(void *)v72 != v38) {
                                      objc_enumerationMutation(v35);
                                    }
                                    long long v40 = *(void **)(*((void *)&v71 + 1) + 8 * (void)n);
                                    long long v41 = IntentHandlerDefaultLog();
                                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_DWORD *)buf = 138412802;
                                      unsigned int v100 = v40;
                                      __int16 v101 = 2112;
                                      id v102 = v25;
                                      __int16 v103 = 2112;
                                      uint64_t v104 = v34;
                                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Contact %@ was a partipant in recent call %@ with isoCountryCode %@.", buf, 0x20u);
                                    }

                                    long long v42 = [v40 identifier];
                                    [v23 addObject:v42];
                                  }
                                  id v37 = [v35 countByEnumeratingWithState:&v71 objects:v105 count:16];
                                }
                                while (v37);
                              }

                              uint64_t v27 = v62;
                              k = v67;
                              goto LABEL_59;
                            }
                          }
                          id v31 = [v69 countByEnumeratingWithState:&v75 objects:v106 count:16];
                          if (v31) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_59:
                    }
                    id v66 = [v61 countByEnumeratingWithState:&v79 objects:v107 count:16];
                  }
                  while (v66);
                }

                uint64_t v26 = v60 + 1;
              }
              while ((id)(v60 + 1) != v59);
              id v59 = [v56 countByEnumeratingWithState:&v83 objects:v108 count:16];
            }
            while (v59);
          }

          uint64_t v24 = v55 + 1;
        }
        while ((id)(v55 + 1) != v54);
        id v54 = [v50 countByEnumeratingWithState:&v87 objects:v109 count:16];
      }
      while (v54);
    }

    long long v43 = [v23 array];
    [v49 addScore:6 forEntities:v43 reason:@"Call Recency"];
  }
  long long v44 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Completed call recency for contacts check.", buf, 2u);
  }

  long long v45 = IntentHandlerDefaultLog();
  long long v46 = v45;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, spid, "contactCallRecency", "", buf, 2u);
  }
}

- (id)recentCallsWithHandles:(id)a3 telephonyOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_signpost_id_t v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v9 = IntentHandlerDefaultLog();
  id v10 = v9;
  unint64_t v60 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "recentCallsWithHandles", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;

  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = [(StartCallIntentHandler *)self dataSource];
  id v13 = [v12 coreTelephonyDataSource];
  id v14 = [v13 allRelevantISOCountryCodes];
  id v15 = +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:v6 isoCountryCodes:v14];

  [v11 addObject:v15];
  if (v4) {
    +[CallHistoryDataSourcePredicate predicateForTelephonyCalls];
  }
  else {
  id v16 = +[CallHistoryDataSourcePredicate predicateForTelephonyOrFaceTimeCalls];
  }
  [v11 addObject:v16];

  uint64_t v17 = +[CallHistoryDataSourcePredicate predicateForCallsWithDurationLongerThanImmediateHangUp];
  [v11 addObject:v17];

  id v18 = [v11 copy];
  uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];

  id v20 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v62 = (uint64_t)v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Searching call history for one call matching predicate: %@", buf, 0xCu);
  }

  unsigned int v21 = IntentHandlerDefaultLog();
  os_signpost_id_t v22 = os_signpost_id_generate(v21);

  id v23 = IntentHandlerDefaultLog();
  uint64_t v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "callHistoryDBFirstRecencyCheck", "", buf, 2u);
  }

  id v25 = [(StartCallIntentHandler *)self dataSource];
  uint64_t v26 = [v25 callHistoryDataSource];
  uint64_t v27 = [v26 callsWithPredicate:v19 limit:1 offset:0 batchSize:1];
  id v28 = [v27 firstObject];

  uint64_t v29 = IntentHandlerDefaultLog();
  id v30 = v29;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v22, "callHistoryDBFirstRecencyCheck", "", buf, 2u);
  }

  id v31 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v62 = (uint64_t)v28;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Completed initial call history search with result: %@", buf, 0xCu);
  }

  if (v28)
  {
    uint64_t v32 = [v28 date];
    if (v32)
    {
      long long v33 = [(StartCallIntentHandler *)self dataSource];
      uint64_t v34 = [v33 now];
      [v32 timeIntervalSinceDate:v34];
      double v36 = v35;
    }
    else
    {
      double v36 = 0.0;
    }
    if (v36 * 4.0 <= -3600.0) {
      double v38 = v36 * 4.0;
    }
    else {
      double v38 = -3600.0;
    }
    long long v39 = [(StartCallIntentHandler *)self dataSource];
    long long v40 = [v39 now];
    long long v41 = [v40 dateByAddingTimeInterval:v38];

    long long v42 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v62 = (uint64_t)v41;
      __int16 v63 = 2048;
      double v64 = v36;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Calculated oldest relevant date of %@ based on most recent matching call %.0f seconds ago", buf, 0x16u);
    }

    long long v43 = +[CallHistoryDataSourcePredicate predicateForCallsAfterDate:v41 beforeDate:0];
    [v11 addObject:v43];

    id v44 = [v11 copy];
    long long v45 = +[NSCompoundPredicate andPredicateWithSubpredicates:v44];

    long long v46 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v62 = 25;
      __int16 v63 = 2112;
      double v64 = *(double *)&v45;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Searching call history for up to %ld calls matching predicate: %@", buf, 0x16u);
    }

    id v47 = IntentHandlerDefaultLog();
    os_signpost_id_t v48 = os_signpost_id_generate(v47);

    id v49 = IntentHandlerDefaultLog();
    id v50 = v49;
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "callHistoryDBSecondRecencyCheck", "", buf, 2u);
    }

    id v51 = [(StartCallIntentHandler *)self dataSource];
    uint64_t v52 = [v51 callHistoryDataSource];
    id v37 = [v52 callsWithPredicate:v45 limit:25 offset:0 batchSize:25];

    long long v53 = IntentHandlerDefaultLog();
    id v54 = v53;
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_END, v48, "callHistoryDBSecondRecencyCheck", "", buf, 2u);
    }

    uint64_t v55 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v62 = (uint64_t)v37;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Completed second call history search with result: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v32 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No matching call history for any of the requested handles. No score adjustment.", buf, 2u);
    }
    id v37 = &__NSArray0__struct;
  }

  id v56 = IntentHandlerDefaultLog();
  uint64_t v57 = v56;
  if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, spid, "recentCallsWithHandles", "", buf, 2u);
  }

  return v37;
}

- (void)updateScoreBasedContactResolver:(id)a3 forFavoritesAmongContacts:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  os_signpost_id_t v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v9 = IntentHandlerDefaultLog();
  id v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v26 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "favoritesAmongContacts", "", buf, 2u);
  }

  id v11 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning favorites for contacts check.", buf, 2u);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v18 = [(StartCallIntentHandler *)self dataSource];
        uint64_t v19 = [v18 favoritesDataSource];
        unsigned int v20 = [v19 hasFavoritesEntryForContact:v17];

        if (v20)
        {
          unsigned int v21 = [v17 identifier];
          [v27 addScore:4 forEntity:v21 reason:@"Favorites entry for this contact"];
        }
        else
        {
          unsigned int v21 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v33 = v17;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No favorites entry for contact %@. No score adjustment.", buf, 0xCu);
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v14);
  }

  os_signpost_id_t v22 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Completed favorites for contacts check.", buf, 2u);
  }

  id v23 = IntentHandlerDefaultLog();
  uint64_t v24 = v23;
  if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, spid, "favoritesAmongContacts", "", buf, 2u);
  }
}

- (void)updateHandlerStateForContactResolutionResults:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        os_signpost_id_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v9 resolutionResultCode] == (id)3)
        {
          id v10 = [v9 itemToConfirm];
          id v11 = v10;
          if (v10)
          {
            id v12 = [v10 personHandle];
            if (v12)
            {
              id v13 = +[TUHandle handleWithPerson:v11];
              if (v13)
              {
                id v14 = [(StartCallIntentHandler *)self handlesConfirmed];
                [v14 addObject:v13];
              }
            }
            uint64_t v15 = [v11 contactIdentifier];
            if ([v15 length])
            {
              id v16 = [(StartCallIntentHandler *)self contactIdentifiersConfirmed];
              [v16 addObject:v15];
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)getAlternativesForContact:(id)a3 forRequestedHandleType:(int64_t)a4 forCallProvider:(int64_t)a5
{
  id v8 = a3;
  os_signpost_id_t v9 = [(StartCallIntentHandler *)self dataSource];
  id v10 = [v9 coreTelephonyDataSource];
  id v11 = [v10 allRelevantISOCountryCodes];
  id v12 = [(StartCallIntentHandler *)self _inPersonsFromContact:v8 withRequestedType:a4 requestedLabel:0 isoCountryCodes:v11];

  id v13 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134217984;
    id v22 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found %ld alternatives when dropping label constraint.", (uint8_t *)&v21, 0xCu);
  }

  if (![v12 count])
  {
    if (a4 == 2 && a5 == 1)
    {
      id v14 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not dropping handle type constraint because the user requested a telephony call.", (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      uint64_t v15 = [(StartCallIntentHandler *)self dataSource];
      id v16 = [v15 coreTelephonyDataSource];
      long long v17 = [v16 allRelevantISOCountryCodes];
      long long v18 = [(StartCallIntentHandler *)self _inPersonsFromContact:v8 withRequestedType:0 requestedLabel:0 isoCountryCodes:v17];

      id v14 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [v18 count];
        int v21 = 134217984;
        id v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found %ld alternatives when dropping handle and label constraint.", (uint8_t *)&v21, 0xCu);
      }
      id v12 = v18;
    }
  }

  return v12;
}

- (BOOL)anyContactsHaveSameName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", *(void *)(*((void *)&v14 + 1) + 8 * i), 0, (void)v14);
        id v10 = (void *)v9;
        if (v9) {
          id v11 = (__CFString *)v9;
        }
        else {
          id v11 = &stru_10004D938;
        }
        id v12 = v11;

        if ([v4 containsObject:v12])
        {

          LOBYTE(v6) = 1;
          goto LABEL_14;
        }
        [v4 addObject:v12];
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v6;
}

- (BOOL)isEmergencyHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(StartCallIntentHandler *)self dataSource];
  id v6 = [v5 providerManager];

  id v44 = self;
  uint64_t v7 = [(StartCallIntentHandler *)self dataSource];
  id v8 = [v7 senderIdentityClient];

  uint64_t v9 = [v6 telephonyProvider];
  id v10 = [v9 prioritizedSenderIdentities];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v54;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = [*(id *)(*((void *)&v53 + 1) + 8 * i) UUID];
        unsigned int v17 = [v8 isEmergencyNumberForDigits:v4 senderIdentityUUID:v16];

        if (v17)
        {
          long long v39 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v60 = v4;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Handle is an emergency number, %@ is in the prioritizedSenderIdentities list", buf, 0xCu);
          }

          BOOL v38 = 1;
          int v21 = v11;
          goto LABEL_38;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  long long v43 = v6;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v18 = [(StartCallIntentHandler *)v44 dataSource];
  id v19 = [v18 providerManager];
  long long v20 = [v19 emergencyProvider];
  int v21 = [v20 emergencyLabeledHandles];

  id v22 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v50;
    while (2)
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * (void)j), "handle", v43);
        id v27 = [v26 value];
        unsigned int v28 = [v4 isEqualToString:v27];

        if (v28)
        {
          long long v40 = IntentHandlerDefaultLog();
          id v6 = v43;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v60 = v4;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Handle is an emergency number, %@ is in the emergencyLabeledHandles list", buf, 0xCu);
          }

          BOOL v38 = 1;
          goto LABEL_38;
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v29 = [(StartCallIntentHandler *)v44 dataSource];
  long long v30 = [v29 providerManager];
  long long v31 = [v30 emergencyProvider];
  int v21 = [v31 emergencyHandles];

  id v32 = [v21 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v46;
    while (2)
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v21);
        }
        double v36 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * (void)k), "value", v43);
        unsigned int v37 = [v4 isEqualToString:v36];

        if (v37)
        {
          long long v41 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v60 = v4;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Handle is an emergency number, %@ is in the unlabeled emergencyHandles list", buf, 0xCu);
          }

          BOOL v38 = 1;
          goto LABEL_37;
        }
      }
      id v33 = [v21 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  int v21 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Handle is not an emergency number: %@", buf, 0xCu);
  }
  BOOL v38 = 0;
LABEL_37:
  id v6 = v43;
LABEL_38:

  return v38;
}

- (id)localizedEmergencyString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)INDeferredLocalizedString);
  id v6 = +[NSBundle bundleWithPath:@"/Applications/InCallService.app"];
  id v7 = [v5 initWithDeferredFormat:v4 fromTable:@"InCallService" bundle:v6 arguments:0];

  id v8 = [(StartCallIntentHandler *)self dataSource];
  uint64_t v9 = [v8 siriLanguageCode];
  id v10 = [v7 localizeForLanguage:v9];

  return v10;
}

- (id)_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:(id)a3 requestedHandleType:(int64_t)a4 preferredCallProvider:(int64_t)a5
{
  id v8 = a3;
  if (a4)
  {
    uint64_t v9 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Not applying an implicit handle type filter to an intent with an explicit handle type specified";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (a5)
  {
    uint64_t v9 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Not applying an implicit handle type filter to an intent with an explicit call provider specified";
      goto LABEL_26;
    }
LABEL_27:

    id v25 = v8;
    goto LABEL_28;
  }
  id v11 = [(StartCallIntentHandler *)self dataSource];
  uint64_t v12 = [v11 supportsTelephonyCalls];

  if ((v12 & 1) == 0)
  {
    uint64_t v9 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Not applying an implicit handle type = phone number filter on a device that doesn't support telephone calls";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = [v8 allValues];
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v14)
  {

    goto LABEL_24;
  }
  id v15 = v14;
  unint64_t v16 = 0;
  uint64_t v17 = *(void *)v30;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v30 != v17) {
        objc_enumerationMutation(v13);
      }
      v16 += (unint64_t)[*(id *)(*((void *)&v29 + 1) + 8 * i) count];
    }
    id v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  }
  while (v15);

  if (v16 <= 1)
  {
LABEL_24:
    uint64_t v9 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Not applying an implicit handle type filter because there is already only one matching handle";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  id v19 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Multiple handles match call request. Attempting to filter to just phone numbers to resolve ambiguity.", buf, 2u);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001EC20;
  v27[3] = &unk_10004D060;
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  id v28 = v20;
  [v8 enumerateKeysAndObjectsUsingBlock:v27];
  id v21 = [v20 count];
  id v22 = IntentHandlerDefaultLog();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    uint64_t v24 = v20;
    if (v23)
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Filtered the results to only phone numbers. Remaining matches: %@", buf, 0xCu);
      uint64_t v24 = v20;
    }
  }
  else
  {
    uint64_t v24 = v8;
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Filtering results to only phone numbers would have produced no results, not filtering.", buf, 2u);
      uint64_t v24 = v8;
    }
  }

  id v25 = v24;
LABEL_28:

  return v25;
}

- (id)_inPersonsFromContact:(id)a3 withRequestedType:(int64_t)a4 requestedLabel:(id)a5 isoCountryCodes:(id)a6
{
  id v38 = a3;
  id v9 = a5;
  id v37 = a6;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = v10;
  if (a4 == 2)
  {
    double v36 = v10;
    int v35 = 0;
  }
  else
  {
    if (a4 == 1)
    {
LABEL_16:
      uint64_t v24 = [v38 emailAddresses];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v25 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v40;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v40 != v27) {
              objc_enumerationMutation(v24);
            }
            long long v29 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            long long v30 = INPersonHandleLabelForCNLabeledValue();
            if (![v9 length] || !objc_msgSend(v9, "caseInsensitiveCompare:", v30))
            {
              long long v31 = [v29 value];
              long long v32 = +[StartCallIntentHandlerUtilities inPersonFromContact:v38 handleValue:v31 handleType:1 handleLabel:v30];
              [v11 addObject:v32];
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v26);
      }

      goto LABEL_27;
    }
    if (a4) {
      goto LABEL_27;
    }
    double v36 = v10;
    int v35 = 1;
  }
  [v38 phoneNumbers];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v12 = v46 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        if (INPersonHandleLabelEqualsCNLabeledValue())
        {
          long long v18 = INPersonHandleLabelForCNLabeledValue();
          id v19 = [v17 value];
          id v20 = [v19 stringValue];
          id v21 = [v37 firstObject];
          id v22 = TUFormattedPhoneNumber();

          BOOL v23 = +[StartCallIntentHandlerUtilities inPersonFromContact:v38 handleValue:v22 handleType:2 handleLabel:v18];
          [v36 addObject:v23];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v14);
  }

  id v11 = v36;
  if (v35) {
    goto LABEL_16;
  }
LABEL_27:
  id v33 = [v11 copy];

  return v33;
}

- (BOOL)haveAlreadyConfirmedRecipient:(id)a3
{
  id v4 = a3;
  id v5 = +[TUHandle handleWithPerson:v4];
  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [(StartCallIntentHandler *)self handlesConfirmed];
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(NSObject **)(*((void *)&v22 + 1) + 8 * v10);
        if (TUHandlesAreCanonicallyEqual()) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      uint64_t v17 = IntentHandlerDefaultLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v11;
      long long v18 = "Have previously confirmed recipient with handle %@";
      id v19 = v17;
      goto LABEL_18;
    }
LABEL_10:
  }
  uint64_t v12 = [v4 contactIdentifier];
  id v13 = [v12 length];

  if (v13)
  {
    id v14 = [(StartCallIntentHandler *)self contactIdentifiersConfirmed];
    uint64_t v15 = [v4 contactIdentifier];
    unsigned int v16 = [v14 containsObject:v15];

    if (v16)
    {
      id v6 = IntentHandlerDefaultLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        BOOL v20 = 1;
        goto LABEL_21;
      }
      uint64_t v17 = [v4 contactIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v17;
      long long v18 = "Have previously confirmed recipient with contactIdentifier: %@";
      id v19 = v6;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
LABEL_19:

      goto LABEL_20;
    }
  }
  BOOL v20 = 0;
LABEL_21:

  return v20;
}

- (BOOL)shouldRequireInvalidNumberConfirmationForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = IntentHandlerDefaultLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = IntentHandlerDefaultLog();
  id v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "shouldRequireInvalidNumberConfirmation", "", buf, 2u);
  }

  uint64_t v10 = +[TUHandle handleWithPerson:v4];
  unsigned int v11 = [(StartCallIntentHandler *)self haveAlreadyConfirmedRecipient:v4];
  char v12 = v11;
  if (v11)
  {
    id v13 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not requiring invalid number confirmation because recipient has already been confirmed.", buf, 2u);
    }
  }
  id v14 = [v4 personHandle];
  id v15 = [v14 emergencyType];

  if (v15 == (id)2)
  {
    unsigned int v16 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not requiring invalid number confirmation because recipient has a nonlocal emergency handle type and has already been confirmed.", buf, 2u);
    }
    goto LABEL_38;
  }
  if ((v12 & 1) == 0)
  {
    long long v18 = [(StartCallIntentHandler *)self dataSource];
    id v19 = [v18 coreTelephonyDataSource];
    BOOL v20 = [v19 allRelevantISOCountryCodes];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    unsigned int v16 = v20;
    id v21 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v52;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(v16);
          }
          long long v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v10 isValidForISOCountryCode:v25])
          {
            long long v44 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v58 = (uint64_t)v25;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Not requiring invalid number confirmation because handle is valid for country code %@", buf, 0xCu);
            }

            goto LABEL_38;
          }
        }
        id v22 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v26 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v58 = (uint64_t)v10;
      __int16 v59 = 2112;
      id v60 = v16;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Requested handle %@ is not valid for any of the following country codes: %@", buf, 0x16u);
    }
    os_signpost_id_t v50 = v6;

    uint64_t v27 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Examining call history to determine if there is existing call history with the invalid number.", buf, 2u);
    }

    long long v55 = v10;
    long long v48 = +[NSArray arrayWithObjects:&v55 count:1];
    long long v49 = [(StartCallIntentHandler *)self dataSource];
    id v28 = [v49 coreTelephonyDataSource];
    long long v29 = [v28 allRelevantISOCountryCodes];
    long long v30 = +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:v48 isoCountryCodes:v29];
    v56[0] = v30;
    long long v31 = +[CallHistoryDataSourcePredicate predicateForCallsWithDurationLongerThanImmediateHangUp];
    v56[1] = v31;
    long long v32 = +[NSArray arrayWithObjects:v56 count:2];
    unsigned int v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v32];

    id v33 = IntentHandlerDefaultLog();
    os_signpost_id_t v34 = os_signpost_id_generate(v33);

    int v35 = IntentHandlerDefaultLog();
    double v36 = v35;
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "callHistoryDBForInvalidNumber", "", buf, 2u);
    }

    id v37 = [(StartCallIntentHandler *)self dataSource];
    id v38 = [v37 callHistoryDataSource];
    uint64_t v39 = (uint64_t)[v38 callCountWithPredicate:v16];

    long long v40 = IntentHandlerDefaultLog();
    long long v41 = v40;
    os_signpost_id_t v6 = v50;
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, v34, "callHistoryDBForInvalidNumber", "", buf, 2u);
    }

    long long v42 = IntentHandlerDefaultLog();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    if (v39 < 1)
    {
      if (v43)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v58 = (uint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Did not find any matching calls with: %@", buf, 0xCu);
      }

      unsigned int v16 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Returning YES for shouldRequireInvalidNumberConfirmationForRecipient.", buf, 2u);
      }
      BOOL v17 = 1;
      goto LABEL_39;
    }
    if (v43)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v58 = v39;
      __int16 v59 = 2112;
      id v60 = v10;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Not requiring invalid number confirmation because there are %ld recents call with %@", buf, 0x16u);
    }

LABEL_38:
    BOOL v17 = 0;
LABEL_39:

    goto LABEL_40;
  }
  BOOL v17 = 0;
LABEL_40:
  long long v45 = IntentHandlerDefaultLog();
  long long v46 = v45;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, v6, "shouldRequireInvalidNumberConfirmation", "", buf, 2u);
  }

  return v17;
}

- (BOOL)shouldRequireUnknownRecipientConfirmationForRequestedRecipient:(id)a3 resolvedToRecipient:(id)a4 contact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = IntentHandlerDefaultLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = IntentHandlerDefaultLog();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "shouldRequireUnknownRecipientConfirmation", "", buf, 2u);
  }

  id v15 = [v8 _userInput];
  unsigned int v16 = [v8 displayName];
  if ([(StartCallIntentHandler *)self haveAlreadyConfirmedRecipient:v8])
  {
    BOOL v17 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not requiring unknown recipient confirmation because recipient has already been confirmed.", buf, 2u);
    }
    goto LABEL_15;
  }
  long long v18 = [v8 relationship];
  id v19 = [v18 length];

  if (v19)
  {
    BOOL v17 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [v8 relationship];
      *(_DWORD *)buf = 138412290;
      long long v76 = v20;
      id v21 = "Not requiring unknown recipient confirmation because requested recipient was a relation: %@";
      id v22 = v17;
      uint32_t v23 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_14:
    }
LABEL_15:
    BOOL v28 = 0;
LABEL_16:

    goto LABEL_17;
  }
  id v74 = v10;
  long long v24 = [v8 personHandle];
  long long v25 = [v24 value];
  id v26 = [v25 length];

  if (v26)
  {
    BOOL v17 = IntentHandlerDefaultLog();
    id v10 = v74;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [v8 personHandle];
      uint64_t v27 = [v20 value];
      *(_DWORD *)buf = 138412290;
      long long v76 = v27;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not requiring unknown recipient confirmation because requested recipient was a manually dictated handle: %@", buf, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ([v15 length])
  {
    os_signpost_id_t v34 = [v9 displayName];
    unsigned int v35 = [v15 isEqualToIgnoringCase:v34];

    if (v35)
    {
      BOOL v17 = IntentHandlerDefaultLog();
      id v10 = v74;
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      BOOL v20 = [v9 displayName];
      *(_DWORD *)buf = 138412546;
      long long v76 = v15;
      __int16 v77 = 2112;
      long long v78 = v20;
      id v21 = "Not requiring unknown recipient confirmation because userInput \"%@\" matches resolved recipients full displayName: \"%@\"";
      id v22 = v17;
      uint32_t v23 = 22;
      goto LABEL_10;
    }
  }
  if ([v16 length])
  {
    double v36 = [v9 displayName];
    unsigned int v37 = [v16 isEqualToIgnoringCase:v36];

    if (v37)
    {
      BOOL v17 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = [v9 displayName];
        *(_DWORD *)buf = 138412546;
        long long v76 = v16;
        __int16 v77 = 2112;
        long long v78 = v38;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not requiring unknown recipient confirmation because requested displayName \"%@\" matches resolved recipients displayName: \"%@\"", buf, 0x16u);
      }
      BOOL v28 = 0;
      id v10 = v74;
      goto LABEL_16;
    }
  }
  uint64_t v39 = [v9 nameComponents];

  if (v39)
  {
    long long v40 = [v9 nameComponents];
    BOOL v17 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v40 style:3 options:0];

    if ([v15 length] && objc_msgSend(v15, "isEqualToIgnoringCase:", v17))
    {
      BOOL v20 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v76 = v15;
        __int16 v77 = 2112;
        long long v78 = v17;
        long long v41 = "Not requiring unknown recipient confirmation because userInput \"%@\" matches resolved recipients long for"
              "mat name: \"%@\"";
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v41, buf, 0x16u);
        goto LABEL_44;
      }
      goto LABEL_44;
    }
    if ([v16 length] && objc_msgSend(v16, "isEqualToIgnoringCase:", v17))
    {
      BOOL v20 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v76 = v16;
        __int16 v77 = 2112;
        long long v78 = v17;
        long long v41 = "Not requiring unknown recipient confirmation because requested recipient displayName \"%@\" matches resolv"
              "ed recipients long format name: \"%@\"";
        goto LABEL_43;
      }
LABEL_44:
      id v10 = v74;
      goto LABEL_14;
    }
  }
  long long v42 = [v9 nameComponents];

  if (v42)
  {
    BOOL v43 = [v9 nameComponents];
    long long v44 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v43 style:2 options:0];

    if ([v15 length] && objc_msgSend(v15, "isEqualToIgnoringCase:", v44))
    {
      long long v45 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v76 = v15;
        __int16 v77 = 2112;
        long long v78 = v44;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Not requiring unknown recipient confirmation because userInput \"%@\" matches resolved recipients medium format name: \"%@\"", buf, 0x16u);
      }
      id v10 = v74;
    }
    else
    {
      if (![v16 length])
      {
        BOOL v28 = 1;
        id v10 = v74;
        goto LABEL_60;
      }
      id v10 = v74;
      if (![v16 isEqualToIgnoringCase:v44])
      {
        BOOL v28 = 1;
        goto LABEL_60;
      }
      long long v45 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v76 = v16;
        __int16 v77 = 2112;
        long long v78 = v44;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Not requiring unknown recipient confirmation because requested recipient displayName \"%@\" matches resolved recipients medium format name: \"%@\"", buf, 0x16u);
      }
    }

    BOOL v28 = 0;
LABEL_60:

    goto LABEL_61;
  }
  BOOL v28 = 1;
  id v10 = v74;
LABEL_61:
  if (v10 && v28)
  {
    long long v46 = +[CNContactFormatter stringFromContact:v10 style:0];
    if ([v15 length] && objc_msgSend(v15, "isEqualToIgnoringCase:", v46))
    {
      long long v47 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v76 = v15;
        __int16 v77 = 2112;
        long long v78 = v46;
        long long v48 = "Not requiring unknown recipient confirmation because userInput \"%@\" matches resolved contact formatted name: \"%@\"";
LABEL_71:
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 0x16u);
      }
    }
    else if ([v16 length] && objc_msgSend(v16, "isEqualToIgnoringCase:", v46))
    {
      long long v47 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v76 = v16;
        __int16 v77 = 2112;
        long long v78 = v46;
        long long v48 = "Not requiring unknown recipient confirmation because requested recipient displayName \"%@\" matches resolv"
              "ed contact formatted name: \"%@\"";
        goto LABEL_71;
      }
    }
    else
    {
      long long v72 = v46;
      long long v49 = [(StartCallIntentHandler *)self dataSource];
      os_signpost_id_t v50 = [v49 favoritesDataSource];
      id v51 = v10;
      long long v52 = v50;
      unsigned int v53 = [v50 hasFavoritesEntryForContact:v51];

      if (!v53)
      {
        BOOL v28 = 1;
        long long v46 = v72;
        id v10 = v74;
LABEL_79:

        goto LABEL_80;
      }
      long long v47 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v74;
        long long v76 = v74;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Not requiring unknown recipient confirmation because resolved contact is a favorite. Contact: %@", buf, 0xCu);
      }
      else
      {
        id v10 = v74;
      }
      long long v46 = v72;
    }

    BOOL v28 = 0;
    goto LABEL_79;
  }
LABEL_80:
  if (v10 && v28)
  {
    BOOL v17 = [v10 allTUHandles];
    if (![v17 count])
    {
      BOOL v28 = 1;
      goto LABEL_16;
    }
    id v70 = [(StartCallIntentHandler *)self dataSource];
    long long v54 = [v70 coreTelephonyDataSource];
    long long v55 = [v54 allRelevantISOCountryCodes];
    long long v73 = +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:v17 isoCountryCodes:v55];

    long long v56 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v76 = v73;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Searching for recent calls using predicate: %@", buf, 0xCu);
    }

    uint64_t v57 = IntentHandlerDefaultLog();
    os_signpost_id_t v58 = os_signpost_id_generate(v57);

    __int16 v59 = IntentHandlerDefaultLog();
    id v60 = v59;
    unint64_t v71 = v58 - 1;
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "callHistoryDBForUnknownRecipient", "", buf, 2u);
    }
    os_signpost_id_t spid = v58;

    id v61 = [(StartCallIntentHandler *)self dataSource];
    uint64_t v62 = [v61 callHistoryDataSource];
    uint64_t v63 = (uint64_t)[v62 callCountWithPredicate:v73];

    double v64 = IntentHandlerDefaultLog();
    uint64_t v65 = v64;
    if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, spid, "callHistoryDBForUnknownRecipient", "", buf, 2u);
    }

    id v66 = IntentHandlerDefaultLog();
    BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
    BOOL v28 = v63 < 1;
    if (v63 < 1)
    {
      id v10 = v74;
      if (v67)
      {
        *(_DWORD *)buf = 138412290;
        long long v76 = v17;
        id v68 = "Did not find a recent calls with any of the following handles: %@";
        goto LABEL_97;
      }
    }
    else
    {
      id v10 = v74;
      if (v67)
      {
        *(_DWORD *)buf = 138412290;
        long long v76 = v17;
        id v68 = "Not requiring unknown recipient confirmation because there is a recent call with one of the following handles: %@";
LABEL_97:
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, v68, buf, 0xCu);
      }
    }

    goto LABEL_16;
  }
LABEL_17:
  long long v29 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v30 = @"false";
    if (v28) {
      CFStringRef v30 = @"true";
    }
    *(_DWORD *)buf = 138543362;
    long long v76 = (void *)v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Returning %{public}@ for shouldRequireUnknownRecipientConfirmationForRequestedRecipient.", buf, 0xCu);
  }

  long long v31 = IntentHandlerDefaultLog();
  long long v32 = v31;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v12, "shouldRequireUnknownRecipientConfirmation", "", buf, 2u);
  }

  return v28;
}

- (id)resolveContactsFromCallGroups:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contacts];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 callGroups];
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "group facetime message callGroups for intent: %@", buf, 0xCu);
  }
  id v9 = [v4 callGroups];
  id v10 = [v9 firstObject];
  unsigned int v11 = [v10 groupId];

  os_signpost_id_t v12 = [(StartCallIntentHandler *)self dataSource];
  id v13 = [v12 fetchSPIHandlesForGroupID:v11];

  if ([v13 count])
  {
    uint64_t v27 = v5;
    id v28 = v4;
    id v14 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "fetching handles from spiChat: %@", buf, 0xCu);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v21 = objc_alloc((Class)INPersonHandle);
          id v22 = [v20 address];
          id v23 = [v21 initWithValue:v22 type:0 label:0 emergencyType:2];

          id v24 = [objc_alloc((Class)INPerson) initWithPersonHandle:v23 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
          [v6 addObject:v24];
        }
        id v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }

    id v5 = [v6 copy];
    id v4 = v28;
  }
  long long v25 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "updated contacts: %@", buf, 0xCu);
  }

  return v5;
}

- (void)setDataSource:(id)a3
{
}

- (void)setCoreAnalyticsLogger:(id)a3
{
}

- (void)setAppResolver:(id)a3
{
}

- (NSMutableOrderedSet)handlesConfirmed
{
  return self->_handlesConfirmed;
}

- (void)setHandlesConfirmed:(id)a3
{
}

- (NSMutableOrderedSet)contactIdentifiersConfirmed
{
  return self->_contactIdentifiersConfirmed;
}

- (void)setContactIdentifiersConfirmed:(id)a3
{
}

- (IntentHandlerFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (FaceTimeUtilities)faceTimeUtilities
{
  return self->_faceTimeUtilities;
}

- (void)setFaceTimeUtilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTimeUtilities, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersConfirmed, 0);
  objc_storeStrong((id *)&self->_handlesConfirmed, 0);
  objc_storeStrong((id *)&self->_appResolver, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_identifierToContactCache, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end