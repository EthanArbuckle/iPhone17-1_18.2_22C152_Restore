@interface SSREnrollmentDataManager
+ (BOOL)saveMetadata:(id)a3;
+ (BOOL)saveUtterance:(id)a3 utteranceAudioPath:(id)a4 numSamplesToWrite:(unint64_t)a5;
+ (BOOL)saveUtteranceAndMetadata:(id)a3 atDirectory:(id)a4;
+ (BOOL)writeMetaDict:(id)a3 atMetaPath:(id)a4;
+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3;
+ (void)saveRawUtteranceAndMetadata:(id)a3 to:(id)a4 isExplicitEnrollment:(BOOL)a5;
@end

@implementation SSREnrollmentDataManager

+ (BOOL)writeMetaDict:(id)a3 atMetaPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    v10 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      char v9 = 0;
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v18 = "+[SSREnrollmentDataManager writeMetaDict:atMetaPath:]";
    v11 = "%s ERR: called with nil metaPath";
LABEL_15:
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    goto LABEL_8;
  }
  if (!v5)
  {
    v10 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315138;
    v18 = "+[SSREnrollmentDataManager writeMetaDict:atMetaPath:]";
    v11 = "%s ERR: called with nil uttMeta";
    goto LABEL_15;
  }
  id v16 = 0;
  v7 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:3 error:&v16];
  id v8 = v16;
  if (v7)
  {
    char v9 = [v7 writeToFile:v6 atomically:1];
  }
  else
  {
    v12 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      v15 = [v8 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v18 = "+[SSREnrollmentDataManager writeMetaDict:atMetaPath:]";
      __int16 v19 = 2114;
      v20 = v15;
      _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s Cannot create json file : %{public}@", buf, 0x16u);
    }
    char v9 = 0;
  }

LABEL_13:
  return v9;
}

+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x263F380D0], "deviceProductType", @"productType");
    v10[0] = v4;
    v9[1] = @"productVersion";
    id v5 = [MEMORY[0x263F380D0] deviceProductVersion];
    v9[2] = @"utteranceWav";
    v10[1] = v5;
    v10[2] = v3;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  }
  else
  {
    v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "+[SSREnrollmentDataManager _getBaseMetaDictionaryForUtterancePath:]";
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: called with nil uttPath", buf, 0xCu);
    }
    id v6 = (void *)MEMORY[0x263EFFA78];
  }

  return v6;
}

+ (BOOL)saveMetadata:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"];
    v7 = (void *)MEMORY[0x263EFF9A0];
    id v8 = [a1 _getBaseMetaDictionaryForUtterancePath:v6];
    char v9 = [v7 dictionaryWithDictionary:v8];

    [v9 setObject:@"explicit" forKeyedSubscript:@"trainingType"];
    v10 = [MEMORY[0x263F380D0] timeStampWithSaltGrain];
    [v9 setObject:v10 forKeyedSubscript:@"grainedDate"];

    char v11 = [a1 writeMetaDict:v9 atMetaPath:v5];
  }
  else
  {
    v12 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "+[SSREnrollmentDataManager saveMetadata:]";
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s ERR: called with nil metaPath", (uint8_t *)&v14, 0xCu);
    }
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)saveUtterance:(id)a3 utteranceAudioPath:(id)a4 numSamplesToWrite:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = (os_log_t *)MEMORY[0x263F38100];
  v10 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:]";
    __int16 v27 = 2050;
    unint64_t v28 = a5;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s numSamplesToWrite %{public}lu", buf, 0x16u);
  }
  id v11 = v7;
  v12 = v11;
  if ([MEMORY[0x263F38018] inputRecordingIsFloat])
  {
    v12 = [MEMORY[0x263F38048] convertToShortLPCMBufFromFloatLPCMBuf:v11];
  }
  id v13 = objc_alloc(MEMORY[0x263F380B0]);
  int v14 = [NSURL URLWithString:v8];
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  v15 = (void *)[v13 initWithURL:v14 inputFormat:v24 outputFormat:&v23];

  if (!v15)
  {
    os_log_t v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:]";
      v18 = "%s Failed to get CSAudioFileWriter:";
      __int16 v19 = v17;
      uint32_t v20 = 12;
LABEL_16:
      _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v15, "addSamples:numSamples:", objc_msgSend(v12, "bytes"), a5) & 1) == 0)
  {
    os_log_t v21 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:]";
      __int16 v27 = 2114;
      unint64_t v28 = (unint64_t)v15;
      v18 = "%s Failed to addSamples to CSAudioFileWriter: %{public}@";
LABEL_15:
      __int16 v19 = v21;
      uint32_t v20 = 22;
      goto LABEL_16;
    }
LABEL_17:
    BOOL v16 = 0;
    goto LABEL_18;
  }
  if (([v15 endAudio] & 1) == 0)
  {
    os_log_t v21 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:]";
      __int16 v27 = 2114;
      unint64_t v28 = (unint64_t)v15;
      v18 = "%s Failed to endAudio on CSAudioFileWriter: %{public}@";
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

+ (BOOL)saveUtteranceAndMetadata:(id)a3 atDirectory:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08C38] UUID];
  char v9 = [v8 UUIDString];

  v10 = [v9 stringByAppendingString:@".wav"];
  id v11 = [v9 stringByAppendingString:@".json"];
  v12 = [v7 stringByAppendingPathComponent:v10];
  id v13 = [v7 stringByAppendingPathComponent:v11];
  unint64_t v14 = [v6 length];
  unsigned int v15 = [MEMORY[0x263F38018] inputRecordingSampleByteDepth];
  BOOL v16 = *MEMORY[0x263F38100];
  unint64_t v17 = v14 / v15;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315906;
    os_log_t v21 = "+[SSREnrollmentDataManager saveUtteranceAndMetadata:atDirectory:]";
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2114;
    __int16 v27 = @"explicit";
    _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Saving %{public}@ at %{public}@ as %{public}@ training.", (uint8_t *)&v20, 0x2Au);
  }
  if ([a1 saveUtterance:v6 utteranceAudioPath:v12 numSamplesToWrite:v17]) {
    char v18 = [a1 saveMetadata:v13];
  }
  else {
    char v18 = 0;
  }

  return v18;
}

+ (void)saveRawUtteranceAndMetadata:(id)a3 to:(id)a4 isExplicitEnrollment:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (os_log_t *)MEMORY[0x263F38100];
  id v11 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v12 = @"implicit";
    if (v5) {
      v12 = @"explicit";
    }
    int v20 = 136315394;
    os_log_t v21 = "+[SSREnrollmentDataManager saveRawUtteranceAndMetadata:to:isExplicitEnrollment:]";
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Saving utterance and meta as %{public}@ training.", (uint8_t *)&v20, 0x16u);
  }
  id v13 = [MEMORY[0x263F08C38] UUID];
  unint64_t v14 = [v13 UUIDString];

  unsigned int v15 = [v14 stringByAppendingString:@".wav"];
  BOOL v16 = [v14 stringByAppendingString:@".json"];
  unint64_t v17 = [v9 stringByAppendingPathComponent:v15];
  char v18 = [v9 stringByAppendingPathComponent:v16];
  if ([v8 writeToFile:v17 atomically:1])
  {
    [a1 saveMetadata:v18];
  }
  else
  {
    __int16 v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315394;
      os_log_t v21 = "+[SSREnrollmentDataManager saveRawUtteranceAndMetadata:to:isExplicitEnrollment:]";
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Failed to write utterance into %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
}

@end