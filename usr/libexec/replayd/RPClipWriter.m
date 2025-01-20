@interface RPClipWriter
- (RPClipWriter)initWithWindowSize:(CGSize)a3;
- (id)dispatchClipWriterQueue;
- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)flushClipBuffer;
- (void)queueAndWaitForSample:(int)a3 withAssetInput:(id)a4 withBuffer:(id)a5 didAppendIdleFrame:(BOOL)a6;
- (void)setupAssetWriter;
- (void)updateLatestSampleTime:(opaqueCMSampleBuffer *)a3;
- (void)waitForCompletionAndFinishWriting:(id *)a3 withHandler:(id)a4;
@end

@implementation RPClipWriter

- (RPClipWriter)initWithWindowSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPClipWriter initWithWindowSize:]";
    __int16 v21 = 1024;
    int v22 = 60;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v18.receiver = self;
  v18.super_class = (Class)RPClipWriter;
  v6 = [(RPClipWriter *)&v18 init];
  if (v6)
  {
    id v7 = [[RPClipBuffer alloc] initForVideo:1];
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    id v9 = [[RPClipBuffer alloc] initForVideo:0];
    v10 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v9;

    id v11 = [[RPClipBuffer alloc] initForVideo:0];
    v12 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v11;

    dispatch_group_t v13 = dispatch_group_create();
    v14 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ReplayKit.RPClipWriterQueue", 0);
    v16 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v15;

    *((CGFloat *)v6 + 7) = width;
    *((CGFloat *)v6 + 8) = height;
    *(_OWORD *)(v6 + 120) = *(_OWORD *)&kCMTimeNegativeInfinity.value;
    *((void *)v6 + 17) = kCMTimeNegativeInfinity.epoch;
  }
  return (RPClipWriter *)v6;
}

- (void)setupAssetWriter
{
  videoInput = self->_videoInput;
  self->_videoInput = 0;

  audioInput1 = self->_audioInput1;
  self->_audioInput1 = 0;

  audioInput2 = self->_audioInput2;
  self->_audioInput2 = 0;

  id v6 = objc_alloc((Class)AVAssetWriter);
  outputURL = self->_outputURL;
  id v24 = 0;
  v8 = (AVAssetWriter *)[v6 initWithURL:outputURL fileType:AVFileTypeMPEG4 error:&v24];
  id v9 = v24;
  assetWriter = self->_assetWriter;
  self->_assetWriter = v8;

  if (v9)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000552A4(v9);
    }
  }
  else
  {
    id v11 = (AVAssetWriterInput *)[objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeVideo outputSettings:0 sourceFormatHint:-[RPClipBuffer getFormatDescription](self->_clipBufferVideo, "getFormatDescription")];
    v12 = self->_videoInput;
    self->_videoInput = v11;

    [(AVAssetWriterInput *)self->_videoInput setExpectsMediaDataInRealTime:0];
    [(AVAssetWriter *)self->_assetWriter addInput:self->_videoInput];
    uint64_t v21 = 0;
    uint64_t v20 = 0;
    int v23 = 0;
    uint64_t v22 = 0;
    int v19 = 6619138;
    v25[0] = AVFormatIDKey;
    v25[1] = AVNumberOfChannelsKey;
    v26[0] = &off_100089D50;
    v26[1] = &off_100089D68;
    v26[2] = &off_100089DC0;
    v25[2] = AVSampleRateKey;
    v25[3] = AVChannelLayoutKey;
    dispatch_group_t v13 = +[NSData dataWithBytes:&v19 length:32];
    v25[4] = AVEncoderBitRateKey;
    v26[3] = v13;
    v26[4] = &off_100089D80;
    v14 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];

    dispatch_queue_t v15 = (AVAssetWriterInput *)[objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeAudio outputSettings:v14];
    v16 = self->_audioInput1;
    self->_audioInput1 = v15;

    [(AVAssetWriterInput *)self->_audioInput1 setExpectsMediaDataInRealTime:0];
    [(AVAssetWriter *)self->_assetWriter addInput:self->_audioInput1];
    if (self->_enableMic)
    {
      v17 = (AVAssetWriterInput *)[objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeAudio outputSettings:v14];
      objc_super v18 = self->_audioInput2;
      self->_audioInput2 = v17;

      [(AVAssetWriterInput *)self->_audioInput2 setExpectsMediaDataInRealTime:0];
      [(AVAssetWriter *)self->_assetWriter addInput:self->_audioInput2];
    }
  }
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendVideoSampleBuffer:]";
    __int16 v9 = 1024;
    int v10 = 109;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %p", buf, 0x1Cu);
  }
  CFRetain(a3);
  v5 = [(RPClipWriter *)self dispatchClipWriterQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100045820;
  v6[3] = &unk_100084F08;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendAudio1SampleBuffer:]";
    __int16 v9 = 1024;
    int v10 = 133;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %p", buf, 0x1Cu);
  }
  CFRetain(a3);
  v5 = [(RPClipWriter *)self dispatchClipWriterQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100045A14;
  v6[3] = &unk_100084F08;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendAudio2SampleBuffer:]";
    __int16 v9 = 1024;
    int v10 = 143;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %p", buf, 0x1Cu);
  }
  CFRetain(a3);
  v5 = [(RPClipWriter *)self dispatchClipWriterQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100045BB0;
  v6[3] = &unk_100084F08;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)updateLatestSampleTime:(opaqueCMSampleBuffer *)a3
{
  memset(&v6, 0, sizeof(v6));
  CMSampleBufferGetPresentationTimeStamp(&v6, a3);
  CMTime latestCMSamplePresentationTime = (CMTime)self->_latestCMSamplePresentationTime;
  double Seconds = CMTimeGetSeconds(&latestCMSamplePresentationTime);
  CMTime latestCMSamplePresentationTime = v6;
  if (Seconds < CMTimeGetSeconds(&latestCMSamplePresentationTime)) {
    self->_CMTime latestCMSamplePresentationTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
  }
}

