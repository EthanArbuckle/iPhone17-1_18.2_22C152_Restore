@interface RecentCallQuery
- (BOOL)includeThirdPartyCalls;
- (NSArray)participants;
- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7;
- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7 includeThirdPartyCalls:(BOOL)a8;
- (id)callCapabilityPredicate;
- (id)callRecordTypePredicates;
- (id)participantsPredicatesWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5;
- (id)predicateForRecentCallWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5;
- (id)preferredCallProviderPredicate;
- (int64_t)callCapability;
- (int64_t)destinationType;
- (int64_t)preferredCallProvider;
- (unint64_t)callTypes;
- (void)setCallCapability:(int64_t)a3;
- (void)setCallTypes:(unint64_t)a3;
- (void)setDestinationType:(int64_t)a3;
- (void)setIncludeThirdPartyCalls:(BOOL)a3;
- (void)setParticipants:(id)a3;
- (void)setPreferredCallProvider:(int64_t)a3;
@end

@implementation RecentCallQuery

- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7
{
  return [(RecentCallQuery *)self initWithParticipants:a3 destinationType:a4 callTypes:a5 callCapability:a6 preferredCallProvider:a7 includeThirdPartyCalls:0];
}

- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7 includeThirdPartyCalls:(BOOL)a8
{
  BOOL v8 = a8;
  [(RecentCallQuery *)self setParticipants:a3];
  [(RecentCallQuery *)self setDestinationType:a4];
  [(RecentCallQuery *)self setCallTypes:a5];
  [(RecentCallQuery *)self setCallCapability:a6];
  [(RecentCallQuery *)self setPreferredCallProvider:a7];
  [(RecentCallQuery *)self setIncludeThirdPartyCalls:v8];
  return self;
}

- (id)predicateForRecentCallWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  v12 = [(RecentCallQuery *)self callRecordTypePredicates];
  [v11 addObjectsFromArray:v12];

  v13 = [(RecentCallQuery *)self preferredCallProviderPredicate];
  if (v13) {
    [v11 addObject:v13];
  }
  v14 = [(RecentCallQuery *)self callCapabilityPredicate];
  if (v14) {
    [v11 addObject:v14];
  }
  v15 = [(RecentCallQuery *)self participantsPredicatesWithContactsDataSource:v8 contactIdentifierCache:v9 coreTelephonyDataSource:v10];
  [v11 addObjectsFromArray:v15];

  if ([v11 count] == (id)1)
  {
    uint64_t v16 = [v11 firstObject];
LABEL_9:
    v17 = (void *)v16;
    goto LABEL_11;
  }
  if ((unint64_t)[v11 count] >= 2)
  {
    uint64_t v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];
    goto LABEL_9;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)callRecordTypePredicates
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(RecentCallQuery *)self callTypes])
  {
    v4 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:1];
    [v3 addObject:v4];
  }
  if (([(RecentCallQuery *)self callTypes] & 2) != 0)
  {
    v5 = +[CallHistoryDataSourcePredicate predicateForMissedCallsSinceDate:0];
    [v3 addObject:v5];
  }
  if (([(RecentCallQuery *)self callTypes] & 4) != 0)
  {
    v6 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:0];
    [v3 addObject:v6];
  }
  if (![(RecentCallQuery *)self callTypes]
    && (id)[(RecentCallQuery *)self destinationType] == (id)4)
  {
    v7 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Inferring outgoing callStatus requirement from the presence of redial destination type and unspecified recordTypeForRedialing.", v11, 2u);
    }

    id v8 = +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:1];
    [v3 addObject:v8];
  }
  if (([(RecentCallQuery *)self callTypes] & 0xF8) != 0)
  {
    id v9 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100031704(v9);
    }
  }

  return v3;
}

- (id)preferredCallProviderPredicate
{
  int64_t v3 = [(RecentCallQuery *)self preferredCallProvider];
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
      goto LABEL_15;
    }
    if (v3 == 1)
    {
      v4 = +[CallHistoryDataSourcePredicate predicateForTelephonyCalls];
      goto LABEL_15;
    }
    v6 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031748(v6);
    }
    goto LABEL_11;
  }
  unsigned int v5 = [(RecentCallQuery *)self includeThirdPartyCalls];
  v6 = IntentHandlerDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No preferredCallProvider specified and thirdParty redial is enabled, not filtering by provider", buf, 2u);
    }
LABEL_11:

    v4 = 0;
    goto LABEL_15;
  }
  if (v7)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No preferredCallProvider specified and thirdParty redial is not enabled. Filtering for 1P calls.", v9, 2u);
  }

  v4 = +[CallHistoryDataSourcePredicate predicateForTelephonyOrFaceTimeCalls];
LABEL_15:

  return v4;
}

- (id)callCapabilityPredicate
{
  int64_t v2 = [(RecentCallQuery *)self callCapability];
  if (v2 == 1)
  {
    int64_t v3 = +[CallHistoryDataSourcePredicate predicateForAudioCalls];
  }
  else if (v2 == 2)
  {
    int64_t v3 = +[CallHistoryDataSourcePredicate predicateForVideoCalls];
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)participantsPredicatesWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = [(RecentCallQuery *)self participants];
  id v12 = [v11 count];

  if (v12)
  {
    v13 = [(RecentCallQuery *)self participants];
    uint64_t v14 = +[CallHistoryDataSourcePredicate predicateForCallsWithNumberOfRemoteParticipants:](CallHistoryDataSourcePredicate, "predicateForCallsWithNumberOfRemoteParticipants:", [v13 count]);

    v27 = (void *)v14;
    [v10 addObject:v14];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [(RecentCallQuery *)self participants];
    id v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "tu_handlesMatchingPersonWithContactsDataSource:identifierToContactCache:", v29, v8);
          unsigned int v20 = [(RecentCallQuery *)self includeThirdPartyCalls];
          v21 = IntentHandlerDefaultLog();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v20)
          {
            if (v22)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "ThirdParty redial is enabled, using redial predicate that includes search for non-normalized handle values.", buf, 2u);
            }

            v23 = [v9 allRelevantISOCountryCodes];
            uint64_t v24 = +[CallHistoryDataSourcePredicate predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:v19 isoCountryCodes:v23];
          }
          else
          {
            if (v22)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "ThirdParty redial is not enabled, using normal recent call predicate that includes search for non-normalized handle values.", buf, 2u);
            }

            v23 = [v9 allRelevantISOCountryCodes];
            uint64_t v24 = +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:v19 isoCountryCodes:v23];
          }
          v25 = (void *)v24;

          [v10 addObject:v25];
        }
        id v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }
  }

  return v10;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (int64_t)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(int64_t)a3
{
  self->_destinationType = a3;
}

- (unint64_t)callTypes
{
  return self->_callTypes;
}

- (void)setCallTypes:(unint64_t)a3
{
  self->_callTypes = a3;
}

- (int64_t)callCapability
{
  return self->_callCapability;
}

- (void)setCallCapability:(int64_t)a3
{
  self->_callCapability = a3;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (void)setPreferredCallProvider:(int64_t)a3
{
  self->_preferredCallProvider = a3;
}

- (BOOL)includeThirdPartyCalls
{
  return self->_includeThirdPartyCalls;
}

- (void)setIncludeThirdPartyCalls:(BOOL)a3
{
  self->_includeThirdPartyCalls = a3;
}

- (void).cxx_destruct
{
}

@end