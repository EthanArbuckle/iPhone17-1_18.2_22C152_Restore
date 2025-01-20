@interface KTTransparentData
+ (BOOL)supportsSecureCoding;
+ (void)addResult:(unint64_t)a3 failure:(id)a4 toLoggableDatas:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)optInAfter:(id)a3 accountKey:(id)a4;
- (BOOL)staticKeyEnforced;
- (BOOL)updateWithMapLeaf:(id)a3 error:(id *)a4;
- (BOOL)updateWithMutation:(id)a3 error:(id *)a4;
- (BOOL)updateWithSMTs:(id)a3 error:(id *)a4;
- (BOOL)validateActiveClientDatas:(id)a3 at:(id)a4 error:(id *)a5;
- (BOOL)validateAndUpdateWithServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6;
- (BOOL)validateAndUpdateWithSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7;
- (BOOL)validateOptInHistory:(id)a3 accountKey:(id)a4 responseTime:(id)a5 error:(id *)a6;
- (BOOL)validateOtherAccountsInactiveForAccount:(id)a3 at:(id)a4 error:(id *)a5;
- (BOOL)verifyServerInvariantsAt:(id)a3 error:(id *)a4;
- (KTTransparentData)initWithCoder:(id)a3;
- (KTTransparentData)initWithUriVRFOutput:(id)a3;
- (KTTransparentData)initWithUriVRFOutput:(id)a3 mapLeaf:(id)a4 pendingSMTs:(id)a5 error:(id *)a6;
- (NSArray)optInOutHistoryDescription;
- (NSData)uriVRFOutput;
- (NSDate)currentTreeEpochBeginDate;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSMutableArray)accounts;
- (id)accountForAccountKey:(id)a3;
- (id)accountForAccountKeyHash:(id)a3;
- (id)accountOptInHistory:(id)a3;
- (id)accountOptInRecord:(id)a3;
- (id)copy;
- (id)currentPublicID;
- (id)debugDescription;
- (id)earliestAddedDate:(id)a3;
- (id)expectedSelfResolutionDate:(id)a3 requestDate:(id)a4;
- (id)failedRecordsForSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7;
- (id)failedServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6;
- (id)failureResult:(id)a3 loggableData:(id)a4;
- (id)filterLoggableDatas:(id)a3 clientDataHash:(id)a4;
- (id)filterLoggableDatas:(id)a3 deviceIdHash:(id)a4;
- (id)getLogDataForAccountKey:(id)a3 uri:(id)a4;
- (id)mutationsFromSMTs:(id)a3 error:(id *)a4;
- (id)serialize;
- (id)sortMutationsByTimestamp:(id)a3 error:(id *)a4;
- (unint64_t)accountEverOptedIn:(id)a3;
- (unint64_t)accountOptInState:(id)a3;
- (unint64_t)accountRecentlyOptedIn:(id)a3;
- (unint64_t)currentAccountOptInState;
- (unint64_t)staticKeyStatus;
- (unint64_t)verifiedAccountOptInState;
- (void)addAccountsObject:(id)a3;
- (void)cleanupAccounts;
- (void)deleteMarkedEntries:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)markAccountsWithMutationMs:(unint64_t)a3 except:(id)a4;
- (void)removeAccountsObject:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setCurrentTreeEpochBeginDate:(id)a3;
- (void)setStaticKeyEnforced:(BOOL)a3;
- (void)setStaticKeyStatus:(unint64_t)a3;
- (void)setUriVRFOutput:(id)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4;
@end

@implementation KTTransparentData

- (id)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"[\n"];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v35 = self;
  obj = self->_accounts;
  id v39 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v55;
    v38 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v55 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v4;
        v5 = *(void **)(*((void *)&v54 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        v6 = [v5 accountKey];
        v7 = [v6 kt_hexString];
        [v3 appendFormat:@"    accountKey:%@\n", v7];

        v8 = [v5 accountKeyHash];
        v9 = [v8 kt_hexString];
        [v3 appendFormat:@"    accountKeyHash:%@\n", v9];

        v10 = +[NSMutableString stringWithFormat:@"[\n"];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v41 = [v5 devices];
        id v44 = [v41 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v44)
        {
          uint64_t v42 = *(void *)v51;
          v43 = v10;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v51 != v42) {
                objc_enumerationMutation(v41);
              }
              uint64_t v45 = v11;
              v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
              [v10 appendFormat:@"     {\n"];
              v13 = [v12 deviceID];
              v14 = [v13 kt_hexString];
              [v10 appendFormat:@"      deviceID:%@\n", v14];

              v15 = [v12 deviceIDHash];
              v16 = [v15 kt_hexString];
              [v10 appendFormat:@"      deviceIDHash: %@\n", v16];

              v17 = +[NSMutableString stringWithFormat:@"[\n"];
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              v18 = [v12 clientDatas];
              id v19 = [v18 countByEnumeratingWithState:&v46 objects:v58 count:16];
              if (v19)
              {
                id v20 = v19;
                uint64_t v21 = *(void *)v47;
                do
                {
                  for (i = 0; i != v20; i = (char *)i + 1)
                  {
                    if (*(void *)v47 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                    [v17 appendFormat:@"       {\n"];
                    v24 = [v23 clientData];
                    v25 = [v24 kt_hexString];
                    [v17 appendFormat:@"        clientData:%@\n", v25];

                    v26 = [v23 clientDataHash];
                    v27 = [v26 kt_hexString];
                    [v17 appendFormat:@"        clientDataHash:%@\n", v27];

                    [v17 appendFormat:@"        appVersion:%lu\n", [v23 applicationVersion]];
                    v28 = [v23 addedDate];
                    v29 = [v23 markedForDeletion];
                    v30 = [v23 expiry];
                    v31 = [v23 escrowExpiry];
                    [v17 appendFormat:@"        addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n",
                      v28,
                      v29,
                      v30,
                      v31);

                    [v17 appendFormat:@"       },\n"];
                  }
                  id v20 = [v18 countByEnumeratingWithState:&v46 objects:v58 count:16];
                }
                while (v20);
              }

              [v17 appendFormat:@"      ]"];
              v10 = v43;
              [v43 appendFormat:@"      clientDatas: %@\n", v17];
              [v43 appendFormat:@"     },\n"];

              uint64_t v11 = v45 + 1;
            }
            while ((id)(v45 + 1) != v44);
            id v44 = [v41 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v44);
        }

        [v10 appendFormat:@"    ]"];
        v3 = v38;
        [v38 appendFormat:@"    devices: %@\n", v10];
        [v38 appendFormat:@"   },\n"];

        uint64_t v4 = v40 + 1;
      }
      while ((id)(v40 + 1) != v39);
      id v39 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v39);
  }

  [v3 appendFormat:@"  ]"];
  v32 = [(NSData *)v35->_uriVRFOutput kt_hexString];
  v33 = +[NSString stringWithFormat:@"{\n  uriVRFOutput: %@\n  accounts: %@\n}", v32, v3];

  return v33;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(KTTransparentData *)self uriVRFOutput];
  v5 = [v4 kt_hexString];
  [v3 setObject:v5 forKeyedSubscript:@"uriVRFOutput"];

  [(KTTransparentData *)self staticKeyStatus];
  v6 = KTStaticKeyPeerValidateResultGetString();
  [v3 setObject:v6 forKeyedSubscript:@"staticKeyStatus"];

  v7 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [(KTTransparentData *)self accounts];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) diagnosticsJsonDictionary];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v3 setObject:v7 forKeyedSubscript:@"accounts"];

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(KTTransparentData *)self accounts];
  [v4 encodeObject:v5 forKey:@"accounts"];

  v6 = [(KTTransparentData *)self uriVRFOutput];
  [v4 encodeObject:v6 forKey:@"uriVRFOutput"];

  id v7 = [(KTTransparentData *)self currentTreeEpochBeginDate];
  [v4 encodeObject:v7 forKey:@"currentTreeEpoch"];
}

