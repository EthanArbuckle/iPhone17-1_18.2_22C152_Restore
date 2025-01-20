@interface VSAudioPlaybackService
+ (double)durationOfAudioDataLength:(unint64_t)a3 withAudioDescription:(AudioStreamBasicDescription *)a4;
+ (unint64_t)bytesOfDuration:(double)a3 withAudioDescription:(AudioStreamBasicDescription *)a4;
- (AudioStreamBasicDescription)asbd;
- (BOOL)discontinuedDuringPlayback;
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
- (NSError)error;
- (VSAudioPlaybackService)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4 useAVSBAR:(BOOL)a5;
- (VSAudioPlaybackServiceProtocol)implementation;
- (VSAudioRouteInfo)outputRouteInfo;
- (id)audioPowerProvider;
- (id)start;
- (id)timingObserver;
- (unint64_t)playbackIntervalId;
- (void)didEndAccessPower;
- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5;
- (void)flushAndStop;
- (void)pause;
- (void)setImplementation:(id)a3;
- (void)setPlaybackIntervalId:(unint64_t)a3;
- (void)setTimingObserver:(id)a3;
- (void)stop;
- (void)willBeginAccessPower;
@end

@implementation VSAudioPlaybackService

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timingObserver, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_outputRouteInfo, 0);
}

- (id)timingObserver
{
  return self->_timingObserver;
}

- (void)setPlaybackIntervalId:(unint64_t)a3
{
  self->_playbackIntervalId = a3;
}

- (unint64_t)playbackIntervalId
{
  return self->_playbackIntervalId;
}

- (void)setImplementation:(id)a3
{
}

- (VSAudioPlaybackServiceProtocol)implementation
{
  return self->_implementation;
}

- (VSAudioRouteInfo)outputRouteInfo
{
  return self->_outputRouteInfo;
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  return [(VSAudioPlaybackServiceProtocol *)self->_implementation getAveragePower:a3 andPeakPower:a4];
}

- (void)didEndAccessPower
{
}

- (void)willBeginAccessPower
{
}

- (id)audioPowerProvider
{
  return (id)[(VSAudioPlaybackServiceProtocol *)self->_implementation audioPowerProvider];
}

- (void)setTimingObserver:(id)a3
{
  id v4 = a3;
  [(VSAudioPlaybackServiceProtocol *)self->_implementation removeTimeObserver:self->_timingObserver];
  id timingObserver = self->_timingObserver;
  self->_id timingObserver = v4;
}

- (void)pause
{
}

- (void)stop
{
  [(VSAudioPlaybackServiceProtocol *)self->_implementation stop];
  [(VSAudioPlaybackService *)self setTimingObserver:0];
  v3 = VSGetLogDefault();
  id v4 = v3;
  os_signpost_id_t playbackIntervalId = self->_playbackIntervalId;
  if (playbackIntervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_226CB1000, v4, OS_SIGNPOST_INTERVAL_END, playbackIntervalId, "AudioPlayback", (const char *)&unk_226D0643F, v6, 2u);
  }
}

- (void)flushAndStop
{
  [(VSAudioPlaybackServiceProtocol *)self->_implementation flushAndStop];
  [(VSAudioPlaybackService *)self setTimingObserver:0];
  v3 = VSGetLogDefault();
  id v4 = v3;
  os_signpost_id_t playbackIntervalId = self->_playbackIntervalId;
  if (playbackIntervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_226CB1000, v4, OS_SIGNPOST_INTERVAL_END, playbackIntervalId, "AudioPlayback", (const char *)&unk_226D0643F, v6, 2u);
  }
}

- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
}

- (id)start
{
  v3 = VSGetLogDefault();
  id v4 = v3;
  os_signpost_id_t playbackIntervalId = self->_playbackIntervalId;
  if (playbackIntervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_226CB1000, v4, OS_SIGNPOST_INTERVAL_BEGIN, playbackIntervalId, "AudioPlayback", (const char *)&unk_226D0643F, v8, 2u);
  }

  v6 = [(VSAudioPlaybackServiceProtocol *)self->_implementation start];
  return v6;
}

