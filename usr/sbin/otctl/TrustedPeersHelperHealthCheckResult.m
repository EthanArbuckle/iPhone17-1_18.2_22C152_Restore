@interface TrustedPeersHelperHealthCheckResult
+ (BOOL)supportsSecureCoding;
- (BOOL)escrowRecordGarbageCollectionEnabled;
- (BOOL)leaveTrust;
- (BOOL)postEscrowCFU;
- (BOOL)postRepairCFU;
- (BOOL)reroll;
- (BOOL)resetOctagon;
- (BOOL)superfluousPeersCleanupEnabled;
- (BOOL)tlkShareGarbageCollectionEnabled;
- (OTEscrowMoveRequestContext)moveRequest;
- (TrustedPeersHelperHealthCheckResult)initWithCoder:(id)a3;
- (TrustedPeersHelperHealthCheckResult)initWithPostRepairCFU:(BOOL)a3 postEscrowCFU:(BOOL)a4 resetOctagon:(BOOL)a5 leaveTrust:(BOOL)a6 reroll:(BOOL)a7 moveRequest:(id)a8 totalEscrowRecords:(unint64_t)a9 collectableEscrowRecords:(unint64_t)a10 collectedEscrowRecords:(unint64_t)a11 escrowRecordGarbageCollectionEnabled:(BOOL)a12 totalTlkShares:(unint64_t)a13 collectableTlkShares:(unint64_t)a14 collectedTlkShares:(unint64_t)a15 tlkShareGarbageCollectionEnabled:(BOOL)a16 totalPeers:(unint64_t)a17 trustedPeers:(unint64_t)a18 superfluousPeers:(unint64_t)a19 peersCleanedup:(unint64_t)a20 superfluousPeersCleanupEnabled:(BOOL)a21;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)collectableEscrowRecords;
- (unint64_t)collectableTlkShares;
- (unint64_t)collectedEscrowRecords;
- (unint64_t)collectedTlkShares;
- (unint64_t)peersCleanedup;
- (unint64_t)superfluousPeers;
- (unint64_t)totalEscrowRecords;
- (unint64_t)totalPeers;
- (unint64_t)totalTlkShares;
- (unint64_t)trustedPeers;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectableEscrowRecords:(unint64_t)a3;
- (void)setCollectableTlkShares:(unint64_t)a3;
- (void)setCollectedEscrowRecords:(unint64_t)a3;
- (void)setCollectedTlkShares:(unint64_t)a3;
- (void)setEscrowRecordGarbageCollectionEnabled:(BOOL)a3;
- (void)setLeaveTrust:(BOOL)a3;
- (void)setMoveRequest:(id)a3;
- (void)setPeersCleanedup:(unint64_t)a3;
- (void)setPostEscrowCFU:(BOOL)a3;
- (void)setPostRepairCFU:(BOOL)a3;
- (void)setReroll:(BOOL)a3;
- (void)setResetOctagon:(BOOL)a3;
- (void)setSuperfluousPeers:(unint64_t)a3;
- (void)setSuperfluousPeersCleanupEnabled:(BOOL)a3;
- (void)setTlkShareGarbageCollectionEnabled:(BOOL)a3;
- (void)setTotalEscrowRecords:(unint64_t)a3;
- (void)setTotalPeers:(unint64_t)a3;
- (void)setTotalTlkShares:(unint64_t)a3;
- (void)setTrustedPeers:(unint64_t)a3;
@end

@implementation TrustedPeersHelperHealthCheckResult

- (void).cxx_destruct
{
}

- (void)setSuperfluousPeersCleanupEnabled:(BOOL)a3
{
  self->_superfluousPeersCleanupEnabled = a3;
}

- (BOOL)superfluousPeersCleanupEnabled
{
  return self->_superfluousPeersCleanupEnabled;
}

- (void)setPeersCleanedup:(unint64_t)a3
{
  self->_peersCleanedup = a3;
}

- (unint64_t)peersCleanedup
{
  return self->_peersCleanedup;
}

- (void)setSuperfluousPeers:(unint64_t)a3
{
  self->_superfluousPeers = a3;
}

- (unint64_t)superfluousPeers
{
  return self->_superfluousPeers;
}

