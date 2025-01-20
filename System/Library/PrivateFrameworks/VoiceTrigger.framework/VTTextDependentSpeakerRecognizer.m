@interface VTTextDependentSpeakerRecognizer
+ (BOOL)psrTdAssetExistsAtResourcePath:(id)a3;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4;
+ (void)_createDirectoryIfDoesNotExist:(id)a3;
- (BOOL)tdPsrCanProcessRequest;
- (EARPSRAudioProcessor)speakerVectorGenerator;
- (NSData)speakerVector;
- (NSMutableData)psrAudioDataForLogging;
- (NSString)assetHash;
- (NSString)resourcePath;
- (NSString)satDirectory;
- (NSString)tdSATModelDirPath;
- (NSString)tdSATModelFilePath;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)stateSerialQueue;
- (VTTextDependentSpeakerRecognizer)initWithResourcePath:(id)a3 satDirectory:(id)a4 assetHash:(id)a5 shouldCreateModelDir:(BOOL)a6 delegate:(id)a7;
- (VTTextDependentSpeakerRecognizerDelegate)delegate;
- (double)_getFloatValueForNDAPIConfigOption:(id)a3 defaultValue:(double)a4;
- (double)getCombinationWeight;
- (double)getThresholdSAT;
- (float)lastRequestSatScore;
- (id)_getValueForNDAPIConfigOption:(id)a3;
- (int)_getSATVectorCount;
- (int64_t)getSATVectorCount;
- (unint64_t)numSamplesProecssed;
- (void)dealloc;
- (void)deleteExistingSATModel;
- (void)deleteVectorAtIndex:(int)a3;
- (void)endAudio;
- (void)logWithAudioFilepath:(id)a3;
- (void)processAudio:(const signed __int16 *)a3 numSamples:(unint64_t)a4;
- (void)psrAudioProcessor:(id)a3 hasResult:(id)a4 numElements:(unint64_t)a5;
- (void)resetForNewRequest;
- (void)setAssetHash:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastRequestSatScore:(float)a3;
- (void)setNumSamplesProecssed:(unint64_t)a3;
- (void)setPsrAudioDataForLogging:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResourcePath:(id)a3;
- (void)setSatDirectory:(id)a3;
- (void)setSpeakerVector:(id)a3;
- (void)setSpeakerVectorGenerator:(id)a3;
- (void)setStateSerialQueue:(id)a3;
- (void)setTdPsrCanProcessRequest:(BOOL)a3;
- (void)setTdSATModelDirPath:(id)a3;
- (void)setTdSATModelFilePath:(id)a3;
- (void)updateSAT;
@end

@implementation VTTextDependentSpeakerRecognizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psrAudioDataForLogging, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speakerVector, 0);
  objc_storeStrong((id *)&self->_assetHash, 0);
  objc_storeStrong((id *)&self->_tdSATModelDirPath, 0);
  objc_storeStrong((id *)&self->_satDirectory, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_speakerVectorGenerator, 0);

  objc_storeStrong((id *)&self->_tdSATModelFilePath, 0);
}

- (void)setPsrAudioDataForLogging:(id)a3
{
}

- (NSMutableData)psrAudioDataForLogging
{
  return self->_psrAudioDataForLogging;
}

