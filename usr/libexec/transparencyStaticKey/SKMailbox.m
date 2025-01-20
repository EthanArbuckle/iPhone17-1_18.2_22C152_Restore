@interface SKMailbox
+ (id)allSMFlags;
+ (id)allSMStates;
+ (id)generateSessionID;
- (BOOL)announceMismatch;
- (BOOL)deletedHandles;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchSession:(id)a3 op:(id)a4;
- (BOOL)sendRevealA;
- (BOOL)sentConfirmMatch;
- (BOOL)sentTeardown;
- (BOOL)validateAnnounce:(id)a3;
- (KTNearFutureScheduler)recvRatelimit;
- (KTStateMachine)stateMachine;
- (KTStaticKeyPeer)peerStorage;
- (KTVaudenaySAS)sas;
- (NSData)aCommitRandom;
- (NSData)gotAnnounceData;
- (NSData)gotCommitData;
- (NSData)gotConfirmData;
- (NSData)gotReplyBData;
- (NSData)gotRevealData;
- (NSData)gotTeardown;
- (NSData)handleID;
- (NSData)localSessionID;
- (NSData)myPublicInfo;
- (NSData)negotiatedSessionID;
- (NSData)peerPublicInfo;
- (NSData)peerSessionID;
- (NSDate)expire;
- (NSSet)peerHandles;
- (NSString)destinationIDSID;
- (NSString)gotAnnounceFromID;
- (NSString)peerIDSID;
- (NSString)sourceIDS;
- (OS_dispatch_queue)stateMachineQueue;
- (OS_dispatch_queue)updateQueue;
- (OS_os_log)log;
- (OS_os_transaction)transaction;
- (SASAnnounce)peerAnnounce;
- (SASSelected)gotSelected;
- (SKMailbox)initWithLogging:(id)a3 publicInfo:(id)a4 peerIDSID:(id)a5 session:(id)a6;
- (SKSessionProtocol)session;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)mapMailbox;
- (id)matchPeerSessionID:(id)a3 op:(id)a4;
- (id)onQueueMapMailbox;
- (id)onQueueStartOver:(id)a3 clearAnnounce:(BOOL)a4 flags:(id)a5;
- (id)stateUpdate;
- (int)beforeRatelimit;
- (int64_t)sentTime;
- (unint64_t)hash;
- (unint64_t)sentAnnounce;
- (unsigned)peerIDMismatchCounter;
- (void)dealloc;
- (void)haltStateMachine;
- (void)onQueueUpdateState;
- (void)recvAnnounce:(id)a3;
- (void)recvCommit:(id)a3;
- (void)recvConfirm:(id)a3;
- (void)recvDiscloseA:(id)a3;
- (void)recvReplyB:(id)a3;
- (void)recvSelected:(id)a3;
- (void)recvTeardown:(id)a3;
- (void)reset;
- (void)restart;
- (void)sendAnnounce;
- (void)sendCommitA;
- (void)sendConfirm;
- (void)sendMessage:(unsigned __int16)a3 data:(id)a4;
- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 targets:(id)a5 sourceID:(id)a6;
- (void)sendSelected;
- (void)sendSetupB;
- (void)sendTearDown:(id)a3 idsHandle:(id)a4 because:(id)a5;
- (void)sendTeardown;
- (void)setACommitRandom:(id)a3;
- (void)setBeforeRatelimit:(int)a3;
- (void)setDeletedHandles:(BOOL)a3;
- (void)setDestinationIDSID:(id)a3;
- (void)setExpire:(id)a3;
- (void)setGotAnnounceData:(id)a3;
- (void)setGotAnnounceFromID:(id)a3;
- (void)setGotCommitData:(id)a3;
- (void)setGotConfirmData:(id)a3;
- (void)setGotReplyBData:(id)a3;
- (void)setGotRevealData:(id)a3;
- (void)setGotSelected:(id)a3;
- (void)setGotTeardown:(id)a3;
- (void)setHandleID:(id)a3;
- (void)setLocalSessionID:(id)a3;
- (void)setLog:(id)a3;
- (void)setMyPublicInfo:(id)a3;
- (void)setNegotiatedSessionID:(id)a3;
- (void)setPeer:(id)a3;
- (void)setPeerAnnounce:(id)a3;
- (void)setPeerIDMismatchCounter:(unsigned int)a3;
- (void)setPeerIDSID:(id)a3;
- (void)setPeerPublicInfo:(id)a3;
- (void)setPeerSessionID:(id)a3;
- (void)setPeerStorage:(id)a3;
- (void)setRecvRatelimit:(id)a3;
- (void)setSas:(id)a3;
- (void)setSentAnnounce:(unint64_t)a3;
- (void)setSentConfirmMatch:(BOOL)a3;
- (void)setSentTeardown:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSourceIDS:(id)a3;
- (void)setSourceIDSID:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStateMachineQueue:(id)a3;
- (void)setStateUpdate:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)startSession;
- (void)stopTransaction;
- (void)updateState;
- (void)updateTimer;
- (void)updateTransaction;
@end

@implementation SKMailbox

