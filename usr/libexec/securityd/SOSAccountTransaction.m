@interface SOSAccountTransaction
- (BOOL)initialInCircle;
- (BOOL)initialTrusted;
- (BOOL)quiet;
- (NSData)initialKeyParameters;
- (NSMutableSet)peersToRequestSync;
- (NSSet)initialUnsyncedViews;
- (NSSet)initialViews;
- (NSString)description;
- (NSString)initialID;
- (SOSAccount)account;
- (SOSAccountTransaction)initWithAccount:(id)a3 quiet:(BOOL)a4;
- (unint64_t)currentTrustBitmask;
- (unsigned)initialCirclePeerCount;
- (void)finish;
- (void)requestSyncWith:(id)a3;
- (void)requestSyncWithPeers:(id)a3;
- (void)restart;
- (void)setAccount:(id)a3;
- (void)setInitialCirclePeerCount:(unsigned int)a3;
- (void)setInitialID:(id)a3;
- (void)setInitialInCircle:(BOOL)a3;
- (void)setInitialKeyParameters:(id)a3;
- (void)setInitialTrusted:(BOOL)a3;
- (void)setInitialUnsyncedViews:(id)a3;
- (void)setInitialViews:(id)a3;
- (void)setPeersToRequestSync:(id)a3;
- (void)setQuiet:(BOOL)a3;
- (void)start;
- (void)updateSOSCircleCachedStatus;
@end

@implementation SOSAccountTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersToRequestSync, 0);
  objc_storeStrong((id *)&self->_initialKeyParameters, 0);
  objc_storeStrong((id *)&self->_initialID, 0);
  objc_storeStrong((id *)&self->_initialUnsyncedViews, 0);
  objc_storeStrong((id *)&self->_initialViews, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

- (void)setPeersToRequestSync:(id)a3
{
}

- (NSMutableSet)peersToRequestSync
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQuiet:(BOOL)a3
{
  self->_quiet = a3;
}

- (BOOL)quiet
{
  return self->_quiet;
}

- (void)setInitialCirclePeerCount:(unsigned int)a3
{
  self->_initialCirclePeerCount = a3;
}

- (unsigned)initialCirclePeerCount
{
  return self->_initialCirclePeerCount;
}

- (void)setInitialKeyParameters:(id)a3
{
}

- (NSData)initialKeyParameters
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInitialTrusted:(BOOL)a3
{
  self->_initialTrusted = a3;
}

- (BOOL)initialTrusted
{
  return self->_initialTrusted;
}

- (void)setInitialID:(id)a3
{
}

- (NSString)initialID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInitialUnsyncedViews:(id)a3
{
}

- (NSSet)initialUnsyncedViews
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitialViews:(id)a3
{
}

- (NSSet)initialViews
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitialInCircle:(BOOL)a3
{
  self->_initialInCircle = a3;
}

- (BOOL)initialInCircle
{
  return self->_initialInCircle;
}

- (void)setAccount:(id)a3
{
}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)requestSyncWithPeers:(id)a3
{
  id v4 = a3;
  v5 = [(SOSAccountTransaction *)self peersToRequestSync];

  if (!v5)
  {
    v6 = +[NSMutableSet set];
    [(SOSAccountTransaction *)self setPeersToRequestSync:v6];
  }
  id v7 = [(SOSAccountTransaction *)self peersToRequestSync];
  [v7 unionSet:v4];
}

- (void)requestSyncWith:(id)a3
{
  id v4 = a3;
  v5 = [(SOSAccountTransaction *)self peersToRequestSync];

  if (!v5)
  {
    v6 = +[NSMutableSet set];
    [(SOSAccountTransaction *)self setPeersToRequestSync:v6];
  }
  id v7 = [(SOSAccountTransaction *)self peersToRequestSync];
  [v7 addObject:v4];
}