- (NSError)error
{
  return (NSError *)[(VSAudioPlaybackServiceProtocol *)self->_implementation error];
}

- (BOOL)discontinuedDuringPlayback
{
  return [(VSAudioPlaybackServiceProtocol *)self->_implementation discontinuedDuringPlayback];
}

- (AudioStreamBasicDescription)asbd
{
  result = (AudioStreamBasicDescription *)self->_implementation;
  if (result) {
    return (AudioStreamBasicDescription *)[(AudioStreamBasicDescription *)result asbd];
  }
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  return result;
}

- (VSAudioPlaybackService)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4 useAVSBAR:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)VSAudioPlaybackService;
  v8 = [(VSAudioPlaybackService *)&v36 init];
  if (!v8)
  {
LABEL_22:
    v26 = v8;
    goto LABEL_23;
  }
  if (v5) {
    v9 = VSAudioPlaybackServiceAVSBAR;
  }
  else {
    v9 = VSAudioPlaybackServiceAT;
  }
  id v10 = [v9 alloc];
  long long v11 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  long long v41 = v11;
  uint64_t v42 = *(void *)&a4->mBitsPerChannel;
  uint64_t v12 = [v10 initWithAudioSessionID:v7 asbd:buf];
  implementation = v8->_implementation;
  v8->_implementation = (VSAudioPlaybackServiceProtocol *)v12;

  if (v8->_implementation)
  {
    v14 = VSGetLogDefault();
    v8->_os_signpost_id_t playbackIntervalId = os_signpost_id_generate(v14);

    if (v5)
    {
      v15 = objc_msgSend(MEMORY[0x263EF93E0], "retrieveSessionWithID:", -[VSAudioPlaybackServiceProtocol sessionID](v8->_implementation, "sessionID"));
      v16 = [v15 currentRoute];
      v17 = [MEMORY[0x263EFF980] array];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v18 = objc_msgSend(v16, "outputs", 0);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [*(id *)(*((void *)&v32 + 1) + 8 * v22) portType];
            [v17 addObject:v23];

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v20);
      }

      uint64_t v37 = *MEMORY[0x263F54420];
      v24 = [v17 componentsJoinedByString:@","];
      v38 = v24;
      v25 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    }
    else
    {
      v15 = [MEMORY[0x263F544E0] sharedAVSystemController];
      v25 = [v15 attributeForKey:*MEMORY[0x263F543F8]];
    }

    if (v25)
    {
      v27 = [[VSAudioRouteInfo alloc] initWithRouteAttributes:v25];
      outputRouteInfo = v8->_outputRouteInfo;
      v8->_outputRouteInfo = v27;
    }
    v29 = VSGetLogDefault();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = [(VSAudioRouteInfo *)v8->_outputRouteInfo audioRouteName];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v30;
      _os_log_impl(&dword_226CB1000, v29, OS_LOG_TYPE_INFO, "Current audio output route: %@", buf, 0xCu);
    }
    goto LABEL_22;
  }
  v26 = 0;
LABEL_23:

  return v26;
}

+ (unint64_t)bytesOfDuration:(double)a3 withAudioDescription:(AudioStreamBasicDescription *)a4
{
  Float64 mSampleRate = a4->mSampleRate;
  LODWORD(mSampleRate) = a4->mBytesPerFrame;
  return (unint64_t)(a4->mSampleRate * a3 * (double)*(unint64_t *)&mSampleRate);
}

+ (double)durationOfAudioDataLength:(unint64_t)a3 withAudioDescription:(AudioStreamBasicDescription *)a4
{
  UInt32 mBytesPerFrame = a4->mBytesPerFrame;
  double result = 0.0;
  if (mBytesPerFrame)
  {
    if (a4->mSampleRate != 0.0) {
      return (double)a3 / (a4->mSampleRate * (double)mBytesPerFrame);
    }
  }
  return result;
}

@end