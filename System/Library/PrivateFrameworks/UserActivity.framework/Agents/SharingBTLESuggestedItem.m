@interface SharingBTLESuggestedItem
+ (id)cornerActionBTLEItemWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 scanner:(id)a7 receiver:(id)a8;
+ (id)cornerActionBTLEItemWithSFAdvertisement:(id)a3 optionBits:(unsigned int)a4 scanner:(id)a5 receiver:(id)a6;
+ (id)statusString;
- (BOOL)requestPayloadWithCompletionHandler:(id)a3;
- (BOOL)updateFromSFAdvertisement:(id)a3;
- (NSDate)currentUntilDate;
- (NSDate)dontPrefetchBefore;
- (NSDate)removeAfter;
- (NSMutableSet)payloadRequestedCompletions;
- (NSSet)teamIDs;
- (SFActivityScanner)scanner;
- (SharingBTLEAdvertisementPayload)advertisementPayload;
- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13;
- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13 dynamicIdentifier:(id)a14;
- (UACornerActionManager)manager;
- (UASharingReceiver)receiver;
- (double)payloadAvailabilityDelay;
- (id)description;
- (id)statusString;
- (id)when;
- (unsigned)optionBits;
- (void)clearPayload;
- (void)resignCurrent;
- (void)setAdvertisementPayload:(id)a3;
- (void)setCurrentUntilDate:(id)a3;
- (void)setDontPrefetchBefore:(id)a3;
- (void)setOptionBits:(unsigned int)a3;
- (void)setPayloadAvailabilityDelay:(double)a3;
- (void)setPayloadRequestedCompletions:(id)a3;
- (void)setRemoveAfter:(id)a3;
- (void)setTeamIDs:(id)a3;
- (void)setWhen:(id)a3;
@end

@implementation SharingBTLESuggestedItem

