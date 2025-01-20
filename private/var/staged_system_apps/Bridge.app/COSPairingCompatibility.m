@interface COSPairingCompatibility
- (BOOL)_checkIfShouldUpdateInRevLockFlowForWatchPairingVersion:(unint64_t)a3 watchChipID:(id)a4;
- (BOOL)_isVersion:(unint64_t)a3 withinStart:(id)a4 andEnd:(id)a5 isWatch:(BOOL)a6;
- (BOOL)_productTypeIsTinkerEnabled:(id)a3;
- (BOOL)_productTypeIsYorktownEnabled:(id)a3;
- (BOOL)blockTinkerPairing;
- (BOOL)blockYorktownPairing;
- (BOOL)failSafeUpdateRequested;
- (BOOL)pairingShouldContinue;
- (BOOL)requiresZeroDayUpdate;
- (BOOL)runUpdateInSetup;
- (BOOL)updateInRevLockFlow;
- (BOOL)yorktownForceSU;
- (NSURL)zeroDayUpdateLearnMoreLink;
- (id)_findZeroDayPlist;
- (void)_setCompatiblityCriteriaWithProductType:(id)a3 systemVersion:(unint64_t)a4 watchPairingVersion:(int64_t)a5 watchChipIDNumber:(id)a6 shouldForceSoftwareUpdateCheck:(BOOL)a7 zeroDayCriteria:(id)a8;
- (void)_setShouldBlockTinkerForProductType:(id)a3 tinkerPairing:(BOOL)a4;
- (void)_setUpdateStateForPairingCode:(unint64_t)a3 watchChipID:(id)a4 watchRequestsFailSafe:(BOOL)a5 isWatchAhead:(BOOL)a6;
- (void)_setYorktownCompatibilityFlagsFromForProductType:(id)a3 watchPairingVersion:(int64_t)a4 yorktownPairing:(BOOL)a5;
- (void)_setupZeroDayForcedUpdateForProductType:(id)a3 systemVersion:(unint64_t)a4 zeroDayCriteria:(id)a5;
- (void)reset;
- (void)setCompatiblityCriteriaWithDevice:(id)a3;
- (void)setCompatiblityCriteriaWithDevice:(id)a3 zeroDayCriteria:(id)a4;
- (void)setCompatiblityCriteriaWithMetadata:(id)a3 scannedPairingVersion:(unint64_t)a4;
- (void)setCompatiblityCriteriaWithMetadata:(id)a3 scannedPairingVersion:(unint64_t)a4 zeroDayCriteria:(id)a5;
@end

@implementation COSPairingCompatibility

- (void)setCompatiblityCriteriaWithDevice:(id)a3
{
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    v4 = [(COSPairingCompatibility *)self _findZeroDayPlist];
    v5 = +[NSArray arrayWithContentsOfFile:v4];
  }
  else
  {
    v5 = 0;
  }
  [(COSPairingCompatibility *)self setCompatiblityCriteriaWithDevice:v6 zeroDayCriteria:v5];
}

- (void)setCompatiblityCriteriaWithDevice:(id)a3 zeroDayCriteria:(id)a4
{
  uint64_t v6 = NRDevicePropertyProductType;
  id v7 = a4;
  id v8 = a3;
  id v15 = [v8 valueForProperty:v6];
  v9 = [v8 valueForProperty:NRDevicePropertySystemVersion];
  v10 = [v8 valueForProperty:NRDevicePropertyMaxPairingCompatibilityVersion];
  id v11 = [v10 integerValue];
  v12 = [v8 valueForProperty:NRDevicePropertyChipID];

  v13 = [UIApp setupController];
  id v14 = [v13 shouldForceSoftwareUpdateCheck];

  [(COSPairingCompatibility *)self _setCompatiblityCriteriaWithProductType:v15 systemVersion:NRWatchOSVersion() watchPairingVersion:v11 watchChipIDNumber:v12 shouldForceSoftwareUpdateCheck:v14 zeroDayCriteria:v7];
}