- (SKMailbox)initWithLogging:(id)a3 publicInfo:(id)a4 peerIDSID:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)SKMailbox;
  v14 = [(SKMailbox *)&v35 init];
  if (v14)
  {
    v15 = +[SKMailbox generateSessionID];
    [(SKMailbox *)v14 setHandleID:v15];

    v16 = +[SKMailbox generateSessionID];
    [(SKMailbox *)v14 setLocalSessionID:v16];

    [(SKMailbox *)v14 setMyPublicInfo:v11];
    [(SKMailbox *)v14 setPeerIDSID:v12];
    id v31 = v10;
    [(SKMailbox *)v14 setLog:v10];
    [(SKMailbox *)v14 setSession:v13];
    [(SKMailbox *)v14 setPeerIDMismatchCounter:0];
    [(SKMailbox *)v14 setBeforeRatelimit:10];
    dispatch_queue_t v17 = dispatch_queue_create("updateQueue", 0);
    [(SKMailbox *)v14 setUpdateQueue:v17];

    dispatch_queue_t v18 = dispatch_queue_create("KTStaticKeyMailbox", 0);
    [(SKMailbox *)v14 setStateMachineQueue:v18];

    v19 = [KTStateMachine alloc];
    v20 = [(id)objc_opt_class() allSMStates];
    v21 = [(id)objc_opt_class() allSMFlags];
    v22 = off_1000A6758;
    v23 = [(SKMailbox *)v14 stateMachineQueue];
    v24 = +[TransparencyIDSConfigBag sharedInstance];
    v25 = [(KTStateMachine *)v19 initWithName:@"KTStateMachine" states:v20 flags:v21 initialState:v22 queue:v23 stateEngine:v14 lockStateTracker:0 reachabilityTracker:0 idsConfigBag:v24];
    [(SKMailbox *)v14 setStateMachine:v25];

    id location = 0;
    objc_initWeak(&location, v14);
    v26 = [KTNearFutureScheduler alloc];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100027FFC;
    v32[3] = &unk_10008CAD8;
    objc_copyWeak(&v33, &location);
    v27 = [(KTNearFutureScheduler *)v26 initWithName:@"recvRatelimit" initialDelay:10000000 continuingDelay:5000000000 keepProcessAlive:0 dependencyDescriptionCode:0 block:v32];
    [(SKMailbox *)v14 setRecvRatelimit:v27];

    v28 = [(SKMailbox *)v14 stateMachine];
    [v28 startOperation];

    v29 = v14;
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    id v10 = v31;
  }

  return v14;
}

+ (id)generateSessionID
{
  v2 = +[NSMutableData dataWithLength:16];
  if (!v2
    || (v3 = v2,
        id v4 = [v2 length],
        id v5 = v3,
        SecRandomCopyBytes(0, (size_t)v4, [v5 mutableBytes])))
  {
    abort();
  }

  return v5;
}

- (void)haltStateMachine
{
  id v2 = [(SKMailbox *)self stateMachine];
  [v2 haltOperation];
}

- (void)dealloc
{
  v3 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SKMailbox *)self localSessionID];
    id v5 = [v4 kt_hexString];
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dealloc: %{public}@", buf, 0xCu);
  }
  [(SKMailbox *)self stopTransaction];
  v6 = [(SKMailbox *)self session];
  [v6 teardownMailbox:self];

  v7.receiver = self;
  v7.super_class = (Class)SKMailbox;
  [(SKMailbox *)&v7 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 localSessionID];
    v6 = [(SKMailbox *)self localSessionID];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(SKMailbox *)self localSessionID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)setPeer:(id)a3
{
  id v5 = a3;
  id v4 = [(SKMailbox *)self peerStorage];

  if (!v4) {
    [(SKMailbox *)self setPeerStorage:v5];
  }
}

- (void)setSourceIDSID:(id)a3
{
}

- (NSSet)peerHandles
{
  id v3 = [(SKMailbox *)self peer];
  id v4 = [v3 peer];
  id v5 = +[NSMutableSet setWithObject:v4];

  v6 = [(SKMailbox *)self peer];
  unsigned __int8 v7 = [v6 otherNamesForPeer];

  if (v7)
  {
    v8 = [(SKMailbox *)self peer];
    v9 = [v8 otherNamesForPeer];
    [v5 unionSet:v9];
  }

  return (NSSet *)v5;
}

- (void)startSession
{
  id v2 = [(SKMailbox *)self stateMachine];
  [v2 handleFlag:off_1000A6710];
}

- (void)updateTransaction
{
  id v3 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SKMailbox *)self handleID];
    id v5 = [v4 kt_hexString];
    v6 = [(SKMailbox *)self transaction];
    CFStringRef v7 = @"yes";
    if (!v6) {
      CFStringRef v7 = @"no";
    }
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    CFStringRef v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "updateTransaction: %{public}@ exists: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v8 = [(SKMailbox *)self transaction];

  if (!v8)
  {
    v9 = (void *)os_transaction_create();
    [(SKMailbox *)self setTransaction:v9];
  }
}

- (void)stopTransaction
{
  id v3 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SKMailbox *)self handleID];
    id v5 = [v4 kt_hexString];
    int v6 = 138543362;
    CFStringRef v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopTransaction: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(SKMailbox *)self setTransaction:0];
}

- (void)updateTimer
{
  id v3 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
  [(SKMailbox *)self setExpire:v3];
}