+ (id)cornerActionBTLEItemWithSFAdvertisement:(id)a3 optionBits:(unsigned int)a4 scanner:(id)a5 receiver:(id)a6
{
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    id v9 = a6;
    id v10 = a5;
    id v11 = a3;
    v12 = [v11 advertisementPayload];
    v13 = [v11 device];
    v14 = [v11 options];

    v15 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithPayload:v12 device:v13 options:v14 optionBits:v7 scanner:v10 receiver:v9];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)cornerActionBTLEItemWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 scanner:(id)a7 receiver:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = +[NSMutableSet set];
  v19 = +[NSMutableDictionary dictionaryWithDictionary:v15];
  uint64_t v20 = _LSAdvertisementBytesKind();
  if (v20 == 3) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = 1;
  }
  if (!v13)
  {
    v30 = 0;
    goto LABEL_106;
  }
  uint64_t v22 = v20;
  uint64_t v118 = v21;
  unsigned int v119 = a6;
  v121 = v19;
  v122 = v18;
  if ((a6 & 4) == 0) {
    goto LABEL_6;
  }
  id v31 = v17;
  uint64_t v133 = 0;
  unsigned int v32 = BRGetCloudEnabledStatus();
  id v33 = 0;
  id v34 = v33;
  if (v32 != 0 && v32 < 0xFFFFFFFC)
  {

    id v17 = v31;
LABEL_6:
    v116 = +[LSApplicationWorkspace defaultWorkspace];
    v117 = _LSCreateDatabaseLookupStringFromHashedBytesForAdvertising();
    v120 = v13;
    switch(v22)
    {
      case 1:
        v23 = sub_10000BA18(0);
        v24 = v117;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v135 = v117;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, " -- Received a kLSAdvertisementStringUserActivityKind; finding application with advertising string %{public}@",
            buf,
            0xCu);
        }

        uint64_t v25 = [v116 applicationForUserActivityType:v117];
        if (v25)
        {
          v26 = (void *)v25;
          v27 = 0;
          v28 = 0;
          v29 = 0;
          id v13 = 0;
        }
        else
        {
          id v111 = v17;
          id v114 = v16;
          id v67 = objc_alloc((Class)NSUserDefaults);
          id v68 = [v67 initWithSuiteName:kUADynamicUserActivitesPreferences];
          v69 = [v68 objectForKey:kUADynamicUserActivitiesKey];
          v70 = [v69 objectForKey:v117];
          v71 = v70;
          if (v70)
          {
            uint64_t v123 = [v70 objectForKey:kUADynamicUserActivityHashKey];
            v72 = objc_msgSend(v116, "applicationForUserActivityType:");
            v28 = [v71 objectForKey:kUADynamicUserActivityDynamicActivityKey];
            id v13 = [v72 bundleIdentifier];
            v29 = [v71 objectForKey:kUADynamicUserActivityAppActivityKey];
            v73 = v72;
            sub_100056964(v72, v122);
          }
          else
          {
            uint64_t v123 = 0;
            v73 = 0;
            v28 = 0;
            v29 = 0;
            id v13 = 0;
          }

          id v17 = v111;
          id v16 = v114;
          v24 = v117;
          v26 = v73;
          v27 = (void *)v123;
        }
        char v89 = v119;
        if (v28 || !v26) {
          goto LABEL_91;
        }
        v90 = [v26 activityTypes];
        if (![v90 count]) {
          goto LABEL_88;
        }
        v124 = v27;
        v128 = v26;
        id v115 = v16;
        uint64_t v91 = 0;
        while (1)
        {
          v92 = [v90 objectAtIndex:v91];
          v93 = _LSCreateHashedBytesForAdvertisingFromString();
          if (!_LSCompareHashedBytesFromAdvertisingStrings()) {
            break;
          }

          if (++v91 >= (unint64_t)[v90 count])
          {
            id v16 = v115;
            v26 = v128;
LABEL_87:
            v27 = v124;
LABEL_88:
            if (!v13)
            {

              v26 = 0;
            }

            char v89 = v119;
            v24 = v117;
LABEL_91:
            if (!v26)
            {
              if (v89)
              {
                v26 = sub_1000646A0();
                if (v26)
                {
                  v125 = v27;
                  v101 = sub_10000BA18(0);
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v135 = v24;
                    _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "-- Falling back to _UAUserActivityTypeBrowsingWeb because no application matched the advertisement %{public}@ and kUserActivityAdvertisingBytesItemHasWebpageURLMask was set.", buf, 0xCu);
                  }

                  sub_100056964(v26, v122);
                  uint64_t v102 = [v26 bundleIdentifier];

                  v29 = @"NSUserActivityTypeBrowsingWeb";
                  id v13 = (id)v102;
                  v27 = v125;
                }
              }
              else
              {
                v26 = 0;
              }
            }

            goto LABEL_99;
          }
        }
        id v112 = v17;
        v94 = sub_10000BA18(0);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          v95 = [v128 bundleIdentifier];
          *(_DWORD *)buf = 138543875;
          v135 = v93;
          __int16 v136 = 2113;
          id v137 = v92;
          __int16 v138 = 2113;
          id v139 = v95;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, " -- MATCHED, adverising bytes %{public}@ to activityType %{private}@, from application %{private}@", buf, 0x20u);
        }
        v26 = v128;
        sub_100056964(v128, v122);
        uint64_t v109 = [v128 bundleIdentifier];

        v96 = (char *)[v92 rangeOfString:@":"];
        if (v97 && (v98 = v96 + 1, v96 + 1 < [v92 length]))
        {
          v99 = [v92 substringFromIndex:v98];
        }
        else
        {
          v99 = v92;
        }
        v100 = v99;

        v29 = v100;
        id v13 = (id)v109;
        id v17 = v112;
        id v16 = v115;
        goto LABEL_87;
      case 2:
        v36 = sub_10000BA18(0);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v135 = v117;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, " -- Received a kLSAdvertisementStringDomainNameKind; looking for native application application with adverti"
            "sing string %{public}@",
            buf,
            0xCu);
        }

        v37 = [v116 applicationForUserActivityType:v117];
        if (!v37) {
          goto LABEL_38;
        }
        id v110 = v17;
        id v113 = v16;
        id v107 = v14;
        id v108 = v15;
        id v38 = objc_alloc_init((Class)NSMutableSet);
        sub_100056964(v37, v38);
        v39 = [v37 bundleIdentifier];
        v40 = (void *)_LSCopyUserActivityDomainNamesForBundleID();
        v126 = +[NSMutableArray arrayWithArray:v40];

        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        id v41 = v38;
        id v42 = [v41 countByEnumeratingWithState:&v129 objects:v142 count:16];
        v43 = v37;
        if (v42)
        {
          id v44 = v42;
          uint64_t v45 = *(void *)v130;
          do
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(void *)v130 != v45) {
                objc_enumerationMutation(v41);
              }
              v47 = *(void **)(*((void *)&v129 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v48 = [v37 bundleIdentifier];
                v49 = [v47 stringByAppendingFormat:@".%@", v48];

                v50 = (void *)_LSCopyUserActivityDomainNamesForBundleID();
                v51 = sub_10000BA18(0);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138477827;
                  v135 = v49;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, " -- Adding domains for bundleID: %{private}@", buf, 0xCu);
                }

                [v126 addObjectsFromArray:v50];
                v37 = v43;
              }
            }
            id v44 = [v41 countByEnumeratingWithState:&v129 objects:v142 count:16];
          }
          while (v44);
        }

        v52 = sub_10000BA18(0);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          v53 = [v126 description];
          v54 = sub_100063FF0(v53);
          *(_DWORD *)buf = 138477827;
          v135 = v54;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, " -- Domain name strings: %{private}@", buf, 0xCu);
        }
        id v15 = v108;
        id v17 = v110;
        id v16 = v113;
        if (![v126 count]) {
          goto LABEL_37;
        }
        unint64_t v55 = 0;
        do
        {
          v56 = [v126 objectAtIndex:v55];
          v57 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
          if (!_LSCompareHashedBytesFromAdvertisingStrings())
          {
            v74 = sub_10000BA18(0);
            v26 = v43;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              v75 = sub_100003070(v57);
              v76 = [v43 bundleIdentifier];
              *(_DWORD *)buf = 138543875;
              v135 = v75;
              __int16 v136 = 2113;
              id v137 = v56;
              __int16 v138 = 2113;
              id v139 = v76;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, " -- MATCHED, adverising bytes %{public}@ to domain name %{private}@, from application %{private}@", buf, 0x20u);

              id v15 = v108;
              id v17 = v110;
            }

            sub_100056964(v43, v122);
            id v13 = [v43 bundleIdentifier];

            v28 = 0;
            v29 = @"NSUserActivityTypeBrowsingWeb";
            id v16 = v113;
            v24 = v117;
            id v14 = v107;
            goto LABEL_99;
          }

          ++v55;
        }
        while (v55 < (unint64_t)[v126 count]);
LABEL_37:

        v18 = v122;
        v37 = v43;
        id v14 = v107;
