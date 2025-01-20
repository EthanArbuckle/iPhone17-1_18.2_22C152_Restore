@interface UIUpdateInfo
- (BOOL)isImmediatePresentationExpected;
- (BOOL)isLowLatencyEventDispatchConfirmed;
- (BOOL)isPerformingLowLatencyPhases;
- (double)completionDeadlineTime;
- (double)estimatedPresentationTime;
- (double)initWithUpdateParameters:(void *)a1;
- (double)modelTime;
@end

@implementation UIUpdateInfo

- (double)initWithUpdateParameters:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)UIUpdateInfo;
  v3 = (double *)objc_msgSendSuper2(&v5, sel_init);
  if (v3)
  {
    v3[3] = _UIMediaTimeForMachTime(*(void *)a2);
    v3[4] = _UIMediaTimeForMachTime(*(void *)(a2 + 16));
    v3[5] = _UIMediaTimeForMachTime(*(void *)(a2 + 24));
    *((unsigned char *)v3 + 18) = *(unsigned char *)(a2 + 32);
    *((unsigned char *)v3 + 16) = *(unsigned char *)(a2 + 33);
    v3[1] = *(double *)(a2 + 40);
  }
  return v3;
}

- (double)modelTime
{
  return self->_modelTime;
}

- (double)completionDeadlineTime
{
  return self->_completionDeadlineTime;
}

- (double)estimatedPresentationTime
{
  return self->_estimatedPresentationTime;
}

- (BOOL)isImmediatePresentationExpected
{
  return self->_immediatePresentationExpected;
}

- (BOOL)isLowLatencyEventDispatchConfirmed
{
  return self->_lowLatencyEventDispatchConfirmed;
}

- (BOOL)isPerformingLowLatencyPhases
{
  return self->_performingLowLatencyPhases;
}

@end