- (void)setStateSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)stateSerialQueue
{
  return self->_stateSerialQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setNumSamplesProecssed:(unint64_t)a3
{
  self->_numSamplesProecssed = a3;
}

- (unint64_t)numSamplesProecssed
{
  return self->_numSamplesProecssed;
}

- (void)setSpeakerVector:(id)a3
{
}

- (NSData)speakerVector
{
  return self->_speakerVector;
}

- (void)setAssetHash:(id)a3
{
}

- (NSString)assetHash
{
  return self->_assetHash;
}

- (void)setTdSATModelDirPath:(id)a3
{
}

- (NSString)tdSATModelDirPath
{
  return self->_tdSATModelDirPath;
}

- (void)setSatDirectory:(id)a3
{
}

- (NSString)satDirectory
{
  return self->_satDirectory;
}

- (void)setResourcePath:(id)a3
{
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setDelegate:(id)a3
{
}

- (VTTextDependentSpeakerRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VTTextDependentSpeakerRecognizerDelegate *)WeakRetained;
}

- (void)setSpeakerVectorGenerator:(id)a3
{
}

- (EARPSRAudioProcessor)speakerVectorGenerator
{
  return self->_speakerVectorGenerator;
}

- (void)setLastRequestSatScore:(float)a3
{
  self->_lastRequestSatScore = a3;
}

- (float)lastRequestSatScore
{
  return self->_lastRequestSatScore;
}

- (void)setTdSATModelFilePath:(id)a3
{
}

- (NSString)tdSATModelFilePath
{
  return self->_tdSATModelFilePath;
}

- (void)logWithAudioFilepath:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: logAudioFilepath is nil", buf, 2u);
    }
    goto LABEL_12;
  }
  v5 = +[VTPreferences sharedPreferences];
  char v6 = [v5 fileLoggingIsEnabled];

  if ((v6 & 1) == 0)
  {
    v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: logWithAudioFilepath called when AudioFileLogging is NOT enabled.", buf, 2u);
    }
LABEL_12:
    psrAudioDataForLogging = self->_psrAudioDataForLogging;
    self->_psrAudioDataForLogging = 0;

    goto LABEL_13;
  }
  if ([(NSMutableData *)self->_psrAudioDataForLogging length])
  {
    v7 = [v4 lastPathComponent];
    v8 = [v7 stringByDeletingPathExtension];
    v9 = [v8 stringByAppendingString:@"_psr"];
    v10 = [v9 stringByAppendingPathExtension:@"wav"];

    v11 = [v4 stringByDeletingLastPathComponent];
    v12 = [v11 stringByAppendingPathComponent:v10];

    v13 = [NSURL fileURLWithPath:v12];
    v14 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v15 = [(NSMutableData *)self->_psrAudioDataForLogging length];
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      __int16 v30 = 2048;
      NSUInteger v31 = v15 >> 1;
      _os_log_impl(&dword_21844F000, v14, OS_LOG_TYPE_DEFAULT, "TDSR:: Writing psr-audio at : %@, numSamples=%lu", buf, 0x16u);
    }

    uint64_t v25 = 0x40CF400000000000;
    long long v26 = xmmword_21852DDF0;
    long long v27 = xmmword_21852DE00;
    uint64_t v22 = 0x40CF400000000000;
    long long v23 = xmmword_21852DDF0;
    long long v24 = xmmword_21852DE00;
    v16 = [[AudioFileWriter alloc] initWithURL:v13 inputFormat:&v25 outputFormat:&v22];
    [(AudioFileWriter *)v16 addSamples:[(NSMutableData *)self->_psrAudioDataForLogging bytes] len:self->_numSamplesProecssed];
    [(AudioFileWriter *)v16 close];
    v17 = self->_psrAudioDataForLogging;
    self->_psrAudioDataForLogging = 0;
  }
  else
  {
    v21 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: logWithAudioFilepath called when psrAudioDataForLogging.length==0", buf, 2u);
    }
  }
LABEL_13:
}

- (id)_getValueForNDAPIConfigOption:(id)a3
{
  id v4 = a3;
  v5 = v4;
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    v7 = nd_getoption(novDetect, (const char *)[v4 UTF8String]);
    if (v7)
    {
      novDetect = [NSString stringWithUTF8String:v7];
    }
    else
    {
      novDetect = 0;
    }
  }

  return novDetect;
}

- (double)_getFloatValueForNDAPIConfigOption:(id)a3 defaultValue:(double)a4
{
  v5 = [(VTTextDependentSpeakerRecognizer *)self _getValueForNDAPIConfigOption:a3];
  char v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    a4 = v7;
  }

  return a4;
}