- (KTTransparentData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"accounts"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uriVRFOutput"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentTreeEpoch"];

  id v10 = objc_alloc_init(KTTransparentData);
  if (v10)
  {
    id v11 = [v7 mutableCopy];
    [(KTTransparentData *)v10 setAccounts:v11];

    [(KTTransparentData *)v10 setUriVRFOutput:v8];
    [(KTTransparentData *)v10 setCurrentTreeEpochBeginDate:v9];
  }

  return v10;
}

- (KTTransparentData)initWithUriVRFOutput:(id)a3 mapLeaf:(id)a4 pendingSMTs:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)KTTransparentData;
  v14 = [(KTTransparentData *)&v20 init];
  long long v15 = v14;
  if (v14
    && ((objc_storeStrong((id *)&v14->_uriVRFOutput, a3),
         +[NSMutableArray array],
         uint64_t v16 = objc_claimAutoreleasedReturnValue(),
         accounts = v15->_accounts,
         v15->_accounts = (NSMutableArray *)v16,
         accounts,
         [(KTTransparentData *)v15 setStaticKeyStatus:3],
         v12)
     && ![(KTTransparentData *)v15 updateWithMapLeaf:v12 error:a6]
     || v13 && ![(KTTransparentData *)v15 updateWithSMTs:v13 error:a6]))
  {
    long long v18 = 0;
  }
  else
  {
    long long v18 = v15;
  }

  return v18;
}

- (KTTransparentData)initWithUriVRFOutput:(id)a3
{
  return [(KTTransparentData *)self initWithUriVRFOutput:a3 mapLeaf:0 pendingSMTs:0 error:0];
}

- (id)copy
{
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (id)serialize
{
  id v3 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:@"kTransparentData"];
  id v4 = [v3 encodedData];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTTransparentData *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(KTTransparentData *)self uriVRFOutput];
      uint64_t v7 = [(KTTransparentData *)v5 uriVRFOutput];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        id v9 = [(KTTransparentData *)self uriVRFOutput];
        id v10 = [(KTTransparentData *)v5 uriVRFOutput];
        unsigned int v11 = [v9 isEqualToData:v10];

        if (!v11) {
          goto LABEL_15;
        }
      }
      id v13 = [(KTTransparentData *)self accounts];
      uint64_t v14 = [(KTTransparentData *)v5 accounts];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        long long v15 = (void *)v14;
        uint64_t v16 = [(KTTransparentData *)self accounts];
        long long v17 = [(KTTransparentData *)v5 accounts];
        unsigned int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_15;
        }
      }
      id v19 = [(KTTransparentData *)self currentTreeEpochBeginDate];
      uint64_t v20 = [(KTTransparentData *)v5 currentTreeEpochBeginDate];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        uint64_t v21 = (void *)v20;
        v22 = [(KTTransparentData *)self currentTreeEpochBeginDate];
        v23 = [(KTTransparentData *)v5 currentTreeEpochBeginDate];
        unsigned __int8 v24 = [v22 kt_isEqualWithinOneMillisecond:v23];

        if ((v24 & 1) == 0)
        {
LABEL_15:
          BOOL v12 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      BOOL v12 = 1;
      goto LABEL_18;
    }
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

- (id)accountForAccountKeyHash:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 accountKeyHash:v13];
        unsigned __int8 v11 = [v10 isEqualToData:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)accountForAccountKey:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned __int8 v11 = [v10 accountKey:v17];
        unsigned __int8 v12 = [v11 isEqualToData:v4];

        if (v12)
        {
          id v15 = v10;
          goto LABEL_12;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v13 = [(KTTransparentData *)self uriVRFOutput];
  [v4 kt_sha256WithSalt:v13];
  uint64_t v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  long long v14 = [(KTTransparentData *)self accountForAccountKeyHash:v5];
  id v15 = v14;
  if (v14) {
    [v14 setAccountKey:v4];
  }
LABEL_12:

  return v15;
}

- (void)removeAccountsObject:(id)a3
{
}

- (void)addAccountsObject:(id)a3
{
}

- (BOOL)updateWithMapLeaf:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 verifyWithError:a4];
  if (v7 == (id)1)
  {
    uint64_t v8 = +[NSMutableArray array];
    [(KTTransparentData *)self setAccounts:v8];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [v6 accountsArray];
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [[KTAccount alloc] initWithIdsAccount:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          id v15 = [(KTTransparentData *)self accounts];
          [v15 addObject:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [(KTTransparentData *)self cleanupAccounts];
  }

  return v7 == (id)1;
}

- (id)sortMutationsByTimestamp:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001749E4;
  v12[3] = &unk_1002C3528;
  v12[4] = &v13;
  id v6 = [v5 sortedArrayUsingComparator:v12];
  id v7 = v6;
  if (*((unsigned char *)v14 + 24))
  {
    uint64_t v8 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-332 description:@"error sorting SMTs due to multiple conflicting SMTs with the same timestamp"];
    id v9 = v8;
    if (a4 && v8) {
      *a4 = v8;
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v6;
  }

  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)mutationsFromSMTs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = +[SignedMutationTimestamp signedTypeWithObject:](SignedMutationTimestamp, "signedTypeWithObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        uint64_t v13 = [v12 parsedMutationWithError:a4];
        if (!v13)
        {

          id v15 = 0;
          goto LABEL_11;
        }
        long long v14 = (void *)v13;
        [v6 addObject:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = v6;
LABEL_11:

  return v15;
}

- (void)markAccountsWithMutationMs:(unint64_t)a3 except:(id)a4
{
  id v6 = a4;
  id v7 = +[NSDate dateWithTimeIntervalSince1970:(double)a3 / 1000.0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(KTTransparentData *)self accounts];
  id v8 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v39;
    uint64_t v24 = *(void *)v39;
    id v25 = v6;
    do
    {
      id v11 = 0;
      id v26 = v9;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v11);
        if ((!v6
           || ([*(id *)(*((void *)&v38 + 1) + 8 * (void)v11) isEqual:v6] & 1) == 0)
          && objc_msgSend(v12, "active:", v7, v24, v25))
        {
          v28 = v11;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v29 = [v12 devices];
          id v13 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v35;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v35 != v15) {
                  objc_enumerationMutation(v29);
                }
                long long v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                if ([v17 active:v7])
                {
                  long long v32 = 0u;
                  long long v33 = 0u;
                  long long v30 = 0u;
                  long long v31 = 0u;
                  long long v18 = [v17 clientDatas];
                  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
                  if (v19)
                  {
                    id v20 = v19;
                    uint64_t v21 = *(void *)v31;
                    do
                    {
                      for (j = 0; j != v20; j = (char *)j + 1)
                      {
                        if (*(void *)v31 != v21) {
                          objc_enumerationMutation(v18);
                        }
                        v23 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
                        if ([v23 active:v7]) {
                          [v23 markWithMutationMs:a3];
                        }
                      }
                      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
                    }
                    while (v20);
                  }
                }
              }
              id v14 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v14);
          }

          uint64_t v10 = v24;
          id v6 = v25;
          id v9 = v26;
          id v11 = v28;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v9);
  }
}

- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = [v9 accountKeyHash];
  id v7 = [(KTTransparentData *)self accountForAccountKeyHash:v6];

  id v8 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v9 timestampMs] / 1000.0);
  if (v7 && [v7 active:v8]) {
    [v7 updateWithOptInOutMutation:v9 error:a4];
  }
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = [v9 accountKeyHash];
  id v7 = [(KTTransparentData *)self accountForAccountKeyHash:v6];

  id v8 = [v9 idsMutation];
  -[KTTransparentData markAccountsWithMutationMs:except:](self, "markAccountsWithMutationMs:except:", [v8 mutationMs], v7);

  if (v7)
  {
    [(KTAccount *)v7 updateWithAddMutation:v9 error:a4];
  }
  else
  {
    id v7 = [[KTAccount alloc] initWithMutation:v9];
    [(KTTransparentData *)self addAccountsObject:v7];
  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  id v8 = a3;
  id v6 = [v8 accountKeyHash];
  id v7 = [(KTTransparentData *)self accountForAccountKeyHash:v6];

  if (v7) {
    [v7 updateWithMarkDeleteMutation:v8 error:a4];
  }
}

- (void)cleanupAccounts
{
  id v3 = [(KTTransparentData *)self accounts];
  id v4 = +[NSArray arrayWithArray:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 cleanupDevices];
        if ([v10 shouldRemove]) {
          [(KTTransparentData *)self removeAccountsObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)deleteMarkedEntries:(unint64_t)a3
{
  id v4 = +[NSDate dateWithTimeIntervalSince1970:(double)a3 / 1000.0];
  id v5 = [(KTTransparentData *)self accounts];
  id v6 = +[NSArray arrayWithArray:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "marked:", v4, (void)v13)) {
          [(KTTransparentData *)self removeAccountsObject:v12];
        }
        [v12 deleteMarkedEntries:v4];
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)updateWithMutation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 uriVRFOutput];
  id v8 = [(KTTransparentData *)self uriVRFOutput];
  unsigned __int8 v9 = [v7 isEqualToData:v8];

  if (v9)
  {
    switch([v6 mutationType])
    {
      case 1u:
      case 4u:
        uint64_t v10 = [v6 idsDeviceMutation];

        if (v10)
        {
          long long v11 = [v6 idsDeviceMutation];
          [(KTTransparentData *)self updateWithAddMutation:v11 error:a4];
          goto LABEL_25;
        }
        if (qword_10032ED38 != -1) {
          dispatch_once(&qword_10032ED38, &stru_1002C3568);
        }
        long long v12 = qword_10032ED40;
        if (!os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR)) {
          break;
        }
        LOWORD(v21[0]) = 0;
        long long v13 = "Add mutation doesn't have idsDeviceMutation object";
        goto LABEL_11;
      case 2u:
      case 5u:
        long long v15 = [v6 idsDeviceMutation];

        if (v15)
        {
          long long v11 = [v6 idsDeviceMutation];
          [(KTTransparentData *)self updateWithMarkDeleteMutation:v11 error:a4];
          goto LABEL_25;
        }
        if (qword_10032ED38 != -1) {
          dispatch_once(&qword_10032ED38, &stru_1002C3588);
        }
        long long v12 = qword_10032ED40;
        if (!os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR)) {
          break;
        }
        LOWORD(v21[0]) = 0;
        long long v13 = "Mark mutation doesn't have idsDeviceMutation object";
        goto LABEL_11;
      case 3u:
        if (qword_10032ED38 != -1) {
          dispatch_once(&qword_10032ED38, &stru_1002C35A8);
        }
        long long v18 = qword_10032ED40;
        if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "WARNING: Skipping deprecated mutation type OPT_IN_OUT_MUTATION", (uint8_t *)v21, 2u);
        }
        goto LABEL_26;
      case 6u:
        id v19 = [v6 optInOutMutation];

        if (v19)
        {
          long long v11 = [v6 optInOutMutation];
          [(KTTransparentData *)self updateWithOptInOutMutation:v11 error:a4];
LABEL_25:

LABEL_26:
          [(KTTransparentData *)self cleanupAccounts];
          BOOL v14 = 1;
          goto LABEL_27;
        }
        if (qword_10032ED38 != -1) {
          dispatch_once(&qword_10032ED38, &stru_1002C35C8);
        }
        long long v12 = qword_10032ED40;
        if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21[0]) = 0;
          long long v13 = "optInOutWithSync mutation doesn't have OptInOutMutation object";
          goto LABEL_11;
        }
        break;
      default:
        if (qword_10032ED38 != -1) {
          dispatch_once(&qword_10032ED38, &stru_1002C35E8);
        }
        long long v16 = (void *)qword_10032ED40;
        if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
        {
          long long v17 = v16;
          v21[0] = 67109120;
          v21[1] = [v6 mutationType];
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "unknown mutation type %d, continuing anyway", (uint8_t *)v21, 8u);
        }
        goto LABEL_26;
    }
  }
  else
  {
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-86 description:@"smt has different URI VRF output than computed in witness"];
    }
    if (qword_10032ED38 != -1) {
      dispatch_once(&qword_10032ED38, &stru_1002C3548);
    }
    long long v12 = qword_10032ED40;
    if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21[0]) = 0;
      long long v13 = "smt has different URI VRF output than computed in witness";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)v21, 2u);
    }
  }
  BOOL v14 = 0;
LABEL_27:

  return v14;
}