LABEL_38:
        v58 = sub_10000BA18(0);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, " -- Received a kLSAdvertisementStringDomainNameKind; no match for native application, so looking for browser",
            buf,
            2u);
        }

        v59 = sub_1000646A0();

        id v13 = [v59 bundleIdentifier];
        sub_100056964(v59, v18);
        v28 = 0;
        v29 = @"NSUserActivityTypeBrowsingWeb";
        v26 = v59;
        v24 = v117;
        goto LABEL_99;
      case 3:
        v24 = v117;
        v29 = v117;
        v60 = (void *)UAUserActivityTypeSiri;
        if ([v29 isEqualToString:UAUserActivityTypeSiri])
        {
          id v13 = v60;

          v26 = 0;
          v28 = 0;
          v122 = 0;
          goto LABEL_99;
        }
        id v13 = 0;
        v28 = 0;
        v26 = 0;
        goto LABEL_104;
      case 4:
        v61 = sub_10000BA18(0);
        v24 = v117;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v135 = v117;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, " -- Received a kLSAdvertisementStringPrivateSpaceKind; finding application with private space string %{public}@",
            buf,
            0xCu);
        }

        v62 = [v116 applicationForUserActivityType:v117];
        v26 = v62;
        if (!v62)
        {
          id v13 = 0;
          v29 = 0;
          v28 = 0;
          goto LABEL_104;
        }
        v63 = [v62 activityTypes];
        if (![v63 count])
        {
          v29 = 0;
          id v13 = 0;
          goto LABEL_84;
        }
        v127 = v26;
        uint64_t v64 = 0;
        break;
      default:
        id v13 = 0;
        v29 = 0;
        v28 = 0;
        v26 = 0;
        v24 = v117;
        goto LABEL_104;
    }
    while (1)
    {
      v65 = [v63 objectAtIndex:v64];
      v66 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
      if (!_LSCompareHashedBytesFromAdvertisingStrings()) {
        break;
      }

      if (++v64 >= (unint64_t)[v63 count])
      {
        v29 = 0;
        id v13 = 0;
        goto LABEL_83;
      }
    }
    id v77 = v16;
    v78 = sub_10000BA18(0);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      sub_100003070(v66);
      v80 = id v79 = v17;
      [v127 bundleIdentifier];
      v82 = id v81 = v15;
      *(_DWORD *)buf = 138543875;
      v135 = v80;
      __int16 v136 = 2113;
      id v137 = v65;
      __int16 v138 = 2113;
      id v139 = v82;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, " -- MATCHED, adverising bytes %{public}@ to privateType string %{private}@, from application %{private}@", buf, 0x20u);

      id v15 = v81;
      id v17 = v79;
    }

    id v13 = [v127 bundleIdentifier];
    sub_100056964(v127, v122);
    id v83 = v17;
    if ([v65 hasPrefix:@"NOTIFICATION#"])
    {
      [v121 setObject:&__kCFBooleanTrue forKeyedSubscript:UAUserActivityIsNotificationOptionKey];
      uint64_t v84 = [v65 substringFromIndex:objc_msgSend(@"NOTIFICATION#", "length")];

      uint64_t v118 = 2;
      v65 = (void *)v84;
    }
    id v16 = v77;
    v85 = (char *)[v65 rangeOfString:@":"];
    if (v86 && (v87 = v85 + 1, v85 + 1 < [v65 length]))
    {
      v88 = [v65 substringFromIndex:v87];
    }
    else
    {
      v88 = v65;
    }
    v29 = v88;
    id v17 = v83;

LABEL_83:
    v24 = v117;
    v26 = v127;
LABEL_84:

    v28 = 0;
LABEL_99:
    if (v13 && v29)
    {
      v103 = sub_10000BA18(0);
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        sub_100003070(v120);
        v105 = id v104 = v17;
        *(_DWORD *)buf = 138478595;
        v135 = v29;
        __int16 v136 = 2113;
        id v137 = v13;
        __int16 v138 = 2113;
        id v139 = v14;
        __int16 v140 = 2114;
        v141 = v105;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, " -- Found application %{private}@, with matching advertisingIdentifier %{private}@, from %{private}@ for payload %{public}@", buf, 0x2Au);

        id v17 = v104;
        v24 = v117;
      }
    }
LABEL_104:

    v35 = v120;
    v30 = [[SharingBTLESuggestedItem alloc] initWithPayload:v120 device:v14 options:v15 optionBits:v119 type:v118 activityType:v29 bundleIdentifier:v13 teamIDs:v122 advertisingOptions:v121 scanner:v16 receiver:v17 dynamicIdentifier:v28];

    goto LABEL_105;
  }
  v29 = sub_10000BA18(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v135 = (int)v32;
    __int16 v136 = 2114;
    id v137 = v34;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "--- Ignoring incoming advertisement because it contains cloud documents, but BRGetCloudEnabledStatus() returned %ld, %{public}@", buf, 0x16u);
  }
  v30 = 0;
  v35 = v34;
  id v17 = v31;
LABEL_105:

  v19 = v121;
  v18 = v122;
LABEL_106:

  return v30;
}

- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13 dynamicIdentifier:(id)a14
{
  uint64_t v16 = *(void *)&a6;
  id v21 = a14;
  uint64_t v22 = [(SharingBTLESuggestedItem *)self initWithPayload:a3 device:a4 options:a5 optionBits:v16 type:a7 activityType:a8 bundleIdentifier:a9 teamIDs:a10 advertisingOptions:a11 scanner:a12 receiver:a13];
  v23 = v22;
  if (v22) {
    [(SharingBTLESuggestedItem *)v22 setDynamicActivityType:v21];
  }

  return v23;
}