- (void)psrAudioProcessor:(id)a3 hasResult:(id)a4 numElements:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = VTLogContextFacilityVoiceTrigger;
  BOOL v11 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "TDSR:: SpeakerVector available", (uint8_t *)&v23, 2u);
    }
    v12 = (const char *)[v9 bytes];
    novDetect = self->_novDetect;
    if (novDetect)
    {
      v14 = (float *)nd_sat_analyze((uint64_t)novDetect, v12, a5);
      if (v14)
      {
        float v15 = *v14;
        v16 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t numSamplesProecssed = self->_numSamplesProecssed;
          int v23 = 134349312;
          double v24 = v15;
          __int16 v25 = 2050;
          unint64_t v26 = numSamplesProecssed;
          _os_log_impl(&dword_21844F000, v16, OS_LOG_TYPE_DEFAULT, "TDSR:: Done: SAT: %{public}f, numSamples: %{public}lu", (uint8_t *)&v23, 0x16u);
        }
      }
      else
      {
        v18 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = self->_novDetect;
          if (v19)
          {
            if (*((_DWORD *)v19 + 1) == 2 || *(_DWORD *)v19 != -1838836561) {
              v20 = "Invalid NovDetect object";
            }
            else {
              v20 = (const char *)*((void *)v19 + 4);
            }
          }
          else
          {
            v20 = "Invalid NovDetect pointer (NULL)";
          }
          int v23 = 136446210;
          double v24 = *(double *)&v20;
          _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: SAT: Failed to compute score: err: %{public}s", (uint8_t *)&v23, 0xCu);
        }

        float v15 = 0.0;
      }
      self->_lastRequestSatScore = v15;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      *(float *)&double v22 = v15;
      [WeakRetained textDependentSpeakerRecognizer:self hasSatScore:v22];
    }
  }
  else if (v11)
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "TDSR:: ERR: speakerVector is nil!", (uint8_t *)&v23, 2u);
  }
}

- (void)deleteVectorAtIndex:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect && nd_sat_deletevector(novDetect, *(const char **)&a3))
  {
    v5 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = self->_novDetect;
      if (v6)
      {
        if (*((_DWORD *)v6 + 1) == 2 || *(_DWORD *)v6 != -1838836561) {
          float v7 = "Invalid NovDetect object";
        }
        else {
          float v7 = (const char *)*((void *)v6 + 4);
        }
      }
      else
      {
        float v7 = "Invalid NovDetect pointer (NULL)";
      }
      v8[0] = 67240450;
      v8[1] = -1;
      __int16 v9 = 2082;
      v10 = v7;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "TDSR:: NDAPI::Failed to nd_sat_deletevector: err=[%{public}d]:%{public}s", (uint8_t *)v8, 0x12u);
    }
  }
}

- (void)deleteExistingSATModel
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__VTTextDependentSpeakerRecognizer_deleteExistingSATModel__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __58__VTTextDependentSpeakerRecognizer_deleteExistingSATModel__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  int v3 = [v2 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 64) isDirectory:0];

  if (v3)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 64);
    id v24 = 0;
    v17 = [v4 contentsOfDirectoryAtPath:v5 error:&v24];
    id v18 = v24;

    char v6 = v17;
    if (!v18 && v17)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v17;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v7);
            }
            if (*(void *)(*((void *)&v20 + 1) + 8 * i))
            {
              uint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "stringByAppendingPathComponent:");
              v12 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                unint64_t v26 = v11;
                _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "TDSR:: Removing invalidated speaker model at: %{public}@", buf, 0xCu);
              }
              v13 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v17);
              id v19 = 0;
              [v13 removeItemAtPath:v11 error:&v19];
              id v14 = v19;

              if (v14)
              {
                float v15 = (id)VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  v16 = [v14 localizedDescription];
                  *(_DWORD *)buf = 138543618;
                  unint64_t v26 = v11;
                  __int16 v27 = 2114;
                  v28 = v16;
                  _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x16u);
                }
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v8);
      }

      char v6 = v17;
    }
  }
}

