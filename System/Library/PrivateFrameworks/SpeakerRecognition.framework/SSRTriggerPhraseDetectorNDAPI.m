@interface SSRTriggerPhraseDetectorNDAPI
- (SSRTriggerPhraseDetectorNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4 phId:(unint64_t)a5;
- (id)analyzeWavData:(id)a3 numSamples:(unint64_t)a4;
- (id)getSuperVectorWithEndPoint:(unint64_t)a3;
- (void)dealloc;
- (void)reset;
@end

@implementation SSRTriggerPhraseDetectorNDAPI

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  novDetect = (unsigned int *)self->_novDetect;
  if (novDetect)
  {
    novDetect = (unsigned int *)nd_getsupervector();
    if (novDetect)
    {
      novDetect = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)novDetect length:4 * novDetect[2]];
    }
  }

  return novDetect;
}

- (id)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  [a3 bytes];
  nd_wavedata();
  if (self->_novDetect
    && ((int)nd_phrasecount() < 1 ? (uint64_t v5 = nd_getresults()) : (uint64_t v5 = nd_getphraseresults()),
        (v6 = (unsigned int *)v5) != 0))
  {
    v7 = objc_alloc_init(SSRTriggerPhraseDetectorNDAPIResult);
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setPhId:self->_phId];
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setSamplesFed:*v6];
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setBestPhrase:v6[3]];
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setBestStart:v6[1]];
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setBestEnd:v6[2]];
    LODWORD(v8) = v6[4];
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setBestScore:v8];
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setIsEarlyWarning:*((unsigned __int8 *)v6 + 20)];
    [(SSRTriggerPhraseDetectorNDAPIResult *)v7 setIsRescoring:*((unsigned __int8 *)v6 + 21)];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reset
{
}

- (void)dealloc
{
  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SSRTriggerPhraseDetectorNDAPI;
  [(SSRTriggerPhraseDetectorNDAPI *)&v3 dealloc];
}

- (SSRTriggerPhraseDetectorNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4 phId:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SSRTriggerPhraseDetectorNDAPI;
  v10 = [(SSRTriggerPhraseDetectorNDAPI *)&v20 init];
  if (!v10) {
    goto LABEL_8;
  }
  v10->_novDetect = (void *)nd_create();
  v10->_phId = a5;
  v11 = (os_log_t *)MEMORY[0x263F38100];
  v12 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SSRTriggerPhraseDetectorNDAPI initWithConfigPath:resourcePath:phId:]";
    __int16 v23 = 2114;
    *(void *)v24 = v8;
    *(_WORD *)&v24[8] = 2114;
    *(void *)&v24[10] = v9;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Initializing NDAPI using %{public}@, %{public}@", buf, 0x20u);
  }
  [v8 UTF8String];
  [v9 cStringUsingEncoding:4];
  int v13 = nd_initialize();
  if (v13)
  {
    int v14 = v13;
    os_log_t v15 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      v18 = v15;
      uint64_t v19 = nd_error();
      *(_DWORD *)buf = 136315650;
      v22 = "-[SSRTriggerPhraseDetectorNDAPI initWithConfigPath:resourcePath:phId:]";
      __int16 v23 = 1026;
      *(_DWORD *)v24 = v14;
      *(_WORD *)&v24[4] = 2082;
      *(void *)&v24[6] = v19;
      _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s Failed to initialize NDAPI: err=[%{public}d]:%{public}s", buf, 0x1Cu);
    }
    v16 = 0;
  }
  else
  {
LABEL_8:
    v16 = v10;
  }

  return v16;
}

@end