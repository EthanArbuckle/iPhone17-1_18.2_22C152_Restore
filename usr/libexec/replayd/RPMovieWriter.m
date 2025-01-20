@interface RPMovieWriter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio1PresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio2PresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimVideoPresentationTime;
- (AVAssetWriter)assetWriter;
- (AVAssetWriterInput)audioInput1;
- (AVAssetWriterInput)audioInput2;
- (AVAssetWriterInput)videoInput;
- (BOOL)appendInitialSampleBuffer:(opaqueCMSampleBuffer *)a3 withTransform:(CGAffineTransform *)a4;
- (BOOL)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4;
- (BOOL)didProcessFirstSample;
- (BOOL)dispatchedAppendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4;
- (BOOL)isFinishingWriting;
- (BOOL)systemRecording;
- (CGSize)windowSize;
- (NSString)originalOutputPath;
- (NSString)outputPath;
- (NSString)videoCodecType;
- (NSURL)outputURL;
- (OS_dispatch_queue)movieSaveQueue;
- (OS_dispatch_queue)movieWriterQueue;
- (RPBroadcastConfiguration)broadcastConfig;
- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4;
- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4 videoCodecType:(id)a5;
- (double)durationInSeconds;
- (id)averageVideoBitrate;
- (id)createAssetURLFromPhotosIdentifier:(id)a3;
- (id)createNotificationRequestWithAssetURL:(id)a3;
- (int)assetWriterStartCount;
- (opaqueCMBufferQueue)audioBufferQueue1;
- (opaqueCMBufferQueue)audioBufferQueue2;
- (opaqueCMBufferQueue)videoBufferQueue;
- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)dispatchedAppendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dispatchedAppendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)displayScreenRecorderNotificationWithURL:(id)a3;
- (void)finishWritingAndSaveToCameraRollWithSessionID:(id)a3 mixAudioTracks:(BOOL)a4 handler:(id)a5;
- (void)finishWritingWithHandler:(id)a3;
- (void)notifyRecordingMayBeStopped;
- (void)notifyRecordingResumed;
- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 handler:(id)a5;
- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 mixAudioTracks:(BOOL)a5 handler:(id)a6;
- (void)setAssetWriter:(id)a3;
- (void)setAssetWriterStartCount:(int)a3;
- (void)setAudioBufferQueue1:(opaqueCMBufferQueue *)a3;
- (void)setAudioBufferQueue2:(opaqueCMBufferQueue *)a3;
- (void)setAudioInput1:(id)a3;
- (void)setAudioInput2:(id)a3;
- (void)setBroadcastConfig:(id)a3;
- (void)setDidProcessFirstSample:(BOOL)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setIsFinishingWriting:(BOOL)a3;
- (void)setLastAudio1PresentationTime:(id *)a3;
- (void)setLastAudio2PresentationTime:(id *)a3;
- (void)setLastVideoPresentationTime:(id *)a3;
- (void)setOriginalOutputPath:(id)a3;
- (void)setOutputPath:(id)a3;
- (void)setSystemRecording:(BOOL)a3;
- (void)setTrimVideoPresentationTime:(id *)a3;
- (void)setUpAssetWriterWithHandler:(id)a3;
- (void)setVideoBufferQueue:(opaqueCMBufferQueue *)a3;
- (void)setVideoCodecType:(id)a3;
- (void)setVideoInput:(id)a3;
- (void)setWindowSize:(CGSize)a3;
- (void)startWritingHandler:(id)a3;
- (void)trimMovieWithURL:(id)a3 startClipDuration:(double)a4 endClipDuration:(double)a5 outputFileURL:(id)a6 handler:(id)a7;
- (void)updateOutputPath;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation RPMovieWriter

- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4
{
  return -[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:](self, "initWithWindowSize:outputPath:videoCodecType:", a4, AVVideoCodecTypeH264, a3.width, a3.height);
}

- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4 videoCodecType:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)RPMovieWriter;
  v11 = [(RPMovieWriter *)&v25 init];
  if (v11)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v27 = "-[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:]";
      __int16 v28 = 1024;
      int v29 = 119;
      __int16 v30 = 2048;
      v31 = v11;
      __int16 v32 = 2048;
      double v33 = width;
      __int16 v34 = 2048;
      double v35 = height;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p window size width %.1f x height:%.1f", buf, 0x30u);
    }
    [(RPMovieWriter *)v11 setOutputPath:v9];
    [(RPMovieWriter *)v11 setOriginalOutputPath:v9];
    [(RPMovieWriter *)v11 setAssetWriterStartCount:0];
    -[RPMovieWriter setWindowSize:](v11, "setWindowSize:", width, height);
    [(RPMovieWriter *)v11 setDidProcessFirstSample:0];
    [(RPMovieWriter *)v11 setIsFinishingWriting:0];
    long long v23 = *(_OWORD *)&kCMTimeInvalid.value;
    CMTimeEpoch epoch = kCMTimeInvalid.epoch;
    [(RPMovieWriter *)v11 setTrimVideoPresentationTime:&v23];
    [(RPMovieWriter *)v11 setVideoCodecType:v10];
    CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0, CallbacksForUnsortedSampleBuffers, &v11->_audioBufferQueue1);
    v13 = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0, v13, &v11->_audioBufferQueue2);
    v14 = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0, v14, &v11->_videoBufferQueue);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ReplayKit.RPMovieWriterQueue", 0);
    movieWriterQueue = v11->_movieWriterQueue;
    v11->_movieWriterQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.ReplayKit.movieSaveQueue", v17);
    movieSaveQueue = v11->_movieSaveQueue;
    v11->_movieSaveQueue = (OS_dispatch_queue *)v18;

    v20 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.ReplayKitNotifications"];
    userNotificationCenter = v11->_userNotificationCenter;
    v11->_userNotificationCenter = v20;

    [(UNUserNotificationCenter *)v11->_userNotificationCenter setDelegate:v11];
    [(UNUserNotificationCenter *)v11->_userNotificationCenter setWantsNotificationResponsesDelivered];
  }
  return v11;
}

