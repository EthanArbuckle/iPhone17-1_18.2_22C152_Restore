@interface PLPublishingAgent
+ (BOOL)canUploadHDVideoOverCellular;
+ (id)publishingAgentForBundleNamed:(id)a3 toPublishMedia:(id)a4;
- (BOOL)allowsCellularAccessForRequests;
- (BOOL)allowsHDOver3GUpload;
- (BOOL)allowsTellingFriend;
- (BOOL)allowsViewingOnHost;
- (BOOL)deleteMediaFileAfterPublishing;
- (BOOL)enableHDUpload;
- (BOOL)isPublishing;
- (BOOL)isRemaking;
- (BOOL)isVideoMedia;
- (BOOL)mediaIsHDVideo;
- (BOOL)needsTrimming;
- (BOOL)ownerIsCamera;
- (BOOL)shouldCancelPublish;
- (PLPublishingAgent)initWithMedia:(id)a3;
- (PLPublishingAgentDelegate)delegate;
- (double)estimatedTimeRemaining;
- (double)maximumVideoDuration;
- (float)percentComplete;
- (float)progressMultiplier;
- (float)remakingPercentComplete;
- (id)mediaData;
- (id)mediaPath;
- (id)mediaTitle;
- (id)mediaURL;
- (id)navigationController;
- (id)progressViewMessageDuringRemake;
- (id)serviceName;
- (id)tellAFriendBody;
- (id)tellAFriendSubject;
- (id)tellAFriendURL;
- (id)userInfo;
- (int)_remakerModeForSelectedOption;
- (int)remakerMode;
- (int)selectedOption;
- (int64_t)approximateHDUploadSize;
- (int64_t)approximateSDUploadSize;
- (void)_agentIsReadyToPublish:(id)a3;
- (void)_cancelRemaking:(id)a3;
- (void)_networkReachabilityDidChange:(id)a3;
- (void)_remakerDidFinish:(id)a3;
- (void)_setApproximateVideoUploadSizes;
- (void)_setUpPublishingParams;
- (void)_startNetworkObservation;
- (void)_stopNetworkObservation;
- (void)_transcodeVideo:(id)a3;
- (void)_updateStatisticsFromSnapshots;
- (void)cancelButtonClicked;
- (void)cancelRemaking;
- (void)dataArrayInputStreamBytesWereRead:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)doneButtonClicked;
- (void)presentModalSheetInViewController:(id)a3;
- (void)publish;
- (void)setAllowsHDOver3GUpload:(BOOL)a3;
- (void)setApproximateHDUploadSize:(int64_t)a3;
- (void)setApproximateSDUploadSize:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteMediaFileAfterPublishing:(BOOL)a3;
- (void)setEnableHDUpload:(BOOL)a3;
- (void)setMediaData:(id)a3;
- (void)setMediaIsHDVideo:(BOOL)a3;
- (void)setMediaPath:(id)a3;
- (void)setNeedsTrimming:(BOOL)a3;
- (void)setOwnerIsCamera:(BOOL)a3;
- (void)setProgressMultiplier:(float)a3;
- (void)setPublishing:(BOOL)a3;
- (void)setRemakerMode:(int)a3;
- (void)setSelectedOption:(int)a3;
- (void)setShouldCancelPublish:(BOOL)a3;
- (void)setTotalBytesWritten:(int64_t)a3 totalBytes:(int64_t)a4;
- (void)setTrimStartTime:(double)a3 andEndTime:(double)a4;
- (void)setUserInfo:(id)a3;
- (void)showAlertWithError:(id)a3;
- (void)snapshot;
- (void)videoRemaker:(id)a3 progressDidChange:(float)a4;
- (void)videoRemakerDidBeginRemaking:(id)a3;
- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4;
@end

@implementation PLPublishingAgent

- (void)setShouldCancelPublish:(BOOL)a3
{
  self->_shouldCancelPublish = a3;
}

- (BOOL)shouldCancelPublish
{
  return self->_shouldCancelPublish;
}

- (void)setAllowsHDOver3GUpload:(BOOL)a3
{
  self->_allowsHDOver3GUpload = a3;
}

- (BOOL)allowsHDOver3GUpload
{
  return self->_allowsHDOver3GUpload;
}

- (void)setProgressMultiplier:(float)a3
{
  self->_progressMultiplier = a3;
}

- (float)progressMultiplier
{
  return self->_progressMultiplier;
}

- (void)setSelectedOption:(int)a3
{
  self->_selectedOption = a3;
}