- (void)finish
{
  v3 = [(SOSAccountTransaction *)self account];
  unsigned int v4 = [v3 notifyCircleChangeOnExit];

  v5 = [(SOSAccountTransaction *)self account];
  unsigned int v6 = [v5 SOSMonitorModeSOSIsActive];

  id v7 = [(SOSAccountTransaction *)self account];
  unsigned int v8 = [v7 isInCircle:0];

  if (v8)
  {
    v9 = [(SOSAccountTransaction *)self peersToRequestSync];
    if (v9) {
      unsigned int v10 = v6;
    }
    else {
      unsigned int v10 = 0;
    }

    if (v10 == 1)
    {
      CFSetRef v11 = [(SOSAccountTransaction *)self peersToRequestSync];
      [(SOSAccountTransaction *)self setPeersToRequestSync:0];
      sub_10021C018(v11);
    }
    sub_1001EAE68(self);
    if (v6)
    {
      id v12 = [(SOSAccountTransaction *)self account];
      sub_1001F7D54(v12);
      goto LABEL_20;
    }
  }
  else
  {
    sub_1001EAE68(self);
  }
  id v12 = [(SOSAccountTransaction *)self account];
  if ([v12 isListeningForSync])
  {
    v13 = [v12 trust];
    id v14 = [v13 getDataSourceEngine:[v12 factory]];

    v15 = sub_10000B070("initial-sync");
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cancelling notifications to monitor in-sync", (uint8_t *)&buf, 2u);
      }

      sub_1001026AC((uint64_t)v14, 0);
      sub_1001025C8((uint64_t)v14, 0);
    }
    else
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No engine to cancel notification from.", (uint8_t *)&buf, 2u);
      }
    }
    [v12 setIsListeningForSync:0];
  }

