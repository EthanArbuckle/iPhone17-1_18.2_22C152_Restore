@interface PXCPLUIStatus
- (BOOL)hasCompletedInitialSync;
- (BOOL)inResetSync;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExiting;
- (BOOL)isPaused;
- (BOOL)isRestoringLibrary;
- (BOOL)isUpgradeSuggestedToAccessAllPhotos;
- (NSString)actionConfirmationAlertButtonTitle;
- (NSString)actionConfirmationAlertSubtitle;
- (NSString)actionConfirmationAlertTitle;
- (NSString)actionTitle;
- (NSString)failureDescription;
- (NSString)internalInformationMessage;
- (NSString)referencedItemsDescription;
- (NSString)startSyncDescription;
- (NSString)stateDescription;
- (PXCPLUIStatus)init;
- (float)progress;
- (id)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)pauseReason;
- (int64_t)serviceAction;
- (int64_t)state;
- (unint64_t)activity;
- (unint64_t)numberOfItemsFailingToUpload;
- (unint64_t)numberOfOtherAssets;
- (unint64_t)numberOfPhotoAssets;
- (unint64_t)numberOfVideoAssets;
- (void)setAction:(id)a3;
- (void)setActionConfirmationAlertButtonTitle:(id)a3;
- (void)setActionConfirmationAlertSubtitle:(id)a3;
- (void)setActionConfirmationAlertTitle:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActivity:(unint64_t)a3;
- (void)setFailureDescription:(id)a3;
- (void)setHasCompletedInitialSync:(BOOL)a3;
- (void)setInResetSync:(BOOL)a3;
- (void)setInternalInformationMessage:(id)a3;
- (void)setIsExiting:(BOOL)a3;
- (void)setIsRestoringLibrary:(BOOL)a3;
- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3;
- (void)setNumberOfItemsFailingToUpload:(unint64_t)a3;
- (void)setNumberOfOtherAssets:(unint64_t)a3;
- (void)setNumberOfPhotoAssets:(unint64_t)a3;
- (void)setNumberOfVideoAssets:(unint64_t)a3;
- (void)setPauseReason:(int64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)setProgress:(float)a3;
- (void)setReferencedItemsDescription:(id)a3;
- (void)setServiceAction:(int64_t)a3;
- (void)setStartSyncDescription:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateDescription:(id)a3;
@end

@implementation PXCPLUIStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedItemsDescription, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_internalInformationMessage, 0);
  objc_storeStrong((id *)&self->_failureDescription, 0);
  objc_storeStrong((id *)&self->_startSyncDescription, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
}

- (void)setNumberOfOtherAssets:(unint64_t)a3
{
  self->_numberOfOtherAssets = a3;
}

- (unint64_t)numberOfOtherAssets
{
  return self->_numberOfOtherAssets;
}

- (void)setNumberOfVideoAssets:(unint64_t)a3
{
  self->_numberOfVideoAssets = a3;
}

- (unint64_t)numberOfVideoAssets
{
  return self->_numberOfVideoAssets;
}

- (void)setNumberOfPhotoAssets:(unint64_t)a3
{
  self->_numberOfPhotoAssets = a3;
}

- (unint64_t)numberOfPhotoAssets
{
  return self->_numberOfPhotoAssets;
}

- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  self->_isUpgradeSuggestedToAccessAllPhotos = a3;
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return self->_isUpgradeSuggestedToAccessAllPhotos;
}

- (void)setNumberOfItemsFailingToUpload:(unint64_t)a3
{
  self->_numberOfItemsFailingToUpload = a3;
}

- (unint64_t)numberOfItemsFailingToUpload
{
  return self->_numberOfItemsFailingToUpload;
}

- (void)setIsExiting:(BOOL)a3
{
  self->_isExiting = a3;
}

- (BOOL)isExiting
{
  return self->_isExiting;
}

- (void)setHasCompletedInitialSync:(BOOL)a3
{
  self->_hasCompletedInitialSync = a3;
}

- (BOOL)hasCompletedInitialSync
{
  return self->_hasCompletedInitialSync;
}

- (void)setIsRestoringLibrary:(BOOL)a3
{
  self->_isRestoringLibrary = a3;
}

- (BOOL)isRestoringLibrary
{
  return self->_isRestoringLibrary;
}

- (void)setInResetSync:(BOOL)a3
{
  self->_inResetSync = a3;
}