- (void)startWritingHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RPMovieWriter *)self movieWriterQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005830;
  v7[3] = &unk_100084EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4
{
  uint64_t v14 = 0;
  dispatch_queue_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  v7 = [(RPMovieWriter *)self movieWriterQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)&a4->c;
  long long v11 = *(_OWORD *)&a4->a;
  long long v12 = v8;
  block[2] = sub_100005B1C;
  block[3] = &unk_100084EE0;
  block[4] = self;
  block[5] = &v14;
  block[6] = a3;
  long long v13 = *(_OWORD *)&a4->tx;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)a4;
}

- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v5 = [(RPMovieWriter *)self movieWriterQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005C08;
  v6[3] = &unk_100084F08;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v5 = [(RPMovieWriter *)self movieWriterQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005CA8;
  v6[3] = &unk_100084F08;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)finishWritingWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPMovieWriter finishWritingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 188;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = [(RPMovieWriter *)self movieWriterQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005E0C;
  v7[3] = &unk_100084EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)finishWritingAndSaveToCameraRollWithSessionID:(id)a3 mixAudioTracks:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    char v17 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]";
    __int16 v18 = 1024;
    int v19 = 263;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006574;
  v12[3] = &unk_100084F58;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  BOOL v15 = a4;
  id v10 = v8;
  id v11 = v9;
  [(RPMovieWriter *)self finishWritingWithHandler:v12];
}

- (void)trimMovieWithURL:(id)a3 startClipDuration:(double)a4 endClipDuration:(double)a5 outputFileURL:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  BOOL v15 = [(RPMovieWriter *)self movieWriterQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006990;
  block[3] = &unk_100084FA8;
  id v21 = v12;
  id v22 = v14;
  id v20 = v13;
  double v23 = a4;
  double v24 = a5;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(v15, block);
}

- (void)dealloc
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v8 = "-[RPMovieWriter dealloc]";
    __int16 v9 = 1024;
    int v10 = 346;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  audioBufferQueue1 = self->_audioBufferQueue1;
  if (audioBufferQueue1) {
    CFRelease(audioBufferQueue1);
  }
  audioBufferQueue2 = self->_audioBufferQueue2;
  if (audioBufferQueue2) {
    CFRelease(audioBufferQueue2);
  }
  videoBufferQueue = self->_videoBufferQueue;
  if (videoBufferQueue) {
    CFRelease(videoBufferQueue);
  }
  v6.receiver = self;
  v6.super_class = (Class)RPMovieWriter;
  [(RPMovieWriter *)&v6 dealloc];
}

- (NSURL)outputURL
{
  v2 = [(RPMovieWriter *)self outputPath];
  v3 = +[NSURL fileURLWithPath:v2];

  return (NSURL *)v3;
}

- (void)updateOutputPath
{
  [(RPMovieWriter *)self setAssetWriterStartCount:[(RPMovieWriter *)self assetWriterStartCount] + 1];
  v3 = [(RPMovieWriter *)self originalOutputPath];
  id v4 = +[NSURL fileURLWithPath:v3];

  v5 = [v4 pathExtension];
  objc_super v6 = [v4 URLByDeletingPathExtension];
  v7 = [v6 path];

  id v8 = +[NSString stringWithFormat:@"%@_%d.%@", v7, [(RPMovieWriter *)self assetWriterStartCount], v5];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = [(RPMovieWriter *)self outputPath];
    *(_DWORD *)buf = 136447234;
    __int16 v11 = "-[RPMovieWriter updateOutputPath]";
    __int16 v12 = 1024;
    int v13 = 362;
    __int16 v14 = 2112;
    BOOL v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 1024;
    unsigned int v19 = [(RPMovieWriter *)self assetWriterStartCount];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Updating the AVAssetWriter path from %@ to %@ with start count of %d", buf, 0x2Cu);
  }
  [(RPMovieWriter *)self setOutputPath:v8];
}

- (id)averageVideoBitrate
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"RPBitRateOverride"];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    [(RPMovieWriter *)self windowSize];
    double v7 = v6 * 11.4;
    [(RPMovieWriter *)self windowSize];
    if ((uint64_t)(v7 * v8) <= 64000) {
      unint64_t v9 = 64000;
    }
    else {
      unint64_t v9 = (uint64_t)(v7 * v8);
    }
    if ([(NSString *)self->_videoCodecType isEqualToString:AVVideoCodecTypeHEVC]) {
      unint64_t v10 = 15000000;
    }
    else {
      unint64_t v10 = 25000000;
    }
    if (v9 <= v10)
    {
      unint64_t v10 = v9;
    }
    else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      videoCodecType = self->_videoCodecType;
      int v14 = 136447234;
      BOOL v15 = "-[RPMovieWriter averageVideoBitrate]";
      __int16 v16 = 1024;
      int v17 = 381;
      __int16 v18 = 2048;
      unint64_t v19 = v9;
      __int16 v20 = 2048;
      unint64_t v21 = v10;
      __int16 v22 = 2112;
      double v23 = videoCodecType;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d bitrate=%ld exceed maxBitrate=%ld for videoCodecType=%@, cap at max", (uint8_t *)&v14, 0x30u);
    }
    id v5 = +[NSNumber numberWithInteger:v10];
  }
  __int16 v12 = v5;

  return v12;
}

