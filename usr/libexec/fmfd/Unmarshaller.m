@interface Unmarshaller
+ (id)sharedInstance;
- (BOOL)isValidPendingOffer:(id)a3;
- (id)_handleWithData:(id)a3 withHandlesKey:(id)a4 forIdentifier:(id)a5;
- (id)devicesFromData:(id)a3 meDeviceId:(id)a4 thisDeviceId:(id)a5 companionDeviceId:(id)a6;
- (id)followersUsingData:(id)a3;
- (id)friendRequestsFromData:(id)a3 forType:(int64_t)a4;
- (id)handlesFromData:(id)a3 forType:(int64_t)a4;
- (id)handlesFromData:(id)a3 withHandlesKey:(id)a4;
- (id)locationFromRefresh:(id)a3;
- (id)pendingHandleFromData:(id)a3 withEmailKey:(id)a4;
- (id)updateFollowers:(id)a3 withCombinedGroupIdsFromPending:(id)a4;
@end

@implementation Unmarshaller

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000168F4;
  block[3] = &unk_1000A1440;
  block[4] = a1;
  if (qword_1000BB720 != -1) {
    dispatch_once(&qword_1000BB720, block);
  }
  v2 = (void *)qword_1000BB728;

  return v2;
}

- (id)locationFromRefresh:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"locations"];
  v5 = NSFileManager_ptr;
  uint64_t v6 = +[NSNull null];
  if (v4 == (void *)v6)
  {

    id v8 = 0;
  }
  else
  {
    v7 = (void *)v6;
    id v8 = [v3 objectForKey:@"locations"];

    if (v8)
    {
      id v36 = v3;
      v9 = +[NSMutableDictionary dictionary];
      v11 = +[FMFUtils shiftLocations:v8];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v8 = v11;
      id v38 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (!v38) {
        goto LABEL_24;
      }
      uint64_t v12 = *(void *)v40;
      uint64_t v37 = *(void *)v40;
      while (1)
      {
        v13 = 0;
        do
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v13);
          v15 = [v14 objectForKey:@"id"];
          v16 = [v5[15] null];
          if (v15 == v16)
          {
            v17 = 0;
          }
          else
          {
            v17 = [v14 objectForKey:@"id"];
          }

          v18 = +[FMFDataManager sharedInstance];
          v19 = [v18 followingHandleForServerId:v17];

          if (!v19 || !v17) {
            goto LABEL_17;
          }
          v20 = [v19 serverId];
          if ([v20 isEqualToString:v17]) {
            goto LABEL_16;
          }
          id v21 = v8;
          v22 = v9;
          v23 = v5;
          v24 = [v19 aliasServerIds];
          unsigned int v25 = [v24 containsObject:v17];

          if (v25)
          {
            v20 = [v19 identifier];
            uint64_t v26 = +[FMFHandle handleWithId:v20 serverId:v17];

            v19 = (void *)v26;
            v5 = v23;
            v9 = v22;
            id v8 = v21;
            uint64_t v12 = v37;
LABEL_16:

LABEL_17:
            if (!v19) {
              goto LABEL_20;
            }
            goto LABEL_18;
          }
          v5 = v23;
          v9 = v22;
          id v8 = v21;
          uint64_t v12 = v37;
LABEL_18:
          if (v17)
          {
            v27 = +[FMFDataManager sharedInstance];
            [v27 maxLocatingInterval];
            double v29 = v28;

            v30 = +[FMFDataManager sharedInstance];
            [v30 locationTTL];
            double v32 = v31;

            id v33 = [objc_alloc((Class)FMFLocation) initWithDictionary:v14 forHandle:v19 maxLocatingInterval:v29 TTL:v32];
            [v9 setObject:v33 forKey:v17];
          }
LABEL_20:

          v13 = (char *)v13 + 1;
        }
        while (v38 != v13);
        id v34 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
        id v38 = v34;
        if (!v34)
        {
LABEL_24:

          id v3 = v36;
          goto LABEL_27;
        }
      }
    }
  }
  v9 = 0;
LABEL_27:

  return v9;
}

