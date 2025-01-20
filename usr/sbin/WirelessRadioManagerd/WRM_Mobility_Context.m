@interface WRM_Mobility_Context
- (BOOL)getCallState;
- (BOOL)linkPreferenceNotificationRequired;
- (BOOL)mobilityContextStale;
- (WRM_Mobility_Context)init;
- (double)getDeltaTimeSinceLastCellularRecommendation;
- (int)getConnectedLinkType;
- (int)getHandoverReasonType;
- (int)getRecommenedLinkType;
- (unint64_t)getApplicationType;
- (unint64_t)getBandwidth;
- (unint64_t)getLinkQoS;
- (unint64_t)getMappedApplicationType;
- (unint64_t)getMaxEvalBW;
- (unint64_t)getMaxMovEvalBW;
- (unint64_t)getMinEvalBW;
- (unint64_t)getMinMovEvalBW;
- (unint64_t)getNetworkEvalBW;
- (unint64_t)getPingPongAvoidanceTimerMultiplier;
- (unint64_t)getSubscriptionType;
- (void)activateMobilityContext:(BOOL)a3;
- (void)dealloc;
- (void)setApplicationType:(unint64_t)a3;
- (void)setBandwidth:(unint64_t)a3;
- (void)setCallState:(BOOL)a3;
- (void)setConnectedLinkType:(int)a3;
- (void)setHandoverReasonType:(int)a3;
- (void)setLinkPreferenceNotificationRequired:(BOOL)a3;
- (void)setLinkQoS:(unint64_t)a3;
- (void)setMappedApplicationType:(unint64_t)a3 :(int)a4;
- (void)setMaxEvalBW:(unint64_t)a3;
- (void)setMaxMovEvalBW:(unint64_t)a3;
- (void)setMinEvalBW:(unint64_t)a3;
- (void)setMinMovEvalBW:(unint64_t)a3;
- (void)setNetworkEvalBW:(unint64_t)a3;
- (void)setPingPongAvoidanceTimerMultiplier:(unint64_t)a3;
- (void)setRecommendedLinkType:(int)a3;
- (void)setSubscriptionType:(unint64_t)a3;
- (void)updatePrevTimeStamp;
@end

@implementation WRM_Mobility_Context

- (unint64_t)getSubscriptionType
{
  return self->m_SubscriptionType;
}

- (int)getConnectedLinkType
{
  return self->m_iWLANLinkType;
}

- (BOOL)getCallState
{
  return self->m_callActive;
}

- (unint64_t)getBandwidth
{
  return self->m_LinkBandwidth;
}

- (unint64_t)getApplicationType
{
  return self->m_ApplicationType;
}

- (void)updatePrevTimeStamp
{
  [(NSDate *)self->m_startTime timeIntervalSinceNow];
  self->m_prevTimeSinceStart = v3;
}

- (void)setLinkPreferenceNotificationRequired:(BOOL)a3
{
  self->m_linkPreferenceNotificationRequired = a3;
}

- (BOOL)linkPreferenceNotificationRequired
{
  return self->m_linkPreferenceNotificationRequired;
}

- (WRM_Mobility_Context)init
{
  v5.receiver = self;
  v5.super_class = (Class)WRM_Mobility_Context;
  v2 = [(WRM_Mobility_Context *)&v5 init];
  double v3 = v2;
  if (v2)
  {
    *(void *)&v2->m_iWLANLinkType = 0x200000002;
    v2->m_LinkBandwidth = 0;
    v2->m_ApplicationType = 0;
    v2->m_LinkQoS = 0;
    *(_WORD *)&v2->m_context_stale = 1;
    v2->m_callActive = 0;
    v2->m_startTime = (NSDate *)[+[NSDate date] copy];
    v3->m_prevTimeSinceStart = 0.0;
    v3->mPingPongAvoidanceMultiplier = 1;
    v3->m_SubscriptionType = 0;
  }
  return v3;
}

- (void)dealloc
{
  p_m_startTime = &self->m_startTime;
  m_startTime = self->m_startTime;
  *(void *)&self->m_iWLANLinkType = 0x200000002;
  self->m_context_stale = 0;
  self->m_callActive = 0;
  self->m_LinkBandwidth = 0;
  self->m_ApplicationType = 0;
  self->m_LinkQoS = 0;
  if (m_startTime)
  {

    *p_m_startTime = 0;
    p_m_startTime[1] = 0;
  }
  self->m_linkPreferenceNotificationRequired = 0;
  v5.receiver = self;
  v5.super_class = (Class)WRM_Mobility_Context;
  [(WRM_Mobility_Context *)&v5 dealloc];
}

