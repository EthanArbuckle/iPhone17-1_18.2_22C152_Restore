@interface SOSAccountTrustClassic
+ (id)trustClassic;
- (BOOL)activeValidInCircle:(id)a3 err:(__CFError *)a4;
- (BOOL)addEscrowToPeerInfo:(__OpaqueSOSFullPeerInfo *)a3 err:(__CFError *)a4;
- (BOOL)addiCloudIdentity:(__OpaqueSOSCircle *)a3 key:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)checkForRings:(__CFError *)a3;
- (BOOL)checkForSponsorshipTrust:(__OpaqueSOSCircle *)a3;
- (BOOL)cleanupAfterPeer:(id)a3 circleTransport:(id)a4 seconds:(unint64_t)a5 circle:(__OpaqueSOSCircle *)a6 cleanupPeer:(__OpaqueSOSPeerInfo *)a7 err:(__CFError *)a8;
- (BOOL)cleanupRetirementTickets:(id)a3 circle:(__OpaqueSOSCircle *)a4 time:(unint64_t)a5 err:(__CFError *)a6;
- (BOOL)clearValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4;
- (BOOL)clientPing:(id)a3;
- (BOOL)ensureExpansion:(__CFError *)a3;
- (BOOL)ensureFullPeerAvailable:(id)a3 err:(__CFError *)a4;
- (BOOL)fixICloudIdentities:(id)a3 circle:(__OpaqueSOSCircle *)a4;
- (BOOL)forEachRing:(id)a3;
- (BOOL)fullPeerInfoVerify:(__SecKey *)a3 err:(__CFError *)a4;
- (BOOL)ghostBustingOK:(__OpaqueSOSCircle *)a3 updatingTo:(__OpaqueSOSCircle *)a4;
- (BOOL)handleUpdateCircle:(__OpaqueSOSCircle *)a3 transport:(id)a4 update:(BOOL)a5 err:(__CFError *)a6;
- (BOOL)handleUpdateRing:(id)a3 prospectiveRing:(__OpaqueSOSRing *)a4 transport:(id)a5 userPublicKey:(__SecKey *)a6 writeUpdate:(BOOL)a7 err:(__CFError *)a8;
- (BOOL)hasCircle:(__CFError *)a3;
- (BOOL)hasFullPeerInfo:(__CFError *)a3;
- (BOOL)hasLeft;
- (BOOL)haveConfirmedOctagonKeys;
- (BOOL)isAccountIdentity:(__OpaqueSOSPeerInfo *)a3 err:(__CFError *)a4;
- (BOOL)isInCircleOnly:(__CFError *)a3;
- (BOOL)isLockedError:(id)a3;
- (BOOL)isMyPeerActive:(__CFError *)a3;
- (BOOL)isSyncingV0;
- (BOOL)joinCircle:(id)a3 userKey:(__SecKey *)a4 useCloudPeer:(BOOL)a5 err:(__CFError *)a6;
- (BOOL)leaveCircle:(id)a3 err:(__CFError *)a4;
- (BOOL)leaveCircleWithAccount:(id)a3 err:(__CFError *)a4;
- (BOOL)matchOTUserViewSettings:(id)a3 userViewsEnabled:(BOOL)a4 err:(__CFError *)a5;
- (BOOL)modifyCircle:(id)a3 err:(__CFError *)a4 action:(id)a5;
- (BOOL)peerSignatureUpdate:(__SecKey *)a3 err:(__CFError *)a4;
- (BOOL)postDebugScope:(id)a3 scope:(void *)a4 err:(__CFError *)a5;
- (BOOL)removeIncompleteiCloudIdentities:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)requestSyncWithAllPeers:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)resetAccountToEmpty:(id)a3 transport:(id)a4 err:(__CFError *)a5;
- (BOOL)resetAllRings:(id)a3 err:(__CFError *)a4;
- (BOOL)resetCircleToOffering:(id)a3 userKey:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)resetRing:(id)a3 ringName:(__CFString *)a4 err:(__CFError *)a5;
- (BOOL)resetToOffering:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)setRing:(__OpaqueSOSRing *)a3 ringName:(__CFString *)a4 err:(__CFError *)a5;
- (BOOL)setValueInExpansion:(__CFString *)a3 value:(void *)a4 err:(__CFError *)a5;
- (BOOL)updateCircle:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5;
- (BOOL)updateCircleFromRemote:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5;
- (BOOL)updateFullPeerInfo:(id)a3 minimum:(__CFSet *)a4 excluded:(__CFSet *)a5;
- (BOOL)updateGestalt:(id)a3 newGestalt:(__CFDictionary *)a4;
- (BOOL)updatePeerInfo:(id)a3 description:(__CFString *)a4 err:(__CFError *)a5 update:(id)a6;
- (BOOL)updateV2Dictionary:(id)a3 v2:(__CFDictionary *)a4;
- (BOOL)updateViewSets:(id)a3 enabled:(__CFSet *)MutableCopy disabled:(__CFSet *)a5;
- (BOOL)upgradeiCloudIdentity:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4;
- (BOOL)valueSetContainsValue:(__CFString *)a3 value:(void *)a4;
- (SOSAccountTrustClassic)init;
- (SOSAccountTrustClassic)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7;
- (__CFArray)copyPeersToListenTo:(__SecKey *)a3 err:(__CFError *)a4;
- (__CFArray)copySortedPeerArray:(__CFError *)a3 action:(id)a4;
- (__CFDictionary)getRings:(__CFError *)a3;
- (__CFSet)copyPeerSetForView:(__CFString *)a3;
- (__CFSet)copyPeerSetMatching:(id)a3;
- (__CFSet)copyPreApprovedHSA2Info;
- (__CFSet)syncWithPeers:(id)a3 peerIDs:(__CFSet *)a4 err:(__CFError *)a5;
- (__OpaqueSOSCircle)ensureCircle:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5;
- (__OpaqueSOSCircle)getCircle:(__CFError *)a3;
- (__OpaqueSOSEngine)getDataSourceEngine:(SOSDataSourceFactory *)a3;
- (__OpaqueSOSFullPeerInfo)CopyAccountIdentityPeerInfo;
- (__OpaqueSOSFullPeerInfo)getMyFullPeerInfo;
- (__OpaqueSOSPeerInfo)copyPeerWithID:(__CFString *)a3 err:(__CFError *)a4;
- (__OpaqueSOSRing)copyRing:(__CFString *)a3 err:(__CFError *)a4;
- (__SecKey)copyDeviceKey:(__CFError *)a3;
- (__SecKey)copyPublicKeyForPeer:(__CFString *)a3 err:(__CFError *)a4;
- (__SecKey)randomPermanentFullECKey:(int)a3 name:(id)a4 error:(__CFError *)a5;
- (char)encodeToDER:(id)a3 err:(id *)a4 start:(const char *)a5 end:(char *)a6;
- (id)iCloudCheckEventHandle:(id)a3;
- (id)iCloudCleanerHandle:(id)a3;
- (int)getCircleStatusOnly:(__CFError *)a3;
- (int)thisDeviceStatusInCircle:(__OpaqueSOSCircle *)a3 peer:(__OpaqueSOSPeerInfo *)a4;
- (int)updateView:(id)a3 name:(__CFString *)a4 code:(int)a5 err:(__CFError *)a6;
- (int)viewStatus:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5;
- (unint64_t)getDEREncodedSize:(id)a3 err:(id *)a4;
- (void)addRingDictionary;
- (void)addSyncablePeerBlock:(id)a3 dsName:(__CFString *)a4 change:(id)a5;
- (void)ensureOctagonPeerKeys:(id)a3;
- (void)forEachCirclePeerExceptMe:(id)a3;
- (void)generationSignatureUpdateWith:(id)a3 key:(__SecKey *)a4;
- (void)getValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4;
- (void)pendEnableViewSet:(__CFSet *)a3;
- (void)purgeIdentity;
- (void)removeInvalidApplications:(__OpaqueSOSCircle *)a3 userPublic:(__SecKey *)a4;
- (void)resetRingDictionary;
- (void)setRings:(__CFDictionary *)a3;
- (void)valueSubtractFrom:(__CFString *)a3 valuesToSubtract:(__CFSet *)a4;
- (void)valueUnionWith:(__CFString *)a3 valuesToUnion:(__CFSet *)a4;
@end

@implementation SOSAccountTrustClassic

- (BOOL)cleanupAfterPeer:(id)a3 circleTransport:(id)a4 seconds:(unint64_t)a5 circle:(__OpaqueSOSCircle *)a6 cleanupPeer:(__OpaqueSOSPeerInfo *)a7 err:(__CFError *)a8
{
  id v10 = a3;
  id v11 = a4;
  v12 = [(SOSAccountTrust *)self peerInfo];
  if (![(SOSAccountTrust *)self fullPeerInfo] || !v12)
  {
    SOSErrorCreate();
    goto LABEL_27;
  }
  [(SOSAccountTrust *)self peerInfo];
  if (!SOSCircleHasActivePeer())
  {
LABEL_27:
    BOOL v22 = 1;
    goto LABEL_25;
  }
  PeerID = (const void *)SOSPeerInfoGetPeerID();
  Name = (const void *)SOSCircleGetName();
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  Value = (__CFArray *)CFDictionaryGetValue(Mutable, Name);
  if (!Value || (CFMutableArrayRef v17 = Value, v18 = CFGetTypeID(Value), v18 != CFArrayGetTypeID()))
  {
    CFMutableArrayRef v17 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFDictionarySetValue(Mutable, Name, v17);
    if (v17) {
      CFRelease(v17);
    }
  }
  CFArrayAppendValue(v17, PeerID);
  CFTypeRef cf = 0;
  unsigned int v19 = [v10 SOSTransportMessageCleanupAfterPeerMessages:v10 peers:Mutable err:&cf];
  if ((v19 & 1) == 0)
  {
    v20 = sub_10000B070("account");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = PeerID;
      __int16 v29 = 2112;
      CFTypeRef v30 = cf;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to cleanup after peer %@ messages: %@", buf, 0x16u);
    }
  }
  CFTypeRef v21 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v21);
  }
  if ((v19 & SOSPeerInfoRetireRetirementTicket()) != 1) {
    goto LABEL_20;
  }
  if (([v11 expireRetirementRecords:Mutable err:&cf] & 1) == 0)
  {
    v23 = sub_10000B070("account");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = PeerID;
      __int16 v29 = 2112;
      CFTypeRef v30 = cf;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to cleanup after peer %@ retirement: %@", buf, 0x16u);
    }

LABEL_20:
    BOOL v22 = 0;
    goto LABEL_21;
  }
  BOOL v22 = 1;
LABEL_21:
  CFTypeRef v24 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v24);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
LABEL_25:

  return v22;
}

- (BOOL)cleanupRetirementTickets:(id)a3 circle:(__OpaqueSOSCircle *)a4 time:(unint64_t)a5 err:(__CFError *)a6
{
  id v10 = a3;
  CFSetRef MutableForSOSPeerInfosByID = (const __CFSet *)CFSetCreateMutableForSOSPeerInfosByID();
  CFSetRef v12 = [(SOSAccountTrust *)self retirees];
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_1001F05A0;
  context[3] = &unk_100307BA8;
  context[4] = a5;
  context[5] = a4;
  context[6] = MutableForSOSPeerInfosByID;
  CFSetApplyFunction(v12, (CFSetApplierFunction)sub_1001F067C, context);

  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001F061C;
  v26[3] = &unk_100307F98;
  v26[4] = self;
  v26[5] = Mutable;
  CFSetApplyFunction(MutableForSOSPeerInfosByID, (CFSetApplierFunction)sub_1001F067C, v26);
  if (MutableForSOSPeerInfosByID) {
    CFRelease(MutableForSOSPeerInfosByID);
  }
  uint64_t Name = SOSCircleGetName();
  CFDictionaryRef v22 = sub_100139704(kCFAllocatorDefault, v15, v16, v17, v18, v19, v20, v21, Name, (uint64_t)Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  v23 = [v10 circle_transport];
  unsigned __int8 v24 = [v23 expireRetirementRecords:v22 err:a6];

  if (v22) {
    CFRelease(v22);
  }

  return v24;
}

- (BOOL)resetRing:(id)a3 ringName:(__CFString *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  v9 = [(SOSAccountTrustClassic *)self copyRing:a4 err:a5];
  unsigned int v10 = sub_10022F62C(v9);
  uint64_t v11 = sub_100201E3C((uint64_t)a4, 0, v10, (uint64_t)a5);
  if (v11)
  {
    CFDictionaryGetValue(v9->var2, @"Generation");
    CFSetRef v12 = (const void *)SOSGenerationCreateWithBaseline();
    if (v12)
    {
      v13 = v12;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v11 + 24), @"Generation", v12);
      CFRelease(v13);
    }
  }
  v14 = [(SOSAccountTrust *)self fullPeerInfo];
  int v15 = sub_10022F800((uint64_t)v9);
  sub_1001EBEAC(v11, (uint64_t)v14, v15, (CFTypeRef *)a5);
  if (v11)
  {
    if (v9) {
      CFRelease(v9);
    }
    id v16 = v8;
    if (sub_1001EEC4C(v16))
    {
      int v17 = [v16 trust];
      int v18 = [v16 circle_transport];
      unsigned __int8 v19 = [v17 handleUpdateRing:v16 prospectiveRing:v11 transport:v18 userPublicKey:[v16 accountKey] writeUpdate:1 err:a5];
    }
    else
    {
      unsigned __int8 v19 = 0;
    }

    v9 = (__OpaqueSOSRing *)v11;
  }
  else
  {
    unsigned __int8 v19 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }
  CFRelease(v9);
  LOBYTE(v11) = v19;
LABEL_11:

  return v11;
}

- (__CFDictionary)getRings:(__CFError *)a3
{
  v5 = [(SOSAccountTrust *)self expansion];
  v6 = (__CFDictionary *)[v5 objectForKey:@"trusted_rings"];

  if (v6) {
    return v6;
  }
  [(SOSAccountTrustClassic *)self addRingDictionary];

  return [(SOSAccountTrustClassic *)self getRings:a3];
}

- (__OpaqueSOSRing)copyRing:(__CFString *)a3 err:(__CFError *)a4
{
  v5 = [(SOSAccountTrustClassic *)self getRings:a4];
  if (!v5)
  {
    SOSCreateError();
    return 0;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v5, a3);
  if (!Value)
  {
    SOSCreateErrorWithFormat();
    return 0;
  }

  return (__OpaqueSOSRing *)sub_1001FF110(0, Value);
}

- (BOOL)handleUpdateRing:(id)a3 prospectiveRing:(__OpaqueSOSRing *)a4 transport:(id)a5 userPublicKey:(__SecKey *)a6 writeUpdate:(BOOL)a7 err:(__CFError *)a8
{
  BOOL v9 = a7;
  id v120 = a3;
  id v119 = a5;
  if (v9) {
    v14 = "local";
  }
  else {
    v14 = "remote";
  }
  int v15 = sub_10022F62C(a4);
  int v16 = sub_10022F62C(a4);
  if (v15 != 1 && v16 != 5)
  {
    int v17 = sub_10000B070("ring");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "start:[%s] halt processing invalid ring", buf, 0xCu);
    }

    BOOL v18 = 0;
    goto LABEL_244;
  }
  int v106 = v16;
  char v113 = v9;
  v117 = (uint64_t *)a8;
  unsigned __int8 v19 = [(SOSAccountTrust *)self fullPeerInfo];
  uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo();
  uint64_t PeerID = SOSPeerInfoGetPeerID();
  CFTypeRef v114 = (CFTypeRef)SOSFullPeerInfoCopyDeviceKey();
  v116 = (__SecKey *)SOSFullPeerInfoCopyPubKey();
  unsigned int v22 = 0;
  v107 = v14;
  uint64_t v108 = PeerInfo;
  if (v19 && PeerInfo && PeerID) {
    unsigned int v22 = [(SOSAccountTrustClassic *)self isInCircleOnly:0];
  }
  v111 = sub_10022F02C(a4->var2);
  [(SOSAccountTrust *)self trustedCircle];
  CFTypeRef v109 = (CFTypeRef)SOSCircleCopyPeers();
  CFMutableSetRef cf = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  uint64_t MutableForSOSPeerInfosByID = CFSetCreateMutableForSOSPeerInfosByID();
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a4->var1, @"LastModifier");
  CFStringRef cf1 = (const __CFString *)PeerID;
  CFTypeRef v112 = (CFTypeRef)MutableForSOSPeerInfosByID;
  if (Value)
  {
    CFStringRef v25 = Value;
    if (CFStringGetLength(Value) > 8)
    {
      v129.location = 0;
      v129.length = 8;
      CFStringRef Copy = CFStringCreateWithSubstring(kCFAllocatorDefault, v25, v129);
    }
    else
    {
      CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, v25);
    }
    CFStringRef v27 = Copy;
  }
  else
  {
    CFStringRef v27 = 0;
  }
  v28 = sub_10000B070("ring");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v107;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "start:[%s] modifier: %@", buf, 0x16u);
  }

  if (v27) {
    CFRelease(v27);
  }
  v118 = [(SOSAccountTrustClassic *)self copyRing:v111 err:0];
  if (v113) {
    goto LABEL_36;
  }
  CFStringRef v29 = (const __CFString *)CFDictionaryGetValue(a4->var1, @"LastModifier");
  if (cf1 && v29)
  {
    if (!CFEqual(cf1, v29)) {
      goto LABEL_36;
    }
  }
  else if (cf1 != v29)
  {
    goto LABEL_36;
  }
  if (a4 && v118)
  {
    if (CFEqual(v118, a4))
    {
LABEL_32:
      CFTypeRef v30 = sub_10000B070("ring");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Ceasing ring handling for an echo of our own posted ring", buf, 2u);
      }

      goto LABEL_56;
    }
  }
  else if (v118 == a4)
  {
    goto LABEL_32;
  }