- (BOOL)isValidPendingOffer:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"expires"];
  v5 = +[NSNull null];
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"expires"];
  }

  if ([v6 isEqualToNumber:&off_1000A8F20])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[NSDate date];
    [v8 timeIntervalSince1970];
    v10 = +[NSNumber numberWithDouble:v9 * 1000.0];

    BOOL v7 = [v6 compare:v10] == (id)1;
  }

  return v7;
}

- (id)handlesFromData:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if ((unint64_t)a4 > 4)
  {
    long long v39 = 0;
    id v8 = 0;
  }
  else
  {
    long long v39 = off_1000A1E88[a4];
    id v8 = off_1000A1EB0[a4];
  }
  double v9 = [v6 objectForKeyedSubscript:v8];
  uint64_t v10 = +[NSNull null];
  id v34 = v7;
  if (v9 == (void *)v10)
  {

    goto LABEL_33;
  }
  v11 = (void *)v10;
  uint64_t v12 = [v7 objectForKeyedSubscript:v8];

  if (!v12)
  {
LABEL_33:
    id v14 = 0;
    v13 = 0;
    goto LABEL_34;
  }
  v13 = +[NSMutableSet set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v47;
    uint64_t v37 = self;
    int64_t v38 = a4;
    uint64_t v35 = *(void *)v47;
    id v36 = v14;
    do
    {
      v18 = 0;
      id v40 = v16;
      do
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * (void)v18);
        if (a4 == 4)
        {
          if ([(Unmarshaller *)self isValidPendingOffer:*(void *)(*((void *)&v46 + 1) + 8 * (void)v18)])
          {
            v20 = [(Unmarshaller *)self pendingHandleFromData:v19 withEmailKey:@"invitationFromHandle"];
            [v20 setPending:1];
            [v13 addObject:v20];
          }
          else
          {
            v20 = sub_100005560();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v52 = v19;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Filtering out expired pending offer: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          long long v41 = v18;
          v20 = [(Unmarshaller *)self handlesFromData:v19 withHandlesKey:v39];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v21 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v43;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v43 != v23) {
                  objc_enumerationMutation(v20);
                }
                unsigned int v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                uint64_t v26 = [v13 member:v25];
                v27 = v26;
                if (v26)
                {
                  double v28 = [v26 aliasServerIds];
                  if (v28)
                  {
                    double v29 = [v27 aliasServerIds];
                    id v30 = [v29 mutableCopy];
                  }
                  else
                  {
                    id v30 = +[NSMutableArray array];
                  }

                  double v31 = [v25 serverId];
                  [v30 addObject:v31];

                  [v27 setAliasServerIds:v30];
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v22);
          }
          double v32 = [v20 allObjects];
          [v13 addObjectsFromArray:v32];

          self = v37;
          a4 = v38;
          uint64_t v17 = v35;
          id v14 = v36;
          id v16 = v40;
          v18 = v41;
        }

        v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      id v16 = [v14 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v16);
  }

LABEL_34:

  return v13;
}

- (id)followersUsingData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"followers"];
  id v6 = +[NSNull null];
  if (v5 == v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"followers"];
  }
  id v8 = [v4 objectForKeyedSubscript:@"pendingOffers"];
  double v9 = +[NSNull null];
  if (v8 == v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v4 objectForKeyedSubscript:@"pendingOffers"];
  }

  if (v7 | v10)
  {
    if (v7 && v10)
    {
      v11 = [(Unmarshaller *)self handlesFromData:v4 forType:0];
    }
    else
    {
      if (v7 && !v10)
      {
        v11 = [(Unmarshaller *)self handlesFromData:v4 forType:0];
        id v14 = +[FMFDataManager sharedInstance];
        uint64_t v12 = [v14 pendingOfferHandles];

        if (v11) {
          goto LABEL_21;
        }
        goto LABEL_23;
      }
      uint64_t v12 = 0;
      if (v7 || !v10)
      {
        v11 = 0;
        id v13 = 0;
        goto LABEL_28;
      }
      id v15 = +[FMFDataManager sharedInstance];
      id v16 = [v15 followerHandles];

      v11 = [v16 objectsPassingTest:&stru_1000A1E68];
    }
    uint64_t v12 = [(Unmarshaller *)self handlesFromData:v4 forType:4];
    if (v11)
    {
LABEL_21:
      if (v12)
      {
        id v13 = [(Unmarshaller *)self updateFollowers:v11 withCombinedGroupIdsFromPending:v12];
        goto LABEL_28;
      }
    }
LABEL_23:
    if (v11)
    {
      id v13 = v11;
      v11 = v13;
      goto LABEL_28;
    }
    if (v12)
    {
      id v13 = v12;
      uint64_t v12 = v13;
      v11 = 0;
      goto LABEL_28;
    }
    goto LABEL_12;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_12:
  v11 = 0;
  id v13 = 0;
LABEL_28:
  id v17 = v13;

  return v17;
}