- (void)setUpAssetWriterWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = 388;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  [(RPMovieWriter *)self updateOutputPath];
  CMBufferQueueReset(self->_videoBufferQueue);
  CMBufferQueueReset(self->_audioBufferQueue1);
  CMBufferQueueReset(self->_audioBufferQueue2);
  long long v59 = *(_OWORD *)&kCMTimeInvalid.value;
  long long v52 = v59;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  CMTimeEpoch v5 = epoch;
  [(RPMovieWriter *)self setLastVideoPresentationTime:&v59];
  long long v57 = v52;
  CMTimeEpoch v58 = v5;
  [(RPMovieWriter *)self setLastAudio1PresentationTime:&v57];
  long long v55 = v52;
  CMTimeEpoch v56 = v5;
  [(RPMovieWriter *)self setLastAudio2PresentationTime:&v55];
  id v6 = objc_alloc((Class)AVAssetWriter);
  double v7 = [(RPMovieWriter *)self outputURL];
  id v54 = 0;
  id v8 = [v6 initWithURL:v7 fileType:AVFileTypeMPEG4 error:&v54];
  id v9 = v54;
  [(RPMovieWriter *)self setAssetWriter:v8];

  if (!v9)
  {
    __int16 v11 = +[AVMutableMetadataItem metadataItem];
    [v11 setKeySpace:AVMetadataKeySpaceQuickTimeMetadata];
    [v11 setKey:AVMetadataQuickTimeMetadataKeyAuthor];
    [v11 setValue:@"ReplayKitRecording"];
    __int16 v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v11, 0);
    int v13 = [(RPMovieWriter *)self assetWriter];
    [v13 setMetadata:v12];

    int v14 = +[NSMutableDictionary dictionary];
    BOOL v15 = [(RPMovieWriter *)self averageVideoBitrate];
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v15 integerValue];
      *(_DWORD *)buf = 136446722;
      v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
      uint64_t v65 = 0x800000001AF0400;
      id v66 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d bit rate set to %ld", buf, 0x1Cu);
    }
    int v17 = [(RPMovieWriter *)self videoCodecType];
    unsigned __int8 v18 = [v17 isEqualToString:AVVideoCodecTypeH264];

    if (v18)
    {
      unint64_t v19 = (id *)&AVVideoProfileLevelH264HighAutoLevel;
    }
    else
    {
      __int16 v20 = [(RPMovieWriter *)self videoCodecType];
      unsigned int v21 = [v20 isEqualToString:AVVideoCodecTypeHEVC];

      if (!v21)
      {
        id v22 = 0;
LABEL_18:
        v70[0] = AVVideoExpectedSourceFrameRateKey;
        v70[1] = AVVideoProfileLevelKey;
        v71[0] = &off_100089B58;
        v71[1] = v22;
        v51 = v22;
        v70[2] = AVVideoAverageBitRateKey;
        v70[3] = AVVideoMaxKeyFrameIntervalKey;
        v53 = v15;
        v71[2] = v15;
        v71[3] = &off_100089B58;
        double v23 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:4];
        [v14 addEntriesFromDictionary:v23];

        double v24 = [(RPBroadcastConfiguration *)self->_broadcastConfig videoCompressionProperties];

        if (v24)
        {
          if (dword_100099BB8 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
            LOWORD(v65) = 1024;
            *(_DWORD *)((char *)&v65 + 2) = 448;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d using custom video compression properties", buf, 0x12u);
          }
          objc_super v25 = [(RPBroadcastConfiguration *)self->_broadcastConfig videoCompressionProperties];
          [v14 addEntriesFromDictionary:v25];
        }
        [(RPMovieWriter *)self windowSize];
        if ((uint64_t)v26 >= -1) {
          uint64_t v27 = (uint64_t)v26 + 1;
        }
        else {
          uint64_t v27 = (uint64_t)v26 + 2;
        }
        double v28 = (double)(uint64_t)(v27 & 0xFFFFFFFFFFFFFFFELL);
        [(RPMovieWriter *)self windowSize];
        if ((uint64_t)v29 >= -1) {
          uint64_t v30 = (uint64_t)v29 + 1;
        }
        else {
          uint64_t v30 = (uint64_t)v29 + 2;
        }
        double v31 = (double)(uint64_t)(v30 & 0xFFFFFFFFFFFFFFFELL);
        v68[0] = AVVideoCodecKey;
        __int16 v32 = [(RPMovieWriter *)self videoCodecType];
        v69[0] = v32;
        v68[1] = AVVideoWidthKey;
        double v33 = +[NSNumber numberWithDouble:v28];
        v69[1] = v33;
        v68[2] = AVVideoHeightKey;
        __int16 v34 = +[NSNumber numberWithDouble:v31];
        v68[3] = AVVideoCompressionPropertiesKey;
        v69[2] = v34;
        v69[3] = v14;
        double v35 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];

        id v36 = [objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeVideo outputSettings:v35];
        [(RPMovieWriter *)self setVideoInput:v36];

        v37 = [(RPMovieWriter *)self videoInput];
        [v37 setExpectsMediaDataInRealTime:1];

        v38 = [(RPMovieWriter *)self assetWriter];
        v39 = [(RPMovieWriter *)self videoInput];
        [v38 addInput:v39];

        uint64_t v65 = 0;
        v64 = 0;
        id v66 = 0;
        int v67 = 0;
        *(_DWORD *)buf = 6619138;
        v61[0] = AVFormatIDKey;
        v61[1] = AVNumberOfChannelsKey;
        v62[0] = &off_100089B70;
        v62[1] = &off_100089B88;
        v62[2] = &off_100089DB0;
        v61[2] = AVSampleRateKey;
        v61[3] = AVChannelLayoutKey;
        v40 = +[NSData dataWithBytes:buf length:32];
        v61[4] = AVEncoderBitRateKey;
        v62[3] = v40;
        v62[4] = &off_100089BA0;
        v41 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:5];

        id v42 = [objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeAudio outputSettings:v41];
        [(RPMovieWriter *)self setAudioInput1:v42];

        v43 = [(RPMovieWriter *)self audioInput1];
        [v43 setExpectsMediaDataInRealTime:1];

        v44 = [(RPMovieWriter *)self assetWriter];
        v45 = [(RPMovieWriter *)self audioInput1];
        [v44 addInput:v45];

        id v46 = [objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeAudio outputSettings:v41];
        [(RPMovieWriter *)self setAudioInput2:v46];

        v47 = [(RPMovieWriter *)self audioInput2];
        [v47 setExpectsMediaDataInRealTime:1];

        v48 = [(RPMovieWriter *)self assetWriter];
        v49 = [(RPMovieWriter *)self audioInput2];
        [v48 addInput:v49];

        if (v4)
        {
          v50 = [(RPMovieWriter *)self assetWriter];
          if (v50)
          {
            unint64_t v10 = 0;
          }
          else
          {
            unint64_t v10 = +[NSError _rpUserErrorForCode:-5824 userInfo:0];
          }

          goto LABEL_34;
        }
        goto LABEL_35;
      }
      unint64_t v19 = (id *)&kVTProfileLevel_HEVC_Main_AutoLevel;
    }
    id v22 = *v19;
    goto LABEL_18;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004F56C(v9);
    if (!v4) {
      goto LABEL_35;
    }
    goto LABEL_8;
  }
  if (v4)
  {
LABEL_8:
    unint64_t v10 = +[NSError _rpUserErrorForCode:-5824 userInfo:0];
LABEL_34:
    v4[2](v4, v10);
  }
