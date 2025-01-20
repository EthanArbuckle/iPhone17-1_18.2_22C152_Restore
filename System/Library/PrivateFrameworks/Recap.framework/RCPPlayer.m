@interface RCPPlayer
+ (id)sharedPlayer;
+ (void)playEventStream:(id)a3 withOptions:(id)a4;
+ (void)tearDown;
- (BOOL)prewarmForEventStream:(id)a3 withError:(id *)a4;
- (BOOL)stompSenderForSimulatorPlayback;
- (RCPAnalyticsEventSender)analyticsEventSender;
- (RCPEventDeliveryServicePool)deliveryServicePool;
- (RCPEventEnvironment)environment;
- (RCPPlayer)init;
- (RCPPlayer)initWithDeliveryServicePool:(id)a3 environment:(id)a4 analyticsEventSender:(id)a5;
- (RCPPlayerPlaybackOptions)playbackOptions;
- (__IOHIDEvent)_cloneAndTransformHIDEvent:(id)a3 machTimeOffset:(int64_t)a4 transform:(CGAffineTransform *)a5;
- (void)_sendEvent:(id)a3 machTimeOffset:(int64_t)a4 transform:(CGAffineTransform *)a5;
- (void)_sendEvent:(id)a3 withService:(id)a4 machTimeOffset:(int64_t)a5 transform:(CGAffineTransform *)a6;
- (void)playEventStream:(id)a3 withOptions:(id)a4;
- (void)setDeliveryServicePool:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPlaybackOptions:(id)a3;
- (void)setStompSenderForSimulatorPlayback:(BOOL)a3;
- (void)tearDown;
@end

@implementation RCPPlayer

- (void)tearDown
{
}

- (void)playEventStream:(id)a3 withOptions:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(RCPPlayer *)self environment];
  [v7 playbackSpeedFactor];
  double v10 = v9;
  v11 = [v6 environment];
  [v8 speedFactorToAdjustRecordingEnvironment:v11];
  [v7 setPlaybackSpeedFactor:v10 * v12];

  v55 = self;
  p_playbackOptions = &self->_playbackOptions;
  objc_storeStrong((id *)&self->_playbackOptions, a4);
  v52 = v8;
  if ([v8 isSimulator]
    && (v13 = objc_opt_class(), (objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class(), v8) & 1) == 0))
  {
    v14 = [v6 environment];
    if ([v14 isSimulator])
    {
      v15 = [v6 environment];
      self->_stompSenderForSimulatorPlayback = v15 == v8;
    }
    else
    {
      self->_stompSenderForSimulatorPlayback = 1;
    }
  }
  else
  {
    self->_stompSenderForSimulatorPlayback = 0;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  [v7 playbackSpeedFactor];
  double v19 = v18;
  v20 = [v6 events];
  uint64_t v21 = mach_absolute_time();
  [v7 minDelayBetweenSends];
  double v23 = v22;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v69 = 0u;
  if (v7) {
    [v7 transform];
  }
  v58 = v7;
  v54 = v6;
  if ([(RCPPlayerPlaybackOptions *)*p_playbackOptions linkEventDeliveryToDisplayRefreshRate])
  {
    +[RCPPlayerDisplayLinkWaiter wait];
    v24 = [v20 firstObject];
    *(_OWORD *)buf = v69;
    *(_OWORD *)&buf[16] = v70;
    long long v76 = v71;
    [(RCPPlayer *)v55 _sendEvent:v24 machTimeOffset:0 transform:buf];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v25 = v20;
  uint64_t v59 = [v25 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v59)
  {
    uint64_t v26 = 0;
    double v27 = (double)(numer / denom);
    double v28 = 1.0 / v19;
    unint64_t v29 = (unint64_t)(v23 * 1000000000.0);
    uint64_t v56 = *(void *)v66;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v66 != v56) {
          objc_enumerationMutation(v25);
        }
        v31 = *(void **)(*((void *)&v65 + 1) + 8 * v30);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v32 = [v31 preActions];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v62 != v35) {
                objc_enumerationMutation(v32);
              }
              [*(id *)(*((void *)&v61 + 1) + 8 * i) play];
              uint64_t v37 = mach_absolute_time();
            }
            uint64_t v21 = v37;
            uint64_t v34 = [v32 countByEnumeratingWithState:&v61 objects:v73 count:16];
          }
          while (v34);
        }

        v38 = [v25 firstObject];
        unint64_t v39 = (unint64_t)(v28 * (double)(unint64_t)[v58 timestampForEventReplay:v38]);

        uint64_t v40 = v21 - v39;
        unint64_t v41 = v21
            - v39
            + (unint64_t)(v28 * (double)(unint64_t)[v58 timestampForEventReplay:v31]);
        unint64_t v42 = (unint64_t)(v27 * (double)mach_absolute_time());
        unint64_t v43 = v42 + v29;
        if (v42 + v29 <= (unint64_t)((double)v41 * v27 + -1000000.0)) {
          unint64_t v43 = (unint64_t)((double)v41 * v27 + -1000000.0);
        }
        if (!v29) {
          unint64_t v43 = (unint64_t)((double)v41 * v27 + -1000000.0);
        }
        unint64_t v44 = v43 - v42;
        if (v43 > v42)
        {
          __rqtp.tv_sec = v44 / 0x3B9ACA00;
          __rqtp.tv_nsec = v44 % 0x3B9ACA00;
          nanosleep(&__rqtp, 0);
          v45 = RCPLogPlayback();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            double v46 = RCPTimeIntervalFromMachTimestamp((unint64_t)((double)v44 / v27));
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v46;
            _os_log_impl(&dword_1A9051000, v45, OS_LOG_TYPE_INFO, " - %4ld delayed by %0.9fs -\n", buf, 0x16u);
          }
        }
        uint64_t v47 = mach_absolute_time();
        double v48 = RCPTimeIntervalFromMachTimestamp(v47);
        double v49 = RCPTimeIntervalFromMachTimestamp(v41);
        v50 = RCPLogPlayback();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v48 - v49;
          _os_log_debug_impl(&dword_1A9051000, v50, OS_LOG_TYPE_DEBUG, "  - %4ld delivery - difference %0.9fs -\n", buf, 0x16u);
        }

        if (![(RCPPlayerPlaybackOptions *)*p_playbackOptions linkEventDeliveryToDisplayRefreshRate]|| v26)
        {
          *(_OWORD *)buf = v69;
          *(_OWORD *)&buf[16] = v70;
          long long v76 = v71;
          [(RCPPlayer *)v55 _sendEvent:v31 machTimeOffset:v40 transform:buf];
        }
        ++v26;
        ++v30;
      }
      while (v30 != v59);
      uint64_t v59 = [v25 countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v59);
  }

  v51 = [(RCPPlayer *)v55 analyticsEventSender];
  [v51 sendEvent:1];
}

