@interface SMSessionManagerMutableState
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setActiveDeviceIdentifier:(id)a3;
- (void)setActivePairedDeviceIdentifier:(id)a3;
- (void)setAllowReadToken:(id)a3;
- (void)setCoarseEstimatedEndDate:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDate:(id)a3;
- (void)setEstimatedEndDate:(id)a3;
- (void)setEstimatedEndDateStatus:(unint64_t)a3;
- (void)setLocation:(id)a3;
- (void)setMonitorContext:(id)a3;
- (void)setSafetyCacheKey:(id)a3;
- (void)setScheduledSendMessageDate:(id)a3;
- (void)setScheduledSendMessageGUID:(id)a3;
- (void)setSessionEndReason:(unint64_t)a3;
- (void)setSessionState:(unint64_t)a3;
- (void)setSessionStateTransitionDate:(id)a3;
- (void)setStartMessageGUID:(id)a3;
- (void)setUserTriggerResponse:(int64_t)a3;
@end

@implementation SMSessionManagerMutableState

- (void)setSessionState:(unint64_t)a3
{
  self->super._sessionState = a3;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setUserTriggerResponse:(int64_t)a3
{
  self->super._userTriggerResponse = a3;
}

- (void)setMonitorContext:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (void)setLocation:(id)a3
{
}

- (void)setAllowReadToken:(id)a3
{
}

- (void)setSafetyCacheKey:(id)a3
{
}

- (void)setStartMessageGUID:(id)a3
{
}

- (void)setScheduledSendMessageGUID:(id)a3
{
}

- (void)setScheduledSendMessageDate:(id)a3
{
}

- (void)setActiveDeviceIdentifier:(id)a3
{
}

- (void)setEstimatedEndDate:(id)a3
{
}

- (void)setCoarseEstimatedEndDate:(id)a3
{
}

- (void)setSessionEndReason:(unint64_t)a3
{
  self->super._sessionEndReason = a3;
}

- (void)setEstimatedEndDateStatus:(unint64_t)a3
{
  self->super._estimatedEndDateStatus = a3;
}

- (void)setSessionStateTransitionDate:(id)a3
{
}

- (void)setActivePairedDeviceIdentifier:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:]([SMSessionManagerState alloc], "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", self->super._sessionState, self->super._configuration, self->super._userTriggerResponse, self->super._monitorContext, self->super._date, self->super._location, self->super._allowReadToken, self->super._safetyCacheKey, self->super._startMessageGUID, self->super._scheduledSendMessageGUID, self->super._scheduledSendMessageDate, self->super._activeDeviceIdentifier, self->super._estimatedEndDate, self->super._coarseEstimatedEndDate, self->super._estimatedEndDateStatus,
           self->super._sessionEndReason,
           self->super._sessionStateTransitionDate,
           self->super._activePairedDeviceIdentifier);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:]([SMSessionManagerMutableState alloc], "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", self->super._sessionState, self->super._configuration, self->super._userTriggerResponse, self->super._monitorContext, self->super._date, self->super._location, self->super._allowReadToken, self->super._safetyCacheKey, self->super._startMessageGUID, self->super._scheduledSendMessageGUID, self->super._scheduledSendMessageDate, self->super._activeDeviceIdentifier, self->super._estimatedEndDate, self->super._coarseEstimatedEndDate, self->super._estimatedEndDateStatus,
           self->super._sessionEndReason,
           self->super._sessionStateTransitionDate,
           self->super._activePairedDeviceIdentifier);
}

@end