LABEL_20:
  v17 = [(SOSAccountTransaction *)self account];
  [v17 peerInfo];

  if (v6)
  {
    v18 = [(SOSAccountTransaction *)self initialID];
    unsigned int v19 = [v18 isEqualToString:SOSPeerInfoGetPeerID()];

    if (v19)
    {
      v20 = (void *)SOSViewCopyViewSet();
      [(SOSAccountTransaction *)self setInitialUnsyncedViews:v20];
    }
  }
  v21 = [(SOSAccountTransaction *)self account];
  CFMutableSetRef v22 = sub_1001F6ED8(v21);

  if (!v6)
  {
    BOOL v26 = 0;
    goto LABEL_68;
  }
  v23 = [(SOSAccountTransaction *)self initialUnsyncedViews];
  if (!v23)
  {
    if (!v22) {
      goto LABEL_26;
    }
LABEL_29:
    v27 = [(SOSAccountTransaction *)self account];
    v28 = [(SOSAccountTransaction *)self initialUnsyncedViews];
    id v29 = v27;
    BOOL v26 = sub_1001F71E0(2, (BOOL)v28, (BOOL)v22);
    if (v26)
    {
      unsigned int v130 = v4;
      cf = v22;
      id v30 = v29;
      v31 = sub_10000B070("initial-sync");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Handling initial sync done.", (uint8_t *)&buf, 2u);
      }
      id v128 = v29;

      v32 = v30;
      v33 = SOSViewCopyViewSet();
      CFSetRef v34 = (const __CFSet *)SOSViewCopyViewSet();
      CFSetRef v35 = (const __CFSet *)sub_1001DCC24(v32, @"pendingEnableViews");
      if (!v35 || (CFSetRef v36 = v35, v37 = CFGetTypeID(v35), v37 != CFSetGetTypeID())) {
        CFSetRef v36 = 0;
      }
      id v38 = sub_1001DCC24(v32, @"pendingDisableViews");
      if (!v38 || (id v39 = v38, v40 = CFGetTypeID(v38), v40 != CFSetGetTypeID())) {
        id v39 = 0;
      }
      if (v34)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v135 = sub_1001F71D0;
        v136 = &unk_100309D30;
        v137 = v33;
        CFSetApplyFunction(v34, (CFSetApplierFunction)sub_1001F7118, &buf);
      }
      if (v36)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v135 = sub_1001F71D0;
        v136 = &unk_100309D30;
        v137 = v33;
        CFSetApplyFunction(v36, (CFSetApplierFunction)sub_1001F7118, &buf);
      }
      if (v34) {
        CFRelease(v34);
      }
      v41 = [v32 trust];
      unsigned int v42 = [v41 updateViewSets:v32 enabled:v33 disabled:v39];

      if (v33) {
        CFRelease(v33);
      }
      CFMutableSetRef v22 = cf;
      id v29 = v129;
      if (v42)
      {
        sub_1001FF378(v32, @"pendingEnableViews", 0);
        sub_1001FF378(v32, @"pendingDisableViews", 0);
        v43 = sub_10000B070("views");
        unsigned int v4 = v130;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "updated view sets!", (uint8_t *)&buf, 2u);
        }

        v44 = v32;
      }
      else
      {
        v45 = sub_10000B070("SecError");
        unsigned int v4 = v130;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Could not update view sets", (uint8_t *)&buf, 2u);
        }

        v44 = sub_10000B070("initial-sync");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Account could not add the pending view sets", (uint8_t *)&buf, 2u);
        }
      }

      v46 = v32;
      CFDictionaryRef v47 = [v46 waitForInitialSync_blocks];
      [v46 setWaitForInitialSync_blocks:0];
      if (v47)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v135 = sub_1001F7398;
        v136 = &unk_100308090;
        v137 = v46;
        CFDictionaryApplyFunction(v47, (CFDictionaryApplierFunction)sub_1001F7468, &buf);

        CFRelease(v47);
      }
    }
    if (sub_1001F71E0(5, (BOOL)v28, (BOOL)v22))
    {
      v48 = sub_10000B070("initial-sync");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Handling Required Backup Sync done", (uint8_t *)&buf, 2u);
      }

      BOOL v26 = 1;
    }

    v49 = sub_10000B070("initial-sync");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = [(SOSAccountTransaction *)self initialUnsyncedViews];
      id v51 = [v50 shortDescription];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v51;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Unsynced was: %@", (uint8_t *)&buf, 0xCu);
    }
    v52 = sub_10000B070("initial-sync");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      id v53 = [(__CFSet *)v22 shortDescription];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Unsynced is: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_66;
  }
  v24 = v23;
  unsigned __int8 v25 = [v23 isEqual:v22];

  if ((v25 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  BOOL v26 = 0;
LABEL_66:
  v54 = [(SOSAccountTransaction *)self account];
  unsigned int v55 = [v54 engine_peer_state_needs_repair];

  if (v55)
  {
    v56 = [(SOSAccountTransaction *)self account];
    sub_1001E6E98(v56);

    BOOL v26 = 1;
  }
LABEL_68:
  v57 = [(SOSAccountTransaction *)self account];
  unsigned int v58 = [v57 circle_rings_retirements_need_attention];

  if (v58)
  {
    v59 = [(SOSAccountTransaction *)self account];
    [v59 setCircle_rings_retirements_need_attention:0];

    v60 = [(SOSAccountTransaction *)self account];
    [v60 triggerRingUpdate];

    BOOL v26 = 1;
  }
  v61 = [(SOSAccountTransaction *)self account];
  unsigned int v62 = [v61 need_backup_peers_created_after_backup_key_set];

  if (v62)
  {
    v63 = [(SOSAccountTransaction *)self account];
    [v63 setNeed_backup_peers_created_after_backup_key_set:0];

    BOOL v26 = 1;
  }
  v64 = [(SOSAccountTransaction *)self account];
  if ([v64 peerInfo])
  {
    v65 = [(SOSAccountTransaction *)self account];
    [v65 peerInfo];
    v66 = (const void *)SOSPeerInfoCopyEnabledViews();
  }
  else
  {
    v66 = 0;
  }

  v67 = [(SOSAccountTransaction *)self initialViews];
  v68 = v67;
  if (v67) {
    unsigned int v69 = [v67 isEqual:v66];
  }
  else {
    unsigned int v69 = v66 == 0;
  }
  int v70 = v69 ^ 1;

  if (v66) {
    CFRelease(v66);
  }
  if ((v26 | v70) == 1)
  {
    v71 = [(SOSAccountTransaction *)self account];
    sub_1001F55B8(v71);
  }
  v72 = [(SOSAccountTransaction *)self account];
  if (objc_msgSend(v72, "key_interests_need_updating"))
  {
    v73 = [(SOSAccountTransaction *)self account];
    unsigned __int8 v74 = [v73 consolidateKeyInterest];

    if (v74) {
      goto LABEL_86;
    }
    v72 = [(SOSAccountTransaction *)self account];
    sub_10020CAB4(v72);
  }

LABEL_86:
  v75 = [(SOSAccountTransaction *)self account];
  [v75 setEngine_peer_state_needs_repair:0];

  v76 = [(SOSAccountTransaction *)self account];
  [v76 flattenToSaveBlock];

  v77 = [(SOSAccountTransaction *)self account];
  unsigned int v78 = [v77 isInCircle:0];

  if ((v6 & v78 & v4) == 1)
  {
    v79 = self->_account;
    v80 = [(SOSAccount *)v79 settings];
    v81 = [v80 objectForKey:@"lastKVSCleanup"];

    v82 = +[NSDate date];
    [v82 timeIntervalSinceDate:v81];
    if (v83 >= 259200.0) {
      sub_1001E7364(v79, 0);
    }
  }
  v84 = [(SOSAccountTransaction *)self account];
  CFSetRef v85 = (const __CFSet *)[v84 peerInfo];

  if (v85) {
    CFSetRef v85 = (const __CFSet *)SOSPeerInfoCopyEnabledViews();
  }
  if (![(SOSAccountTransaction *)self quiet])
  {
    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472;
    v133[2] = sub_1001F431C;
    v133[3] = &unk_100307E58;
    v133[4] = self;
    sub_100025B70(v85, (uint64_t)v133);
  }
  CFSetRef cfa = v85;
  v86 = [(SOSAccountTransaction *)self initialKeyParameters];
  v87 = [(SOSAccountTransaction *)self account];
  uint64_t v88 = [v87 accountKeyDerivationParameters];
  v89 = (void *)v88;
  if (v86) {
    unsigned int v90 = [v86 isEqual:v88];
  }
  else {
    unsigned int v90 = v88 == 0;
  }

  if ([(SOSAccountTransaction *)self initialTrusted]
    && ((![(SOSAccountTransaction *)self initialInCircle] | v90 | v78 ^ 1) & 1) == 0)
  {
    v92 = [(SOSAccountTransaction *)self account];
    unsigned int v91 = [v92 accountKeyIsTrusted];
  }
  else
  {
    unsigned int v91 = 0;
  }
  if (v78 == [(SOSAccountTransaction *)self initialInCircle])
  {
    if (v78)
    {
      v96 = [(SOSAccountTransaction *)self initialViews];
      if (v96)
      {
        v97 = v96;
        unsigned __int8 v98 = [v96 isEqual:cfa];

        if (v98) {
          goto LABEL_108;
        }
      }
      else if (!cfa)
      {
        goto LABEL_108;
      }
      CFMutableSetRef v93 = v22;
      dword_10035D348 = 0;
      v94 = sub_10000B070("secdNotify");
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Notified clients of kSOSCCViewMembershipChangedNotification for viewchange(only)", (uint8_t *)&buf, 2u);
      }
      int v95 = 1;
      goto LABEL_113;
    }
LABEL_108:
    CFMutableSetRef v93 = v22;
    if (!v91)
    {
      int v95 = 0;
      goto LABEL_114;
    }
    dword_10035D348 = 0;
    v94 = sub_10000B070("secdNotify");
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Notified clients of kSOSCCCircleChangedNotification for userKey change", (uint8_t *)&buf, 2u);
    }
    int v95 = 0;
    goto LABEL_112;
  }
  CFMutableSetRef v93 = v22;
  dword_10035D348 = 0;
  v94 = sub_10000B070("secdNotify");
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Notified clients of kSOSCCCircleChangedNotification && kSOSCCViewMembershipChangedNotification for circle/view change", (uint8_t *)&buf, 2u);
  }
  int v95 = 1;
