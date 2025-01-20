@interface KTAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)active:(id)a3;
- (BOOL)everOptedIn;
- (BOOL)expired:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)marked:(id)a3;
- (BOOL)optInState;
- (BOOL)recentlyOptedIn;
- (BOOL)shouldRemove;
- (BOOL)updateWithOptInOutWithExt:(id)a3 error:(id *)a4;
- (BOOL)validateEmptyOptInOutHistory:(id)a3 responseTime:(id)a4 error:(id *)a5;
- (BOOL)validateOptInHistory:(id)a3 responseTime:(id)a4 error:(id *)a5;
- (KTAccount)initWithCoder:(id)a3;
- (KTAccount)initWithIdsAccount:(id)a3;
- (KTAccount)initWithMutation:(id)a3;
- (NSData)accountKey;
- (NSData)accountKeyHash;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSMutableArray)devices;
- (NSMutableArray)optInOutHistory;
- (id)debugDescription;
- (id)deviceForDeviceIdHash:(id)a3;
- (id)kvsOptInOutEntry:(id)a3 before:(id)a4;
- (id)optInHistory;
- (id)optInHistoryDescription;
- (id)optInOutHistoryJsonArray;
- (id)optInRecord;
- (void)addDevicesObject:(id)a3;
- (void)cleanupDevices;
- (void)deleteMarkedEntries:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeDevicesObject:(id)a3;
- (void)setAccountKey:(id)a3;
- (void)setAccountKeyHash:(id)a3;
- (void)setDevices:(id)a3;
- (void)setOptInOutHistory:(id)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithDeviceStateArray:(id)a3;
- (void)updateWithExtensions:(id)a3 error:(id *)a4;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4;
@end

@implementation KTAccount

- (id)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"[\n"];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v32 = self;
  obj = self->_devices;
  id v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v43;
    v35 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v4;
        v5 = *(void **)(*((void *)&v42 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        v6 = [v5 deviceID];
        v7 = [v6 kt_hexString];
        [v3 appendFormat:@"    deviceID:%@\n", v7];

        v8 = [v5 deviceIDHash];
        v9 = [v8 kt_hexString];
        [v3 appendFormat:@"    deviceIDHash: %@\n", v9];

        v10 = +[NSMutableString stringWithFormat:@"[\n"];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v11 = [v5 clientDatas];
        id v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v39;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              [v10 appendFormat:@"     {\n"];
              v17 = [v16 clientData];
              v18 = [v17 kt_hexString];
              [v10 appendFormat:@"      clientData:%@\n", v18];

              v19 = [v16 clientDataHash];
              v20 = [v19 kt_hexString];
              [v10 appendFormat:@"      clientDataHash:%@\n", v20];

              [v10 appendFormat:@"      appVersion:%lu\n", [v16 applicationVersion]];
              v21 = [v16 addedDate];
              v22 = [v16 markedForDeletion];
              v23 = [v16 expiry];
              v24 = [v16 escrowExpiry];
              [v10 appendFormat:@"      addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n",
                v21,
                v22,
                v23,
                v24);

              [v10 appendFormat:@"     },\n"];
            }
            id v13 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v13);
        }

        [v10 appendFormat:@"    ]"];
        v3 = v35;
        [v35 appendFormat:@"    clientDatas: %@\n", v10];
        [v35 appendFormat:@"   },\n"];

        uint64_t v4 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      id v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v36);
  }

  [v3 appendFormat:@"  ]"];
  v25 = [(KTAccount *)v32 accountKey];
  v26 = [v25 kt_hexString];
  v27 = [(KTAccount *)v32 accountKeyHash];
  v28 = [v27 kt_hexString];
  v29 = [(KTAccount *)v32 optInHistoryDescription];
  v30 = +[NSString stringWithFormat:@"{\n  accountKey:%@\n  accountKeyHash:%@\n  optInHistory:%@\n devices: %@\n}", v26, v28, v29, v3];

  return v30;
}