- (__IOHIDEvent)_cloneAndTransformHIDEvent:(id)a3 machTimeOffset:(int64_t)a4 transform:(CGAffineTransform *)a5
{
  if (![a3 hidEvent]) {
    return 0;
  }
  Copy = (__IOHIDEvent *)IOHIDEventCreateCopy();
  IOHIDEventGetTimeStamp();
  [(RCPPlayerPlaybackOptions *)self->_playbackOptions playbackSpeedFactor];
  mach_absolute_time();
  IOHIDEventSetTimeStamp();
  long long v8 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v11.c = v8;
  *(_OWORD *)&v11.tx = *(_OWORD *)&a5->tx;
  if (!CGAffineTransformIsIdentity(&v11))
  {
    long long v9 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v11.c = v9;
    *(_OWORD *)&v11.tx = *(_OWORD *)&a5->tx;
    RCPHIDEventTransformLocation((uint64_t)Copy, (long long *)&v11);
  }
  return Copy;
}

- (BOOL)prewarmForEventStream:(id)a3 withError:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    deliveryServicePool = self->_deliveryServicePool;
    id v19 = 0;
    [(RCPEventDeliveryServicePool *)deliveryServicePool prewarmForSenderProperties:0 withError:&v19];
    id v11 = v19;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  [v6 events];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v22;
LABEL_4:
    uint64_t v13 = 0;
    v14 = v11;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v8);
      }
      v15 = self->_deliveryServicePool;
      v16 = [*(id *)(*((void *)&v21 + 1) + 8 * v13) senderProperties];
      id v20 = v14;
      [(RCPEventDeliveryServicePool *)v15 prewarmForSenderProperties:v16 withError:&v20];
      id v11 = v20;

      if (a4)
      {
        if (v11) {
          break;
        }
      }
      ++v13;
      v14 = v11;
      if (v10 == v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  if (a4)
  {
LABEL_16:
    if (v11) {
      *a4 = v11;
    }
  }
LABEL_18:

  return v11 == 0;
}

