@interface VTAudioFileLog
+ (id)sharedInstance;
- (VTAudioFileLog)init;
- (void)_closeAudioFile;
- (void)appendAudioData:(AudioBuffer)a3;
- (void)dealloc;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation VTAudioFileLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)stopRecording
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__VTAudioFileLog_stopRecording__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __31__VTAudioFileLog_stopRecording__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 64);
    LODWORD(v3) = *(_DWORD *)(v3 + 72);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 1026;
    int v9 = v3;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "Closing file at URL %{public}@, audio size: %{public}u", (uint8_t *)&v6, 0x12u);
  }
  return [*(id *)(a1 + 32) _closeAudioFile];
}

- (void)appendAudioData:(AudioBuffer)a3
{
  mData = a3.mData;
  uint64_t mDataByteSize = a3.mDataByteSize;
  int v6 = (void *)MEMORY[0x21D46B7E0](self, a2);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:mData length:mDataByteSize];
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__VTAudioFileLog_appendAudioData___block_invoke;
  v10[3] = &unk_264325FF0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

void __34__VTAudioFileLog_appendAudioData___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    unsigned int v2 = [*(id *)(a1 + 40) length];
    uint64_t v3 = *(void **)(a1 + 40);
    unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
    v10.mBuffers[0].mNumberChannels = 1;
    UInt32 v5 = v2 / v4;
    v10.mBuffers[0].uint64_t mDataByteSize = objc_msgSend(v3, "length", 1, *(void *)&v10.mBuffers[0].mNumberChannels);
    v10.mBuffers[0].mData = (void *)[*(id *)(a1 + 40) bytes];
    OSStatus v6 = ExtAudioFileWrite(*(ExtAudioFileRef *)(*(void *)(a1 + 32) + 16), v5, &v10);
    if (v6)
    {
      OSStatus v7 = v6;
      __int16 v8 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        OSStatus v12 = v7;
        _os_log_error_impl(&dword_21844F000, v8, OS_LOG_TYPE_ERROR, "Failed writing audio file %{public}d", buf, 8u);
      }
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 72) += [*(id *)(a1 + 40) length];
  }
  else
  {
    id v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10.mNumberBuffers) = 0;
      _os_log_error_impl(&dword_21844F000, v9, OS_LOG_TYPE_ERROR, "No audio file to append data", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)startRecording
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__VTAudioFileLog_startRecording__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __32__VTAudioFileLog_startRecording__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unsigned int v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    uint64_t v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_21844F000, v3, OS_LOG_TYPE_ERROR, "Audio file already configured, closing first", (uint8_t *)&v21, 2u);
      unsigned int v2 = *(void **)(a1 + 32);
    }
    [v2 _closeAudioFile];
  }
  unsigned int v4 = VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_26C99F218, @"-activation.wav");
  uint64_t v5 = [NSURL fileURLWithPath:v4 isDirectory:0];
  uint64_t v6 = *(void *)(a1 + 32);
  OSStatus v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  __int16 v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 64);
    int v21 = 138543362;
    uint64_t v22 = v9;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Creating audio file at URL %{public}@", (uint8_t *)&v21, 0xCu);
  }
  OSStatus v10 = ExtAudioFileCreateWithURL(*(CFURLRef *)(*(void *)(a1 + 32) + 64), 0x57415645u, (const AudioStreamBasicDescription *)(*(void *)(a1 + 32) + 24), 0, 1u, (ExtAudioFileRef *)(*(void *)(a1 + 32) + 16));
  if (v10)
  {
    OSStatus v11 = v10;
    uint64_t v12 = VTLogContextFacilityVoiceTrigger;
    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 64);
    int v21 = 138543618;
    uint64_t v22 = v13;
    __int16 v23 = 1026;
    OSStatus v24 = v11;
    v14 = "Failed creating audio file at url %{public}@ %{public}d";
    v15 = v12;
    uint32_t v16 = 18;
    goto LABEL_16;
  }
  OSStatus v17 = ExtAudioFileSetProperty(*(ExtAudioFileRef *)(*(void *)(a1 + 32) + 16), 0x63666D74u, 0x28u, (const void *)(*(void *)(a1 + 32) + 24));
  if (!v17) {
    goto LABEL_14;
  }
  OSStatus v18 = v17;
  uint64_t v19 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    int v21 = 67240192;
    LODWORD(v22) = v18;
    v14 = "Error setting input format %{public}d";
    v15 = v19;
    uint32_t v16 = 8;
LABEL_16:
    _os_log_error_impl(&dword_21844F000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v21, v16);
  }
LABEL_12:
  v20 = *(void **)(a1 + 32);
  if (v20[2]) {
    [v20 _closeAudioFile];
  }
LABEL_14:
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = 0;
}

- (void)_closeAudioFile
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  audioFile = self->_audioFile;
  if (audioFile)
  {
    OSStatus v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      OSStatus v5 = v4;
      uint64_t v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67240192;
        v7[1] = v5;
        _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "Failure disposing audio file %{public}d", (uint8_t *)v7, 8u);
      }
    }
    self->_audioFile = 0;
  }
}

- (void)dealloc
{
  [(VTAudioFileLog *)self _closeAudioFile];
  v3.receiver = self;
  v3.super_class = (Class)VTAudioFileLog;
  [(VTAudioFileLog *)&v3 dealloc];
}

- (VTAudioFileLog)init
{
  v11.receiver = self;
  v11.super_class = (Class)VTAudioFileLog;
  id v2 = [(VTAudioFileLog *)&v11 init];
  if (v2)
  {
    objc_super v3 = +[VTPreferences sharedPreferences];
    int v4 = [v3 fileLoggingIsEnabled];

    if (!v4)
    {
      uint64_t v9 = 0;
      goto LABEL_6;
    }
    dispatch_queue_t v5 = dispatch_queue_create("VTAudioFileLogQueue", 0);
    uint64_t v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    OSStatus v7 = *((void *)v2 + 1);
    uint64_t v8 = dispatch_get_global_queue(17, 0);
    dispatch_set_target_queue(v7, v8);

    *((void *)v2 + 3) = 0x40CF400000000000;
    *((_OWORD *)v2 + 2) = xmmword_21852DDF0;
    *((_OWORD *)v2 + 3) = xmmword_21852DE00;
  }
  uint64_t v9 = (VTAudioFileLog *)v2;
LABEL_6:

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5245 != -1) {
    dispatch_once(&sharedInstance_onceToken_5245, &__block_literal_global_5246);
  }
  id v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

uint64_t __32__VTAudioFileLog_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = objc_alloc_init(VTAudioFileLog);

  return MEMORY[0x270F9A758]();
}

@end