LABEL_35:
}

- (BOOL)dispatchedAppendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4
{
  double v7 = [(RPMovieWriter *)self assetWriter];
  id v8 = v7;
  if (!a3 || !v7)
  {

    return 1;
  }
  unsigned __int8 v9 = [(RPMovieWriter *)self isFinishingWriting];

  if ((v9 & 1) == 0)
  {
    unint64_t v10 = [(RPMovieWriter *)self assetWriter];
    if ([v10 status] == (id)1)
    {
      unsigned int v11 = [(RPMovieWriter *)self didProcessFirstSample];

      if (v11)
      {
        if (CMBufferQueueGetBufferCount(self->_videoBufferQueue) >= 5)
        {
          if (dword_100099BB8 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf[0].value) = 136446466;
            *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSampleBuffer"
                                                                       ":withWindowTransform:]";
            LOWORD(buf[0].flags) = 1024;
            *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 503;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Dropping oldest sample buffer from video buffer queue", (uint8_t *)buf, 0x12u);
          }
          CMBufferRef v12 = CMBufferQueueDequeueAndRetain(self->_videoBufferQueue);
          if (v12) {
            CFRelease(v12);
          }
        }
        if (CMBufferQueueEnqueue(self->_videoBufferQueue, a3))
        {
          if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10004F5F4();
          }
        }
        else
        {
          unsigned int v21 = [(RPMovieWriter *)self videoInput];
          if ([v21 isReadyForMoreMediaData])
          {
            p_lastVideoPresentationTime = &self->_lastVideoPresentationTime;
            *(void *)&long long v22 = 136446722;
            long long v32 = v22;
            while (1)
            {
              BOOL v24 = CMBufferQueueIsEmpty(self->_videoBufferQueue) == 0;

              if (!v24) {
                break;
              }
              objc_super v25 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_videoBufferQueue);
              if (v25)
              {
                *(_OWORD *)&buf[0].CMTimeValue value = *(_OWORD *)&p_lastVideoPresentationTime->value;
                buf[0].CMTimeEpoch epoch = self->_lastVideoPresentationTime.epoch;
                CMTime time2 = kCMTimeInvalid;
                if (CMTimeCompare(buf, &time2))
                {
                  CMTimeValue value = p_lastVideoPresentationTime->value;
                  CMSampleBufferGetPresentationTimeStamp(&v44, v25);
                  if (value >= v44.value)
                  {
                    if (dword_100099BB8 <= 1
                      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0].value) = 136446466;
                      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSa"
                                                                                 "mpleBuffer:withWindowTransform:]";
                      LOWORD(buf[0].flags) = 1024;
                      *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 520;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarding video sample buffer due to timestamp earlier than previous", (uint8_t *)buf, 0x12u);
                    }
                    CFRelease(v25);
                    return 1;
                  }
                }
                else
                {
                  double v27 = sub_100049AA8(a3);
                  if (dword_100099BB8 <= 1)
                  {
                    float v28 = *(float *)&v27;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0].value) = v32;
                      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSa"
                                                                                 "mpleBuffer:withWindowTransform:]";
                      LOWORD(buf[0].flags) = 1024;
                      *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 526;
                      WORD1(buf[0].epoch) = 2048;
                      *(double *)((char *)&buf[0].epoch + 4) = v28;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d video first sample received at time %.3f", (uint8_t *)buf, 0x1Cu);
                    }
                  }
                }
                CMSampleBufferGetPresentationTimeStamp(&v43, v25);
                CMTime v42 = v43;
                [(RPMovieWriter *)self setLastVideoPresentationTime:&v42];
                if (dword_100099BB8 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  [(RPMovieWriter *)self lastVideoPresentationTime];
                  CMTimeEpoch v29 = v41;
                  [(RPMovieWriter *)self lastVideoPresentationTime];
                  int v30 = v40;
                  CMSampleBufferGetDuration(&v39, v25);
                  LODWORD(buf[0].value) = 136447234;
                  *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSample"
                                                                             "Buffer:withWindowTransform:]";
                  LOWORD(buf[0].flags) = 1024;
                  *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 530;
                  WORD1(buf[0].epoch) = 2048;
                  *(CMTimeEpoch *)((char *)&buf[0].epoch + 4) = v29;
                  WORD2(buf[1].value) = 1024;
                  *(_DWORD *)((char *)&buf[1].value + 6) = v30;
                  HIWORD(buf[1].timescale) = 2048;
                  *(void *)&buf[1].flags = v39.value;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending video sample with timestamp:%lld scale:%d duration:%lld", (uint8_t *)buf, 0x2Cu);
                }
                double v31 = [(RPMovieWriter *)self videoInput];
                [v31 appendSampleBuffer:v25];

                CFRelease(v25);
              }
              unsigned int v21 = [(RPMovieWriter *)self videoInput];
              if (([v21 isReadyForMoreMediaData] & 1) == 0) {
                goto LABEL_40;
              }
            }
          }
          else
          {
LABEL_40:
          }
        }
        return 1;
      }
    }
    else
    {
    }
    time2.CMTimeValue value = 0;
    *(void *)&time2.timescale = &time2;
    time2.CMTimeEpoch epoch = 0x2020000000;
    char v38 = 0;
    int v13 = [(RPMovieWriter *)self assetWriter];
    BOOL v14 = [v13 status] == (id)3;

    if (v14)
    {
      if ([(RPMovieWriter *)self didProcessFirstSample])
      {
        BOOL v15 = +[NSFileManager defaultManager];
        id v16 = [(RPMovieWriter *)self outputURL];
        [v15 _srRemoveFile:v16 completion:&stru_100084FC8];
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      long long v17 = *(_OWORD *)&a4->c;
      long long v34 = *(_OWORD *)&a4->a;
      long long v35 = v17;
      v33[2] = sub_1000083A4;
      v33[3] = &unk_100084FF0;
      v33[4] = self;
      v33[5] = &time2;
      v33[6] = a3;
      long long v36 = *(_OWORD *)&a4->tx;
      [(RPMovieWriter *)self setUpAssetWriterWithHandler:v33];
    }
    else
    {
      long long v18 = *(_OWORD *)&a4->c;
      *(_OWORD *)&buf[0].CMTimeValue value = *(_OWORD *)&a4->a;
      *(_OWORD *)&buf[0].CMTimeEpoch epoch = v18;
      *(_OWORD *)&buf[1].timescale = *(_OWORD *)&a4->tx;
      unsigned __int8 v19 = [(RPMovieWriter *)self appendInitialSampleBuffer:a3 withTransform:buf];
      *(unsigned char *)(*(void *)&time2.timescale + 24) = v19;
    }
    _Block_object_dispose(&time2, 8);
  }
  return 1;
}

