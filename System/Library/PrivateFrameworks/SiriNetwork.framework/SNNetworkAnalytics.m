@interface SNNetworkAnalytics
+ (id)sessionConnectionFailedError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 dormant:(BOOL)a7 connectionAnalysisInfo:(id)a8;
+ (id)sharedSNNetworkAnalytics;
- (BOOL)isConnectionActive;
- (BOOL)isNetIdAvailable;
- (SNNetworkAnalytics)init;
- (SNNetworkAnalyticsInternal)underlyingNetworkAnalytics;
- (id)_init;
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
- (void)setIsConnectionActive:(BOOL)a3;
- (void)setNetId:(id)a3;
- (void)setNetIdAvailable:(BOOL)a3;
- (void)setOrchestratorRequestId:(id)a3;
- (void)setUnderlyingNetworkAnalytics:(id)a3;
@end

@implementation SNNetworkAnalytics

- (SNNetworkAnalytics)init
{
  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SNNetworkAnalytics;
  v2 = [(SNNetworkAnalytics *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SNNetworkAnalyticsInternal sharedNetworkAnalytics];
    underlyingNetworkAnalytics = v2->_underlyingNetworkAnalytics;
    v2->_underlyingNetworkAnalytics = (SNNetworkAnalyticsInternal *)v3;
  }
  return v2;
}

+ (id)sharedSNNetworkAnalytics
{
  if (sharedSNNetworkAnalytics_onceToken != -1) {
    dispatch_once(&sharedSNNetworkAnalytics_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedSNNetworkAnalytics_shared;

  return v2;
}

void __46__SNNetworkAnalytics_sharedSNNetworkAnalytics__block_invoke()
{
  id v0 = [[SNNetworkAnalytics alloc] _init];
  v1 = (void *)sharedSNNetworkAnalytics_shared;
  sharedSNNetworkAnalytics_shared = (uint64_t)v0;
}

+ (id)sessionConnectionFailedError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 dormant:(BOOL)a7 connectionAnalysisInfo:(id)a8
{
  return +[SNNetworkAnalyticsInternal netSessionConnectionFailedWithError:a3 connectionMode:a4 sessionType:a5 sessionState:a6 isDormant:a7 snConnectionAnalysisInfo:a8];
}

- (void)reset
{
}

- (void)resetNetId
{
}

- (void)setNetId:(id)a3
{
}

- (id)getNetId
{
  return [(SNNetworkAnalyticsInternal *)self->_underlyingNetworkAnalytics getNetId];
}

- (unsigned)getSequenceNumber
{
  return [(SNNetworkAnalyticsInternal *)self->_underlyingNetworkAnalytics getSequenceNumber];
}

- (void)setIsConnectionActive:(BOOL)a3
{
}

- (BOOL)isConnectionActive
{
  return [(SNNetworkAnalyticsInternal *)self->_underlyingNetworkAnalytics getIsConnectionActive];
}

- (void)setNetIdAvailable:(BOOL)a3
{
}

- (BOOL)isNetIdAvailable
{
  return [(SNNetworkAnalyticsInternal *)self->_underlyingNetworkAnalytics isNetIdAvailable];
}

- (void)increaseSequenceNumber
{
}

- (void)resetSequenceNumber
{
}

- (void)setOrchestratorRequestId:(id)a3
{
}

- (id)getOrchestratorRequestId
{
  return [(SNNetworkAnalyticsInternal *)self->_underlyingNetworkAnalytics getOrchestratorRequestId];
}

- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent
{
}

- (void)logSessionConnectionHttpHeaderCreated:(id)a3
{
}

- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
}

- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
}

- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
}

- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
}

- (void)logSessionConnectionSnapshotCaptured:(id)a3
{
}

- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3
{
}

- (void)logSessionConnectionFailed:(id)a3
{
}

- (void)logPeerConnectionFailed:(id)a3
{
}

- (SNNetworkAnalyticsInternal)underlyingNetworkAnalytics
{
  return self->_underlyingNetworkAnalytics;
}

- (void)setUnderlyingNetworkAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end