- (void)updateState
{
  id v3 = [(SKMailbox *)self stateMachineQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002878C;
  block[3] = &unk_10008CE40;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)onQueueUpdateState
{
  id v3 = [(SKMailbox *)self stateMachineQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(SKMailbox *)v4 stateUpdate];
  objc_sync_exit(v4);

  if (v5)
  {
    int v6 = [(SKMailbox *)v4 updateQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100028890;
    v7[3] = &unk_10008DD08;
    v7[4] = v4;
    id v8 = v5;
    dispatch_async(v6, v7);
  }
}

- (id)mapMailbox
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = sub_100028A08;
  id v11 = sub_100028A18;
  id v12 = 0;
  id v3 = [(SKMailbox *)self stateMachineQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100028A20;
  v6[3] = &unk_10008CE18;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onQueueMapMailbox
{
  id v3 = [(SKMailbox *)self stateMachine];
  id v4 = [v3 currentState];

  id v5 = objc_alloc_init((Class)KTIDSSession);
  int v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(SKMailbox *)v6 handleID];
  id v8 = [v7 kt_hexString];
  [v5 setSessionID:v8];

  uint64_t v9 = [(SKMailbox *)v6 peerPublicInfo];

  if (v9)
  {
    int v10 = [(SKMailbox *)v6 peerPublicInfo];
    id v11 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v10 error:0];
    [v5 setPeerAccountIdentity:v11];
  }
  objc_sync_exit(v6);

  if (([v4 isEqual:off_1000A6758] & 1) != 0
    || [v4 isEqual:off_1000A6760])
  {
    id v12 = &kTransparencyStaticKeyStateInit;
LABEL_6:
    [v5 setState:*v12];
    CFStringRef v13 = v5;
    uint64_t v14 = 1;
LABEL_13:
    [v13 setPeerDisconnected:v14];
    goto LABEL_14;
  }
  if ([v4 isEqual:off_1000A6768]
    || [v4 isEqual:off_1000A6770]
    || [v4 isEqual:off_1000A6780]
    || [v4 isEqual:off_1000A6788]
    || [v4 isEqual:off_1000A6790])
  {
LABEL_12:
    [v5 setState:kTransparencyStaticKeyStateNegotiating];
    CFStringRef v13 = v5;
    uint64_t v14 = 0;
    goto LABEL_13;
  }
  if (([v4 isEqual:off_1000A6798] & 1) == 0
    && ![v4 isEqual:off_1000A67A0])
  {
    if ([v4 isEqual:off_1000A67A8])
    {
      id v12 = &kTransparencyStaticKeyStateCodeError;
      goto LABEL_6;
    }
    if (![v4 isEqual:off_1000A67B0]
      && ![v4 isEqual:off_1000A67B8])
    {
      v22 = [(SKMailbox *)v6 log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100068B14();
      }

      id v12 = &kTransparencyStaticKeyStateNegotiating;
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  [v5 setPeerDisconnected:[v4 isEqual:off_1000A67A0]];
  v16 = [(SKMailbox *)v6 sas];
  dispatch_queue_t v17 = [v16 shortAuthenticationString];
  [v5 setSasCode:v17];

  dispatch_queue_t v18 = [v5 sasCode];

  if (v18)
  {
    v19 = &kTransparencyStaticKeyStateCodeAvailable;
  }
  else
  {
    unsigned int v20 = [v5 peerDisconnected];
    v19 = &kTransparencyStaticKeyStateCodeError;
    if (v20) {
      v19 = &kTransparencyStaticKeyStateNegotiating;
    }
  }
  [v5 setState:*v19];
  v21 = [(SKMailbox *)v6 expire];
  [v5 setSessionExpire:v21];

LABEL_14:

  return v5;
}

+ (id)allSMFlags
{
  if (qword_1000A75D8 != -1) {
    dispatch_once(&qword_1000A75D8, &stru_10008DD28);
  }
  id v2 = (void *)qword_1000A75E0;

  return v2;
}

+ (id)allSMStates
{
  if (qword_1000A75E8 != -1) {
    dispatch_once(&qword_1000A75E8, &stru_10008DD48);
  }
  id v2 = (void *)qword_1000A75F0;

  return v2;
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v10 = [(SKMailbox *)self destinationIDSID];
  if (!v10)
  {
    uint64_t v7 = [(SKMailbox *)self peer];
    id v10 = [v7 peer];
  }
  id v8 = [(SKMailbox *)self session];
  uint64_t v9 = [(SKMailbox *)self sourceIDS];
  [v8 sendMessage:v4 data:v6 toID:v10 sourceID:v9];
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 targets:(id)a5 sourceID:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(SKMailbox *)self session];
  [v13 sendMessage:v8 data:v12 toID:v11 sourceID:v10];
}

- (void)recvAnnounce:(id)a3
{
  id v4 = a3;
  id v5 = [(SKMailbox *)self stateMachineQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000292A0;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (int64_t)sentTime
{
  id v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  int64_t v4 = (uint64_t)(v3 * 1000.0);

  return v4;
}

- (void)sendAnnounce
{
  double v3 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(SKMailbox *)self handleID];
    id v5 = [v4 kt_hexString];
    id v6 = [(SKMailbox *)self peerSessionID];
    uint64_t v7 = [v6 kt_hexString];
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 2114;
    v15 = v7;
    __int16 v16 = 2048;
    unint64_t v17 = [(SKMailbox *)self sentAnnounce];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "send announce %{public}@ peer: %{public}@ count: %lu", (uint8_t *)&v12, 0x20u);
  }
  [(SKMailbox *)self setSentAnnounce:(char *)[(SKMailbox *)self sentAnnounce] + 1];
  id v8 = objc_alloc_init(SASAnnounce);
  uint64_t v9 = [(SKMailbox *)self localSessionID];
  [(SASAnnounce *)v8 setSessionId:v9];

  id v10 = [(SKMailbox *)self peerSessionID];
  [(SASAnnounce *)v8 setPeerSessionId:v10];

  id v11 = [(TransparencyGPBMessage *)v8 data];
  [(SKMailbox *)self sendMessage:0 data:v11];
}

- (void)recvCommit:(id)a3
{
  id v4 = a3;
  id v5 = [(SKMailbox *)self stateMachineQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029684;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)sendCommitA
{
  double v3 = [(SKMailbox *)self negotiatedSessionID];
  id v4 = [v3 length];

  if (!v4) {
    _os_assumes_log();
  }
  id v5 = [(SKMailbox *)self sas];
  unsigned __int8 v6 = [v5 initiator];

  if ((v6 & 1) == 0) {
    _os_assumes_log();
  }
  int v12 = objc_alloc_init(SASCommit);
  uint64_t v7 = [(SKMailbox *)self negotiatedSessionID];
  [(SASCommit *)v12 setSessionId:v7];

  id v8 = [(SKMailbox *)self myPublicInfo];
  [(SASCommit *)v12 setPublicInfo:v8];

  uint64_t v9 = [(SKMailbox *)self sas];
  id v10 = [v9 undisclosedInitiatorRandom];
  [(SASCommit *)v12 setACommitRandom:v10];

  id v11 = [(TransparencyGPBMessage *)v12 data];
  [(SKMailbox *)self sendMessage:1 data:v11];
}

- (void)recvReplyB:(id)a3
{
  id v4 = a3;
  id v5 = [(SKMailbox *)self stateMachineQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000298D4;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)sendSetupB
{
  double v3 = [(SKMailbox *)self negotiatedSessionID];
  id v4 = [v3 length];

  if (!v4) {
    _os_assumes_log();
  }
  id v5 = [(SKMailbox *)self sas];
  unsigned int v6 = [v5 initiator];

  if (v6) {
    _os_assumes_log();
  }
  id v13 = objc_alloc_init(SASSetupB);
  uint64_t v7 = [(SKMailbox *)self negotiatedSessionID];
  [(SASSetupB *)v13 setSessionId:v7];

  id v8 = [(SKMailbox *)self myPublicInfo];
  [(SASSetupB *)v13 setPublicInfo:v8];

  uint64_t v9 = [(SKMailbox *)self sas];
  id v10 = [v9 selfRandom];
  [(SASSetupB *)v13 setBRandom:v10];

  id v11 = [(SKMailbox *)self peerSessionID];
  [(SASSetupB *)v13 setPeerSessionId:v11];

  int v12 = [(TransparencyGPBMessage *)v13 data];
  [(SKMailbox *)self sendMessage:4 data:v12];
}

- (void)recvDiscloseA:(id)a3
{
  id v4 = a3;
  id v5 = [(SKMailbox *)self stateMachineQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029B44;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)sendRevealA
{
  double v3 = [(SKMailbox *)self negotiatedSessionID];
  id v4 = [v3 length];

  if (!v4) {
    _os_assumes_log();
  }
  id v5 = [(SKMailbox *)self sas];
  unsigned __int8 v6 = [v5 initiator];

  if ((v6 & 1) == 0) {
    _os_assumes_log();
  }
  uint64_t v7 = [(SKMailbox *)self sas];
  id v8 = [v7 selfRandom];

  if (v8)
  {
    uint64_t v9 = objc_alloc_init(SASReveal);
    id v10 = [(SKMailbox *)self negotiatedSessionID];
    [(SASReveal *)v9 setSessionId:v10];

    [(SASReveal *)v9 setARandom:v8];
    id v11 = [(SKMailbox *)self peerSessionID];
    [(SASReveal *)v9 setPeerSessionId:v11];

    int v12 = [(TransparencyGPBMessage *)v9 data];
    [(SKMailbox *)self sendMessage:5 data:v12];
  }
  return v8 != 0;
}

- (void)recvConfirm:(id)a3
{
  id v4 = a3;
  id v5 = [(SKMailbox *)self stateMachineQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029D8C;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)sendSelected
{
  id v5 = objc_alloc_init(SASSelected);
  double v3 = [(SKMailbox *)self negotiatedSessionID];
  [(SASSelected *)v5 setSessionId:v3];

  id v4 = [(TransparencyGPBMessage *)v5 data];
  [(SKMailbox *)self sendMessage:2 data:v4];
}

- (void)recvSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(SKMailbox *)self stateMachineQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029F30;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)sendConfirm
{
  double v3 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100068B7C(self);
  }

  id v4 = [(SKMailbox *)self negotiatedSessionID];
  id v5 = [v4 length];

  if (!v5) {
    _os_assumes_log();
  }
  id v6 = objc_alloc_init(SASConfirm);
  uint64_t v7 = [(SKMailbox *)self negotiatedSessionID];
  [(SASConfirm *)v6 setSessionId:v7];

  [(SASConfirm *)v6 setSentTime:[(SKMailbox *)self sentTime]];
  id v8 = [(SKMailbox *)self peerSessionID];
  [(SASConfirm *)v6 setPeerSessionId:v8];

  uint64_t v9 = [(TransparencyGPBMessage *)v6 data];
  [(SKMailbox *)self sendMessage:6 data:v9];
}

- (void)sendTearDown:(id)a3 idsHandle:(id)a4 because:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v15 = [v8 kt_hexString];
    int v16 = 138544130;
    unint64_t v17 = v15;
    __int16 v18 = 2160;
    uint64_t v19 = 1752392040;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "sending teardown of session %{public}@ to peer %{mask.hash}@ because %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  if (v8 && v9)
  {
    int v12 = objc_alloc_init(SASTeardown);
    [(SASTeardown *)v12 setSessionId:v8];
    id v13 = [(TransparencyGPBMessage *)v12 data];
    __int16 v14 = [(SKMailbox *)self sourceIDS];
    [(SKMailbox *)self sendMessage:3 data:v13 targets:v9 sourceID:v14];
  }
}

- (void)recvTeardown:(id)a3
{
  id v4 = a3;
  id v5 = [(SKMailbox *)self stateMachineQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A2E4;
  v7[3] = &unk_10008CEB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)sendTeardown
{
  if (![(SKMailbox *)self sentTeardown])
  {
    [(SKMailbox *)self setSentTeardown:1];
    id v8 = objc_alloc_init(SASTeardown);
    double v3 = [(SKMailbox *)self peerSessionID];

    if (v3)
    {
      id v4 = [(SKMailbox *)self peerSessionID];
      [(SASTeardown *)v8 setSessionId:v4];

      id v5 = [(TransparencyGPBMessage *)v8 data];
      [(SKMailbox *)self sendMessage:3 data:v5];
    }
    id v6 = [(SKMailbox *)self localSessionID];
    [(SASTeardown *)v8 setSessionId:v6];

    uint64_t v7 = [(TransparencyGPBMessage *)v8 data];
    [(SKMailbox *)self sendMessage:3 data:v7];
  }
}

- (BOOL)validateAnnounce:(id)a3
{
  if (a3)
  {
    id v13 = 0;
    id v4 = +[TransparencyGPBMessage parseFromData:a3 error:&v13];
    id v5 = v13;
    id v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      id v10 = [v4 sessionId];
      id v11 = [v10 length];

      if (v11)
      {
        [(SKMailbox *)self setPeerAnnounce:v4];
        BOOL v9 = 1;
LABEL_16:

        goto LABEL_17;
      }
      id v8 = [(SKMailbox *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100068CE4();
      }
    }
    else
    {
      id v8 = [(SKMailbox *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100068C7C();
      }
    }

    BOOL v9 = 0;
    goto LABEL_16;
  }
  id v6 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100068C48();
  }
  BOOL v9 = 0;
LABEL_17:

  return v9;
}

- (BOOL)announceMismatch
{
  double v3 = [(SKMailbox *)self gotAnnounceData];

  if (v3)
  {
    id v4 = [(SKMailbox *)self gotAnnounceData];
    id v17 = 0;
    id v5 = +[TransparencyGPBMessage parseFromData:v4 error:&v17];
    id v6 = v17;

    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      id v10 = [v5 sessionId];
      id v11 = [(SKMailbox *)self peerSessionID];
      unsigned __int8 v12 = [v10 isEqual:v11];

      if (v12)
      {
        id v13 = [v5 peerSessionId];
        __int16 v14 = [(SKMailbox *)self localSessionID];
        unsigned __int8 v15 = [v13 isEqual:v14];

        if (v15)
        {
          BOOL v9 = 0;
LABEL_19:

          goto LABEL_20;
        }
        id v8 = [(SKMailbox *)self log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100068DB4(self, v5);
        }
      }
      else
      {
        id v8 = [(SKMailbox *)self log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100068E80(self, v5);
        }
      }
    }
    else
    {
      id v8 = [(SKMailbox *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100068D4C();
      }
    }

    BOOL v9 = 1;
    goto LABEL_19;
  }
  id v6 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100068D18();
  }
  BOOL v9 = 1;
LABEL_20:

  return v9;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v12 = [v9 dumpFlags];
    id v13 = [v12 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138543618;
    id v78 = v8;
    __int16 v79 = 2114;
    v80 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "in state %{public}@ with flags: %{public}@", buf, 0x16u);
  }
  if ([v8 isEqual:off_1000A6758])
  {
    if ([v9 _onqueueContains:off_1000A6710])
    {
      [v9 _onqueueRemoveFlag:off_1000A6710];
      __int16 v14 = [(SKMailbox *)self myPublicInfo];

      if (v14)
      {
        [(SKMailbox *)self sendAnnounce];
        [(SKMailbox *)self onQueueUpdateState];
        unsigned __int8 v15 = off_1000A6768;
        CFStringRef v16 = @"send-announce";
      }
      else
      {
        v27 = [(SKMailbox *)self log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_100068F4C();
        }

        unsigned __int8 v15 = off_1000A67A8;
        CFStringRef v16 = @"announce-missing-my-peer-info";
      }
      goto LABEL_32;
    }
    if ([v9 _onqueueContains:off_1000A6718])
    {
      [v9 _onqueueRemoveFlag:off_1000A6718];
      unsigned __int8 v15 = off_1000A6760;
      CFStringRef v16 = @"got-announce";
LABEL_32:
      uint64_t v26 = +[KTStateTransitionOperation named:v16 entering:v15];
      goto LABEL_87;
    }
    __int16 v22 = [(SKMailbox *)self log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v9 dumpFlags];
      v24 = [v23 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138543362;
      id v78 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SMStateInitial waiting for start: %{public}@", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (![v8 isEqual:off_1000A6760])
  {
    if ([v8 isEqual:off_1000A6768])
    {
      if (![v9 _onqueueContains:off_1000A6750])
      {
        if (![v9 _onqueueContains:off_1000A6748])
        {
          if ([v9 _onqueueContains:off_1000A6718])
          {
            [v9 _onqueueRemoveFlag:off_1000A6718];
            v28 = [(SKMailbox *)self gotAnnounceData];
            unsigned __int8 v29 = [(SKMailbox *)self validateAnnounce:v28];

            if ((v29 & 1) == 0)
            {
              unsigned __int8 v15 = off_1000A67A8;
              CFStringRef v16 = @"no valid error";
              goto LABEL_32;
            }
            v30 = [(SKMailbox *)self peerSessionID];
            id v31 = [(SKMailbox *)self peerAnnounce];
            v32 = [v31 sessionId];
            unsigned __int8 v33 = [v30 isEqual:v32];

            v34 = [(SKMailbox *)self peerAnnounce];
            objc_super v35 = [v34 sessionId];
            [(SKMailbox *)self setPeerSessionID:v35];

            v36 = [(SKMailbox *)self peerAnnounce];
            v37 = [v36 peerSessionId];
            v38 = [(SKMailbox *)self localSessionID];
            unsigned __int8 v39 = [v37 isEqual:v38];

            if (v39)
            {
              if ((v33 & 1) == 0) {
                [(SKMailbox *)self sendAnnounce];
              }
              unsigned __int8 v15 = off_1000A6770;
              CFStringRef v16 = @"decide AB";
              goto LABEL_32;
            }
            if ([(SKMailbox *)self sentAnnounce] >= 0xB)
            {
              unsigned __int8 v15 = off_1000A67B0;
              CFStringRef v16 = @"announce-sent-too-many-announce";
              goto LABEL_32;
            }
            [(SKMailbox *)self sendAnnounce];
          }
          else if ([v9 _onqueueContains:off_1000A6740])
          {
            [v9 _onqueueRemoveFlag:off_1000A6740];
            unsigned __int8 v15 = off_1000A67A8;
            CFStringRef v16 = @"wait-announce-teardown";
            goto LABEL_32;
          }
          goto LABEL_21;
        }
        CFStringRef v17 = @"wait-req-start-over";
        goto LABEL_85;
      }
      [v9 _onqueueRemoveFlag:off_1000A6750];
      goto LABEL_15;
    }
    if ([v8 isEqual:off_1000A6770])
    {
      __int16 v18 = off_1000A6780;
      uint64_t v19 = off_1000A67A8;
      v67 = _NSConcreteStackBlock;
      uint64_t v68 = 3221225472;
      v69 = sub_10002B5E8;
      v70 = &unk_10008DD70;
      v71 = self;
      CFStringRef v20 = @"decide-ab";
      id v21 = &v67;
      goto LABEL_24;
    }
    if ([v8 isEqual:off_1000A6778])
    {
      if ([v9 _onqueueContains:off_1000A6718])
      {
        if ([(SKMailbox *)self announceMismatch])
        {
          CFStringRef v17 = @"waitA-start-over";
          goto LABEL_81;
        }
        [v9 _onqueueRemoveFlag:off_1000A6718];
      }
      if ([v9 _onqueueContains:off_1000A6748])
      {
        CFStringRef v17 = @"waitA-req-start-over";
        goto LABEL_85;
      }
      if (![v9 _onqueueContains:off_1000A6720]) {
        goto LABEL_21;
      }
      [v9 _onqueueRemoveFlag:off_1000A6720];
      __int16 v18 = off_1000A6788;
      uint64_t v19 = off_1000A67B0;
      v62 = _NSConcreteStackBlock;
      uint64_t v63 = 3221225472;
      v64 = sub_10002BB78;
      v65 = &unk_10008DD70;
      v66 = self;
      CFStringRef v20 = @"commit-a";
      id v21 = &v62;
      goto LABEL_24;
    }
    if ([v8 isEqual:off_1000A6780])
    {
      if ([v9 _onqueueContains:off_1000A6718])
      {
        if ([(SKMailbox *)self announceMismatch])
        {
          CFStringRef v17 = @"replyB-start-over";
          goto LABEL_81;
        }
        [v9 _onqueueRemoveFlag:off_1000A6718];
      }
      if ([v9 _onqueueContains:off_1000A6748])
      {
        CFStringRef v17 = @"replyB-req-start-over";
        goto LABEL_85;
      }
      if (![v9 _onqueueContains:off_1000A6728]) {
        goto LABEL_21;
      }
      [v9 _onqueueRemoveFlag:off_1000A6728];
      [v9 _onqueueRemoveFlag:off_1000A6750];
      __int16 v18 = off_1000A6790;
      uint64_t v19 = off_1000A67A8;
      v57 = _NSConcreteStackBlock;
      uint64_t v58 = 3221225472;
      v59 = sub_10002BE28;
      v60 = &unk_10008DD70;
      v61 = self;
      CFStringRef v20 = @"reply-b";
      id v21 = &v57;
      goto LABEL_24;
    }
    if ([v8 isEqual:off_1000A6788])
    {
      if ([v9 _onqueueContains:off_1000A6750])
      {
        [v9 _onqueueRemoveFlag:off_1000A6750];
        v40 = [(SKMailbox *)self gotSelected];
        v41 = [v40 sessionId];
        v42 = [(SKMailbox *)self negotiatedSessionID];
        unsigned __int8 v43 = [v41 isEqual:v42];

        if ((v43 & 1) == 0)
        {
LABEL_15:
          CFStringRef v17 = @"wait-select-confirm";
          goto LABEL_85;
        }
      }
      if ([v9 _onqueueContains:off_1000A6718])
      {
        if ([(SKMailbox *)self announceMismatch])
        {
          CFStringRef v17 = @"discloseA-start-over";
          goto LABEL_81;
        }
        [v9 _onqueueRemoveFlag:off_1000A6718];
      }
      if ([v9 _onqueueContains:off_1000A6748])
      {
        CFStringRef v17 = @"discloseA-req-start-over";
        goto LABEL_85;
      }
      if (![v9 _onqueueContains:off_1000A6730]) {
        goto LABEL_21;
      }
      [v9 _onqueueRemoveFlag:off_1000A6730];
      __int16 v18 = off_1000A6790;
      uint64_t v19 = off_1000A67A8;
      v52 = _NSConcreteStackBlock;
      uint64_t v53 = 3221225472;
      v54 = sub_10002C078;
      v55 = &unk_10008DD70;
      v56 = self;
      CFStringRef v20 = @"disclose-a";
      id v21 = &v52;
      goto LABEL_24;
    }
    if ([v8 isEqual:off_1000A6790])
    {
      if ([v9 _onqueueContains:off_1000A6738])
      {
        [v9 _onqueueRemoveFlag:off_1000A6738];
        __int16 v18 = off_1000A6798;
        uint64_t v19 = off_1000A67A8;
        v47 = _NSConcreteStackBlock;
        uint64_t v48 = 3221225472;
        v49 = sub_10002C2D4;
        v50 = &unk_10008DD70;
        v51 = self;
        CFStringRef v20 = @"Confirm";
        id v21 = &v47;
        goto LABEL_24;
      }
      if (![v9 _onqueueContains:off_1000A6718])
      {
        if (![v9 _onqueueContains:off_1000A6748]) {
          goto LABEL_21;
        }
        CFStringRef v17 = @"confirm-req-start-over";
        goto LABEL_85;
      }
      CFStringRef v17 = @"confirm-start-over";
LABEL_81:
      v44 = self;
      uint64_t v45 = 0;
LABEL_86:
      uint64_t v26 = [(SKMailbox *)v44 onQueueStartOver:v17 clearAnnounce:v45 flags:v9];
      goto LABEL_87;
    }
    if ([v8 isEqual:off_1000A6798])
    {
      if ([v9 _onqueueContains:off_1000A6718])
      {
        if ([(SKMailbox *)self announceMismatch])
        {
          CFStringRef v17 = @"finish-start-over";
          goto LABEL_81;
        }
        [v9 _onqueueRemoveFlag:off_1000A6718];
      }
      if ([v9 _onqueueContains:off_1000A6740])
      {
        [v9 _onqueueRemoveFlag:off_1000A6740];
        unsigned __int8 v15 = off_1000A67A0;
        CFStringRef v16 = @"finish-teardown";
        goto LABEL_32;
      }
      if ([v9 _onqueueContains:off_1000A6748])
      {
        CFStringRef v17 = @"finish-req-start-over";
        goto LABEL_85;
      }
    }
    else
    {
      if ([v8 isEqual:off_1000A67A0])
      {
        [(SKMailbox *)self onQueueUpdateState];
        if (![v9 _onqueueContains:off_1000A6718])
        {
          if (![v9 _onqueueContains:off_1000A6748]) {
            goto LABEL_21;
          }
          CFStringRef v17 = @"disconnected-start-over";
          goto LABEL_85;
        }
        CFStringRef v17 = @"disconnected-start-over";
        goto LABEL_81;
      }
      if (![v8 isEqual:off_1000A67A8])
      {
        if ([v8 isEqual:off_1000A67B0]) {
          goto LABEL_21;
        }
        if (![v8 isEqual:off_1000A67B8]) {
          abort();
        }
        CFStringRef v17 = @"peer-reset-start-over";
        goto LABEL_85;
      }
      if ([v9 _onqueueContains:off_1000A6748])
      {
        CFStringRef v17 = @"error-start-over";
        goto LABEL_85;
      }
      [(SKMailbox *)self sendTeardown];
      [(SKMailbox *)self stopTransaction];
    }
    [(SKMailbox *)self onQueueUpdateState];
    goto LABEL_21;
  }
  [v9 _onqueueRemoveFlag:off_1000A6718];
  if ([v9 _onqueueContains:off_1000A6748])
  {
    CFStringRef v17 = @"got-req-start-over";
LABEL_85:
    v44 = self;
    uint64_t v45 = 1;
    goto LABEL_86;
  }
  if (![v9 _onqueueContains:off_1000A6710])
  {
    if ([v9 _onqueueContains:off_1000A6740])
    {
      unsigned __int8 v15 = off_1000A67A8;
      CFStringRef v16 = @"got-announce-teardown";
      goto LABEL_32;
    }
LABEL_21:
    v25 = 0;
    goto LABEL_88;
  }
  [v9 _onqueueRemoveFlag:off_1000A6710];
  __int16 v18 = off_1000A6770;
  uint64_t v19 = off_1000A67A8;
  v72 = _NSConcreteStackBlock;
  uint64_t v73 = 3221225472;
  v74 = sub_10002B3F8;
  v75 = &unk_10008DD70;
  v76 = self;
  CFStringRef v20 = @"got-announce-send";
  id v21 = &v72;
LABEL_24:
  +[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", v20, v18, v19, v21, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59,
    v60,
    v61,
    v62,
    v63,
    v64,
    v65,
    v66,
    v67,
    v68,
    v69,
    v70,
    v71,
    v72,
    v73,
    v74,
    v75,
  uint64_t v26 = v76);
LABEL_87:
  v25 = (void *)v26;
LABEL_88:

  return v25;
}

- (void)reset
{
  double v3 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset", v4, 2u);
  }

  [(SKMailbox *)self setPeerSessionID:0];
  [(SKMailbox *)self setNegotiatedSessionID:0];
  [(SKMailbox *)self setPeerAnnounce:0];
  [(SKMailbox *)self setSas:0];
  [(SKMailbox *)self setSentTeardown:0];
  [(SKMailbox *)self setSentAnnounce:0];
}

- (void)restart
{
  double v3 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SKMailbox *)self localSessionID];
    id v5 = [v4 kt_hexString];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: restarting session", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(SKMailbox *)self stateMachine];
  [v6 handleFlag:off_1000A6748];
}