- (id)updateFollowers:(id)a3 withCombinedGroupIdsFromPending:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v6 member:v11];
        if (v12)
        {
          id v13 = [v11 expiresByGroupId];
          id v14 = [v13 mutableCopy];

          if (!v14)
          {
            id v14 = [v12 expiresByGroupId];

            if (v14)
            {
              id v14 = +[NSMutableDictionary dictionary];
            }
          }
          id v15 = [v12 expiresByGroupId];
          [v14 addEntriesFromDictionary:v15];

          [v11 setExpiresByGroupId:v14];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  id v16 = [v5 setByAddingObjectsFromSet:v6];

  return v16;
}

- (id)devicesFromData:(id)a3 meDeviceId:(id)a4 thisDeviceId:(id)a5 companionDeviceId:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v53 = a5;
  id v11 = a6;
  id v54 = +[NSMutableSet set];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v9;
  id v55 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
  if (v55)
  {
    uint64_t v12 = 0;
    id v13 = 0;
    id v14 = 0;
    uint64_t v51 = *(void *)v60;
    id v52 = v11;
    id v44 = v10;
    do
    {
      id v15 = 0;
      id v16 = v12;
      id v17 = v13;
      long long v18 = v14;
      do
      {
        if (*(void *)v60 != v51) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v15);
        long long v20 = [v19 objectForKey:@"id"];
        long long v21 = +[NSNull null];
        if (v20 == v21)
        {
          v58 = 0;
        }
        else
        {
          v58 = [v19 objectForKey:@"id"];
        }

        id v22 = [v19 objectForKey:@"name"];
        uint64_t v23 = +[NSNull null];
        if (v22 == v23)
        {
          uint64_t v57 = 0;
        }
        else
        {
          uint64_t v57 = [v19 objectForKey:@"name"];
        }

        v24 = [v19 objectForKey:@"idsDeviceId"];
        unsigned int v25 = +[NSNull null];
        if (v24 == v25)
        {
          uint64_t v56 = 0;
        }
        else
        {
          uint64_t v56 = [v19 objectForKey:@"idsDeviceId"];
        }
        id v13 = (void *)v57;

        uint64_t v26 = [v19 objectForKey:@"autoMeCapable"];
        v27 = +[NSNull null];
        if (v26 == v27)
        {
          double v28 = 0;
        }
        else
        {
          double v28 = [v19 objectForKey:@"autoMeCapable"];
        }
        id v14 = v58;
        uint64_t v12 = (void *)v56;

        id v29 = [v58 isEqualToString:v10];
        id v30 = [v58 isEqualToString:v53];
        if (v11) {
          id v11 = [v58 isEqualToString:v11];
        }
        LOBYTE(v43) = [v28 BOOLValue];
        double v31 = +[FMFDevice deviceWithId:v58 name:v57 idsDeviceId:v56 isActive:v29 isThisDevice:v30 isCompanionDevice:v11 isAutoMeCapable:v43];
        [v54 addObject:v31];
        double v32 = sub_100005560();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          long long v48 = [v31 deviceName];
          v50 = [v31 deviceName];
          id v47 = [v50 length];
          uint64_t v33 = [v31 deviceId];
          long long v49 = [v31 deviceId];
          id v46 = [v49 length];
          unsigned int v34 = [v31 isActiveDevice];
          uint64_t v35 = v28;
          unsigned int v36 = [v31 isThisDevice];
          uint64_t v37 = [v31 idsDeviceId];
          int64_t v38 = [v31 idsDeviceId];
          id v39 = [v38 length];
          *(_DWORD *)buf = 138414082;
          id v64 = v48;
          __int16 v65 = 2048;
          id v66 = v47;
          __int16 v67 = 2112;
          uint64_t v68 = v33;
          id v40 = (void *)v33;
          __int16 v69 = 2048;
          id v70 = v46;
          __int16 v71 = 1024;
          unsigned int v72 = v34;
          id v13 = (void *)v57;
          id v14 = v58;
          __int16 v73 = 1024;
          unsigned int v74 = v36;
          double v28 = v35;
          __int16 v75 = 2112;
          v76 = v37;
          __int16 v77 = 2048;
          id v78 = v39;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "devicesFromData %@(%lu) [%@(%lu)] {meDevice=%i} {thisDevice=%i} {idsDeviceId=%@(%lu)}", buf, 0x4Au);

          uint64_t v12 = (void *)v56;
          id v10 = v44;
        }
        id v15 = (char *)v15 + 1;
        id v16 = v12;
        id v17 = v13;
        long long v18 = v14;
        id v11 = v52;
      }
      while (v55 != v15);
      id v55 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
    }
    while (v55);
  }
  long long v41 = sub_100005560();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v54;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Unmarshalling finished for devices %@", buf, 0xCu);
  }

  return v54;
}

