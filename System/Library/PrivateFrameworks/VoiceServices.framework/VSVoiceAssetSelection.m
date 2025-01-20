@interface VSVoiceAssetSelection
- (BOOL)isDownloading;
- (BOOL)isInstalled;
- (MAAsset)asset;
- (NSString)builtInVoicePath;
- (NSString)voicePath;
- (VSTrialVoice)trialVoice;
- (VSVoiceAsset)voiceData;
- (VSVoiceAssetSelection)init;
- (VSVoiceAssetSelection)initWithTrialVoice:(id)a3;
- (_opaque_pthread_mutex_t)voicePathLock;
- (double)preferenceScore;
- (id)descriptiveKey;
- (id)key;
- (unint64_t)size;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setBuiltInVoicePath:(id)a3;
- (void)setTrialVoice:(id)a3;
- (void)setVoiceData:(id)a3;
- (void)setVoicePath:(id)a3;
- (void)setVoicePathLock:(_opaque_pthread_mutex_t *)a3;
@end

@implementation VSVoiceAssetSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicePath, 0);
  objc_storeStrong((id *)&self->_builtInVoicePath, 0);
  objc_storeStrong((id *)&self->_trialVoice, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_voiceData, 0);
}

- (VSVoiceAsset)voiceData
{
  return (VSVoiceAsset *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isInstalled
{
  v3 = [(VSVoiceAssetSelection *)self asset];
  if (v3)
  {
    v4 = [(VSVoiceAssetSelection *)self asset];
    BOOL v5 = ([v4 wasLocal] & 1) != 0 || self->_voicePath != 0;
  }
  else
  {
    BOOL v5 = self->_voicePath != 0;
  }

  return v5;
}

- (MAAsset)asset
{
  return (MAAsset *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVoiceData:(id)a3
{
}

- (void)setAsset:(id)a3
{
}

- (VSVoiceAssetSelection)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSVoiceAssetSelection;
  v2 = [(VSVoiceAssetSelection *)&v5 init];
  v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_voicePathLock, 0);
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_voicePathLock);
  v3.receiver = self;
  v3.super_class = (Class)VSVoiceAssetSelection;
  [(VSVoiceAssetSelection *)&v3 dealloc];
}

- (void)setVoicePathLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_voicePathLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_voicePathLock.__opaque[40] = v5;
  *(_OWORD *)&self->_voicePathLock.__sig = v3;
  *(_OWORD *)&self->_voicePathLock.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)voicePathLock
{
  long long v3 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setVoicePath:(id)a3
{
}

- (void)setBuiltInVoicePath:(id)a3
{
}

- (NSString)builtInVoicePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTrialVoice:(id)a3
{
}

- (VSTrialVoice)trialVoice
{
  return (VSTrialVoice *)objc_getProperty(self, a2, 24, 1);
}

- (double)preferenceScore
{
  long long v3 = [(VSVoiceAssetSelection *)self voiceData];
  uint64_t v4 = [v3 type];

  switch(v4)
  {
    case 1:
      double v5 = 1000.0;
      break;
    case 2:
      double v5 = 2000.0;
      break;
    case 3:
      double v5 = 3000.0;
      break;
    case 4:
      v6 = [(VSVoiceAssetSelection *)self voiceData];
      int v7 = [v6 isVoiceReadyToUse];

      if (v7) {
        double v5 = 4000.0;
      }
      else {
        double v5 = 0.0;
      }
      break;
    default:
      double v5 = 0.0;
      break;
  }
  v8 = [(VSVoiceAssetSelection *)self voiceData];
  uint64_t v9 = [v8 footprint];

  if (v9 == 3)
  {
    double v10 = 300.0;
    double v12 = v5 + 300.0;
  }
  else
  {
    double v10 = v5 + 200.0;
    double v11 = v5 + 100.0;
    if (v9 != 1) {
      double v11 = v5;
    }
    if (v9 == 2) {
      double v12 = v5 + 200.0;
    }
    else {
      double v12 = v11;
    }
  }
  v13 = [(VSVoiceAssetSelection *)self voiceData];
  v14 = [v13 contentVersion];
  [v14 floatValue];
  double v16 = v12 + v15 / 2147483650.0;

  return v16;
}

- (BOOL)isDownloading
{
  long long v3 = [(VSVoiceAssetSelection *)self asset];
  if (v3)
  {
    uint64_t v4 = [(VSVoiceAssetSelection *)self asset];
    BOOL v5 = [v4 state] == 4;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)size
{
  uint64_t v4 = [(VSVoiceAssetSelection *)self asset];
  BOOL v5 = [v4 attributes];

  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F558A0]];
  unint64_t v7 = [v6 integerValue];

  if ((v7 & 0x8000000000000000) != 0)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"VSMobileAssetsManager.m" lineNumber:211 description:@"negative size"];
  }
  return v7;
}

