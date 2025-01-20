@interface PAStimulus
+ (id)louderSinStimulus;
+ (id)musicStimulus;
+ (id)sinStimulus;
- (AVAudioEngine)engine;
- (AVAudioFile)audioFile;
- (AVAudioPCMBuffer)audioPCMBuffer;
- (AVAudioPlayerNode)audioPlayerNode;
- (AXDispatchTimer)timer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaying;
- (NSURL)filePath;
- (PAStimulus)initWithFile:(id)a3;
- (double)levelMultiplier;
- (double)rampStep;
- (void)audioSessionWasInterrupted:(id)a3;
- (void)calculateFFTForBuffer:(id)a3;
- (void)play;
- (void)rampVolumeUp:(BOOL)a3;
- (void)registerListener:(id)a3 forBucketCount:(unint64_t)a4;
- (void)setAudioFile:(id)a3;
- (void)setAudioPCMBuffer:(id)a3;
- (void)setAudioPlayerNode:(id)a3;
- (void)setEngine:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setLevelMultiplier:(double)a3;
- (void)setRampStep:(double)a3;
- (void)setTimer:(id)a3;
- (void)stop;
- (void)unregisterListener;
@end

@implementation PAStimulus

+ (id)sinStimulus
{
  if (sinStimulus_onceToken != -1) {
    dispatch_once(&sinStimulus_onceToken, &__block_literal_global);
  }
  v2 = (void *)sinStimulus_SIN;
  return v2;
}

void __25__PAStimulus_sinStimulus__block_invoke()
{
  v0 = paBundle();
  id v5 = [v0 pathForResource:@"Enrollment_1" ofType:@"mp3"];

  v1 = [PAStimulus alloc];
  v2 = [NSURL fileURLWithPath:v5];
  uint64_t v3 = [(PAStimulus *)v1 initWithFile:v2];
  v4 = (void *)sinStimulus_SIN;
  sinStimulus_SIN = v3;

  [(id)sinStimulus_SIN setLevelMultiplier:10.0];
}

+ (id)louderSinStimulus
{
  if (louderSinStimulus_onceToken != -1) {
    dispatch_once(&louderSinStimulus_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)louderSinStimulus_SIN;
  return v2;
}

void __31__PAStimulus_louderSinStimulus__block_invoke()
{
  v0 = paBundle();
  id v5 = [v0 pathForResource:@"Enrollment_1+15dB" ofType:@"mp3"];

  v1 = [PAStimulus alloc];
  v2 = [NSURL fileURLWithPath:v5];
  uint64_t v3 = [(PAStimulus *)v1 initWithFile:v2];
  v4 = (void *)louderSinStimulus_SIN;
  louderSinStimulus_SIN = v3;

  [(id)louderSinStimulus_SIN setLevelMultiplier:10.0];
}

+ (id)musicStimulus
{
  if (musicStimulus_onceToken != -1) {
    dispatch_once(&musicStimulus_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)musicStimulus_MUSIC;
  return v2;
}

void __27__PAStimulus_musicStimulus__block_invoke()
{
  v0 = paBundle();
  id v5 = [v0 pathForResource:@"Enrollment_2" ofType:@"caf"];

  v1 = [PAStimulus alloc];
  v2 = [NSURL fileURLWithPath:v5];
  uint64_t v3 = [(PAStimulus *)v1 initWithFile:v2];
  v4 = (void *)musicStimulus_MUSIC;
  musicStimulus_MUSIC = v3;

  [(id)musicStimulus_MUSIC setRampStep:0.3];
}

- (PAStimulus)initWithFile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAStimulus;
  id v5 = [(PAStimulus *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(PAStimulus *)v5 setFilePath:v4];
    v7 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x263F21398]);
    timer = v6->_timer;
    v6->_timer = v7;

    *(_OWORD *)&v6->_levelMultiplier = xmmword_20CD58850;
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel_audioSessionWasInterrupted_ name:*MEMORY[0x263EF90A0] object:0];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 filePath];
    v6 = [(PAStimulus *)self filePath];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)audioSessionWasInterrupted:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 valueForKey:*MEMORY[0x263EF90C8]];
  int v6 = [v5 intValue];

  if (v6 == 1)
  {
    [(PAStimulus *)self stop];
  }
}

- (void)calculateFFTForBuffer:(id)a3
{
  id v4 = a3;
  [(PAStimulus *)self levelMultiplier];
  id v5 = objc_msgSend(v4, "magnitudesWithLevelMultiplier:count:", self->_bucketCount);

  char v7 = (void *)[v5 mutableCopy];
  if ((unint64_t)[v7 count] >= 3) {
    objc_msgSend(v7, "removeObjectsInRange:", 0, 2);
  }
  stimulusMagnitudesCallback = (void (**)(id, void *))self->_stimulusMagnitudesCallback;
  if (stimulusMagnitudesCallback) {
    stimulusMagnitudesCallback[2](stimulusMagnitudesCallback, v7);
  }
  MEMORY[0x270F9A758]();
}