- (BOOL)appendInitialSampleBuffer:(opaqueCMSampleBuffer *)a3 withTransform:(CGAffineTransform *)a4
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [(RPMovieWriter *)self assetWriter];
    LODWORD(buf.value) = 136446722;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
    LOWORD(buf.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.flags + 2) = 578;
    WORD1(buf.epoch) = 1024;
    HIDWORD(buf.epoch) = [v7 status];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer status %d", (uint8_t *)&buf, 0x18u);
  }
  id v8 = [(RPMovieWriter *)self assetWriter];
  if ([v8 status] == (id)1)
  {

    goto LABEL_11;
  }
  unsigned __int8 v9 = [(RPMovieWriter *)self assetWriter];
  id v10 = [v9 status];

  if (v10 == (id)3)
  {
LABEL_11:
    long long v17 = [(RPMovieWriter *)self assetWriter];
    id v18 = [v17 status];

    if (v18 == (id)1)
    {
      memset(&buf, 0, sizeof(buf));
      CMSampleBufferGetPresentationTimeStamp(&buf, a3);
      if ((buf.flags & 1) == 0)
      {
        if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004F788((uint64_t)&buf.flags, v19, v20, v21, v22, v23, v24, v25);
        }
        goto LABEL_35;
      }
      double v26 = [(RPMovieWriter *)self assetWriter];
      CMTime v38 = buf;
      [v26 startSessionAtSourceTime:&v38];

      double v27 = [(RPMovieWriter *)self videoInput];
      unsigned int v28 = [v27 isReadyForMoreMediaData];

      if (v28)
      {
        CMTimeEpoch v29 = [(RPMovieWriter *)self videoInput];
        unsigned int v30 = [v29 appendSampleBuffer:a3];

        [(RPMovieWriter *)self setDidProcessFirstSample:1];
        if (!v30)
        {
          if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10004F820();
          }
          goto LABEL_35;
        }
        if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_35:
          LOBYTE(v32) = 1;
          return v32;
        }
        LODWORD(v38.value) = 136446466;
        *(CMTimeValue *)((char *)&v38.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
        LOWORD(v38.flags) = 1024;
        *(CMTimeFlags *)((char *)&v38.flags + 2) = 603;
        double v31 = " [INFO] %{public}s:%d asset writer appended first sample";
      }
      else
      {
        if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        LODWORD(v38.value) = 136446466;
        *(CMTimeValue *)((char *)&v38.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
        LOWORD(v38.flags) = 1024;
        *(CMTimeFlags *)((char *)&v38.flags + 2) = 608;
        double v31 = " [INFO] %{public}s:%d asset writer started but video input not ready for data";
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v38, 0x12u);
      goto LABEL_35;
    }
    goto LABEL_24;
  }
  long long v11 = *(_OWORD *)&a4->c;
  long long v35 = *(_OWORD *)&a4->a;
  long long v36 = v11;
  long long v37 = *(_OWORD *)&a4->tx;
  CMBufferRef v12 = [(RPMovieWriter *)self videoInput];
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  [v12 setTransform:v34];

  int v13 = [(RPMovieWriter *)self assetWriter];
  unsigned __int8 v14 = [v13 startWriting];

  if (v14)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = [(RPMovieWriter *)self assetWriter];
      unsigned int v16 = [v15 status];
      LODWORD(buf.value) = 136446722;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 585;
      WORD1(buf.epoch) = 1024;
      HIDWORD(buf.epoch) = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer started with status %d", (uint8_t *)&buf, 0x18u);
    }
    goto LABEL_11;
  }
  if (dword_100099BB8 > 2)
  {
LABEL_27:
    LOBYTE(v32) = 0;
    return v32;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004F928(self);
  }