- (void)queueAndWaitForSample:(int)a3 withAssetInput:(id)a4 withBuffer:(id)a5 didAppendIdleFrame:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 160;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v29 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  id v12 = [v11 count];
  *(void *)(*(void *)&buf[8] + 24) = v12;
  dispatch_group_enter((dispatch_group_t)self->_clipWriterDispatchGroup);
  clipWriterQueue = self->_clipWriterQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100045EE4;
  v16[3] = &unk_1000860F0;
  int v23 = a3;
  uint64_t v20 = v27;
  uint64_t v21 = buf;
  id v14 = v10;
  id v17 = v14;
  uint64_t v22 = v25;
  id v15 = v11;
  id v18 = v15;
  int v19 = self;
  BOOL v24 = a6;
  [v14 requestMediaDataWhenReadyOnQueue:clipWriterQueue usingBlock:v16];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(buf, 8);
}

- (void)waitForCompletionAndFinishWriting:(id *)a3 withHandler:(id)a4
{
  id v6 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v15 = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]";
    __int16 v16 = 1024;
    int v17 = 212;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  clipWriterDispatchGroup = self->_clipWriterDispatchGroup;
  clipWriterQueue = self->_clipWriterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046568;
  block[3] = &unk_100086118;
  long long v12 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify(clipWriterDispatchGroup, clipWriterQueue, block);
}