- (id)optInOutHistoryJsonArray
{
  v3 = [(KTAccount *)self optInOutHistory];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = [(KTAccount *)self optInOutHistory];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) diagnosticsJsonDictionary];
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = +[NSArray array];
  }

  return v5;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(KTAccount *)self accountKey];

  if (v4)
  {
    v5 = [(KTAccount *)self accountKey];
    v6 = [v5 kt_hexString];
    [v3 setObject:v6 forKeyedSubscript:@"accountKey"];
  }
  id v7 = [(KTAccount *)self accountKeyHash];
  id v8 = [v7 kt_hexString];
  [v3 setObject:v8 forKeyedSubscript:@"accountKeyHash"];

  uint64_t v9 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [(KTAccount *)self devices];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) diagnosticsJsonDictionary];
        [v9 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [v3 setObject:v9 forKeyedSubscript:@"devices"];
  long long v16 = [(KTAccount *)self optInOutHistoryJsonArray];
  [v3 setObject:v16 forKeyedSubscript:@"optInOutHistory"];

  return (NSDictionary *)v3;
}

- (id)optInHistoryDescription
{
  v3 = [(KTAccount *)self optInOutHistory];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(KTAccount *)self optInOutHistory];
  v6 = [v5 reverseObjectEnumerator];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 optIn]) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        uint64_t v13 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)[v11 timestampMs] / 0x3E8));
        long long v14 = [v13 kt_toISO_8601_UTCString];
        long long v15 = +[NSString stringWithFormat:@"%@-%@", v12, v14];

        [v4 addObject:v15];
      }
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  long long v16 = [v4 componentsJoinedByString:@","];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(KTAccount *)self accountKey];
  [v4 encodeObject:v5 forKey:@"accountKey"];

  v6 = [(KTAccount *)self accountKeyHash];
  [v4 encodeObject:v6 forKey:@"accountKeyHash"];

  id v7 = [(KTAccount *)self devices];
  [v4 encodeObject:v7 forKey:@"devices"];

  uint64_t v8 = [(KTAccount *)self optInOutHistory];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(KTAccount *)self optInOutHistory];
    id v11 = [v10 count];

    if (v11)
    {
      CFStringRef v12 = [(KTAccount *)self optInOutHistory];
      uint64_t v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v14 = [(KTAccount *)self optInOutHistory];
      id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          long long v18 = 0;
          do
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v18) data];
            if (v19) {
              [v13 addObject:v19];
            }

            long long v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v16);
      }

      long long v20 = +[NSArray arrayWithArray:v13];
      [v4 encodeObject:v20 forKey:@"optInOutHistory"];
    }
  }
}

- (KTAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKey"];
  uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKeyHash"];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v31 = [v4 decodeObjectOfClasses:v6 forKey:@"devices"];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);

  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"optInOutHistory"];
  v10 = v9;
  if (v9)
  {
    v29 = v8;
    v30 = self;
    id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v36;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v34 = 0;
          long long v18 = +[OptInOutWithExt parseFromData:v17 error:&v34];
          id v19 = v34;
          if (!v18)
          {
            long long v20 = (void *)v33;
            if (qword_10032EE78 != -1) {
              dispatch_once(&qword_10032EE78, &stru_1002C4880);
            }
            long long v22 = v31;
            long long v21 = (void *)v32;
            uint64_t v8 = v29;
            long long v23 = qword_10032EE80;
            if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v19;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to parse OptInOut record: %@", buf, 0xCu);
            }

            long long v24 = 0;
            self = v30;
            goto LABEL_21;
          }
          [v11 addObject:v18];
        }
        id v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v8 = v29;
    self = v30;
  }
  else
  {
    id v11 = 0;
  }
  v25 = objc_alloc_init(KTAccount);
  long long v24 = v25;
  long long v21 = (void *)v32;
  long long v20 = (void *)v33;
  long long v22 = v31;
  if (v25)
  {
    [(KTAccount *)v25 setAccountKey:v33];
    [(KTAccount *)v24 setAccountKeyHash:v32];
    id v26 = [v31 mutableCopy];
    [(KTAccount *)v24 setDevices:v26];

    if (v11)
    {
      [(KTAccount *)v24 setOptInOutHistory:v11];
    }
    else
    {
      v27 = +[NSMutableArray array];
      [(KTAccount *)v24 setOptInOutHistory:v27];
    }
  }