- (BOOL)updateWithSMTs:(id)a3 error:(id *)a4
{
  id v6 = -[KTTransparentData mutationsFromSMTs:error:](self, "mutationsFromSMTs:error:", a3);
  id v7 = [(KTTransparentData *)self sortMutationsByTimestamp:v6 error:a4];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (!-[KTTransparentData updateWithMutation:error:](self, "updateWithMutation:error:", *(void *)(*((void *)&v15 + 1) + 8 * i), a4, (void)v15))
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)filterLoggableDatas:(id)a3 deviceIdHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v15 = [v14 deviceIdHash:v21];

        if (!v15)
        {
          long long v16 = [(KTTransparentData *)self uriVRFOutput];
          [v14 computeHashesForSalt:v16];
        }
        long long v17 = [v14 deviceIdHash];
        unsigned int v18 = [v17 isEqualToData:v7];

        if (v18) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    id v19 = v8;
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (id)filterLoggableDatas:(id)a3 clientDataHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v15 = [v14 clientDataHash:v21];

        if (!v15)
        {
          long long v16 = [(KTTransparentData *)self uriVRFOutput];
          [v14 computeHashesForSalt:v16];
        }
        long long v17 = [v14 clientDataHash];
        unsigned int v18 = [v17 isEqualToData:v7];

        if (v18) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    id v19 = v8;
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (id)failedRecordsForSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7
{
  id v89 = a3;
  id v12 = a4;
  id v99 = a5;
  id v94 = a6;
  BOOL v13 = [(KTTransparentData *)self accountForAccountKey:v12];
  v87 = v13;
  if (v13)
  {
    v95 = a7;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id obj = [v13 devices];
    id v93 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
    if (v93)
    {
      id v86 = v12;
      uint64_t v92 = *(void *)v108;
      v100 = self;
      while (1)
      {
        BOOL v14 = 0;
        do
        {
          if (*(void *)v108 != v92) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v107 + 1) + 8 * (void)v14);
          long long v16 = +[NSMutableArray array];
          v101 = v15;
          long long v17 = [v15 deviceIDHash];
          unsigned int v18 = [v99 fetchSyncedLoggableDataByDeviceIdHash:v17];

          if (v18)
          {
            if (qword_10032ED38 != -1) {
              dispatch_once(&qword_10032ED38, &stru_1002C3628);
            }
            id v19 = (void *)qword_10032ED40;
            if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_DEBUG))
            {
              id v20 = v19;
              long long v21 = [v18 firstObject];
              long long v22 = [v21 deviceID];
              [v22 kt_hexString];
              long long v23 = v96 = v14;
              long long v24 = [v101 deviceIDHash];
              id v25 = [v24 kt_hexString];
              unsigned int v26 = [v18 count];
              *(_DWORD *)buf = 138412802;
              uint64_t v114 = (uint64_t)v23;
              __int16 v115 = 2112;
              v116 = v25;
              __int16 v117 = 1024;
              LODWORD(v118) = v26;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CloudDevices: found device %@ with deviceIDHash: %@: %d", buf, 0x1Cu);

              self = v100;
              BOOL v14 = v96;
            }
            [v16 addObjectsFromArray:v18];
          }
          if (([v99 disableKTSyncabledKVSStore] & 1) == 0)
          {
            v27 = [v101 deviceIDHash];
            v28 = [(KTTransparentData *)self filterLoggableDatas:v89 deviceIdHash:v27];

            if (v28)
            {
              if (qword_10032ED38 != -1) {
                dispatch_once(&qword_10032ED38, &stru_1002C3648);
              }
              id v29 = (void *)qword_10032ED40;
              if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_DEBUG))
              {
                long long v30 = v29;
                long long v31 = [v28 firstObject];
                [v31 deviceID];
                long long v32 = v97 = v14;
                long long v33 = [v32 kt_hexString];
                long long v34 = [v101 deviceIDHash];
                long long v35 = [v34 kt_hexString];
                unsigned int v36 = [v28 count];
                *(_DWORD *)buf = 138412802;
                uint64_t v114 = (uint64_t)v33;
                __int16 v115 = 2112;
                v116 = v35;
                __int16 v117 = 1024;
                LODWORD(v118) = v36;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "KVS: found device %@ with deviceIDHash: %@: %d", buf, 0x1Cu);

                BOOL v14 = v97;
                self = v100;
              }
              [v16 addObjectsFromArray:v28];
            }
          }
          v102 = v16;
          if (![v16 count])
          {
            v59 = [v101 deviceIDHash];
            uint64_t v60 = [v59 kt_hexString];

            v61 = [v101 addedDate];
            id v62 = [v61 compare:v94];

            if (v62 == (id)1)
            {
              long long v41 = (void *)v60;
              if (qword_10032ED38 != -1) {
                dispatch_once(&qword_10032ED38, &stru_1002C3668);
              }
              v63 = (void *)qword_10032ED40;
              if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_DEBUG))
              {
                v64 = v63;
                v65 = [v101 addedDate];
                *(_DWORD *)buf = 138412802;
                uint64_t v114 = v60;
                __int16 v115 = 2112;
                v116 = v65;
                __int16 v117 = 2112;
                id v118 = v94;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "skipping device (%@) added %@ after request time %@", buf, 0x20u);
              }
              int v58 = 3;
              goto LABEL_69;
            }
            v72 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -99, *v95, @"Unknown device in Transparent Data with deviceIdHash %@", v60 code underlyingError description];
            if ([v101 marked:v94])
            {
              long long v41 = (void *)v60;
              +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -107, *v95, @"Unknown marked device in Transparent Data with deviceIdHash %@", v60 code underlyingError description];
              goto LABEL_61;
            }
            long long v41 = (void *)v60;
            if ([v101 expired:v94])
            {
              +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -161, *v95, @"Unknown expired device in Transparent Data with deviceIdHash %@", v60 code underlyingError description];
              uint64_t v75 = LABEL_61:;

              v72 = (void *)v75;
            }
            if (qword_10032ED38 != -1) {
              dispatch_once(&qword_10032ED38, &stru_1002C3688);
            }
            v76 = qword_10032ED40;
            if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v114 = (uint64_t)v41;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Unknown device in Transparent Data with deviceIdHash %{public}@", buf, 0xCu);
            }
            if (v72) {
              id *v95 = v72;
            }
            CFStringRef v122 = @"failedDeviceIdHash";
            v123 = v41;
            int v58 = 1;
            uint64_t v88 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];

            goto LABEL_69;
          }
          long long v37 = [v16 objectAtIndexedSubscript:0];
          long long v38 = [v37 deviceID];
          [v101 setDeviceID:v38];

          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v39 = [v101 clientDatas];
          id v40 = [v39 countByEnumeratingWithState:&v103 objects:v121 count:16];
          long long v41 = v39;
          if (!v40)
          {
            int v58 = 0;
            goto LABEL_69;
          }
          id v42 = v40;
          v91 = v18;
          v98 = v14;
          uint64_t v43 = *(void *)v104;
          while (2)
          {
            id v44 = 0;
            do
            {
              if (*(void *)v104 != v43) {
                objc_enumerationMutation(v39);
              }
              uint64_t v45 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v44);
              long long v46 = [v45 clientDataHash];
              long long v47 = [(KTTransparentData *)self filterLoggableDatas:v102 clientDataHash:v46];

              if (v47)
              {
                long long v48 = [v47 objectAtIndexedSubscript:0];
                long long v49 = [v48 clientData];
                [v45 setClientData:v49];

                [v45 setSynced:1];
              }
              else
              {
                long long v50 = [v101 deviceID];
                long long v47 = [v50 kt_hexString];

                long long v51 = [v45 clientDataHash];
                long long v52 = [v51 kt_hexString];

                long long v53 = [v45 addedDate];
                id v54 = [v53 compare:v94];

                if (v54 != (id)1)
                {
                  v66 = [v45 addedDate];
                  v67 = [v45 markedForDeletion];
                  v68 = [v45 expiry];
                  v69 = +[NSString stringWithFormat:@"Unknown client data in Transparent Data for device {%@, %@, %@, %@, %@}", v47, v52, v66, v67, v68];

                  v70 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -100, *v95, @"%@", v69 code underlyingError description];
                  if ([v45 marked:v94])
                  {
                    uint64_t v71 = -108;
                    self = v100;
                    goto LABEL_50;
                  }
                  self = v100;
                  if ([v45 expired:v94])
                  {
                    uint64_t v71 = -162;
LABEL_50:
                    uint64_t v73 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", v71, *v95, @"%@", v69 code underlyingError description];

                    v70 = (void *)v73;
                  }
                  if (qword_10032ED38 != -1) {
                    dispatch_once(&qword_10032ED38, &stru_1002C36C8);
                  }
                  v74 = qword_10032ED40;
                  if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v114 = (uint64_t)v69;
                    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                  }
                  if (v70) {
                    id *v95 = v70;
                  }
                  v111[0] = @"failedDeviceId";
                  v111[1] = @"failedClientDataHash";
                  v112[0] = v47;
                  v112[1] = v52;
                  uint64_t v88 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];

                  int v58 = 1;
                  goto LABEL_58;
                }
                if (qword_10032ED38 != -1) {
                  dispatch_once(&qword_10032ED38, &stru_1002C36A8);
                }
                long long v55 = (void *)qword_10032ED40;
                if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_DEBUG))
                {
                  long long v56 = v55;
                  long long v57 = [v45 addedDate];
                  *(_DWORD *)buf = 138413058;
                  uint64_t v114 = (uint64_t)v47;
                  __int16 v115 = 2112;
                  v116 = v52;
                  __int16 v117 = 2112;
                  id v118 = v57;
                  __int16 v119 = 2112;
                  id v120 = v94;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "skipping client data (%@,%@) added %@ after request time %@", buf, 0x2Au);
                }
                self = v100;
              }

              id v44 = (char *)v44 + 1;
              long long v39 = v41;
            }
            while (v42 != v44);
            id v42 = [v41 countByEnumeratingWithState:&v103 objects:v121 count:16];
            if (v42) {
              continue;
            }
            break;
          }
          int v58 = 0;