LABEL_36:
  if (!sub_1001EEC4C(v120)) {
    goto LABEL_268;
  }
  if (!v116 || !v114 || !a4->var1 || !a4->var2 || !a4->var3 || !a4->var4)
  {
    SOSCreateError();
    goto LABEL_268;
  }
  if (![(SOSAccountTrustClassic *)self checkForRings:v117])
  {
LABEL_268:
    uint64_t Instance = 0;
    BOOL v18 = 0;
    goto LABEL_230;
  }
  if (v15 != 1)
  {
    uint64_t Instance = 0;
    if (v22) {
      goto LABEL_54;
    }
LABEL_57:
    BOOL v18 = 1;
    goto LABEL_230;
  }
  CFTypeRef v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  uint64_t v124 = 0;
  CFSetRef v31 = (const __CFSet *)sub_1002020D4(a4);
  CFSetRef v32 = v31;
  if (v31)
  {
    if (CFSetGetCount(v31) == 1)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100202144;
      v126 = (const char *)&unk_1003087F0;
      v127 = &v121;
      uint64_t v128 = 0;
      CFSetApplyFunction(v32, (CFSetApplierFunction)sub_1002021C4, buf);
    }
  }
  else
  {
    SOSCreateError();
  }
  CFTypeRef v34 = v122[3];
  _Block_object_dispose(&v121, 8);
  if (!v34 || !SOSPeerInfoIsViewPermitted() || (v22 & SOSPeerInfoHasBackupKey() & 1) == 0)
  {
LABEL_56:
    uint64_t Instance = 0;
    goto LABEL_57;
  }
LABEL_54:
  sub_10022E9CC();
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(void *)(Instance + 16) = CFDictionaryCreateMutableCopy(0, 0, a4->var1);
  *(void *)(Instance + 24) = CFDictionaryCreateMutableCopy(0, 0, a4->var2);
  *(void *)(Instance + 32) = CFDictionaryCreateMutableCopy(0, 0, a4->var3);
  *(void *)(Instance + 40) = CFDictionaryCreateMutableCopy(0, 0, a4->var4);
  v35 = v118;
  if (v118)
  {
    BOOL v105 = !sub_1002301F0((uint64_t)v118, v116, 0);
  }
  else
  {
    CFRetain((CFTypeRef)Instance);
    BOOL v105 = 1;
    v35 = (__OpaqueSOSRing *)Instance;
  }
  sub_1001EE2BC(v35);
  sub_1001EE2BC((void *)Instance);
  v118 = v35;
  unsigned int v36 = sub_10022F62C(v35);
  unsigned int v37 = sub_10022F62C((void *)Instance);
  if (v36 > 5) {
    goto LABEL_90;
  }
  uint64_t v38 = v36;
  if ((unint64_t)v36 - 5 > 0xFFFFFFFFFFFFFFFCLL
    || v37 > 5
    || (unint64_t)v37 - 5 > 0xFFFFFFFFFFFFFFFCLL
    || v36 != v37)
  {
    goto LABEL_90;
  }
  v39 = sub_10000B070("ring");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = (uint64_t)*off_100308578[v38];
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "concordance trust (%s)", buf, 0xCu);
  }

  v41 = sub_10000B070("ring");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v118;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "    knownRing: %@", buf, 0xCu);
  }

  v42 = sub_10000B070("ring");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = Instance;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, " proposedRing: %@", buf, 0xCu);
  }

  v43 = (const void *)SOSCopyIDOfKeyWithLength();
  v44 = (const void *)SOSCopyIDOfKeyWithLength();
  if (cf1)
  {
    if (CFStringGetLength(cf1) > 8)
    {
      v130.location = 0;
      v130.length = 8;
      CFStringRef v45 = CFStringCreateWithSubstring(kCFAllocatorDefault, cf1, v130);
    }
    else
    {
      CFStringRef v45 = CFStringCreateCopy(kCFAllocatorDefault, cf1);
    }
    CFStringRef v46 = v45;
  }
  else
  {
    CFStringRef v46 = 0;
  }
  v47 = sub_10000B070("ring");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v43;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v44;
    *(_WORD *)&buf[22] = 2112;
    v126 = (const char *)v46;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "knownkey: %@ userkey: %@ myPeerID: %@", buf, 0x20u);
  }

  if (v43) {
    CFRelease(v43);
  }
  if (v44) {
    CFRelease(v44);
  }
  if (v46) {
    CFRelease(v46);
  }
  v48 = off_100308578[v38][10];
  if (v48)
  {
    CFStringRef v49 = @"Trusted";
    int v50 = 1;
    switch(((unsigned int (*)(__OpaqueSOSFullPeerInfo *, CFTypeRef, __OpaqueSOSRing *, uint64_t, __SecKey *, __SecKey *, const __CFString *, uint64_t *))v48)(v19, v109, v118, Instance, a6, a6, cf1, v117))
    {
      case 0u:
        break;
      case 1u:
        if (v105) {
          int v50 = 5;
        }
        else {
          int v50 = 3;
        }
        CFStringRef v49 = @"Generation Old";
        break;
      case 2u:
        if (v105) {
          int v50 = 0;
        }
        else {
          int v50 = 3;
        }
        CFStringRef v49 = @"No User Signature";
        break;
      case 3u:
        v103 = sub_10000B070("SecError");
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "##### No User Public Key Available, this shouldn't ever happen!!!", buf, 2u);
        }

        CFStringRef v49 = @"No User Public Key Available";
        goto LABEL_93;
      case 4u:
        CFStringRef v49 = @"No trusted peer left";
        goto LABEL_266;
      case 5u:
      case 6u:
        if (v105) {
          int v50 = 0;
        }
        else {
          int v50 = 3;
        }
        CFStringRef v49 = @"Bad Signature";
        break;
      case 7u:
        v104 = sub_10000B070("signing");
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "##### No trusted peer signature found, accepting hoping for concordance later", buf, 2u);
        }

        int v50 = 0;
        CFStringRef v49 = @"No trusted peer signature";
        break;
      case 9u:
        if (v105) {
          int v50 = 5;
        }
        else {
          int v50 = 3;
        }
        CFStringRef v49 = @"Invalid Ring Membership";
        break;
      case 0xAu:
        CFStringRef v49 = @"Incorrect membership for me";
        int v50 = 4;
        break;
      case 0xBu:
        CFStringRef v49 = @"This peer shouldn't be in this ring since it isn't in view";
LABEL_266:
        int v50 = 2;
        break;
      default:
        goto LABEL_90;
    }
  }
  else
  {
LABEL_90:
    v51 = sub_10000B070("SecError");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "##### Bad Error Return from ConcordanceTrust", buf, 2u);
    }

    CFStringRef v49 = @"Bad Error Return from ConcordanceTrust";
LABEL_93:
    int v50 = 5;
  }
  v52 = sub_10000B070("ring");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = off_100308198[v50];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v53;
    if (v105) {
      v54 = "untrusted";
    }
    else {
      v54 = "trusted";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v49;
    *(_WORD *)&buf[22] = 2080;
    v126 = v54;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Decided on action [%s] based on concordance state [%@] and [%s] ring.", buf, 0x20u);
  }

  if (v50 == 5) {
    goto LABEL_57;
  }
  if (v50 == 2)
  {
    v62 = 0;
LABEL_135:
    char v67 = v113;
    uint64_t v68 = v108;
    goto LABEL_161;
  }
  CFMutableSetRef v55 = sub_10022F964(Instance);
  if (!CFSetGetCount(v55))
  {
    v56 = sub_10000B070("ring");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "changing state to accept - we have a reset ring", buf, 2u);
    }

    int v50 = 0;
    if (!v55) {
      goto LABEL_112;
    }
LABEL_111:
    CFRelease(v55);
    goto LABEL_112;
  }
  [(SOSAccountTrust *)self trustedCircle];
  if (v15 == 1) {
    SOSCircleForEachBackupCapablePeerForView();
  }
  else {
    SOSCircleForEachValidSyncingPeer();
  }
  if (CFEqual(cf, v55))
  {
    if (!v55) {
      goto LABEL_112;
    }
    goto LABEL_111;
  }
  v69 = sub_10000B070("ring");
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "mismatch between filteredPeerIDs and ringPeerIDSet, fixing ring and gensigning", buf, 2u);
  }

  v70 = sub_10000B070("ring");
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = cf;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "filteredPeerIDs %@", buf, 0xCu);
  }

  v71 = sub_10000B070("ring");
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v55;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "  ringPeerIDSet %@", buf, 0xCu);
  }

  sub_10022F8A0(Instance, cf);
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(Instance + 32));
  int v50 = 1;
  if (v55) {
    goto LABEL_111;
  }
LABEL_112:
  if (v50 != 1)
  {
    v62 = 0;
    goto LABEL_159;
  }
  BOOL v57 = CFSetGetCount(cf) > 0 && v15 == 1;
  if (!v57 || !SOSPeerInfoHasBackupKey())
  {
    v62 = 0;
    goto LABEL_128;
  }
  CFDataRef v58 = sub_1002024D8(kCFAllocatorDefault, v120, 0);
  v59 = (const void *)sub_1002022D8((void *)Instance);
  if (!v59)
  {
    v60 = sub_10000B070("ring");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Backup ring contains no BSKB", buf, 2u);
    }
  }
  if ((SOSBSKBAllPeersBackupKeysAreInKeyBag() & 1) == 0)
  {
    v88 = sub_10000B070("ring");
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "BSKB is missing some backup keys", buf, 2u);
    }

    if (SOSBSKBHasThisRecoveryKey()) {
      goto LABEL_196;
    }
    goto LABEL_193;
  }
  if ((SOSBSKBHasThisRecoveryKey() & 1) == 0)
  {
LABEL_193:
    v89 = sub_10000B070("ring");
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "BSKB is missing recovery key", buf, 2u);
    }

    goto LABEL_196;
  }
  if (v59)
  {
    char v61 = 0;
    v62 = 0;
    goto LABEL_211;
  }
LABEL_196:
  CFTypeRef v121 = 0;
  v90 = sub_1002020D4((void *)Instance);
  v91 = sub_10000B070("ring");
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Need to fix BSKB - this will prompt a gensign", buf, 2u);
  }

  if (v58)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, bskbRkbgPrefix, v58);
    v93 = (const void *)SOSBackupSliceKeyBagCreateWithAdditionalKeys();
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    v93 = (const void *)SOSBackupSliceKeyBagCreate();
  }
  char v94 = sub_1002021DC((void *)Instance, (uint64_t)v19, v90, (uint64_t)v93, (uint64_t)&v121);
  if ((v94 & 1) == 0)
  {
    v95 = sub_10000B070("ring");
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v121;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Couldn't fix BSKB (%@)", buf, 0xCu);
    }
  }
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(Instance + 32));
  sub_100201EB0((void *)Instance, (uint64_t)v19, (uint64_t)v117);
  CFTypeRef v96 = v121;
  if (v121)
  {
    CFTypeRef v121 = 0;
    CFRelease(v96);
  }
  if (v93) {
    CFRelease(v93);
  }
  char v61 = v94 ^ 1;
  v62 = (const __CFDictionary **)Instance;
LABEL_211:
  if (v58) {
    CFRelease(v58);
  }
  if (v59) {
    CFRelease(v59);
  }
  if (v61) {
    goto LABEL_216;
  }
LABEL_128:
  SOSFullPeerInfoGetPeerInfo();
  v63 = (void *)SOSPeerInfoCopyPubKey();
  if (v63)
  {
    sub_1001EE2BC((void *)Instance);
    unsigned int v64 = sub_10022F62C((void *)Instance);
    if (v64 > 5 || (unint64_t)v64 - 5 >= 0xFFFFFFFFFFFFFFFDLL)
    {
      SOSCreateError();
      CFRelease(v63);
    }
    else
    {
      BOOL v65 = sub_1002301F0(Instance, (__SecKey *)v63, 0);
      CFRelease(v63);
      if (v65)
      {
        v66 = sub_10000B070("ring");
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Already concur with newRing", buf, 2u);
        }

        goto LABEL_135;
      }
    }
  }
  CFTypeRef v121 = 0;
  if (!v19) {
    goto LABEL_154;
  }
  sub_1001EE2BC((void *)Instance);
  unsigned int v72 = sub_10022F62C((void *)Instance);
  if (v72 > 5 || (unint64_t)v72 - 5 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    SOSCreateError();
LABEL_154:
    v74 = sub_10000B070("ring");
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v121;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Failed to concordance sign, error: %@", buf, 0xCu);
    }
    int v50 = 5;
    goto LABEL_157;
  }
  v73 = off_100308578[v72][9];
  if (v73 && !((unsigned int (*)(uint64_t, __OpaqueSOSFullPeerInfo *, CFTypeRef *))v73)(Instance, v19, &v121)) {
    goto LABEL_154;
  }
  v74 = sub_10000B070("ring");
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "concordance signed", buf, 2u);
  }
  int v50 = 0;
  v62 = (const __CFDictionary **)Instance;
LABEL_157:

  if (v121) {
    CFRelease(v121);
  }
LABEL_159:
  uint64_t v68 = v108;
  char v67 = v113;
  if (v50 == 3)
  {
    BOOL v81 = sub_10022F8E8((uint64_t)v118, cf1);
    v82 = sub_10000B070("ring");
    BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
    if (v81)
    {
      if (v83)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = Instance;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Rejecting: %@", buf, 0xCu);
      }

      v84 = sub_10000B070("ring");
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v118;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "   RePush: %@", buf, 0xCu);
      }

      v85 = (const __CFDictionary **)v118;
      goto LABEL_218;
    }
    if (v83)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = Instance;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Rejecting: %@", buf, 0xCu);
    }

    v86 = sub_10000B070("ring");
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Have no old ring - would reset", buf, 2u);
    }

    goto LABEL_216;
  }
  if (!v50)
  {
LABEL_161:
    if (v106 == 5 && (v67 & 1) == 0)
    {
      BOOL v75 = sub_10023000C(Instance);
      v76 = sub_10000B070("ring");
      BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
      if (v75)
      {
        uint64_t v78 = v68;
        if (v77)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Reset ring for recovery from remote peer", buf, 2u);
        }

        CFDataRef v79 = (const __CFData *)SOSRKNullKey();
        v80 = (const void *)sub_10020EFC4(kCFAllocatorDefault, v120, v79, v117);
        sub_100202350(v120, (uint64_t)v80, (CFTypeRef *)v117);
      }
      else
      {
        uint64_t v78 = v68;
        if (v77)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "normal ring recovery key harvest", buf, 2u);
        }

        sub_1001EE2BC((void *)Instance);
        if (!sub_1001EE444((void *)Instance)
          || (CFDataRef v87 = (const __CFData *)sub_100202028((void *)Instance, 0)) == 0)
        {
          sub_100202350(v120, 0, (CFTypeRef *)v117);
          if (v68)
          {
LABEL_186:
            if (sub_10022F764(Instance, cf1)) {
              sub_10022F7B4(Instance, cf1);
            }
          }
LABEL_188:
          [(SOSAccountTrustClassic *)self setRing:Instance ringName:v111 err:v117];
          [v120 setCircle_rings_retirements_need_attention:1];
          v85 = (const __CFDictionary **)Instance;
          if (v113)
          {
LABEL_218:
            v97 = &unk_10035D360;
            if (v15 == 1) {
              v97 = &unk_10035D364;
            }
            ++*v97;
            v98 = sub_10000B070("ring");
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = v107;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v85;
              _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Pushing:[%s] %@", buf, 0x16u);
            }

            v99 = (const void *)sub_1001FEE20(v85, (CFTypeRef *)v117);
            if (v99) {
              unsigned int v100 = [v119 kvsRingPostRing:sub_10022F02C(v85[3]) ring:v99 err:v117];
            }
            else {
              unsigned int v100 = 0;
            }
            v101 = sub_10000B070("ring");
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Setting account.key_interests_need_updating to true in handleUpdateRing", buf, 2u);
            }

            [v120 setKey_interests_need_updating:1];
            if (v99) {
              CFRelease(v99);
            }
            BOOL v18 = v100 != 0;
            goto LABEL_230;
          }
          BOOL v18 = (v62 == 0) & ~v113;
          goto LABEL_217;
        }
        v80 = (const void *)sub_10020F384(kCFAllocatorDefault, v87, 0);
        sub_100202350(v120, (uint64_t)v80, (CFTypeRef *)v117);
      }
      uint64_t v68 = v78;
      if (v80) {
        CFRelease(v80);
      }
    }
    if (v68) {
      goto LABEL_186;
    }
    goto LABEL_188;
  }