- (NSString)voicePath
{
  p_voicePathLock = &self->_voicePathLock;
  pthread_mutex_lock(&self->_voicePathLock);
  p_voicePath = &self->_voicePath;
  if (!self->_voicePath)
  {
    BOOL v5 = [(VSVoiceAssetSelection *)self asset];

    if (v5)
    {
      v6 = [(VSVoiceAssetSelection *)self asset];
      unint64_t v7 = [v6 getLocalUrl];
      id v8 = [v7 path];

      if (v8)
      {
        uint64_t v9 = NSString;
        double v10 = [(VSVoiceAssetSelection *)self voiceData];
        double v11 = [v10 languages];
        double v12 = [v11 firstObject];
        v13 = [v9 stringWithFormat:@"%@.tmp", v12];
        v14 = [v8 stringByAppendingPathComponent:v13];

        if (!v14
          || ([MEMORY[0x263F08850] defaultManager],
              float v15 = objc_claimAutoreleasedReturnValue(),
              char v16 = [v15 fileExistsAtPath:v14],
              v15,
              v17 = v14,
              (v16 & 1) == 0))
        {
          v17 = v8;
        }
        objc_storeStrong((id *)p_voicePath, v17);
      }
    }
    else
    {
      builtInVoicePath = self->_builtInVoicePath;
      if (!builtInVoicePath) {
        goto LABEL_11;
      }
      v19 = builtInVoicePath;
      id v8 = *p_voicePath;
      *p_voicePath = v19;
    }
  }
LABEL_11:
  pthread_mutex_unlock(p_voicePathLock);
  v20 = *p_voicePath;
  return v20;
}

- (id)descriptiveKey
{
  v2 = [(VSVoiceAssetSelection *)self voiceData];
  long long v3 = [v2 descriptiveKey];

  return v3;
}

- (id)key
{
  v2 = [(VSVoiceAssetSelection *)self voiceData];
  long long v3 = [v2 voiceKey];

  return v3;
}

- (VSVoiceAssetSelection)initWithTrialVoice:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(VSVoiceAssetSelection *)self init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trialVoice, a3);
    id v8 = objc_alloc_init(VSVoiceAsset);
    voiceData = v7->_voiceData;
    v7->_voiceData = v8;

    [(VSAssetBase *)v7->_voiceData setStorage:3];
    double v10 = [v5 language];
    if (v10)
    {
      double v11 = [v5 language];
      v21[0] = v11;
      double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
      [(VSVoiceAsset *)v7->_voiceData setLanguages:v12];
    }
    else
    {
      [(VSVoiceAsset *)v7->_voiceData setLanguages:MEMORY[0x263EFFA68]];
    }

    v13 = [v5 name];
    [(VSVoiceAsset *)v7->_voiceData setName:v13];

    -[VSVoiceAsset setType:](v7->_voiceData, "setType:", [v5 type]);
    -[VSVoiceAsset setFootprint:](v7->_voiceData, "setFootprint:", [v5 footprint]);
    -[VSVoiceAsset setGender:](v7->_voiceData, "setGender:", [v5 gender]);
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "version"));
    [(VSAssetBase *)v7->_voiceData setContentVersion:v14];

    if ([v5 compatibilityVersion])
    {
      float v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "compatibilityVersion"));
      [(VSAssetBase *)v7->_voiceData setCompatibilityVersion:v15];
    }
    else
    {
      [(VSAssetBase *)v7->_voiceData setCompatibilityVersion:0];
    }
    -[VSVoiceAsset setIsInstalled:](v7->_voiceData, "setIsInstalled:", [v5 isLocal]);
    [(VSAssetBase *)v7->_voiceData setIsPurgeable:1];
    [(VSVoiceAsset *)v7->_voiceData setIsBuiltInVoice:0];
    if ([v5 assetSize])
    {
      char v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "assetSize"));
      [(VSAssetBase *)v7->_voiceData setDownloadSize:v16];
    }
    else
    {
      [(VSAssetBase *)v7->_voiceData setDownloadSize:0];
    }
    uint64_t v17 = [v5 path];
    voicePath = v7->_voicePath;
    v7->_voicePath = (NSString *)v17;

    if ([v5 type] == 4)
    {
      uint64_t v19 = (uint64_t)v7->_voicePath;
      if (v19) {
        uint64_t v19 = +[VSNeuralTTSUtils isNeuralVoiceReady:](VSNeuralTTSUtils, "isNeuralVoiceReady:");
      }
    }
    else
    {
      uint64_t v19 = 1;
    }
    [(VSVoiceAsset *)v7->_voiceData setIsVoiceReadyToUse:v19];
  }

  return v7;
}

@end