LABEL_58:
          BOOL v14 = v98;
          unsigned int v18 = v91;
LABEL_69:

          if (v58 != 3 && v58)
          {
            id v12 = v86;
            v77 = (void *)v88;
            goto LABEL_86;
          }
          BOOL v14 = (char *)v14 + 1;
        }
        while (v14 != v93);
        id v93 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
        if (!v93)
        {
          v77 = 0;
          id v12 = v86;
          goto LABEL_86;
        }
      }
    }
    v77 = 0;
    goto LABEL_86;
  }
  if (a7)
  {
    id v78 = *a7;
    v79 = a7;
    v80 = [v12 kt_hexString];
    id *v79 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -98, v78, @"No transparent data for accountKey %@", v80 code underlyingError description];
  }
  if (qword_10032ED38 != -1) {
    dispatch_once(&qword_10032ED38, &stru_1002C3608);
  }
  v81 = (void *)qword_10032ED40;
  if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
  {
    v82 = v81;
    v83 = [v12 kt_hexString];
    *(_DWORD *)buf = 138412290;
    uint64_t v114 = (uint64_t)v83;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %@", buf, 0xCu);
  }
  CFStringRef v125 = @"failedAccountKey";
  if (v12)
  {
    CFStringRef v84 = [v12 base64EncodedStringWithOptions:0];
  }
  else
  {
    CFStringRef v84 = @"NULL";
  }
  id obj = (id)v84;
  CFStringRef v126 = v84;
  v77 = +[NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
  if (v12) {
LABEL_86:
  }

  return v77;
}

- (BOOL)validateAndUpdateWithSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7
{
  id v7 = [(KTTransparentData *)self failedRecordsForSyncedLoggableDatas:a3 accountKey:a4 cloudDevices:a5 requestDate:a6 error:a7];
  BOOL v8 = v7 == 0;

  return v8;
}

- (BOOL)validateOtherAccountsInactiveForAccount:(id)a3 at:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = self->_accounts;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (([v15 isEqual:v8] & 1) == 0
          && [v15 active:v9])
        {
          if (a5)
          {
            [v8 accountKeyHash];
            long long v17 = v28 = a5;
            unsigned int v18 = [v17 kt_hexString];
            id v19 = [v15 accountKeyHash];
            id v20 = [v19 kt_hexString];
            id *v28 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -91, @"verifying (%@), other accountKey (%@) has active records", v18, v20 code description];
          }
          if (qword_10032ED38 != -1) {
            dispatch_once(&qword_10032ED38, &stru_1002C36E8);
          }
          long long v21 = (void *)qword_10032ED40;
          if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
          {
            long long v22 = v21;
            long long v23 = [v8 accountKeyHash];
            long long v24 = [v23 kt_hexString];
            id v25 = [v15 accountKeyHash];
            unsigned int v26 = [v25 kt_hexString];
            *(_DWORD *)buf = 138412546;
            long long v34 = v24;
            __int16 v35 = 2112;
            unsigned int v36 = v26;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "verifying (%@), other accountKey (%@) has active records", buf, 0x16u);
          }
          BOOL v16 = 0;
          goto LABEL_18;
        }
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)validateActiveClientDatas:(id)a3 at:(id)a4 error:(id *)a5
{
  id v6 = a4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = [a3 devices];
  id v30 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v30)
  {
    uint64_t v8 = *(void *)v40;
    id v9 = &nw_path_monitor_set_update_handler_ptr;
    long long v34 = v7;
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v31 = v10;
        id v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        id v12 = [v9[453] array];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v33 = v11;
        uint64_t v13 = [v11 clientDatas];
        id v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v36;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              unsigned int v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if ([v18 active:v6])
              {
                id v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 applicationVersion]);
                unsigned int v20 = [v12 containsObject:v19];

                if (v20)
                {
                  if (a5)
                  {
                    long long v23 = [v33 deviceIDHash];
                    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", @"TransparencyErrorVerify", -92, @"muliple active client datas for deviceIdHash %@ appVersion %lu", v23, [v18 applicationVersion]);
                    *a5 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  if (qword_10032ED38 != -1) {
                    dispatch_once(&qword_10032ED38, &stru_1002C3708);
                  }
                  long long v24 = (void *)qword_10032ED40;
                  if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
                  {
                    id v25 = v24;
                    unsigned int v26 = [v33 deviceIDHash];
                    id v27 = [v18 applicationVersion];
                    *(_DWORD *)buf = 138412546;
                    id v44 = v26;
                    __int16 v45 = 2048;
                    id v46 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "muliple active client datas for deviceIdHash %@ appVersion %lu", buf, 0x16u);
                  }
                  BOOL v22 = 0;
                  id v7 = v34;
                  goto LABEL_27;
                }
                long long v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 applicationVersion]);
                [v12 addObject:v21];
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = v31 + 1;
        id v7 = v34;
        uint64_t v8 = v29;
        id v9 = &nw_path_monitor_set_update_handler_ptr;
      }
      while ((id)(v31 + 1) != v30);
      BOOL v22 = 1;
      id v30 = [v34 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v30);
  }
  else
  {
    BOOL v22 = 1;
  }