- (int)selectedOption
{
  return self->_selectedOption;
}

- (int)remakerMode
{
  return self->_remakerMode;
}

- (void)setNeedsTrimming:(BOOL)a3
{
  self->_needsTrimming = a3;
}

- (BOOL)needsTrimming
{
  return self->_needsTrimming;
}

- (void)setEnableHDUpload:(BOOL)a3
{
  self->_enableHDUpload = a3;
}

- (BOOL)enableHDUpload
{
  return self->_enableHDUpload;
}

- (void)setMediaIsHDVideo:(BOOL)a3
{
  self->_mediaIsHDVideo = a3;
}

- (BOOL)mediaIsHDVideo
{
  return self->_mediaIsHDVideo;
}

- (void)setApproximateSDUploadSize:(int64_t)a3
{
  self->_approximateSDUploadSize = a3;
}

- (int64_t)approximateSDUploadSize
{
  return self->_approximateSDUploadSize;
}

- (void)setApproximateHDUploadSize:(int64_t)a3
{
  self->_approximateHDUploadSize = a3;
}

- (int64_t)approximateHDUploadSize
{
  return self->_approximateHDUploadSize;
}

- (void)setOwnerIsCamera:(BOOL)a3
{
  self->_ownerIsCamera = a3;
}

- (BOOL)ownerIsCamera
{
  return self->_ownerIsCamera;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (PLPublishingAgentDelegate)delegate
{
  return (PLPublishingAgentDelegate *)self->_delegate;
}

- (void)showAlertWithError:(id)a3
{
  id v5 = [(PLPublishingAgent *)self mediaTitle];
  id v6 = v5;
  if (a3)
  {
    if (v5)
    {
      PLLocalizedFrameworkString();
      id v18 = v6;
      uint64_t v7 = PFStringWithValidatedFormat();
    }
    else
    {
      [(PLPublishingAgent *)self isVideoMedia];
      uint64_t v7 = PLLocalizedFrameworkString();
    }
    v9 = objc_msgSend(MEMORY[0x1E4F42728], "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1, v18);
    v10 = (void *)MEMORY[0x1E4F42720];
    uint64_t v11 = PLLocalizedFrameworkString();
    v12 = v10;
    uint64_t v13 = 1;
    v14 = 0;
    goto LABEL_13;
  }
  if (v5)
  {
    PLLocalizedFrameworkString();
    uint64_t v8 = PFStringWithValidatedFormat();
  }
  else
  {
    [(PLPublishingAgent *)self isVideoMedia];
    uint64_t v8 = PLLocalizedFrameworkString();
  }
  uint64_t v15 = v8;
  PLLocalizedFrameworkString();
  id v19 = [(PLPublishingAgent *)self serviceName];
  uint64_t v16 = PFStringWithValidatedFormat();
  v9 = objc_msgSend(MEMORY[0x1E4F42728], "alertControllerWithTitle:message:preferredStyle:", v15, 0, 1, v19);
  objc_msgSend(v9, "addAction:", objc_msgSend(MEMORY[0x1E4F42720], "actionWithTitle:style:handler:", PLLocalizedFrameworkString(), 1, 0));
  if ([(PLPublishingAgent *)self allowsViewingOnHost])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __40__PLPublishingAgent_showAlertWithError___block_invoke;
    v21[3] = &unk_1E63D22C0;
    v21[4] = self;
    objc_msgSend(v9, "addAction:", objc_msgSend(MEMORY[0x1E4F42720], "actionWithTitle:style:handler:", v16, 0, v21));
  }
  if ([(PLPublishingAgent *)self allowsTellingFriend])
  {
    v17 = (void *)MEMORY[0x1E4F42720];
    uint64_t v11 = PLLocalizedFrameworkString();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__PLPublishingAgent_showAlertWithError___block_invoke_2;
    v20[3] = &unk_1E63D22C0;
    v20[4] = self;
    v14 = v20;
    v12 = v17;
    uint64_t v13 = 0;
LABEL_13:
    objc_msgSend(v9, "addAction:", objc_msgSend(v12, "actionWithTitle:style:handler:", v11, v13, v14));
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "pl_firstKeyWindow"), "pl_presentViewController:animated:", v9, 1);
}

uint64_t __40__PLPublishingAgent_showAlertWithError___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) mediaURL];
  uint64_t v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
  v3 = (void *)[MEMORY[0x1E4F223E0] defaultWorkspace];
  return [v3 openSensitiveURL:v2 withOptions:0];
}