- (id)onQueueStartOver:(id)a3 clearAnnounce:(BOOL)a4 flags:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SKMailbox *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(SKMailbox *)self localSessionID];
    unsigned __int8 v12 = [v11 kt_hexString];
    int v15 = 138543362;
    CFStringRef v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: starting over session", (uint8_t *)&v15, 0xCu);
  }
  [(SKMailbox *)self reset];
  if (v5)
  {
    [v8 _onqueueRemoveFlag:off_1000A6718];
    [v8 _onqueueSetFlag:off_1000A6710];
  }
  else
  {
    [v8 _onqueueSetFlag:off_1000A6710];
    if (([v8 _onqueueContains:off_1000A6718] & 1) == 0) {
      _os_assumes_log();
    }
  }
  [v8 _onqueueRemoveFlag:off_1000A6728];
  [v8 _onqueueRemoveFlag:off_1000A6730];
  [v8 _onqueueRemoveFlag:off_1000A6738];
  [v8 _onqueueRemoveFlag:off_1000A6740];
  [v8 _onqueueRemoveFlag:off_1000A6748];
  [v8 _onqueueRemoveFlag:off_1000A6750];
  id v13 = +[KTStateTransitionOperation named:v9 entering:off_1000A6758];

  return v13;
}

- (BOOL)matchSession:(id)a3 op:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKMailbox *)self negotiatedSessionID];
  BOOL v9 = v8 == 0;

  if (!v8)
  {
    unsigned __int8 v12 = [(SKMailbox *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: sessionID not known yet", buf, 0xCu);
    }
    goto LABEL_12;
  }
  id v10 = [(SKMailbox *)self negotiatedSessionID];
  uint64_t v11 = (uint64_t)[v6 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    id v13 = [(SKMailbox *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v6 kt_hexString];
      CFStringRef v17 = [(SKMailbox *)self negotiatedSessionID];
      __int16 v18 = [v17 kt_hexString];
      *(_DWORD *)buf = 138543874;
      id v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: negotiated sessionID mismatch (sessionID: %@ neg: %@)", buf, 0x20u);
    }
    unsigned __int8 v12 = [(SKMailbox *)self destinationIDSID];
    __int16 v14 = v12;
    if (!v12)
    {
      uint64_t v11 = [(SKMailbox *)self peer];
      __int16 v14 = [(id)v11 peer];
    }
    int v15 = +[NSString stringWithFormat:@"%@-mismatch-sessionId", v7];
    [(SKMailbox *)self sendTearDown:v6 idsHandle:v14 because:v15];

    if (!v12)
    {
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (id)matchPeerSessionID:(id)a3 op:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_4;
  }
  id v8 = [(SKMailbox *)self localSessionID];
  if (!v8) {
    goto LABEL_10;
  }
  BOOL v9 = [(SKMailbox *)self localSessionID];
  unsigned __int8 v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    id v8 = off_1000A67B8;
    [(SKMailbox *)self setPeerIDMismatchCounter:[(SKMailbox *)self peerIDMismatchCounter] + 1];
    if ([(SKMailbox *)self peerIDMismatchCounter] >= 3)
    {
      uint64_t v11 = off_1000A67B0;

      id v8 = v11;
    }
    unsigned __int8 v12 = [(SKMailbox *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = [v6 kt_hexString];
      int v15 = [(SKMailbox *)self peerSessionID];
      CFStringRef v16 = [v15 kt_hexString];
      int v17 = 138544386;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v16;
      __int16 v23 = 2114;
      v24 = v8;
      __int16 v25 = 1024;
      unsigned int v26 = [(SKMailbox *)self peerIDMismatchCounter];
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: peerSessionID mismatch (peer: %{public}@ announce: %{public}@) next state: %{public}@ (try %u)", (uint8_t *)&v17, 0x30u);
    }
  }
  else
  {
LABEL_4:
    id v8 = 0;
  }
LABEL_10:

  return v8;
}

- (NSData)handleID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHandleID:(id)a3
{
}

- (NSData)localSessionID
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalSessionID:(id)a3
{
}

- (NSData)peerSessionID
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPeerSessionID:(id)a3
{
}

- (NSData)negotiatedSessionID
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNegotiatedSessionID:(id)a3
{
}

- (id)stateUpdate
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setStateUpdate:(id)a3
{
}

- (NSData)myPublicInfo
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMyPublicInfo:(id)a3
{
}

- (NSData)peerPublicInfo
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPeerPublicInfo:(id)a3
{
}

- (BOOL)deletedHandles
{
  return self->_deletedHandles;
}

- (void)setDeletedHandles:(BOOL)a3
{
  self->_deletedHandles = a3;
}

- (KTVaudenaySAS)sas
{
  return (KTVaudenaySAS *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSas:(id)a3
{
}

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (NSString)destinationIDSID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDestinationIDSID:(id)a3
{
}

- (KTNearFutureScheduler)recvRatelimit
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRecvRatelimit:(id)a3
{
}

- (NSDate)expire
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExpire:(id)a3
{
}

- (NSData)aCommitRandom
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setACommitRandom:(id)a3
{
}

- (NSString)gotAnnounceFromID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setGotAnnounceFromID:(id)a3
{
}

- (NSData)gotAnnounceData
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGotAnnounceData:(id)a3
{
}

- (SASSelected)gotSelected
{
  return (SASSelected *)objc_getProperty(self, a2, 144, 1);
}

- (void)setGotSelected:(id)a3
{
}

- (NSData)gotCommitData
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setGotCommitData:(id)a3
{
}

- (NSData)gotReplyBData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setGotReplyBData:(id)a3
{
}

- (NSData)gotRevealData
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setGotRevealData:(id)a3
{
}

- (NSData)gotConfirmData
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setGotConfirmData:(id)a3
{
}

- (NSData)gotTeardown
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setGotTeardown:(id)a3
{
}

- (unint64_t)sentAnnounce
{
  return self->_sentAnnounce;
}

- (void)setSentAnnounce:(unint64_t)a3
{
  self->_sentAnnounce = a3;
}

- (BOOL)sentConfirmMatch
{
  return self->_sentConfirmMatch;
}

- (void)setSentConfirmMatch:(BOOL)a3
{
  self->_sentConfirmMatch = a3;
}

- (BOOL)sentTeardown
{
  return self->_sentTeardown;
}

- (void)setSentTeardown:(BOOL)a3
{
  self->_sentTeardown = a3;
}

- (int)beforeRatelimit
{
  return self->_beforeRatelimit;
}

- (void)setBeforeRatelimit:(int)a3
{
  self->_beforeRatelimit = a3;
}

- (NSString)peerIDSID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPeerIDSID:(id)a3
{
}

- (SASAnnounce)peerAnnounce
{
  return (SASAnnounce *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPeerAnnounce:(id)a3
{
}

- (NSString)sourceIDS
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSourceIDS:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLog:(id)a3
{
}

- (SKSessionProtocol)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (SKSessionProtocol *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (unsigned)peerIDMismatchCounter
{
  return self->_peerIDMismatchCounter;
}

- (void)setPeerIDMismatchCounter:(unsigned int)a3
{
  self->_peerIDMismatchCounter = a3;
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 248, 1);
}

- (void)setStateMachineQueue:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setUpdateQueue:(id)a3
{
}

- (KTStaticKeyPeer)peerStorage
{
  return (KTStaticKeyPeer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPeerStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerStorage, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_sourceIDS, 0);
  objc_storeStrong((id *)&self->_peerAnnounce, 0);
  objc_storeStrong((id *)&self->_peerIDSID, 0);
  objc_storeStrong((id *)&self->_gotTeardown, 0);
  objc_storeStrong((id *)&self->_gotConfirmData, 0);
  objc_storeStrong((id *)&self->_gotRevealData, 0);
  objc_storeStrong((id *)&self->_gotReplyBData, 0);
  objc_storeStrong((id *)&self->_gotCommitData, 0);
  objc_storeStrong((id *)&self->_gotSelected, 0);
  objc_storeStrong((id *)&self->_gotAnnounceData, 0);
  objc_storeStrong((id *)&self->_gotAnnounceFromID, 0);
  objc_storeStrong((id *)&self->_aCommitRandom, 0);
  objc_storeStrong((id *)&self->_expire, 0);
  objc_storeStrong((id *)&self->_recvRatelimit, 0);
  objc_storeStrong((id *)&self->_destinationIDSID, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_sas, 0);
  objc_storeStrong((id *)&self->_peerPublicInfo, 0);
  objc_storeStrong((id *)&self->_myPublicInfo, 0);
  objc_storeStrong(&self->_stateUpdate, 0);
  objc_storeStrong((id *)&self->_negotiatedSessionID, 0);
  objc_storeStrong((id *)&self->_peerSessionID, 0);
  objc_storeStrong((id *)&self->_localSessionID, 0);

  objc_storeStrong((id *)&self->_handleID, 0);
}

@end