LABEL_216:
  BOOL v18 = 0;
LABEL_217:
  v85 = v62;
  if (v62) {
    goto LABEL_218;
  }
LABEL_230:
  if (cf) {
    CFRelease(cf);
  }
  if (v112) {
    CFRelease(v112);
  }
  if (v118) {
    CFRelease(v118);
  }
  if (Instance) {
    CFRelease((CFTypeRef)Instance);
  }
  if (v109) {
    CFRelease(v109);
  }
  if (v116) {
    CFRelease(v116);
  }
  if (v114) {
    CFRelease(v114);
  }
LABEL_244:

  return v18;
}

- (BOOL)setRing:(__OpaqueSOSRing *)a3 ringName:(__CFString *)a4 err:(__CFError *)a5
{
  if (a3)
  {
    id v8 = [(SOSAccountTrustClassic *)self getRings:0];
    if (v8)
    {
      BOOL v9 = v8;
      unsigned int v10 = (const void *)sub_1001FEE20((const __CFDictionary **)a3, (CFTypeRef *)a5);
      if (v10)
      {
        uint64_t v11 = v10;
        CFDictionarySetValue(v9, a4, v10);
        CFRelease(v11);
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      SOSCreateError();
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return (char)v10;
}

- (BOOL)checkForRings:(__CFError *)a3
{
  uint64_t v9 = 0;
  unsigned int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v4 = [(SOSAccountTrustClassic *)self getRings:0];
  if (v4 && (CFTypeID v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID()))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001F9F1C;
    v8[3] = &unk_100308178;
    v8[4] = &v9;
    [(SOSAccountTrustClassic *)self forEachRing:v8];
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  }
  else
  {
    SOSCreateError();
    BOOL v6 = 0;
    *((unsigned char *)v10 + 24) = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setRings:(__CFDictionary *)a3
{
  id v4 = [(SOSAccountTrust *)self expansion];
  [v4 setObject:a3 forKey:@"trusted_rings"];
}

- (BOOL)resetAccountToEmpty:(id)a3 transport:(id)a4 err:(__CFError *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  unsigned __int8 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  CFTypeRef cf = 0;
  unsigned __int8 v10 = [(SOSAccountTrustClassic *)self resetAllRings:v8 err:&cf];
  if (*((unsigned char *)v24 + 24)) {
    unsigned __int8 v11 = v10;
  }
  else {
    unsigned __int8 v11 = 0;
  }
  *((unsigned char *)v24 + 24) = v11;
  if (cf)
  {
    char v12 = sub_10000B070("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v28 = cf;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "reset all rings error: %@", buf, 0xCu);
    }

    CFTypeRef v13 = cf;
    if (a5)
    {
      *a5 = (__CFError *)cf;
    }
    else if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v13);
    }
  }
  [(SOSAccountTrust *)self setFullPeerInfo:0];
  [(SOSAccountTrust *)self setDepartureCode:2];
  v14 = sub_10000B070("circleOps");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Reset Rings to empty by client request", buf, 2u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001FA340;
  v21[3] = &unk_100308150;
  v21[4] = &v23;
  v21[5] = a5;
  unsigned __int8 v15 = [(SOSAccountTrustClassic *)self modifyCircle:v9 err:a5 action:v21];
  if (*((unsigned char *)v24 + 24)) {
    unsigned __int8 v16 = v15;
  }
  else {
    unsigned __int8 v16 = 0;
  }
  *((unsigned char *)v24 + 24) = v16;
  if (v16)
  {
    notify_post(kSOSCCCircleOctagonKeysChangedNotification);
  }
  else
  {
    int v17 = sub_10000B070("SecError");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        BOOL v18 = *a5;
      }
      else {
        BOOL v18 = 0;
      }
      *(_DWORD *)buf = 138412290;
      CFTypeRef v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "error: %@", buf, 0xCu);
    }
  }
  BOOL v19 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  return v19;
}

- (BOOL)resetAllRings:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  CFSetRef v8 = Mutable;
  if (Mutable)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001FA52C;
    v15[3] = &unk_100308100;
    v15[4] = Mutable;
    [(SOSAccountTrustClassic *)self forEachRing:v15];
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_1001FA54C;
    context[3] = &unk_100308128;
    CFTypeRef v13 = &v16;
    context[4] = self;
    id v12 = v6;
    v14 = a4;
    CFSetApplyFunction(v8, (CFSetApplierFunction)sub_1001FA5A4, context);
    CFRelease(v8);
    int v9 = *((unsigned __int8 *)v17 + 24);
  }
  else
  {
    int v9 = *((unsigned __int8 *)v17 + 24);
  }
  _Block_object_dispose(&v16, 8);

  return v9 != 0;
}

- (BOOL)forEachRing:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  CFTypeRef v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  CFTypeID v5 = [(SOSAccountTrustClassic *)self getRings:0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v7 = Mutable;
  if (!v5)
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    goto LABEL_8;
  }
  if (!Mutable)
  {
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  unsigned __int8 v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1001FA828;
  CFTypeRef v13 = &unk_1003080E0;
  unsigned __int8 v15 = v26;
  uint64_t v16 = v25;
  CFMutableDictionaryRef v21 = Mutable;
  int v17 = v24;
  uint64_t v18 = v23;
  id v14 = v4;
  char v19 = v22;
  int v20 = &v27;
  CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_1001FA9A4, &v10);
  if (*((unsigned char *)v28 + 24)) {
    -[SOSAccountTrustClassic setRings:](self, "setRings:", v7, v10, v11, v12, v13);
  }
  CFRelease(v7);

  BOOL v8 = 1;
LABEL_9:
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);

  return v8;
}

- (BOOL)updateV2Dictionary:(id)a3 v2:(__CFDictionary *)a4
{
  id v6 = a3;
  if (a4)
  {
    [(SOSAccountTrustClassic *)self setValueInExpansion:@"v2dictionary" value:a4 err:0];
    if ([(SOSAccountTrust *)self trustedCircle])
    {
      if ([(SOSAccountTrust *)self fullPeerInfo])
      {
        [(SOSAccountTrust *)self fullPeerInfo];
        if (SOSFullPeerInfoUpdateV2Dictionary())
        {
          CFMutableDictionaryRef v7 = [v6 circle_transport];
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_1001FAACC;
          v9[3] = &unk_100309D10;
          id v10 = v6;
          [(SOSAccountTrustClassic *)self modifyCircle:v7 err:0 action:v9];
        }
      }
    }
  }

  return 1;
}

- (void)pendEnableViewSet:(__CFSet *)a3
{
  if (CFSetGetValue(a3, kSOSViewKeychainV0))
  {
    CFTypeID v5 = sub_10000B070("viewChange");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Warning, attempting to Add KeychainV0", v6, 2u);
    }
  }
  [(SOSAccountTrustClassic *)self valueUnionWith:@"pendingEnableViews" valuesToUnion:a3];
  [(SOSAccountTrustClassic *)self valueSubtractFrom:@"pendingDisableViews" valuesToSubtract:a3];
}

- (void)valueSubtractFrom:(__CFString *)a3 valuesToSubtract:(__CFSet *)a4
{
  CFSetRef v7 = [(SOSAccountTrustClassic *)self getValueFromExpansion:a3 err:0];
  if (v7)
  {
    CFSetRef v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFSetGetTypeID())
    {
      MutableCFStringRef Copy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, v8);
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_1001FAD24;
      context[3] = &unk_100309D30;
      context[4] = MutableCopy;
      CFSetApplyFunction(a4, (CFSetApplierFunction)sub_1001FA5A4, context);
      [(SOSAccountTrustClassic *)self setValueInExpansion:a3 value:MutableCopy err:0];
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
    }
  }
}

- (void)valueUnionWith:(__CFString *)a3 valuesToUnion:(__CFSet *)a4
{
  MutableCFStringRef Copy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a4);
  CFSetRef v7 = [(SOSAccountTrustClassic *)self getValueFromExpansion:a3 err:0];
  if (v7)
  {
    CFSetRef v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFSetGetTypeID())
    {
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_1001FAE34;
      context[3] = &unk_100309D30;
      context[4] = MutableCopy;
      CFSetApplyFunction(v8, (CFSetApplierFunction)sub_1001FA5A4, context);
    }
  }
  [(SOSAccountTrustClassic *)self setValueInExpansion:a3 value:MutableCopy err:0];
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
}

- (BOOL)valueSetContainsValue:(__CFString *)a3 value:(void *)a4
{
  CFSetRef v5 = [(SOSAccountTrustClassic *)self getValueFromExpansion:a3 err:0];
  if (v5)
  {
    CFSetRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    LOBYTE(v5) = v7 == CFSetGetTypeID() && CFSetContainsValue(v6, a4) != 0;
  }
  return (char)v5;
}

- (BOOL)setValueInExpansion:(__CFString *)a3 value:(void *)a4 err:(__CFError *)a5
{
  if (a4)
  {
    BOOL v8 = [(SOSAccountTrustClassic *)self ensureExpansion:a5];
    if (v8)
    {
      CFTypeID v9 = [(SOSAccountTrust *)self expansion];
      [v9 setObject:a4 forKey:a3];

      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = [(SOSAccountTrustClassic *)self clearValueFromExpansion:a3 err:a5];
  }
  return v8;
}

- (BOOL)clearValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4
{
  BOOL v6 = [(SOSAccountTrustClassic *)self ensureExpansion:a4];
  if (v6)
  {
    CFTypeID v7 = [(SOSAccountTrust *)self expansion];
    [v7 removeObjectForKey:a3];
  }
  return v6;
}

- (BOOL)ensureExpansion:(__CFError *)a3
{
  CFSetRef v5 = [(SOSAccountTrust *)self expansion];

  if (!v5)
  {
    BOOL v6 = +[NSMutableDictionary dictionary];
    [(SOSAccountTrust *)self setExpansion:v6];
  }
  CFTypeID v7 = [(SOSAccountTrust *)self expansion];
  BOOL v8 = sub_100029834((uint64_t)v7, (CFTypeRef *)a3, @"Can't Alloc Account Expansion dictionary");

  return v8;
}

- (void)getValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4
{
  BOOL v6 = [(SOSAccountTrust *)self expansion];

  if (!v6) {
    return 0;
  }
  CFTypeID v7 = [(SOSAccountTrust *)self expansion];
  id v8 = [v7 objectForKey:a3];

  return v8;
}

- (void)resetRingDictionary
{
  v3 = [(SOSAccountTrust *)self expansion];

  if (v3)
  {
    id v5 = +[NSMutableDictionary dictionary];
    id v4 = [(SOSAccountTrust *)self expansion];
    [v4 setObject:v5 forKey:@"trusted_rings"];
  }
}

- (void)addRingDictionary
{
  v3 = [(SOSAccountTrust *)self expansion];

  if (v3)
  {
    id v4 = [(SOSAccountTrust *)self expansion];
    id v5 = [v4 valueForKey:@"trusted_rings"];

    if (!v5)
    {
      id v7 = +[NSMutableDictionary dictionary];
      BOOL v6 = [(SOSAccountTrust *)self expansion];
      [v6 setObject:v7 forKey:@"trusted_rings"];
    }
  }
}

- (BOOL)clientPing:(id)a3
{
  id v4 = a3;
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    if ([(SOSAccountTrust *)self fullPeerInfo])
    {
      [(SOSAccountTrust *)self fullPeerInfo];
      if (SOSFullPeerInfoPing())
      {
        id v5 = [v4 circle_transport];
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_1001FB6C8;
        v7[3] = &unk_100309D10;
        v7[4] = self;
        [(SOSAccountTrustClassic *)self modifyCircle:v5 err:0 action:v7];
      }
    }
  }

  return 1;
}

- (BOOL)removeIncompleteiCloudIdentities:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4 err:(__CFError *)a5
{
  CFSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  [(SOSAccountTrust *)self trustedCircle];
  SOSCircleForEachActivePeer();
  CFIndex Count = CFSetGetCount(Mutable);
  if (Count >= 1)
  {
    [(SOSAccountTrust *)self trustedCircle];
    [(SOSAccountTrust *)self fullPeerInfo];
    SOSCircleRemovePeers();
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Count > 0;
}

- (__SecKey)copyDeviceKey:(__CFError *)a3
{
  if ([(SOSAccountTrust *)self fullPeerInfo])
  {
    [(SOSAccountTrust *)self fullPeerInfo];
    return (__SecKey *)SOSFullPeerInfoCopyDeviceKey();
  }
  else
  {
    SOSErrorCreate();
    return 0;
  }
}

- (BOOL)postDebugScope:(id)a3 scope:(void *)a4 err:(__CFError *)a5
{
  if (a3) {
    return [a3 kvssendDebugInfo:@"Scope" debug:a4 err:a5];
  }
  else {
    return 0;
  }
}

- (__OpaqueSOSEngine)getDataSourceEngine:(SOSDataSourceFactory *)a3
{
  if (![(SOSAccountTrust *)self trustedCircle])
  {
    id v7 = sub_10000B070("engine");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFTypeID v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tried to set dataSourceEngine with no circle", v9, 2u);
    }

    return 0;
  }
  [(SOSAccountTrust *)self trustedCircle];
  uint64_t Name = SOSCircleGetName();
  if (a3)
  {
    uint64_t v6 = ((uint64_t (*)(SOSDataSourceFactory *, uint64_t, void))a3->var1)(a3, Name, 0);
    if (v6)
    {
      a3 = *(SOSDataSourceFactory **)v6;
      (*(void (**)(uint64_t, void))(v6 + 72))(v6, 0);
      return (__OpaqueSOSEngine *)a3;
    }
    return 0;
  }
  return (__OpaqueSOSEngine *)a3;
}

- (BOOL)isSyncingV0
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001FBB04;
  v4[3] = &unk_100308370;
  v4[4] = &v5;
  [(SOSAccountTrustClassic *)self forEachCirclePeerExceptMe:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)requestSyncWithAllPeers:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  id v7 = a3;
  char v8 = [v7 account];
  unsigned int v9 = [v8 isInCircle:a5];

  if (v9)
  {
    id v10 = +[NSMutableSet set];
    [(SOSAccountTrust *)self trustedCircle];
    CFTypeRef v13 = v10;
    id v11 = v10;
    SOSCircleForEachValidSyncingPeer();
    [v7 requestSyncWithPeers:v11];
  }
  return v9;
}

