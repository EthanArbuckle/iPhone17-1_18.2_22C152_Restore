@interface RPAppAudioCaptureManager
+ ($C9ED33C4FD2E7C77AE94B0FA51C6668E)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5;
+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3;
- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4;
- (RPAppAudioCaptureManager)init;
- (id)newAudioTapForAudioCaptureConfig:(id)a3;
- (void)resumeWithConfig:(id)a3;
- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5;
- (void)stop;
@end

@implementation RPAppAudioCaptureManager

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3
{
  retstr->mSampleRate = 44100.0;
  *(void *)&retstr->mFormatID = 0xE6C70636DLL;
  if (a4) {
    UInt32 v4 = 4;
  }
  else {
    UInt32 v4 = 2;
  }
  if (a4) {
    UInt32 v5 = 2;
  }
  else {
    UInt32 v5 = 1;
  }
  retstr->mBytesPerFrame = v4;
  retstr->mChannelsPerFrame = v5;
  retstr->mBytesPerPacket = v4;
  retstr->mFramesPerPacket = 1;
  *(void *)&retstr->mBitsPerChannel = 16;
  return result;
}

- (RPAppAudioCaptureManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)RPAppAudioCaptureManager;
  v2 = [(RPAppAudioCaptureManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ReplayKit.AppAudioCaptureQueue", 0);
    UInt32 v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    UInt32 v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = 0;

    +[RPAppAudioCaptureManager audioStreamBasicDescriptionWithStereo:1];
    *(_OWORD *)(v2 + 56) = v7;
    *(_OWORD *)(v2 + 72) = v8;
    *((void *)v2 + 11) = v9;
  }
  return (RPAppAudioCaptureManager *)v2;
}

- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4
{
  UInt32 v5 = (void (**)(id, void *))a4;
  if (a3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100053C80();
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if (v5)
    {
LABEL_5:
      v6 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
      v5[2](v5, v6);
    }
  }
LABEL_6:

  return a3 != 0;
}

- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5
{
  id var2 = a3.var2;
  uint64_t v7 = *(void *)&a3.var0;
  id v9 = a4;
  id v10 = a5;
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = sub_10003A5CC;
  block[3] = &unk_100085EC8;
  block[4] = self;
  id v16 = v9;
  id v17 = v10;
  uint64_t v18 = v7;
  id v19 = var2;
  id v12 = var2;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(audioDispatchQueue, block);
}

- (void)resumeWithConfig:(id)a3
{
  self->_resumed = 1;
  -[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:](self, "startWithConfig:outputHandler:didStartHandler:", *(void *)&a3.var0, a3.var2, self->_appAudioOutputHandler, &stru_100085EF8);
}

- (void)stop
{
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B0A0;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(audioDispatchQueue, block);
}

+ ($C9ED33C4FD2E7C77AE94B0FA51C6668E)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5
{
  uint64_t v5 = *(void *)&a4 << 32;
  v6 = 0;
  result.id var2 = v6;
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  return result;
}

- (id)newAudioTapForAudioCaptureConfig:(id)a3
{
  id var2 = a3.var2;
  unint64_t v4 = *(void *)&a3.var0;
  id v5 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:&self->_audioBasicDescription];
  if (!v5)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054050();
    }
    goto LABEL_15;
  }
  if (v4 == 2)
  {
    id v6 = [objc_alloc((Class)ATAudioTapDescription) initScreenSharingTapWithFormat:v5];
  }
  else if (v4 == 1)
  {
    if (!var2)
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000541DC();
      }
      goto LABEL_15;
    }
    id v6 = [objc_alloc((Class)ATAudioTapDescription) initPreSpatialSceneIdentifierTapWithFormat:v5 sceneIdentifier:var2];
  }
  else
  {
    if (v4)
    {
LABEL_12:
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000540D4();
      }
LABEL_15:
      uint64_t v7 = 0;
LABEL_16:
      id v10 = 0;
      goto LABEL_17;
    }
    id v6 = [objc_alloc((Class)ATAudioTapDescription) initProcessTapWithFormat:v5 PID:HIDWORD(v4)];
  }
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  id v8 = [objc_alloc((Class)ATAudioTap) initWithTapDescription:v6];
  id v9 = v8;
  if (!v8)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054158();
    }
    goto LABEL_16;
  }
  [v8 setScreenSharingHost:1];
  id v10 = v9;
LABEL_17:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong(&self->_appTapDidStartHandler, 0);
  objc_storeStrong(&self->_appAudioOutputHandler, 0);

  objc_storeStrong((id *)&self->_audioDispatchQueue, 0);
}

@end