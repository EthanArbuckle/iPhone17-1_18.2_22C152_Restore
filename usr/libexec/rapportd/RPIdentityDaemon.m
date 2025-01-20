@interface RPIdentityDaemon
+ (id)sharedIdentityDaemon;
- (BOOL)_removeSameAccountIdentityWithIDSIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_stationaryDevice;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)removeIdentity:(id)a3 error:(id *)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)saveIdentity:(id)a3 error:(id *)a4;
- (BOOL)saveIdentityWithIDSDeviceID:(id)a3 message:(id)a4 error:(id *)a5;
- (NSUUID)adHocPairingIdentifier;
- (NSUUID)sessionPairingIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPIdentity)homeKitIdentity;
- (RPIdentityDaemon)init;
- (id)_identitiesOfType:(int)a3 error:(id *)a4;
- (id)descriptionWithLevel:(int)a3;
- (id)identitiesOfType:(int)a3 error:(id *)a4;
- (id)identityOfSelfAndReturnError:(id *)a3;
- (id)identityOfTemporarySelfAndReturnError:(id *)a3;
- (id)loadFamilyDeviceIdentitiesWithError:(id *)a3;
- (id)loadFriendDeviceIdentitiesWithError:(id *)a3;
- (id)resolveIdentitiesForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4;
- (id)resolveIdentityForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4;
- (id)resolveIdentityForNearFieldMessagePayload:(id)a3;
- (id)resolveIdentityForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5 error:(id *)a6;
- (id)resolveIdentityForTempAuthTagData:(id)a3 bluetoothAddressData:(id)a4;
- (unint64_t)featureFlagsForIdentityMatchingIDSDeviceIdentifier:(id)a3;
- (unint64_t)resolveIdentityforSignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 accountaltDSID:(id)a6;
- (unsigned)_updateSelfIdentityPrivate:(id)a3 create:(BOOL)a4;
- (unsigned)_updateSelfIdentityPublic:(id)a3 privateIdentity:(id)a4;
- (unsigned)resolveIdentityTypesForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5;
- (void)_activate;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)_enumerateIdentitiesWithFlag:(unsigned int)a3 usingBlock:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_loadSelfIdentity:(BOOL)a3;
- (void)_loadTemporarySelfIdentity;
- (void)_postIdentitiesChangedNotification;
- (void)_removeSelfIdentityPublicWithPrivateIdentity:(id)a3;
- (void)_saveSelfIdentityPrivate:(id)a3;
- (void)_saveSelfIdentityPublicWithPrivateIdentity:(id)a3 force:(BOOL)a4;
- (void)_triggerKeychainRefetch;
- (void)_update;
- (void)_updatePairedDeviceIdentities;
- (void)_updateSameAccountIdentities;
- (void)activate;
- (void)addOrUpdateAdHocPairedIdentity:(id)a3;
- (void)addSelfIdentityInfoToMessage:(id)a3 flags:(unsigned int)a4;
- (void)addSessionPairedIdentity:(id)a3;
- (void)addSharedHomeIdentityWithRPMessage:(id)a3;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)getPairedIdentityWithCompletion:(id)a3;
- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)isContactValidForIdentity:(id)a3 completionBlock:(id)a4;
- (void)prefsChanged;
- (void)regenerateSelfIdentity:(id)a3;
- (void)regenerateTemporarySelfIdentity;
- (void)removeSessionPairedIdentityWithIdentifier:(id)a3;
- (void)resolvableAccessoriesUpdated:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHomeKitIdentity:(id)a3;
- (void)updateSessionPairedIdentity:(id)a3;
@end

@implementation RPIdentityDaemon

+ (id)sharedIdentityDaemon
{
  if (qword_100142D90 != -1) {
    dispatch_once(&qword_100142D90, &stru_1001230F0);
  }
  v2 = (void *)qword_100142D88;

  return v2;
}

- (RPIdentityDaemon)init
{
  v16.receiver = self;
  v16.super_class = (Class)RPIdentityDaemon;
  v2 = [(RPIdentityDaemon *)&v16 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    *(void *)&v3->_homeViewChangeToken = -1;
    v3->_pairedDevicesNotifier = -1;
    v3->_userIdentitiesChanged = 1;
    id v4 = objc_alloc((Class)off_100141BD0[0]());
    dispatchQueue = v3->_dispatchQueue;
    v6 = off_100141BD8[0]();
    v17 = v6;
    v18 = &__kCFBooleanTrue;
    v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v8 = (CBPeripheralManager *)[v4 initWithDelegate:0 queue:dispatchQueue options:v7];
    peripheralManager = v3->_peripheralManager;
    v3->_peripheralManager = v8;

    uint64_t v10 = +[NSUUID UUID];
    sessionPairingIdentifier = v3->_sessionPairingIdentifier;
    v3->_sessionPairingIdentifier = (NSUUID *)v10;

    uint64_t v12 = +[NSUUID UUID];
    adHocPairingIdentifier = v3->_adHocPairingIdentifier;
    v3->_adHocPairingIdentifier = (NSUUID *)v12;

    v14 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  v170[1] = 0;
  NSAppendPrintF();
  id v4 = 0;
  v170[0] = 0;
  uint64_t v5 = [(RPIdentityDaemon *)self identityOfSelfAndReturnError:v170];
  id v6 = v170[0];
  v7 = v6;
  if (v5)
  {
    v169[2] = v4;
    uint64_t v95 = CUDescriptionWithLevel();
    NSAppendPrintF();
    id v8 = v4;

    id v4 = (id)v95;
  }
  else
  {
    v169[1] = v4;
    uint64_t v95 = (uint64_t)v6;
    NSAppendPrintF();
    id v8 = v4;
  }

  v169[0] = v7;
  uint64_t v9 = -[RPIdentityDaemon identityOfTemporarySelfAndReturnError:](self, "identityOfTemporarySelfAndReturnError:", v169, v95);
  id v10 = v169[0];

  v115 = (void *)v5;
  if (v9)
  {
    id v168 = v8;
    uint64_t v96 = CUDescriptionWithLevel();
    NSAppendPrintF();
    id v11 = v8;

    id v8 = (id)v96;
  }
  else
  {
    id v167 = v8;
    uint64_t v96 = (uint64_t)v10;
    NSAppendPrintF();
    id v11 = v8;
  }
  v113 = (void *)v9;

  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  v116 = self;
  uint64_t v12 = self->_sameAccountDeviceIdentities;
  v13 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v163, v180, 16, v96);
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *(void *)v164;
    do
    {
      objc_super v16 = 0;
      v17 = v11;
      do
      {
        if (*(void *)v164 != v15) {
          objc_enumerationMutation(v12);
        }
        v162[1] = v17;
        v97 = CUDescriptionWithLevel();
        NSAppendPrintF();
        id v11 = v17;

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      v14 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v163, v180, 16, v97);
    }
    while (v14);
  }

  v162[0] = v10;
  v18 = self;
  v19 = [(RPIdentityDaemon *)self identitiesOfType:3 error:v162];
  id v20 = v162[0];

  v112 = v19;
  if (v19)
  {
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v21 = v19;
    v22 = (char *)[v21 countByEnumeratingWithState:&v158 objects:v179 count:16];
    if (v22)
    {
      v23 = v22;
      uint64_t v24 = *(void *)v159;
      do
      {
        v25 = 0;
        v26 = v11;
        do
        {
          if (*(void *)v159 != v24) {
            objc_enumerationMutation(v21);
          }
          v157[2] = v26;
          v98 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v26;

          ++v25;
          v26 = v11;
        }
        while (v23 != v25);
        v23 = (char *)[v21 countByEnumeratingWithState:&v158 objects:v179 count:16];
      }
      while (v23);
      v18 = self;
    }
  }
  else
  {
    v157[1] = v11;
    NSAppendPrintF();
    id v21 = v11;
    id v11 = v11;
  }

  v157[0] = v20;
  v27 = [(RPIdentityDaemon *)v18 identitiesOfType:4 error:v157];
  id v28 = v157[0];

  v111 = v27;
  if (v27)
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v29 = v27;
    v30 = (char *)[v29 countByEnumeratingWithState:&v153 objects:v178 count:16];
    if (v30)
    {
      v31 = v30;
      uint64_t v32 = *(void *)v154;
      do
      {
        v33 = 0;
        v34 = v11;
        do
        {
          if (*(void *)v154 != v32) {
            objc_enumerationMutation(v29);
          }
          v152[2] = v34;
          v99 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v34;

          ++v33;
          v34 = v11;
        }
        while (v31 != v33);
        v31 = (char *)[v29 countByEnumeratingWithState:&v153 objects:v178 count:16];
      }
      while (v31);
      v18 = self;
    }
  }
  else
  {
    v152[1] = v11;
    NSAppendPrintF();
    id v29 = v11;
    id v11 = v11;
  }

  v152[0] = v28;
  v35 = [(RPIdentityDaemon *)v18 identitiesOfType:5 error:v152];
  id v36 = v152[0];

  v110 = v35;
  if (v35)
  {
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    id v37 = v35;
    v38 = (char *)[v37 countByEnumeratingWithState:&v148 objects:v177 count:16];
    if (v38)
    {
      v39 = v38;
      uint64_t v40 = *(void *)v149;
      do
      {
        v41 = 0;
        v42 = v11;
        do
        {
          if (*(void *)v149 != v40) {
            objc_enumerationMutation(v37);
          }
          v147[2] = v42;
          v100 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v42;

          ++v41;
          v42 = v11;
        }
        while (v39 != v41);
        v39 = (char *)[v37 countByEnumeratingWithState:&v148 objects:v177 count:16];
      }
      while (v39);
      v18 = self;
    }
  }
  else
  {
    v147[1] = v11;
    NSAppendPrintF();
    id v37 = v11;
    id v11 = v11;
  }

  v147[0] = v36;
  v43 = [(RPIdentityDaemon *)v18 identitiesOfType:6 error:v147];
  id v44 = v147[0];

  v109 = v43;
  if (v43)
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v45 = v43;
    v46 = (char *)[v45 countByEnumeratingWithState:&v143 objects:v176 count:16];
    if (v46)
    {
      v47 = v46;
      uint64_t v48 = *(void *)v144;
      do
      {
        v49 = 0;
        v50 = v11;
        do
        {
          if (*(void *)v144 != v48) {
            objc_enumerationMutation(v45);
          }
          v142[2] = v50;
          v101 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v50;

          ++v49;
          v50 = v11;
        }
        while (v47 != v49);
        v47 = (char *)[v45 countByEnumeratingWithState:&v143 objects:v176 count:16];
      }
      while (v47);
      v18 = self;
    }
  }
  else
  {
    v142[1] = v11;
    NSAppendPrintF();
    id v45 = v11;
    id v11 = v11;
  }

  v142[0] = v44;
  v51 = [(RPIdentityDaemon *)v18 identitiesOfType:8 error:v142];
  id v52 = v142[0];

  v114 = v51;
  if (v51)
  {
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v53 = v51;
    v54 = (char *)[v53 countByEnumeratingWithState:&v138 objects:v175 count:16];
    if (v54)
    {
      v55 = v54;
      uint64_t v56 = *(void *)v139;
      do
      {
        v57 = 0;
        v58 = v11;
        do
        {
          if (*(void *)v139 != v56) {
            objc_enumerationMutation(v53);
          }
          v137[2] = v58;
          v102 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v58;

          ++v57;
          v58 = v11;
        }
        while (v55 != v57);
        v55 = (char *)[v53 countByEnumeratingWithState:&v138 objects:v175 count:16];
      }
      while (v55);
      v18 = self;
    }
  }
  else
  {
    v137[1] = v11;
    NSAppendPrintF();
    id v53 = v11;
    id v11 = v11;
  }

  v137[0] = v52;
  v59 = [(RPIdentityDaemon *)v18 identitiesOfType:9 error:v137];
  id v60 = v137[0];

  v108 = v59;
  if (v59)
  {
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v61 = v59;
    v62 = (char *)[v61 countByEnumeratingWithState:&v133 objects:v174 count:16];
    if (v62)
    {
      v63 = v62;
      uint64_t v64 = *(void *)v134;
      do
      {
        v65 = 0;
        v66 = v11;
        do
        {
          if (*(void *)v134 != v64) {
            objc_enumerationMutation(v61);
          }
          v132[2] = v66;
          v103 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v66;

          ++v65;
          v66 = v11;
        }
        while (v63 != v65);
        v63 = (char *)[v61 countByEnumeratingWithState:&v133 objects:v174 count:16];
      }
      while (v63);
      v18 = v116;
    }
  }
  else
  {
    v132[1] = v11;
    NSAppendPrintF();
    id v61 = v11;
    id v11 = v11;
  }

  v132[0] = v60;
  v67 = [(RPIdentityDaemon *)v18 identitiesOfType:12 error:v132];
  id v68 = v132[0];

  v107 = v67;
  if (v67)
  {
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id v69 = v67;
    v70 = (char *)[v69 countByEnumeratingWithState:&v128 objects:v173 count:16];
    if (v70)
    {
      v71 = v70;
      uint64_t v72 = *(void *)v129;
      do
      {
        v73 = 0;
        v74 = v11;
        do
        {
          if (*(void *)v129 != v72) {
            objc_enumerationMutation(v69);
          }
          v127[2] = v74;
          v104 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v74;

          ++v73;
          v74 = v11;
        }
        while (v71 != v73);
        v71 = (char *)[v69 countByEnumeratingWithState:&v128 objects:v173 count:16];
      }
      while (v71);
    }
    v18 = v116;
  }
  else
  {
    v127[1] = v11;
    NSAppendPrintF();
    id v69 = v11;
    id v11 = v11;
  }

  v127[0] = v68;
  v75 = [(RPIdentityDaemon *)v18 identitiesOfType:13 error:v127];
  id v76 = v127[0];

  if (v75)
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v77 = v75;
    v78 = (char *)[v77 countByEnumeratingWithState:&v123 objects:v172 count:16];
    if (v78)
    {
      v79 = v78;
      uint64_t v80 = *(void *)v124;
      do
      {
        v81 = 0;
        v82 = v11;
        do
        {
          if (*(void *)v124 != v80) {
            objc_enumerationMutation(v77);
          }
          v122[2] = v82;
          v105 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v82;

          ++v81;
          v82 = v11;
        }
        while (v79 != v81);
        v79 = (char *)[v77 countByEnumeratingWithState:&v123 objects:v172 count:16];
      }
      while (v79);
      v18 = v116;
    }
  }
  else
  {
    v122[1] = v11;
    NSAppendPrintF();
    id v77 = v11;
    id v11 = v11;
  }

  v122[0] = v76;
  v83 = [(RPIdentityDaemon *)v18 identitiesOfType:15 error:v122];
  id v84 = v122[0];

  v86 = v114;
  v85 = v115;
  if (v83)
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v87 = v83;
    v88 = (char *)[v87 countByEnumeratingWithState:&v118 objects:v171 count:16];
    if (v88)
    {
      v89 = v88;
      v117 = v75;
      uint64_t v90 = *(void *)v119;
      do
      {
        v91 = 0;
        v92 = v11;
        do
        {
          if (*(void *)v119 != v90) {
            objc_enumerationMutation(v87);
          }
          v106 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v92;

          ++v91;
          v92 = v11;
        }
        while (v89 != v91);
        v89 = (char *)[v87 countByEnumeratingWithState:&v118 objects:v171 count:16];
      }
      while (v89);
      v86 = v114;
      v85 = v115;
      v75 = v117;
    }
  }
  else
  {
    NSAppendPrintF();
    id v87 = v11;
    id v11 = v11;
  }

  id v93 = v11;
  return v93;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065ED8;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006602C;
    v7[3] = &unk_100121158;
    v7[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setFirstUnlockHandler:v7];
    uint64_t v5 = self->_systemMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100066034;
    v6[3] = &unk_100121158;
    v6[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v6];
  }
  [(RPIdentityDaemon *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000660B0;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    peripheralManager = self->_peripheralManager;
    self->_peripheralManager = 0;

    [(RPIdentityDaemon *)self _ensureStopped];
    [(RPIdentityDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  int v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPIdentityDaemon *)self _ensureStopped];
    uint64_t v5 = +[RPDaemon sharedDaemon];
    [v5 postDaemonInfoChanges:8];

    notify_post("com.apple.rapport.identitiesChanged");
    [(RPIdentityDaemon *)self _update];
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  selfIdentityCache = self->_selfIdentityCache;
  self->_selfIdentityCache = 0;

  [(RPIdentityDaemon *)self _loadSelfIdentity:0];
  [(RPIdentityDaemon *)self _updateSameAccountIdentities];
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x20000) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_16:
  [(RPIdentityDaemon *)self _updateSameAccountIdentities];
  if ((v3 & 0x20000) == 0) {
    return;
  }
LABEL_17:
  v7 = [(RPIdentity *)self->_selfIdentityCache idsDeviceID];

  if (v7)
  {
    id v8 = self->_selfIdentityCache;
    [(RPIdentityDaemon *)self _saveSelfIdentityPublicWithPrivateIdentity:v8 force:0];
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 isEqual:@"KeychainRefetch"])
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPIdentityDaemon *)self _triggerKeychainRefetch];
    goto LABEL_37;
  }
  if ([v6 isEqual:@"SelfIdentityLoad"])
  {
    [(RPIdentityDaemon *)self _loadSelfIdentity:0];
LABEL_37:
    LOBYTE(v8) = 1;
    goto LABEL_38;
  }
  if ([v6 isEqual:@"SelfIdentitySave"])
  {
    id v8 = self->_selfIdentityCache;
    if (v8)
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(RPIdentityDaemon *)self _saveSelfIdentityPrivate:v8];
      [(RPIdentityDaemon *)self _saveSelfIdentityPublicWithPrivateIdentity:v8 force:1];
    }
    else if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_36;
  }
  if ([v6 isEqual:@"SelfIdentityRemove"])
  {
    id v8 = self->_selfIdentityCache;
    if (v8)
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(RPIdentityDaemon *)self _removeSelfIdentityPublicWithPrivateIdentity:v8];
    }
    goto LABEL_36;
  }
  if ([v6 isEqual:@"SelfIdentityRotate"])
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    LOBYTE(v8) = 1;
    [(RPIdentityDaemon *)self _loadSelfIdentity:1];
    goto LABEL_38;
  }
  if (![v6 isEqual:@"SameAccountIdentityRemove"])
  {
LABEL_50:
    LOBYTE(v8) = 0;
    goto LABEL_38;
  }
  id v8 = [v7 objectForKey:@"idsIdentifier"];
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v8)
  {
    id v13 = 0;
    unsigned __int8 v10 = [(RPIdentityDaemon *)self _removeSameAccountIdentityWithIDSIdentifier:v8 error:&v13];
    id v11 = v13;
    uint64_t v12 = v11;
    if (v10)
    {

LABEL_36:
      goto LABEL_37;
    }
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

    goto LABEL_50;
  }