uint64_t __40__PLPublishingAgent_showAlertWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) tellAFriendBody];
  if (!v2) {
    uint64_t v2 = (void *)[*(id *)(a1 + 32) tellAFriendURL];
  }
  v3 = NSString;
  v4 = (void *)[*(id *)(a1 + 32) tellAFriendSubject];
  uint64_t v5 = objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLFragmentAllowedCharacterSet"));
  uint64_t v6 = [v3 stringWithFormat:@"mailto:?subject=%@&body=%@", v5, objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLFragmentAllowedCharacterSet"))];
  uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  uint64_t v8 = (void *)[MEMORY[0x1E4F223E0] defaultWorkspace];
  return [v8 openSensitiveURL:v7 withOptions:0];
}

- (int)_remakerModeForSelectedOption
{
  int selectedOption = self->_selectedOption;
  if (selectedOption == 1) {
    return +[PLVideoRemaker getHDRemakerModeForMode:self->_remakerMode];
  }
  if (selectedOption) {
    return -1;
  }
  return self->_remakerMode;
}

- (id)progressViewMessageDuringRemake
{
  return [(PLVideoRemaker *)self->_remaker messageForRemakingProgress];
}

- (void)videoRemaker:(id)a3 progressDidChange:(float)a4
{
  self->_remakingPercentComplete = a4;
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  uint64_t v6 = self;
  *((unsigned char *)self + 208) &= ~2u;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [self->_delegate publishingAgentDidEndRemaking:self didSucceed:a4 != 0];
  }
  [(PLPublishingAgent *)self performSelector:sel__remakerDidFinish_ withObject:a4 afterDelay:0.01];
}

- (void)_remakerDidFinish:(id)a3
{
  if ((*((unsigned char *)self + 208) & 1) == 0)
  {
    if ([a3 length])
    {
      SEL completionSelector = self->_completionSelector;
      if (completionSelector) {
        [(PLPublishingAgent *)self performSelector:completionSelector withObject:a3];
      }
    }
    else
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F42728] alertControllerWithTitle:PLLocalizedFrameworkString() message:0 preferredStyle:1];
      objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x1E4F42720], "actionWithTitle:style:handler:", PLLocalizedFrameworkString(), 0, 0));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "pl_firstKeyWindow"), "pl_presentViewController:animated:", v6, 1);
    }
  }
  *((unsigned char *)self + 208) &= ~1u;
  [(PLVideoRemaker *)self->_remaker setDelegate:0];

  self->_remaker = 0;
}

- (void)videoRemakerDidBeginRemaking:(id)a3
{
  v4 = self;
  *((unsigned char *)self + 208) |= 2u;
  self->_progressMultiplier = 0.5;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [delegate publishingAgentDidStartRemaking:self];
  }
}

- (void)_transcodeVideo:(id)a3
{
  [(PLVideoRemaker *)self->_remaker setDelegate:0];

  uint64_t v5 = [[PLVideoRemaker alloc] initWithPublishingMedia:a3];
  self->_remaker = v5;
  [(PLVideoRemaker *)v5 setDelegate:self];
  [(PLVideoRemaker *)self->_remaker setMode:self->_remakerMode];
  if (self->_needsTrimming)
  {
    [(PLVideoRemaker *)self->_remaker setTrimStartTime:self->_startTime];
    [(PLVideoRemaker *)self->_remaker setTrimEndTime:self->_endTime];
  }
  remaker = self->_remaker;
  [(PLVideoRemaker *)remaker remake];
}

- (void)_cancelRemaking:(id)a3
{
  remaker = self->_remaker;
  if (remaker)
  {
    self->_SEL completionSelector = 0;
    *((unsigned char *)self + 208) = *((unsigned char *)self + 208) & 0xFC | 1;
    self->_progressMultiplier = 1.0;
    [(PLVideoRemaker *)remaker cancel];
  }
}

- (BOOL)isRemaking
{
  return (*((unsigned __int8 *)self + 208) >> 1) & 1;
}

- (void)cancelRemaking
{
}

- (float)remakingPercentComplete
{
  return self->_remakingPercentComplete * self->_progressMultiplier;
}