- (__CFSet)syncWithPeers:(id)a3 peerIDs:(__CFSet *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  unsigned int v9 = [v8 account];
  if ([v9 isInCircle:a5])
  {
    CFSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    CFSetRef v11 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    if ([v9 peerInfo])
    {
      uint64_t PeerID = (const void *)SOSPeerInfoGetPeerID();
      MutableCFStringRef Copy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a4);
      CFSetRemoveValue(MutableCopy, PeerID);
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_1001FBEAC;
      context[3] = &unk_100308320;
      context[4] = self;
      id v17 = v9;
      CFSetRef v18 = v11;
      char v19 = Mutable;
      CFSetApplyFunction(MutableCopy, (CFSetApplierFunction)sub_1001FC0B8, context);
      CFSetRef v14 = sub_1001EC9B8(v8, v11);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1001FC0B0;
      v20[3] = &unk_100309D30;
      v20[4] = Mutable;
      CFSetApplyFunction(v14, (CFSetApplierFunction)sub_1001FC0B8, v20);
      if (v14) {
        CFRelease(v14);
      }
      sub_1001EC6B8(v8);
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
      if (v11) {
        CFRelease(v11);
      }
    }
    else if (v11)
    {
      CFRelease(v11);
    }
  }
  else
  {
    CFSetRef Mutable = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a4);
  }

  return Mutable;
}

- (char)encodeToDER:(id)a3 err:(id *)a4 start:(const char *)a5 end:(char *)a6
{
  id v21 = 0;
  id v7 = a3;
  CFDictionaryRef v18 = [v7 gestalt];
  [(SOSAccountTrust *)self trustedCircle];
  int v20 = [(SOSAccountTrust *)self fullPeerInfo];
  [(SOSAccountTrust *)self departureCode];
  unsigned __int8 v8 = [v7 accountKeyIsTrusted];
  id v9 = [v7 accountKey];
  id v10 = [v7 previousAccountKey];
  CFSetRef v11 = [v7 accountKeyDerivationParameters];
  id v12 = [(SOSAccountTrust *)self retirees];
  [v7 backup_key];
  CFDataRef v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  CFDictionaryRef v14 = [(SOSAccountTrust *)self expansion];
  sub_10000B6E8(v14, (CFTypeRef *)&v21, 0);
  if (v13) {
    sub_100010510(v13, (CFTypeRef *)&v21);
  }
  SOSPeerInfoSetEncodeToArrayDER();
  der_encode_data_or_null();
  sub_1001ED630((uint64_t)v10);
  sub_1001ED630((uint64_t)v9);
  unsigned __int8 v22 = v8;
  ccder_encode_body();
  ccder_encode_tl();
  ccder_encode_uint64();
  if (v20) {
    SOSFullPeerInfoEncodeToDER();
  }
  else {
    ccder_encode_tl();
  }
  SOSCircleEncodeToDER();
  sub_10000B6E8(v18, (CFTypeRef *)&v21, 0);
  ccder_encode_uint64();
  unsigned __int8 v15 = (char *)ccder_encode_constructed_tl();

  id v16 = v21;
  if (a4 && v21)
  {
    *a4 = v21;
  }
  else if (v21)
  {
    id v21 = 0;
    CFRelease(v16);
  }
  return v15;
}

- (unint64_t)getDEREncodedSize:(id)a3 err:(id *)a4
{
  id v5 = a3;
  id v27 = 0;
  if (!ccder_sizeof_uint64()) {
    goto LABEL_19;
  }
  CFDictionaryRef v7 = [v5 gestalt];
  uint64_t v8 = sub_10000B67C(v7, (uint64_t)&v27);

  uint64_t v26 = v8;
  if (!v8) {
    goto LABEL_19;
  }
  [(SOSAccountTrust *)self trustedCircle];
  uint64_t DEREncodedSize = SOSCircleGetDEREncodedSize();
  if (!DEREncodedSize) {
    goto LABEL_19;
  }
  uint64_t v9 = [(SOSAccountTrust *)self fullPeerInfo] ? SOSFullPeerInfoGetDEREncodedSize() : ccder_sizeof();
  uint64_t v24 = v9;
  if (!v9) {
    goto LABEL_19;
  }
  [(SOSAccountTrust *)self departureCode];
  uint64_t v23 = ccder_sizeof_uint64();
  if (!v23) {
    goto LABEL_19;
  }
  [v5 accountKeyIsTrusted];
  if (!ccder_sizeof()) {
    goto LABEL_19;
  }
  if (!sub_1001ED5D4((uint64_t)[v5 accountKey])) {
    goto LABEL_19;
  }
  if (!sub_1001ED5D4((uint64_t)[v5 previousAccountKey])) {
    goto LABEL_19;
  }
  id v10 = [v5 accountKeyDerivationParameters];
  uint64_t v11 = der_sizeof_data_or_null();

  if (!v11) {
    goto LABEL_19;
  }
  id v12 = [(SOSAccountTrust *)self retirees];
  uint64_t DEREncodedArraySize = SOSPeerInfoSetGetDEREncodedArraySize();

  if (!DEREncodedArraySize) {
    goto LABEL_19;
  }
  [v5 backup_key];
  CFDataRef v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  CFDataRef v15 = v14;
  if (v14)
  {
    CFDataGetLength(v14);
    ccder_sizeof_raw_octet_string();
  }

  CFDictionaryRef v16 = [(SOSAccountTrust *)self expansion];
  uint64_t v17 = sub_10000B67C(v16, (uint64_t)&v27);

  if (v17)
  {
    unint64_t v18 = ccder_sizeof();
  }
  else
  {
LABEL_19:
    sub_1000297A0(-1, @"com.apple.security.cfder.error", 0, (CFTypeRef *)&v27, v6, @"don't know how to encode", a4, v23, v24, DEREncodedSize, v26);
    id v20 = v27;
    if (v22 && v27)
    {
      unint64_t v18 = 0;
      *unsigned __int8 v22 = v27;
    }
    else
    {
      if (v27)
      {
        id v27 = 0;
        CFRelease(v20);
      }
      unint64_t v18 = 0;
    }
  }

  return v18;
}

- (__CFArray)copySortedPeerArray:(__CFError *)a3 action:(id)a4
{
  id v5 = (void (**)(id, __OpaqueSOSCircle *, __CFArray *))a4;
  CFSetRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v5[2](v5, [(SOSAccountTrust *)self trustedCircle], Mutable);

  CFArrayOfSOSPeerInfosSortByID();
  return Mutable;
}

- (BOOL)addEscrowToPeerInfo:(__OpaqueSOSFullPeerInfo *)a3 err:(__CFError *)a4
{
  -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", @"EscrowRecord");

  return SOSFullPeerInfoReplaceEscrowRecords();
}

- (BOOL)addiCloudIdentity:(__OpaqueSOSCircle *)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  SecKeyRef v7 = sub_1001F0694(256, @"Cloud Identity", (uint64_t)kSecAttrAccessibleWhenUnlocked, (uint64_t)kCFBooleanTrue, a5);
  if (!v7)
  {
    sub_100012A40(-108, (__CFString **)a5, @"Can't generate keypair for icloud identity");
    return 0;
  }
  SecKeyRef v15 = v7;
  CFDictionaryRef v16 = sub_100139704(kCFAllocatorDefault, v8, v9, v10, v11, v12, v13, v14, kPIUserDefinedDeviceNameKey, @"iCloud");
  if (!v16)
  {
    sub_100012A40(-108, (__CFString **)a5, @"Can't allocate gestalt");
LABEL_18:
    CFRelease(v15);
    return 0;
  }
  CFDictionaryRef v17 = v16;
  uint64_t CloudIdentity = SOSPeerInfoCreateCloudIdentity();
  if (!CloudIdentity)
  {
    CFRelease(v17);
    goto LABEL_18;
  }
  uint64_t v26 = (const void *)CloudIdentity;
  CFDictionaryRef v27 = sub_100139704(kCFAllocatorDefault, v19, v20, v21, v22, v23, v24, v25, (uint64_t)kSecClass, (uint64_t)kSecClassKey);
  uint64_t PeerID = SOSPeerInfoGetPeerID();
  CFStringRef v29 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Cloud Identity - '%@'", PeerID);
  CFDictionaryRef v37 = sub_100139704(kCFAllocatorDefault, v30, v31, v32, v33, v34, v35, v36, (uint64_t)kSecAttrLabel, (uint64_t)v29);
  OSStatus v38 = SecItemUpdate(v27, v37);
  sub_100012A40(v38, (__CFString **)a5, @"Couldn't update name");
  if (v29) {
    CFRelease(v29);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v37) {
    CFRelease(v37);
  }
  CFRelease(v17);
  CFRelease(v15);
  v39 = (const void *)SOSFullPeerInfoCreateCloudIdentity();
  CFRelease(v26);
  if (!v39) {
    return 0;
  }
  if (SOSCircleRequestAdmission())
  {
    [(SOSAccountTrust *)self fullPeerInfo];
    SOSFullPeerInfoGetPeerInfo();
    char v40 = SOSCircleAcceptRequest();
  }
  else
  {
    char v40 = 0;
  }
  CFRelease(v39);
  return v40;
}

- (__CFSet)copyPreApprovedHSA2Info
{
  CFSetRef v2 = [(SOSAccountTrustClassic *)self getValueFromExpansion:@"HSAPreApprovedPeer" err:0];
  if (v2)
  {
    return CFSetCreateMutableCopy(0, 0, v2);
  }
  else
  {
    return CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  }
}

- (BOOL)upgradeiCloudIdentity:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4
{
  uint64_t v4 = SOSCircleCopyiCloudFullPeerInfoRef();
  if (!v4) {
    return 0;
  }
  id v5 = (const void *)v4;
  if (SOSFullPeerInfoUpgradeSignatures())
  {
    SOSFullPeerInfoGetPeerInfo();
    char updated = SOSCircleUpdatePeerInfo();
  }
  else
  {
    char updated = 0;
  }
  CFRelease(v5);
  return updated;
}

- (void)removeInvalidApplications:(__OpaqueSOSCircle *)a3 userPublic:(__SecKey *)a4
{
  void context[5] = _NSConcreteStackBlock;
  context[6] = 3221225472;
  void context[7] = sub_1001FCB18;
  context[8] = &unk_100308DD0;
  context[9] = a4;
  CFSetRef MutableForSOSPeerInfosByID = (CFSetRef)CFSetCreateMutableForSOSPeerInfosByID();
  SOSCircleForEachApplicant();
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_1001FCB74;
  context[3] = &unk_100309D30;
  context[4] = a3;
  CFSetApplyFunction(MutableForSOSPeerInfosByID, (CFSetApplierFunction)sub_1001FC0B8, context);
}

- (BOOL)updatePeerInfo:(id)a3 description:(__CFString *)a4 err:(__CFError *)a5 update:(id)a6
{
  id v10 = a3;
  int v11 = (unsigned int (**)(id, __OpaqueSOSFullPeerInfo *, __CFError **))a6;
  if (![(SOSAccountTrust *)self fullPeerInfo]) {
    goto LABEL_5;
  }
  if (!v11[2](v11, [(SOSAccountTrust *)self fullPeerInfo], a5))
  {
    BOOL v12 = 0;
    goto LABEL_7;
  }
  if ([(SOSAccountTrustClassic *)self hasCircle:0])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001FCC90;
    v14[3] = &unk_100308CF0;
    v14[4] = self;
    v14[5] = a4;
    BOOL v12 = [(SOSAccountTrustClassic *)self modifyCircle:v10 err:a5 action:v14];
  }
  else
  {
LABEL_5:
    BOOL v12 = 1;
  }
LABEL_7:

  return v12;
}

- (BOOL)peerSignatureUpdate:(__SecKey *)a3 err:(__CFError *)a4
{
  id v5 = [(SOSAccountTrust *)self fullPeerInfo];
  if (v5)
  {
    [(SOSAccountTrust *)self fullPeerInfo];
    LOBYTE(v5) = SOSFullPeerInfoUpgradeSignatures();
  }
  return (char)v5;
}

- (__CFArray)copyPeersToListenTo:(__SecKey *)a3 err:(__CFError *)a4
{
  uint64_t PeerID = [(SOSAccountTrust *)self peerInfo];
  if (PeerID) {
    uint64_t PeerID = (__OpaqueSOSPeerInfo *)SOSPeerInfoGetPeerID();
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001FCE64;
  v9[3] = &unk_1003082F8;
  void v9[4] = PeerID;
  v9[5] = a3;
  return [(SOSAccountTrustClassic *)self copySortedPeerArray:a4 action:v9];
}

- (__CFSet)copyPeerSetMatching:(id)a3
{
  id v4 = a3;
  CFSetRef MutableForSOSPeerInfosByID = (__CFSet *)CFSetCreateMutableForSOSPeerInfosByID();
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    [(SOSAccountTrust *)self trustedCircle];
    id v7 = v4;
    SOSCircleForEachPeer();
  }
  return MutableForSOSPeerInfosByID;
}

- (BOOL)isAccountIdentity:(__OpaqueSOSPeerInfo *)a3 err:(__CFError *)a4
{
  id v5 = [(SOSAccountTrust *)self peerInfo];
  if (a3 && v5) {
    return CFEqual(a3, v5) != 0;
  }
  else {
    return v5 == a3;
  }
}

- (__OpaqueSOSPeerInfo)copyPeerWithID:(__CFString *)a3 err:(__CFError *)a4
{
  result = [(SOSAccountTrust *)self trustedCircle];
  if (result)
  {
    [(SOSAccountTrust *)self trustedCircle];
    return (__OpaqueSOSPeerInfo *)SOSCircleCopyPeerWithID();
  }
  return result;
}

- (__SecKey)copyPublicKeyForPeer:(__CFString *)a3 err:(__CFError *)a4
{
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    [(SOSAccountTrust *)self trustedCircle];
    uint64_t v5 = SOSCircleCopyPeerWithID();
    if (v5)
    {
      uint64_t v6 = (const void *)v5;
      id v7 = (__SecKey *)SOSPeerInfoCopyPubKey();
      CFRelease(v6);
      return v7;
    }
  }
  else
  {
    SOSErrorCreate();
  }
  return 0;
}

- (__CFSet)copyPeerSetForView:(__CFString *)a3
{
  CFSetRef MutableForSOSPeerInfosByID = (__CFSet *)CFSetCreateMutableForSOSPeerInfosByID();
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    [(SOSAccountTrust *)self trustedCircle];
    SOSCircleForEachPeer();
  }
  return MutableForSOSPeerInfosByID;
}