LABEL_112:
  unsigned int v4 = 1;
LABEL_113:

LABEL_114:
  if (![(SOSAccountTransaction *)self initialTrusted]
    || ((![(SOSAccountTransaction *)self initialInCircle] | v90) & 1) != 0
    || ([(SOSAccountTransaction *)self account],
        v99 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v100 = [v99 accountKeyIsTrusted],
        v99,
        (v100 & 1) != 0))
  {
    if ([(SOSAccountTransaction *)self initialTrusted])
    {
      if ((v4 & 1) == 0) {
        goto LABEL_143;
      }
LABEL_130:
      [(SOSAccountTransaction *)self updateSOSCircleCachedStatus];
      v106 = [(SOSAccountTransaction *)self account];
      [v106 sosEvaluateIfNeeded];

      if ((v95 & 1) == 0) {
        goto LABEL_132;
      }
      goto LABEL_131;
    }
  }
  else
  {
    v101 = sub_10000B070("userKeyTrust");
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "No longer trust user public key - prompting for password.", (uint8_t *)&buf, 2u);
    }

    notify_post("com.apple.security.publickeynotavailable");
    dword_10035D348 = 0;
    if ([(SOSAccountTransaction *)self initialTrusted]) {
      goto LABEL_130;
    }
    unsigned int v4 = 1;
  }
  v102 = [(SOSAccountTransaction *)self account];
  unsigned int v103 = [v102 accountKeyIsTrusted] & v78;

  if (v103 == 1)
  {
    v104 = sub_10000B070("userKeyTrust");
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "UserKey is once again trusted and we're valid in circle.", (uint8_t *)&buf, 2u);
    }

    [(SOSAccountTransaction *)self updateSOSCircleCachedStatus];
    v105 = [(SOSAccountTransaction *)self account];
    [v105 sosEvaluateIfNeeded];

    goto LABEL_131;
  }
  if (v4) {
    goto LABEL_130;
  }