- (float)percentComplete
{
  return (float)(self->_percentComplete + self->_remakingPercentComplete) * self->_progressMultiplier;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)_updateStatisticsFromSnapshots
{
  unint64_t v3 = [(NSMutableArray *)self->_snapshotTimes count];
  double v4 = -1.0;
  if (v3 < 3)
  {
    double v13 = -1.0;
  }
  else
  {
    unint64_t v5 = v3;
    double v6 = 0.0;
    for (uint64_t i = 1; i != v5; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i), "doubleValue");
      double v9 = v8;
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i - 1), "doubleValue");
      double v11 = v9 - v10;
      uint64_t v12 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i), "longLongValue");
      double v6 = v6
         + (double)(v12
                  - objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i - 1), "longLongValue"))/ v11;
    }
    double v13 = v6 / (double)v5;
    if (v13 > 0.00000011920929)
    {
      int64_t v14 = self->_maxValue - self->_currentValue;
      if ((v14 & 0x8000000000000000) == 0) {
        double v4 = (double)v14 / v13;
      }
    }
  }
  self->_changeRate = v13;
  self->_estimatedTimeRemaining = v4;
}

- (void)snapshot
{
  int64_t maxValue = self->_maxValue;
  if (maxValue)
  {
    float v4 = (double)self->_currentValue / (double)maxValue;
    self->_percentComplete = v4;
  }
  snapshotTimes = self->_snapshotTimes;
  if (!snapshotTimes)
  {
    self->_snapshotTimes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_snapshotValues = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    snapshotTimes = self->_snapshotTimes;
  }
  if ((unint64_t)[(NSMutableArray *)snapshotTimes count] >= 0x14)
  {
    [(NSMutableArray *)self->_snapshotTimes removeObjectAtIndex:0];
    [(NSMutableArray *)self->_snapshotValues removeObjectAtIndex:0];
  }
  double v6 = (void *)[objc_alloc(NSNumber) initWithDouble:CFAbsoluteTimeGetCurrent()];
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithLongLong:self->_currentValue];
  [(NSMutableArray *)self->_snapshotTimes addObject:v6];
  [(NSMutableArray *)self->_snapshotValues addObject:v7];

  [(PLPublishingAgent *)self _updateStatisticsFromSnapshots];
}

- (void)setTotalBytesWritten:(int64_t)a3 totalBytes:(int64_t)a4
{
  self->_currentValue = a3;
  self->_int64_t maxValue = a4;
}

- (void)dataArrayInputStreamBytesWereRead:(id)a3
{
  self->_currentValue = [a3 bytesRead];
  self->_int64_t maxValue = [a3 totalBytes];
}

- (double)maximumVideoDuration
{
  return 600.0;
}

- (BOOL)allowsViewingOnHost
{
  return 1;
}

- (BOOL)allowsTellingFriend
{
  return 1;
}

- (id)tellAFriendBody
{
  return 0;
}

- (id)tellAFriendSubject
{
  id v2 = [(PLPublishingAgent *)self mediaTitle];
  if ([v2 length]) {
    return v2;
  }
  else {
    return &stru_1F1A10F90;
  }
}

- (id)tellAFriendURL
{
  return @"SUBCLASS OVERRIDE";
}

- (BOOL)isVideoMedia
{
  id v2 = [(PLPublishingAgent *)self userInfo];
  return [v2 isVideo];
}

- (id)mediaTitle
{
  return @"SUBCLASS OVERRIDE";
}

- (id)mediaURL
{
  return @"SUBCLASS OVERRIDE";
}

- (void)dismiss
{
  [(PLPublishingAgent *)self _stopNetworkObservation];
  unint64_t v3 = objc_msgSend(-[PLPublishingAgent navigationController](self, "navigationController"), "presentingViewController");
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentModalSheetInViewController:(id)a3
{
  id v5 = [(PLPublishingAgent *)self navigationController];
  if (v5)
  {
    double v6 = v5;
    [self->_delegate publishingAgentWillBeDisplayed:self];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      [v6 setModalPresentationStyle:2];
    }
    [a3 presentViewController:v6 animated:1 completion:0];
  }
}

- (id)serviceName
{
  return @"<override -[PLPublishingAgent serviceName]";
}

- (void)publish
{
}

- (void)_agentIsReadyToPublish:(id)a3
{
  if (a3)
  {
    -[PLPublishingAgent setMediaPath:](self, "setMediaPath:");
    [(PLPublishingAgent *)self setDeleteMediaFileAfterPublishing:1];
  }
  [(PLPublishingAgent *)self publish];
}

