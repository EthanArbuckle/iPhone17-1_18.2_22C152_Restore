@interface VMSpeechAnalyzerOperation
- (BOOL)enumerateSampleBuffersWithURL:(id)a3 sampleRate:(double)a4 useFloat:(BOOL)a5 block:(id)a6;
- (BOOL)submitAudioToAnalyzer:(id)a3 sampleRate:(double)a4 useFloat:(BOOL)a5;
- (NSOperationQueue)speechAnalyzerQueue;
- (SFSpeechAnalyzer)speechAnalyzer;
- (VMSpeechAnalyzerOperation)init;
- (VMSpeechAnalyzerOperation)initWithClientIdentifier:(id)a3 transcriberResultDelegate:(id)a4 endpointingResultDelegate:(id)a5 languageDetectorResultDelegate:(id)a6 transcriberOptions:(id)a7 options:(id)a8 languageDetectorOptions:(id)a9 restrictedLogging:(BOOL)a10 didChangeVolatileRange:(id)a11;
- (VMSpeechAnalyzerOperation)initWithSpeechAnalyzer:(id)a3;
- (void)setSpeechAnalyzerQueue:(id)a3;
@end

@implementation VMSpeechAnalyzerOperation

- (VMSpeechAnalyzerOperation)init
{
  return 0;
}

- (VMSpeechAnalyzerOperation)initWithClientIdentifier:(id)a3 transcriberResultDelegate:(id)a4 endpointingResultDelegate:(id)a5 languageDetectorResultDelegate:(id)a6 transcriberOptions:(id)a7 options:(id)a8 languageDetectorOptions:(id)a9 restrictedLogging:(BOOL)a10 didChangeVolatileRange:(id)a11
{
  id v33 = a11;
  id v32 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [objc_alloc((Class)AVAudioFormat) initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:16000.0];
  id v24 = objc_alloc_init((Class)NSOperationQueue);
  LOBYTE(v31) = a10;
  v34 = v23;
  id v25 = [objc_alloc((Class)SFSpeechAnalyzer) initWithClientIdentifier:v22 audioFormat:v23 transcriberResultDelegate:v21 endpointingResultDelegate:v20 languageDetectorResultDelegate:v19 queue:v24 transcriberOptions:v18 options:v17 languageDetectorOptions:v32 restrictedLogging:v31 geoLMRegionID:0 contextualNamedEntities:0 didChangeVolatileRange:v33];

  if (v25)
  {
    v26 = [(VMSpeechAnalyzerOperation *)self initWithSpeechAnalyzer:v25];
    v27 = v26;
    if (v26) {
      [(VMSpeechAnalyzerOperation *)v26 setSpeechAnalyzerQueue:v24];
    }
    v28 = v27;
    v29 = v28;
  }
  else
  {
    v29 = 0;
    v28 = self;
  }

  return v29;
}

- (VMSpeechAnalyzerOperation)initWithSpeechAnalyzer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMSpeechAnalyzerOperation;
  v6 = [(VMSpeechAnalyzerOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_speechAnalyzer, a3);
  }

  return v7;
}

- (BOOL)enumerateSampleBuffersWithURL:(id)a3 sampleRate:(double)a4 useFloat:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  objc_super v9 = a3;
  v10 = (void (**)(id, id))a6;
  v11 = +[AVURLAsset assetWithURL:v9];
  if (v11)
  {
    id v26 = 0;
    v12 = +[AVAssetReader assetReaderWithAsset:v11 error:&v26];
    v13 = v26;
    if (!v12)
    {
      id v17 = vm_vmd_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v13;
        __int16 v31 = 2112;
        id v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "enumerateSampleBuffersWithURL: Error with reader %@ for URL %@", buf, 0x16u);
      }
      BOOL v22 = 0;
      goto LABEL_24;
    }
    v28[0] = &off_1000C83C0;
    v27[0] = AVFormatIDKey;
    v27[1] = AVSampleRateKey;
    v14 = +[NSNumber numberWithDouble:a4];
    v28[1] = v14;
    v28[2] = &off_1000C83D8;
    v27[2] = AVNumberOfChannelsKey;
    v27[3] = AVLinearPCMBitDepthKey;
    v15 = &off_1000C83F0;
    if (!v7) {
      v15 = &off_1000C8408;
    }
    v28[3] = v15;
    v28[4] = &__kCFBooleanFalse;
    v27[4] = AVLinearPCMIsBigEndianKey;
    v27[5] = AVLinearPCMIsFloatKey;
    v16 = +[NSNumber numberWithBool:v7];
    v28[5] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:6];

    id v18 = [v11 tracksWithMediaType:AVMediaTypeAudio];
    id v19 = +[AVAssetReaderAudioMixOutput assetReaderAudioMixOutputWithAudioTracks:v18 audioSettings:v17];

    if (v19)
    {
      if ([v12 canAddOutput:v19])
      {
        [v12 addOutput:v19];
        [v12 startReading];
        id v20 = [v19 copyNextSampleBuffer];
        if (v20)
        {
          id v21 = v20;
          do
          {
            v10[2](v10, v21);
            CFRelease(v21);
            id v21 = [v19 copyNextSampleBuffer];
          }
          while (v21);
        }
        [v12 cancelReading];
        BOOL v22 = 1;
        goto LABEL_23;
      }
      id v23 = vm_vmd_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        id v24 = "enumerateSampleBuffersWithURL: Could not add output for %@";
        goto LABEL_21;
      }
    }
    else
    {
      id v23 = vm_vmd_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        id v24 = "enumerateSampleBuffersWithURL: Empty output for URL %@";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
      }
    }

    BOOL v22 = 0;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  v13 = vm_vmd_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "enumerateSampleBuffersWithURL:Invalid asset for URL %@", buf, 0xCu);
  }
  BOOL v22 = 0;
LABEL_25:

  return v22;
}

- (BOOL)submitAudioToAnalyzer:(id)a3 sampleRate:(double)a4 useFloat:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (self->_speechAnalyzer)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100008B94;
    v14[3] = &unk_1000C15C0;
    v14[4] = self;
    v14[5] = a2;
    BOOL v10 = [(VMSpeechAnalyzerOperation *)self enumerateSampleBuffersWithURL:v9 sampleRate:v5 useFloat:v14 block:a4];
    v11 = vm_vmd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v16[0]) = v10;
      WORD2(v16[0]) = 2112;
      *(void *)((char *)v16 + 6) = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "enumerateSampleBuffersWithURL success? %d for URL %@", buf, 0x12u);
    }

    [(SFSpeechAnalyzer *)self->_speechAnalyzer finishAudio];
    [(SFSpeechAnalyzer *)self->_speechAnalyzer finalizeAndFinishThroughEndOfInputWithCompletion:&stru_1000C1600];
  }
  else
  {
    v12 = vm_vmd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to submit audio to analyzer for URL %@.", buf, 0xCu);
    }

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (NSOperationQueue)speechAnalyzerQueue
{
  return self->_speechAnalyzerQueue;
}

- (void)setSpeechAnalyzerQueue:(id)a3
{
}

- (SFSpeechAnalyzer)speechAnalyzer
{
  return (SFSpeechAnalyzer *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechAnalyzer, 0);
  objc_storeStrong((id *)&self->_speechAnalyzerQueue, 0);
}

@end