- (void)addSyncablePeerBlock:(id)a3 dsName:(__CFString *)a4 change:(id)a5
{
  id v8 = a5;
  if (!v8) {
    goto LABEL_12;
  }
  int v9 = [a3 account];
  if (a4) {
    CFRetain(a4);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FD470;
  v13[3] = &unk_1003082B8;
  SecKeyRef v15 = a4;
  v13[4] = self;
  id v14 = v8;
  id v10 = objc_retainBlock(v13);
  sub_1001E565C(v9, v10);
  CFSetRef MutableForSOSPeerInfosByID = (const void *)CFSetCreateMutableForSOSPeerInfosByID();
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    [(SOSAccountTrust *)self trustedCircle];
    uint64_t Name = (__CFString *)SOSCircleGetName();
    if (!a4 || !Name)
    {
      if (Name != a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if (CFEqual(a4, Name)) {
LABEL_8:
    }
      ((void (*)(void *, void *, __OpaqueSOSCircle *, const void *, const void *, const void *, const void *))v10[2])(v10, v9, [(SOSAccountTrust *)self trustedCircle], MutableForSOSPeerInfosByID, MutableForSOSPeerInfosByID, MutableForSOSPeerInfosByID, MutableForSOSPeerInfosByID);
  }
LABEL_9:
  if (MutableForSOSPeerInfosByID) {
    CFRelease(MutableForSOSPeerInfosByID);
  }

LABEL_12:
}

- (BOOL)updateViewSets:(id)a3 enabled:(__CFSet *)MutableCopy disabled:(__CFSet *)a5
{
  id v8 = a3;
  if (MutableCopy) {
    Mutableuint64_t Copy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, MutableCopy);
  }
  if (a5) {
    a5 = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a5);
  }
  sub_1001FDD34(@"Enabled", MutableCopy);
  sub_1001FDD34(@"Disabled", a5);
  if (![(SOSAccountTrust *)self trustedCircle])
  {
    unint64_t v18 = sub_10000B070("views");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_42;
    }
    *(_WORD *)buf = 0;
    int v19 = "Attempt to set viewsets with no trusted circle";
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    goto LABEL_42;
  }
  if (![(SOSAccountTrust *)self fullPeerInfo])
  {
    unint64_t v18 = sub_10000B070("views");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_42;
    }
    *(_WORD *)buf = 0;
    int v19 = "Attempt to set viewsets with no fullPeerInfo";
    goto LABEL_41;
  }
  if ((unint64_t)MutableCopy | (unint64_t)a5)
  {
    SOSFullPeerInfoGetPeerInfo();
    uint64_t Copy = SOSPeerInfoCreateCopy();
    if (Copy)
    {
      id v10 = (const void *)Copy;
      int IsCurrent = SOSPeerInfoVersionIsCurrent();
      if ((IsCurrent & 1) == 0)
      {
        CFTypeRef cf = 0;
        if ((SOSPeerInfoUpdateToV2() & 1) == 0)
        {
          int v21 = sub_10000B070("views");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFTypeRef v26 = cf;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unable to update peer to V2- can't update views: %@", buf, 0xCu);
          }
          goto LABEL_48;
        }
        BOOL v12 = sub_10000B070("V2update");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating PeerInfo to V2 within SOSAccountUpdateViewSets", buf, 2u);
        }
      }
      sub_100025B70(MutableCopy, (uint64_t)&stru_100308270);
      sub_100025B70(a5, (uint64_t)&stru_100308290);
      if (sub_1001FDE40(v8, MutableCopy, 1))
      {
        if (sub_1001FDE40(v8, a5, 2))
        {
          int v13 = IsCurrent ^ 1;
          if (MutableCopy) {
            v13 |= SOSViewSetEnable();
          }
          if (a5)
          {
            if (((v13 | SOSViewSetDisable()) & 1) == 0) {
              goto LABEL_25;
            }
          }
          else if (!v13)
          {
            goto LABEL_25;
          }
          if (SOSFullPeerInfoUpdateToThisPeer())
          {
            id v14 = [v8 circle_transport];
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_1001FDED4;
            v23[3] = &unk_100309D10;
            void v23[4] = self;
            unsigned int v15 = [(SOSAccountTrustClassic *)self modifyCircle:v14 err:0 action:v23];

            if (v15) {
              sub_1001EA1A8(v8);
            }
          }
LABEL_25:
          BOOL v16 = 1;
          if (!MutableCopy)
          {
LABEL_27:
            if (a5) {
              CFRelease(a5);
            }
            if (v10) {
              CFRelease(v10);
            }
            goto LABEL_31;
          }
LABEL_26:
          CFRelease(MutableCopy);
          goto LABEL_27;
        }
        int v21 = sub_10000B070("viewChange");
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_48;
        }
        *(_WORD *)buf = 0;
        int v22 = "Bad view change (disable) with kSOSViewKeychainV0";
      }
      else
      {
        int v21 = sub_10000B070("viewChange");
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
LABEL_48:

LABEL_49:
          BOOL v16 = 0;
          if (!MutableCopy) {
            goto LABEL_27;
          }
          goto LABEL_26;
        }
        *(_WORD *)buf = 0;
        int v22 = "Bad view change (enable) with kSOSViewKeychainV0";
      }
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
      goto LABEL_48;
    }
    unint64_t v18 = sub_10000B070("views");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v19 = "Couldn't copy PeerInfoRef";
      goto LABEL_41;
    }
LABEL_42:

    id v10 = 0;
    goto LABEL_49;
  }
  int v20 = sub_10000B070("views");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No work to do", buf, 2u);
  }

  BOOL v16 = 0;
LABEL_31:

  return v16;
}

- (BOOL)matchOTUserViewSettings:(id)a3 userViewsEnabled:(BOOL)a4 err:(__CFError *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  CFSetRef UserVisibleSet = (const __CFSet *)SOSViewsGetUserVisibleSet();
  if ([v8 isInCircle:a5])
  {
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_1001FE3B0;
    context[3] = &unk_100308250;
    id v16 = v8;
    CFDictionaryRef v17 = &v24;
    unint64_t v18 = &v20;
    int v19 = a5;
    CFSetApplyFunction(UserVisibleSet, (CFSetApplierFunction)sub_1001FC0B8, context);
  }
  if (!v6)
  {
    if (*((unsigned char *)v21 + 24))
    {
      id v10 = sub_10000B070("circleChange");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disabling User Visible Views to match OT Settings", v14, 2u);
      }
      CFSetRef v11 = 0;
      goto LABEL_12;
    }
LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  if (!*((unsigned char *)v25 + 24)) {
    goto LABEL_13;
  }
  id v10 = sub_10000B070("circleChange");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enabling User Visible Views to match OT Settings", v14, 2u);
  }
  CFSetRef v11 = UserVisibleSet;
  CFSetRef UserVisibleSet = 0;
LABEL_12:

  BOOL v12 = [(SOSAccountTrustClassic *)self updateViewSets:v8 enabled:v11 disabled:UserVisibleSet];
LABEL_14:
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)viewStatus:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  if (!sub_1001EEC4C(v8)
    || ![(SOSAccountTrust *)self trustedCircle]
    || ![(SOSAccountTrust *)self fullPeerInfo]
    || ![(SOSAccountTrustClassic *)self activeValidInCircle:v8 err:a5])
  {
    SOSCreateError();
    int v9 = 0;
    goto LABEL_19;
  }
  if (![(SOSAccountTrustClassic *)self valueSetContainsValue:@"pendingEnableViews" value:a4])
  {
    if ([(SOSAccountTrustClassic *)self valueSetContainsValue:@"pendingDisableViews" value:a4])
    {
      int v9 = 2;
LABEL_9:
      if (a4 && kSOSViewKeychainV0)
      {
        if (!CFEqual(a4, kSOSViewKeychainV0))
        {
LABEL_14:
          if (!SOSViewsIsV0Subview()) {
            goto LABEL_19;
          }
        }
      }
      else if ((__CFString *)kSOSViewKeychainV0 != a4)
      {
        goto LABEL_14;
      }
      id v10 = [v8 trust];
      unsigned int v11 = [v10 isSyncingV0];

      if (!v11) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    [(SOSAccountTrust *)self fullPeerInfo];
    int v9 = SOSFullPeerInfoViewStatus();
    if (v9 != 1) {
      goto LABEL_9;
    }
  }
LABEL_16:
  [(SOSAccountTrust *)self trustedCircle];
  [(SOSAccountTrust *)self peerInfo];
  if (SOSCircleHasApplicant()) {
    int v9 = 5;
  }
  else {
    int v9 = 1;
  }
LABEL_19:

  return v9;
}

- (BOOL)activeValidInCircle:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  id v7 = [(SOSAccountTrust *)self trustedCircle];
  [(SOSAccountTrust *)self fullPeerInfo];
  uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo();
  id v9 = sub_1001EEC4C(v6);

  return _SOSCircleHasActiveValidPeer(v7, PeerInfo, v9, a4);
}

- (int)updateView:(id)a3 name:(__CFString *)a4 code:(int)a5 err:(__CFError *)a6
{
  id v10 = a3;
  BOOL v11 = sub_1001F7170(v10);
  BOOL v12 = (const void *)SOSViewCopyViewSet();
  if (![(SOSAccountTrust *)self trustedCircle]
    || ![(SOSAccountTrust *)self fullPeerInfo])
  {
    SOSCreateError();
    goto LABEL_46;
  }
  if ((a5 - 3) < 0xFFFFFFFE
    || ([v10 trust],
        int v13 = objc_claimAutoreleasedReturnValue(),
        int updated = [v13 viewStatus:v10 name:a4 err:a6],
        v13,
        (updated - 3) < 0xFFFFFFFE))
  {
LABEL_46:
    int updated = 0;
    if (!v12) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (a4 && kSOSViewKeychainV0)
  {
    if (CFEqual(a4, kSOSViewKeychainV0)) {
      goto LABEL_8;
    }
  }
  else if ((__CFString *)kSOSViewKeychainV0 == a4)
  {
LABEL_8:
    if (sub_1001F54A4(v10)) {
      int updated = a5 == 2;
    }
    else {
      int updated = 2 * (a5 == 1);
    }
    if (!v12) {
      goto LABEL_42;
    }
LABEL_41:
    CFRelease(v12);
    goto LABEL_42;
  }
  unsigned int v15 = [v10 trust];
  if ([v15 isSyncingV0])
  {
    char IsV0Subview = SOSViewsIsV0Subview();

    if (IsV0Subview)
    {
      int updated = 1;
      if (!v12) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
  }
  else
  {
  }
  CFSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  CFSetAddValue(Mutable, a4);
  if (a5 == 1 && updated == 2)
  {
    if (v11)
    {
      [(SOSAccountTrust *)self fullPeerInfo];
      int updated = SOSFullPeerInfoUpdateViews();
      BOOL v18 = updated == 1;
      goto LABEL_29;
    }
    [(SOSAccountTrustClassic *)self pendEnableViewSet:Mutable];
    goto LABEL_35;
  }
  int v19 = 0;
  if (a5 != 2 || updated != 1)
  {
LABEL_36:
    if (!Mutable) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  if (v12 && CFSetContainsValue((CFSetRef)v12, a4))
  {
LABEL_35:
    int v19 = 0;
    int updated = 1;
    goto LABEL_36;
  }
  if (!v11)
  {
    id v22 = v10;
    char v23 = [v22 trust];
    [v23 valueUnionWith:@"pendingDisableViews" valuesToUnion:Mutable];

    uint64_t v24 = [v22 trust];

    [v24 valueSubtractFrom:@"pendingEnableViews" valuesToSubtract:Mutable];
    int v19 = 0;
    int updated = 2;
    if (!Mutable) {
      goto LABEL_38;
    }
LABEL_37:
    CFRelease(Mutable);
    goto LABEL_38;
  }
  [(SOSAccountTrust *)self fullPeerInfo];
  int updated = SOSFullPeerInfoUpdateViews();
  BOOL v18 = updated == 2;
LABEL_29:
  int v19 = v18;
  if (Mutable) {
    goto LABEL_37;
  }
LABEL_38:
  if (v19)
  {
    uint64_t v20 = [v10 circle_transport];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001FE994;
    v25[3] = &unk_100309D10;
    void v25[4] = self;
    [(SOSAccountTrustClassic *)self modifyCircle:v20 err:0 action:v25];
  }
  if (v12) {
    goto LABEL_41;
  }
LABEL_42:

  return updated;
}

- (BOOL)updateGestalt:(id)a3 newGestalt:(__CFDictionary *)a4
{
  id v6 = a3;
  id v7 = [v6 gestalt];
  id v8 = v7;
  if (a4 && v7)
  {
    int v9 = CFEqual(a4, v7);

    if (v9)
    {
LABEL_4:
      BOOL v10 = 0;
      goto LABEL_11;
    }
  }
  else
  {

    if (v8 == a4) {
      goto LABEL_4;
    }
  }
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    if ([(SOSAccountTrust *)self fullPeerInfo])
    {
      [(SOSAccountTrust *)self fullPeerInfo];
      if (SOSFullPeerInfoUpdateGestalt())
      {
        BOOL v11 = [v6 circle_transport];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1001FEB80;
        v14[3] = &unk_100309D10;
        v14[4] = self;
        [(SOSAccountTrustClassic *)self modifyCircle:v11 err:0 action:v14];
      }
    }
  }
  id v12 = [objc_alloc((Class)NSDictionary) initWithDictionary:a4];
  [v6 setGestalt:v12];

  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (SOSAccountTrustClassic)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SOSAccountTrustClassic;
  id v14 = [(SOSAccountTrust *)&v18 init];
  if (v14)
  {
    id v15 = [objc_alloc((Class)NSMutableSet) initWithSet:v12];
    [(SOSAccountTrust *)v14 setRetirees:v15];

    if (a4) {
      CFRetain(a4);
    }
    [(SOSAccountTrust *)v14 setFullPeerInfo:a4];
    if (a5) {
      CFRetain(a5);
    }
    [(SOSAccountTrust *)v14 setTrustedCircle:a5];
    [(SOSAccountTrust *)v14 setDepartureCode:v8];
    id v16 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v13];
    [(SOSAccountTrust *)v14 setExpansion:v16];

    [(SOSAccountTrustClassic *)v14 addRingDictionary];
  }

  return v14;
}

- (SOSAccountTrustClassic)init
{
  v6.receiver = self;
  v6.super_class = (Class)SOSAccountTrustClassic;
  CFSetRef v2 = [(SOSAccountTrust *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableSet set];
    [(SOSAccountTrust *)v2 setRetirees:v3];

    [(SOSAccountTrust *)v2 setFullPeerInfo:0];
    [(SOSAccountTrust *)v2 setTrustedCircle:0];
    [(SOSAccountTrust *)v2 setDepartureCode:0];
    id v4 = +[NSMutableDictionary dictionary];
    [(SOSAccountTrust *)v2 setExpansion:v4];

    [(SOSAccountTrustClassic *)v2 addRingDictionary];
  }
  return v2;
}

+ (id)trustClassic
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)joinCircle:(id)a3 userKey:(__SecKey *)a4 useCloudPeer:(BOOL)a5 err:(__CFError *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = sub_10020FA98;
  uint64_t v24 = sub_10020FAA8;
  id v25 = (id)0xAAAAAAAAAAAAAAAALL;
  id v25 = [v10 account];
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    if ([(SOSAccountTrustClassic *)self ensureFullPeerAvailable:v21[5] err:a6])
    {
      [(SOSAccountTrust *)self trustedCircle];
      if (SOSCircleCountPeers() && !sub_1002096CC((void *)v21[5]))
      {
        [(SOSAccountTrustClassic *)self setValueInExpansion:@"unsynced" value:kCFBooleanTrue err:0];
        if (v7)
        {
          [(SOSAccountTrust *)self trustedCircle];
          v27[3] = SOSCircleCopyiCloudFullPeerInfoRef();
        }
        id v13 = [[v21[5] circle_transport];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10020FAB0;
        v18[3] = &unk_100308D68;
        v18[4] = self;
        v18[5] = &v30;
        v18[8] = a6;
        v18[9] = a4;
        v18[6] = &v20;
        v18[7] = &v26;
        [(SOSAccountTrustClassic *)self modifyCircle:v13 err:a6 action:v18];

        if (v7 || sub_1001F7170((void *)v21[5]))
        {
          CFSetRef AllCurrent = (const __CFSet *)SOSViewsGetAllCurrent();
          sub_1001F74C8(v10, AllCurrent);
        }
      }
      else
      {
        BOOL v11 = sub_10000B070("resetToOffering");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resetting circle to offering since there are no peers", buf, 2u);
        }

        unsigned __int8 v12 = [(SOSAccountTrustClassic *)self resetCircleToOffering:v10 userKey:a4 err:a6];
        *((unsigned char *)v31 + 24) = v12;
      }
    }
  }
  else
  {
    SOSCreateErrorWithFormat();
  }
  id v15 = (const void *)v27[3];
  if (v15)
  {
    v27[3] = 0;
    CFRelease(v15);
  }
  char v16 = *((unsigned char *)v31 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v16;
}

- (BOOL)resetCircleToOffering:(id)a3 userKey:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  int v9 = [v8 account];
  if ([(SOSAccountTrustClassic *)self hasCircle:a5]
    && [(SOSAccountTrustClassic *)self ensureFullPeerAvailable:v9 err:a5])
  {
    [(SOSAccountTrustClassic *)self resetAllRings:v9 err:a5];
    id v10 = [v9 circle_transport];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10020FE00;
    v15[3] = &unk_100308D18;
    CFDictionaryRef v17 = a4;
    objc_super v18 = a5;
    v15[4] = self;
    id v11 = v9;
    id v16 = v11;
    [(SOSAccountTrustClassic *)self modifyCircle:v10 err:a5 action:v15];

    sub_1001F6D70(v11);
    CFSetRef AllCurrent = (const __CFSet *)SOSViewsGetAllCurrent();
    sub_1001F74C8(v8, AllCurrent);
    notify_post(kSOSCCCircleOctagonKeysChangedNotification);

    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)resetToOffering:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  [(SOSAccountTrustClassic *)self purgeIdentity];
  int v9 = sub_10000B070("resetToOffering");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resetting circle to offering by request from client", v12, 2u);
  }

  if (a4) {
    BOOL v10 = [(SOSAccountTrustClassic *)self resetCircleToOffering:v8 userKey:a4 err:a5];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)leaveCircle:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  BOOL v7 = sub_10000B070("circleOps");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Leaving circle by client request", buf, 2u);
  }

  id v8 = [v6 circle_transport];
  unsigned __int8 v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100210174;
  id v15 = &unk_100308CF0;
  id v16 = v6;
  CFDictionaryRef v17 = a4;
  id v9 = v6;
  BOOL v10 = [(SOSAccountTrustClassic *)self modifyCircle:v8 err:a4 action:&v12];

  [v9 setBackup_key:0, v12, v13, v14, v15];
  [(SOSAccountTrust *)self setDepartureCode:2];

  return v10;
}