- (void)doneButtonClicked
{
  [self->_delegate publishingAgentDoneButtonClicked:self];
  self->_remakerMode = [(PLPublishingAgent *)self _remakerModeForSelectedOption];
  [MEMORY[0x1E4F42FD8] defaultDurationForTransition:3];
  double v4 = v3;
  if ([(PLPublishingAgent *)self isVideoMedia])
  {
    self->_SEL completionSelector = sel__agentIsReadyToPublish_;
    id v5 = sel__transcodeVideo_;
    id v6 = [(PLPublishingAgent *)self userInfo];
  }
  else
  {
    id v6 = 0;
    id v5 = sel_publish;
  }
  float v7 = v4;
  double v8 = v7;
  [(PLPublishingAgent *)self performSelector:v5 withObject:v6 afterDelay:v8];
}

- (void)cancelButtonClicked
{
  double v3 = self;
  id delegate = self->_delegate;
  [delegate publishingAgentCancelButtonClicked:self];
}

- (id)navigationController
{
  return 0;
}

- (void)_setApproximateVideoUploadSizes
{
  if (self->_needsTrimming)
  {
    double v3 = self->_endTime - self->_startTime;
  }
  else
  {
    objc_msgSend(-[PLPublishingAgent userInfo](self, "userInfo"), "duration");
    double v3 = v4;
  }
  [(PLPublishingAgent *)self setApproximateSDUploadSize:+[PLVideoRemaker approximateByteSizeForMode:duration:](PLVideoRemaker, "approximateByteSizeForMode:duration:", +[PLVideoRemaker getSDRemakerModeForMode:self->_remakerMode], v3)];
  int64_t v5 = +[PLVideoRemaker approximateByteSizeForMode:duration:](PLVideoRemaker, "approximateByteSizeForMode:duration:", +[PLVideoRemaker getHDRemakerModeForMode:self->_remakerMode], v3);
  [(PLPublishingAgent *)self setApproximateHDUploadSize:v5];
}

- (void)setTrimStartTime:(double)a3 andEndTime:(double)a4
{
  self->_startTime = a3;
  self->_endTime = a4;
}

- (void)setRemakerMode:(int)a3
{
  if (!self->_remakerMode)
  {
    self->_remakerMode = a3;
    [(PLPublishingAgent *)self _setApproximateVideoUploadSizes];
  }
  self->_remakerMode = a3;
}

- (void)setPublishing:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 208) = *((unsigned char *)self + 208) & 0xFB | v3;
}

- (BOOL)isPublishing
{
  return (*((unsigned __int8 *)self + 208) >> 2) & 1;
}

- (void)setUserInfo:(id)a3
{
  id userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_id userInfo = a3;
  }
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setMediaData:(id)a3
{
  mediaData = self->_mediaData;
  if (mediaData != a3)
  {

    self->_mediaData = (NSData *)a3;
  }
}

- (id)mediaData
{
  return self->_mediaData;
}

- (BOOL)deleteMediaFileAfterPublishing
{
  return self->_deleteAfterPublishing;
}

- (void)setDeleteMediaFileAfterPublishing:(BOOL)a3
{
  self->_deleteAfterPublishing = a3;
}

- (void)setMediaPath:(id)a3
{
  mediaPath = self->_mediaPath;
  if (mediaPath != a3)
  {

    self->_mediaPath = (NSString *)a3;
  }
}

- (id)mediaPath
{
  return self->_mediaPath;
}

- (void)_setUpPublishingParams
{
  id v3 = [(PLPublishingAgent *)self userInfo];
  if ([v3 isVideo])
  {
    uint64_t v4 = [v3 pathForVideoFile];
    uint64_t v5 = [v3 isHDVideo];
    [(PLPublishingAgent *)self setMediaPath:v4];
    [(PLPublishingAgent *)self setDeleteMediaFileAfterPublishing:0];
    [(PLPublishingAgent *)self setMediaIsHDVideo:v5];
    if (v5)
    {
      BOOL v6 = +[PLPublishingAgent canUploadHDVideoOverCellular];
      if (v6)
      {
        uint64_t v7 = 1;
      }
      else
      {
        double v8 = (void **)MEMORY[0x1E4F43630];
        NSClassFromString(&cfstr_Plphotosapplic_0.isa);
        if (objc_opt_isKindOfClass()) {
          double v9 = *v8;
        }
        else {
          double v9 = 0;
        }
        uint64_t v7 = [v9 isOnWifi];
      }
      [(PLPublishingAgent *)self setEnableHDUpload:v7];
      [(PLPublishingAgent *)self setAllowsHDOver3GUpload:v6];
    }
  }
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  [(PLPublishingAgent *)self setDelegate:0];

  [(PLVideoRemaker *)self->_remaker setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PLPublishingAgent;
  [(PLPublishingAgent *)&v3 dealloc];
}

- (PLPublishingAgent)initWithMedia:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLPublishingAgent;
  uint64_t v4 = [(PLPublishingAgent *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(PLPublishingAgent *)v4 setUserInfo:a3];
    [(PLPublishingAgent *)v5 _startNetworkObservation];
    [(PLPublishingAgent *)v5 _setUpPublishingParams];
    BOOL v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__cancelRemaking_ name:*MEMORY[0x1E4F8AD10] object:0];
    v5->_progressMultiplier = 1.0;
    v5->_remakerMode = 0;
  }
  return v5;
}

