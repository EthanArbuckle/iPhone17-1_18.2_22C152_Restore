@interface ISAVPlayer
+ (BOOL)isAppleInternal;
+ (BOOL)isSpringBoard;
- (ISAVPlayer)init;
- (ISAVPlayer)initWithDispatchQueue:(id)a3;
- (OS_dispatch_queue)actualDispatchQueue;
- (id)dispatchQueue;
- (void)_cancelRateCurveRequest;
- (void)_setRate:(float)a3;
- (void)dealloc;
- (void)playToTime:(id *)a3 withInitialRate:(float)a4 overDuration:(double)a5 progressHandler:(id)a6;
- (void)setAllowsPixelBufferPoolSharing:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setUsesDedicatedNotificationQueueForMediaServices:(BOOL)a3;
@end

@implementation ISAVPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualDispatchQueue, 0);
  objc_storeStrong((id *)&self->_initializedDispatchQueue, 0);

  objc_storeStrong((id *)&self->_currentRequest, 0);
}

- (OS_dispatch_queue)actualDispatchQueue
{
  return self->_actualDispatchQueue;
}

- (void)_cancelRateCurveRequest
{
  [(ISRateCurveRequest *)self->_currentRequest cancel];
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;
}

- (void)playToTime:(id *)a3 withInitialRate:(float)a4 overDuration:(double)a5 progressHandler:(id)a6
{
  id v10 = a6;
  [(ISAVPlayer *)self _cancelRateCurveRequest];
  v11 = [ISRateCurveRequest alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  *(float *)&double v12 = a4;
  v13 = [(ISRateCurveRequest *)v11 initWithTargetTime:&v15 duration:self initialRate:v10 avPlayer:a5 progressHandler:v12];

  currentRequest = self->_currentRequest;
  self->_currentRequest = v13;

  [(ISRateCurveRequest *)self->_currentRequest start];
}

- (void)_setRate:(float)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ISAVPlayer;
  -[ISAVPlayer setRate:](&v3, sel_setRate_);
}

- (void)setRate:(float)a3
{
  [(ISAVPlayer *)self _cancelRateCurveRequest];
  *(float *)&double v5 = a3;

  [(ISAVPlayer *)self _setRate:v5];
}

- (id)dispatchQueue
{
  return self->_initializedDispatchQueue;
}

- (void)setAllowsPixelBufferPoolSharing:(BOOL)a3
{
  objc_super v3 = objc_opt_class();

  [v3 isAppleInternal];
}

- (void)setUsesDedicatedNotificationQueueForMediaServices:(BOOL)a3
{
  objc_super v3 = objc_opt_class();

  [v3 isAppleInternal];
}

- (ISAVPlayer)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  int v6 = [(id)objc_opt_class() isSpringBoard];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PhotosPlayer.disablePrivatePlayerQueue", @"com.apple.mobileslideshow", 0);
  if ((v6 & 1) != 0
    || (int v8 = AppBooleanValue, [(id)objc_opt_class() isAppleInternal]) && v8)
  {
    v21.receiver = self;
    v21.super_class = (Class)ISAVPlayer;
    v9 = [(ISAVPlayer *)&v21 init];
    int v10 = 1;
    if (!v9) {
      goto LABEL_16;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ISAVPlayer;
    v9 = [(ISAVPlayer *)&v20 initWithDispatchQueue:v5];
    int v10 = 0;
    if (!v9) {
      goto LABEL_16;
    }
  }
  objc_storeStrong((id *)&v9->_initializedDispatchQueue, a3);
  if (v10)
  {
    v11 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    actualDispatchQueue = v9->_actualDispatchQueue;
    v9->_actualDispatchQueue = v11;
  }
  else
  {
    v14 = (OS_dispatch_queue *)v5;
    actualDispatchQueue = v9->_actualDispatchQueue;
    v9->_actualDispatchQueue = v14;
  }

  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = +[ISPlayerSettings sharedInstance];
  v19.receiver = v9;
  v19.super_class = (Class)ISAVPlayer;
  -[ISAVPlayer setUsesDedicatedNotificationQueueForMediaServices:](&v19, sel_setUsesDedicatedNotificationQueueForMediaServices_, [v15 useDedicatedQueues]);

  if (CFPreferencesGetAppBooleanValue(@"PhotosPlayer.enablePixelBufferPoolSharing", @"com.apple.mobileslideshow", 0))
  {
    int v16 = 1;
  }
  else
  {
    int v16 = v6;
  }
  if (v16 == 1)
  {
    v18.receiver = v9;
    v18.super_class = (Class)ISAVPlayer;
    [(ISAVPlayer *)&v18 setAllowsPixelBufferPoolSharing:1];
  }
  [(ISAVPlayer *)v9 setClosedCaptionDisplayEnabled:0];
LABEL_16:

  return v9;
}

- (ISAVPlayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISAVPlayer;
  v2 = [(ISAVPlayer *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_initializedDispatchQueue, MEMORY[0x1E4F14428]);
    objc_storeStrong((id *)&v3->_actualDispatchQueue, v3->_initializedDispatchQueue);
  }
  return v3;
}

- (void)dealloc
{
  [(ISAVPlayer *)self _cancelRateCurveRequest];
  v3.receiver = self;
  v3.super_class = (Class)ISAVPlayer;
  [(ISAVPlayer *)&v3 dealloc];
}

+ (BOOL)isSpringBoard
{
  if (isSpringBoard_onceToken != -1) {
    dispatch_once(&isSpringBoard_onceToken, &__block_literal_global_3);
  }
  return isSpringBoard_isSpringBoard;
}

void __27__ISAVPlayer_isSpringBoard__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v1 processName];
  isSpringBoard_isSpringBoard = [v0 isEqualToString:@"SpringBoard"];
}

+ (BOOL)isAppleInternal
{
  if (isAppleInternal_onceToken != -1) {
    dispatch_once(&isAppleInternal_onceToken, &__block_literal_global);
  }
  return isAppleInternal_isAppleInternal;
}

uint64_t __29__ISAVPlayer_isAppleInternal__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isAppleInternal_isAppleInternal = result;
  return result;
}

@end