LABEL_21:

  return v24;
}

- (KTAccount)initWithIdsAccount:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)KTAccount;
  uint64_t v5 = [(KTAccount *)&v29 init];
  if (!v5) {
    goto LABEL_15;
  }
  v6 = [v4 accountKeyHash];
  [(KTAccount *)v5 setAccountKeyHash:v6];

  uint64_t v7 = +[NSMutableArray array];
  [(KTAccount *)v5 setDevices:v7];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [v4 devicesArray];
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [[KTDevice alloc] initWithIdsDevice:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        id v14 = [(KTAccount *)v5 devices];
        [v14 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v10);
  }

  id v24 = 0;
  uint64_t v15 = [v4 sortedOptInOutHistory:&v24];
  id v16 = v24;
  id v17 = [v15 mutableCopy];
  [(KTAccount *)v5 setOptInOutHistory:v17];

  if (v16)
  {
    if (qword_10032EE78 != -1) {
      dispatch_once(&qword_10032EE78, &stru_1002C48A0);
    }
    long long v18 = (void *)qword_10032EE80;
    if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      long long v20 = [(KTAccount *)v5 accountKeyHash];
      long long v21 = [v20 kt_hexString];
      *(_DWORD *)buf = 138412546;
      v31 = v21;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create account for %@: %@", buf, 0x16u);
    }
    long long v22 = 0;
  }
  else
  {
LABEL_15:
    long long v22 = v5;
  }

  return v22;
}

- (KTAccount)initWithMutation:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)KTAccount;
  uint64_t v5 = [(KTAccount *)&v19 init];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = [v4 accountKeyHash];
  accountKeyHash = v5->_accountKeyHash;
  v5->_accountKeyHash = (NSData *)v6;

  uint64_t v8 = [[KTDevice alloc] initWithMutation:v4];
  uint64_t v9 = +[NSMutableArray arrayWithObject:v8];
  devices = v5->_devices;
  v5->_devices = (NSMutableArray *)v9;

  uint64_t v11 = +[NSMutableArray array];
  optInOutHistory = v5->_optInOutHistory;
  v5->_optInOutHistory = (NSMutableArray *)v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v13 = [v4 extensions];
  id v18 = 0;
  [(KTAccount *)v5 updateWithExtensions:v13 error:&v18];
  id v14 = v18;

  if (v14)
  {
    if (qword_10032EE78 != -1) {
      dispatch_once(&qword_10032EE78, &stru_1002C48C0);
    }
    uint64_t v15 = qword_10032EE80;
    if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "unable to create account record: %@", buf, 0xCu);
    }

    id v16 = 0;
  }
  else
  {
LABEL_9:
    id v16 = v5;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTAccount *)a3;
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
      uint64_t v6 = [(KTAccount *)self accountKey];
      uint64_t v7 = [(KTAccount *)v5 accountKey];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(KTAccount *)self accountKey];
        id v10 = [(KTAccount *)v5 accountKey];
        unsigned int v11 = [v9 isEqualToData:v10];

        if (!v11) {
          goto LABEL_15;
        }
      }
      id v13 = [(KTAccount *)self accountKeyHash];
      uint64_t v14 = [(KTAccount *)v5 accountKeyHash];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        uint64_t v15 = (void *)v14;
        id v16 = [(KTAccount *)self accountKeyHash];
        id v17 = [(KTAccount *)v5 accountKeyHash];
        unsigned int v18 = [v16 isEqualToData:v17];

        if (!v18) {
          goto LABEL_15;
        }
      }
      objc_super v19 = [(KTAccount *)self devices];
      uint64_t v20 = [(KTAccount *)v5 devices];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        id v21 = (void *)v20;
        long long v22 = [(KTAccount *)self devices];
        long long v23 = [(KTAccount *)v5 devices];
        unsigned __int8 v24 = [v22 isEqual:v23];

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