LABEL_38:

  return (char)v8;
}

- (void)prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefFamilyResolve != v3)
  {
    if (dword_100141B60 <= 40 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v4 = "yes";
      if (v3) {
        uint64_t v5 = "no";
      }
      else {
        uint64_t v5 = "yes";
      }
      if (!v3) {
        id v4 = "no";
      }
      v18 = v5;
      v19 = v4;
      LogPrintF();
    }
    self->_prefFamilyResolve = v3;
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_prefFriendResolve != v6)
  {
    if (dword_100141B60 <= 40 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v7 = "yes";
      if (v6) {
        id v8 = "no";
      }
      else {
        id v8 = "yes";
      }
      if (!v6) {
        id v7 = "no";
      }
      v18 = v8;
      v19 = v7;
      LogPrintF();
    }
    self->_prefFriendResolve = v6;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_prefOwnerResolve != v9)
  {
    if (dword_100141B60 <= 40 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      unsigned __int8 v10 = "yes";
      if (v9) {
        id v11 = "no";
      }
      else {
        id v11 = "yes";
      }
      if (!v9) {
        unsigned __int8 v10 = "no";
      }
      v18 = v11;
      v19 = v10;
      LogPrintF();
    }
    self->_prefOwnerResolve = v9;
  }
  BOOL v12 = CFPrefs_GetInt64() != 0;
  if (self->_prefPairedResolve != v12)
  {
    if (dword_100141B60 <= 40 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v13 = "yes";
      if (v12) {
        v14 = "no";
      }
      else {
        v14 = "yes";
      }
      if (!v12) {
        id v13 = "no";
      }
      v18 = v14;
      v19 = v13;
      LogPrintF();
    }
    self->_prefPairedResolve = v12;
  }
  BOOL v15 = CFPrefs_GetInt64() != 0;
  if (self->_prefSharedHomeResolve != v15)
  {
    if (dword_100141B60 <= 40 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      objc_super v16 = "yes";
      if (v15) {
        v17 = "no";
      }
      else {
        v17 = "yes";
      }
      if (!v15) {
        objc_super v16 = "no";
      }
      v18 = v17;
      v19 = v16;
      LogPrintF();
    }
    self->_prefSharedHomeResolve = v15;
  }
  [(RPIdentityDaemon *)self _update];
}

- (void)regenerateSelfIdentity:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }
  -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 1, v4);
}

- (void)_update
{
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)setHomeKitIdentity:(id)a3
{
  id v4 = (RPIdentity *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homeKitIdentity = self->_homeKitIdentity;
  self->_homeKitIdentity = v4;
}

- (void)resolvableAccessoriesUpdated:(id)a3
{
  id v4 = a3;
  v42 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
  v43 = v6;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v59;
    v47 = v5;
    uint64_t v45 = *(void *)v59;
    do
    {
      unsigned __int8 v10 = 0;
      id v44 = v8;
      do
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v10);
        BOOL v12 = [v11 uniqueIdentifier:v41];
        id v13 = [v12 UUIDString];

        if (v13)
        {
          v14 = [v11 device];
          BOOL v15 = [v14 rapportIRK];
          objc_super v16 = [v15 data];

          if ([v16 length])
          {
            v49 = v16;
            v17 = [v11 home];
            v18 = [v17 currentUser];
            if (!v18
              || ([v17 homeAccessControlForUser:v18],
                  v19 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v20 = [v19 isOwner],
                  v19,
                  (v20 & 1) == 0))
            {
              uint64_t v48 = v13;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              id v21 = [v17 users];
              id v22 = [v21 countByEnumeratingWithState:&v54 objects:v63 count:16];
              if (v22)
              {
                v46 = v18;
                uint64_t v23 = *(void *)v55;
LABEL_12:
                uint64_t v24 = 0;
                while (1)
                {
                  if (*(void *)v55 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  v25 = *(void **)(*((void *)&v54 + 1) + 8 * v24);
                  v26 = [v17 homeAccessControlForUser:v25];
                  unsigned __int8 v27 = [v26 isOwner];

                  if (v27) {
                    break;
                  }
                  if (v22 == (id)++v24)
                  {
                    id v22 = [v21 countByEnumeratingWithState:&v54 objects:v63 count:16];
                    if (v22) {
                      goto LABEL_12;
                    }
                    id v28 = 0;
                    id v6 = v43;
                    id v8 = v44;
LABEL_29:
                    v18 = v46;
                    goto LABEL_31;
                  }
                }
                id v28 = [v25 userID];
                id v22 = [v25 uniqueIdentifier];

                if (!v28)
                {
                  id v6 = v43;
                  id v8 = v44;
                  v18 = v46;
                  goto LABEL_32;
                }
                id v21 = objc_alloc_init((Class)RPIdentity);
                [v21 setAccountID:v28];
                [v21 setDeviceIRKData:v49];
                [v21 setHomeKitUserIdentifier:v22];
                [v21 setIdentifier:v48];
                [v21 setIdsDeviceID:v48];
                id v29 = [v11 name];
                [v21 setName:v29];

                [v21 setType:9];
                id v30 = [v11 homePodVariant];
                CFStringRef v31 = @"AudioAccessory1,1";
                id v6 = v43;
                id v8 = v44;
                if (v30 == (id)1
                  || (id v32 = objc_msgSend(v11, "homePodVariant", @"AudioAccessory1,1"),
                      CFStringRef v31 = @"AudioAccessory5,1",
                      v32 == (id)2)
                  || (id v33 = objc_msgSend(v11, "homePodVariant", @"AudioAccessory5,1"),
                      CFStringRef v31 = @"AudioAccessory6,1",
                      v33 == (id)3))
                {
                  [v21 setModel:v31];
                }
                [v47 addObject:v21];
                if (dword_100141B60 > 30) {
                  goto LABEL_29;
                }
                v18 = v46;
                if (dword_100141B60 != -1 || _LogCategory_Initialize())
                {
                  id v41 = v21;
                  LogPrintF();
                }
              }
              else
              {
                id v28 = 0;
              }
LABEL_31:

LABEL_32:
              uint64_t v9 = v45;
              id v13 = v48;
            }

            id v5 = v47;
            objc_super v16 = v49;
          }
        }
        unsigned __int8 v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v8);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v34 = v42->_sharedHomeExtraDeviceIdentities;
  id v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        [v5 addObject:v39, v41];
        if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
        {
          id v41 = v39;
          LogPrintF();
        }
      }
      id v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v36);
  }

  objc_storeStrong((id *)&v42->_sharedHomeDeviceIdentities, v5);
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    id v41 = [v5 count:v41];
    LogPrintF();
  }
  uint64_t v40 = +[RPDaemon sharedDaemon];
  [v40 postDaemonInfoChanges:512];

  [(RPIdentityDaemon *)v42 _postIdentitiesChangedNotification];
}