- (void)setCompatiblityCriteriaWithMetadata:(id)a3 scannedPairingVersion:(unint64_t)a4
{
  id v8 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [(COSPairingCompatibility *)self _findZeroDayPlist];
    id v7 = +[NSArray arrayWithContentsOfFile:v6];
  }
  else
  {
    id v7 = 0;
  }
  [(COSPairingCompatibility *)self setCompatiblityCriteriaWithMetadata:v8 scannedPairingVersion:a4 zeroDayCriteria:v7];
}

- (void)setCompatiblityCriteriaWithMetadata:(id)a3 scannedPairingVersion:(unint64_t)a4 zeroDayCriteria:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  v9 = [v13 productType];
  id v10 = [v13 encodedSystemVersion];
  id v11 = v13;
  if (v13)
  {
    v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 chipID]);
    id v11 = v13;
  }
  else
  {
    v12 = 0;
  }
  -[COSPairingCompatibility _setCompatiblityCriteriaWithProductType:systemVersion:watchPairingVersion:watchChipIDNumber:shouldForceSoftwareUpdateCheck:zeroDayCriteria:](self, "_setCompatiblityCriteriaWithProductType:systemVersion:watchPairingVersion:watchChipIDNumber:shouldForceSoftwareUpdateCheck:zeroDayCriteria:", v9, v10, a4, v12, [v11 postFailsafeObliteration], v8);
}

- (void)_setCompatiblityCriteriaWithProductType:(id)a3 systemVersion:(unint64_t)a4 watchPairingVersion:(int64_t)a5 watchChipIDNumber:(id)a6 shouldForceSoftwareUpdateCheck:(BOOL)a7 zeroDayCriteria:(id)a8
{
  BOOL v43 = a7;
  id v12 = a3;
  id v13 = a6;
  id v14 = a8;
  v44 = +[UIApplication sharedApplication];
  id v15 = [UIApp bridgeController];
  id v16 = [v15 isTinkerPairing];

  v17 = +[NRPairingCompatibilityVersionInfo systemVersions];
  id v18 = [v17 maxPairingCompatibilityVersion];

  int v19 = _BPSIsPairingCompatible();
  uint64_t v20 = ((uint64_t)v18 < a5) & ~v19;
  [(COSPairingCompatibility *)self _setShouldBlockTinkerForProductType:v12 tinkerPairing:v16];
  v21 = [UIApp setupController];
  id v22 = [v21 offerYorktownForCurrentPairing];

  [(COSPairingCompatibility *)self _setYorktownCompatibilityFlagsFromForProductType:v12 watchPairingVersion:a5 yorktownPairing:v22];
  int v23 = _os_feature_enabled_impl();
  if (v14 && v23) {
    [(COSPairingCompatibility *)self _setupZeroDayForcedUpdateForProductType:v12 systemVersion:a4 zeroDayCriteria:v14];
  }
  [(COSPairingCompatibility *)self _setUpdateStateForPairingCode:a5 watchChipID:v13 watchRequestsFailSafe:v43 isWatchAhead:v20];
  if (self->_runUpdateInSetup) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v19;
  }
  self->_pairingShouldContinue = v24;
  int v25 = _os_feature_enabled_impl();
  v26 = pbb_setupflow_log();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (!v27) {
      goto LABEL_13;
    }
    BOOL updateInRevLockFlow = self->_updateInRevLockFlow;
    BOOL blockTinkerPairing = self->_blockTinkerPairing;
    BOOL runUpdateInSetup = self->_runUpdateInSetup;
    BOOL requiresZeroDayUpdate = self->_requiresZeroDayUpdate;
    BOOL blockYorktownPairing = self->_blockYorktownPairing;
    BOOL yorktownForceSU = self->_yorktownForceSU;
    *(_DWORD *)buf = 67111168;
    int v46 = v19;
    __int16 v47 = 1024;
    BOOL v48 = updateInRevLockFlow;
    __int16 v49 = 1024;
    BOOL v50 = v43;
    __int16 v51 = 1024;
    BOOL v52 = blockTinkerPairing;
    __int16 v53 = 1024;
    int v54 = v20;
    __int16 v55 = 1024;
    BOOL v56 = runUpdateInSetup;
    __int16 v57 = 1024;
    BOOL v58 = requiresZeroDayUpdate;
    __int16 v59 = 1024;
    BOOL v60 = blockYorktownPairing;
    __int16 v61 = 1024;
    BOOL v62 = yorktownForceSU;
    v34 = "isPairingCompatible %{BOOL}d / shouldUpdateInRevLockFlow %{BOOL}d / metaDataDemandsUpdate %{BOOL}d / blockTink"
          "erPairing %{BOOL}d / isWatchAhead %{BOOL}d / runUpdateInSetup %{BOOL}d / requiresZeroDayUpdate %{BOOL}d / bloc"
          "kYorktownPairing %{BOOL}d / yorktownForceSU %{BOOL}d";
    v35 = v26;
    uint32_t v36 = 56;
  }
  else
  {
    if (!v27) {
      goto LABEL_13;
    }
    BOOL v37 = self->_updateInRevLockFlow;
    BOOL v38 = self->_blockTinkerPairing;
    BOOL v39 = self->_runUpdateInSetup;
    BOOL v40 = self->_blockYorktownPairing;
    BOOL v41 = self->_yorktownForceSU;
    *(_DWORD *)buf = 67110912;
    int v46 = v19;
    __int16 v47 = 1024;
    BOOL v48 = v37;
    __int16 v49 = 1024;
    BOOL v50 = v43;
    __int16 v51 = 1024;
    BOOL v52 = v38;
    __int16 v53 = 1024;
    int v54 = v20;
    __int16 v55 = 1024;
    BOOL v56 = v39;
    __int16 v57 = 1024;
    BOOL v58 = v40;
    __int16 v59 = 1024;
    BOOL v60 = v41;
    v34 = "isPairingCompatible %{BOOL}d / shouldUpdateInRevLockFlow %{BOOL}d / metaDataDemandsUpdate %{BOOL}d / blockTink"
          "erPairing %{BOOL}d / isWatchAhead %{BOOL}d / runUpdateInSetup %{BOOL}d / blockYorktownPairing %{BOOL}d / yorkt"
          "ownForceSU %{BOOL}d";
    v35 = v26;
    uint32_t v36 = 50;
  }
  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