- (id)handlesFromData:(id)a3 withHandlesKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableSet set];
  id v9 = [v6 objectForKey:v7];
  id v10 = +[NSNull null];
  if (v9 == v10)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = [v6 objectForKey:v7];
  }

  uint64_t v12 = [v11 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = -[Unmarshaller _handleWithData:withHandlesKey:forIdentifier:](self, "_handleWithData:withHandlesKey:forIdentifier:", v6, v7, *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        [v8 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v8;
}

- (id)_handleWithData:(id)a3 withHandlesKey:(id)a4 forIdentifier:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = [v6 objectForKey:@"id"];
  id v9 = +[NSNull null];
  if (v8 == v9)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [v6 objectForKey:@"id"];
  }

  id v11 = +[FMFHandle handleWithId:v7 serverId:v10];

  uint64_t v12 = [v6 objectForKey:@"invitationSentToHandles"];
  id v13 = +[NSNull null];
  if (v12 == v13)
  {
    [v11 setInvitationSentToIds:0];
  }
  else
  {
    id v14 = [v6 objectForKey:@"invitationSentToHandles"];
    [v11 setInvitationSentToIds:v14];
  }
  id v15 = [v6 objectForKey:@"expiresByGroupId"];
  uint64_t v16 = +[NSNull null];
  if (v15 == v16)
  {
    [v11 setExpiresByGroupId:0];
  }
  else
  {
    id v17 = [v6 objectForKey:@"expiresByGroupId"];
    [v11 setExpiresByGroupId:v17];
  }
  long long v18 = [v6 objectForKey:@"personIdHash"];
  long long v19 = +[NSNull null];
  if (v18 == v19)
  {
    [v11 setHashedDSID:0];
  }
  else
  {
    long long v20 = [v6 objectForKey:@"personIdHash"];
    [v11 setHashedDSID:v20];
  }

  return v11;
}