- (int)getRecommenedLinkType
{
  return self->m_prevRecommendedLinkType;
}

- (unint64_t)getLinkQoS
{
  return self->m_LinkQoS;
}

- (unint64_t)getMinEvalBW
{
  return self->m_minEvalBandwidth;
}

- (unint64_t)getMinMovEvalBW
{
  return self->m_minMovEvalBandwidth;
}

- (unint64_t)getMaxEvalBW
{
  return self->m_maxEvalBandwidth;
}

- (unint64_t)getMaxMovEvalBW
{
  return self->m_maxMovEvalBandwidth;
}

- (unint64_t)getNetworkEvalBW
{
  return self->m_movNWBandwitdh;
}

- (unint64_t)getMappedApplicationType
{
  if (self->m_ApplicationType == 2) {
    return 1;
  }
  else {
    return self->m_ApplicationType;
  }
}

- (BOOL)mobilityContextStale
{
  return self->m_context_stale;
}

- (int)getHandoverReasonType
{
  return self->mHandoverReason;
}

- (void)setHandoverReasonType:(int)a3
{
  self->mHandoverReason = a3;
}

- (void)setConnectedLinkType:(int)a3
{
  self->m_iWLANLinkType = a3;
  if (a3 >= 3)
  {
    double v3 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
    if (a3 == 3) {
      double v3 = "WRM_IWLAN_BLUETOOTH";
    }
  }
  else
  {
    double v3 = (&off_100210F28)[a3];
  }
  +[WCM_Logging logLevel:24, @"Set connected link type %d(%s)", *(void *)&a3, v3 message];
}

- (void)setRecommendedLinkType:(int)a3
{
  self->m_prevRecommendedLinkType = a3;
  if (a3 >= 3)
  {
    double v3 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
    if (a3 == 3) {
      double v3 = "WRM_IWLAN_BLUETOOTH";
    }
  }
  else
  {
    double v3 = (&off_100210F28)[a3];
  }
  +[WCM_Logging logLevel:24, @"Set prev connected link type %d(%s)", *(void *)&a3, v3 message];
}

- (void)setLinkQoS:(unint64_t)a3
{
  self->m_LinkQoS = a3;
}

- (void)setBandwidth:(unint64_t)a3
{
  self->m_LinkBandwidth = a3;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->m_ApplicationType = a3;
}

- (void)setSubscriptionType:(unint64_t)a3
{
  self->m_SubscriptionType = a3;
}

- (void)setMinEvalBW:(unint64_t)a3
{
  self->m_minEvalBandwidth = a3;
}

- (void)setMinMovEvalBW:(unint64_t)a3
{
  self->m_minMovEvalBandwidth = a3;
}

- (void)setMaxEvalBW:(unint64_t)a3
{
  self->m_maxEvalBandwidth = a3;
}

- (void)setMaxMovEvalBW:(unint64_t)a3
{
  self->m_maxMovEvalBandwidth = a3;
}

- (void)setNetworkEvalBW:(unint64_t)a3
{
  self->m_movNWBandwitdh = a3;
}

- (void)setMappedApplicationType:(unint64_t)a3 :(int)a4
{
  BOOL v4 = a4 == 2 && a3 == 1;
  unint64_t v5 = 2;
  if (!v4) {
    unint64_t v5 = a3;
  }
  self->m_ApplicationType = v5;
}

- (void)setCallState:(BOOL)a3
{
  self->m_callActive = a3;
}

- (void)activateMobilityContext:(BOOL)a3
{
  if (a3) {
    self->m_context_stale = 0;
  }
}

- (double)getDeltaTimeSinceLastCellularRecommendation
{
  [(NSDate *)self->m_startTime timeIntervalSinceNow];
  return self->m_prevTimeSinceStart - v3;
}

- (void)setPingPongAvoidanceTimerMultiplier:(unint64_t)a3
{
  self->mPingPongAvoidanceMultiplier = a3;
}

- (unint64_t)getPingPongAvoidanceTimerMultiplier
{
  return self->mPingPongAvoidanceMultiplier;
}

@end