- (SharingBTLESuggestedItem)initWithPayload:(id)a3 device:(id)a4 options:(id)a5 optionBits:(unsigned int)a6 type:(unint64_t)a7 activityType:(id)a8 bundleIdentifier:(id)a9 teamIDs:(id)a10 advertisingOptions:(id)a11 scanner:(id)a12 receiver:(id)a13
{
  id v91 = a3;
  id v88 = a4;
  id v87 = a5;
  id v16 = a8;
  id v93 = a9;
  id v17 = a10;
  id v18 = a11;
  id v19 = a12;
  id v86 = a13;
  uint64_t v20 = sub_10000BA18(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v21 = sub_100064478(a7);
    uint64_t v22 = [v17 description];
    v23 = sub_100063FF0(v22);
    [v18 description];
    id v83 = v19;
    id v24 = v18;
    id v25 = v17;
    v27 = id v26 = v16;
    v28 = sub_100063FF0(v27);
    *(_DWORD *)buf = 138479363;
    id v96 = v91;
    __int16 v97 = 2048;
    uint64_t v98 = a6;
    __int16 v99 = 2113;
    v100 = v21;
    __int16 v101 = 2113;
    id v102 = v26;
    __int16 v103 = 2113;
    id v104 = v93;
    __int16 v105 = 2113;
    v106 = v23;
    __int16 v107 = 2114;
    id v108 = v28;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Creating CornerActionBTLEItem, advertisementPayload=%{private}@ optionBit=%ld type=%{private}@ activityType=%{private}@ bundleID=%{private}@ teamID=%{private}@ advertisingOptions=%{public}@", buf, 0x48u);

    id v16 = v26;
    id v17 = v25;
    id v18 = v24;
    id v19 = v83;
  }
  if (!v16)
  {
    id v90 = v18;
    id v37 = v17;
    id v38 = sub_10000BA18(0);
    id v31 = v91;
    unsigned int v32 = v88;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = sub_100003070(v91);
      *(_DWORD *)buf = 138543362;
      id v96 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Unable to determine application on this device for advertisement %{public}@, so ignoring this received activity.", buf, 0xCu);
    }
    v30 = 0;
    v35 = v87;
    goto LABEL_41;
  }
  v29 = +[NSUUID UUID];
  v94.receiver = self;
  v94.super_class = (Class)SharingBTLESuggestedItem;
  v30 = [(SharingBTLESuggestedItem *)&v94 initWithUUID:v29 type:a7 options:v18];

  id v31 = v91;
  unsigned int v32 = v88;
  if (v30)
  {
    id v81 = v16;
    objc_storeStrong((id *)&v30->_scanner, a12);
    objc_storeStrong((id *)&v30->_receiver, a13);
    id v33 = [[SharingBTLEAdvertisementPayload alloc] initWithAdvertisedBytes:v91];
    advertisementPayload = v30->_advertisementPayload;
    v30->_advertisementPayload = v33;

    v30->_optionBits = a6;
    v35 = v87;
    if (v87)
    {
      v36 = (SharingBTLESuggestedItem *)[v87 mutableCopy];
    }
    else
    {
      v36 = +[NSMutableDictionary dictionary];
    }
    v40 = v36;
    if (a6)
    {
      [(SharingBTLESuggestedItem *)v36 setObject:&__kCFBooleanTrue forKey:UAUserActivityHasWebPageURLOptionKey];
      if ((a6 & 2) == 0)
      {
LABEL_14:
        if ((a6 & 0x40) == 0) {
          goto LABEL_15;
        }
        goto LABEL_22;
      }
    }
    else if ((a6 & 2) == 0)
    {
      goto LABEL_14;
    }
    -[SharingBTLESuggestedItem setObject:forKey:](v40, "setObject:forKey:", &__kCFBooleanTrue, _LSUserActivityContainsFileProviderURLKey, v16);
    if ((a6 & 0x40) == 0)
    {
LABEL_15:
      if ((a6 & 0x80) == 0) {
        goto LABEL_16;
      }
      goto LABEL_23;
    }
LABEL_22:
    [(SharingBTLESuggestedItem *)v40 setObject:&__kCFBooleanTrue, @"UAUserActivityAdvertiserHasMoreActivities", v81 forKey];
    if ((a6 & 0x80) == 0)
    {
LABEL_16:
      if ((a6 & 0x20) == 0)
      {
LABEL_18:
        id v90 = v18;
        self = v40;
        id v41 = [(SharingBTLESuggestedItem *)v40 copy];
        [(SharingBTLESuggestedItem *)v30 setOptions:v41];

        [(SharingBTLESuggestedItem *)v30 setActivityType:v82];
        [(SharingBTLESuggestedItem *)v30 setBundleIdentifier:v93];
        [(SharingBTLESuggestedItem *)v30 setPeerDevice:v88];
        id v84 = v19;
        if (v17)
        {
          id v37 = v17;
          id v42 = [v17 copy];
          [(SharingBTLESuggestedItem *)v30 setTeamIDs:v42];
        }
        else
        {
          id v37 = 0;
          [(SharingBTLESuggestedItem *)v30 setTeamIDs:0];
        }
        v43 = [(SharingBTLESuggestedItem *)v30 advertisementPayload];
        id v44 = [v43 time];
        [(SharingBTLESuggestedItem *)v30 setWhen:v44];

        uint64_t v45 = +[NSDate date];
        [(SharingBTLESuggestedItem *)v30 setLastInterestingTime:v45];

        v46 = [(SharingBTLESuggestedItem *)v30 advertisementPayload];
        v47 = [v46 currentUntil];
        [(SharingBTLESuggestedItem *)v30 setCurrentUntilDate:v47];

        v48 = [(SharingBTLESuggestedItem *)v30 currentUntilDate];
        v49 = NSDate;
        v50 = +[UAUserActivityDefaults sharedDefaults];
        v51 = v50;
        if (v48)
        {
          [v50 cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires];
          double v53 = v52;
          v54 = [(SharingBTLEAdvertisementPayload *)v30->_advertisementPayload validUntil];
          v49 = +[NSDate dateWithTimeInterval:v54 sinceDate:v53];
          [(SharingBTLESuggestedItem *)v30 setRemoveAfter:v49];
        }
        else
        {
          [v50 cornerActionItemMaximumTimeForBTLEItemToLive];
          v54 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
          [(SharingBTLESuggestedItem *)v30 setRemoveAfter:v54];
        }

        unint64_t v55 = objc_alloc_init(UAUserActivityAnalyticsInfo);
        [(SharingBTLESuggestedItem *)v30 setWasContinuedInfo:v55];

        id v56 = [v88 isDefaultPairedDevice];
        v57 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
        [v57 setFromPairedDevice:v56];

        v58 = [(SharingBTLESuggestedItem *)v30 bundleIdentifier];
        v59 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
        [v59 setBundleIdentifier:v58];

        v60 = [(SharingBTLESuggestedItem *)v30 activityType];
        v61 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
        [v61 setActivityType:v60];

        id v62 = [(SharingBTLESuggestedItem *)v30 type];
        v63 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
        [v63 setSuggestedActionType:v62];

        uint64_t v64 = [(SharingBTLESuggestedItem *)v30 activityType];
        unsigned __int8 v65 = [v64 isEqual:@"NSUserActivityTypeBrowsingWeb"];
        if (v65)
        {
          BOOL v66 = 1;
        }
        else
        {
          v49 = [(SharingBTLESuggestedItem *)v30 webpageURL];
          BOOL v66 = v49 != 0;
        }
        id v67 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
        [v67 setBrowserFallback:v66];

        if ((v65 & 1) == 0) {
        id v68 = [(SharingBTLESuggestedItem *)v30 peerDevice];
        }
        v69 = [v68 modelIdentifier];
        v70 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
        [v70 setRemoteDeviceType:v69];

        v71 = [(SharingBTLESuggestedItem *)v30 uuid];
        v72 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
        [v72 setUuid:v71];

        v73 = [(SharingBTLESuggestedItem *)v30 activityType];
        LODWORD(v72) = [v73 isEqual:@"NSUserActivityTypeBrowsingWeb"];

        if (v72)
        {
          v74 = sub_1000646A0();
          v75 = [v74 bundleIdentifier];
          v76 = [(SharingBTLESuggestedItem *)v30 bundleIdentifier];
          unsigned __int8 v77 = [v75 isEqual:v76];

          if ((v77 & 1) == 0)
          {
            v78 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
            [v78 setWebToNative:1];
          }
        }
        id v38 = sub_10000BA18(@"Diagnostic");
        id v16 = v82;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v79 = [(SharingBTLESuggestedItem *)v30 wasContinuedInfo];
          *(_DWORD *)buf = 138477827;
          id v96 = v79;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Created wasContinuedInfo for BTLEAd: %{private}@", buf, 0xCu);
        }
        id v19 = v84;
LABEL_41:

        id v17 = v37;
        id v18 = v90;
        goto LABEL_42;
      }
LABEL_17:
      -[SharingBTLESuggestedItem setObject:forKey:](v40, "setObject:forKey:", &__kCFBooleanTrue, UAUserActivityAutoPullActivitiesListKey, v81);
      goto LABEL_18;
    }
