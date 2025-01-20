@interface PXVideoPlaybackReporterAVPlayerItemEndpoint
+ (BOOL)isReportingAvailable;
+ (OS_dispatch_queue)reportingQueue;
- (AVPlayerItem)playerItem;
- (NSString)loggingIdentifier;
- (PXVideoPlaybackReporterAVPlayerItemEndpoint)init;
- (PXVideoPlaybackReporterAVPlayerItemEndpoint)initWithPlayerItem:(id)a3;
- (id)description;
- (void)sendPayload:(_PXVideoPlaybackReporterPayload *)a3;
- (void)setLoggingIdentifier:(id)a3;
@end

@implementation PXVideoPlaybackReporterAVPlayerItemEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->loggingIdentifier, 0);
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setLoggingIdentifier:(id)a3
{
}

- (NSString)loggingIdentifier
{
  return self->loggingIdentifier;
}

- (void)sendPayload:(_PXVideoPlaybackReporterPayload *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = [(id)objc_opt_class() isReportingAvailable];
  v7 = PLVideoPlaybackGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = [(PXVideoPlaybackReporterAVPlayerItemEndpoint *)self loggingIdentifier];
      long long v10 = *(_OWORD *)&a3->var2;
      *(_OWORD *)buf = *(_OWORD *)&a3->var0;
      *(_OWORD *)&buf[16] = v10;
      v11 = PXVideoPlaybackReporterPayloadDescription(buf);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Sending video playback payload:\n\t%@", buf, 0x16u);
    }
    v12 = [(PXVideoPlaybackReporterAVPlayerItemEndpoint *)self playerItem];
    v13 = [(id)objc_opt_class() reportingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PXVideoPlaybackReporterAVPlayerItemEndpoint_sendPayload___block_invoke;
    block[3] = &unk_1E5DD15B0;
    long long v14 = *(_OWORD *)&a3->var2;
    long long v20 = *(_OWORD *)&a3->var0;
    long long v21 = v14;
    SEL v22 = a2;
    block[4] = self;
    id v19 = v12;
    v7 = v12;
    dispatch_async(v13, block);
  }
  else if (v8)
  {
    v15 = [(PXVideoPlaybackReporterAVPlayerItemEndpoint *)self loggingIdentifier];
    long long v16 = *(_OWORD *)&a3->var2;
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(_OWORD *)&buf[16] = v16;
    v17 = PXVideoPlaybackReporterPayloadDescription(buf);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Unable to send video playback payload because reporting is not available:\n\t%@", buf, 0x16u);
  }
}

void __59__PXVideoPlaybackReporterAVPlayerItemEndpoint_sendPayload___block_invoke(void *a1)
{
  uint64_t v2 = a1[9];
  switch(v2)
  {
    case 1:
      v3 = @"PhotosUiStartToSetRateMs";
      break;
    case 2:
      v3 = @"PhotosUiStartToLeaveMs";
      break;
    case 0:
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a1[10] object:a1[4] file:@"PXVideoPlaybackReporter+AVFoundation.m" lineNumber:138 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      v3 = 0;
      break;
  }
  v4 = (void *)a1[5];
  v5 = [NSNumber numberWithInteger:a1[6]];
  [v4 setReportingValueWithNumber:v5 forKey:v3];

  unint64_t v6 = a1[8];
  if (v6 >= 7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v14 = [NSString stringWithUTF8String:"Priority PriorityForLoadingPriority(PXVideoLoadingPriority)"];
    v15 = v13;
    long long v16 = v14;
    uint64_t v17 = 95;
    goto LABEL_14;
  }
  v7 = (void *)a1[5];
  BOOL v8 = [NSNumber numberWithInteger:qword_1AB35A7F8[v6]];
  [v7 setReportingValueWithNumber:v8 forKey:@"PhotosUiIntentPriority"];

  unint64_t v9 = a1[8];
  if (v9 >= 7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v14 = [NSString stringWithUTF8String:"VideoIntent VideoIntentForLoadingPriority(PXVideoLoadingPriority)"];
    v15 = v13;
    long long v16 = v14;
    uint64_t v17 = 75;
LABEL_14:
    [v15 handleFailureInFunction:v16 file:@"PXVideoPlaybackReporter+AVFoundation.m" lineNumber:v17 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  long long v10 = (void *)a1[5];
  v11 = [NSNumber numberWithInteger:qword_1AB35A830[v9]];
  [v10 setReportingValueWithNumber:v11 forKey:@"PhotosUiIntent"];

  v12 = (void *)a1[5];
  id v19 = [NSNumber numberWithInteger:a1[7]];
  [v12 setReportingValueWithNumber:v19 forKey:@"PhotosUiStartToAssetCreationMs"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(PXVideoPlaybackReporterAVPlayerItemEndpoint *)self playerItem];
  v7 = (void *)[v3 initWithFormat:@"<%@ %p; Item: %@>", v5, self, v6];

  return v7;
}

- (PXVideoPlaybackReporterAVPlayerItemEndpoint)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoPlaybackReporter+AVFoundation.m", 117, @"%s is not available as initializer", "-[PXVideoPlaybackReporterAVPlayerItemEndpoint init]");

  abort();
}

- (PXVideoPlaybackReporterAVPlayerItemEndpoint)initWithPlayerItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoPlaybackReporterAVPlayerItemEndpoint;
  unint64_t v6 = [(PXVideoPlaybackReporterAVPlayerItemEndpoint *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playerItem, a3);
  }

  return v7;
}

+ (OS_dispatch_queue)reportingQueue
{
  if (reportingQueue_onceToken != -1) {
    dispatch_once(&reportingQueue_onceToken, &__block_literal_global_36);
  }
  uint64_t v2 = (void *)reportingQueue_reportingQueue;
  return (OS_dispatch_queue *)v2;
}

void __61__PXVideoPlaybackReporterAVPlayerItemEndpoint_reportingQueue__block_invoke()
{
}

+ (BOOL)isReportingAvailable
{
  if (isReportingAvailable_onceToken != -1) {
    dispatch_once(&isReportingAvailable_onceToken, &__block_literal_global_30691);
  }
  return isReportingAvailable_isAvailable;
}

uint64_t __67__PXVideoPlaybackReporterAVPlayerItemEndpoint_isReportingAvailable__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F16620] instancesRespondToSelector:sel_setReportingValueWithNumber_forKey_];
  isReportingAvailable_isAvailable = result;
  if (result) {
    uint64_t result = [MEMORY[0x1E4F16620] instancesRespondToSelector:sel_setReportingValueWithString_forKey_];
  }
  isReportingAvailable_isAvailable = result;
  return result;
}

@end