LABEL_143:
  if (v95) {
LABEL_131:
  }
    sub_1001F4448(self->_account);
LABEL_132:
  v107 = [(SOSAccountTransaction *)self account];
  unsigned int v108 = [v107 notifyBackupOnExit];

  if (v108)
  {
    notify_post("com.apple.security.itembackup");
    v109 = [(SOSAccountTransaction *)self account];
    [v109 setNotifyBackupOnExit:0];
  }
  int v110 = dword_10035D348;
  if (dword_10035D348 <= 0)
  {
    id v111 = [(SOSAccountTransaction *)self account];
    v112 = sub_10000B070("accountLogState");
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Start", (uint8_t *)&buf, 2u);
    }

    CFStringRef v113 = sub_1001E0490(v111);
    v114 = sub_10000B070("accountLogState");
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v113;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }

    if (v113) {
      CFRelease(v113);
    }
    v115 = [v111 trust];
    if ([v115 trustedCircle])
    {
      [v115 trustedCircle];
      [v111 accountKey];
      v116 = [v111 peerID];
      SOSCircleLogState();
    }
    else
    {
      v116 = sub_10000B070("accountLogState");
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "ACCOUNT: No Circle", (uint8_t *)&buf, 2u);
      }
    }

    id v117 = [(SOSAccountTransaction *)self account];
    v118 = [v117 trust];
    unsigned int v119 = [v118 isInCircleOnly:0];

    if (v119)
    {
      CFSetRef v120 = (const __CFSet *)[v117 peerInfo];
      BOOL v121 = sub_1001F7170(v117);
      BOOL v122 = sub_1001F7170(v117);
      if (v120) {
        CFSetRef v120 = (const __CFSet *)SOSPeerInfoCopyEnabledViews();
      }
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v135 = sub_1001E8BE0;
      v136 = &unk_100307708;
      LOBYTE(v137) = v121;
      BYTE1(v137) = v122;
      sub_100025B70(v120, (uint64_t)&buf);
      if (v120) {
        CFRelease(v120);
      }
      CFMutableSetRef v123 = sub_1001F6ED8(v117);
      sub_1001E8CD8(&stru_100307728, @"null");
      if (v123) {
        CFRelease(v123);
      }
      if (qword_10035D0A8 != -1) {
        dispatch_once(&qword_10035D0A8, &stru_100303AD8);
      }
      if (byte_10035D0A0)
      {
        v124 = sub_10000B070("accountLogState");
        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v125 = [v117 sosCompatibilityMode];
          CFStringRef v126 = @"disabled";
          if (v125) {
            CFStringRef v126 = @"enabled";
          }
          *(_DWORD *)v138 = 138412290;
          CFStringRef v139 = v126;
          _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "SOS CompatibilityMode: %@", v138, 0xCu);
        }
      }
    }
    v127 = sub_10000B070("accountLogState");
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v138 = 0;
      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Finish", v138, 2u);
    }

    int v110 = 200;
  }
  dword_10035D348 = v110 - 1;
  if (cfa) {
    CFRelease(cfa);
  }
}