LABEL_23:
    [(SharingBTLESuggestedItem *)v40 setObject:&__kCFBooleanTrue, @"UAUserActivityItemIsNotActiveKey", v81 forKey];
    [(SharingBTLESuggestedItem *)v30 setActive:0];
    if ((a6 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v35 = v87;
LABEL_42:

  return v30;
}

- (BOOL)updateFromSFAdvertisement:(id)a3
{
  id v4 = a3;
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 advertisementPayload];
    uint64_t v7 = sub_100003070(v6);
    v8 = [(SharingBTLESuggestedItem *)self uuid];
    id v9 = [v8 UUIDString];
    int v40 = 138543618;
    id v41 = v7;
    __int16 v42 = 2114;
    v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "RECEIVED advertisement, %{public}@, matched against existing corner item %{public}@ so merely update it from the flags & options", (uint8_t *)&v40, 0x16u);
  }
  if (v4)
  {
    id v10 = [v4 advertisementPayload];
    id v11 = [(SharingBTLESuggestedItem *)self advertisementPayload];
    v12 = [v11 advertisementPayload];
    unsigned __int8 v13 = [v10 isEqual:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }
  id v14 = [(SharingBTLESuggestedItem *)self advertisementPayload];
  if (v14)
  {
    id v15 = [(SharingBTLESuggestedItem *)self advertisementPayload];
    char v16 = [v15 isCurrent] ^ 1;
  }
  else
  {
    char v16 = 1;
  }

  id v17 = [SharingBTLEAdvertisementPayload alloc];
  id v18 = [v4 advertisementPayload];
  id v19 = [(SharingBTLEAdvertisementPayload *)v17 initWithAdvertisedBytes:v18];
  [(SharingBTLESuggestedItem *)self setAdvertisementPayload:v19];

  uint64_t v20 = [(SharingBTLESuggestedItem *)self advertisementPayload];
  id v21 = [v20 time];

  if ((v13 & 1) == 0)
  {
    uint64_t v22 = [(SharingBTLESuggestedItem *)self advertisementPayload];
    unsigned __int8 v23 = [v22 isCurrent];

    if (v16)
    {
      if (v23)
      {
LABEL_15:
        id v26 = +[NSDate date];
        [(SharingBTLESuggestedItem *)self setLastInterestingTime:v26];

        goto LABEL_16;
      }
    }
    else if ((v23 & 1) == 0)
    {
      goto LABEL_16;
    }
    id v24 = [(SharingBTLESuggestedItem *)self advertisementPayload];
    unsigned int v25 = [v24 isCurrent];

    if (!v25) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:
  [(SharingBTLESuggestedItem *)self setWhen:v21];
  v27 = [(SharingBTLESuggestedItem *)self advertisementPayload];
  v28 = [v27 currentUntil];
  [(SharingBTLESuggestedItem *)self setCurrentUntilDate:v28];

  v29 = [v4 advertisementPayload];
  BOOL v30 = (sub_1000671C4(v29) & 0x80) == 0;

  [(SharingBTLESuggestedItem *)self setActive:v30];
  id v31 = [(SharingBTLESuggestedItem *)self currentUntilDate];

  unsigned int v32 = +[UAUserActivityDefaults sharedDefaults];
  id v33 = v32;
  if (v31)
  {
    [v32 cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires];
    double v35 = v34;
    v36 = [(SharingBTLESuggestedItem *)self advertisementPayload];
    id v37 = [v36 validUntil];
    id v38 = +[NSDate dateWithTimeInterval:v37 sinceDate:v35];
    [(SharingBTLESuggestedItem *)self setRemoveAfter:v38];
  }
  else
  {
    [v32 cornerActionItemMaximumTimeForBTLEItemToLive];
    v36 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
    [(SharingBTLESuggestedItem *)self setRemoveAfter:v36];
  }

  return 1;
}

- (BOOL)requestPayloadWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(SharingBTLESuggestedItem *)self uuid];
    uint64_t v7 = [v6 UUIDString];
    if ([(SharingBTLESuggestedItem *)self isPayloadRequested]) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    if ([(SharingBTLESuggestedItem *)self isPayloadAvailable]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    id v51 = v7;
    __int16 v52 = 2114;
    CFStringRef v53 = v8;
    __int16 v54 = 2114;
    CFStringRef v55 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "for item %{public}@ requested=%{public}@ available=%{public}@", buf, 0x20u);
  }
  id v10 = self;
  objc_sync_enter(v10);
  if ([(SharingBTLESuggestedItem *)v10 isPayloadAvailable])
  {
    id v11 = sub_10000BA18(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [(SharingBTLESuggestedItem *)v10 uuid];
      unsigned __int8 v13 = [v12 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v51 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Requesting payload for item %{public}@ payload, but it is already present, so dispatching directly.", buf, 0xCu);
    }
    v4[2](v4, 0);
  }
  else if ([(SharingBTLESuggestedItem *)v10 isPayloadRequested])
  {
    if (v4)
    {
      payloadRequestedCompletions = v10->_payloadRequestedCompletions;
      id v15 = objc_retainBlock(v4);
      [(NSMutableSet *)payloadRequestedCompletions addObject:v15];
    }
  }
  else
  {
    char v16 = [(SharingBTLESuggestedItem *)v10 payloadRequestedCompletions];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      id v18 = +[NSMutableSet set];
      [(SharingBTLESuggestedItem *)v10 setPayloadRequestedCompletions:v18];
    }
    if (v4)
    {
      id v19 = [(SharingBTLESuggestedItem *)v10 payloadRequestedCompletions];
      uint64_t v20 = objc_retainBlock(v4);
      [v19 addObject:v20];
    }
    [(SharingBTLESuggestedItem *)v10 setPayloadRequested:1];
    id v21 = [(SharingBTLESuggestedItem *)v10 wasContinuedInfo];
    [v21 setPayloadRequested:1];

    uint64_t v22 = [(SharingBTLESuggestedItem *)v10 peerDevice];
    unsigned __int8 v23 = [v22 modelIdentifier];
    id v24 = [(SharingBTLESuggestedItem *)v10 wasContinuedInfo];
    [v24 setRemoteDeviceType:v23];

    unsigned int v25 = +[UAUserActivityDefaults sharedDefaults];
    [v25 handoffPayloadRequestTimout];
    double v27 = v26;

    v28 = sub_10000BA18(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(SharingBTLESuggestedItem *)v10 uuid];
      id v30 = [v29 UUIDString];
      id v31 = [(SharingBTLESuggestedItem *)v10 advertisementPayload];
      unsigned int v32 = [v31 payloadBytes];
      sub_100003070(v32);
      id v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      double v34 = [(SharingBTLESuggestedItem *)v10 bundleIdentifier];
      double v35 = +[NSNumber numberWithDouble:v27];
      *(_DWORD *)buf = 138544131;
      id v51 = v30;
      __int16 v52 = 2114;
      CFStringRef v53 = v33;
      __int16 v54 = 2113;
      CFStringRef v55 = v34;
      __int16 v56 = 2114;
      v57 = v35;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Requesting payload for item %{public}@ advertisementPayload=%{public}@ bundleIdentifier=%{private}@ with timeout: %{public}@", buf, 0x2Au);
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v37 = sub_100064548();
    uint64_t v38 = [(SharingBTLESuggestedItem *)v10 uuid];
    v39 = (void *)qword_1000E68E0;
    qword_1000E68E0 = v38;

    id v40 = objc_alloc_init((Class)NSDate);
    id v41 = (void *)qword_1000E68E8;
    qword_1000E68E8 = (uint64_t)v40;

    kdebug_trace();
    __int16 v42 = sub_10000BA18(@"signposts");
    v43 = v42;
    if ((unint64_t)&v10->UAUserActivityInfo_opaque[1] >= 2 && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "sharingFetch", "", buf, 2u);
    }

    id v44 = [(SharingBTLESuggestedItem *)v10 scanner];
    uint64_t v45 = [(SharingBTLESuggestedItem *)v10 peerDevice];
    v46 = [(SharingBTLESuggestedItem *)v10 advertisementPayload];
    v47 = [v46 payloadBytes];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100058038;
    v49[3] = &unk_1000C5E98;
    v49[4] = v10;
    *(double *)&v49[5] = v37;
    *(CFAbsoluteTime *)&v49[6] = Current;
    [v44 activityPayloadFromDevice:v45 forAdvertisementPayload:v47 command:@"HANDOFF" timeout:(uint64_t)v27 withCompletionHandler:v49];
  }
  objc_sync_exit(v10);

  return 1;
}

