@interface PLSearchIndexPendingWorkItem
+ (id)pendingWorkItemWithType:(signed __int16)a3 flags:(int64_t)a4;
+ (id)rebuildInProgressPendingWorkItem;
- (BOOL)rebuildInProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)jobFlags;
- (signed)jobType;
- (void)setJobFlags:(int64_t)a3;
- (void)setJobType:(signed __int16)a3;
- (void)setRebuildInProgress:(BOOL)a3;
@end

@implementation PLSearchIndexPendingWorkItem

- (void)setJobFlags:(int64_t)a3
{
  self->_jobFlags = a3;
}

- (int64_t)jobFlags
{
  return self->_jobFlags;
}

- (void)setJobType:(signed __int16)a3
{
  self->_jobType = a3;
}

- (signed)jobType
{
  return self->_jobType;
}

- (void)setRebuildInProgress:(BOOL)a3
{
  self->_rebuildInProgress = a3;
}

- (BOOL)rebuildInProgress
{
  return self->_rebuildInProgress;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(PLSearchIndexPendingWorkItem);
  *((unsigned char *)result + 8) = self->_rebuildInProgress;
  *((_WORD *)result + 5) = self->_jobType;
  *((void *)result + 2) = self->_jobFlags;
  return result;
}

+ (id)pendingWorkItemWithType:(signed __int16)a3 flags:(int64_t)a4
{
  uint64_t v5 = a3;
  id v6 = objc_alloc_init((Class)a1);
  [v6 setJobType:v5];
  [v6 setJobFlags:a4];
  return v6;
}

+ (id)rebuildInProgressPendingWorkItem
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setRebuildInProgress:1];
  return v2;
}

@end