- (BOOL)leaveCircleWithAccount:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  BOOL v7 = sub_10000B070("circleOps");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "leaveCircleWithAccount: Leaving circle by client request", buf, 2u);
  }

  id v8 = [v6 circle_transport];
  unsigned __int8 v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1002102A0;
  id v15 = &unk_100308CF0;
  id v16 = v6;
  CFDictionaryRef v17 = a4;
  id v9 = v6;
  BOOL v10 = [(SOSAccountTrustClassic *)self modifyCircle:v8 err:a4 action:&v12];

  -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 2, v12, v13, v14, v15);
  return v10;
}

- (void)forEachCirclePeerExceptMe:(id)a3
{
  id v4 = a3;
  if ([(SOSAccountTrust *)self trustedCircle] && [(SOSAccountTrust *)self peerInfo])
  {
    uint64_t v5 = [(SOSAccountTrust *)self peerID];
    [(SOSAccountTrust *)self trustedCircle];
    BOOL v7 = v5;
    id v8 = v4;
    id v6 = v5;
    SOSCircleForEachPeer();
  }
}

- (void)generationSignatureUpdateWith:(id)a3 key:(__SecKey *)a4
{
  id v6 = a3;
  BOOL v7 = [v6 trust];
  if ([v7 trustedCircle] && (sub_1001F0B4C(v6) & 1) != 0)
  {
    id v8 = [v6 trust];
    [v8 trustedCircle];
    [v6 accountKey];
    int v9 = SOSCircleVerify();

    if (v9)
    {
      BOOL v10 = sub_10000B070("updatingGenSignature");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "no change to userKey - skipping gensign", buf, 2u);
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  if ([(SOSAccountTrust *)self trustedCircle] && [(SOSAccountTrust *)self fullPeerInfo])
  {
    id v11 = [v6 circle_transport];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100210594;
    v12[3] = &unk_100308CA0;
    uint64_t v13 = v6;
    id v14 = self;
    id v15 = a4;
    [(SOSAccountTrustClassic *)self modifyCircle:v11 err:0 action:v12];

    BOOL v10 = v13;
LABEL_10:
  }
}

- (BOOL)fixICloudIdentities:(id)a3 circle:(__OpaqueSOSCircle *)a4
{
  id v6 = a3;
  BOOL v7 = (const void *)SOSCircleCopyiCloudFullPeerInfoRef();
  if (v7)
  {
    CFRelease(v7);
LABEL_21:
    LOBYTE(v13) = 0;
    goto LABEL_22;
  }
  sub_1001EE684(v6);
  if (!sub_1001EE508(v6) && !sub_1001EEE6C(v6, 0))
  {
    id v15 = +[SOSAnalytics logger];
    id v16 = v15;
    CFDictionaryRef v17 = &off_100327050;
    goto LABEL_20;
  }
  id v8 = sub_1001EE508(v6);
  if (!v8)
  {
    id v15 = +[SOSAnalytics logger];
    id v16 = v15;
    CFDictionaryRef v17 = &off_100327028;
LABEL_20:
    [v15 logHardFailureForEventNamed:@"iCloudIdentityFix" withAttributes:v17];

    goto LABEL_21;
  }
  id v9 = v8;
  BOOL v10 = [(SOSAccountTrustClassic *)self iCloudCleanerHandle:v6];
  if ([v10 checkDate])
  {
    id v11 = [v6 trust];
    [v11 fullPeerInfo];
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    cf[0] = _NSConcreteStackBlock;
    cf[1] = (CFTypeRef)3221225472;
    cf[2] = sub_1001E5B30;
    cf[3] = &unk_1003085A8;
    cf[4] = Mutable;
    SOSCircleForEachActivePeer();
    if (CFSetGetCount(Mutable) >= 1) {
      SOSCircleRemovePeers();
    }
    if (Mutable) {
      CFRelease(Mutable);
    }

    [v10 followup];
  }
  cf[0] = 0;
  BOOL v13 = [(SOSAccountTrustClassic *)self addiCloudIdentity:a4 key:v9 err:cf];
  if (v13)
  {
    [v6 setNotifyBackupOnExit:1];
    id v14 = +[SOSAnalytics logger];
    [v14 logSuccessForEventNamed:@"iCloudIdentityFix"];
  }
  else
  {
    id v14 = +[SOSAnalytics logger];
    [v14 logResultForEvent:@"iCloudIdentityFix" hardFailure:1 result:cf[0]];
  }

  CFTypeRef v18 = cf[0];
  if (cf[0])
  {
    cf[0] = 0;
    CFRelease(v18);
  }

LABEL_22:
  return v13;
}

- (BOOL)modifyCircle:(id)a3 err:(__CFError *)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = (unsigned int (**)(id, uint64_t))a5;
  if (![(SOSAccountTrust *)self trustedCircle])
  {
    SOSErrorCreate();
    goto LABEL_8;
  }
  [(SOSAccountTrust *)self trustedCircle];
  uint64_t v10 = SOSCircleCopyCircle();
  if (!v10)
  {
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_6;
  }
  id v11 = (const void *)v10;
  if (v9[2](v9, v10)) {
    BOOL v12 = [(SOSAccountTrustClassic *)self updateCircle:v8 newCircle:v11 err:a4];
  }
  else {
    BOOL v12 = 1;
  }
  CFRelease(v11);
LABEL_6:

  return v12;
}

- (BOOL)updateCircle:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5
{
  return [(SOSAccountTrustClassic *)self handleUpdateCircle:a4 transport:a3 update:1 err:a5];
}

- (BOOL)updateCircleFromRemote:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5
{
  return [(SOSAccountTrustClassic *)self handleUpdateCircle:a4 transport:a3 update:0 err:a5];
}

- (BOOL)handleUpdateCircle:(__OpaqueSOSCircle *)a3 transport:(id)a4 update:(BOOL)a5 err:(__CFError *)a6
{
  unsigned int v7 = a5;
  id v10 = a4;
  id v11 = v10;
  BOOL v12 = "remote";
  if (v7) {
    BOOL v12 = "local";
  }
  char v113 = v12;
  BOOL v13 = [v10 getAccount];
  id v14 = sub_10000B070("signing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v113;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "start:[%s]", buf, 0xCu);
  }

  if (![v13 accountKey] || (objc_msgSend(v13, "accountKeyIsTrusted") & 1) == 0)
  {
    SOSCreateError();
LABEL_14:
    LOBYTE(v16) = 0;
    goto LABEL_15;
  }
  if (!a3)
  {
    int v19 = sub_10000B070("SecError");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "##### Can't update to a NULL circle ######", buf, 2u);
    }
    goto LABEL_21;
  }
  if ((v7 & 1) == 0 && [(SOSAccountTrustClassic *)self checkForSponsorshipTrust:a3])
  {
    _os_activity_initiate((void *)&_mh_execute_header, "CloudCircle EnsurePeerRegistration", OS_ACTIVITY_FLAG_DEFAULT, &stru_1003093E8);
    id v15 = sub_10000B070("circleop");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting key_interests_need_updating to true in handleUpdateCircle", buf, 2u);
    }

    [v13 setKey_interests_need_updating:1];
    [v13 sosEvaluateIfNeeded];
    LOBYTE(v16) = 1;
    goto LABEL_15;
  }
  SOSCircleGetName();
  CFTypeRef v18 = [(SOSAccountTrust *)self trustedCircle];
  CFTypeRef cf = v18;
  if (!v18)
  {
    SOSCreateErrorWithFormat();
    int v19 = sub_10000B070("SecError");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "##### Can't replace circle - we don't care about it ######", buf, 2u);
    }
LABEL_21:

    goto LABEL_14;
  }
  CFTypeID v108 = CFGetTypeID(v18);
  uint64_t TypeID = SOSCircleGetTypeID();
  if (v108 == TypeID)
  {
    int v106 = 0;
  }
  else
  {
    int v106 = (__OpaqueSOSCircle *)SOSCircleCreate();
    CFTypeRef cf = v106;
  }
  id v20 = v13;
  int v21 = [v20 trust];
  uint64_t v22 = [v21 retirees];
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = sub_1001E54B0;
  v125 = (const char *)&unk_100307460;
  *(void *)&long long v126 = v22;
  *((void *)&v126 + 1) = v20;
  v127 = a3;
  id v23 = v20;
  id v24 = v22;
  SOSCircleForEachRetiredPeer();

  id v110 = v23;
  v111 = (__OpaqueSOSCircle *)SOSCircleCopyCircle();
  if ([v110 peerInfo]) {
    int HasApplicant = SOSCircleHasApplicant();
  }
  else {
    int HasApplicant = 0;
  }
  uint64_t v26 = [v110 trust];
  CFSetRef v27 = [v26 retirees];
  CFSetRef v28 = v27;
  if (v111)
  {
    CFTypeRef v114 = 0;
    uint64_t v115 = (uint64_t)&v114;
    uint64_t v116 = 0x2020000000;
    LOBYTE(v117) = 0;
    if (v27)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_1001E55F4;
      v125 = (const char *)&unk_1003087F0;
      *(void *)&long long v126 = &v114;
      *((void *)&v126 + 1) = v111;
      CFSetApplyFunction(v27, (CFSetApplierFunction)sub_1001DB1A8, buf);
      if (*(unsigned char *)(v115 + 24))
      {
        if (!SOSCircleCountPeers())
        {
          id v29 = sub_1001EE508(v110);
          if (HasApplicant)
          {
            id v30 = v29;
            if (!v29) {
              goto LABEL_44;
            }
            int v31 = sub_10000B070("resetToOffering");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v120 = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Reset to offering with last retirement and me as applicant", v120, 2u);
            }

            [v110 fullPeerInfo];
            if (SOSCircleResetToOffering()
              && ([v110 trust],
                  uint64_t v32 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v33 = [v32 addiCloudIdentity:v111 key:v30 err:a6],
                  v32,
                  (v33 & 1) != 0))
            {
              [v110 setNotifyBackupOnExit:1];
            }
            else
            {
LABEL_44:
              CFRelease(v111);
              v111 = 0;
            }
          }
          else
          {
            int v34 = sub_10000B070("circleOps");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v120 = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Reset to empty with last retirement", v120, 2u);
            }

            SOSCircleResetToEmpty();
          }
        }
      }
    }
    _Block_object_dispose(&v114, 8);
  }
  else
  {
    v111 = 0;
  }

  if (!v111) {
    goto LABEL_14;
  }
  BOOL v105 = [(SOSAccountTrust *)self fullPeerInfo];
  CFTypeRef cf2 = (CFTypeRef)SOSFullPeerInfoGetPeerInfo();
  uint64_t PeerID = SOSPeerInfoGetPeerID();
  CFStringRef v36 = @"No Peer";
  if (PeerID) {
    CFStringRef v36 = (const __CFString *)PeerID;
  }
  CFStringRef v102 = v36;
  if (cf2) {
    v7 |= SOSCircleUpdatePeerInfo();
  }
  [v110 accountKey];
  if (SOSCircleVerify())
  {
    CFDictionaryRef v37 = (const char *)[v110 accountKey];
LABEL_56:
    OSStatus v38 = v37;
    goto LABEL_58;
  }
  if ([v110 previousAccountKey])
  {
    [v110 previousAccountKey];
    if (SOSCircleVerify())
    {
      CFDictionaryRef v37 = (const char *)[v110 previousAccountKey];
      goto LABEL_56;
    }
  }
  OSStatus v38 = 0;
LABEL_58:
  BOOL v40 = v108 == TypeID && v38 != 0;
  [v110 accountKey];
  int v41 = SOSCircleConcordanceTrust();
  CFStringRef v42 = @"Trusted";
  int v43 = 1;
  int v44 = 1;
  switch(v41)
  {
    case 0:
      break;
    case 1:
      if (v40) {
        int v43 = 3;
      }
      else {
        int v43 = 4;
      }
      CFStringRef v42 = @"Generation Old";
      break;
    case 2:
      if (v40) {
        int v43 = 3;
      }
      else {
        int v43 = 0;
      }
      CFStringRef v42 = @"No User Signature";
      break;
    case 3:
      v99 = sub_10000B070("SecError");
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "##### No User Public Key Available, this shouldn't ever happen!!!", buf, 2u);
      }

      abort();
    case 4:
      CFStringRef v42 = @"No trusted peer left";
      int v44 = 4;
      int v43 = 2;
      break;
    case 5:
    case 6:
      if (v40) {
        int v43 = 3;
      }
      else {
        int v43 = 0;
      }
      CFStringRef v42 = @"Bad Signature";
      break;
    case 7:
      CFStringRef v45 = sub_10000B070("signing");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "##### No trusted peer signature found, accepting hoping for concordance later", buf, 2u);
      }

      int v43 = 0;
      CFStringRef v42 = @"No trusted peer signature";
      int v44 = 1;
      break;
    default:
      unsigned int v100 = sub_10000B070("SecError");
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "##### Bad Error Return from ConcordanceTrust", buf, 2u);
      }

      abort();
  }
  unsigned int v101 = v44;
  CFStringRef v104 = v42;
  CFStringRef v46 = sub_10000B070("signing");
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = off_100308C70[v43];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v47;
    v48 = "trusted";
    *(_WORD *)&buf[12] = 2112;
    if (!v40) {
      v48 = "untrusted";
    }
    *(void *)&buf[14] = v104;
    *(_WORD *)&buf[22] = 2080;
    v125 = v48;
    LOWORD(v126) = 2112;
    *(void *)((char *)&v126 + 2) = v102;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Decided on action [%s] based on concordance state [%@] and [%s] circle.  My PeerID is %@", buf, 0x2Au);
  }

  LOBYTE(v16) = 1;
  v103 = 0;
  switch(v43)
  {
    case 0:
      goto LABEL_118;
    case 1:
      if (!cf2 || !SOSCircleHasPeer())
      {
        CFDataRef v58 = sub_10000B070("signing");
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Not countersigning, not in new circle", buf, 2u);
        }

        v59 = [v110 trust];
        [v59 resetRingDictionary];

        goto LABEL_117;
      }
      if (SOSCircleVerifyPeerSigned())
      {
        CFStringRef v49 = sub_10000B070("signing");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Already concur with the new circle", buf, 2u);
        }

        goto LABEL_117;
      }
      CFTypeRef v114 = 0;
      if (v105 && SOSCircleConcordanceSign())
      {
        uint64_t v78 = sub_10000B070("signing");
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Concurred with new circle", buf, 2u);
        }
        v103 = v111;
      }
      else
      {
        uint64_t v78 = sub_10000B070("SecError");
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v114;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Failed to concurrence sign, error: %@", buf, 0xCu);
        }
        v103 = 0;
        LOBYTE(v16) = 0;
      }

      if (v114) {
        CFRelease(v114);
      }
      goto LABEL_118;
    case 2:
      if (cf2 && SOSCircleHasPeer())
      {
        int v50 = sub_10000B070("account");
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = cf2;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Leaving circle with peer %@", buf, 0xCu);
        }

        debugDumpCircle();
        debugDumpCircle();
        debugDumpCircle();
        v51 = sub_10000B070("account");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          id v52 = [v110 accountKey];
          id v53 = [v110 previousAccountKey];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v52;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v53;
          *(_WORD *)&buf[22] = 2112;
          v125 = v38;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Key state: accountKey %@, previousAccountKey %@, old_circle_key %@", buf, 0x20u);
        }

        int v16 = sub_1001E56E0(v110, (uint64_t)v111);
        if (v16)
        {
          v54 = sub_10000B070("circleOps");
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Leaving circle by newcircle state", buf, 2u);
          }
          v103 = v111;
        }
        else
        {
          v54 = sub_10000B070("signing");
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Can't leave circle, but dumping identities", buf, 2u);
          }
          v103 = 0;
        }

        [(SOSAccountTrust *)self setDepartureCode:v101];
        CFTypeRef cf2 = 0;
      }
      else
      {
        BOOL v57 = sub_10000B070("signing");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "We are not in this circle, but we need to update account with it", buf, 2u);
        }

        debugDumpCircle();
        debugDumpCircle();
        debugDumpCircle();
LABEL_117:
        v103 = 0;
      }