- (void)play
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20CD3E000, a2, OS_LOG_TYPE_ERROR, "Error starting PAStimulus: %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)isPlaying
{
  uint64_t v3 = [(PAStimulus *)self audioPlayerNode];
  if ([v3 isPlaying]) {
    BOOL v4 = !self->_ramping;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)rampVolumeUp:(BOOL)a3
{
  timer = self->_timer;
  double rampStep = self->_rampStep;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x263EF8330];
  v5[2] = __27__PAStimulus_rampVolumeUp___block_invoke;
  v5[3] = &unk_2641030D0;
  if (!a3) {
    double rampStep = rampStep * 0.5;
  }
  v5[4] = self;
  BOOL v6 = a3;
  [(AXDispatchTimer *)timer afterDelay:v5 processBlock:rampStep];
}

void __27__PAStimulus_rampVolumeUp___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) audioPlayerNode];
  [v2 volume];
  double v4 = v3;

  double v5 = dbl_20CD58860[*(unsigned char *)(a1 + 40) == 0] + v4;
  BOOL v6 = [*(id *)(a1 + 32) audioPlayerNode];
  *(float *)&double v7 = v5;
  [v6 setVolume:v7];

  int v8 = *(unsigned __int8 *)(a1 + 40);
  BOOL v9 = v5 >= 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    BOOL v9 = v5 <= 0.0;
  }
  v10 = *(unsigned char **)(a1 + 32);
  if (v9)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      v10[24] = 0;
    }
    else
    {
      [v10 unregisterListener];
      objc_super v11 = [*(id *)(a1 + 32) audioPlayerNode];
      [v11 stop];

      id v12 = [*(id *)(a1 + 32) engine];
      [v12 stop];
    }
  }
  else
  {
    [v10 rampVolumeUp:v8 != 0];
  }
}

- (void)stop
{
  [(AXDispatchTimer *)self->_timer cancel];
  [(PAStimulus *)self rampVolumeUp:0];
}

- (void)registerListener:(id)a3 forBucketCount:(unint64_t)a4
{
  id v6 = a3;
  double v7 = (void *)[v6 copy];
  id stimulusMagnitudesCallback = self->_stimulusMagnitudesCallback;
  self->_id stimulusMagnitudesCallback = v7;

  self->_bucketCount = a4 + 2;
  objc_initWeak(&location, self);
  BOOL v9 = [(PAStimulus *)self engine];
  v10 = [v9 mainMixerNode];
  [v10 removeTapOnBus:0];

  objc_super v11 = [(PAStimulus *)self engine];
  id v12 = [v11 mainMixerNode];
  v13 = [(PAStimulus *)self engine];
  v14 = [v13 mainMixerNode];
  v15 = [v14 outputFormatForBus:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__PAStimulus_registerListener_forBucketCount___block_invoke;
  v16[3] = &unk_2641030F8;
  objc_copyWeak(&v17, &location);
  [v12 installTapOnBus:0 bufferSize:1024 format:v15 block:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __46__PAStimulus_registerListener_forBucketCount___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained calculateFFTForBuffer:v3];
}

- (void)unregisterListener
{
  id v3 = [(PAStimulus *)self engine];
  int v2 = [v3 mainMixerNode];
  [v2 removeTapOnBus:0];
}

- (AVAudioEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (AVAudioPlayerNode)audioPlayerNode
{
  return self->_audioPlayerNode;
}

- (void)setAudioPlayerNode:(id)a3
{
}

- (AVAudioFile)audioFile
{
  return self->_audioFile;
}

- (void)setAudioFile:(id)a3
{
}

- (AVAudioPCMBuffer)audioPCMBuffer
{
  return self->_audioPCMBuffer;
}

- (void)setAudioPCMBuffer:(id)a3
{
}

- (AXDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (double)levelMultiplier
{
  return self->_levelMultiplier;
}

- (void)setLevelMultiplier:(double)a3
{
  self->_levelMultiplier = a3;
}

- (double)rampStep
{
  return self->_rampStep;
}

- (void)setRampStep:(double)a3
{
  self->_double rampStep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_audioPCMBuffer, 0);
  objc_storeStrong((id *)&self->_audioFile, 0);
  objc_storeStrong((id *)&self->_audioPlayerNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong(&self->_stimulusMagnitudesCallback, 0);
}

@end