- (void)setTrustedPeers:(unint64_t)a3
{
  self->_trustedPeers = a3;
}

- (unint64_t)trustedPeers
{
  return self->_trustedPeers;
}

- (void)setTotalPeers:(unint64_t)a3
{
  self->_totalPeers = a3;
}

- (unint64_t)totalPeers
{
  return self->_totalPeers;
}

- (void)setTlkShareGarbageCollectionEnabled:(BOOL)a3
{
  self->_tlkShareGarbageCollectionEnabled = a3;
}

- (BOOL)tlkShareGarbageCollectionEnabled
{
  return self->_tlkShareGarbageCollectionEnabled;
}

- (void)setCollectedTlkShares:(unint64_t)a3
{
  self->_collectedTlkShares = a3;
}

- (unint64_t)collectedTlkShares
{
  return self->_collectedTlkShares;
}

- (void)setCollectableTlkShares:(unint64_t)a3
{
  self->_collectableTlkShares = a3;
}

- (unint64_t)collectableTlkShares
{
  return self->_collectableTlkShares;
}

- (void)setTotalTlkShares:(unint64_t)a3
{
  self->_totalTlkShares = a3;
}

- (unint64_t)totalTlkShares
{
  return self->_totalTlkShares;
}

- (void)setEscrowRecordGarbageCollectionEnabled:(BOOL)a3
{
  self->_escrowRecordGarbageCollectionEnabled = a3;
}

- (BOOL)escrowRecordGarbageCollectionEnabled
{
  return self->_escrowRecordGarbageCollectionEnabled;
}

- (void)setCollectedEscrowRecords:(unint64_t)a3
{
  self->_collectedEscrowRecords = a3;
}

- (unint64_t)collectedEscrowRecords
{
  return self->_collectedEscrowRecords;
}

- (void)setCollectableEscrowRecords:(unint64_t)a3
{
  self->_collectableEscrowRecords = a3;
}

- (unint64_t)collectableEscrowRecords
{
  return self->_collectableEscrowRecords;
}

- (void)setTotalEscrowRecords:(unint64_t)a3
{
  self->_totalEscrowRecords = a3;
}

- (unint64_t)totalEscrowRecords
{
  return self->_totalEscrowRecords;
}

- (void)setMoveRequest:(id)a3
{
}