- (void)resignCurrent
{
  v3 = [(SharingBTLESuggestedItem *)self when];
  v4.receiver = self;
  v4.super_class = (Class)SharingBTLESuggestedItem;
  [(SharingBTLESuggestedItem *)&v4 setWhen:v3];

  [(SharingBTLESuggestedItem *)self setCurrentUntilDate:0];
}

- (void)clearPayload
{
  v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = [(SharingBTLESuggestedItem *)self uuid];
    v5 = [v4 UUIDString];
    *(_DWORD *)buf = 138543619;
    v12 = v5;
    __int16 v13 = 2113;
    id v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "PAYLOAD: clearing payload for activity %{public}@, self=%{private}@", buf, 0x16u);
  }
  v6 = self;
  objc_sync_enter(v6);
  v10.receiver = v6;
  v10.super_class = (Class)SharingBTLESuggestedItem;
  [(SharingBTLESuggestedItem *)&v10 clearPayload];
  if ([(SharingBTLESuggestedItem *)v6 isPayloadAvailable])
  {
    uint64_t v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      CFStringRef v8 = [(SharingBTLESuggestedItem *)v6 uuid];
      CFStringRef v9 = [v8 UUIDString];
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "--- item %{public}@ payload already present, so nil-ing it out.", buf, 0xCu);
    }
    [(SharingBTLESuggestedItem *)v6 setPayloadAvailable:0];
  }
  objc_sync_exit(v6);
}

