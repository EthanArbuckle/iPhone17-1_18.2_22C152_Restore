@interface NMSSyncProgressInfo
+ (id)_stringFromSyncState:(unint64_t)a3;
+ (id)_stringFromWaitingSubstate:(unint64_t)a3;
- (NSString)assetType;
- (float)estimatedSyncProgress;
- (id)description;
- (int64_t)numberOfAssetItems;
- (int64_t)numberOfAssetItemsNeedingDownload;
- (int64_t)numberOfAssetItemsSynced;
- (unint64_t)aggregateAssetItemBytesAdded;
- (unint64_t)syncState;
- (unint64_t)syncWaitingSubstate;
- (void)setAggregateAssetItemBytesAdded:(unint64_t)a3;
- (void)setAssetType:(id)a3;
- (void)setEstimatedSyncProgress:(float)a3;
- (void)setNumberOfAssetItems:(int64_t)a3;
- (void)setNumberOfAssetItemsNeedingDownload:(int64_t)a3;
- (void)setNumberOfAssetItemsSynced:(int64_t)a3;
- (void)setSyncState:(unint64_t)a3;
- (void)setSyncWaitingSubstate:(unint64_t)a3;
@end

@implementation NMSSyncProgressInfo

+ (id)_stringFromSyncState:(unint64_t)a3
{
  v4 = @"Unknown";
  switch(a3)
  {
    case 0uLL:
      goto LABEL_23;
    case 1uLL:
      v4 = @"Idle";
      break;
    case 2uLL:
      v4 = @"Pending";
      break;
    case 3uLL:
      v4 = @"Waiting";
      break;
    case 4uLL:
      v4 = @"Asset Updating";
      break;
    default:
      if (a3 == 98)
      {
        v4 = @"Metadata Syncing";
      }
      else if (a3 == 99)
      {
        v4 = @"Asset Syncing";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown [%tu]", a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:
      }
      break;
  }
  return v4;
}

+ (id)_stringFromWaitingSubstate:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = v4;
  if (v3) {
    [v4 addObject:@"Power"];
  }
  v6 = [v5 description];

  return v6;
}

- (id)description
{
  char v3 = NSString;
  assetType = self->_assetType;
  v5 = [(id)objc_opt_class() _stringFromSyncState:self->_syncState];
  v6 = [(id)objc_opt_class() _stringFromWaitingSubstate:self->_syncWaitingSubstate];
  v7 = [v3 stringWithFormat:@"NMSSyncProgressInfo [%@]: state %@, waitingSubstate:%@, progress %0.4f, assets %ld/%ld (need %ld)", assetType, v5, v6, self->_estimatedSyncProgress, self->_numberOfAssetItemsSynced, self->_numberOfAssetItems, self->_numberOfAssetItemsNeedingDownload];

  return v7;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (unint64_t)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(unint64_t)a3
{
  self->_syncState = a3;
}

- (unint64_t)syncWaitingSubstate
{
  return self->_syncWaitingSubstate;
}

- (void)setSyncWaitingSubstate:(unint64_t)a3
{
  self->_syncWaitingSubstate = a3;
}

- (float)estimatedSyncProgress
{
  return self->_estimatedSyncProgress;
}

- (void)setEstimatedSyncProgress:(float)a3
{
  self->_estimatedSyncProgress = a3;
}

- (int64_t)numberOfAssetItems
{
  return self->_numberOfAssetItems;
}

- (void)setNumberOfAssetItems:(int64_t)a3
{
  self->_numberOfAssetItems = a3;
}

- (int64_t)numberOfAssetItemsSynced
{
  return self->_numberOfAssetItemsSynced;
}

- (void)setNumberOfAssetItemsSynced:(int64_t)a3
{
  self->_numberOfAssetItemsSynced = a3;
}

- (int64_t)numberOfAssetItemsNeedingDownload
{
  return self->_numberOfAssetItemsNeedingDownload;
}

- (void)setNumberOfAssetItemsNeedingDownload:(int64_t)a3
{
  self->_numberOfAssetItemsNeedingDownload = a3;
}

- (unint64_t)aggregateAssetItemBytesAdded
{
  return self->_aggregateAssetItemBytesAdded;
}

- (void)setAggregateAssetItemBytesAdded:(unint64_t)a3
{
  self->_aggregateAssetItemBytesAdded = a3;
}

- (void).cxx_destruct
{
}

@end