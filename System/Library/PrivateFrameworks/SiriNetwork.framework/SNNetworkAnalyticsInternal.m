@interface SNNetworkAnalyticsInternal
+ (SNNetworkAnalyticsInternal)sharedNetworkAnalytics;
+ (id)netEndpointFromDictionary:(id)a3;
+ (id)netSessionConnectionFailedWithError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 isDormant:(BOOL)a7 snConnectionAnalysisInfo:(id)a8;
+ (int)netConnectionModeFrom:(id)a3;
+ (int)netEndpointTypeFrom:(unsigned int)a3;
+ (int)netSessionStateFrom:(id)a3;
+ (int)netSessionTypeFrom:(id)a3;
- (BOOL)emitLogDebug;
- (BOOL)getIsConnectionActive;
- (BOOL)isNetIdAvailable;
- (SNNetworkAnalyticsInternal)init;
- (id)getNetId;
- (id)getOrchestratorRequestId;
- (unsigned)getSequenceNumber;
- (void)increaseSequenceNumber;
- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3;
- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3;
- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3;
- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3;
- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3;
- (void)logPeerConnectionFailed:(id)a3;
- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent;
- (void)logSessionConnectionFailed:(id)a3;
- (void)logSessionConnectionHttpHeaderCreated:(id)a3;
- (void)logSessionConnectionSnapshotCaptured:(id)a3;
- (void)reset;
- (void)resetNetId;
- (void)resetSequenceNumber;
- (void)setConnectionProvider:(id)a3;
- (void)setIsConnectionActive:(BOOL)a3;
- (void)setNetId:(id)a3;
- (void)setNetIdAvailable:(BOOL)a3;
- (void)setNetworkConnectionId:(id)a3;
- (void)setOrchestatorRequestId:(id)a3;
@end

@implementation SNNetworkAnalyticsInternal

+ (SNNetworkAnalyticsInternal)sharedNetworkAnalytics
{
  id v2 = static NetworkAnalytics.sharedNetworkAnalytics.getter();

  return (SNNetworkAnalyticsInternal *)v2;
}

- (void)reset
{
  id v2 = self;
  NetworkAnalytics.reset()();
}

- (void)resetNetId
{
  id v2 = self;
  NetworkAnalytics.resetNetId()();
}

- (void)setNetId:(id)a3
{
}

- (id)getNetId
{
  return @objc NetworkAnalytics.getNetId()(self, (uint64_t)a2, (void (*)(void))NetworkAnalytics.getNetId());
}

- (void)setNetworkConnectionId:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  NetworkAnalytics.setNetworkConnectionId(_:)();

  outlined destroy of UUID?((uint64_t)v7, &demangling cache variable for type metadata for UUID?);
}

- (void)setConnectionProvider:(id)a3
{
}

- (unsigned)getSequenceNumber
{
  id v2 = self;
  Swift::UInt32 v3 = NetworkAnalytics.getSequenceNumber()();

  return v3;
}

- (void)setIsConnectionActive:(BOOL)a3
{
  v4 = self;
  NetworkAnalytics.setIsConnectionActive(_:)(a3);
}

- (BOOL)getIsConnectionActive
{
  id v2 = self;
  Swift::Bool IsConnection = NetworkAnalytics.getIsConnectionActive()();

  return IsConnection;
}

- (void)setNetIdAvailable:(BOOL)a3
{
  v4 = self;
  NetworkAnalytics.setNetIdAvailable(_:)(a3);
}

- (BOOL)isNetIdAvailable
{
  id v2 = self;
  Swift::Bool v3 = NetworkAnalytics.isNetIdAvailable()();

  return v3;
}

- (void)increaseSequenceNumber
{
  id v2 = self;
  NetworkAnalytics.increaseSequenceNumber()();
}

- (void)resetSequenceNumber
{
  id v2 = self;
  NetworkAnalytics.resetSequenceNumber()();
}

- (void)setOrchestatorRequestId:(id)a3
{
}

- (id)getOrchestratorRequestId
{
  return @objc NetworkAnalytics.getNetId()(self, (uint64_t)a2, (void (*)(void))NetworkAnalytics.getOrchestratorRequestId());
}

- (BOOL)emitLogDebug
{
  id v2 = self;
  Swift::Bool v3 = NetworkAnalytics.emitLogDebug()();

  return v3;
}

- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent
{
  id v2 = self;
  NetworkAnalytics.logRequestLinkBetweenOrchestratorAndNetworkComponent()();
}

- (void)logSessionConnectionHttpHeaderCreated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logSessionConnectionHttpHeaderCreated(_:)();
}

- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logNetworkConnectionStatePreparationSnapshotCaptured(_:)();
}

- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logDebugNetworkConnectionStatePreparationSnapshotCaptured(_:)();
}

- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logNetworkConnectionStateReadySnapshotCaptured(_:)();
}

- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logDebugNetworkConnectionStateReadySnapshotCaptured(_:)();
}

- (void)logSessionConnectionSnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logSessionConnectionSnapshotCaptured(_:)();
}

- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logDebugSessionConnectionSnapshotCaptured(_:)();
}

- (void)logSessionConnectionFailed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logSessionConnectionFailed(_:)();
}

- (void)logPeerConnectionFailed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NetworkAnalytics.logPeerConnectionFailed(_:)();
}

- (SNNetworkAnalyticsInternal)init
{
}

- (void).cxx_destruct
{
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_netId, &demangling cache variable for type metadata for UUID?);
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_networkConnectionId, &demangling cache variable for type metadata for UUID?);
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_orchestratorRequestId, &demangling cache variable for type metadata for UUID?);
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_netIdForRequestLink, &demangling cache variable for type metadata for UUID?);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_httpHeaderEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_preparationSnapshotEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_debugPreparationSnapshotEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_readySnapshotEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_debugReadySnapshotEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_sessionConnectionSnapthotEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_debugSessionConnectionSnapthotEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_sessionConnectionFailedEvent);
  outlined destroy of NetworkAnalyticsEventMessage((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_peerConnectionFailedEvent);

  swift_unknownObjectRelease();
}

+ (id)netSessionConnectionFailedWithError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 isDormant:(BOOL)a7 snConnectionAnalysisInfo:(id)a8
{
  BOOL v23 = a7;
  id v10 = a5;
  if (a4)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = v15;
  if (a6)
  {
LABEL_4:
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v17;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v16 = 0;
LABEL_8:
  swift_getObjCClassMetadata();
  id v18 = a3;
  id v19 = a8;
  v20 = (void *)static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:snConnectionAnalysisInfo:)(a3, v22, v13, v14, (uint64_t)v10, v16, (uint64_t)a6, v23, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v20;
}

+ (int)netConnectionModeFrom:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  int v3 = static NetworkAnalytics.netConnectionMode(from:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (int)netSessionTypeFrom:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  int v3 = static NetworkAnalytics.netSessionType(from:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (int)netSessionStateFrom:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  int v3 = static NetworkAnalytics.netSessionState(from:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (int)netEndpointTypeFrom:(unsigned int)a3
{
  return static NetworkAnalytics.netEndpointType(from:)(a3);
}

+ (id)netEndpointFromDictionary:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = (void *)static NetworkAnalytics.netEndpointFromDictionary(_:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

@end