- (BOOL)marked:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(KTAccount *)self devices];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) marked:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)expired:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(KTAccount *)self devices];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) expired:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)active:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(KTAccount *)self devices];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) active:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)deviceForDeviceIdHash:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = self->_devices;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          long long v11 = [v10 deviceIDHash:v15];
          unsigned __int8 v12 = [v11 isEqualToData:v4];

          if (v12)
          {
            id v13 = v10;

            goto LABEL_15;
          }
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else if ([(NSMutableArray *)self->_devices count] == (id)1)
  {
    id v13 = [(NSMutableArray *)self->_devices objectAtIndexedSubscript:0];
    goto LABEL_15;
  }
  id v13 = 0;
LABEL_15:

  return v13;
}

- (id)optInRecord
{
  uint64_t v3 = [(KTAccount *)self optInOutHistory];
  if (v3
    && (id v4 = (void *)v3,
        [(KTAccount *)self optInOutHistory],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    id v7 = [(KTAccount *)self optInOutHistory];
    uint64_t v8 = [v7 lastObject];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)optInHistory
{
  uint64_t v3 = [(KTAccount *)self optInOutHistory];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = [(KTAccount *)self optInOutHistory];
    id v6 = [v5 count];

    if (v6)
    {
      uint64_t v3 = [(KTAccount *)self optInOutHistory];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

- (BOOL)optInState
{
  v2 = [(KTAccount *)self optInRecord];
  unsigned __int8 v3 = [v2 optIn];

  return v3;
}

- (BOOL)everOptedIn
{
  id v3 = [(KTAccount *)self optInOutHistory];
  if (v3)
  {
    id v4 = [(KTAccount *)self optInOutHistory];
    id v5 = [v4 count];

    if (v5)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v6 = [(KTAccount *)self optInOutHistory];
      id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v6);
            }
            if ([*(id *)(*((void *)&v10 + 1) + 8 * i) optIn])
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
          id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v3) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (BOOL)recentlyOptedIn
{
  id v3 = [(KTAccount *)self optInOutHistory];
  if (v3)
  {
    id v4 = [(KTAccount *)self optInOutHistory];
    id v5 = [v4 count];

    if (v5)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v6 = [(KTAccount *)self optInOutHistory];
      id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v6);
            }
            if ([*(id *)(*((void *)&v10 + 1) + 8 * i) optIn])
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
          id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v3) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)kvsOptInOutEntry:(id)a3 before:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 lastObject];
  uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  id v9 = [v6 compare:v8];

  if (v9 == (id)-1)
  {
    long long v11 = (char *)[v5 count] - 1;
    while (1)
    {
      long long v12 = [v5 objectAtIndexedSubscript:v11];
      long long v13 = [v12 objectAtIndexedSubscript:0];
      id v14 = [v6 compare:v13];

      if (v14 != (id)-1) {
        break;
      }
      if (--v11 == (char *)-1) {
        goto LABEL_8;
      }
    }
    long long v10 = [v5 objectAtIndexedSubscript:v11];
    if (v10) {
      goto LABEL_9;
    }
LABEL_8:
    long long v15 = [v5 firstObject];
    long long v16 = [v15 objectAtIndexedSubscript:1];
    unsigned int v17 = [v16 BOOLValue];

    long long v18 = +[NSDate dateWithTimeIntervalSince1970:0.0];
    v21[0] = v18;
    objc_super v19 = +[NSNumber numberWithInt:v17 ^ 1];
    v21[1] = v19;
    long long v10 = +[NSArray arrayWithObjects:v21 count:2];
  }
  else
  {
    long long v10 = [v5 lastObject];
  }
LABEL_9:

  return v10;
}