LABEL_27:

  return v22;
}

- (BOOL)verifyServerInvariantsAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v6 = +[NSDate now];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(KTTransparentData *)self accounts];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 active:v6]
          && ![(KTTransparentData *)self validateOtherAccountsInactiveForAccount:v12 at:v6 error:a4]|| ![(KTTransparentData *)self validateActiveClientDatas:v12 at:v6 error:a4])
        {
          BOOL v13 = 0;
          goto LABEL_15;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

+ (void)addResult:(unint64_t)a3 failure:(id)a4 toLoggableDatas:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v13 setResult:a3];
        [v13 setFailure:v7];
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)failureResult:(id)a3 loggableData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableDictionary dictionary];
  if (v5)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    [v7 setObject:v8 forKeyedSubscript:@"failedAccountKey"];
  }
  id v9 = [v6 deviceID];

  if (v9)
  {
    id v10 = [v6 deviceID];
    uint64_t v11 = [v10 base64EncodedStringWithOptions:0];
    [v7 setObject:v11 forKeyedSubscript:@"failedDeviceId"];
  }
  id v12 = [v6 clientData];

  if (v12)
  {
    BOOL v13 = [v6 clientData];
    long long v14 = [v13 base64EncodedStringWithOptions:0];
    [v7 setObject:v14 forKeyedSubscript:@"failedClientData"];
  }

  return v7;
}