- (id)resolveIdentitiesForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4
{
  id v6 = a3;
  id v7 = 0;
  while (a4)
  {
    if ((a4 & -a4) == 0) {
      break;
    }
    id v8 = [(RPIdentityDaemon *)self resolveIdentityForBonjourDevice:v6 typeFlags:a4 & -a4];
    if (v8)
    {
      if (!v7) {
        id v7 = objc_alloc_init((Class)NSMutableArray);
      }
      [v7 addObject:v8];
    }
    a4 ^= a4 & -a4;
  }

  return v7;
}

- (id)resolveIdentityForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    id v6 = [v5 txtDictionary];
    CFDictionaryGetHardwareAddress();
    CFDictionaryGetData();
    if (dword_100141B60 <= 20 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v7 = CUDescriptionWithLevel();
      LogPrintF();
    }
  }
  else if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return 0;
}

- (id)resolveIdentityForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5 error:(id *)a6
{
  __int16 v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if ((v7 & 2) != 0 && self->_prefOwnerResolve)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    BOOL v12 = self->_sameAccountDeviceIdentities;
    id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v71;
LABEL_5:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v71 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v70 + 1) + 8 * v16);
        if ([v17 verifySignature:v10 data:v11 error:0]) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v70 objects:v80 count:16];
          if (v14) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_96;
      }
      goto LABEL_95;
    }
LABEL_11:
  }
  if ((v7 & 8) == 0 || !self->_prefFamilyResolve)
  {
LABEL_23:
    if ((v7 & 0x20) != 0 && self->_prefFriendResolve)
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      BOOL v12 = [(RPIdentityDaemon *)self identitiesOfType:6 error:0];
      id v22 = [(NSArray *)v12 countByEnumeratingWithState:&v62 objects:v78 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v63;
LABEL_27:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v63 != v24) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v62 + 1) + 8 * v25);
          if ([v17 verifySignature:v10 data:v11 error:0]) {
            break;
          }
          if (v23 == (id)++v25)
          {
            id v23 = [(NSArray *)v12 countByEnumeratingWithState:&v62 objects:v78 count:16];
            if (v23) {
              goto LABEL_27;
            }
            goto LABEL_33;
          }
        }
        if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_96;
        }
        goto LABEL_95;
      }
LABEL_33:
    }
    if ((v7 & 0x400) != 0)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      BOOL v12 = [(RPIdentityDaemon *)self identitiesOfType:12 error:0];
      id v26 = [(NSArray *)v12 countByEnumeratingWithState:&v58 objects:v77 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v59;
LABEL_37:
        uint64_t v29 = 0;
        while (1)
        {
          if (*(void *)v59 != v28) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v58 + 1) + 8 * v29);
          if ([v17 verifySignature:v10 data:v11 error:0]) {
            break;
          }
          if (v27 == (id)++v29)
          {
            id v27 = [(NSArray *)v12 countByEnumeratingWithState:&v58 objects:v77 count:16];
            if (v27) {
              goto LABEL_37;
            }
            goto LABEL_43;
          }
        }
        if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_96;
        }
        goto LABEL_95;
      }
LABEL_43:
    }
    if ((v7 & 0x80) != 0 && self->_prefPairedResolve)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      BOOL v12 = [(RPIdentityDaemon *)self identitiesOfType:8 error:0];
      id v30 = [(NSArray *)v12 countByEnumeratingWithState:&v54 objects:v76 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v55;
LABEL_48:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v55 != v32) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v54 + 1) + 8 * v33);
          if ([v17 verifySignature:v10 data:v11 error:0]) {
            break;
          }
          if (v31 == (id)++v33)
          {
            id v31 = [(NSArray *)v12 countByEnumeratingWithState:&v54 objects:v76 count:16];
            if (v31) {
              goto LABEL_48;
            }
            goto LABEL_54;
          }
        }
        if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_96;
        }
        goto LABEL_95;
      }
LABEL_54:
    }
    if ((v7 & 0x800) != 0)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      BOOL v12 = [(RPIdentityDaemon *)self identitiesOfType:13 error:0];
      id v34 = [(NSArray *)v12 countByEnumeratingWithState:&v50 objects:v75 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v51;
LABEL_58:
        uint64_t v37 = 0;
        while (1)
        {
          if (*(void *)v51 != v36) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v50 + 1) + 8 * v37);
          if ([v17 verifySignature:v10 data:v11 error:0]) {
            break;
          }
          if (v35 == (id)++v37)
          {
            id v35 = [(NSArray *)v12 countByEnumeratingWithState:&v50 objects:v75 count:16];
            if (v35) {
              goto LABEL_58;
            }
            goto LABEL_64;
          }
        }
        if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_96;
        }
        goto LABEL_95;
      }
LABEL_64:
    }
    if ((v7 & 0x4000) != 0)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v38 = [(RPIdentityDaemon *)self identitiesOfType:15 error:0];
      id v39 = [v38 countByEnumeratingWithState:&v46 objects:v74 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v47;
        while (2)
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v47 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if ([v43 verifySignature:v10 data:v11 error:0])
            {
              if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              id v44 = v43;

              goto LABEL_97;
            }
          }
          id v40 = [v38 countByEnumeratingWithState:&v46 objects:v74 count:16];
          if (v40) {
            continue;
          }
          break;
        }
      }
    }
    if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a6)
    {
      RPErrorF();
      id v44 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v44 = 0;
    }
    goto LABEL_97;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  BOOL v12 = [(RPIdentityDaemon *)self identitiesOfType:4 error:0];
  id v18 = [(NSArray *)v12 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (!v18)
  {
LABEL_22:

    goto LABEL_23;
  }
  id v19 = v18;
  uint64_t v20 = *(void *)v67;
LABEL_16:
  uint64_t v21 = 0;
  while (1)
  {
    if (*(void *)v67 != v20) {
      objc_enumerationMutation(v12);
    }
    v17 = *(void **)(*((void *)&v66 + 1) + 8 * v21);
    if ([v17 verifySignature:v10 data:v11 error:0]) {
      break;
    }
    if (v19 == (id)++v21)
    {
      id v19 = [(NSArray *)v12 countByEnumeratingWithState:&v66 objects:v79 count:16];
      if (v19) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }
  if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
    goto LABEL_96;
  }
LABEL_95:
  LogPrintF();
LABEL_96:
  id v44 = v17;

LABEL_97:

  return v44;
}

- (unsigned)resolveIdentityTypesForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5
{
  __int16 v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((v5 & 2) == 0 || !self->_prefOwnerResolve)
  {
    LODWORD(v11) = 0;
    if ((v5 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_16;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = self->_sameAccountDeviceIdentities;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v52;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v51 + 1) + 8 * i) verifySignature:v8 data:v9 error:0])
        {
          LODWORD(v11) = 2;
          goto LABEL_15;
        }
      }
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if ((v5 & 8) != 0)
  {
LABEL_16:
    if (self->_prefFamilyResolve)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v14 = [(RPIdentityDaemon *)self identitiesOfType:4 error:0];
      id v15 = [v14 countByEnumeratingWithState:&v47 objects:v58 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v48;
        while (2)
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v48 != v17) {
              objc_enumerationMutation(v14);
            }
            if ([*(id *)(*((void *)&v47 + 1) + 8 * (void)j) verifySignature:v8 data:v9 error:0])
            {
              LODWORD(v11) = v11 | 8;
              goto LABEL_27;
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v47 objects:v58 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_27:
    }
  }
LABEL_28:
  if ((v5 & 0x20) != 0 && self->_prefFriendResolve)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v19 = [(RPIdentityDaemon *)self identitiesOfType:6 error:0];
    id v20 = [v19 countByEnumeratingWithState:&v43 objects:v57 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v44;
      while (2)
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v44 != v22) {
            objc_enumerationMutation(v19);
          }
          if ([*(id *)(*((void *)&v43 + 1) + 8 * (void)k) verifySignature:v8 data:v9 error:0])
          {
            LODWORD(v11) = v11 | 0x20;
            goto LABEL_40;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v43 objects:v57 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_40:
  }
  if ((v5 & 0x400) != 0)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v24 = [(RPIdentityDaemon *)self identitiesOfType:12 error:0];
    id v25 = [v24 countByEnumeratingWithState:&v39 objects:v56 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v40;
      while (2)
      {
        for (m = 0; m != v26; m = (char *)m + 1)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v24);
          }
          if ([*(id *)(*((void *)&v39 + 1) + 8 * (void)m) verifySignature:v8 data:v9 error:0])
          {
            LODWORD(v11) = v11 | 0x400;
            goto LABEL_52;
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v39 objects:v56 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_52:
  }
  if ((v5 & 0x800) != 0)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v29 = [(RPIdentityDaemon *)self identitiesOfType:13 error:0];
    id v30 = [v29 countByEnumeratingWithState:&v35 objects:v55 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v36;
      while (2)
      {
        for (n = 0; n != v31; n = (char *)n + 1)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(v29);
          }
          if ([*(id *)(*((void *)&v35 + 1) + 8 * (void)n) verifySignature:v8 data:v9 error:0])
          {
            LODWORD(v11) = v11 | 0x800;
            goto LABEL_64;
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v35 objects:v55 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }
LABEL_64:
  }
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return v11;
}

