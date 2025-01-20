@interface VUIRootControllerConfig
- (NSArray)doNotPurgeList;
- (NSNumber)criticalControllerLimit;
- (NSNumber)normalControllerLimit;
- (NSNumber)teachableMomentImpressionsDictionaryHash;
- (NSNumber)warningControllerLimit;
- (VUIRootControllerConfig)init;
- (double)programmaticOpenSidebarTimeout;
- (double)stackActiveDuration;
- (double)teachableBackgroundReshowTime;
- (double)teachableMomentPillUITimeout;
- (double)teachableMomentSidebarTimeout;
- (double)userDrivenSidebarTimeout;
- (int64_t)numTeachableMomentsPerUser;
- (int64_t)sidebarImagePrefetchBatchLimit;
- (void)setCriticalControllerLimit:(id)a3;
- (void)setDoNotPurgeList:(id)a3;
- (void)setNormalControllerLimit:(id)a3;
- (void)setNumTeachableMomentsPerUser:(int64_t)a3;
- (void)setProgrammaticOpenSidebarTimeout:(double)a3;
- (void)setSidebarImagePrefetchBatchLimit:(int64_t)a3;
- (void)setStackActiveDuration:(double)a3;
- (void)setTeachableBackgroundReshowTime:(double)a3;
- (void)setTeachableMomentImpressionsDictionaryHash:(id)a3;
- (void)setTeachableMomentPillUITimeout:(double)a3;
- (void)setTeachableMomentSidebarTimeout:(double)a3;
- (void)setUserDrivenSidebarTimeout:(double)a3;
- (void)setWarningControllerLimit:(id)a3;
@end

@implementation VUIRootControllerConfig

- (void)setWarningControllerLimit:(id)a3
{
}

- (void)setUserDrivenSidebarTimeout:(double)a3
{
  self->_userDrivenSidebarTimeout = a3;
}

- (void)setStackActiveDuration:(double)a3
{
  self->_stackActiveDuration = a3;
}

- (void)setSidebarImagePrefetchBatchLimit:(int64_t)a3
{
  self->_sidebarImagePrefetchBatchLimit = a3;
}

- (void)setProgrammaticOpenSidebarTimeout:(double)a3
{
  self->_programmaticOpenSidebarTimeout = a3;
}

- (void)setNormalControllerLimit:(id)a3
{
}

- (void)setDoNotPurgeList:(id)a3
{
}

- (void)setCriticalControllerLimit:(id)a3
{
}

- (VUIRootControllerConfig)init
{
  v11.receiver = self;
  v11.super_class = (Class)VUIRootControllerConfig;
  v2 = [(VUIRootControllerConfig *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:30];
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:20];
    v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:10];
    v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    v9 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = &unk_1F3F3E3D8;

    *((void *)v2 + 1) = 28;
    *((void *)v2 + 8) = 0x407E000000000000;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
  }
  return (VUIRootControllerConfig *)v2;
}

- (int64_t)sidebarImagePrefetchBatchLimit
{
  return self->_sidebarImagePrefetchBatchLimit;
}

- (double)programmaticOpenSidebarTimeout
{
  return self->_programmaticOpenSidebarTimeout;
}

- (double)userDrivenSidebarTimeout
{
  return self->_userDrivenSidebarTimeout;
}

- (NSNumber)normalControllerLimit
{
  return self->_normalControllerLimit;
}

- (NSNumber)warningControllerLimit
{
  return self->_warningControllerLimit;
}

- (NSNumber)criticalControllerLimit
{
  return self->_criticalControllerLimit;
}

- (NSArray)doNotPurgeList
{
  return self->_doNotPurgeList;
}

- (double)stackActiveDuration
{
  return self->_stackActiveDuration;
}

- (int64_t)numTeachableMomentsPerUser
{
  return self->_numTeachableMomentsPerUser;
}

- (void)setNumTeachableMomentsPerUser:(int64_t)a3
{
  self->_numTeachableMomentsPerUser = a3;
}

- (double)teachableMomentSidebarTimeout
{
  return self->_teachableMomentSidebarTimeout;
}

- (void)setTeachableMomentSidebarTimeout:(double)a3
{
  self->_teachableMomentSidebarTimeout = a3;
}

- (double)teachableMomentPillUITimeout
{
  return self->_teachableMomentPillUITimeout;
}

- (void)setTeachableMomentPillUITimeout:(double)a3
{
  self->_teachableMomentPillUITimeout = a3;
}

- (double)teachableBackgroundReshowTime
{
  return self->_teachableBackgroundReshowTime;
}

- (void)setTeachableBackgroundReshowTime:(double)a3
{
  self->_teachableBackgroundReshowTime = a3;
}

- (NSNumber)teachableMomentImpressionsDictionaryHash
{
  return self->_teachableMomentImpressionsDictionaryHash;
}

- (void)setTeachableMomentImpressionsDictionaryHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teachableMomentImpressionsDictionaryHash, 0);
  objc_storeStrong((id *)&self->_doNotPurgeList, 0);
  objc_storeStrong((id *)&self->_criticalControllerLimit, 0);
  objc_storeStrong((id *)&self->_warningControllerLimit, 0);
  objc_storeStrong((id *)&self->_normalControllerLimit, 0);
}

@end