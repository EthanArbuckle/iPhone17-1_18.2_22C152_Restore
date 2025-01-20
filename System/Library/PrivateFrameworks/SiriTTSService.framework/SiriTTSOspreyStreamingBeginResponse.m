@interface SiriTTSOspreyStreamingBeginResponse
- (AudioStreamBasicDescription)asbd;
- (NSString)resourceLanguage;
- (NSString)voiceFootprint;
- (NSString)voiceGender;
- (NSString)voiceLanguage;
- (NSString)voiceName;
- (NSString)voiceType;
- (SiriTTSOspreyStreamingBeginResponse)initWithOspreyBeginResponse:(id)a3;
- (double)bufferDuration;
- (int64_t)resourceVersion;
- (int64_t)voiceVersion;
@end

@implementation SiriTTSOspreyStreamingBeginResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLanguage, 0);
  objc_storeStrong((id *)&self->_voiceGender, 0);
  objc_storeStrong((id *)&self->_voiceType, 0);
  objc_storeStrong((id *)&self->_voiceFootprint, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
}

- (double)bufferDuration
{
  return self->_bufferDuration;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[2].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[2].mBitsPerChannel;
  return self;
}

- (int64_t)resourceVersion
{
  return self->_resourceVersion;
}

- (NSString)resourceLanguage
{
  return self->_resourceLanguage;
}

- (int64_t)voiceVersion
{
  return self->_voiceVersion;
}

- (NSString)voiceGender
{
  return self->_voiceGender;
}

- (NSString)voiceType
{
  return self->_voiceType;
}

- (NSString)voiceFootprint
{
  return self->_voiceFootprint;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (SiriTTSOspreyStreamingBeginResponse)initWithOspreyBeginResponse:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SiriTTSOspreyStreamingBeginResponse;
  v5 = [(SiriTTSOspreyStreamingBeginResponse *)&v45 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "meta_info");
    v7 = [v6 voice];
    v8 = [v7 language];
    uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    voiceLanguage = v5->_voiceLanguage;
    v5->_voiceLanguage = (NSString *)v9;

    v11 = objc_msgSend(v4, "meta_info");
    v12 = [v11 voice];
    uint64_t v13 = [v12 name];
    voiceName = v5->_voiceName;
    v5->_voiceName = (NSString *)v13;

    v15 = objc_msgSend(v4, "meta_info");
    v16 = [v15 voice];
    v17 = [v16 version];
    v5->_voiceVersion = [v17 integerValue];

    v18 = objc_msgSend(v4, "meta_info");
    v19 = [v18 voice];
    uint64_t v20 = [v19 quality];
    voiceFootprint = v5->_voiceFootprint;
    v5->_voiceFootprint = (NSString *)v20;

    v22 = objc_msgSend(v4, "meta_info");
    v23 = [v22 voice];
    uint64_t v24 = [v23 type];
    voiceType = v5->_voiceType;
    v5->_voiceType = (NSString *)v24;

    v26 = objc_msgSend(v4, "meta_info");
    v27 = [v26 voice];
    uint64_t v28 = [v27 gender];
    voiceGender = v5->_voiceGender;
    v5->_voiceGender = (NSString *)v28;

    v30 = objc_msgSend(v4, "meta_info");
    v31 = [v30 resource];
    v32 = [v31 language];
    uint64_t v33 = [v32 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    resourceLanguage = v5->_resourceLanguage;
    v5->_resourceLanguage = (NSString *)v33;

    v35 = objc_msgSend(v4, "meta_info");
    v36 = [v35 resource];
    v37 = [v36 version];
    v5->_resourceVersion = [v37 integerValue];

    objc_msgSend(v4, "streaming_playback_buffer_size_in_seconds");
    v5->_bufferDuration = v38;
    v39 = objc_msgSend(v4, "decoder_description");
    v40 = v39;
    if (v39)
    {
      [v39 audioStreamBasicDescription];
    }
    else
    {
      uint64_t v44 = 0;
      long long v42 = 0u;
      long long v43 = 0u;
    }
    *(_OWORD *)&v5->_asbd.mSampleRate = v42;
    *(_OWORD *)&v5->_asbd.mBytesPerPacket = v43;
    *(void *)&v5->_asbd.mBitsPerChannel = v44;
  }
  return v5;
}

@end