- (void)restart
{
  [(SOSAccountTransaction *)self finish];

  [(SOSAccountTransaction *)self start];
}

- (void)start
{
  [(SOSAccountTransaction *)self updateSOSCircleCachedStatus];
  sub_1001F4448(self->_account);
  v3 = [(SOSAccountTransaction *)self account];
  -[SOSAccountTransaction setInitialInCircle:](self, "setInitialInCircle:", [v3 isInCircle:0]);

  unsigned int v4 = [(SOSAccountTransaction *)self account];
  -[SOSAccountTransaction setInitialTrusted:](self, "setInitialTrusted:", [v4 accountKeyIsTrusted]);

  [(SOSAccountTransaction *)self setInitialCirclePeerCount:0];
  if ([(SOSAccountTransaction *)self initialInCircle])
  {
    v5 = [(SOSAccountTransaction *)self account];
    unsigned int v6 = [v5 trust];
    [v6 trustedCircle];
    [(SOSAccountTransaction *)self setInitialCirclePeerCount:SOSCircleCountPeers()];
  }
  if ([(SOSAccountTransaction *)self initialInCircle])
  {
    id v7 = [(SOSAccountTransaction *)self account];
    sub_1001F7D54(v7);
  }
  unsigned int v8 = [(SOSAccountTransaction *)self account];
  CFMutableSetRef v9 = sub_1001F6ED8(v8);
  [(SOSAccountTransaction *)self setInitialUnsyncedViews:v9];

  unsigned int v10 = [(SOSAccountTransaction *)self account];
  CFSetRef v11 = [v10 accountKeyDerivationParameters];
  if (v11)
  {
    id v12 = [(SOSAccountTransaction *)self account];
    v13 = [v12 accountKeyDerivationParameters];
    id v14 = +[NSData dataWithData:v13];
    [(SOSAccountTransaction *)self setInitialKeyParameters:v14];
  }
  else
  {
    [(SOSAccountTransaction *)self setInitialKeyParameters:0];
  }

  v15 = [(SOSAccountTransaction *)self account];
  id v16 = [v15 peerInfo];

  if (v16)
  {
    v17 = (void *)SOSPeerInfoCopyEnabledViews();
    [(SOSAccountTransaction *)self setInitialViews:v17];

    v18 = [(SOSAccountTransaction *)self account];
    [v18 ensureOctagonPeerKeys];
  }
  [(SOSAccountTransaction *)self setPeersToRequestSync:0];
  sub_1001EAE68(self);
  unsigned int v19 = [(SOSAccountTransaction *)self account];
  if (objc_msgSend(v19, "key_interests_need_updating"))
  {
    v20 = [(SOSAccountTransaction *)self account];
    unsigned __int8 v21 = [v20 consolidateKeyInterest];

    if (v21) {
      goto LABEL_14;
    }
    unsigned int v19 = [(SOSAccountTransaction *)self account];
    sub_10020CAB4(v19);
  }

LABEL_14:
  if (![(SOSAccountTransaction *)self quiet])
  {
    CFSetRef v22 = [(SOSAccountTransaction *)self initialViews];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001F4AD0;
    v23[3] = &unk_100307E58;
    v23[4] = self;
    sub_100025B70(v22, (uint64_t)v23);
  }
}

