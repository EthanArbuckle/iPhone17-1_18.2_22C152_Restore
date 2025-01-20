@interface EARCaesuraSPGHelper
- (EARCaesuraSPGHelper)initWithDelegate:(RDOSDDelegate *)a3;
- (void)addAudio:(signed __int16 *)a3 count:(int)a4;
- (void)clientSilenceFeaturesAvailable:(id)a3;
- (void)createCaesuraSPG;
- (void)endAudio;
@end

@implementation EARCaesuraSPGHelper

- (void)createCaesuraSPG
{
  v3 = (EARCaesuraSilencePosteriorGenerator *)[objc_alloc((Class)EARCaesuraSilencePosteriorGenerator) initWithConfigFile:self->caesuraSPG_config samplingRate:16000 queue:self->caesuraSPGQueue];
  caesuraSPG = self->caesuraSPG;
  self->caesuraSPG = v3;

  v5 = self->caesuraSPG;
  [(EARCaesuraSilencePosteriorGenerator *)v5 setDelegate:self];
}

- (void)endAudio
{
  helperQueue = self->helperQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050054;
  block[3] = &unk_1000F02A8;
  block[4] = self;
  dispatch_sync(helperQueue, block);
}

- (EARCaesuraSPGHelper)initWithDelegate:(RDOSDDelegate *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)EARCaesuraSPGHelper;
  v4 = [(EARCaesuraSPGHelper *)&v15 init];
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_startOfSpeechDetected = 0;
    v4->_numConsecutiveNonSilenceFrames = 0;
    dispatch_queue_t v6 = dispatch_queue_create("EARCaesuraSPGQueue", 0);
    caesuraSPGQueue = v5->caesuraSPGQueue;
    v5->caesuraSPGQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("EARCaesuraSPGHelperQueue", 0);
    helperQueue = v5->helperQueue;
    v5->helperQueue = (OS_dispatch_queue *)v8;

    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 pathForResource:@"hybridendpointer" ofType:@"json" inDirectory:@"models/SpeechEndpointAssets"];
    caesuraSPG_config = v5->caesuraSPG_config;
    v5->caesuraSPG_config = (NSString *)v11;

    fprintf(__stdoutp, "hybridendpointer config path is at %s\n", [(NSString *)v5->caesuraSPG_config UTF8String]);
    [(EARCaesuraSPGHelper *)v5 createCaesuraSPG];
    long long v13 = *(_OWORD *)&a3->ctx;
    v5->_caesuraSPGDelegate.SpeechEnded = a3->SpeechEnded;
    *(_OWORD *)&v5->_caesuraSPGDelegate.ctx = v13;
  }
  return v5;
}

- (void)addAudio:(signed __int16 *)a3 count:(int)a4
{
  helperQueue = self->helperQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050238;
  block[3] = &unk_1000F02D0;
  int v6 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(helperQueue, block);
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4 = a3;
  [v4 silenceProbability];
  double v6 = v5;
  [v4 silenceDurationMs];
  double v8 = v7;

  if (v8 >= 60000.0) {
    [(EARCaesuraSPGHelper *)self endAudio];
  }
  if (!self->_startOfSpeechDetected)
  {
    if (v6 >= 0.6)
    {
      self->_numConsecutiveNonSilenceFrames = 0;
    }
    else
    {
      unint64_t v9 = self->_numConsecutiveNonSilenceFrames + 1;
      self->_numConsecutiveNonSilenceFrames = v9;
      if (v9 >= 0xA)
      {
        *(_WORD *)&self->_startOfSpeechDetected = 1;
        SpeechStarted = (void (*)(void *))self->_caesuraSPGDelegate.SpeechStarted;
        if (SpeechStarted) {
          SpeechStarted(self->_caesuraSPGDelegate.ctx);
        }
      }
    }
  }
  if (!self->_endOfSpeechDetected && v8 >= 0.975 && self->_startOfSpeechDetected)
  {
    *(_WORD *)&self->_startOfSpeechDetected = 256;
    SpeechEnded = (void (*)(void *))self->_caesuraSPGDelegate.SpeechEnded;
    if (SpeechEnded)
    {
      ctx = self->_caesuraSPGDelegate.ctx;
      SpeechEnded(ctx);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->caesuraSPG, 0);
  objc_storeStrong((id *)&self->caesuraSPG_config, 0);
  objc_storeStrong((id *)&self->helperQueue, 0);
  objc_storeStrong((id *)&self->caesuraSPGQueue, 0);
}

@end