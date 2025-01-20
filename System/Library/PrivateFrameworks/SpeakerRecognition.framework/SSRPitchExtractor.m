@interface SSRPitchExtractor
- (EARAudioResultsGenerator)resultsGenerator;
- (OS_dispatch_queue)queue;
- (SSRPitchExtractor)initWithAsset:(id)a3;
- (float)_getVoicingProbFromRawData:(float)a3;
- (float)_getVoicingWeightedPitchForResultMatrix:(id)a3;
- (float)getPitchForUtteranceAudioFiles:(id)a3;
- (void)_processAudioFileURL:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResultsGenerator:(id)a3;
@end

@implementation SSRPitchExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_resultsGenerator, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setResultsGenerator:(id)a3
{
}

- (EARAudioResultsGenerator)resultsGenerator
{
  return self->_resultsGenerator;
}

- (float)_getVoicingProbFromRawData:(float)a3
{
  float v3 = a3 * 0.5 + 1.0;
  float v4 = 1.0001 - powf(v3, 6.6667);
  float v5 = fabsf(v4);
  double v6 = expf((float)(v5 + -1.0) * 7.5) * 5.4 + -5.2 + v5 * 4.8;
  float v7 = expf(v5 * -10.0);
  float v8 = v6 - (float)(v7 + v7) + expf((float)(v5 + -1.0) * 20.0) * 4.2;
  return 1.0 / (float)(expf(-v8) + 1.0);
}

- (float)_getVoicingWeightedPitchForResultMatrix:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 audioResultMat];
  uint64_t v6 = [v5 bytes];

  if (v6)
  {
    if ([v4 audioResultsNumVectors])
    {
      unint64_t v7 = 0;
      float v8 = 0.0;
      float v9 = 0.0;
      do
      {
        LODWORD(v10) = *(_DWORD *)(v6 + 4 * [v4 audioResultsVectorSize] * v7 + 92);
        [(SSRPitchExtractor *)self _getVoicingProbFromRawData:v10];
        float v12 = v11;
        LODWORD(v13) = *(_DWORD *)(v6 + 4 * [v4 audioResultsVectorSize] * v7 + 96);
        [(SSRPitchExtractor *)self _getPitchHzFromRawData:v13];
        float v8 = v8 + (float)(v12 * v14);
        float v9 = v9 + v12;
        ++v7;
        [v4 audioResultsVectorSize];
      }
      while (v7 < [v4 audioResultsNumVectors]);
    }
    else
    {
      float v9 = 0.0;
      float v8 = 0.0;
    }
    float v17 = 1.0;
    if (v9 > 0.000001) {
      float v17 = v9;
    }
    float v16 = v8 / v17;
  }
  else
  {
    v15 = *MEMORY[0x263F38100];
    float v16 = -10000.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      v20 = "-[SSRPitchExtractor _getVoicingWeightedPitchForResultMatrix:]";
      _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Got unexpected empty result matrix!!", (uint8_t *)&v19, 0xCu);
    }
  }

  return v16;
}

- (float)getPitchForUtteranceAudioFiles:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    float v9 = (os_log_t *)MEMORY[0x263F38100];
    float v10 = 0.0;
    *(void *)&long long v6 = 136315394;
    long long v18 = v6;
    float v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        float v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v24 = "-[SSRPitchExtractor getPitchForUtteranceAudioFiles:]";
          __int16 v25 = 2112;
          uint64_t v26 = v13;
          _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Starting to extract pitch from URL: %@", buf, 0x16u);
        }
        -[SSRPitchExtractor _processAudioFileURL:](self, "_processAudioFileURL:", v13, v18);
        v15 = [(EARAudioResultsGenerator *)self->_resultsGenerator audioResultMatrix];
        [(SSRPitchExtractor *)self _getVoicingWeightedPitchForResultMatrix:v15];
        float v11 = v11 + v16;
        float v10 = v10 + 1.0;
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }
  else
  {
    float v10 = 0.0;
    float v11 = 0.0;
  }
  if (v10 <= 0.000001) {
    float v10 = 1.0;
  }

  return v11 / v10;
}

- (void)_processAudioFileURL:(id)a3
{
  resultsGenerator = self->_resultsGenerator;
  id v5 = a3;
  [(EARAudioResultsGenerator *)resultsGenerator resetForNewRequest];
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SSRPitchExtractor__processAudioFileURL___block_invoke;
  v6[3] = &unk_26442A7B0;
  v6[4] = self;
  +[SSRUtils streamAudioFromFileUrl:v5 audioStreamBasicDescriptor:v7 samplesPerStreamChunk:640 audioDataAvailableHandler:v6];
}

void __42__SSRPitchExtractor__processAudioFileURL___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7 = a4;
  if (!v7)
  {
    if (a3)
    {
      [*(id *)(*(void *)(a1 + 32) + 8) endAudio];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
      [*(id *)(*(void *)(a1 + 32) + 8) addAudio:v8];
    }
    id v7 = 0;
  }
}

- (SSRPitchExtractor)initWithAsset:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SSRPitchExtractor;
  id v5 = [(SSRPitchExtractor *)&v19 init];
  if (v5)
  {
    long long v6 = [v4 resourcePath];
    id v7 = [v6 stringByAppendingPathComponent:@"pitchExtractorConfigFile.json"];

    uint64_t v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v21 = "-[SSRPitchExtractor initWithAsset:]";
      __int16 v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset pitch config path: %{public}@", buf, 0x16u);
    }
    dispatch_queue_t v9 = dispatch_queue_create("SSR Pitch Extraction Queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    float v11 = [MEMORY[0x263F08850] defaultManager];
    int v12 = [v11 fileExistsAtPath:v7];

    if (!v12)
    {

      float v17 = 0;
      goto LABEL_8;
    }
    id v13 = objc_alloc(MEMORY[0x263F3B3A8]);
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    uint64_t v15 = [v13 initWithConfigFile:v7 configRoot:@"spid" sampleRate:(unint64_t)v14 delegate:v5 queue:v5->_queue];
    resultsGenerator = v5->_resultsGenerator;
    v5->_resultsGenerator = (EARAudioResultsGenerator *)v15;
  }
  float v17 = v5;
LABEL_8:

  return v17;
}

@end