LABEL_118:
      *(void *)id v120 = 0;
      CFTypeRef v121 = v120;
      uint64_t v122 = 0x2020000000;
      char v123 = 0;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_1002123E8;
      v125 = (const char *)&unk_100308D90;
      v60 = cf;
      *(void *)&long long v126 = v120;
      *((void *)&v126 + 1) = v111;
      SOSCircleForEachPeer();
      CFTypeRef v114 = _NSConcreteStackBlock;
      uint64_t v115 = 3221225472;
      uint64_t v116 = (uint64_t)sub_10021247C;
      v117 = &unk_100308D90;
      v118 = v120;
      id v119 = cf;
      SOSCircleForEachPeer();
      int v61 = v121[24];
      _Block_object_dispose(v120, 8);
      if (v61)
      {
        v62 = sub_10000B070("circleOps");
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Sending kSOSCCCircleOctagonKeysChangedNotification", buf, 2u);
        }

        notify_post(kSOSCCCircleOctagonKeysChangedNotification);
        v60 = cf;
      }
      if (!cf2)
      {
        char v70 = 1;
        goto LABEL_182;
      }
      if (SOSCircleHasActivePeer() && (SOSCircleHasPeer() & 1) == 0)
      {
        if (![(SOSAccountTrustClassic *)self hasLeft]) {
          [(SOSAccountTrust *)self setDepartureCode:3];
        }
        v63 = sub_10000B070("circleOps");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v64 = [(SOSAccountTrust *)self departureCode];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v64;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Member of old circle but not of new circle (%d)", buf, 8u);
        }

        [v110 accountKey];
        SOSCircleLogState();
        [v110 accountKey];
        SOSCircleLogState();
      }
      if (SOSCircleHasActivePeer()
        && (SOSCircleCountPeers() != 1 || (SOSCircleHasPeer() & 1) == 0)
        && (SOSCircleHasPeer() & 1) == 0
        && (SOSCircleHasApplicant() & 1) == 0)
      {
        BOOL v75 = sub_10000B070("circle");
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v76 = SOSPeerInfoGetPeerID();
          uint64_t Name = SOSCircleGetName();
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v76;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = Name;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Purging my peer (ID: %@) for circle '%@'!!!", buf, 0x16u);
        }

        [(SOSAccountTrustClassic *)self purgeIdentity];
        goto LABEL_156;
      }
      if (SOSCircleHasRejectedApplicant())
      {
        BOOL v65 = (const void *)SOSCircleCopyRejectedApplicant();
        v66 = v65;
        if (v65)
        {
          if (CFEqual(v65, cf2))
          {
            [v110 accountKey];
            if (SOSPeerInfoApplicationVerify())
            {
              char v67 = sub_10000B070("circle");
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v68 = SOSPeerInfoGetPeerID();
                uint64_t v69 = SOSCircleGetName();
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v68;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v69;
                _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Rejected, Purging my applicant peer (ID: %@) for circle '%@'", buf, 0x16u);
              }

              debugDumpCircle();
              debugDumpCircle();
              [(SOSAccountTrustClassic *)self purgeIdentity];
              CFRelease(v66);
LABEL_156:
              char v70 = 1;
              goto LABEL_181;
            }
          }
        }
        v71 = sub_10000B070("circle");
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v72 = SOSPeerInfoGetPeerID();
          uint64_t v73 = SOSCircleGetName();
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v72;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v73;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Rejected, Reapplying (ID: %@) for circle '%@'", buf, 0x16u);
        }

        debugDumpCircle();
        debugDumpCircle();
        [v110 accountKey];
        SOSCircleRequestReadmission();
        if (v66) {
          CFRelease(v66);
        }
        unsigned int v7 = 1;
      }
      if (![v110 accountKeyIsTrusted] || !SOSCircleHasPeer()) {
        goto LABEL_180;
      }
      v74 = [(SOSAccountTrustClassic *)self iCloudCheckEventHandle:v110];
      if (![v74 checkDate]) {
        goto LABEL_179;
      }
      if (v7)
      {
        unsigned int v7 = 1;
        goto LABEL_178;
      }
      unsigned int v7 = [(SOSAccountTrustClassic *)self fixICloudIdentities:v110 circle:v111];
      CFDataRef v79 = sub_10000B070("circleOps");
      BOOL v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (!v80) {
          goto LABEL_177;
        }
        *(_WORD *)buf = 0;
        BOOL v81 = "Fixed iCloud Identity in circle";
      }
      else
      {
        if (!v80) {
          goto LABEL_177;
        }
        *(_WORD *)buf = 0;
        BOOL v81 = "Failed to fix broken icloud identity";
      }
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, v81, buf, 2u);
LABEL_177:

LABEL_178:
      [v74 followup];
LABEL_179:

LABEL_180:
      char v70 = 0;
LABEL_181:
      v60 = cf;
LABEL_182:
      if (v60) {
        CFRetain(cf);
      }
      [v110 setPreviousAccountKey:[v110 accountKey]];
      v82 = sub_10000B070("signing");
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v104;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%@, Accepting new circle", buf, 0xCu);
      }

      [(SOSAccountTrust *)self setTrustedCircle:v111];
      [v110 sosEvaluateIfNeeded];
      if ((v70 & 1) == 0)
      {
        if ([v110 accountKeyIsTrusted]
          && SOSCircleHasApplicant()
          && (int)SOSCircleCountPeers() >= 1
          && (SOSCircleHasPeer() & 1) == 0
          && (SOSCircleHasApplicant() & 1) == 0)
        {
          BOOL v83 = sub_10000B070("signing");
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "requesting readmission to new circle", buf, 2u);
          }

          [v110 accountKey];
          v7 |= SOSCircleRequestReadmission();
        }
        if (SOSCircleHasActivePeer())
        {
          v84 = [v110 trust];
          [v84 cleanupRetirementTickets:v110 circle:cf time:86400 err:0];
        }
      }
      id v85 = v110;
      [v85 setCircle_rings_retirements_need_attention:1];
      CFSetRef v86 = (const __CFSet *)SOSCircleCopyPeers();
      CFSetRef v87 = (const __CFSet *)SOSCircleCopyPeers();
      v88 = (const void *)SOSCircleCopyApplicants();
      v89 = (__OpaqueSOSCircle *)SOSCircleCopyApplicants();
      id v90 = [v85 peerInfo];
      if (v90 && CFSetContainsValue(v87, v90)) {
        sub_1001FF4C0(v85, @"EscrowRecord", (uint64_t)kCFNull, 0);
      }
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_1001F68E0;
      v125 = (const char *)&unk_100307F48;
      *((void *)&v126 + 1) = v88;
      v127 = v89;
      id v91 = v85;
      *(void *)&long long v126 = v91;
      uint64_t v128 = v111;
      sub_1001F6994(v86, v87, buf);
      if (v88) {
        CFRelease(v88);
      }
      if (v89) {
        CFRelease(v89);
      }
      if (v86) {
        CFRelease(v86);
      }
      if (v87) {
        CFRelease(v87);
      }

      if (cf) {
        CFRelease(cf);
      }
      v92 = v111;
      if (!v7) {
        v92 = v103;
      }
      CFTypeRef cf = v92;
      v93 = sub_10000B070("circleop");
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Setting key_interests_need_updating to true in handleUpdateCircle", buf, 2u);
      }

      [v91 setKey_interests_need_updating:1];
LABEL_215:
      if (cf)
      {
        char v94 = sub_10000B070("signing");
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = v113;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Pushing:[%s]", buf, 0xCu);
        }

        v95 = (const void *)SOSCircleCopyEncodedData();
        if (v95)
        {
          [v110 setCircle_rings_retirements_need_attention:1];
          unsigned __int8 v96 = [v11 postCircle:SOSCircleGetName() circleData:v95 err:a6];
          CFRelease(v95);
          LOBYTE(v16) = v16 & v96;
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
LABEL_221:
      CFRelease(v111);
      if (v106) {
        CFRelease(v106);
      }
      char v97 = v16 ^ 1;
      if (!a6) {
        char v97 = 1;
      }
      if ((v97 & 1) == 0)
      {
        v98 = *a6;
        if (*a6)
        {
          *a6 = 0;
          CFRelease(v98);
        }
      }
      [v110 sosEvaluateIfNeeded];
LABEL_15:

      return v16;
    case 3:
      if (v108 == TypeID && cf2 && SOSCircleHasActivePeer())
      {
        CFMutableSetRef v55 = sub_10000B070("signing");
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v104;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%@, Rejecting new circle, re-publishing old circle", buf, 0xCu);
        }

        [(SOSAccountTrust *)self setTrustedCircle:cf];
        [v110 sosEvaluateIfNeeded];
        goto LABEL_215;
      }
      v56 = sub_10000B070("canary");
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v104;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@, Rejecting: new circle Have no old circle - would reset", buf, 0xCu);
      }

      goto LABEL_221;
    default:
      goto LABEL_221;
  }
}

- (id)iCloudCleanerHandle:(id)a3
{
  id v3 = a3;
  id v4 = [SOSIntervalEvent alloc];
  uint64_t v5 = [v3 settings];

  id v6 = [(SOSIntervalEvent *)v4 initWithDefaults:v5 dateDescription:@"iCloudCleanerCheck" earliest:432000.0 latest:604800.0];

  return v6;
}

- (id)iCloudCheckEventHandle:(id)a3
{
  id v3 = a3;
  id v4 = [SOSIntervalEvent alloc];
  uint64_t v5 = [v3 settings];

  id v6 = [(SOSIntervalEvent *)v4 initWithDefaults:v5 dateDescription:@"iCloudIDCheck" earliest:86400.0 latest:129600.0];

  return v6;
}

- (BOOL)checkForSponsorshipTrust:(__OpaqueSOSCircle *)a3
{
  uint64_t v5 = [(SOSAccountTrust *)self trustedCircle];
  if (!a3 || !v5)
  {
    if (v5 != a3) {
      goto LABEL_6;
    }
    return 0;
  }
  if (CFEqual(v5, a3)) {
    return 0;
  }
LABEL_6:
  [(SOSAccountTrust *)self fullPeerInfo];
  uint64_t v6 = SOSFullPeerInfoCopyPubKey();
  if (!v6) {
    return 0;
  }
  unsigned int v7 = (const void *)v6;
  if (SOSCircleVerify()
    && ([(SOSAccountTrust *)self trustedCircle], SOSCircleIsOlderGeneration()))
  {
    [(SOSAccountTrust *)self setTrustedCircle:a3];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v7);
  return v8;
}

- (BOOL)ghostBustingOK:(__OpaqueSOSCircle *)a3 updatingTo:(__OpaqueSOSCircle *)a4
{
  if (![(SOSAccountTrust *)self fullPeerInfo]
    || !SOSFullPeerInfoGetPeerInfo()
    || (SOSCircleHasPeer() & 1) == 0 && !SOSCircleHasApplicant())
  {
    return 0;
  }
  uint64_t PeerID = (const void *)SOSPeerInfoGetPeerID();
  CFDictionaryRef v5 = (const __CFDictionary *)SOSCircleCopyAllSignatures();
  CFIndex CountOfKey = CFDictionaryGetCountOfKey(v5, PeerID);
  CFIndex Count = CFDictionaryGetCount(v5);
  char HasPeer = SOSCircleHasPeer();
  BOOL v9 = Count - 2 > 1;
  if (!CountOfKey) {
    BOOL v9 = 1;
  }
  BOOL v10 = (HasPeer & 1) != 0 || v9;
  if (v5) {
    CFRelease(v5);
  }
  return v10;
}

- (BOOL)hasLeft
{
  unsigned int v2 = [(SOSAccountTrust *)self departureCode];
  return (v2 < 8) & (0xDCu >> v2);
}

- (__OpaqueSOSCircle)ensureCircle:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5
{
  id v6 = a3;
  if (![(SOSAccountTrust *)self trustedCircle])
  {
    unsigned int v7 = (const void *)SOSCircleCreate();
    [(SOSAccountTrust *)self setTrustedCircle:v7];
    if (v7) {
      CFRelease(v7);
    }
    BOOL v8 = sub_10000B070("circleop");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting key_interests_need_updating to true in ensureCircle", v11, 2u);
    }

    [v6 setKey_interests_need_updating:1];
  }
  [(SOSAccountTrust *)self trustedCircle];
  BOOL v9 = [(SOSAccountTrust *)self trustedCircle];

  return v9;
}

- (__OpaqueSOSCircle)getCircle:(__CFError *)a3
{
  id v3 = [(SOSAccountTrust *)self trustedCircle];
  id v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNullGetTypeID())
    {
      SOSCreateError();
      return 0;
    }
  }
  return v4;
}

- (int)getCircleStatusOnly:(__CFError *)a3
{
  id v4 = [(SOSAccountTrust *)self trustedCircle];
  CFTypeID v5 = [(SOSAccountTrust *)self peerInfo];

  return [(SOSAccountTrustClassic *)self thisDeviceStatusInCircle:v4 peer:v5];
}

- (int)thisDeviceStatusInCircle:(__OpaqueSOSCircle *)a3 peer:(__OpaqueSOSPeerInfo *)a4
{
  if (!a3) {
    return 1;
  }
  if (!SOSCircleCountPeers()) {
    return 3;
  }
  if (!a4 || (SOSPeerInfoIsRetirementTicket() & 1) != 0) {
    return 1;
  }
  if (SOSCircleHasPeer()) {
    return 0;
  }
  if ((SOSCircleHasApplicant() & 1) == 0) {
    return 1;
  }
  return 2;
}

- (BOOL)hasCircle:(__CFError *)a3
{
  if (![(SOSAccountTrust *)self trustedCircle]) {
    SOSCreateErrorWithFormat();
  }
  return [(SOSAccountTrust *)self trustedCircle] != 0;
}

- (BOOL)isInCircleOnly:(__CFError *)a3
{
  unsigned int v3 = -[SOSAccountTrustClassic getCircleStatusOnly:](self, "getCircleStatusOnly:");
  if (v3) {
    SOSErrorCreate();
  }
  return v3 == 0;
}

- (void)purgeIdentity
{
  if ([(SOSAccountTrust *)self fullPeerInfo])
  {
    [(SOSAccountTrust *)self fullPeerInfo];
    if ((SOSFullPeerInfoPurgePersistentKey() & 1) == 0)
    {
      unsigned int v3 = sub_10000B070("SecWarning");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFTypeID v5 = [(SOSAccountTrust *)self fullPeerInfo];
        __int16 v6 = 2112;
        uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Couldn't purge persistent keys for %@ [%@]", buf, 0x16u);
      }
    }
    [(SOSAccountTrust *)self setFullPeerInfo:0];
  }
}

- (BOOL)isMyPeerActive:(__CFError *)a3
{
  id v4 = [(SOSAccountTrust *)self peerInfo];
  if (v4)
  {
    [(SOSAccountTrust *)self trustedCircle];
    [(SOSAccountTrust *)self peerInfo];
    LOBYTE(v4) = SOSCircleHasActivePeer();
  }
  return (char)v4;
}