- (id)resolveIdentityForTempAuthTagData:(id)a3 bluetoothAddressData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = -[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15, 0, 0);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 verifyAuthTag:v6 data:v7 type:2 error:0])
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)resolveIdentityForNearFieldMessagePayload:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100068FF8;
  uint64_t v27 = sub_100069008;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100068FF8;
  id v21 = sub_100069008;
  id v22 = +[NSMutableArray array];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100069010;
  v13[3] = &unk_100123118;
  id v5 = v4;
  id v14 = v5;
  long long v15 = &v23;
  long long v16 = &v17;
  [(RPIdentityDaemon *)self _enumerateIdentitiesWithFlag:19882 usingBlock:v13];
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    [(id)v18[5] count];
    LogPrintF();
  }
  id v6 = v24;
  id v7 = (void *)v24[5];
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)v6[5];
    void v6[5] = (uint64_t)v8;
  }
  else
  {
    uint64_t v10 = [(id)v18[5] firstObject];
    id v9 = (void *)v24[5];
    v24[5] = v10;
  }

  id v11 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v11;
}

- (unint64_t)resolveIdentityforSignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 accountaltDSID:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_100069250;
  id v22 = &unk_100123140;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  id v15 = v12;
  id v25 = v15;
  id v26 = &v27;
  long long v16 = objc_retainBlock(&v19);
  -[RPIdentityDaemon _enumerateIdentitiesWithFlag:usingBlock:](self, "_enumerateIdentitiesWithFlag:usingBlock:", v7, v16, v19, v20, v21, v22);
  unint64_t v17 = v28[3];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (void)isContactValidForIdentity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (v6
    && ([v6 contactID], (id v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (unsigned int v9 = [v6 type], v8, v9 == 6))
  {
    id v10 = [v6 contactID];
    id v11 = objc_alloc_init((Class)off_100141BE0[0]());
    [v11 setContactIdentifier:v10];
    id v12 = objc_alloc_init((Class)off_100141BE8[0]());
    [v12 setDispatchQueue:self->_dispatchQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006954C;
    v15[3] = &unk_100123168;
    id v13 = v12;
    id v16 = v13;
    id v17 = v6;
    id v14 = v11;
    id v18 = v14;
    uint64_t v19 = self;
    id v21 = &v22;
    id v20 = v7;
    [v13 findContact:v14 completion:v15];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, *((unsigned __int8 *)v23 + 24));
  }
  _Block_object_dispose(&v22, 8);
}

- (id)identitiesOfType:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int DeviceClass = GestaltGetDeviceClass();
  switch(v5)
  {
    case 9:
      sharedHomeDeviceIdentities = self->_sharedHomeDeviceIdentities;
LABEL_11:
      if (!sharedHomeDeviceIdentities) {
        sharedHomeDeviceIdentities = (NSMutableArray *)&__NSArray0__struct;
      }
      unsigned int v9 = sharedHomeDeviceIdentities;
      goto LABEL_14;
    case 8:
      sharedHomeDeviceIdentities = (NSMutableArray *)self->_pairedDeviceIdentities;
      goto LABEL_11;
    case 2:
      p_super = self->_sameAccountDeviceIdentities;
      if (p_super) {
        goto LABEL_15;
      }
      goto LABEL_5;
  }
  if (v5 == 12 && DeviceClass == 4)
  {
    sharedHomeDeviceIdentities = (NSMutableArray *)self->_sharedTVUserDeviceIdentities;
    goto LABEL_11;
  }
  if ((int)v5 > 12)
  {
    if (v5 == 15)
    {
      sharedHomeDeviceIdentities = self->_adHocPairedDeviceIdentities;
      goto LABEL_11;
    }
    if (v5 == 13)
    {
      sharedHomeDeviceIdentities = self->_sessionPairedDeviceIdentities;
      goto LABEL_11;
    }
    goto LABEL_5;
  }
  if (v5 == 4)
  {
    id v12 = +[RPPeopleDaemon sharedPeopleDaemon];
    uint64_t v13 = [v12 getFamilyDeviceIdentities];
    goto LABEL_26;
  }
  if (v5 != 6)
  {
LABEL_5:
    unsigned int v9 = [(RPIdentityDaemon *)self _identitiesOfType:v5 error:a4];
LABEL_14:
    p_super = &v9->super;
    goto LABEL_15;
  }
  id v12 = +[RPPeopleDaemon sharedPeopleDaemon];
  uint64_t v13 = [v12 getFriendDeviceIdentities];
LABEL_26:
  id v14 = (void *)v13;
  id v15 = &__NSArray0__struct;
  if (v13) {
    id v15 = (void *)v13;
  }
  p_super = v15;

LABEL_15:

  return p_super;
}

- (id)_identitiesOfType:(int)a3 error:(id *)a4
{
  int v5 = a3;
  int v6 = a3 - 1;
  if ((a3 - 1) >= 0xC || ((0x8FFu >> v6) & 1) == 0)
  {
    id v7 = RPErrorF();
    if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a4) {
      *a4 = v7;
    }

LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
  unsigned int v9 = off_100123258[v6];
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    if (v5 == 12 || v5 == 2)
    {
      id v10 = +[RPCloudDaemon sharedCloudDaemon];
      long long v65 = [v10 idsDeviceIDSelf];

      uint64_t v11 = 3;
    }
    else
    {
      long long v65 = 0;
      uint64_t v11 = 1;
    }
    id v14 = objc_alloc_init((Class)CUKeychainItem);
    [v14 setAccessGroup:@"com.apple.rapport"];
    [v14 setSyncType:v11];
    [v14 setType:v9];
    id v15 = objc_alloc_init((Class)CUKeychainManager);
    id v71 = 0;
    id v16 = [v15 copyItemsMatchingItem:v14 flags:1 error:&v71];
    id v17 = v71;
    id v18 = v17;
    long long v69 = v16;
    if (v16 || [v17 code] == (id)-25300)
    {
      id v60 = v15;
      id v61 = v14;
      id v62 = objc_alloc_init((Class)NSMutableArray);
      id v19 = [v16 count];
      if (!v19)
      {
        id v42 = v18;
        goto LABEL_80;
      }
      id v20 = v19;
      long long v64 = self;
      uint64_t v21 = 0;
      int v67 = v5;
      uint64_t v68 = kSecAttrViewHintHome;
      while (1)
      {
        uint64_t v22 = [v69 objectAtIndexedSubscript:v21, v56, v57, v58, v59];
        id v23 = v22;
        if (v5 != 2) {
          goto LABEL_49;
        }
        uint64_t v24 = [v22 viewHint];
        unsigned __int8 v25 = [v24 isEqual:v68];

        if (v25) {
          goto LABEL_49;
        }
        id v63 = v18;
        id v26 = [v23 identifier];
        uint64_t v27 = [v23 type];
        id v28 = [v23 metadata];
        uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();

        uint64_t v29 = 0;
        while (v21 == v29)
        {
LABEL_45:
          if (v20 == (id)++v29)
          {
            id v41 = 0;
            goto LABEL_47;
          }
        }
        uint64_t v30 = [v69 objectAtIndexedSubscript:v29];
        id v31 = [v30 viewHint];
        unsigned int v32 = [v31 isEqual:v68];

        if (!v32) {
          goto LABEL_44;
        }
        id v33 = [v30 identifier];
        id v34 = v26;
        long long v35 = v34;
        if (v33 == v34)
        {
        }
        else
        {
          if ((v26 != 0) == (v33 == 0)) {
            goto LABEL_40;
          }
          unsigned int v36 = [v33 isEqual:v34];

          if (!v36) {
            goto LABEL_44;
          }
        }
        id v33 = [v30 type];
        id v37 = v27;
        long long v35 = v37;
        if (v33 == v37)
        {
        }
        else
        {
          if ((v27 != 0) == (v33 == 0))
          {
LABEL_40:

LABEL_44:
            goto LABEL_45;
          }
          unsigned int v38 = [v33 isEqual:v37];

          if (!v38) {
            goto LABEL_44;
          }
        }
        long long v39 = [0 metadata];
        uint64_t v40 = CFDictionaryGetInt64Ranged();

        if (Int64Ranged > v40)
        {
          [(RPIdentityDaemon *)v64 _triggerKeychainRefetch];
          goto LABEL_44;
        }
        id v41 = v30;
        if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v58 = Int64Ranged;
          uint64_t v59 = v40;
          long long v56 = v23;
          id v57 = v41;
          LogPrintF();
        }

LABEL_47:
        id v18 = v63;

        if (v41)
        {
          id v42 = v63;
          goto LABEL_72;
        }
LABEL_49:
        id v43 = objc_alloc_init((Class)RPIdentity);
        id v70 = v18;
        unsigned __int8 v44 = [v43 updateWithKeychainItem:v23 error:&v70];
        id v42 = v70;

        if ([v43 type] == 2 || objc_msgSend(v43, "type") == 1)
        {
          long long v45 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
          long long v46 = [v45 localDeviceInfo];
          long long v47 = [v46 accountID];

          if (v47)
          {
            long long v48 = [v43 accountID];

            if (!v48) {
              [v43 setAccountID:v47];
            }
          }
        }
        if (v44)
        {
          if (dword_100141B60 <= 60 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
          {
            long long v56 = v23;
            id v57 = v42;
            LogPrintF();
          }
        }
        else
        {
          long long v49 = [v43 idsDeviceID];
          long long v50 = v49;
          if (!v65 || !v49 || [v49 caseInsensitiveCompare:v65])
          {
            long long v51 = +[RPCloudDaemon sharedCloudDaemon];
            long long v52 = [v51 idsDeviceMap];
            long long v53 = [v52 objectForKeyedSubscript:v50];

            if (v53)
            {
              long long v54 = [v53 modelIdentifier];
              if (v54) {
                [v43 setModel:v54];
              }

              long long v55 = [v53 name];
              if (v55) {
                [v43 setName:v55];
              }
            }
            [v62 addObject:v43];
          }
        }
        id v18 = v42;
LABEL_72:
        int v5 = v67;

        if ((id)++v21 == v20)
        {
LABEL_80:
          id v12 = [v62 copy:v56];

          id v18 = v42;
          id v15 = v60;
          id v14 = v61;
          goto LABEL_81;
        }
      }
    }
    if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a4)
    {
      id v18 = v18;
      id v12 = 0;
      *a4 = v18;
    }
    else
    {
      id v12 = 0;
    }
LABEL_81:
  }
  else
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!a4) {
      goto LABEL_14;
    }
    RPErrorF();
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v12;
}

- (id)identityOfSelfAndReturnError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v5 = self->_selfIdentityCache;
  if (!v5)
  {
    if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
    {
      [(RPIdentityDaemon *)self _loadSelfIdentity:0];
      int v6 = self->_selfIdentityCache;
      int v5 = v6;
      if (v6)
      {
        id v7 = v6;
      }
      else if (a3)
      {
        RPErrorF();
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (a3)
      {
        RPErrorF();
        int v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v5 = 0;
      }
    }
  }

  return v5;
}

- (id)identityOfTemporarySelfAndReturnError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v5 = self->_temporarySelfIdentityCache;
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if (a3)
  {
    RPErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)featureFlagsForIdentityMatchingIDSDeviceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v5 = [(RPIdentityDaemon *)self identitiesOfType:4 error:0];
  int v6 = [(RPIdentityDaemon *)self identitiesOfType:6 error:0];
  id v7 = [(RPIdentityDaemon *)self identitiesOfType:2 error:0];
  id v8 = [objc_alloc((Class)NSMutableArray) initWithArray:v5];
  [v8 addObjectsFromArray:v6];
  [v8 addObjectsFromArray:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v17 = v5;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v13 idsDeviceID];
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v10 = [v13 featureFlags];
          goto LABEL_11;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_11:
    int v5 = v17;
  }

  return (unint64_t)v10;
}

- (void)regenerateTemporarySelfIdentity
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A888;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)loadFamilyDeviceIdentitiesWithError:(id *)a3
{
  return [(RPIdentityDaemon *)self _identitiesOfType:4 error:a3];
}

- (id)loadFriendDeviceIdentitiesWithError:(id *)a3
{
  return [(RPIdentityDaemon *)self _identitiesOfType:6 error:a3];
}