- (void)updateSAT
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__VTTextDependentSpeakerRecognizer_updateSAT__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __45__VTTextDependentSpeakerRecognizer_updateSAT__block_invoke(uint64_t a1)
{
  *(void *)&v11[5] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) tdPsrCanProcessRequest])
  {
    int v3 = nd_sat_update(*(IntNovDetect **)(*(void *)(a1 + 32) + 8), v2);
    id v4 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(a1 + 32) _getSATVectorCount];
      int v10 = 134349056;
      *(void *)uint64_t v11 = v5;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "TDSR:: updateSpeakerModel: numSV after update: %{public}ld", (uint8_t *)&v10, 0xCu);
    }

    if (v3)
    {
      char v6 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        if (v7)
        {
          if (*(_DWORD *)(v7 + 4) == 2 || *(_DWORD *)v7 != -1838836561) {
            uint64_t v8 = "Invalid NovDetect object";
          }
          else {
            uint64_t v8 = *(const char **)(v7 + 32);
          }
        }
        else
        {
          uint64_t v8 = "Invalid NovDetect pointer (NULL)";
        }
        int v10 = 67240450;
        v11[0] = -1;
        LOWORD(v11[1]) = 2082;
        *(void *)((char *)&v11[1] + 2) = v8;
        _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "TDSR:: Failed to persist via sat_update: %{public}d, %{public}s", (uint8_t *)&v10, 0x12u);
      }
    }
  }
  else
  {
    uint64_t v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "TDSR:: TD-PSR Cannot process request, Not updating td-speaker-model", (uint8_t *)&v10, 2u);
    }
  }
}

- (int)_getSATVectorCount
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = nd_sat_vectorcount((uint64_t)self->_novDetect, a2);
  if (v3 < 0)
  {
    id v4 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      novDetect = self->_novDetect;
      if (novDetect)
      {
        if (*((_DWORD *)novDetect + 1) == 2 || *(_DWORD *)novDetect != -1838836561) {
          char v6 = "Invalid NovDetect object";
        }
        else {
          char v6 = (const char *)*((void *)novDetect + 4);
        }
      }
      else
      {
        char v6 = "Invalid NovDetect pointer (NULL)";
      }
      int v8 = 136446210;
      uint64_t v9 = v6;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "TDSR:: Failed to getSATVectorCount: %{public}s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v3;
}

- (int64_t)getSATVectorCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__VTTextDependentSpeakerRecognizer_getSATVectorCount__block_invoke;
  v5[3] = &unk_264325F50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = *((int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__VTTextDependentSpeakerRecognizer_getSATVectorCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _getSATVectorCount];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__VTTextDependentSpeakerRecognizer_endAudio__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__VTTextDependentSpeakerRecognizer_endAudio__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) tdPsrCanProcessRequest];
  int64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 134349056;
      uint64_t v8 = v4;
      _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "TDSR:: ending Audio: NumSamples processed: %{public}lu", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 32) endAudio];
  }
  else
  {
    int v5 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) tdPsrCanProcessRequest];
      *(_DWORD *)buf = 67240192;
      LODWORD(v8) = v6;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: endAudio called without calling resetForNewRequest: _tdPsrResetSuccessfully: %{public}d", buf, 8u);
    }
  }
}

- (void)processAudio:(const signed __int16 *)a3 numSamples:(unint64_t)a4
{
  if (a3)
  {
    int v6 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:2 * a4];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__VTTextDependentSpeakerRecognizer_processAudio_numSamples___block_invoke;
    block[3] = &unk_264325858;
    block[4] = self;
    id v10 = v6;
    unint64_t v11 = a4;
    id v8 = v6;
    dispatch_async(queue, block);
  }
}

