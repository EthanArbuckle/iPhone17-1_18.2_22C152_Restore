@interface SiriTTSOspreyStreamingPartialResponse
+ (void)processServerLogs:(id)a3;
- (AudioStreamBasicDescription)asbd;
- (NSArray)timingInfos;
- (NSData)audioData;
- (SiriTTSOspreyStreamingPartialResponse)initWithOspreyPartialResponse:(id)a3;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
@end

@implementation SiriTTSOspreyStreamingPartialResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingInfos, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
}

- (NSArray)timingInfos
{
  return self->_timingInfos;
}

- (NSData)audioData
{
  return self->_audioData;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[1].mBytesPerPacket;
  return self;
}

- (SiriTTSOspreyStreamingPartialResponse)initWithOspreyPartialResponse:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SiriTTSOspreyStreamingPartialResponse;
  v5 = [(SiriTTSOspreyStreamingPartialResponse *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 audio];
    audioData = v5->_audioData;
    v5->_audioData = (NSData *)v6;

    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v4;
    v9 = objc_msgSend(v4, "word_timing_info");
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
          v15 = objc_alloc_init(SiriTTSOspreyWordTimingInfo);
          -[SiriTTSOspreyWordTimingInfo setTextRange:](v15, "setTextRange:", [v14 offset], objc_msgSend(v14, "length"));
          [v14 timestamp];
          [(SiriTTSOspreyWordTimingInfo *)v15 setTimestamp:v16];
          [(NSArray *)v8 addObject:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    timingInfos = v5->_timingInfos;
    v5->_timingInfos = v8;

    id v4 = v19;
  }

  return v5;
}

+ (void)processServerLogs:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  [a3 feature];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v54 = long long v80 = 0u;
  long long v3 = [v54 replacement];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v78 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        v9 = TTSGetServiceLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = [v8 original];
          uint64_t v11 = [v8 replacement];
          *(_DWORD *)buf = 138412546;
          v87 = v10;
          __int16 v88 = 2112;
          v89 = v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v77 objects:v90 count:16];
    }
    while (v5);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v12 = [v54 prompts];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v73 objects:v85 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v74 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        v18 = [v17 prompts];
        uint64_t v19 = [v18 count];

        if (v19)
        {
          long long v20 = TTSGetServiceLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            long long v21 = [v17 prompts];
            long long v22 = [v21 componentsJoinedByString:@" "];
            *(_DWORD *)buf = 138412290;
            v87 = v22;
            _os_log_impl(&dword_19CD9A000, v20, OS_LOG_TYPE_INFO, "Prompt: \"%@\"", buf, 0xCu);
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v73 objects:v85 count:16];
    }
    while (v14);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  objc_msgSend(v54, "phoneme_sequence");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v56 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v70 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v69 + 1) + 8 * k);
        v27 = [MEMORY[0x1E4F1CA48] array];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v28 = objc_msgSend(v26, "word_phonemes");
        uint64_t v29 = [v28 countByEnumeratingWithState:&v65 objects:v83 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v66;
          do
          {
            for (uint64_t m = 0; m != v30; ++m)
            {
              if (*(void *)v66 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = [*(id *)(*((void *)&v65 + 1) + 8 * m) phonemes];
              v34 = [v33 componentsJoinedByString:@" "];
              [v27 addObject:v34];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v65 objects:v83 count:16];
          }
          while (v30);
        }

        v35 = TTSGetServiceLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = [v27 componentsJoinedByString:@" _ "];
          *(_DWORD *)buf = 138412290;
          v87 = v36;
          _os_log_impl(&dword_19CD9A000, v35, OS_LOG_TYPE_INFO, "Phonemes: %@", buf, 0xCu);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
    }
    while (v24);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v37 = objc_msgSend(v54, "normalized_text");
  uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v82 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v62;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v61 + 1) + 8 * n);
        v43 = TTSGetServiceLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = [v42 text];
          *(_DWORD *)buf = 138412290;
          v87 = v44;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v61 objects:v82 count:16];
    }
    while (v39);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v45 = objc_msgSend(v54, "neural_phoneme_sequence");
  uint64_t v46 = [v45 countByEnumeratingWithState:&v57 objects:v81 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v58;
    do
    {
      for (iuint64_t i = 0; ii != v47; ++ii)
      {
        if (*(void *)v58 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v57 + 1) + 8 * ii);
        v51 = TTSGetServiceLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = [v50 phonemes];
          v53 = [v52 componentsJoinedByString:@" "];
          *(_DWORD *)buf = 138412290;
          v87 = v53;
          _os_log_impl(&dword_19CD9A000, v51, OS_LOG_TYPE_INFO, "Neural Phonemes: %@", buf, 0xCu);
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v57 objects:v81 count:16];
    }
    while (v47);
  }
}

@end