- (void)getPairedIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CUPairingManager);
  [v5 setDispatchQueue:self->_dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006A9E4;
  v7[3] = &unk_100123190;
  v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  [v5 getPairingIdentityWithOptions:134 completion:v7];
}

- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  id v7 = [v6 rpHomeKitManager];

  if (v7)
  {
    [v7 getPairingIdentityFromHomeWithAccessory:v9 completionHandler:v5];
  }
  else
  {
    id v8 = RPErrorF();
    v5[2](v5, 0, v8);
  }
}

- (void)addSelfIdentityInfoToMessage:(id)a3 flags:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v21 = 0;
  id v7 = [(RPIdentityDaemon *)self identityOfSelfAndReturnError:&v21];
  id v8 = v21;
  if (v7)
  {
    id v9 = [v7 deviceIRKData];
    if (v9) {
      [v6 setObject:v9 forKeyedSubscript:@"_dIRK"];
    }

    id v10 = [v7 edPKData];
    if (v10) {
      [v6 setObject:v10 forKeyedSubscript:@"_edPK"];
    }

    if (v4)
    {
      unsigned __int8 v19 = [v7 featureFlags];
      if ((v19 & 8) != 0)
      {
        long long v20 = +[NSNumber numberWithUnsignedLongLong:v19 & 8];
        [v6 setObject:v20 forKeyedSubscript:@"_ff"];
      }
      else
      {
        [v6 setObject:&off_10012B258 forKeyedSubscript:@"_ff"];
      }
      [v6 setObject:@"?" forKeyedSubscript:@"model"];
      [v6 setObject:@"?" forKeyedSubscript:@"model"];
    }
    else
    {
      uint64_t v11 = [v7 btIRKData];
      if (v11) {
        [v6 setObject:v11 forKeyedSubscript:@"_bIRK"];
      }

      id v12 = [v7 btAddress];
      if (v12) {
        [v6 setObject:v12 forKeyedSubscript:@"_bAdd"];
      }

      id v13 = [v7 featureFlags];
      if (v13)
      {
        id v14 = +[NSNumber numberWithUnsignedLongLong:v13];
        [v6 setObject:v14 forKeyedSubscript:@"_ff"];
      }
      unsigned int v15 = [v6 objectForKeyedSubscript:@"model"];

      if (!v15)
      {
        id v16 = (void *)GestaltCopyAnswer();
        if (v16) {
          [v6 setObject:v16 forKeyedSubscript:@"model"];
        }
      }
      id v17 = [v6 objectForKeyedSubscript:@"name"];

      if (!v17)
      {
        long long v18 = (void *)GestaltCopyAnswer();
        if (v18) {
          [v6 setObject:v18 forKeyedSubscript:@"name"];
        }
      }
    }
  }
  else if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)addSharedHomeIdentityWithRPMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  if (v5)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v6 = self->_sharedHomeExtraDeviceIdentities;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v44;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        id v12 = [v11 identifier];
        unsigned __int8 v13 = [v12 isEqual:v5];

        if (v13) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v11;

      if (!v14) {
        goto LABEL_13;
      }
      [v14 updateWithRPMessage:v4 error:0];
    }
    else
    {
LABEL_10:

LABEL_13:
      id v14 = objc_alloc_init((Class)RPIdentity);
      [v14 setIdentifier:v5];
      [v14 setType:9];
      [v14 updateWithRPMessage:v4 error:0];
      sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
      if (!sharedHomeExtraDeviceIdentities)
      {
        id v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        id v17 = self->_sharedHomeExtraDeviceIdentities;
        self->_sharedHomeExtraDeviceIdentities = v16;

        sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
      }
      [(NSMutableArray *)sharedHomeExtraDeviceIdentities addObject:v14];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    unsigned int v38 = self;
    long long v18 = self->_sharedHomeDeviceIdentities;
    id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v40;
LABEL_18:
      id v22 = v4;
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void **)(*((void *)&v39 + 1) + 8 * v23);
        unsigned __int8 v25 = [v24 identifier];
        unsigned __int8 v26 = [v25 isEqual:v5];

        if (v26) {
          break;
        }
        if (v20 == (id)++v23)
        {
          id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
          id v4 = v22;
          if (v20) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
      id v27 = v24;

      id v4 = v22;
      if (!v27) {
        goto LABEL_30;
      }
      id v28 = [v27 updateWithRPMessage:v22 error:0];
      uint64_t v29 = v38;
      if (v28)
      {
        if (dword_100141B60 <= 30)
        {
          id v30 = v28;
          if (dword_100141B60 != -1 || _LogCategory_Initialize())
          {
            id v36 = v30;
            id v37 = &unk_10011A6AF;
            id v35 = v14;
            LogPrintF();
          }
        }
        goto LABEL_37;
      }
    }
    else
    {
LABEL_24:

LABEL_30:
      uint64_t v29 = v38;
      sharedHomeDeviceIdentities = v38->_sharedHomeDeviceIdentities;
      if (!sharedHomeDeviceIdentities)
      {
        unsigned int v32 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        id v33 = v38->_sharedHomeDeviceIdentities;
        v38->_sharedHomeDeviceIdentities = v32;

        sharedHomeDeviceIdentities = v38->_sharedHomeDeviceIdentities;
      }
      [(NSMutableArray *)sharedHomeDeviceIdentities addObject:v14];
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
      {
        id v35 = v14;
        LogPrintF();
      }
      id v27 = 0;
LABEL_37:
      id v34 = +[RPDaemon sharedDaemon];
      [v34 postDaemonInfoChanges:512];

      [(RPIdentityDaemon *)v29 _postIdentitiesChangedNotification];
    }
  }
}

- (BOOL)removeIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 type];
  if (v7 > 0x10) {
    id v8 = "?";
  }
  else {
    id v8 = off_100123318[v7];
  }
  uint64_t v9 = +[NSString stringWithUTF8String:v8];
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    id v21 = v6;
    LogPrintF();
  }
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    unsigned int v10 = [v6 type];
    if (v10 == 2) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 6;
    }
    if (v10 == 2) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 1;
    }
    id v13 = objc_alloc_init((Class)CUKeychainItem);
    [v13 setAccessGroup:@"com.apple.rapport"];
    [v13 setAccessibleType:v11];
    id v14 = [v6 identifier];
    [v13 setIdentifier:v14];

    [v13 setSyncType:v12];
    unsigned int v15 = [v6 type] - 1;
    if (v15 > 0xB) {
      id v16 = 0;
    }
    else {
      id v16 = off_1001232B8[v15];
    }
    [v13 setType:v16];
    id v17 = objc_alloc_init((Class)CUKeychainManager);
    id v22 = 0;
    unsigned __int8 v18 = [v17 removeItemMatchingItem:v13 error:&v22];
    id v19 = v22;
    if (v18)
    {
      [(RPIdentityDaemon *)self _postIdentitiesChangedNotification];
    }
    else
    {
      if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (a4) {
        *a4 = v19;
      }
    }
  }
  else
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a4)
    {
      RPErrorF();
      unsigned __int8 v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v18 = 0;
    }
  }

  return v18;
}

- (BOOL)saveIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 type];
  if (v7 > 0x10) {
    id v8 = "?";
  }
  else {
    id v8 = off_100123318[v7];
  }
  uint64_t v9 = +[NSString stringWithUTF8String:v8];
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v6;
    LogPrintF();
  }
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    id v10 = objc_alloc_init((Class)CUKeychainItem);
    [v10 setAccessGroup:@"com.apple.rapport"];
    [v10 setAccessibleType:6];
    [v10 setInvisible:1];
    [v10 setSyncType:1];
    id v17 = 0;
    unsigned __int8 v11 = [v10 updateWithRPIdentity:v6 revisionUpdate:1 error:&v17];
    id v12 = v17;
    if (v11)
    {
      if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      LOBYTE(v14) = 0;
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      id v13 = objc_alloc_init((Class)CUKeychainManager);
      unsigned int v14 = [v13 addOrUpdateOrReAddItem:v10 logCategory:&dword_100141B60 logLabel:v9 error:a4];
      if (v14)
      {
        if ([v6 type] == 2)
        {
          if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(RPIdentityDaemon *)self _updateSameAccountIdentities];
        }
        else
        {
          [(RPIdentityDaemon *)self _postIdentitiesChangedNotification];
        }
      }
    }
  }
  else
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a4)
    {
      RPErrorF();
      LOBYTE(v14) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (BOOL)saveIdentityWithIDSDeviceID:(id)a3 message:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  [(RPIdentityDaemon *)self identitiesOfType:2 error:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned int v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      unsigned int v15 = [v14 identifier];
      unsigned __int8 v16 = [v15 isEqual:v7];

      if (v16) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v17 = v14;

    if (!v17) {
      goto LABEL_12;
    }
    int v18 = 0;
  }
  else
  {
LABEL_9:

LABEL_12:
    id v17 = objc_alloc_init((Class)RPIdentity);
    [v17 setIdentifier:v7];
    [v17 setType:2];
    int v18 = 1;
  }
  if ([v17 updateWithRPMessage:v8 error:0]) {
    int v19 = 1;
  }
  else {
    int v19 = v18;
  }
  id v20 = [v17 idsDeviceID];
  id v21 = v7;
  id v22 = v21;
  if (v20 == v21)
  {

    if (!v19) {
      goto LABEL_22;
    }
LABEL_25:
    BOOL v24 = [(RPIdentityDaemon *)self saveIdentity:v17 error:a5];
    goto LABEL_26;
  }
  if ((v21 != 0) == (v20 == 0))
  {

    goto LABEL_24;
  }
  unsigned __int8 v23 = [v20 isEqual:v21];

  if ((v23 & 1) == 0)
  {
LABEL_24:
    [v17 setIdsDeviceID:v22];
    goto LABEL_25;
  }
  if (v19) {
    goto LABEL_25;
  }
LABEL_22:
  BOOL v24 = 1;
LABEL_26:

  return v24;
}