- (BOOL)validateEmptyOptInOutHistory:(id)a3 responseTime:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(KTAccount *)self optInOutHistory];
  unint64_t v11 = (unint64_t)[v10 count];

  unint64_t v12 = (unint64_t)[v8 count];
  if (!(v11 | v12))
  {
LABEL_2:
    char v13 = 1;
    goto LABEL_29;
  }
  if (v11)
  {
    if (!v12)
    {
      id v14 = [(KTAccount *)self optInOutHistory];
      long long v15 = [v14 lastObject];
      unsigned int v16 = [v15 optIn];

      if (!v16)
      {
        if (qword_10032EE78 != -1) {
          dispatch_once(&qword_10032EE78, &stru_1002C4940);
        }
        long long v28 = qword_10032EE80;
        if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)objc_super v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "opt-in state match: kvs = <null>; kt = 0",
            v29,
            2u);
        }
        goto LABEL_2;
      }
      if (qword_10032EE78 != -1) {
        dispatch_once(&qword_10032EE78, &stru_1002C4920);
      }
      unsigned int v17 = qword_10032EE80;
      if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "opt-in state mismatch: kvs = <null>; kt = 1",
          buf,
          2u);
      }
      long long v18 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-289 description:@"Opt-in state mismatch: kvs = <null> kt = 1"];;
      objc_super v19 = v18;
      if (a5 && v18) {
        *a5 = v18;
      }
    }
    char v13 = 0;
    goto LABEL_29;
  }
  uint64_t v20 = [(KTAccount *)self kvsOptInOutEntry:v8 before:v9];
  id v21 = [v20 objectAtIndexedSubscript:1];
  unsigned int v22 = [v21 BOOLValue];

  if (v22)
  {
    if (qword_10032EE78 != -1) {
      dispatch_once(&qword_10032EE78, &stru_1002C48E0);
    }
    long long v23 = qword_10032EE80;
    if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "opt-in state mismatch: kvs = 1; kt = <null>",
        v32,
        2u);
    }
    unsigned __int8 v24 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-289 description:@"Opt-in state mismatch: kvs = 1 kt = <null>"];;
    long long v25 = v24;
    if (a5 && v24) {
      *a5 = v24;
    }
  }
  else
  {
    if (qword_10032EE78 != -1) {
      dispatch_once(&qword_10032EE78, &stru_1002C4900);
    }
    long long v26 = qword_10032EE80;
    if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "opt-in state match: kvs = 0; kt = <null>",
        v31,
        2u);
    }
  }
  char v13 = v22 ^ 1;

LABEL_29:
  return v13;
}