- (void)flushClipBuffer
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v6 = "-[RPClipWriter flushClipBuffer]";
    __int16 v7 = 1024;
    int v8 = 231;
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3 = [(RPClipWriter *)self dispatchClipWriterQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046828;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 136446466;
    *(int64_t *)((char *)&buf.value + 4) = (int64_t)"-[RPClipWriter exportClipToURL:duration:completionHandler:]";
    LOWORD(buf.flags) = 1024;
    *(unsigned int *)((char *)&buf.flags + 2) = 240;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&buf, 0x12u);
  }
  long long v39 = *(_OWORD *)&self->_latestCMSamplePresentationTime.value;
  int64_t epoch = self->_latestCMSamplePresentationTime.epoch;
  $95D729B680665BEAEFA1D6FCA8238556 buf = self->_latestCMSamplePresentationTime;
  double Seconds = CMTimeGetSeconds((CMTime *)&buf);
  objc_storeStrong((id *)&self->_outputURL, a3);
  buf.value = 0;
  *(void *)&buf.timescale = &buf;
  buf.int64_t epoch = 0x3032000000;
  v43 = sub_100046E54;
  v44 = sub_100046E64;
  id v45 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100046E54;
  v37 = sub_100046E64;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100046E54;
  v31 = sub_100046E64;
  id v32 = 0;
  long long v12 = [(RPClipWriter *)self dispatchClipWriterQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046E6C;
  block[3] = &unk_100086140;
  block[4] = self;
  void block[5] = &buf;
  block[6] = &v33;
  block[7] = &v27;
  dispatch_sync(v12, block);

  self->_enableMic = [(id)v28[5] getTotalNumberOfSamples] != 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100046EF8;
  v21[3] = &unk_100086168;
  p_$95D729B680665BEAEFA1D6FCA8238556 buf = &buf;
  BOOL v24 = &v33;
  v25 = &v27;
  id v13 = v10;
  id v22 = v13;
  id v14 = objc_retainBlock(v21);
  if ([(RPClipBuffer *)self->_clipBufferVideo getTotalNumberOfSamples])
  {
    [(RPClipWriter *)self setupAssetWriter];
    id v15 = +[AVMutableMetadataItem metadataItem];
    [v15 setKeySpace:AVMetadataKeySpaceQuickTimeMetadata];
    [v15 setKey:AVMetadataQuickTimeMetadataKeyAuthor];
    [v15 setValue:@"ReplayKitRecording"];
    __int16 v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v15, 0);
    [(AVAssetWriter *)self->_assetWriter setMetadata:v16];

    [(AVAssetWriter *)self->_assetWriter startWriting];
    float v17 = Seconds;
    self->_didAppendFirstSample = 0;
    if (self->_videoInput)
    {
      id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:](self, "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:", 0, self->_videoInput, v18, [*(id *)(*(void *)&buf.timescale + 40) getSamplesForDuration:v18 latestSeconds:a4 withOutputArray:v17]);
    }
    if (self->_audioInput1)
    {
      id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:](self, "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:", 1, self->_audioInput1, v19, [(id)v34[5] getSamplesForDuration:v19 latestSeconds:a4 withOutputArray:v17]);
    }
    if (self->_audioInput2)
    {
      id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:](self, "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:", 2, self->_audioInput2, v20, [(id)v28[5] getSamplesForDuration:v20 latestSeconds:a4 withOutputArray:v17]);
    }
    *(_OWORD *)v41 = v39;
    *(void *)&v41[16] = epoch;
    [(RPClipWriter *)self waitForCompletionAndFinishWriting:v41 withHandler:v14];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v41 = 136446466;
      *(void *)&v41[4] = "-[RPClipWriter exportClipToURL:duration:completionHandler:]";
      *(_WORD *)&v41[12] = 1024;
      *(_DWORD *)&v41[14] = 313;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d No video samples found", v41, 0x12u);
    }
    id v15 = +[NSError _rpUserErrorForCode:-5822 userInfo:0];
    ((void (*)(void *, void *))v14[2])(v14, v15);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)dispatchClipWriterQueue
{
  if (qword_100099D90 != -1) {
    dispatch_once(&qword_100099D90, &stru_100086188);
  }
  v2 = (void *)qword_100099D88;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInput2, 0);
  objc_storeStrong((id *)&self->_audioInput1, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_clipWriterQueue, 0);
  objc_storeStrong((id *)&self->_clipWriterDispatchGroup, 0);
  objc_storeStrong((id *)&self->_clipBufferMicAudio, 0);
  objc_storeStrong((id *)&self->_clipBufferAppAudio, 0);

  objc_storeStrong((id *)&self->_clipBufferVideo, 0);
}

@end