- (id)failedServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v111 = self;
  id v12 = [(KTTransparentData *)self accountForAccountKey:v11];
  long long v110 = a6;
  if (v12)
  {
    BOOL v13 = +[NSMutableArray array];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v99 = v10;
    id obj = v10;
    id v103 = [obj countByEnumeratingWithState:&v118 objects:v131 count:16];
    id v14 = 0;
    if (!v103) {
      goto LABEL_58;
    }
    uint64_t v102 = *(void *)v119;
    long long v15 = &nw_path_monitor_set_update_handler_ptr;
    id v108 = v11;
    long long v109 = v13;
    v101 = v12;
    while (1)
    {
      id v16 = 0;
      do
      {
        if (*(void *)v119 != v102) {
          objc_enumerationMutation(obj);
        }
        long long v106 = (char *)v16;
        long long v17 = *(void **)(*((void *)&v118 + 1) + 8 * (void)v16);
        long long v18 = [v17 deviceIdHash];

        if (!v18)
        {
          id v19 = [(KTTransparentData *)v111 uriVRFOutput];
          [v17 computeHashesForSalt:v19];
        }
        unsigned int v20 = [v17 deviceIdHash];
        long long v21 = [v12 deviceForDeviceIdHash:v20];

        if (v21)
        {
          BOOL v22 = [v17 deviceID];
          [v21 setDeviceID:v22];

          long long v23 = [v21 deviceID];
          uint64_t v24 = [v23 kt_hexString];

          id v25 = [v17 clientDataHash];
          long long v105 = v21;
          unsigned int v26 = [v21 clientRecordsForHash:v25];

          long long v104 = v26;
          if (v26)
          {
            v113 = (void *)v24;
            long long v116 = 0u;
            long long v117 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id v107 = v26;
            id v27 = [v107 countByEnumeratingWithState:&v114 objects:v130 count:16];
            if (!v27) {
              goto LABEL_37;
            }
            id v28 = v27;
            uint64_t v112 = *(void *)v115;
            while (1)
            {
              uint64_t v29 = 0;
              do
              {
                if (*(void *)v115 != v112) {
                  objc_enumerationMutation(v107);
                }
                id v30 = *(void **)(*((void *)&v114 + 1) + 8 * (void)v29);
                uint64_t v31 = [v15[434] dateWithTimeIntervalSinceReferenceDate:a5];
                unsigned int v32 = [v30 marked:v31];

                if (v32)
                {
                  long long v33 = [v30 markedForDeletion];
                  [v33 timeIntervalSinceReferenceDate];
                  double v35 = a5 - v34;

                  long long v36 = +[NSMutableDictionary dictionary];
                  long long v37 = +[NSNumber numberWithDouble:a5];
                  [v36 setObject:v37 forKeyedSubscript:@"idsResponseTime"];

                  long long v38 = [v30 markedForDeletion];
                  [v38 timeIntervalSinceReferenceDate];
                  long long v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  [v36 setObject:v39 forKeyedSubscript:@"markedForDeletion"];

                  [v36 setObject:v11 forKeyedSubscript:@"accountKey"];
                  [v36 setObject:v113 forKeyedSubscript:@"deviceID"];
                  long long v40 = [v17 clientData];
                  [v36 setObject:v40 forKeyedSubscript:@"clientData"];

                  long long v41 = +[NSNumber numberWithDouble:v35];
                  [v36 setObject:v41 forKeyedSubscript:@"since"];

                  float v42 = v35;
                  double v43 = v42;
                  id v44 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -96, 2, 0, v36, @"Transparent data is marked for deletion since %.2f", v42 code errorLevel underlyingError userinfo description];

                  if (qword_10032ED38 != -1) {
                    dispatch_once(&qword_10032ED38, &stru_1002C3788);
                  }
                  __int16 v45 = (void *)qword_10032ED40;
                  if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
                  {
                    id v46 = v45;
                    long long v47 = [v11 kt_hexString];
                    long long v48 = [v17 clientData];
                    long long v49 = [v48 kt_hexString];
                    *(_DWORD *)buf = 138544130;
                    v123 = v47;
                    __int16 v124 = 2114;
                    uint64_t v125 = (uint64_t)v113;
                    __int16 v126 = 2112;
                    v127 = v49;
                    __int16 v128 = 2048;
                    double v129 = v43;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@ is marked since %.2f", buf, 0x2Au);

                    id v11 = v108;
                  }
                  long long v50 = [(KTTransparentData *)v111 failureResult:v11 loggableData:v17];
                  [v109 addObject:v50];

                  [v17 setResult:0];
                  [v17 setFailure:v44];
                  [v17 setMarked:1];
                  long long v51 = [v30 escrowExpiry];
                  [v17 setMarkExpiryDate:v51];

                  long long v52 = v110;
                  long long v15 = &nw_path_monitor_set_update_handler_ptr;
                  if (!v110) {
                    goto LABEL_31;
                  }
                  goto LABEL_29;
                }
                long long v53 = [v15[434] dateWithTimeIntervalSinceReferenceDate:a5];
                unsigned int v54 = [v30 expired:v53];

                if (v54)
                {
                  long long v36 = +[NSMutableDictionary dictionary];
                  long long v55 = +[NSNumber numberWithDouble:a5];
                  [v36 setObject:v55 forKeyedSubscript:@"idsResponseTime"];

                  long long v56 = [v30 expiry];
                  [v56 timeIntervalSinceReferenceDate];
                  long long v57 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  [v36 setObject:v57 forKeyedSubscript:@"expire"];

                  [v36 setObject:v11 forKeyedSubscript:@"accountKey"];
                  [v36 setObject:v113 forKeyedSubscript:@"deviceID"];
                  int v58 = [v17 clientData];
                  [v36 setObject:v58 forKeyedSubscript:@"clientData"];

                  v59 = [v30 expiry];
                  id v44 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -238, 2, 0, v36, @"Transparent data for accountKey is expired since %@", v59 code errorLevel underlyingError userinfo description];

                  if (qword_10032ED38 != -1) {
                    dispatch_once(&qword_10032ED38, &stru_1002C37A8);
                  }
                  uint64_t v60 = (void *)qword_10032ED40;
                  if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
                  {
                    v61 = v60;
                    id v62 = [v17 clientData];
                    v63 = [v62 kt_hexString];
                    v64 = [v30 expiry];
                    *(_DWORD *)buf = 138544130;
                    v123 = v108;
                    __int16 v124 = 2114;
                    uint64_t v125 = (uint64_t)v113;
                    __int16 v126 = 2112;
                    v127 = v63;
                    __int16 v128 = 2112;
                    double v129 = *(double *)&v64;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@ is expired since %@", buf, 0x2Au);
                  }
                  id v11 = v108;
                  v65 = [(KTTransparentData *)v111 failureResult:v108 loggableData:v17];
                  [v109 addObject:v65];

                  [v17 setResult:0];
                  [v17 setFailure:v44];
                  long long v52 = v110;
                  if (!v110) {
                    goto LABEL_31;
                  }
LABEL_29:
                  if (v44) {
                    *long long v52 = v44;
                  }
LABEL_31:

                  id v14 = v44;
                  goto LABEL_32;
                }
                v66 = [v17 clientData];
                [v30 setClientData:v66];

                [v30 setVerified:1];
                if ([v17 result] == (id)2) {
                  [v17 setResult:1];
                }
LABEL_32:
                uint64_t v29 = (char *)v29 + 1;
              }
              while (v28 != v29);
              id v67 = [v107 countByEnumeratingWithState:&v114 objects:v130 count:16];
              id v28 = v67;
              if (!v67)
              {
LABEL_37:

                id v68 = v14;
                id v12 = v101;
                BOOL v13 = v109;
                v69 = v105;
                v70 = v106;
                uint64_t v71 = v113;
                goto LABEL_54;
              }
            }
          }
          v83 = v13;
          CFStringRef v84 = [v11 kt_hexString];
          v85 = [v17 clientData];
          id v86 = [v85 kt_hexString];
          uint64_t v71 = (void *)v24;
          id v68 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -95, @"No transparent data for accountKey %@ and deviceId %@ and clientData %@", v84, v24, v86 code description];

          if (qword_10032ED38 != -1) {
            dispatch_once(&qword_10032ED38, &stru_1002C3768);
          }
          v87 = (void *)qword_10032ED40;
          if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
          {
            uint64_t v88 = v87;
            id v89 = [v11 kt_hexString];
            v90 = [v17 clientData];
            v91 = [v90 kt_hexString];
            *(_DWORD *)buf = 138543874;
            v123 = v89;
            __int16 v124 = 2114;
            uint64_t v125 = v24;
            __int16 v126 = 2112;
            v127 = v91;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@", buf, 0x20u);
          }
          uint64_t v92 = [(KTTransparentData *)v111 failureResult:v11 loggableData:v17];
          BOOL v13 = v83;
          [v83 addObject:v92];

          [v17 setResult:0];
          [v17 setFailure:v68];
          long long v15 = &nw_path_monitor_set_update_handler_ptr;
          if (v110)
          {
            v69 = v105;
            v70 = v106;
            id v12 = v101;
            if (v68)
            {
              id v68 = v68;
              *long long v110 = v68;
            }
          }
          else
          {
            v69 = v105;
            v70 = v106;
            id v12 = v101;
          }
LABEL_54:
        }
        else
        {
          v72 = v12;
          uint64_t v73 = v13;
          v69 = 0;
          v74 = [v11 kt_hexString];
          uint64_t v75 = [v17 deviceID];
          v76 = [v75 kt_hexString];
          id v68 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -94, @"No transparent data for accountKey %@ and deviceId %@", v74, v76 code description];

          if (qword_10032ED38 != -1) {
            dispatch_once(&qword_10032ED38, &stru_1002C3748);
          }
          BOOL v13 = v73;
          v77 = (void *)qword_10032ED40;
          if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
          {
            id v78 = v77;
            v79 = [v11 kt_hexString];
            v80 = [v17 deviceID];
            v81 = [v80 kt_hexString];
            *(_DWORD *)buf = 138412546;
            v123 = v79;
            __int16 v124 = 2112;
            uint64_t v125 = (uint64_t)v81;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %@ and deviceId %@", buf, 0x16u);

            BOOL v13 = v73;
          }
          v82 = [(KTTransparentData *)v111 failureResult:v11 loggableData:v17];
          [v13 addObject:v82];

          [v17 setResult:0];
          [v17 setFailure:v68];
          long long v15 = &nw_path_monitor_set_update_handler_ptr;
          if (!v110)
          {
            id v14 = v68;
            v70 = v106;
            id v12 = v72;
            goto LABEL_56;
          }
          v70 = v106;
          id v12 = v72;
          if (v68)
          {
            id v14 = v68;
            *long long v110 = v14;
            goto LABEL_56;
          }
        }
        id v14 = v68;
LABEL_56:

        id v16 = v70 + 1;
      }
      while (v16 != v103);
      id v103 = [obj countByEnumeratingWithState:&v118 objects:v131 count:16];
      if (!v103)
      {
LABEL_58:

        if ([v13 count])
        {
          id v93 = +[NSArray arrayWithArray:v13];
        }
        else
        {
          id v93 = 0;
        }
        id v10 = v99;
        goto LABEL_70;
      }
    }
  }
  id v94 = [v11 kt_hexString];
  id v14 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -93, @"No transparent data for accountKey %@", v94 code description];

  +[KTTransparentData addResult:0 failure:v14 toLoggableDatas:v10];
  if (a6 && v14) {
    *a6 = v14;
  }
  if (qword_10032ED38 != -1) {
    dispatch_once(&qword_10032ED38, &stru_1002C3728);
  }
  v95 = (void *)qword_10032ED40;
  if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
  {
    v96 = v95;
    v97 = [v11 kt_hexString];
    *(_DWORD *)buf = 138412290;
    v123 = v97;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %@", buf, 0xCu);
  }
  BOOL v13 = [(KTTransparentData *)v111 failureResult:v11 loggableData:0];
  v132 = v13;
  id v93 = +[NSArray arrayWithObjects:&v132 count:1];
LABEL_70:

  return v93;
}

- (BOOL)validateAndUpdateWithServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6
{
  id v6 = [(KTTransparentData *)self failedServerLoggableDatas:a3 accountKey:a4 idsResponseTime:a6 error:a5];
  BOOL v7 = v6 == 0;

  return v7;
}