- (BOOL)validateOptInHistory:(id)a3 responseTime:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    long long v10 = [(KTAccount *)self optInOutHistory];
    id v11 = [v10 count];

    if (v11)
    {
      unint64_t v12 = [(KTAccount *)self kvsOptInOutEntry:v8 before:v9];
      char v13 = [v12 objectAtIndexedSubscript:1];
      id v14 = [v13 BOOLValue];

      if (v14 == [(KTAccount *)self optInState])
      {
        if (!v14)
        {
          BOOL v19 = 1;
LABEL_34:

          goto LABEL_35;
        }
        uint64_t v20 = [v12 objectAtIndexedSubscript:0];
        [v20 timeIntervalSince1970];
        double v22 = v21;

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v23 = [(KTAccount *)self optInOutHistory];
        id v18 = [v23 reverseObjectEnumerator];

        id v24 = [v18 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v24)
        {
          id v25 = v24;
          long long v35 = v12;
          uint64_t v26 = *(void *)v37;
          while (2)
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v37 != v26) {
                objc_enumerationMutation(v18);
              }
              long long v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              if ((unint64_t)v22 < (unint64_t)[v28 timestampMs] / 0x3E8
                && ([v28 optIn] & 1) == 0)
              {
                if (qword_10032EE78 != -1) {
                  dispatch_once(&qword_10032EE78, &stru_1002C4980);
                }
                unint64_t v12 = v35;
                objc_super v29 = (void *)qword_10032EE80;
                if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_ERROR))
                {
                  v30 = v29;
                  unint64_t v31 = (unint64_t)[v28 timestampMs];
                  *(_DWORD *)buf = 134218240;
                  *(void *)long long v41 = v31 / 0x3E8;
                  *(_WORD *)&v41[8] = 2048;
                  unint64_t v42 = (unint64_t)v22;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Detected opt-out at %llu after kvs opt-in at %llu", buf, 0x16u);
                }
                __int16 v32 = +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", @"TransparencyErrorVerify", -322, @"Detected opt-out at %llu after kvs opt-in at %llu", (unint64_t)[v28 timestampMs] / 0x3E8, (unint64_t)v22);
                id v33 = v32;
                if (a5 && v32) {
                  *a5 = v32;
                }

                BOOL v19 = 0;
                goto LABEL_33;
              }
            }
            id v25 = [v18 countByEnumeratingWithState:&v36 objects:v43 count:16];
            BOOL v19 = 1;
            if (v25) {
              continue;
            }
            break;
          }
          unint64_t v12 = v35;
        }
        else
        {
          BOOL v19 = 1;
        }
      }
      else
      {
        if (qword_10032EE78 != -1) {
          dispatch_once(&qword_10032EE78, &stru_1002C4960);
        }
        long long v15 = (void *)qword_10032EE80;
        if (os_log_type_enabled((os_log_t)qword_10032EE80, OS_LOG_TYPE_ERROR))
        {
          unsigned int v16 = v15;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)long long v41 = [(KTAccount *)self optInState];
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "current opt-in state mismatch: kt = %d, kvs = %d", buf, 0xEu);
        }
        unsigned int v17 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -289, @"Current opt-in state mismatch: kt = %d, kvs = %d", [(KTAccount *)self optInState], v14 code description];
        id v18 = v17;
        BOOL v19 = 0;
        if (a5 && v17)
        {
          id v18 = v17;
          BOOL v19 = 0;
          *a5 = v18;
        }
      }
LABEL_33:

      goto LABEL_34;
    }
  }
  BOOL v19 = [(KTAccount *)self validateEmptyOptInOutHistory:v8 responseTime:v9 error:a5];
LABEL_35:

  return v19;
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = [v9 deviceIdHash];
  uint64_t v7 = [(KTAccount *)self deviceForDeviceIdHash:v6];

  if (v7)
  {
    [(KTDevice *)v7 updateWithAddMutation:v9 error:a4];
  }
  else
  {
    uint64_t v7 = [[KTDevice alloc] initWithMutation:v9];
    [(KTAccount *)self addDevicesObject:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v9 extensions];
    [(KTAccount *)self updateWithExtensions:v8 error:a4];
  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  id v8 = a3;
  id v6 = [v8 deviceIdHash];
  uint64_t v7 = [(KTAccount *)self deviceForDeviceIdHash:v6];

  if (v7) {
    [v7 updateWithMarkDeleteMutation:v8 error:a4];
  }
}

- (void)updateWithDeviceStateArray:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v3;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [*(id *)(*((void *)&v30 + 1) + 8 * i) deviceIdHash];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    id v11 = [(KTAccount *)self devices];
    unint64_t v12 = +[NSArray arrayWithArray:v11];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
          BOOL v19 = [v18 deviceIDHash];
          unsigned __int8 v20 = [v4 containsObject:v19];

          if (v20)
          {
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_100192A58;
            v25[3] = &unk_1002C49A8;
            v25[4] = v18;
            double v21 = [v5 indexesOfObjectsPassingTest:v25];
            double v22 = [v5 objectsAtIndexes:v21];
            [v18 updateWithDeviceStateArray:v22];
          }
          else
          {
            [(KTAccount *)self removeDevicesObject:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v15);
    }

    id v3 = v23;
  }
}