LABEL_24:
  if (dword_100099BB8 > 2) {
    goto LABEL_27;
  }
  BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v32)
  {
    sub_10004F8A4();
    goto LABEL_27;
  }
  return v32;
}

- (void)dispatchedAppendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMTimeEpoch v5 = [(RPMovieWriter *)self assetWriter];
  if (!a3 || !v5) {
    goto LABEL_11;
  }
  uint64_t v21 = v5;
  unsigned __int8 v6 = [(RPMovieWriter *)self isFinishingWriting];

  if (v6) {
    return;
  }
  uint64_t v22 = [(RPMovieWriter *)self assetWriter];
  if ([v22 status] != (id)1)
  {
    CMTimeEpoch v5 = v22;
LABEL_11:

    return;
  }
  unsigned int v7 = [(RPMovieWriter *)self didProcessFirstSample];

  if (v7)
  {
    if (CMBufferQueueEnqueue(self->_audioBufferQueue1, a3))
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004FA1C();
      }
    }
    else
    {
      id v8 = [(RPMovieWriter *)self audioInput1];
      if ([v8 isReadyForMoreMediaData])
      {
        p_lastAudio1PresentationTime = &self->_lastAudio1PresentationTime;
        *(void *)&long long v9 = 136446722;
        long long v20 = v9;
        while (1)
        {
          int IsEmpty = CMBufferQueueIsEmpty(self->_audioBufferQueue1);

          if (IsEmpty) {
            break;
          }
          CMBufferRef v12 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_audioBufferQueue1);
          if (v12)
          {
            int v13 = v12;
            *(_OWORD *)time1 = *(_OWORD *)&p_lastAudio1PresentationTime->value;
            *(void *)&time1[16] = self->_lastAudio1PresentationTime.epoch;
            CMTime time2 = kCMTimeInvalid;
            if (CMTimeCompare((CMTime *)time1, &time2))
            {
              CMTimeValue value = p_lastAudio1PresentationTime->value;
              CMSampleBufferGetPresentationTimeStamp(&v28, v13);
              if (value >= v28.value)
              {
                if (dword_100099BB8 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = 136446466;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 640;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarding audio 1 sample buffer due to timestamp earlier than previous", time1, 0x12u);
                }
                CFRelease(v13);
                return;
              }
            }
            else
            {
              double v15 = sub_100049AA8(a3);
              if (dword_100099BB8 <= 1)
              {
                float v16 = *(float *)&v15;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = v20;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 646;
                  *(_WORD *)&time1[18] = 2048;
                  *(double *)&time1[20] = v16;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d audio first sample received at time %.3f", time1, 0x1Cu);
                }
              }
            }
            CMSampleBufferGetPresentationTimeStamp(&v27, v13);
            CMTime v26 = v27;
            [(RPMovieWriter *)self setLastAudio1PresentationTime:&v26];
            if (dword_100099BB8 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              [(RPMovieWriter *)self lastAudio1PresentationTime];
              uint64_t v17 = v25;
              [(RPMovieWriter *)self lastAudio1PresentationTime];
              int v18 = v24;
              CMSampleBufferGetDuration(&v23, v13);
              *(_DWORD *)time1 = 136447234;
              *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
              *(_WORD *)&time1[12] = 1024;
              *(_DWORD *)&time1[14] = 650;
              *(_WORD *)&time1[18] = 2048;
              *(void *)&time1[20] = v17;
              __int16 v31 = 1024;
              int v32 = v18;
              __int16 v33 = 2048;
              CMTimeValue v34 = v23.value;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending app audio sample with timestamp:%lld scale:%d duration:%lld", time1, 0x2Cu);
            }
            uint64_t v19 = [(RPMovieWriter *)self audioInput1];
            [v19 appendSampleBuffer:v13];

            CFRelease(v13);
          }
          id v8 = [(RPMovieWriter *)self audioInput1];
          if (([v8 isReadyForMoreMediaData] & 1) == 0) {
            goto LABEL_29;
          }
        }
      }
      else
      {
LABEL_29:
      }
    }
  }
}