LABEL_13:

  if (self->_runUpdateInSetup) {
    [v44 setIsUpdatingGizmoInSetupFlow:1];
  }
}

- (void)reset
{
  *(void *)&self->_BOOL blockTinkerPairing = 0;
  [UIApp setIsUpdatingGizmoInSetupFlow:0];
  id v2 = [UIApp bridgeController];
  [v2 setShouldSuppressTransportReachabilityTimeout:0];
}

- (void)_setShouldBlockTinkerForProductType:(id)a3 tinkerPairing:(BOOL)a4
{
  self->_BOOL blockTinkerPairing = a4 & ~[(COSPairingCompatibility *)self _productTypeIsTinkerEnabled:a3];
}

- (void)_setYorktownCompatibilityFlagsFromForProductType:(id)a3 watchPairingVersion:(int64_t)a4 yorktownPairing:(BOOL)a5
{
  self->_BOOL blockYorktownPairing = a5 & ~[(COSPairingCompatibility *)self _productTypeIsYorktownEnabled:a3];
  BOOL v8 = a4 < 21 && a5;
  self->_BOOL yorktownForceSU = v8;
}

- (void)_setUpdateStateForPairingCode:(unint64_t)a3 watchChipID:(id)a4 watchRequestsFailSafe:(BOOL)a5 isWatchAhead:(BOOL)a6
{
  BOOL v7 = a5;
  unsigned __int8 updateInRevLockFlow = [(COSPairingCompatibility *)self _checkIfShouldUpdateInRevLockFlowForWatchPairingVersion:a3 watchChipID:a4];
  self->_unsigned __int8 updateInRevLockFlow = updateInRevLockFlow;
  if (v7 && (updateInRevLockFlow & 1) == 0 && !a6)
  {
    id v10 = [UIApp bridgeController];
    [v10 setShouldSuppressTransportReachabilityTimeout:1];

    self->_failSafeUpdateRequested = 1;
    unsigned __int8 updateInRevLockFlow = self->_updateInRevLockFlow;
  }
  if ((updateInRevLockFlow & 1) == 0 && !v7 && !self->_requiresZeroDayUpdate)
  {
    if (self->_blockYorktownPairing)
    {
      BOOL yorktownForceSU = 0;
      goto LABEL_9;
    }
    BOOL yorktownForceSU = self->_yorktownForceSU;
    if (!yorktownForceSU) {
      goto LABEL_9;
    }
  }
  BOOL yorktownForceSU = !a6;
LABEL_9:
  self->_BOOL runUpdateInSetup = yorktownForceSU;
}