- (BOOL)validateOptInHistory:(id)a3 accountKey:(id)a4 responseTime:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [(KTTransparentData *)self accountForAccountKey:a4];
  LOBYTE(a6) = [v12 validateOptInHistory:v11 responseTime:v10 error:a6];

  return (char)a6;
}

- (id)earliestAddedDate:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:9.22337204e18];
  id v6 = [(KTTransparentData *)self accountForAccountKey:v4];
  BOOL v7 = v6;
  if (v6)
  {
    long long v23 = v6;
    id v24 = v4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [v6 devices];
    id v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v33;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v10 = [v9 clientDatas];
          id v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v29;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
                uint64_t v16 = [v15 addedDate];
                if (v16)
                {
                  long long v17 = (void *)v16;
                  long long v18 = [v15 addedDate];
                  id v19 = [v18 compare:v5];

                  if (v19 == (id)-1)
                  {
                    uint64_t v20 = [v15 addedDate];

                    id v5 = (void *)v20;
                  }
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v12);
          }
        }
        id v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v27);
    }

    BOOL v7 = v23;
    id v4 = v24;
  }
  id v21 = v5;

  return v21;
}

- (unint64_t)accountOptInState:(id)a3
{
  id v3 = [(KTTransparentData *)self accountForAccountKey:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 optInState];
  }
  else {
    unint64_t v5 = 2;
  }

  return v5;
}

- (id)accountOptInRecord:(id)a3
{
  id v3 = [(KTTransparentData *)self accountForAccountKey:a3];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 optInRecord];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)accountOptInHistory:(id)a3
{
  id v3 = [(KTTransparentData *)self accountForAccountKey:a3];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 optInHistory];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)accountEverOptedIn:(id)a3
{
  id v3 = [(KTTransparentData *)self accountForAccountKey:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 everOptedIn];
  }
  else {
    unint64_t v5 = 2;
  }

  return v5;
}

- (unint64_t)accountRecentlyOptedIn:(id)a3
{
  id v3 = [(KTTransparentData *)self accountForAccountKey:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 recentlyOptedIn];
  }
  else {
    unint64_t v5 = 2;
  }

  return v5;
}

- (unint64_t)verifiedAccountOptInState
{
  id v3 = [(KTTransparentData *)self currentPublicID];
  id v4 = [v3 publicKeyInfo];

  unint64_t v5 = [(KTTransparentData *)self accountOptInState:v4];
  return v5;
}

- (unint64_t)currentAccountOptInState
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(KTTransparentData *)self accounts];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    unint64_t v6 = 2;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = +[NSDate now];
        unsigned __int8 v10 = [v8 active:v9];

        if (v10)
        {
          unint64_t v6 = [v8 optInState];
          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v6 = 2;
  }
LABEL_12:

  return v6;
}

- (id)currentPublicID
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_accounts;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        BOOL v7 = [v6 accountKey:v10];

        if (v7)
        {
          id v8 = [v6 accountKey];
          id v3 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v8 error:0];

          goto LABEL_11;
        }
      }
      id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)optInAfter:(id)a3 accountKey:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(KTTransparentData *)self accountOptInRecord:a4];
  id v8 = v7;
  if (!v7 || ![v7 optIn]) {
    goto LABEL_8;
  }
  id v9 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v8 timestampMs] / 1000.0);
  if (qword_10032ED38 != -1) {
    dispatch_once(&qword_10032ED38, &stru_1002C37C8);
  }
  long long v10 = qword_10032ED40;
  if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    long long v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "opted-in peer verification failure ids(%@) optin(%@)", (uint8_t *)&v14, 0x16u);
  }
  id v11 = [v6 compare:v9];

  if (v11 == (id)-1) {
    BOOL v12 = 1;
  }
  else {
LABEL_8:
  }
    BOOL v12 = 0;

  return v12;
}

- (id)expectedSelfResolutionDate:(id)a3 requestDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(KTTransparentData *)self accountForAccountKey:v6];
  id v9 = v8;
  if (v8)
  {
    long long v28 = v8;
    id v29 = v6;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [v8 devices];
    id v32 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    long long v10 = 0;
    if (v32)
    {
      uint64_t v31 = *(void *)v39;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v11;
          BOOL v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v13 = [v12 clientDatas];
          id v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v35;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v35 != v16) {
                  objc_enumerationMutation(v13);
                }
                long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                id v19 = [v18 addedDate];
                id v20 = [v7 compare:v19];

                if (v20 != (id)-1 && ([v18 synced] & 1) == 0)
                {
                  if (!v10) {
                    goto LABEL_17;
                  }
                  uint64_t v21 = [v18 escrowExpiry];
                  if (v21)
                  {
                    BOOL v22 = (void *)v21;
                    long long v23 = [v18 escrowExpiry];
                    id v24 = [v10 compare:v23];

                    if (v24 == (id)-1)
                    {
LABEL_17:
                      uint64_t v25 = [v18 escrowExpiry];

                      long long v10 = (void *)v25;
                    }
                  }
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v15);
          }

          uint64_t v11 = v33 + 1;
        }
        while ((id)(v33 + 1) != v32);
        id v32 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v32);
    }

    id v9 = v28;
    id v6 = v29;
  }
  else
  {
    if (qword_10032ED38 != -1) {
      dispatch_once(&qword_10032ED38, &stru_1002C37E8);
    }
    uint64_t v26 = qword_10032ED40;
    if (os_log_type_enabled((os_log_t)qword_10032ED40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "no account record for account key, so no expected resolution date", buf, 2u);
    }
    long long v10 = 0;
  }

  return v10;
}

- (id)getLogDataForAccountKey:(id)a3 uri:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  id v9 = [(KTTransparentData *)self accountOptInHistory:v6];
  long long v10 = v9;
  if (v9 && [v9 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v16 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v15 timestampMs] / 1000.0);
          id v17 = [objc_alloc((Class)KTOptIOLogState) initWithURI:v7 smtTimestamp:v16 optIn:[v15 optIn]];
          [v8 addObject:v17];
        }
        id v12 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v12);
    }

    id v25 = v7;
    uint64_t v26 = v8;
    long long v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (NSMutableArray)accounts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccounts:(id)a3
{
}

- (NSData)uriVRFOutput
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUriVRFOutput:(id)a3
{
}

- (NSDate)currentTreeEpochBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentTreeEpochBeginDate:(id)a3
{
}

- (BOOL)staticKeyEnforced
{
  return self->_staticKeyEnforced;
}

- (void)setStaticKeyEnforced:(BOOL)a3
{
  self->_staticKeyEnforced = a3;
}

- (NSArray)optInOutHistoryDescription
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)staticKeyStatus
{
  return self->_staticKeyStatus;
}

- (void)setStaticKeyStatus:(unint64_t)a3
{
  self->_staticKeyStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInOutHistoryDescription, 0);
  objc_storeStrong((id *)&self->_currentTreeEpochBeginDate, 0);
  objc_storeStrong((id *)&self->_uriVRFOutput, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

@end