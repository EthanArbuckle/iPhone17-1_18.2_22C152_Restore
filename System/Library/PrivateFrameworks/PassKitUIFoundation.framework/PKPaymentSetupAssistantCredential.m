@interface PKPaymentSetupAssistantCredential
- (BOOL)isSnapshotFetchInProgress;
- (UIImage)passSnapshot;
- (void)setIsSnapshotFetchInProgress:(BOOL)a3;
- (void)setPassSnapshot:(id)a3;
@end

@implementation PKPaymentSetupAssistantCredential

- (UIImage)passSnapshot
{
  return self->_passSnapshot;
}

- (void)setPassSnapshot:(id)a3
{
}

- (BOOL)isSnapshotFetchInProgress
{
  return self->_isSnapshotFetchInProgress;
}

- (void)setIsSnapshotFetchInProgress:(BOOL)a3
{
  self->_isSnapshotFetchInProgress = a3;
}

- (void).cxx_destruct
{
}

@end