- (void)_stopNetworkObservation
{
  objc_super v3 = (void **)MEMORY[0x1E4F43630];
  NSClassFromString(&cfstr_Plphotosapplic_0.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = *v3;
  }
  else {
    uint64_t v4 = 0;
  }
  [v4 disableNetworkObservation];
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F8AE38];
  [v5 removeObserver:self name:v6 object:0];
}

- (void)_startNetworkObservation
{
  objc_super v3 = (void **)MEMORY[0x1E4F43630];
  NSClassFromString(&cfstr_Plphotosapplic_0.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = *v3;
  }
  else {
    uint64_t v4 = 0;
  }
  [v4 enableNetworkObservation];
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F8AE38];
  [v5 addObserver:self selector:sel__networkReachabilityDidChange_ name:v6 object:0];
}

- (void)_networkReachabilityDidChange:(id)a3
{
  id v3 = a3;
  uint64_t v5 = (void *)[a3 userInfo];
  int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E4F8AE48]), "BOOLValue");
  uint64_t v7 = (void *)[v3 userInfo];
  LODWORD(v3) = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F8AE40]), "BOOLValue");
  uint64_t v8 = [(PLPublishingAgent *)self allowsHDOver3GUpload] | v3 & v6;
  [(PLPublishingAgent *)self setEnableHDUpload:v8];
}

- (BOOL)allowsCellularAccessForRequests
{
  if ([(PLPublishingAgent *)self selectedOption] != 1) {
    return 1;
  }
  return [(PLPublishingAgent *)self allowsHDOver3GUpload];
}

+ (BOOL)canUploadHDVideoOverCellular
{
  uint64_t v15 = 0;
  uint64_t v16 = (uint64_t)&v15;
  uint64_t v17 = 0x3052000000;
  id v18 = __Block_byref_object_copy__2510;
  id v19 = __Block_byref_object_dispose__2511;
  id v2 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v20 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = (uint64_t)__getMCProfileConnectionClass_block_invoke;
    double v13 = &unk_1E63D24C8;
    int64_t v14 = &v15;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v10);
    id v2 = *(void **)(v16 + 40);
  }
  _Block_object_dispose(&v15, 8);
  id v3 = (void *)[v2 sharedConnection];
  uint64_t v10 = 0;
  uint64_t v11 = (uint64_t)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v4 = (void *)getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr;
  double v13 = (void *)getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr;
  if (!getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = (uint64_t)__getMCFeatureCellularHDUploadsAllowedSymbolLoc_block_invoke;
    id v18 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
    id v19 = (void (*)(uint64_t))&v10;
    uint64_t v5 = ManagedConfigurationLibrary();
    int v6 = dlsym(v5, "MCFeatureCellularHDUploadsAllowed");
    *(void *)(*((void *)v19 + 1) + 24) = v6;
    getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr = *(void *)(*((void *)v19 + 1) + 24);
    uint64_t v4 = *(void **)(v11 + 24);
  }
  _Block_object_dispose(&v10, 8);
  if (v4) {
    return [v3 effectiveBoolValueForSetting:*v4] == 1;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"NSString *getMCFeatureCellularHDUploadsAllowed(void)"];
  BOOL result = objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PLPublishingAgent.m", 41, @"%s", dlerror(), v10);
  __break(1u);
  return result;
}

+ (id)publishingAgentForBundleNamed:(id)a3 toPublishMedia:(id)a4
{
  uint64_t v5 = [@"/System/Library/PublishingBundles/" stringByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"%@.bundle", a3)];
  int v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", v5), "principalClass")), "initWithMedia:", a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return v6;
  }
  else
  {

    return 0;
  }
}

@end