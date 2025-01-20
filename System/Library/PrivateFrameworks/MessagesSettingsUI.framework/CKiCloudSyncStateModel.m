@interface CKiCloudSyncStateModel
- (BOOL)isSyncAvailable;
- (CKiCloudSyncStateModel)init;
- (NSString)lastSyncedDateString;
- (NSString)messagesInCloudCount;
- (NSString)syncStatus;
- (NSString)syncStatusFooterSubstringForHyperlink;
- (NSString)syncStatusFooterText;
- (NSString)syncStatusMacToolTipText;
- (int64_t)syncState;
- (int64_t)syncStatusMacButtonType;
- (void)setLastSyncedDateString:(id)a3;
- (void)setMessagesInCloudCount:(id)a3;
- (void)setSyncAvailable:(BOOL)a3;
- (void)setSyncState:(int64_t)a3;
- (void)setSyncStatus:(id)a3;
- (void)setSyncStatusFooterSubstringForHyperlink:(id)a3;
- (void)setSyncStatusFooterText:(id)a3;
- (void)setSyncStatusMacButtonType:(int64_t)a3;
- (void)setSyncStatusMacToolTipText:(id)a3;
@end

@implementation CKiCloudSyncStateModel

- (CKiCloudSyncStateModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKiCloudSyncStateModel;
  return [(CKiCloudSyncStateModel *)&v3 init];
}

- (int64_t)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(int64_t)a3
{
  self->_syncState = a3;
}

- (int64_t)syncStatusMacButtonType
{
  return self->_syncStatusMacButtonType;
}

- (void)setSyncStatusMacButtonType:(int64_t)a3
{
  self->_syncStatusMacButtonType = a3;
}

- (NSString)messagesInCloudCount
{
  return self->_messagesInCloudCount;
}

- (void)setMessagesInCloudCount:(id)a3
{
}

- (NSString)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(id)a3
{
}

- (NSString)syncStatusFooterText
{
  return self->_syncStatusFooterText;
}

- (void)setSyncStatusFooterText:(id)a3
{
}

- (NSString)syncStatusMacToolTipText
{
  return self->_syncStatusMacToolTipText;
}

- (void)setSyncStatusMacToolTipText:(id)a3
{
}

- (NSString)lastSyncedDateString
{
  return self->_lastSyncedDateString;
}

- (void)setLastSyncedDateString:(id)a3
{
}

- (NSString)syncStatusFooterSubstringForHyperlink
{
  return self->_syncStatusFooterSubstringForHyperlink;
}

- (void)setSyncStatusFooterSubstringForHyperlink:(id)a3
{
}

- (BOOL)isSyncAvailable
{
  return self->_syncAvailable;
}

- (void)setSyncAvailable:(BOOL)a3
{
  self->_syncAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStatusFooterSubstringForHyperlink, 0);
  objc_storeStrong((id *)&self->_lastSyncedDateString, 0);
  objc_storeStrong((id *)&self->_syncStatusMacToolTipText, 0);
  objc_storeStrong((id *)&self->_syncStatusFooterText, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_messagesInCloudCount, 0);
}

@end