- (void)addSessionPairedIdentity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006BC20;
    v7[3] = &unk_1001219D0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)removeSessionPairedIdentityWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006BED0;
  v7[3] = &unk_1001219D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)updateSessionPairedIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C1A8;
    block[3] = &unk_1001219D0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, block);
  }
  else if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)addOrUpdateAdHocPairedIdentity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006C4CC;
    v7[3] = &unk_1001219D0;
    id v8 = v4;
    id v9 = self;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)_ensureStarted
{
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    if (self->_homeViewChangeToken == -1)
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v3 = objc_alloc((Class)NSString);
      id v4 = [v3 initWithFormat:@"com.apple.security.view-change.%@", kSecAttrViewHintHome];
      id v5 = (const char *)[v4 UTF8String];
      dispatchQueue = self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10006CA44;
      handler[3] = &unk_100121630;
      handler[4] = self;
      notify_register_dispatch(v5, &self->_homeViewChangeToken, dispatchQueue, handler);
      [(RPIdentityDaemon *)self _updateSameAccountIdentities];
    }
    if (self->_homeViewReadyToken == -1)
    {
      id v7 = objc_alloc((Class)NSString);
      id v8 = [v7 initWithFormat:@"com.apple.security.view-ready.%@", kSecAttrViewHintHome];
      id v9 = (const char *)[v8 UTF8String];
      id v10 = self->_dispatchQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10006CAE4;
      v13[3] = &unk_100121630;
      void v13[4] = self;
      notify_register_dispatch(v9, &self->_homeViewReadyToken, v10, v13);
    }
    if (self->_pairedDevicesNotifier == -1)
    {
      id v11 = self->_dispatchQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10006CB90;
      v12[3] = &unk_100121630;
      v12[4] = self;
      notify_register_dispatch("com.apple.pairing.peerChanged", &self->_pairedDevicesNotifier, v11, v12);
      [(RPIdentityDaemon *)self _updatePairedDeviceIdentities];
    }
    if (!self->_selfIdentityCache) {
      [(RPIdentityDaemon *)self _loadSelfIdentity:0];
    }
    if (!self->_temporarySelfIdentityCache) {
      [(RPIdentityDaemon *)self _loadTemporarySelfIdentity];
    }
  }
  else if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_ensureStopped
{
  int homeViewChangeToken = self->_homeViewChangeToken;
  if (homeViewChangeToken != -1)
  {
    if (dword_100141B60 > 30) {
      goto LABEL_7;
    }
    if (dword_100141B60 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    int homeViewChangeToken = self->_homeViewChangeToken;
    if (homeViewChangeToken != -1)
    {
LABEL_7:
      notify_cancel(homeViewChangeToken);
      self->_int homeViewChangeToken = -1;
    }
  }
  int homeViewReadyToken = self->_homeViewReadyToken;
  if (homeViewReadyToken != -1)
  {
    if (dword_100141B60 > 30) {
      goto LABEL_14;
    }
    if (dword_100141B60 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    int homeViewReadyToken = self->_homeViewReadyToken;
    if (homeViewReadyToken != -1)
    {
LABEL_14:
      notify_cancel(homeViewReadyToken);
      self->_int homeViewReadyToken = -1;
    }
  }
  [(CUCoalescer *)self->_identitiesChangedCoalescer invalidate];
  identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  self->_identitiesChangedCoalescer = 0;

  pairedDeviceIdentities = self->_pairedDeviceIdentities;
  self->_pairedDeviceIdentities = 0;

  int pairedDevicesNotifier = self->_pairedDevicesNotifier;
  if (pairedDevicesNotifier != -1)
  {
    notify_cancel(pairedDevicesNotifier);
    self->_int pairedDevicesNotifier = -1;
  }
  sameAccountDeviceIdentities = self->_sameAccountDeviceIdentities;
  self->_sameAccountDeviceIdentities = 0;

  sharedHomeDeviceIdentities = self->_sharedHomeDeviceIdentities;
  self->_sharedHomeDeviceIdentities = 0;

  sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
  self->_sharedHomeExtraDeviceIdentities = 0;

  sharedTVUserDeviceIdentities = self->_sharedTVUserDeviceIdentities;
  self->_sharedTVUserDeviceIdentities = 0;

  adHocPairedDeviceIdentities = self->_adHocPairedDeviceIdentities;
  self->_adHocPairedDeviceIdentities = 0;

  selfIdentityCache = self->_selfIdentityCache;
  self->_selfIdentityCache = 0;

  temporarySelfIdentityCache = self->_temporarySelfIdentityCache;
  self->_temporarySelfIdentityCache = 0;

  temporarySelfIdentityTimer = self->_temporarySelfIdentityTimer;
  if (temporarySelfIdentityTimer)
  {
    id v17 = temporarySelfIdentityTimer;
    dispatch_source_cancel(v17);
    unsigned __int8 v16 = self->_temporarySelfIdentityTimer;
    self->_temporarySelfIdentityTimer = 0;
  }
}

- (void)_postIdentitiesChangedNotification
{
  identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  if (!identitiesChangedCoalescer)
  {
    id v4 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    id v5 = self->_identitiesChangedCoalescer;
    self->_identitiesChangedCoalescer = v4;

    [(CUCoalescer *)self->_identitiesChangedCoalescer setDispatchQueue:self->_dispatchQueue];
    [(CUCoalescer *)self->_identitiesChangedCoalescer setMinDelay:0.3];
    [(CUCoalescer *)self->_identitiesChangedCoalescer setMaxDelay:1.0];
    [(CUCoalescer *)self->_identitiesChangedCoalescer setActionHandler:&stru_1001231B0];
    identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  }

  [(CUCoalescer *)identitiesChangedCoalescer trigger];
}

- (void)_triggerKeychainRefetch
{
  uint64_t v3 = mach_absolute_time();
  if ((unint64_t)UpTicksToSeconds() >> 5 > 0x2A2)
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_keychainRefetchTicks = v3;
    id v6 = 0;
    id v4 = +[CKKSControl controlObject:&v6];
    id v5 = v6;
    if (v4)
    {
      [v4 rpcFetchAndProcessChanges:kSecAttrViewHintHome reply:&stru_1001231D0];
    }
    else if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updatePairedDeviceIdentities
{
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = objc_alloc_init((Class)CUPairingManager);
  [v3 setDispatchQueue:self->_dispatchQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006D24C;
  v4[3] = &unk_1001231F8;
  v4[4] = v3;
  v4[5] = self;
  [v3 getPairedPeersWithOptions:134 completion:v4];
}

- (void)_updateSameAccountIdentities
{
  id v60 = 0;
  id v3 = [(RPIdentityDaemon *)self _identitiesOfType:2 error:&v60];
  id v4 = v60;
  if (v4)
  {
    if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_84;
  }
  id v37 = self;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  location = (id *)&self->_sameAccountDeviceIdentities;
  id v5 = self->_sameAccountDeviceIdentities;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v57;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) setPresent:0];
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v7);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  unsigned int v38 = v3;
  id obj = v3;
  id v10 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = *(void *)v53;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v14 = *location;
        id v15 = [v14 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v49;
          while (2)
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(void *)v49 != v17) {
                objc_enumerationMutation(v14);
              }
              int v19 = *(void **)(*((void *)&v48 + 1) + 8 * (void)k);
              unsigned int v20 = [v19 compareWithRPIdentity:v13, v33];
              if ((v20 & 0x220) == 0)
              {
                unsigned int v21 = v20;
                [v19 setPresent:1];
                if (v21)
                {
                  uint64_t v40 = (v40 + 1);
                  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
                  {
                    id v33 = v13;
                    LogPrintF();
                  }
                }

                goto LABEL_36;
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v48 objects:v62 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        uint64_t v41 = (v41 + 1);
        if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
        {
          id v33 = v13;
          LogPrintF();
        }
LABEL_36:
        ;
      }
      id v11 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v22 = *location;
  id v23 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v45;
    do
    {
      for (m = 0; m != v24; m = (char *)m + 1)
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v22);
        }
        long long v28 = *(void **)(*((void *)&v44 + 1) + 8 * (void)m);
        if ((objc_msgSend(v28, "present", v33) & 1) == 0)
        {
          uint64_t v25 = (v25 + 1);
          if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
          {
            id v33 = v28;
            LogPrintF();
          }
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v24);
  }
  else
  {
    uint64_t v25 = 0;
  }

  BOOL v31 = (int)v41 > 0 || (int)v40 > 0 || (int)v25 > 0;
  if (*location)
  {
    id v4 = 0;
    id v3 = v38;
    if (v31)
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v35 = v40;
        uint64_t v36 = v25;
        id v33 = [obj count:v33];
        uint64_t v34 = v41;
        LogPrintF();
      }
      objc_storeStrong(location, v38);
LABEL_81:
      unsigned int v32 = +[RPDaemon sharedDaemon];
      [v32 postDaemonInfoChanges:8];

      [(RPIdentityDaemon *)v37 _postIdentitiesChangedNotification];
      goto LABEL_84;
    }
    if (dword_100141B60 <= 10 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      [obj count:v33];
      LogPrintF();
    }
    objc_storeStrong(location, v38);
  }
  else
  {
    id v4 = 0;
    id v3 = v38;
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v35 = v40;
      uint64_t v36 = v25;
      id v33 = [obj count];
      uint64_t v34 = v41;
      LogPrintF();
    }
    objc_storeStrong(location, v38);
    if (v31) {
      goto LABEL_81;
    }
  }
LABEL_84:
}

- (BOOL)_removeSameAccountIdentityWithIDSIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v31 = 0;
  id v7 = [(RPIdentityDaemon *)self _identitiesOfType:2 error:&v31];
  id v8 = v31;
  if (v8)
  {
    id v9 = v8;
    if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    char v20 = 0;
    BOOL v21 = 0;
    if (a4)
    {
LABEL_27:
      id v9 = v9;
      *a4 = v9;
      BOOL v21 = v20;
    }
  }
  else
  {
    id v24 = v7;
    uint64_t v25 = a4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v17 = [v16 idsDeviceID:v23];
          unsigned int v18 = [v17 isEqualToString:v6];

          if (v18)
          {
            id v26 = v13;
            unsigned __int8 v19 = [(RPIdentityDaemon *)self removeIdentity:v16 error:&v26];
            id v9 = v26;

            if (v19)
            {
              char v20 = 1;
              uint64_t v13 = v10;
              goto LABEL_31;
            }
            if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
            {
              id v23 = v9;
              LogPrintF();
            }
            uint64_t v13 = v9;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }

    if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    RPErrorF();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    char v20 = 0;
LABEL_31:
    id v7 = v24;
    a4 = v25;

    BOOL v21 = v20;
    if (v25) {
      goto LABEL_27;
    }
  }

  return v21;
}

- (void)_loadSelfIdentity:(BOOL)a3
{
  if (a3) {
    goto LABEL_31;
  }
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = objc_alloc_init((Class)CUKeychainItem);
  [v4 setAccessGroup:@"com.apple.rapport"];
  [v4 setIdentifier:@"SelfIdentity"];
  [v4 setSyncType:1];
  [v4 setType:@"RPIdentity-Self"];
  id v5 = objc_alloc_init((Class)CUKeychainManager);
  id v17 = 0;
  id v6 = [v5 copyItemMatchingItem:v4 flags:1 error:&v17];
  id v7 = v17;
  id v8 = v7;
  if (v6)
  {
    id v9 = objc_alloc_init((Class)RPIdentity);
    id v16 = v8;
    [v9 updateWithKeychainItem:v6 error:&v16];
    id v10 = v16;

    if (v10 && dword_100141B60 <= 60 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v15 = v10;
      LogPrintF();
    }
    unsigned int v11 = -[RPIdentityDaemon _updateSelfIdentityPrivate:create:](self, "_updateSelfIdentityPrivate:create:", v9, 0, v15);
    if (v11)
    {

      id v9 = 0;
    }
    else if (!v11)
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v12 = 0;
      goto LABEL_27;
    }
    int v12 = 1;
    goto LABEL_27;
  }
  if ([v7 code] != (id)-25300
    && dword_100141B60 <= 90
    && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v8;
    LogPrintF();
  }
  id v9 = 0;
  int v12 = 0;
  id v10 = v8;
LABEL_27:

  if (!v9)
  {
LABEL_31:
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v9 = objc_alloc_init((Class)RPIdentity);
    [v9 setIdentifier:@"SelfIdentity"];
    [v9 setType:1];
    [(RPIdentityDaemon *)self _updateSelfIdentityPrivate:v9 create:1];
    goto LABEL_36;
  }
  if (v12)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_selfIdentityCache, v9);
    [(RPIdentityDaemon *)self _saveSelfIdentityPrivate:v9];
    [(RPIdentityDaemon *)self _saveSelfIdentityPublicWithPrivateIdentity:v9 force:0];
LABEL_37:
    uint64_t v14 = +[RPDaemon sharedDaemon];
    [v14 postDaemonInfoChanges:4];

    [(RPIdentityDaemon *)self _postIdentitiesChangedNotification];
    [(RPIdentityDaemon *)self _update];
    goto LABEL_38;
  }
  selfIdentityCache = self->_selfIdentityCache;
  objc_storeStrong((id *)&self->_selfIdentityCache, v9);
  [(RPIdentityDaemon *)self _saveSelfIdentityPublicWithPrivateIdentity:v9 force:0];
  if (!selfIdentityCache) {
    goto LABEL_37;
  }
LABEL_38:
}