- (void)_setupZeroDayForcedUpdateForProductType:(id)a3 systemVersion:(unint64_t)a4 zeroDayCriteria:(id)a5
{
  id v31 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = a5;
  id v33 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        BOOL v8 = [v7 objectForKeyedSubscript:@"WatchOSVersions"];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"StartingWatchOSVersion"];

        id v10 = [v7 objectForKeyedSubscript:@"WatchOSVersions"];
        id v11 = [v10 objectForKeyedSubscript:@"EndingWatchOSVersion"];

        id v12 = [v7 objectForKeyedSubscript:@"iOSVersions"];
        id v13 = [v12 objectForKeyedSubscript:@"StartingiOSVersion"];

        id v14 = [v7 objectForKeyedSubscript:@"iOSVersions"];
        id v15 = [v14 objectForKeyedSubscript:@"EndingiOSVersion"];

        id v16 = [v7 objectForKeyedSubscript:@"ProductTypes"];
        BOOL v17 = v11 == 0;
        BOOL v18 = v15 == 0;
        unsigned int v19 = v16 == 0;
        v35 = (void *)v9;
        if (v9) {
          BOOL v17 = [(COSPairingCompatibility *)self _isVersion:a4 withinStart:v9 andEnd:v11 isWatch:1];
        }
        uint64_t v20 = sub_1000342E4();
        if (v13) {
          BOOL v18 = [(COSPairingCompatibility *)self _isVersion:NRRawVersionFromString() withinStart:v13 andEnd:v15 isWatch:0];
        }
        if ([v16 count]) {
          unsigned int v19 = [v16 containsObject:v31];
        }
        if ((v19 & (v17 && v18)) == 1)
        {
          v21 = pbb_setupflow_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            BOOL v41 = v7;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found matching criteria: %@.  Need to force update", buf, 0xCu);
          }

          self->_BOOL requiresZeroDayUpdate = 1;
          id v22 = [v7 objectForKeyedSubscript:@"LearnMoreLink"];
          int v23 = +[NSURL URLWithString:v22];
          zeroDayUpdateLearnMoreLink = self->_zeroDayUpdateLearnMoreLink;
          self->_zeroDayUpdateLearnMoreLink = v23;

          uint64_t v25 = [(NSURL *)self->_zeroDayUpdateLearnMoreLink scheme];
          if (!v25
            || (v26 = (void *)v25,
                [(NSURL *)self->_zeroDayUpdateLearnMoreLink host],
                BOOL v27 = objc_claimAutoreleasedReturnValue(),
                v27,
                v26,
                !v27))
          {
            v28 = self->_zeroDayUpdateLearnMoreLink;
            self->_zeroDayUpdateLearnMoreLink = 0;
          }
          goto LABEL_22;
        }
      }
      id v33 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }
LABEL_22:
}