void __60__VTTextDependentSpeakerRecognizer_processAudio_numSamples___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) tdPsrCanProcessRequest])
  {
    [*(id *)(*(void *)(a1 + 32) + 112) appendData:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 32) addAudio:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 88) += *(void *)(a1 + 48);
  }
  else
  {
    char v2 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [*(id *)(a1 + 32) tdPsrCanProcessRequest];
      *(_DWORD *)buf = 67240192;
      int v5 = v3;
      _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: processAudio called without calling resetForNewRequest: _tdPsrResetSuccessfully: %{public}d", buf, 8u);
    }
  }
}

- (void)resetForNewRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__VTTextDependentSpeakerRecognizer_resetForNewRequest__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__VTTextDependentSpeakerRecognizer_resetForNewRequest__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
  [*(id *)(a1 + 32) setTdPsrCanProcessRequest:0];
  *(_DWORD *)(*(void *)(a1 + 32) + 20) = 0;
  kdebug_trace();
  if (nd_reset(*(IntNovDetect **)(*(void *)(a1 + 32) + 8), v2))
  {
    [*(id *)(a1 + 32) setTdPsrCanProcessRequest:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v3)
    {
      if (*(_DWORD *)(v3 + 4) == 2 || *(_DWORD *)v3 != -1838836561) {
        uint64_t v4 = "Invalid NovDetect object";
      }
      else {
        uint64_t v4 = *(const char **)(v3 + 32);
      }
    }
    else
    {
      uint64_t v4 = "Invalid NovDetect pointer (NULL)";
    }
    objc_msgSend(NSString, "stringWithFormat:", @"nd_reset failed: %d:%s", 0xFFFFFFFFLL, v4);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v11 = +[VTTextDependentSpeakerRecognizer errorWithCode:-1 message:v18];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained textDependentSpeakerRecognizer:*(void *)(a1 + 32) failedWithError:v11];
  }
  else
  {
    kdebug_trace();
    int v5 = [MEMORY[0x263EFF910] date];
    kdebug_trace();
    [*(id *)(*(void *)(a1 + 32) + 32) resetForNewRequest];
    [*(id *)(a1 + 32) setTdPsrCanProcessRequest:1];
    uint64_t v6 = +[VTPreferences sharedPreferences];
    int v7 = [v6 fileLoggingIsEnabled];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFF990] data];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 112);
      *(void *)(v9 + 112) = v8;
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v10 = *(void **)(v13 + 112);
      *(void *)(v13 + 112) = 0;
    }

    kdebug_trace();
    id v14 = [MEMORY[0x263EFF910] date];
    float v15 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 32);
      [v14 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2050;
      double v22 = v17 * 1000.0;
      _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "TDSR:: Done resetForNewRequest: _speakerVectorGenerator: %{public}@: time for TDSR: %{public}f ms", buf, 0x16u);
    }
  }
}

- (void)setTdPsrCanProcessRequest:(BOOL)a3
{
  stateSerialQueue = self->_stateSerialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__VTTextDependentSpeakerRecognizer_setTdPsrCanProcessRequest___block_invoke;
  v4[3] = &unk_264325FC8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateSerialQueue, v4);
}

uint64_t __62__VTTextDependentSpeakerRecognizer_setTdPsrCanProcessRequest___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)tdPsrCanProcessRequest
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__VTTextDependentSpeakerRecognizer_tdPsrCanProcessRequest__block_invoke;
  v5[3] = &unk_264325F50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__VTTextDependentSpeakerRecognizer_tdPsrCanProcessRequest__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)dealloc
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    IntNovDetect::~IntNovDetect(novDetect);
    MEMORY[0x21D46B240]();
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VTTextDependentSpeakerRecognizer;
  [(VTTextDependentSpeakerRecognizer *)&v4 dealloc];
}

- (double)getCombinationWeight
{
  [(VTTextDependentSpeakerRecognizer *)self _getFloatValueForNDAPIConfigOption:@"td_sr_combination_weight" defaultValue:0.0];
  return result;
}