- (id)statusString
{
  id v31 = [(SharingBTLESuggestedItem *)self uuid];
  v36 = [v31 UUIDString];
  double v35 = [(SharingBTLESuggestedItem *)self advertisementPayload];
  unsigned int v30 = [(SharingBTLESuggestedItem *)self optionBits];
  if (v30)
  {
    v3 = "";
    if ([(SharingBTLESuggestedItem *)self optionBits]) {
      objc_super v4 = " webPage";
    }
    else {
      objc_super v4 = "";
    }
    if (([(SharingBTLESuggestedItem *)self optionBits] & 2) != 0) {
      v5 = " fp";
    }
    else {
      v5 = "";
    }
    if (([(SharingBTLESuggestedItem *)self optionBits] & 4) != 0) {
      v6 = " cloud";
    }
    else {
      v6 = "";
    }
    if (([(SharingBTLESuggestedItem *)self optionBits] & 0x20) != 0) {
      v3 = " autopull";
    }
    unsigned int v32 = +[NSString stringWithFormat:@"%s%s%s%s/%lx", v4, v5, v6, v3, [(SharingBTLESuggestedItem *)self optionBits]];
  }
  else
  {
    unsigned int v32 = &stru_1000C6800;
  }
  double v34 = [(SharingBTLESuggestedItem *)self bundleIdentifier];
  v29 = [(SharingBTLESuggestedItem *)self when];
  id v33 = sub_10007C018(v29);
  uint64_t v7 = [(SharingBTLESuggestedItem *)self removeAfter];
  if (v7)
  {
    v28 = [(SharingBTLESuggestedItem *)self removeAfter];
    double v27 = sub_10007C018(v28);
    CFStringRef v8 = +[NSString stringWithFormat:@"remove:%@ ", v27];
  }
  else
  {
    CFStringRef v8 = &stru_1000C6800;
  }
  CFStringRef v9 = [(SharingBTLESuggestedItem *)self peerDevice];
  objc_super v10 = [v9 name];
  id v11 = [(SharingBTLESuggestedItem *)self peerDevice];
  v12 = [v11 modelIdentifier];
  __int16 v13 = [(SharingBTLESuggestedItem *)self peerDevice];
  id v14 = [v13 deviceType];
  id v15 = +[NSMutableString stringWithFormat:@"BTLEItem:%@ %@%@ id=%@ when=%@ %@device=\"%@\" modelCode=%@ deviceType=%@", v36, v35, v32, v34, v33, v8, v10, v12, v14];

  if (v7)
  {
  }
  if (v30) {

  }
  char v16 = [(SharingBTLESuggestedItem *)self options];
  id v17 = [v16 count];

  if (v17)
  {
    id v18 = [(SharingBTLESuggestedItem *)self options];
    id v19 = +[NSJSONSerialization dataWithJSONObject:v18 options:0 error:0];

    id v20 = [objc_alloc((Class)NSString) initWithData:v19 encoding:4];
    [v15 appendFormat:@" options=%@", v20];
  }
  if ([(SharingBTLESuggestedItem *)self isPayloadAvailable])
  {
    id v21 = [(SharingBTLESuggestedItem *)self payloadForIdentifier:UAUserActivityUserInfoPayload];
    uint64_t v22 = sub_10000F05C(v21, 64);
    unsigned __int8 v23 = +[NSString stringWithFormat:@" payload=$%@", v22];
    [v15 appendString:v23];
  }
  else
  {
    if ([(SharingBTLESuggestedItem *)self isPayloadRequested]) {
      CFStringRef v24 = @" payloadRequested";
    }
    else {
      CFStringRef v24 = @" payload NA";
    }
    [v15 appendString:v24];
  }
  id v25 = [v15 copy];

  return v25;
}