- (id)pendingHandleFromData:(id)a3 withEmailKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:v6];
  id v8 = +[NSNull null];
  if (v7 == v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v5 objectForKey:v6];
  }

  id v10 = [v5 objectForKey:@"id"];
  id v11 = +[NSNull null];
  if (v10 == v11)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [v5 objectForKey:@"id"];
  }

  id v13 = +[FMFHandle handleWithId:v9 serverId:v12];
  id v14 = [v5 objectForKey:@"personIdHash"];
  id v15 = +[NSNull null];
  if (v14 == v15)
  {
    [v13 setHashedDSID:0];
  }
  else
  {
    uint64_t v16 = [v5 objectForKey:@"personIdHash"];
    [v13 setHashedDSID:v16];
  }
  id v17 = [v5 objectForKey:@"invitationSentToHandle"];
  if (v17)
  {
    long long v18 = +[NSArray arrayWithObject:v17];
    [v13 setInvitationSentToIds:v18];
  }
  long long v19 = [v5 objectForKey:@"groupId"];
  long long v20 = +[NSNull null];
  if (v19 == v20)
  {
    long long v21 = 0;
  }
  else
  {
    long long v21 = [v5 objectForKey:@"groupId"];
  }

  long long v22 = [v5 objectForKey:@"expires"];
  long long v23 = +[NSNull null];
  if (v22 == v23)
  {
    v24 = 0;
  }
  else
  {
    v24 = [v5 objectForKey:@"expires"];
  }

  if (v21 && v24)
  {
    unsigned int v25 = +[NSDictionary dictionaryWithObject:v24 forKey:v21];
    [v13 setExpiresByGroupId:v25];
  }

  return v13;
}

- (id)friendRequestsFromData:(id)a3 forType:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 2)
  {
    int v48 = 0;
    CFStringRef v7 = @"futureFollowers";
    int v47 = 1;
    uint64_t v46 = 1;
    CFStringRef v8 = @"invitationFromEmail";
  }
  else
  {
    if (a4 != 3)
    {
LABEL_37:
      id v12 = 0;
      goto LABEL_38;
    }
    uint64_t v46 = 0;
    int v47 = 0;
    CFStringRef v7 = @"futureFollowing";
    int v48 = 1;
    CFStringRef v8 = @"invitationSentToEmail";
  }
  CFStringRef v45 = v8;
  id v9 = [v5 valueForKey:v7];
  uint64_t v10 = +[NSNull null];
  if (v9 == (void *)v10)
  {

    goto LABEL_37;
  }
  id v11 = (void *)v10;
  id v12 = [v6 valueForKey:v7];

  if (!v12)
  {
LABEL_38:
    id v49 = 0;
    goto LABEL_39;
  }
  long long v42 = v6;
  id v49 = +[NSMutableSet set];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v12 = v12;
  id v50 = [v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v50)
  {
    uint64_t v44 = *(void *)v52;
    id obj = v12;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v52 != v44) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v15 = [v14 objectForKey:v45];
        uint64_t v16 = +[NSNull null];
        if (v15 == v16) {
          id v17 = 0;
        }
        else {
          id v17 = v15;
        }
        id v18 = v17;

        long long v19 = [v14 objectForKey:@"id"];
        long long v20 = +[NSNull null];
        if (v19 == v20) {
          long long v21 = 0;
        }
        else {
          long long v21 = v19;
        }
        id v22 = v21;

        long long v23 = [v14 objectForKey:@"groupId"];
        v24 = +[NSNull null];
        if (v23 == v24) {
          unsigned int v25 = 0;
        }
        else {
          unsigned int v25 = v23;
        }
        id v26 = v25;

        v27 = [v14 objectForKey:@"expires"];
        double v28 = +[NSNull null];
        if (v27 == v28) {
          id v29 = 0;
        }
        else {
          id v29 = v27;
        }
        id v30 = v29;

        [v30 doubleValue];
        if (v31 == 0.0)
        {
          uint64_t v33 = 0;
        }
        else
        {
          [v30 doubleValue];
          uint64_t v33 = +[NSDate dateWithTimeIntervalSince1970:v32 / 1000.0];
        }
        uint64_t v34 = +[FMFHandle handleWithId:v18 serverId:v22];
        uint64_t v35 = (void *)v34;
        if (v47) {
          unsigned int v36 = (void *)v34;
        }
        else {
          unsigned int v36 = 0;
        }
        if (v48) {
          uint64_t v37 = (void *)v34;
        }
        else {
          uint64_t v37 = 0;
        }
        id v38 = v37;
        id v39 = v36;
        id v40 = [objc_alloc((Class)FMFFriendshipRequest) initWithFromHandle:v39 toHandle:v38 ofType:v46 groupId:v26 endDate:v33 requestId:v22];

        [v49 addObject:v40];
      }
      id v12 = obj;
      id v50 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v50);
  }

  id v6 = v42;
LABEL_39:

  return v49;
}

@end