- (void)_saveSelfIdentityPrivate:(id)a3
{
  id v3 = a3;
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = objc_alloc_init((Class)CUKeychainItem);
  [v4 setAccessGroup:@"com.apple.rapport"];
  [v4 setAccessibleType:6];
  [v4 setInvisible:1];
  [v4 setSyncType:1];
  id v10 = 0;
  unsigned __int8 v5 = [v4 updateWithRPIdentity:v3 revisionUpdate:1 error:&v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    id v7 = objc_alloc_init((Class)CUKeychainManager);
    id v9 = v6;
    [v7 addOrUpdateOrReAddItem:v4 logCategory:&dword_100141B60 logLabel:@"SelfIdentity private" error:&v9];
    id v8 = v9;

    if (v8)
    {
      if (dword_100141B60 > 90 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_21;
      }
    }
    else if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    LogPrintF();
LABEL_21:

    goto LABEL_22;
  }
  if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = v6;
LABEL_22:
}

- (void)_saveSelfIdentityPublicWithPrivateIdentity:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 idsDeviceID];
  if (v7)
  {
    id v8 = objc_alloc_init((Class)CUKeychainItem);
    [v8 setAccessGroup:@"com.apple.rapport"];
    [v8 setIdentifier:v7];
    [v8 setSyncType:2];
    [v8 setType:@"RPIdentity-SameAccountDevice"];
    uint64_t v9 = kSecAttrViewHintHome;
    [v8 setViewHint:kSecAttrViewHintHome];
    id v28 = 0;
    id v24 = objc_alloc_init((Class)CUKeychainManager);
    id v10 = [v24 copyItemMatchingItem:v8 flags:1 error:&v28];
    id v11 = v28;
    int v12 = v11;
    id v23 = v10;
    if (v10)
    {
      id v13 = objc_alloc_init((Class)RPIdentity);
      id v27 = v12;
      [v13 updateWithKeychainItem:v10 error:&v27];
      id v14 = v27;

      if (v14 && dword_100141B60 <= 60 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
      {
        id v20 = v14;
        LogPrintF();
      }
      unsigned int v15 = -[RPIdentityDaemon _updateSelfIdentityPublic:privateIdentity:](self, "_updateSelfIdentityPublic:privateIdentity:", v13, v6, v20);
      if (v15)
      {

        int v12 = v14;
      }
      else
      {
        int v12 = v14;
        if (v13) {
          goto LABEL_26;
        }
      }
    }
    else if ([v11 code] != (id)-25300)
    {
      if (dword_100141B60 > 90)
      {
LABEL_25:
        id v13 = objc_alloc_init((Class)RPIdentity);
        [v13 setIdentifier:v7];
        [v13 setType:2];
        [(RPIdentityDaemon *)self _updateSelfIdentityPublic:v13 privateIdentity:v6];
        unsigned int v15 = 2048;
        id v14 = v12;
LABEL_26:
        id v22 = self;
        if (v4) {
          id v16 = (void *)(v15 | 0x1000);
        }
        else {
          id v16 = (void *)v15;
        }
        if (!v16)
        {
          if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_56;
        }
        id v17 = objc_alloc_init((Class)CUKeychainItem);
        [v17 setAccessGroup:@"com.apple.rapport"];
        [v17 setAccessibleType:2];
        [v17 setInvisible:1];
        [v17 setSyncType:2];
        [v17 setViewHint:v9];
        id v26 = v14;
        unsigned __int8 v18 = [v17 updateWithRPIdentity:v13 revisionUpdate:1 error:&v26];
        id v19 = v26;

        if (v18)
        {
          if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_55;
        }

        id v25 = 0;
        [v24 addOrUpdateOrReAddItem:v17 logCategory:&dword_100141B60 logLabel:@"SelfIdentity public" error:&v25];
        id v19 = v25;
        if (v19)
        {
          if (dword_100141B60 > 90 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_54;
          }
          id v20 = v17;
          BOOL v21 = v19;
        }
        else
        {
          if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_54;
          }
          id v20 = v16;
          BOOL v21 = &unk_10011A6AF;
        }
        LogPrintF();
LABEL_54:
        [(RPIdentityDaemon *)v22 _updateSameAccountIdentities];
LABEL_55:

        id v14 = v19;
LABEL_56:

        goto LABEL_57;
      }
      if (dword_100141B60 != -1 || _LogCategory_Initialize())
      {
        id v20 = v12;
        LogPrintF();
      }
    }
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_25;
  }
  if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_57:
}

- (void)_removeSelfIdentityPublicWithPrivateIdentity:(id)a3
{
  BOOL v4 = [a3 idsDeviceID];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)CUKeychainItem);
    [v5 setAccessGroup:@"com.apple.rapport"];
    [v5 setIdentifier:v4];
    [v5 setSyncType:2];
    [v5 setType:@"RPIdentity-SameAccountDevice"];
    [v5 setViewHint:kSecAttrViewHintHome];
    id v6 = objc_alloc_init((Class)CUKeychainManager);
    id v11 = 0;
    unsigned int v7 = [v6 removeItemMatchingItem:v5 error:&v11];
    id v8 = (char *)v11;
    if ([v8 code] == (id)-25300)
    {
      if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_20;
      }
      uint64_t v9 = "no";
      if (v7) {
        uint64_t v9 = "yes";
      }
      id v10 = v9;
    }
    else
    {
      if (dword_100141B60 > 90 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_20;
      }
      id v10 = v8;
    }
    LogPrintF();
LABEL_20:
    [(RPIdentityDaemon *)self _updateSameAccountIdentities];

    goto LABEL_21;
  }
  if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_21:
}

- (void)_loadTemporarySelfIdentity
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (_os_feature_enabled_impl())
  {
    if (!self->_temporarySelfIdentityCache)
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v3 = (RPIdentity *)[objc_alloc((Class)RPIdentity) initWithType:14];
      temporarySelfIdentityCache = self->_temporarySelfIdentityCache;
      self->_temporarySelfIdentityCache = v3;

      id v5 = [(NSUUID *)self->_adHocPairingIdentifier UUIDString];
      [(RPIdentity *)self->_temporarySelfIdentityCache setIdentifier:v5];
    }
    id v6 = NSRandomData();
    [(RPIdentity *)self->_temporarySelfIdentityCache setDeviceIRKData:v6];

    if ([(NSMutableArray *)self->_adHocPairedDeviceIdentities count])
    {
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
      {
        id v22 = [(NSMutableArray *)self->_adHocPairedDeviceIdentities count];
        LogPrintF();
      }
      adHocPairedDeviceIdentities = self->_adHocPairedDeviceIdentities;
      self->_adHocPairedDeviceIdentities = 0;

      id v8 = +[RPDaemon sharedDaemon];
      [v8 postDaemonInfoChanges:0x4000];
    }
    temporarySelfIdentityTimer = self->_temporarySelfIdentityTimer;
    if (temporarySelfIdentityTimer)
    {
      id v10 = temporarySelfIdentityTimer;
      dispatch_source_cancel(v10);
      id v11 = self->_temporarySelfIdentityTimer;
      self->_temporarySelfIdentityTimer = 0;
    }
    int v12 = +[NSDate date];
    id v13 = +[NSCalendar currentCalendar];
    id v14 = [v13 startOfDayForDate:v12];

    unsigned int v15 = +[NSCalendar currentCalendar];
    id v16 = [v15 dateByAddingUnit:16 value:1 toDate:v14 options:0];

    if (v16)
    {
      id v17 = +[NSCalendar currentCalendar];
      unsigned __int8 v18 = [v17 startOfDayForDate:v16];

      [v18 timeIntervalSinceDate:v12];
    }
    else if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v19 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v20 = self->_temporarySelfIdentityTimer;
    self->_temporarySelfIdentityTimer = v19;
    BOOL v21 = v19;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006EF00;
    handler[3] = &unk_1001219D0;
    handler[4] = v21;
    void handler[5] = self;
    dispatch_source_set_event_handler(v21, handler);
    CUDispatchTimerSetEx();
    dispatch_activate(v21);
    [(RPIdentityDaemon *)self _postIdentitiesChangedNotification];
  }
}