- (BOOL)ensureFullPeerAvailable:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  if (![(SOSAccountTrust *)self trustedCircle])
  {
    SOSCreateErrorWithFormat();
    goto LABEL_64;
  }
  if (![(SOSAccountTrust *)self fullPeerInfo]
    || ([(SOSAccountTrust *)self fullPeerInfo], (SOSFullPeerInfoPrivKeyExists() & 1) == 0))
  {
    if ([(SOSAccountTrust *)self fullPeerInfo])
    {
      uint64_t v7 = sub_10000B070("circleOps");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FullPeerInfo has no matching private key - resetting FPI and attendant keys", (uint8_t *)&buf, 2u);
      }

      fulluint64_t PeerInfo = self->super.fullPeerInfo;
      if (fullPeerInfo)
      {
        self->super.fulluint64_t PeerInfo = 0;
        CFRelease(fullPeerInfo);
      }
      peerInfo = self->super.peerInfo;
      if (peerInfo)
      {
        self->super.peerInfo = 0;
        CFRelease(peerInfo);
      }
      cachedOctagonSigningKey = self->super._cachedOctagonSigningKey;
      if (cachedOctagonSigningKey)
      {
        self->super._cachedOctagonSigningKey = 0;
        CFRelease(cachedOctagonSigningKey);
      }
      cachedOctagonEncryptionKey = self->super._cachedOctagonEncryptionKey;
      if (cachedOctagonEncryptionKey)
      {
        self->super._cachedOctagonEncryptionKey = 0;
        CFRelease(cachedOctagonEncryptionKey);
      }
    }
    v48 = a4;
    [(SOSAccountTrust *)self trustedCircle];
    uint64_t Name = SOSCircleGetName();
    BOOL v13 = [v6 gestalt];
    uint64_t v14 = SOSPeerGestaltGetName();
    CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"ID for %@-%@", v14, Name);

    CFStringRef v49 = [(SOSAccountTrustClassic *)self randomPermanentFullECKey:256 name:v15 error:0];
    int v16 = [@"Octagon Peer Signing " stringByAppendingString:v15];
    if ([v6 octagonSigningFullKeyRef])
    {
      CFDictionaryRef v17 = (__SecKey *)[v6 octagonSigningFullKeyRef];
      CFTypeRef v18 = v17;
      if (v17) {
        CFRetain(v17);
      }
    }
    else
    {
      CFTypeRef v18 = [(SOSAccountTrustClassic *)self randomPermanentFullECKey:384 name:v16 error:0];
    }
    uint64_t v19 = [@"Octagon Peer Encryption " stringByAppendingString:v15];

    v47 = (void *)v19;
    if ([v6 octagonEncryptionFullKeyRef])
    {
      id v20 = (__SecKey *)[v6 octagonEncryptionFullKeyRef];
      int v21 = v20;
      if (!v20)
      {
        BOOL v24 = 0;
        BOOL v22 = v49 != 0;
        BOOL v23 = v18 != 0;
        goto LABEL_50;
      }
      CFRetain(v20);
    }
    else
    {
      int v21 = [(SOSAccountTrustClassic *)self randomPermanentFullECKey:384 name:v19 error:0];
    }
    BOOL v22 = v49 != 0;
    BOOL v23 = v18 != 0;
    BOOL v24 = v21 != 0;
    if (v49 && v18 && v21)
    {
      CFStringRef v43 = v15;
      CFSetRef v25 = (const __CFSet *)SOSViewCopyViewSet();
      CFSetRef v26 = (const __CFSet *)SOSViewCopyViewSet();
      uint64_t v27 = SOSViewCopyViewSet();
      CFSetRef v28 = (const __CFSet *)SOSViewCopyViewSet();
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v51 = sub_100233924;
      id v52 = &unk_100309D30;
      CFTypeRef v45 = (CFTypeRef)v27;
      CFSetRef theSet = v26;
      CFSetRef v53 = v26;
      CFSetRef v29 = (const __CFSet *)v27;
      CFSetRef v30 = v25;
      CFSetApplyFunction(v29, (CFSetApplierFunction)sub_10023392C, &buf);
      CFIndex Count = CFSetGetCount(v25);
      if (!Count)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v51 = sub_100233924;
        id v52 = &unk_100309D30;
        CFSetRef v53 = v25;
        CFSetApplyFunction(v26, (CFSetApplierFunction)sub_10023392C, &buf);
      }
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v51 = sub_100233924;
      id v52 = &unk_100309D30;
      CFSetRef v53 = v25;
      CFSetRef cf = v28;
      CFSetApplyFunction(v28, (CFSetApplierFunction)sub_10023392C, &buf);
      [(SOSAccountTrust *)self setFullPeerInfo:0];
      int v31 = [v6 gestalt];
      uint64_t v32 = [v6 backup_key];
      unsigned __int8 v33 = (const void *)SOSFullPeerInfoCreateWithViews();

      -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", v33, v48);
      int v34 = (const void *)SOSFullPeerInfoCopyPubKey();
      [v6 setPeerPublicKey:v34];
      if (v34) {
        CFRelease(v34);
      }
      CFStringRef v15 = v43;
      if (![v6 peerPublicKey])
      {
        int v35 = sub_10000B070("circleOp");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to copy peer public key for account object", (uint8_t *)&buf, 2u);
        }
      }
      if (v33) {
        CFRelease(v33);
      }
      CFStringRef v36 = v47;
      if ([(SOSAccountTrustClassic *)self getValueFromExpansion:@"v2dictionary" err:0])
      {
        [(SOSAccountTrust *)self fullPeerInfo];
        SOSFullPeerInfoUpdateV2Dictionary();
      }
      if (Count)
      {
        [(SOSAccountTrustClassic *)self pendEnableViewSet:theSet];
        [(SOSAccountTrustClassic *)self setValueInExpansion:@"unsynced" value:kCFBooleanTrue err:0];
      }
      if (v30) {
        CFRelease(v30);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (theSet) {
        CFRelease(theSet);
      }
      if (v45) {
        CFRelease(v45);
      }
      CFRelease(v49);
      CFRelease(v18);
      goto LABEL_60;
    }
LABEL_50:
    CFDictionaryRef v37 = sub_10000B070("SecError");
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    v39 = v48;
    if (v38)
    {
      if (v48) {
        v39 = *v48;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "No full_key: %@:", (uint8_t *)&buf, 0xCu);
    }

    if (v22)
    {
      CFRelease(v49);
      if (!v23)
      {
LABEL_59:
        CFStringRef v36 = v47;
        if (!v24)
        {
LABEL_61:
          if (v15) {
            CFRelease(v15);
          }

          goto LABEL_64;
        }
LABEL_60:
        CFRelease(v21);
        goto LABEL_61;
      }
    }
    else if (!v23)
    {
      goto LABEL_59;
    }
    CFRelease(v18);
    goto LABEL_59;
  }
LABEL_64:
  BOOL v40 = [(SOSAccountTrust *)self fullPeerInfo] != 0;

  return v40;
}

- (void)ensureOctagonPeerKeys:(id)a3
{
  id v4 = a3;
  if ([(SOSAccountTrustClassic *)self haveConfirmedOctagonKeys]) {
    goto LABEL_75;
  }
  CFErrorRef err = 0;
  [(SOSAccountTrust *)self fullPeerInfo];
  CFTypeID v5 = (__SecKey *)SOSFullPeerInfoCopyOctagonSigningKey();
  if (v5)
  {
    id v6 = sub_10000B070("circleChange");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Already have Octagon signing key", buf, 2u);
    }

    cachedOctagonSigningKey = self->super._cachedOctagonSigningKey;
    if (cachedOctagonSigningKey)
    {
      self->super._cachedOctagonSigningKey = 0;
      CFRelease(cachedOctagonSigningKey);
    }
    BOOL v8 = SecKeyCopyPublicKey(v5);
    self->super._cachedOctagonSigningKey = v8;
    sub_10022D980((uint64_t)v8, kSOSInternalAccessGroup);
  }
  else
  {
    if (![(SOSAccountTrustClassic *)self isLockedError:err])
    {
      BOOL v9 = sub_10000B070("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFDictionaryRef v37 = err;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "error is too scary, not creating new Octagon signing key: %@", buf, 0xCu);
      }

      BOOL v10 = +[SOSAnalytics logger];
      [v10 logResultForEvent:@"SOSCheckOctagonSigningKey" hardFailure:1 result:err];
    }
    CFTypeID v5 = 0;
  }
  int v11 = 0;
  BOOL v12 = 0;
  CFErrorRef v13 = err;
  if (err)
  {
    CFErrorRef err = 0;
    CFRelease(v13);
  }
  if (v5) {
    CFRelease(v5);
  }
  CFErrorRef v14 = err;
  if (err)
  {
    CFErrorRef err = 0;
    CFRelease(v14);
  }
  [(SOSAccountTrust *)self fullPeerInfo];
  CFStringRef v15 = (__SecKey *)SOSFullPeerInfoCopyOctagonEncryptionKey();
  if (err && !-[SOSAccountTrustClassic isLockedError:](self, "isLockedError:"))
  {
    int v16 = sub_10000B070("SecError");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFDictionaryRef v37 = err;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "circleChange: Error fetching Octagon encryption key: %@", buf, 0xCu);
    }
  }
  if (!v15)
  {
    if (!err) {
      goto LABEL_54;
    }
    CFErrorDomain Domain = CFErrorGetDomain(err);
    if (Domain && kCFErrorDomainOSStatus)
    {
      if (!CFEqual(Domain, kCFErrorDomainOSStatus))
      {
LABEL_37:
        CFErrorDomain v21 = CFErrorGetDomain(err);
        if (kCFErrorDomainOSStatus && v21)
        {
          if (!CFEqual(v21, kCFErrorDomainOSStatus))
          {
LABEL_43:
            CFErrorDomain v22 = CFErrorGetDomain(err);
            if (kCFErrorDomainOSStatus && v22)
            {
              if (!CFEqual(v22, kCFErrorDomainOSStatus)) {
                goto LABEL_54;
              }
            }
            else if (v22 != kCFErrorDomainOSStatus)
            {
              goto LABEL_54;
            }
            if (CFErrorGetCode(err) == -50) {
              goto LABEL_49;
            }
LABEL_54:
            if (![(SOSAccountTrustClassic *)self isLockedError:err])
            {
              CFSetRef v29 = sub_10000B070("SecError");
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                CFDictionaryRef v37 = err;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "error is too scary, not creating new Octagon encryption key: %@", buf, 0xCu);
              }

              CFSetRef v30 = +[SOSAnalytics logger];
              [v30 logResultForEvent:@"SOSCheckOctagonEncryptionKey" hardFailure:1 result:err];
            }
            CFStringRef v15 = 0;
            goto LABEL_68;
          }
        }
        else if (v21 != kCFErrorDomainOSStatus)
        {
          goto LABEL_43;
        }
        if (CFErrorGetCode(err) != -26275) {
          goto LABEL_43;
        }
LABEL_49:
        [(SOSAccountTrust *)self trustedCircle];
        uint64_t v23 = +[NSString stringWithFormat:@"Octagon Peer Encryption ID for %@", SOSCircleGetName()];

        CFTypeRef cf = 0;
        BOOL v24 = [(SOSAccountTrustClassic *)self randomPermanentFullECKey:384 name:v23 error:&cf];
        CFStringRef v15 = v24;
        if (cf || !v24)
        {
          CFSetRef v25 = sub_10000B070("SecError");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFDictionaryRef v37 = (void *)cf;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "circleChange: Error creating Octagon encryption key: %@", buf, 0xCu);
          }
          goto LABEL_65;
        }
        [(SOSAccountTrust *)self fullPeerInfo];
        SOSFullPeerInfoUpdateOctagonEncryptionKey();
        if (cf)
        {
          CFSetRef v25 = sub_10000B070("SecError");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFDictionaryRef v37 = (void *)cf;
            CFSetRef v26 = "circleChange: Error upgrading Octagon encryption key: %@";
            uint64_t v27 = v25;
            uint32_t v28 = 12;
LABEL_63:
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
          }
        }
        else
        {
          CFSetRef v25 = sub_10000B070("circleChange");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            CFSetRef v26 = "Successfully created new Octagon encryption key";
            uint64_t v27 = v25;
            uint32_t v28 = 2;
            goto LABEL_63;
          }
        }
        int v11 = 1;
LABEL_65:

        CFTypeRef v31 = cf;
        if (cf)
        {
          CFTypeRef cf = 0;
          CFRelease(v31);
        }
        BOOL v12 = (void *)v23;
        goto LABEL_68;
      }
    }
    else if (Domain != kCFErrorDomainOSStatus)
    {
      goto LABEL_37;
    }
    if (CFErrorGetCode(err) == -25300) {
      goto LABEL_49;
    }
    goto LABEL_37;
  }
  CFDictionaryRef v17 = sub_10000B070("circleChange");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Already have Octagon encryption key", buf, 2u);
  }

  cachedOctagonEncryptionKey = self->super._cachedOctagonEncryptionKey;
  if (cachedOctagonEncryptionKey)
  {
    self->super._cachedOctagonEncryptionKey = 0;
    CFRelease(cachedOctagonEncryptionKey);
  }
  uint64_t v19 = SecKeyCopyPublicKey(v15);
  self->super._cachedOctagonEncryptionKey = v19;
  sub_10022D980((uint64_t)v19, kSOSInternalAccessGroup);
LABEL_68:
  CFErrorRef v32 = err;
  if (err)
  {
    CFErrorRef err = 0;
    CFRelease(v32);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v11)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100234248;
    v33[3] = &unk_100309D10;
    v33[4] = self;
    [(SOSAccountTrustClassic *)self modifyCircle:v4 err:0 action:v33];
  }

LABEL_75:
}

- (BOOL)haveConfirmedOctagonKeys
{
  [(SOSAccountTrust *)self fullPeerInfo];
  unsigned int v3 = (__SecKey *)SOSFullPeerInfoCopyOctagonPublicSigningKey();
  if ([(SOSAccountTrust *)self cachedOctagonSigningKey])
  {
    id v4 = [(SOSAccountTrust *)self cachedOctagonSigningKey];
    if (v3 && v4)
    {
      if (CFEqual(v3, v4))
      {
LABEL_5:
        char v5 = 1;
        goto LABEL_10;
      }
    }
    else if (v3 == v4)
    {
      goto LABEL_5;
    }
  }
  id v6 = sub_10000B070("SecError");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "circleChange: No extant octagon signing key", buf, 2u);
  }

  char v5 = 0;
LABEL_10:
  [(SOSAccountTrust *)self fullPeerInfo];
  uint64_t v7 = (__SecKey *)SOSFullPeerInfoCopyOctagonPublicEncryptionKey();
  if ([(SOSAccountTrust *)self cachedOctagonEncryptionKey])
  {
    BOOL v8 = [(SOSAccountTrust *)self cachedOctagonEncryptionKey];
    if (v7 && v8)
    {
      if (CFEqual(v7, v8)) {
        goto LABEL_14;
      }
    }
    else if (v7 == v8)
    {
LABEL_14:
      char v9 = 1;
      if (!v3) {
        goto LABEL_21;
      }
LABEL_20:
      CFRelease(v3);
      goto LABEL_21;
    }
  }
  BOOL v10 = sub_10000B070("SecError");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "circleChange: No extant octagon encryption key", v12, 2u);
  }

  char v9 = 0;
  if (v3) {
    goto LABEL_20;
  }
LABEL_21:
  if (v7) {
    CFRelease(v7);
  }
  return v5 & v9;
}

- (__SecKey)randomPermanentFullECKey:(int)a3 name:(id)a4 error:(__CFError *)a5
{
  return sub_1001F0694(a3, (uint64_t)a4, (uint64_t)kSecAttrAccessibleWhenUnlockedThisDeviceOnly, (uint64_t)kCFBooleanFalse, a5);
}

- (__OpaqueSOSFullPeerInfo)CopyAccountIdentityPeerInfo
{
  unsigned int v2 = [(SOSAccountTrust *)self fullPeerInfo];

  return (__OpaqueSOSFullPeerInfo *)_SOSFullPeerInfoCopyFullPeerInfo(v2);
}

- (BOOL)hasFullPeerInfo:(__CFError *)a3
{
  BOOL v4 = -[SOSAccountTrustClassic hasCircle:](self, "hasCircle:");
  if (v4)
  {
    if ([(SOSAccountTrust *)self fullPeerInfo])
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      SOSCreateErrorWithFormat();
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)fullPeerInfoVerify:(__SecKey *)a3 err:(__CFError *)a4
{
  if (![(SOSAccountTrust *)self fullPeerInfo]) {
    return 0;
  }
  PublicFromPrivate = (const void *)SecKeyCreatePublicFromPrivate();
  [(SOSAccountTrust *)self peerInfo];
  char v6 = SOSPeerInfoApplicationVerify();
  if (PublicFromPrivate) {
    CFRelease(PublicFromPrivate);
  }
  return v6;
}

- (__OpaqueSOSFullPeerInfo)getMyFullPeerInfo
{
  result = [(SOSAccountTrust *)self trustedCircle];
  if (result)
  {
    return [(SOSAccountTrust *)self fullPeerInfo];
  }
  return result;
}

- (BOOL)updateFullPeerInfo:(id)a3 minimum:(__CFSet *)a4 excluded:(__CFSet *)a5
{
  id v6 = a3;
  if ([(SOSAccountTrust *)self trustedCircle])
  {
    if ([(SOSAccountTrust *)self fullPeerInfo])
    {
      [(SOSAccountTrust *)self fullPeerInfo];
      if (SOSFullPeerInfoUpdateToCurrent())
      {
        uint64_t v7 = [v6 circle_transport];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100234668;
        v9[3] = &unk_100309D10;
        void v9[4] = self;
        [(SOSAccountTrustClassic *)self modifyCircle:v7 err:0 action:v9];
      }
    }
  }

  return 1;
}

- (BOOL)isLockedError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    char v5 = [v3 domain];
    if ([v5 isEqualToString:kCFErrorDomainOSStatus]) {
      BOOL v6 = [v4 code] == (id)-25308;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end