- (BOOL)_isVersion:(unint64_t)a3 withinStart:(id)a4 andEnd:(id)a5 isWatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if (v6) {
    int v11 = NRWatchOSVersion();
  }
  else {
    int v11 = NRRawVersionFromString();
  }
  int v12 = v11;
  if ((!v10 || [v10 isEqualToString:&stru_100249230]) && v12 == a3)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (v6)
    {
      unsigned int v14 = NRWatchOSVersion();
      unsigned int v15 = NRWatchOSVersion();
    }
    else
    {
      unsigned int v14 = NRRawVersionFromString();
      unsigned int v15 = NRRawVersionFromString();
    }
    BOOL v13 = v14 <= a3 && v15 >= a3;
  }

  return v13;
}

- (id)_findZeroDayPlist
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];
  v14[0] = v3;
  v14[1] = PBAssetsCacheDirName;
  v14[2] = PBAZeroDayUpdateAssetName;
  v4 = +[NSArray arrayWithObjects:v14 count:3];
  v5 = +[NSString pathWithComponents:v4];

  BOOL v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "zeroDayPlistPath: %@", (uint8_t *)&v12, 0xCu);
  }

  if (PBIsInternalInstall())
  {
    BOOL v7 = +[NSUserDefaults standardUserDefaults];
    BOOL v8 = [v7 stringForKey:@"AlternateZeroDayPlistPath"];

    if (v8)
    {
      id v9 = v8;

      id v10 = pbb_setupflow_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Using internal override for zeroday plist: %@", (uint8_t *)&v12, 0xCu);
      }

      v5 = v9;
    }
  }

  return v5;
}

- (BOOL)_productTypeIsTinkerEnabled:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v5 = [v4 BOOLForKey:@"AllowUnsupportedTinkerHW-YourMileageMayVary"];

  if (qword_10029B2B8 != -1)
  {
    dispatch_once(&qword_10029B2B8, &stru_100247490);
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v7 = (void *)qword_10029B2B0;
    BOOL v8 = [v3 lowercaseString];
    unsigned __int8 v6 = [v7 containsObject:v8];

    goto LABEL_6;
  }
  if ((v5 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unsigned __int8 v6 = 1;
LABEL_6:

  return v6;
}

- (BOOL)_productTypeIsYorktownEnabled:(id)a3
{
  uint64_t v3 = qword_10029B2C8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10029B2C8, &stru_1002474B0);
  }
  unsigned __int8 v5 = (void *)qword_10029B2C0;
  unsigned __int8 v6 = [v4 lowercaseString];

  char v7 = [v5 containsObject:v6] ^ 1;
  return v7;
}

- (BOOL)_checkIfShouldUpdateInRevLockFlowForWatchPairingVersion:(unint64_t)a3 watchChipID:(id)a4
{
  if (_BPSIsPairingCompatible()) {
    return 0;
  }
  unsigned __int8 v6 = +[NRPairingCompatibilityVersionInfo systemVersions];
  id v7 = [v6 maxPairingCompatibilityVersion];

  return (unint64_t)v7 > a3;
}

- (BOOL)blockTinkerPairing
{
  return self->_blockTinkerPairing;
}

- (BOOL)blockYorktownPairing
{
  return self->_blockYorktownPairing;
}

- (BOOL)yorktownForceSU
{
  return self->_yorktownForceSU;
}

- (BOOL)failSafeUpdateRequested
{
  return self->_failSafeUpdateRequested;
}

- (BOOL)updateInRevLockFlow
{
  return self->_updateInRevLockFlow;
}

- (BOOL)runUpdateInSetup
{
  return self->_runUpdateInSetup;
}

- (BOOL)pairingShouldContinue
{
  return self->_pairingShouldContinue;
}

- (BOOL)requiresZeroDayUpdate
{
  return self->_requiresZeroDayUpdate;
}

- (NSURL)zeroDayUpdateLearnMoreLink
{
  return self->_zeroDayUpdateLearnMoreLink;
}

- (void).cxx_destruct
{
}

@end