- (id)when
{
  v10.receiver = self;
  v10.super_class = (Class)SharingBTLESuggestedItem;
  v3 = [(SharingBTLESuggestedItem *)&v10 when];
  uint64_t v4 = [(SharingBTLESuggestedItem *)self currentUntilDate];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = +[NSDate date];
    if ([v7 compare:v5] == (id)-1)
    {
      id v8 = v7;

      v3 = v8;
    }
  }

  return v3;
}

- (void)setWhen:(id)a3
{
  id v4 = a3;
  v5 = [(SharingBTLESuggestedItem *)self currentUntilDate];
  if (!v4 || v5)
  {
  }
  else
  {
    BOOL v6 = [(SharingBTLESuggestedItem *)self when];
    unsigned __int8 v7 = [v4 isEqual:v6];

    if (v7) {
      goto LABEL_7;
    }
  }
  [(SharingBTLESuggestedItem *)self setCurrentUntilDate:0];
  v9.receiver = self;
  v9.super_class = (Class)SharingBTLESuggestedItem;
  [(SharingBTLESuggestedItem *)&v9 setWhen:v4];
  id v8 = [(SharingBTLESuggestedItem *)self manager];
  [v8 scheduleBestAppDetermination];

LABEL_7:
}

- (id)description
{
  v3 = [(SharingBTLESuggestedItem *)self uuid];
  id v4 = [v3 UUIDString];
  v5 = [(SharingBTLESuggestedItem *)self activityType];
  BOOL v6 = [(SharingBTLESuggestedItem *)self bundleIdentifier];
  if (v6)
  {
    unsigned __int8 v7 = [(SharingBTLESuggestedItem *)self bundleIdentifier];
  }
  else
  {
    unsigned __int8 v7 = @"-";
  }
  id v8 = [(SharingBTLESuggestedItem *)self when];
  objc_super v9 = +[NSString stringWithFormat:@"UASharingBTLEItem:%@ %@/%@ %@", v4, v5, v7, v8];

  if (v6) {

  }
  return v9;
}

+ (id)statusString
{
  if (qword_1000E68E0)
  {
    v2 = [(id)qword_1000E68E0 UUIDString];
    v3 = +[NSString stringWithFormat:@"Last BTLE payload fetched for item %@, at %@, from %@\n", v2, qword_1000E68E8, 0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSDate)currentUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentUntilDate:(id)a3
{
}

- (SFActivityScanner)scanner
{
  return (SFActivityScanner *)objc_getProperty(self, a2, 24, 1);
}

- (SharingBTLEAdvertisementPayload)advertisementPayload
{
  return (SharingBTLEAdvertisementPayload *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdvertisementPayload:(id)a3
{
}

- (double)payloadAvailabilityDelay
{
  return self->_payloadAvailabilityDelay;
}

- (void)setPayloadAvailabilityDelay:(double)a3
{
  self->_payloadAvailabilityDelay = a3;
}

- (NSMutableSet)payloadRequestedCompletions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPayloadRequestedCompletions:(id)a3
{
}

- (UASharingReceiver)receiver
{
  return (UASharingReceiver *)objc_getProperty(self, a2, 56, 1);
}

- (UACornerActionManager)manager
{
  return (UACornerActionManager *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)optionBits
{
  return self->_optionBits;
}

- (void)setOptionBits:(unsigned int)a3
{
  self->_optionBits = a3;
}

- (NSSet)teamIDs
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTeamIDs:(id)a3
{
}

- (NSDate)dontPrefetchBefore
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDontPrefetchBefore:(id)a3
{
}

- (NSDate)removeAfter
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRemoveAfter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeAfter, 0);
  objc_storeStrong((id *)&self->_dontPrefetchBefore, 0);
  objc_storeStrong((id *)&self->_teamIDs, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_payloadRequestedCompletions, 0);
  objc_storeStrong((id *)&self->_advertisementPayload, 0);
  objc_storeStrong((id *)&self->_scanner, 0);

  objc_storeStrong((id *)&self->_currentUntilDate, 0);
}

@end