- (BOOL)_stationaryDevice
{
  int DeviceClass = GestaltGetDeviceClass();
  BOOL v3 = sub_10000EABC(DeviceClass);
  BOOL v4 = (void *)GestaltCopyAnswer();
  if ([v4 containsString:@"Mac"]) {
    int v5 = MGGetBoolAnswer() ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  char v6 = v3 | v5;

  return v6;
}

- (unsigned)_updateSelfIdentityPrivate:(id)a3 create:(BOOL)a4
{
  id v5 = a3;
  char v6 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  unsigned int v7 = [v6 localDeviceInfo];
  id v8 = [v7 accountAltDSID];

  if (v8
    && ([v5 accountAltDSID], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    [v5 setAccountAltDSID:v8];
    unsigned int v10 = 0x2000000;
  }
  else
  {
    unsigned int v10 = 0;
  }
  id v11 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  int v12 = [v11 localDeviceInfo];
  id v13 = [v12 accountID];

  if (v13)
  {
    id v14 = [v5 accountID];

    if (!v14)
    {
      [v5 setAccountID:v13];
      v10 |= 0x2000u;
    }
  }
  unsigned int v15 = [v5 idsDeviceID];
  id v16 = +[RPCloudDaemon sharedCloudDaemon];
  id v17 = [v16 idsDeviceIDSelf];

  if (!v17)
  {
LABEL_15:
    id v22 = [v5 deviceIRKData];
    id v23 = [v22 length];

    if (v23 != (id)16)
    {
      id v24 = NSRandomData();
      [v5 setDeviceIRKData:v24];

      v10 |= 4u;
    }
    id v25 = [v5 edPKData];
    if ([v25 length] == (id)32)
    {
      id v26 = [v5 edSKData];
      id v27 = [v26 length];

      if (v27 == (id)32) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    cced25519_make_key_pair_compat();
    id v28 = [objc_alloc((Class)NSData) initWithBytes:v47 length:32];
    [v5 setEdPKData:v28];

    id v29 = [objc_alloc((Class)NSData) initWithBytes:v46 length:32];
    [v5 setEdSKData:v29];

    v10 |= 0x18u;
LABEL_22:
    id v30 = [v5 featureFlags];
    unsigned int DeviceClass = GestaltGetDeviceClass();
    unsigned int v32 = DeviceClass;
    unsigned int v33 = DeviceClass - 1;
    unint64_t v34 = DeviceClass - 1 < 3 || DeviceClass == 100;
    if (DeviceClass <= 6 && ((1 << DeviceClass) & 0x4E) != 0 || DeviceClass == 100) {
      v34 |= 2uLL;
    }
    int v35 = _os_feature_enabled_impl();
    if (v33 < 3 || v32 == 100 && v35)
    {
      int v36 = _os_feature_enabled_impl();
      uint64_t v37 = 8;
      if (v36) {
        uint64_t v37 = 24;
      }
      v34 |= v37;
    }
    if (v34 && (id)v34 != v30)
    {
      [v5 setFeatureFlags:v34];
      v10 |= 0x400u;
    }
    if ([(RPIdentityDaemon *)self _stationaryDevice])
    {
      unsigned int v38 = [v5 btIRKData];
      if ([v38 length] == (id)16)
      {
        long long v39 = [v5 btAddress];
        id v40 = [v39 length];

        if (v40 == (id)7) {
          goto LABEL_41;
        }
      }
      else
      {
      }
      uint64_t v41 = [(CBPeripheralManager *)self->_peripheralManager getNonConnectableIdentity];
      uint64_t v42 = [v41 objectForKeyedSubscript:@"kCBMsgArgIdentityIRK"];
      [v5 setBtIRKData:v42];

      long long v43 = [v41 objectForKeyedSubscript:@"kCBMsgArgIdentityAddress"];
      [v5 setBtAddress:v43];

      v10 |= 0xC00000u;
LABEL_45:
      if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_57;
    }
LABEL_41:
    if (!v10) {
      goto LABEL_57;
    }
    goto LABEL_45;
  }
  id v18 = v17;
  id v19 = v15;
  id v20 = v19;
  if (v18 == v19)
  {

    goto LABEL_15;
  }
  if (v19)
  {
    unsigned __int8 v21 = [v18 isEqual:v19];

    if (v21) {
      goto LABEL_15;
    }
    if (a4) {
      goto LABEL_13;
    }
  }
  else
  {

    if (a4)
    {
LABEL_13:
      [v5 setIdsDeviceID:v18];
      v10 |= 0x40u;
      goto LABEL_15;
    }
  }
  if (dword_100141B60 <= 60 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned int v10 = 1;
LABEL_57:

  return v10;
}

- (unsigned)_updateSelfIdentityPublic:(id)a3 privateIdentity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  id v8 = [v7 localDeviceInfo];

  uint64_t v9 = [v8 accountAltDSID];
  if (v9
    && ([v5 accountAltDSID], unsigned int v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    [v5 setAccountAltDSID:v9];
    unsigned int v11 = 0x2000000;
  }
  else
  {
    unsigned int v11 = 0;
  }
  long long v64 = [v8 accountID];
  if (v64)
  {
    int v12 = [v5 accountID];

    if (!v12)
    {
      [v5 setAccountID:v64];
      v11 |= 0x2000u;
    }
  }
  id v13 = [v6 deviceIRKData];
  if (v13)
  {
    id v14 = [v5 deviceIRKData];
    id v15 = v13;
    id v16 = v15;
    if (v14 == v15)
    {

      goto LABEL_16;
    }
    if (v14)
    {
      unsigned __int8 v17 = [v14 isEqual:v15];

      if (v17) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    [v5 setDeviceIRKData:v16];
    v11 |= 4u;
  }
LABEL_16:
  id v18 = [v6 edPKData];
  if (v18)
  {
    id v19 = [v5 edPKData];
    id v20 = v18;
    unsigned __int8 v21 = v20;
    if (v19 == v20)
    {
    }
    else
    {
      if (v19)
      {
        unsigned __int8 v22 = [v19 isEqual:v20];

        if (v22) {
          goto LABEL_24;
        }
      }
      else
      {
      }
      [v5 setEdPKData:v21];
      v11 |= 8u;
    }
  }
LABEL_24:
  id v23 = [v6 featureFlags];
  if (v23)
  {
    id v24 = v23;
    if ([v5 featureFlags] != v23)
    {
      [v5 setFeatureFlags:v24];
      v11 |= 0x400u;
    }
  }
  id v25 = [v8 mediaRemoteIdentifier];
  long long v66 = v25;
  if ([v25 length])
  {
    id v26 = [v5 mediaRemoteID];
    id v27 = v25;
    id v28 = v27;
    if (v26 == v27)
    {

      goto LABEL_36;
    }
    if ((v27 != 0) == (v26 == 0))
    {
    }
    else
    {
      unsigned __int8 v29 = [v26 isEqual:v27];

      if (v29) {
        goto LABEL_35;
      }
    }
    [v5 setMediaRemoteID:v28];
    v11 |= 0x10000u;
LABEL_35:
    id v25 = v66;
  }
LABEL_36:
  id v30 = [v8 mediaRouteIdentifier];
  long long v65 = v30;
  if (![v30 length]) {
    goto LABEL_46;
  }
  id v31 = [v5 mediaRouteID];
  id v32 = v30;
  unsigned int v33 = v32;
  if (v31 != v32)
  {
    if ((v32 != 0) == (v31 == 0))
    {
    }
    else
    {
      unsigned __int8 v34 = [v31 isEqual:v32];

      if (v34) {
        goto LABEL_44;
      }
    }
    [v5 setMediaRouteID:v33];
    v11 |= 0x20000u;
LABEL_44:
    id v25 = v66;
    goto LABEL_45;
  }

LABEL_45:
  id v30 = v65;
LABEL_46:
  uint64_t v35 = GestaltCopyAnswer();
  id v63 = v13;
  id v61 = (void *)v35;
  if (!v35) {
    goto LABEL_55;
  }
  int v36 = (void *)v35;
  id v37 = [v5 model];
  id v38 = v36;
  long long v39 = v38;
  if (v37 == v38)
  {

    goto LABEL_55;
  }
  if (v37)
  {
    unsigned __int8 v40 = [v37 isEqual:v38];

    if (v40) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  [v5 setModel:v39];
  v11 |= 0x80u;
LABEL_54:
  id v25 = v66;
LABEL_55:
  uint64_t v41 = (void *)GestaltCopyAnswer();
  id v62 = v18;
  if (!v41) {
    goto LABEL_64;
  }
  id v42 = [v5 name];
  id v43 = v41;
  long long v44 = v43;
  if (v42 == v43)
  {

    goto LABEL_64;
  }
  if (v42)
  {
    unsigned __int8 v45 = [v42 isEqual:v43];

    if (v45) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  [v5 setName:v44];
  v11 |= 0x100u;
LABEL_63:
  id v25 = v66;
LABEL_64:
  long long v46 = [v6 btIRKData];
  if (!v46) {
    goto LABEL_74;
  }
  unsigned int v47 = v11;
  id v48 = [v5 btIRKData];
  id v49 = v46;
  long long v50 = v49;
  if (v48 != v49)
  {
    if (v48)
    {
      unsigned __int8 v51 = [v48 isEqual:v49];

      if (v51)
      {
        unsigned int v11 = v47;
LABEL_72:
        id v25 = v66;
        goto LABEL_73;
      }
    }
    else
    {
    }
    [v5 setBtIRKData:v50];
    unsigned int v11 = v47 | 0x400000;
    goto LABEL_72;
  }

  unsigned int v11 = v47;
LABEL_73:
  id v30 = v65;
LABEL_74:
  long long v52 = [v6 btAddress];
  if (v52)
  {
    unsigned int v53 = v11;
    id v54 = [v5 btAddress];
    id v55 = v52;
    long long v56 = v55;
    if (v54 != v55)
    {
      id v60 = v9;
      id v57 = v6;
      if (v54)
      {
        unsigned __int8 v58 = [v54 isEqual:v55];

        id v25 = v66;
        if (v58)
        {
          id v6 = v57;
          uint64_t v9 = v60;
          unsigned int v11 = v53;
LABEL_82:
          id v30 = v65;
          goto LABEL_83;
        }
      }
      else
      {

        id v25 = v66;
      }
      [v5 setBtAddress:v56];
      unsigned int v11 = v53 | 0x800000;
      id v6 = v57;
      uint64_t v9 = v60;
      goto LABEL_82;
    }

    unsigned int v11 = v53;
    id v25 = v66;
    goto LABEL_82;
  }
LABEL_83:

  return v11;
}

- (void)_enumerateIdentitiesWithFlag:(unsigned int)a3 usingBlock:(id)a4
{
  __int16 v4 = a3;
  id v6 = (void (**)(id, void, char *))a4;
  char v72 = 0;
  if ((v4 & 2) != 0)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    unsigned int v7 = self->_sameAccountDeviceIdentities;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v69;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v68 + 1) + 8 * v11), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v68 objects:v80 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  if ((v4 & 0x100) != 0)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    unsigned int v7 = [(RPIdentityDaemon *)self identitiesOfType:9 error:0];
    id v12 = [(NSArray *)v7 countByEnumeratingWithState:&v64 objects:v79 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v65;
LABEL_14:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v64 + 1) + 8 * v15), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [(NSArray *)v7 countByEnumeratingWithState:&v64 objects:v79 count:16];
          if (v13) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }
  if ((v4 & 8) != 0)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    unsigned int v7 = [(RPIdentityDaemon *)self identitiesOfType:4 error:0];
    id v16 = [(NSArray *)v7 countByEnumeratingWithState:&v60 objects:v78 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v61;
LABEL_24:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v61 != v18) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v60 + 1) + 8 * v19), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v17 == (id)++v19)
        {
          id v17 = [(NSArray *)v7 countByEnumeratingWithState:&v60 objects:v78 count:16];
          if (v17) {
            goto LABEL_24;
          }
          break;
        }
      }
    }
  }
  if ((v4 & 0x20) != 0)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    unsigned int v7 = [(RPIdentityDaemon *)self identitiesOfType:6 error:0];
    id v20 = [(NSArray *)v7 countByEnumeratingWithState:&v56 objects:v77 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v57;
LABEL_34:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v57 != v22) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v56 + 1) + 8 * v23), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v21 == (id)++v23)
        {
          id v21 = [(NSArray *)v7 countByEnumeratingWithState:&v56 objects:v77 count:16];
          if (v21) {
            goto LABEL_34;
          }
          break;
        }
      }
    }
  }
  if ((v4 & 0x400) != 0)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    unsigned int v7 = [(RPIdentityDaemon *)self identitiesOfType:12 error:0];
    id v24 = [(NSArray *)v7 countByEnumeratingWithState:&v52 objects:v76 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v53;
LABEL_44:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v52 + 1) + 8 * v27), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v25 == (id)++v27)
        {
          id v25 = [(NSArray *)v7 countByEnumeratingWithState:&v52 objects:v76 count:16];
          if (v25) {
            goto LABEL_44;
          }
          break;
        }
      }
    }
  }
  if ((v4 & 0x80) != 0)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    unsigned int v7 = [(RPIdentityDaemon *)self identitiesOfType:8 error:0];
    id v28 = [(NSArray *)v7 countByEnumeratingWithState:&v48 objects:v75 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v49;
LABEL_54:
      uint64_t v31 = 0;
      while (1)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v48 + 1) + 8 * v31), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v29 == (id)++v31)
        {
          id v29 = [(NSArray *)v7 countByEnumeratingWithState:&v48 objects:v75 count:16];
          if (v29) {
            goto LABEL_54;
          }
          break;
        }
      }
    }
  }
  if ((v4 & 0x800) != 0)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    unsigned int v7 = [(RPIdentityDaemon *)self identitiesOfType:13 error:0];
    id v32 = [(NSArray *)v7 countByEnumeratingWithState:&v44 objects:v74 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v45;
LABEL_64:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v44 + 1) + 8 * v35), &v72);
        if (v72) {
          goto LABEL_80;
        }
        if (v33 == (id)++v35)
        {
          id v33 = [(NSArray *)v7 countByEnumeratingWithState:&v44 objects:v74 count:16];
          if (v33) {
            goto LABEL_64;
          }
          break;
        }
      }
    }
  }
  if ((v4 & 0x4000) != 0)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    -[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15, 0, 0);
    unsigned int v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v36 = [(NSArray *)v7 countByEnumeratingWithState:&v40 objects:v73 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v41;
LABEL_74:
      uint64_t v39 = 0;
      while (1)
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v40 + 1) + 8 * v39), &v72);
        if (v72) {
          break;
        }
        if (v37 == (id)++v39)
        {
          id v37 = [(NSArray *)v7 countByEnumeratingWithState:&v40 objects:v73 count:16];
          if (v37) {
            goto LABEL_74;
          }
          break;
        }
      }
    }
LABEL_80:
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPIdentity)homeKitIdentity
{
  return self->_homeKitIdentity;
}

- (NSUUID)sessionPairingIdentifier
{
  return self->_sessionPairingIdentifier;
}

- (NSUUID)adHocPairingIdentifier
{
  return self->_adHocPairingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adHocPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitIdentity, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_temporarySelfIdentityTimer, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_adHocPairedDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_sessionPairedDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_sharedTVUserDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_sharedHomeExtraDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_sharedHomeDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_temporarySelfIdentityCache, 0);
  objc_storeStrong((id *)&self->_selfIdentityCache, 0);
  objc_storeStrong((id *)&self->_sameAccountDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_pairedDeviceIdentities, 0);

  objc_storeStrong((id *)&self->_identitiesChangedCoalescer, 0);
}

@end