- (void)updateWithExtensions:(id)a3 error:(id *)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "extensionType", (void)v15) == 3)
        {
          unint64_t v12 = [v11 extensionData];
          id v13 = +[OptInOutWithExt parseFromData:v12 error:0];

          if ([(KTAccount *)self updateWithOptInOutWithExt:v13 error:a4]
            && [v13 optIn])
          {
            id v14 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v13 timestampMs] / 1000.0);
            [(KTAccount *)self deleteMarkedEntries:v14];
          }
          goto LABEL_14;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (BOOL)updateWithOptInOutWithExt:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(KTAccount *)self optInOutHistory];
  id v7 = [v6 count];

  id v8 = [(KTAccount *)self optInOutHistory];
  uint64_t v9 = v8;
  if (!v7) {
    goto LABEL_5;
  }
  long long v10 = [v8 lastObject];
  id v11 = [v10 timestampMs];
  id v12 = [v5 timestampMs];

  id v13 = [(KTAccount *)self optInOutHistory];
  id v14 = v13;
  if (v11 >= v12)
  {
    id v18 = [v13 count];

    unint64_t v19 = 0;
    if (v18)
    {
      while (1)
      {
        unsigned __int8 v20 = [(KTAccount *)self optInOutHistory];
        double v21 = [v20 objectAtIndexedSubscript:v19];
        LOBYTE(v18) = [v5 isEqual:v21];

        if (v18) {
          break;
        }
        double v22 = [(KTAccount *)self optInOutHistory];
        id v23 = [v22 objectAtIndexedSubscript:v19];
        id v24 = [v23 timestampMs];
        id v25 = [v5 timestampMs];

        if (v24 > v25) {
          break;
        }
        ++v19;
        long long v26 = [(KTAccount *)self optInOutHistory];
        id v27 = [v26 count];

        if (v19 >= (unint64_t)v27)
        {
          LOBYTE(v18) = 0;
          goto LABEL_13;
        }
      }
      if (!v19) {
        goto LABEL_14;
      }
LABEL_13:
      long long v29 = [(KTAccount *)self optInOutHistory];
      long long v30 = [v29 objectAtIndexedSubscript:v19 - 1];
      unsigned __int8 v31 = [v30 optIn];
      char v32 = v31 ^ [v5 optIn] ^ 1;
    }
    else
    {
LABEL_14:
      char v32 = 0;
    }
    BOOL v28 = 0;
    if ((v18 & 1) == 0 && (v32 & 1) == 0)
    {
      uint64_t v9 = [(KTAccount *)self optInOutHistory];
      [v9 insertObject:v5 atIndex:v19];
      goto LABEL_18;
    }
  }
  else
  {
    long long v15 = [v13 lastObject];
    unsigned int v16 = [v15 optIn];
    unsigned int v17 = [v5 optIn];

    if (v16 != v17)
    {
      id v8 = [(KTAccount *)self optInOutHistory];
      uint64_t v9 = v8;
LABEL_5:
      [v8 addObject:v5];
LABEL_18:

      BOOL v28 = 1;
      goto LABEL_19;
    }
    BOOL v28 = 0;
  }
LABEL_19:

  return v28;
}

- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = [[OptInOutWithExt alloc] initWithMutation:v9];
  if ([(KTAccount *)self updateWithOptInOutWithExt:v6 error:a4]
    && [(OptInOut *)v6 optIn])
  {
    id v7 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v9 timestampMs] / 1000.0);
    [(KTAccount *)self deleteMarkedEntries:v7];
    id v8 = [v9 devicesArray];
    [(KTAccount *)self updateWithDeviceStateArray:v8];
  }
}

- (void)removeDevicesObject:(id)a3
{
}

- (void)addDevicesObject:(id)a3
{
}

- (BOOL)shouldRemove
{
  v2 = [(KTAccount *)self devices];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)cleanupDevices
{
  BOOL v3 = [(KTAccount *)self devices];
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
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 cleanupRecords];
        if ([v10 shouldRemove]) {
          [(KTAccount *)self removeDevicesObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)deleteMarkedEntries:(id)a3
{
  id v4 = a3;
  id v5 = [(KTAccount *)self devices];
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
          [(KTAccount *)self removeDevicesObject:v12];
        }
        [v12 deleteMarkedEntries:v4];
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountKey:(id)a3
{
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSMutableArray)devices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevices:(id)a3
{
}

- (NSMutableArray)optInOutHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptInOutHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInOutHistory, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_accountKeyHash, 0);

  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end