- (OTEscrowMoveRequestContext)moveRequest
{
  return (OTEscrowMoveRequestContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReroll:(BOOL)a3
{
  self->_reroll = a3;
}

- (BOOL)reroll
{
  return self->_reroll;
}

- (void)setLeaveTrust:(BOOL)a3
{
  self->_leaveTrust = a3;
}

- (BOOL)leaveTrust
{
  return self->_leaveTrust;
}

- (void)setResetOctagon:(BOOL)a3
{
  self->_resetOctagon = a3;
}

- (BOOL)resetOctagon
{
  return self->_resetOctagon;
}

- (void)setPostEscrowCFU:(BOOL)a3
{
  self->_postEscrowCFU = a3;
}

- (BOOL)postEscrowCFU
{
  return self->_postEscrowCFU;
}

- (void)setPostRepairCFU:(BOOL)a3
{
  self->_postRepairCFU = a3;
}

- (BOOL)postRepairCFU
{
  return self->_postRepairCFU;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self postRepairCFU]];
  [v3 setObject:v4 forKeyedSubscript:@"postRepairCFU"];

  v5 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self postEscrowCFU]];
  [v3 setObject:v5 forKeyedSubscript:@"postEscrowCFU"];

  v6 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self resetOctagon]];
  [v3 setObject:v6 forKeyedSubscript:@"resetOctagon"];

  v7 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self leaveTrust]];
  [v3 setObject:v7 forKeyedSubscript:@"leaveTrust"];

  v8 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self reroll]];
  [v3 setObject:v8 forKeyedSubscript:@"reroll"];

  v9 = [(TrustedPeersHelperHealthCheckResult *)self moveRequest];

  if (v9)
  {
    v10 = [(TrustedPeersHelperHealthCheckResult *)self moveRequest];
    v11 = [v10 dictionaryRepresentation];
    [v3 setObject:v11 forKeyedSubscript:@"moveRequest"];
  }
  v12 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self totalEscrowRecords]];
  [v3 setObject:v12 forKeyedSubscript:@"totalEscrowRecords"];

  v13 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self collectableEscrowRecords]];
  [v3 setObject:v13 forKeyedSubscript:@"collectableEscrowRecords"];

  v14 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self collectedEscrowRecords]];
  [v3 setObject:v14 forKeyedSubscript:@"collectedEscrowRecords"];

  v15 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self escrowRecordGarbageCollectionEnabled]];
  [v3 setObject:v15 forKeyedSubscript:@"escrowRecordGarbageCollectionEnabled"];

  v16 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self totalTlkShares]];
  [v3 setObject:v16 forKeyedSubscript:@"totalTlkShares"];

  v17 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self collectableTlkShares]];
  [v3 setObject:v17 forKeyedSubscript:@"collectableTlkShares"];

  v18 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self collectedTlkShares]];
  [v3 setObject:v18 forKeyedSubscript:@"collectedTlkShares"];

  v19 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self tlkShareGarbageCollectionEnabled]];
  [v3 setObject:v19 forKeyedSubscript:@"tlkShareGarbageCollectionEnabled"];

  v20 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self totalPeers]];
  [v3 setObject:v20 forKeyedSubscript:@"totalPeers"];

  v21 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self trustedPeers]];
  [v3 setObject:v21 forKeyedSubscript:@"trustedPeers"];

  v22 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self superfluousPeers]];
  [v3 setObject:v22 forKeyedSubscript:@"superfluousPeers"];

  v23 = +[NSNumber numberWithUnsignedLongLong:[(TrustedPeersHelperHealthCheckResult *)self peersCleanedup]];
  [v3 setObject:v23 forKeyedSubscript:@"peersCleanedup"];

  v24 = +[NSNumber numberWithBool:[(TrustedPeersHelperHealthCheckResult *)self superfluousPeersCleanupEnabled]];
  [v3 setObject:v24 forKeyedSubscript:@"superfluousPeersCleanupEnabled"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult postRepairCFU](self, "postRepairCFU") forKey:@"postRepairCFU"];
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult postEscrowCFU](self, "postEscrowCFU") forKey:@"postEscrowCFU"];
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult resetOctagon](self, "resetOctagon") forKey:@"resetOctagon"];
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult leaveTrust](self, "leaveTrust") forKey:@"leaveTrust"];
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult reroll](self, "reroll") forKey:@"reroll"];
  v4 = [(TrustedPeersHelperHealthCheckResult *)self moveRequest];
  [v5 encodeObject:v4 forKey:@"moveRequest"];

  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult totalEscrowRecords](self, "totalEscrowRecords") forKey:@"totalEscrowRecords"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectableEscrowRecords](self, "collectableEscrowRecords") forKey:@"collectableEscrowRecords"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectedEscrowRecords](self, "collectedEscrowRecords") forKey:@"collectedEscrowRecords"];
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult escrowRecordGarbageCollectionEnabled](self, "escrowRecordGarbageCollectionEnabled") forKey:@"escrowRecordGarbageCollectionEnabled"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult totalTlkShares](self, "totalTlkShares") forKey:@"totalTlkShares"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectableTlkShares](self, "collectableTlkShares") forKey:@"collectableTlkShares"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectedTlkShares](self, "collectedTlkShares") forKey:@"collectedTlkShares"];
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult tlkShareGarbageCollectionEnabled](self, "tlkShareGarbageCollectionEnabled") forKey:@"tlkShareGarbageCollectionEnabled"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult totalPeers](self, "totalPeers") forKey:@"totalPeers"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult trustedPeers](self, "trustedPeers") forKey:@"trustedPeers"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult superfluousPeers](self, "superfluousPeers") forKey:@"superfluousPeers"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult peersCleanedup](self, "peersCleanedup") forKey:@"peersCleanedup"];
  [v5 encodeBool:-[TrustedPeersHelperHealthCheckResult superfluousPeersCleanupEnabled](self, "superfluousPeersCleanupEnabled") forKey:@"superfluousPeersCleanupEnabled"];
}

- (TrustedPeersHelperHealthCheckResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrustedPeersHelperHealthCheckResult;
  id v5 = [(TrustedPeersHelperHealthCheckResult *)&v9 init];
  if (v5)
  {
    v5->_postRepairCFU = [v4 decodeBoolForKey:@"postRepairCFU"];
    v5->_postEscrowCFU = [v4 decodeBoolForKey:@"postEscrowCFU"];
    v5->_resetOctagon = [v4 decodeBoolForKey:@"resetOctagon"];
    v5->_leaveTrust = [v4 decodeBoolForKey:@"leaveTrust"];
    v5->_reroll = [v4 decodeBoolForKey:@"reroll"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moveRequest"];
    moveRequest = v5->_moveRequest;
    v5->_moveRequest = (OTEscrowMoveRequestContext *)v6;

    v5->_totalEscrowRecords = (unint64_t)[v4 decodeInt64ForKey:@"totalEscrowRecords"];
    v5->_collectableEscrowRecords = (unint64_t)[v4 decodeInt64ForKey:@"collectableEscrowRecords"];
    v5->_collectedEscrowRecords = (unint64_t)[v4 decodeInt64ForKey:@"collectedEscrowRecords"];
    v5->_escrowRecordGarbageCollectionEnabled = [v4 decodeBoolForKey:@"escrowRecordGarbageCollectionEnabled"];
    v5->_totalTlkShares = (unint64_t)[v4 decodeInt64ForKey:@"totalTlkShares"];
    v5->_collectableTlkShares = (unint64_t)[v4 decodeInt64ForKey:@"collectableTlkShares"];
    v5->_collectedTlkShares = (unint64_t)[v4 decodeInt64ForKey:@"collectedTlkShares"];
    v5->_tlkShareGarbageCollectionEnabled = [v4 decodeBoolForKey:@"tlkShareGarbageCollectionEnabled"];
    v5->_totalPeers = (unint64_t)[v4 decodeInt64ForKey:@"totalPeers"];
    v5->_trustedPeers = (unint64_t)[v4 decodeInt64ForKey:@"trustedPeers"];
    v5->_superfluousPeers = (unint64_t)[v4 decodeInt64ForKey:@"superfluousPeers"];
    v5->_peersCleanedup = (unint64_t)[v4 decodeInt64ForKey:@"peersCleanedup"];
    v5->_superfluousPeersCleanupEnabled = [v4 decodeBoolForKey:@"superfluousPeersCleanupEnabled"];
  }

  return v5;
}

- (id)description
{
  if ([(TrustedPeersHelperHealthCheckResult *)self postRepairCFU]) {
    CFStringRef v3 = @"true";
  }
  else {
    CFStringRef v3 = @"false";
  }
  CFStringRef v29 = v3;
  if ([(TrustedPeersHelperHealthCheckResult *)self postEscrowCFU]) {
    CFStringRef v4 = @"true";
  }
  else {
    CFStringRef v4 = @"false";
  }
  CFStringRef v28 = v4;
  if ([(TrustedPeersHelperHealthCheckResult *)self resetOctagon]) {
    CFStringRef v5 = @"true";
  }
  else {
    CFStringRef v5 = @"false";
  }
  CFStringRef v27 = v5;
  if ([(TrustedPeersHelperHealthCheckResult *)self leaveTrust]) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  CFStringRef v26 = v6;
  if ([(TrustedPeersHelperHealthCheckResult *)self reroll]) {
    CFStringRef v7 = @"true";
  }
  else {
    CFStringRef v7 = @"false";
  }
  CFStringRef v25 = v7;
  v24 = [(TrustedPeersHelperHealthCheckResult *)self moveRequest];
  unint64_t v23 = [(TrustedPeersHelperHealthCheckResult *)self totalEscrowRecords];
  unint64_t v22 = [(TrustedPeersHelperHealthCheckResult *)self collectableEscrowRecords];
  unint64_t v21 = [(TrustedPeersHelperHealthCheckResult *)self collectedEscrowRecords];
  if ([(TrustedPeersHelperHealthCheckResult *)self escrowRecordGarbageCollectionEnabled])
  {
    CFStringRef v8 = @"true";
  }
  else
  {
    CFStringRef v8 = @"false";
  }
  CFStringRef v20 = v8;
  unint64_t v19 = [(TrustedPeersHelperHealthCheckResult *)self totalTlkShares];
  unint64_t v9 = [(TrustedPeersHelperHealthCheckResult *)self collectableTlkShares];
  unint64_t v10 = [(TrustedPeersHelperHealthCheckResult *)self collectedTlkShares];
  if ([(TrustedPeersHelperHealthCheckResult *)self tlkShareGarbageCollectionEnabled]) {
    CFStringRef v11 = @"true";
  }
  else {
    CFStringRef v11 = @"false";
  }
  unint64_t v12 = [(TrustedPeersHelperHealthCheckResult *)self totalPeers];
  unint64_t v13 = [(TrustedPeersHelperHealthCheckResult *)self trustedPeers];
  unint64_t v14 = [(TrustedPeersHelperHealthCheckResult *)self superfluousPeers];
  unint64_t v15 = [(TrustedPeersHelperHealthCheckResult *)self peersCleanedup];
  if ([(TrustedPeersHelperHealthCheckResult *)self superfluousPeersCleanupEnabled]) {
    CFStringRef v16 = @"true";
  }
  else {
    CFStringRef v16 = @"false";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<HealthCheckResult: postRepairCFU: %@, postEscrowCFU: %@, resetOctagon: %@, leaveTrust: %@, reroll: %@, moveRequest? %@, totalEscrowRecords: %llu, collectableEscrowRecords: %llu, collectedEscrowRecords: %llu, escrowRecordGarbageCollectionEnabled: %@, totalTlkShares: %llu, collectableTlkShares: %llu, collectedTlkShares: %llu, tlkShareGarbageCollectionEnabled: %@, totalPeers: %llu, trustedPeers: %llu, superfluousPeers: %llu, peersCleanedup: %llu, superfluousPeersCleanupEnabled: %@>", v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v9, v10, v11, v12, v13,
    v14,
    v15,
  v17 = v16);

  return v17;
}

- (TrustedPeersHelperHealthCheckResult)initWithPostRepairCFU:(BOOL)a3 postEscrowCFU:(BOOL)a4 resetOctagon:(BOOL)a5 leaveTrust:(BOOL)a6 reroll:(BOOL)a7 moveRequest:(id)a8 totalEscrowRecords:(unint64_t)a9 collectableEscrowRecords:(unint64_t)a10 collectedEscrowRecords:(unint64_t)a11 escrowRecordGarbageCollectionEnabled:(BOOL)a12 totalTlkShares:(unint64_t)a13 collectableTlkShares:(unint64_t)a14 collectedTlkShares:(unint64_t)a15 tlkShareGarbageCollectionEnabled:(BOOL)a16 totalPeers:(unint64_t)a17 trustedPeers:(unint64_t)a18 superfluousPeers:(unint64_t)a19 peersCleanedup:(unint64_t)a20 superfluousPeersCleanupEnabled:(BOOL)a21
{
  id v28 = a8;
  v32.receiver = self;
  v32.super_class = (Class)TrustedPeersHelperHealthCheckResult;
  CFStringRef v29 = [(TrustedPeersHelperHealthCheckResult *)&v32 init];
  v30 = v29;
  if (v29)
  {
    v29->_postRepairCFU = a3;
    v29->_postEscrowCFU = a4;
    v29->_resetOctagon = a5;
    v29->_leaveTrust = a6;
    v29->_reroll = a7;
    objc_storeStrong((id *)&v29->_moveRequest, a8);
    v30->_totalEscrowRecords = a9;
    v30->_collectableEscrowRecords = a10;
    v30->_escrowRecordGarbageCollectionEnabled = a12;
    v30->_collectedEscrowRecords = a11;
    v30->_totalTlkShares = a13;
    v30->_collectableTlkShares = a14;
    v30->_collectedTlkShares = a15;
    v30->_tlkShareGarbageCollectionEnabled = a16;
    v30->_totalPeers = a17;
    v30->_trustedPeers = a18;
    v30->_superfluousPeers = a19;
    v30->_peersCleanedup = a20;
    v30->_superfluousPeersCleanupEnabled = a21;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end