- (void)_sendEvent:(id)a3 machTimeOffset:(int64_t)a4 transform:(CGAffineTransform *)a5
{
  deliveryServicePool = self->_deliveryServicePool;
  id v9 = a3;
  uint64_t v10 = [v9 senderProperties];
  id v11 = [(RCPEventDeliveryServicePool *)deliveryServicePool deliveryServiceForSenderProperties:v10];
  long long v12 = *(_OWORD *)&a5->c;
  v13[0] = *(_OWORD *)&a5->a;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a5->tx;
  [(RCPPlayer *)self _sendEvent:v9 withService:v11 machTimeOffset:a4 transform:v13];
}

- (void)_sendEvent:(id)a3 withService:(id)a4 machTimeOffset:(int64_t)a5 transform:(CGAffineTransform *)a6
{
  id v10 = a4;
  long long v11 = *(_OWORD *)&a6->c;
  v16[0] = *(_OWORD *)&a6->a;
  v16[1] = v11;
  v16[2] = *(_OWORD *)&a6->tx;
  long long v12 = [(RCPPlayer *)self _cloneAndTransformHIDEvent:a3 machTimeOffset:a5 transform:v16];
  uint64_t v13 = [(RCPPlayerPlaybackOptions *)self->_playbackOptions customizeHIDEvent];

  if (v13)
  {
    v14 = [(RCPPlayerPlaybackOptions *)self->_playbackOptions customizeHIDEvent];
    ((void (**)(void, __IOHIDEvent *))v14)[2](v14, v12);
  }
  if (v12)
  {
    v15 = RCPLogPlayback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[RCPPlayer _sendEvent:withService:machTimeOffset:transform:](v12, v15);
    }

    [v10 postHIDEvent:v12];
    CFRelease(v12);
  }
}

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (RCPAnalyticsEventSender)analyticsEventSender
{
  return self->_analyticsEventSender;
}

+ (id)sharedPlayer
{
  if (sharedPlayer_onceToken != -1) {
    dispatch_once(&sharedPlayer_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedPlayer__sharedPlayer;
  return v2;
}

uint64_t __25__RCPPlayer_sharedPlayer__block_invoke()
{
  sharedPlayer__sharedPlayer = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (void)playEventStream:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = RCPLogPlayback();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9051000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0x1F5uLL, "RecapPlayEventStream", (const char *)&unk_1A9078059, buf, 2u);
  }

  id v9 = [a1 sharedPlayer];
  [v9 prewarmForEventStream:v7 withError:0];

  id v10 = [a1 sharedPlayer];
  [v10 playEventStream:v7 withOptions:v6];

  long long v11 = [a1 sharedPlayer];
  [v11 tearDown];

  long long v12 = RCPLogPlayback();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9051000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0x1F5uLL, "RecapPlayEventStream", (const char *)&unk_1A9078059, v13, 2u);
  }
}

+ (void)tearDown
{
  id v2 = [a1 sharedPlayer];
  [v2 tearDown];
}

- (RCPPlayer)init
{
  v3 = objc_alloc_init(RCPEventDeliveryServicePool);
  v4 = +[RCPEventEnvironment currentEnvironment];
  v5 = objc_alloc_init(RCPCoreAnalyticsBackedAnalyticsEventSender);
  id v6 = [(RCPPlayer *)self initWithDeliveryServicePool:v3 environment:v4 analyticsEventSender:v5];

  return v6;
}

- (RCPPlayer)initWithDeliveryServicePool:(id)a3 environment:(id)a4 analyticsEventSender:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCPPlayer;
  long long v12 = [(RCPPlayer *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deliveryServicePool, a3);
    objc_storeStrong((id *)&v13->_environment, a4);
    objc_storeStrong((id *)&v13->_analyticsEventSender, a5);
  }

  return v13;
}

- (void)setEnvironment:(id)a3
{
}

- (RCPPlayerPlaybackOptions)playbackOptions
{
  return self->_playbackOptions;
}

- (void)setPlaybackOptions:(id)a3
{
}

- (BOOL)stompSenderForSimulatorPlayback
{
  return self->_stompSenderForSimulatorPlayback;
}

- (void)setStompSenderForSimulatorPlayback:(BOOL)a3
{
  self->_stompSenderForSimulatorPlayback = a3;
}

- (RCPEventDeliveryServicePool)deliveryServicePool
{
  return self->_deliveryServicePool;
}

- (void)setDeliveryServicePool:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSender, 0);
  objc_storeStrong((id *)&self->_deliveryServicePool, 0);
  objc_storeStrong((id *)&self->_playbackOptions, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)_sendEvent:(const void *)a1 withService:(NSObject *)a2 machTimeOffset:transform:.cold.1(const void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)CFCopyDescription(a1);
  int v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1A9051000, a2, OS_LOG_TYPE_DEBUG, "send event %{public}@", (uint8_t *)&v4, 0xCu);
}

@end