- (SOSAccountTransaction)initWithAccount:(id)a3 quiet:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSAccountTransaction;
  id v7 = [(SOSAccountTransaction *)&v10 init];
  unsigned int v8 = v7;
  if (v7)
  {
    [(SOSAccountTransaction *)v7 setAccount:v6];
    v8->_quiet = a4;
    [(SOSAccountTransaction *)v8 start];
  }

  return v8;
}

- (NSString)description
{
  v3 = [(SOSAccountTransaction *)self initialViews];
  if (v3)
  {
    unsigned int v4 = [(SOSAccountTransaction *)self initialViews];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<SOSAccountTransaction*@%p %ld>", self, [v4 count]);
  }
  else
  {
    v5 = +[NSString stringWithFormat:@"<SOSAccountTransaction*@%p %ld>", self, 0];
  }

  return (NSString *)v5;
}

- (void)updateSOSCircleCachedStatus
{
  v3 = [(SOSAccount *)self->_account queue];
  dispatch_assert_queue_V2(v3);

  if (qword_10035D340 != -1) {
    dispatch_once(&qword_10035D340, &stru_100307DC8);
  }
  unint64_t v4 = [(SOSAccountTransaction *)self currentTrustBitmask];
  uint64_t v5 = v4;
  if ((qword_10035D338 & 0x8000000000000000) == 0 || qword_10035D338 != v4) {
    [(SOSAccount *)self->_account setNotifyCircleChangeOnExit:1];
  }
  if ([(SOSAccount *)self->_account notifyCircleChangeOnExit])
  {
    uint64_t v6 = qword_10035D338;
    qword_10035D338 = v5;
    id v7 = sub_10000B070("sosnotify");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      int v9 = qword_10035D338;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "new last circle status is: %d", buf, 8u);
    }

    SOSCachedNotificationOperation();
    if ((v6 & 0x8000000000000000) == 0) {
      -[SOSAccount setNotifyViewChangeOnExit:](self->_account, "setNotifyViewChangeOnExit:", 1, _NSConcreteStackBlock, 3221225472, sub_1001F4EDC, &unk_100307E30, self, v5);
    }
  }
}

- (unint64_t)currentTrustBitmask
{
  v3 = [(SOSAccount *)self->_account queue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(SOSAccount *)self->_account trust];
  uint64_t v5 = [v4 getCircleStatusOnly:0];

  if ([(SOSAccount *)self->_account accountKeyIsTrusted])
  {
    uint64_t v6 = [(SOSAccount *)self->_account accountPrivateKey];
    unint64_t v7 = 0xE000000000000000;
    if (!v6) {
      unint64_t v7 = 0xC000000000000000;
    }
    unint64_t v8 = v7 | v5;
  }
  else
  {
    unint64_t v8 = v5 | 0x8000000000000000;
  }
  int v9 = [(SOSAccount *)self->_account trust];
  unsigned int v10 = [v9 isInCircleOnly:0];

  if (v10) {
    return v8 | 0x1000000000000000;
  }
  else {
    return v8;
  }
}

@end