- (double)getThresholdSAT
{
  [(VTTextDependentSpeakerRecognizer *)self _getFloatValueForNDAPIConfigOption:@"threshold_sat" defaultValue:INFINITY];
  return result;
}

- (VTTextDependentSpeakerRecognizer)initWithResourcePath:(id)a3 satDirectory:(id)a4 assetHash:(id)a5 shouldCreateModelDir:(BOOL)a6 delegate:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v12 = a7;
  v28.receiver = self;
  v28.super_class = (Class)VTTextDependentSpeakerRecognizer;
  uint64_t v13 = [(VTTextDependentSpeakerRecognizer *)&v28 init];
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    objc_storeStrong(p_isa + 6, a3);
    objc_storeStrong(p_isa + 7, a4);
    objc_storeStrong(p_isa + 9, a5);
    float v15 = [p_isa[6] stringByAppendingPathComponent:@"config_sr_sat.txt"];
    uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
    char v17 = [v16 fileExistsAtPath:v15 isDirectory:0];

    id v18 = VTLogContextFacilityVoiceTrigger;
    BOOL v19 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        id v20 = p_isa[6];
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v20;
        _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: resourcePath: %{public}@", buf, 0xCu);
        id v18 = VTLogContextFacilityVoiceTrigger;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v15;
        _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: tdSrConfigFilePath: %{public}@", buf, 0xCu);
        id v18 = VTLogContextFacilityVoiceTrigger;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = p_isa[7];
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v21;
        _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: _satDirectory: %{public}@", buf, 0xCu);
        id v18 = VTLogContextFacilityVoiceTrigger;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = p_isa[9];
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v22;
        _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: _assetHash: %{public}@", buf, 0xCu);
      }
      if ((initndlib(void)::bNDLibInitialized & 1) == 0) {
        initndlib(void)::bNDLibInitialized = 1;
      }
      operator new();
    }
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: No TDSR config file; Not initializing VTTextDependentSpeakerRecognizer",
        buf,
        2u);
    }

    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = (VTTextDependentSpeakerRecognizer *)0;
  }

  return v23;
}

+ (void)_createDirectoryIfDoesNotExist:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x263F08850] defaultManager];
  unsigned __int8 v14 = 0;
  char v5 = [v4 fileExistsAtPath:v3 isDirectory:&v14];
  int v6 = v14;
  if (v14) {
    char v7 = v5;
  }
  else {
    char v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "TDSR:: Creating Directory : %@", buf, 0xCu);
      int v6 = v14;
    }
    if (!v6)
    {
      char v9 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "TDSR:: same name of file exists, this will be removed", buf, 2u);
      }
      [v4 removeItemAtPath:v3 error:0];
    }
    id v13 = 0;
    [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v13];
    id v10 = v13;
    if (v10)
    {
      unint64_t v11 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v10 localizedDescription];
        *(_DWORD *)buf = 138543362;
        id v16 = v12;
        _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "TDSR:: Creating Directory failed : %{public}@", buf, 0xCu);
      }
    }
  }
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  char v5 = (__CFString *)a4;
  int v6 = v5;
  char v7 = (void *)MEMORY[0x263F087E8];
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = @"???";
  }
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = v8;
  char v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = [v7 errorWithDomain:@"VTTextDependentSpeakerRecognizer" code:a3 userInfo:v9];

  return v10;
}

+ (BOOL)psrTdAssetExistsAtResourcePath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = [v3 stringByAppendingPathComponent:@"config_sr_sat.txt"];
  char v10 = 0;
  char v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:&v10];

  if (v10)
  {
    char v7 = VTLogContextFacilityVoiceTrigger;
    BOOL v8 = 0;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v4;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "TDSR:: ERR: expecting file; found dir at: %{public}@",
        buf,
        0xCu);
      BOOL v8 = v10 == 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v6 & v8;
}

@end