- (BOOL)inResetSync
{
  return self->_inResetSync;
}

- (void)setPauseReason:(int64_t)a3
{
  self->_pauseReason = a3;
}

- (int64_t)pauseReason
{
  return self->_pauseReason;
}

- (void)setActivity:(unint64_t)a3
{
  self->_activity = a3;
}

- (unint64_t)activity
{
  return self->_activity;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setReferencedItemsDescription:(id)a3
{
}

- (NSString)referencedItemsDescription
{
  return self->_referencedItemsDescription;
}

- (void)setServiceAction:(int64_t)a3
{
  self->_serviceAction = a3;
}

- (int64_t)serviceAction
{
  return self->_serviceAction;
}

- (void)setAction:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (void)setActionConfirmationAlertTitle:(id)a3
{
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setInternalInformationMessage:(id)a3
{
}

- (NSString)internalInformationMessage
{
  return self->_internalInformationMessage;
}

- (void)setFailureDescription:(id)a3
{
}

- (NSString)failureDescription
{
  return self->_failureDescription;
}

- (void)setStartSyncDescription:(id)a3
{
}

- (NSString)startSyncDescription
{
  return self->_startSyncDescription;
}

- (void)setStateDescription:(id)a3
{
}

- (NSString)stateDescription
{
  return self->_stateDescription;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXCPLUIStatus *)self stateDescription];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[3];
  v4[3] = v6;

  v8 = [(PXCPLUIStatus *)self startSyncDescription];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = [(PXCPLUIStatus *)self failureDescription];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[5];
  v4[5] = v12;

  v14 = [(PXCPLUIStatus *)self internalInformationMessage];
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[6];
  v4[6] = v15;

  *((unsigned char *)v4 + 8) = [(PXCPLUIStatus *)self isPaused];
  [(PXCPLUIStatus *)self progress];
  *((_DWORD *)v4 + 4) = v17;
  v18 = [(PXCPLUIStatus *)self referencedItemsDescription];
  uint64_t v19 = [v18 copy];
  v20 = (void *)v4[13];
  v4[13] = v19;

  v21 = [(PXCPLUIStatus *)self actionTitle];
  uint64_t v22 = [v21 copy];
  v23 = (void *)v4[7];
  v4[7] = v22;

  v24 = [(PXCPLUIStatus *)self actionConfirmationAlertTitle];
  uint64_t v25 = [v24 copy];
  v26 = (void *)v4[8];
  v4[8] = v25;

  v27 = [(PXCPLUIStatus *)self actionConfirmationAlertSubtitle];
  uint64_t v28 = [v27 copy];
  v29 = (void *)v4[9];
  v4[9] = v28;

  v30 = [(PXCPLUIStatus *)self actionConfirmationAlertButtonTitle];
  uint64_t v31 = [v30 copy];
  v32 = (void *)v4[10];
  v4[10] = v31;

  v33 = [(PXCPLUIStatus *)self action];
  uint64_t v34 = [v33 copy];
  v35 = (void *)v4[11];
  v4[11] = v34;

  v4[12] = [(PXCPLUIStatus *)self serviceAction];
  v4[14] = [(PXCPLUIStatus *)self state];
  v4[15] = [(PXCPLUIStatus *)self activity];
  v4[16] = [(PXCPLUIStatus *)self pauseReason];
  *((unsigned char *)v4 + 9) = [(PXCPLUIStatus *)self inResetSync];
  *((unsigned char *)v4 + 10) = [(PXCPLUIStatus *)self isRestoringLibrary];
  *((unsigned char *)v4 + 11) = [(PXCPLUIStatus *)self hasCompletedInitialSync];
  *((unsigned char *)v4 + 12) = [(PXCPLUIStatus *)self isExiting];
  v4[17] = [(PXCPLUIStatus *)self numberOfItemsFailingToUpload];
  *((unsigned char *)v4 + 13) = [(PXCPLUIStatus *)self isUpgradeSuggestedToAccessAllPhotos];
  v4[18] = [(PXCPLUIStatus *)self numberOfPhotoAssets];
  v4[19] = [(PXCPLUIStatus *)self numberOfVideoAssets];
  v4[20] = [(PXCPLUIStatus *)self numberOfOtherAssets];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && PXCPLUIStatusDiff(self, v4) == 0;

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_stateDescription) {
    stateDescription = (__CFString *)self->_stateDescription;
  }
  else {
    stateDescription = @"-";
  }
  if (self->_startSyncDescription) {
    startSyncDescription = (__CFString *)self->_startSyncDescription;
  }
  else {
    startSyncDescription = @"-";
  }
  if (self->_failureDescription) {
    failureDescription = (__CFString *)self->_failureDescription;
  }
  else {
    failureDescription = @"-";
  }
  if (self->_internalInformationMessage) {
    internalInformationMessage = (__CFString *)self->_internalInformationMessage;
  }
  else {
    internalInformationMessage = @"-";
  }
  BOOL paused = self->_paused;
  float progress = self->_progress;
  if (progress == -1.0)
  {
    v11 = @"\"-\"";
  }
  else
  {
    v11 = [NSString stringWithFormat:@"%.2f", progress];
  }
  unint64_t serviceAction = self->_serviceAction;
  uint64_t v39 = v4;
  v40 = v3;
  v38 = v11;
  if (serviceAction > 0xB) {
    v13 = 0;
  }
  else {
    v13 = off_1E5DCF320[serviceAction];
  }
  v14 = v13;
  if (self->_actionTitle) {
    actionTitle = (__CFString *)self->_actionTitle;
  }
  else {
    actionTitle = @"-";
  }
  if (self->_actionConfirmationAlertTitle) {
    actionConfirmationAlertTitle = (__CFString *)self->_actionConfirmationAlertTitle;
  }
  else {
    actionConfirmationAlertTitle = @"-";
  }
  if (self->_actionConfirmationAlertSubtitle) {
    actionConfirmationAlertSubtitle = (__CFString *)self->_actionConfirmationAlertSubtitle;
  }
  else {
    actionConfirmationAlertSubtitle = @"-";
  }
  if (self->_actionConfirmationAlertButtonTitle) {
    actionConfirmationAlertButtonTitle = (__CFString *)self->_actionConfirmationAlertButtonTitle;
  }
  else {
    actionConfirmationAlertButtonTitle = @"-";
  }
  referencedItemsDescription = (__CFString *)self->_referencedItemsDescription;
  unint64_t state = self->_state;
  if (!referencedItemsDescription) {
    referencedItemsDescription = @"-";
  }
  v36 = actionTitle;
  v37 = startSyncDescription;
  uint64_t v34 = actionConfirmationAlertSubtitle;
  v35 = actionConfirmationAlertTitle;
  v33 = referencedItemsDescription;
  if (state > 2) {
    v21 = 0;
  }
  else {
    v21 = off_1E5DCF230[state];
  }
  uint64_t v22 = v21;
  unint64_t pauseReason = self->_pauseReason;
  v24 = failureDescription;
  if (pauseReason > 0x12) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = off_1E5DCF288[pauseReason];
  }
  v26 = v25;
  unint64_t activity = self->_activity;
  uint64_t v28 = internalInformationMessage;
  if (activity > 7) {
    v29 = 0;
  }
  else {
    v29 = off_1E5DCF248[activity];
  }
  v30 = v29;
  objc_msgSend(v40, "stringWithFormat:", @"<%@: stateDescription:\"%@\", startSyncDescription:\"%@\", failureDescription:\"%@\", internalInformationMessage:\"%@\", paused:%d, progress:%@, action:\"%@/%@\", alert:\"%@/%@/%@\", referencedItemsDescription:\"%@\", state:\"%@\", pause:\"%@\", activity:\"%@\", reset:%d, rebuild:%d, synced:%d, exiting:%d, failed:%lu, upgrade:%d, #photo/video/other:%lu/%lu/%lu>", v39, stateDescription, v37, v24, v28, paused, v38, v14, v36, v35, v34, actionConfirmationAlertButtonTitle, v33, v22, v26, v30,
    self->_inResetSync,
    self->_isRestoringLibrary,
    self->_hasCompletedInitialSync,
    self->_isExiting,
    self->_numberOfItemsFailingToUpload,
    self->_isUpgradeSuggestedToAccessAllPhotos,
    self->_numberOfPhotoAssets,
    self->_numberOfVideoAssets,
  uint64_t v31 = self->_numberOfOtherAssets);

  if (progress != -1.0) {
  return v31;
  }
}

- (PXCPLUIStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXCPLUIStatus;
  result = [(PXCPLUIStatus *)&v3 init];
  if (result)
  {
    result->_float progress = -1.0;
    result->_unint64_t serviceAction = 0;
  }
  return result;
}

@end