- (void)dispatchedAppendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMTimeEpoch v5 = [(RPMovieWriter *)self assetWriter];
  if (!a3 || !v5) {
    goto LABEL_11;
  }
  uint64_t v21 = v5;
  unsigned __int8 v6 = [(RPMovieWriter *)self isFinishingWriting];

  if (v6) {
    return;
  }
  uint64_t v22 = [(RPMovieWriter *)self assetWriter];
  if ([v22 status] != (id)1)
  {
    CMTimeEpoch v5 = v22;
LABEL_11:

    return;
  }
  unsigned int v7 = [(RPMovieWriter *)self didProcessFirstSample];

  if (v7)
  {
    if (CMBufferQueueEnqueue(self->_audioBufferQueue2, a3))
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004FAA0();
      }
    }
    else
    {
      id v8 = [(RPMovieWriter *)self audioInput2];
      if ([v8 isReadyForMoreMediaData])
      {
        p_lastAudio2PresentationTime = &self->_lastAudio2PresentationTime;
        *(void *)&long long v9 = 136446722;
        long long v20 = v9;
        while (1)
        {
          int IsEmpty = CMBufferQueueIsEmpty(self->_audioBufferQueue2);

          if (IsEmpty) {
            break;
          }
          CMBufferRef v12 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_audioBufferQueue2);
          if (v12)
          {
            int v13 = v12;
            *(_OWORD *)time1 = *(_OWORD *)&p_lastAudio2PresentationTime->value;
            *(void *)&time1[16] = self->_lastAudio2PresentationTime.epoch;
            CMTime time2 = kCMTimeInvalid;
            if (CMTimeCompare((CMTime *)time1, &time2))
            {
              CMTimeValue value = p_lastAudio2PresentationTime->value;
              CMSampleBufferGetPresentationTimeStamp(&v28, v13);
              if (value >= v28.value)
              {
                if (dword_100099BB8 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = 136446466;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 684;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarding audio 2 sample buffer due to timestamp earlier than previous", time1, 0x12u);
                }
                CFRelease(v13);
                return;
              }
            }
            else
            {
              double v15 = sub_100049AA8(a3);
              if (dword_100099BB8 <= 1)
              {
                float v16 = *(float *)&v15;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = v20;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 690;
                  *(_WORD *)&time1[18] = 2048;
                  *(double *)&time1[20] = v16;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d mic first sample received at time %.3f", time1, 0x1Cu);
                }
              }
            }
            CMSampleBufferGetPresentationTimeStamp(&v27, v13);
            CMTime v26 = v27;
            [(RPMovieWriter *)self setLastAudio2PresentationTime:&v26];
            if (dword_100099BB8 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              [(RPMovieWriter *)self lastAudio2PresentationTime];
              uint64_t v17 = v25;
              [(RPMovieWriter *)self lastAudio2PresentationTime];
              int v18 = v24;
              CMSampleBufferGetDuration(&v23, v13);
              *(_DWORD *)time1 = 136447234;
              *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
              *(_WORD *)&time1[12] = 1024;
              *(_DWORD *)&time1[14] = 694;
              *(_WORD *)&time1[18] = 2048;
              *(void *)&time1[20] = v17;
              __int16 v31 = 1024;
              int v32 = v18;
              __int16 v33 = 2048;
              CMTimeValue v34 = v23.value;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending mic audio sample with timestamp:%lld scale:%d duration:%lld", time1, 0x2Cu);
            }
            uint64_t v19 = [(RPMovieWriter *)self audioInput2];
            [v19 appendSampleBuffer:v13];

            CFRelease(v13);
          }
          id v8 = [(RPMovieWriter *)self audioInput2];
          if (([v8 isReadyForMoreMediaData] & 1) == 0) {
            goto LABEL_29;
          }
        }
      }
      else
      {
LABEL_29:
      }
    }
  }
}

- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 handler:(id)a5
{
}

- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 mixAudioTracks:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  movieSaveQueue = self->_movieSaveQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009270;
  block[3] = &unk_100085068;
  BOOL v21 = a5;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(movieSaveQueue, block);
}

- (id)createAssetURLFromPhotosIdentifier:(id)a3
{
  v3 = +[PHObject uuidFromLocalIdentifier:a3];
  id v4 = +[NSString stringWithFormat:@"photos://asset?uuid=%@&albumname=camera-roll", v3];
  CMTimeEpoch v5 = +[NSURL URLWithString:v4];

  return v5;
}

- (void)displayScreenRecorderNotificationWithURL:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    unsigned int v7 = "-[RPMovieWriter displayScreenRecorderNotificationWithURL:]";
    __int16 v8 = 1024;
    int v9 = 776;
    __int16 v10 = 2048;
    id v11 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v6, 0x1Cu);
  }
  CMTimeEpoch v5 = [(RPMovieWriter *)self createNotificationRequestWithAssetURL:v4];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v5 withCompletionHandler:&stru_100085088];
}

- (id)createNotificationRequestWithAssetURL:(id)a3
{
  id v4 = a3;
  BOOL v21 = self;
  CMTimeEpoch v5 = [(RPMovieWriter *)self createAssetURLFromPhotosIdentifier:v4];
  id v6 = objc_alloc_init((Class)UNMutableNotificationContent);
  unsigned int v7 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_TITLE"];
  [v6 setTitle:v7];

  __int16 v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_BULLETIN_MESSAGE"];
  [v6 setBody:v8];

  [v6 setThreadIdentifier:@"orginalRecordID"];
  if (v4)
  {
    CFStringRef v23 = @"photoAssetIdKey";
    id v24 = v4;
    int v9 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v6 setUserInfo:v9];
  }
  [v6 setDefaultActionURL:v5];
  [v6 setShouldIgnoreDoNotDisturb:1];
  __int16 v10 = +[UNNotificationActionIcon iconWithSystemImageName:@"photo.fill"];
  id v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SYSTEM_RECORDING_LONG_PRESS_VIEW"];
  id v12 = +[UNNotificationAction actionWithIdentifier:@"viewAction" title:v11 url:v5 options:0 icon:v10];

  int v13 = +[UNNotificationActionIcon iconWithSystemImageName:@"xmark.circle"];
  id v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SYSTEM_RECORDING_LONG_PRESS_DELETE"];
  id v15 = +[UNNotificationAction actionWithIdentifier:@"deleteAction" title:v14 options:3 icon:v13];

  v22[0] = v12;
  v22[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v22 count:2];
  uint64_t v17 = +[UNNotificationCategory categoryWithIdentifier:@"orginalRecordID" actions:v16 intentIdentifiers:&__NSArray0__struct options:0];

  id v18 = +[NSSet setWithObject:v17];
  [(UNUserNotificationCenter *)v21->_userNotificationCenter setNotificationCategories:v18];

  [v6 setCategoryIdentifier:@"orginalRecordID"];
  id v19 = +[UNNotificationRequest requestWithIdentifier:@"orginalRecordID" content:v6 trigger:0];

  return v19;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(void))a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446722;
    unsigned int v30 = "-[RPMovieWriter userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v31 = 1024;
    int v32 = 837;
    __int16 v33 = 2048;
    CMTimeValue v34 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  id v11 = [v9 actionIdentifier];
  unsigned int v12 = [v11 isEqualToString:@"deleteAction"];

  if (v12)
  {
    int v13 = [v9 notification];
    id v14 = [v13 request];
    id v15 = [v14 content];
    id v16 = [v15 userInfo];

    if (!v16) {
      goto LABEL_20;
    }
    uint64_t v17 = [v16 objectForKey:@"photoAssetIdKey"];
    if (!v17) {
      goto LABEL_20;
    }
    id v18 = (void *)v17;
    uint64_t v28 = v17;
    id v19 = +[NSArray arrayWithObjects:&v28 count:1];
    id v20 = +[PHAsset fetchAssetsWithLocalIdentifiers:v19 options:0];
    BOOL v21 = [v20 firstObject];

    if (v21)
    {
      uint64_t v22 = +[PHPhotoLibrary sharedPhotoLibrary];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100009F08;
      v26[3] = &unk_100084E28;
      id v23 = v21;
      id v27 = v23;
      id v25 = 0;
      [v22 performChangesAndWait:v26 error:&v25];
      id v24 = v25;

      if (v24
        && dword_100099BB8 <= 2
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10004FC2C();
      }
      v10[2](v10);
    }
    else
    {
LABEL_20:
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004FBA8();
      }
    }
  }
}

- (void)notifyRecordingMayBeStopped
{
  [(RPMovieWriter *)self lastVideoPresentationTime];
  long long v3 = v5;
  uint64_t v4 = v6;
  [(RPMovieWriter *)self setTrimVideoPresentationTime:&v3];
}

- (void)notifyRecordingResumed
{
  long long v2 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  [(RPMovieWriter *)self setTrimVideoPresentationTime:&v2];
}

- (RPBroadcastConfiguration)broadcastConfig
{
  return self->_broadcastConfig;
}

- (void)setBroadcastConfig:(id)a3
{
}

- (BOOL)systemRecording
{
  return self->_systemRecording;
}

- (void)setSystemRecording:(BOOL)a3
{
  self->_systemRecording = a3;
}

- (OS_dispatch_queue)movieWriterQueue
{
  return self->_movieWriterQueue;
}

- (OS_dispatch_queue)movieSaveQueue
{
  return self->_movieSaveQueue;
}

- (AVAssetWriter)assetWriter
{
  return self->_assetWriter;
}

- (void)setAssetWriter:(id)a3
{
}

- (AVAssetWriterInput)videoInput
{
  return self->_videoInput;
}

- (void)setVideoInput:(id)a3
{
}

- (AVAssetWriterInput)audioInput1
{
  return self->_audioInput1;
}

- (void)setAudioInput1:(id)a3
{
}

- (AVAssetWriterInput)audioInput2
{
  return self->_audioInput2;
}

- (void)setAudioInput2:(id)a3
{
}

- (NSString)outputPath
{
  return self->_outputPath;
}

- (void)setOutputPath:(id)a3
{
}

- (NSString)originalOutputPath
{
  return self->_originalOutputPath;
}

- (void)setOriginalOutputPath:(id)a3
{
}

- (int)assetWriterStartCount
{
  return self->_assetWriterStartCount;
}

- (void)setAssetWriterStartCount:(int)a3
{
  self->_assetWriterStartCount = a3;
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoCodecType:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void)setLastVideoPresentationTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastVideoPresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastVideoPresentationTime.CMTimeValue value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio1PresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setLastAudio1PresentationTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastAudio1PresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastAudio1PresentationTime.CMTimeValue value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio2PresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void)setLastAudio2PresentationTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastAudio2PresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastAudio2PresentationTime.CMTimeValue value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimVideoPresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (void)setTrimVideoPresentationTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_trimVideoPresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_trimVideoPresentationTime.CMTimeValue value = v3;
}

- (opaqueCMBufferQueue)audioBufferQueue1
{
  return self->_audioBufferQueue1;
}

- (void)setAudioBufferQueue1:(opaqueCMBufferQueue *)a3
{
  self->_audioBufferQueue1 = a3;
}

- (opaqueCMBufferQueue)audioBufferQueue2
{
  return self->_audioBufferQueue2;
}

- (void)setAudioBufferQueue2:(opaqueCMBufferQueue *)a3
{
  self->_audioBufferQueue2 = a3;
}

- (opaqueCMBufferQueue)videoBufferQueue
{
  return self->_videoBufferQueue;
}

- (void)setVideoBufferQueue:(opaqueCMBufferQueue *)a3
{
  self->_videoBufferQueue = a3;
}

- (BOOL)didProcessFirstSample
{
  return self->_didProcessFirstSample;
}

- (void)setDidProcessFirstSample:(BOOL)a3
{
  self->_didProcessFirstSample = a3;
}

- (BOOL)isFinishingWriting
{
  return self->_isFinishingWriting;
}

- (void)setIsFinishingWriting:(BOOL)a3
{
  self->_isFinishingWriting = a3;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(double)a3
{
  self->_durationInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCodecType, 0);
  objc_storeStrong((id *)&self->_originalOutputPath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_audioInput2, 0);
  objc_storeStrong((id *)&self->_audioInput1, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_movieSaveQueue, 0);
  objc_storeStrong((id *)&self->_movieWriterQueue, 0);
  objc_storeStrong((id *)&self->_broadcastConfig, 0);

  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end