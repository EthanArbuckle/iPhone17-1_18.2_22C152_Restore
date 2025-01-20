@interface VSVoiceBooster
- (AudioStreamBasicDescription)asbd;
- (AudioTimeStamp)audioTimeStamp;
- (BOOL)initialize;
- (OpaqueAudioComponentInstance)voiceBoostUnit;
- (OpaqueAudioConverter)floatConverter;
- (OpaqueAudioConverter)integerConverter;
- (VSVoiceBooster)initWithStreamDescription:(AudioStreamBasicDescription *)a3 pcmBufferSize:(unint64_t)a4;
- (float)voiceBoostGainDecibels;
- (id)processData:(id)a3;
- (unint64_t)pcmBufferSize;
- (void)dealloc;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioTimeStamp:(AudioTimeStamp *)a3;
- (void)setFloatConverter:(OpaqueAudioConverter *)a3;
- (void)setIntegerConverter:(OpaqueAudioConverter *)a3;
- (void)setPcmBufferSize:(unint64_t)a3;
- (void)setVoiceBoostGainDecibels:(float)a3;
- (void)setVoiceBoostUnit:(OpaqueAudioComponentInstance *)a3;
- (void)uninitialize;
@end

@implementation VSVoiceBooster

- (void)setAudioTimeStamp:(AudioTimeStamp *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleTime;
  long long v4 = *(_OWORD *)&a3->mRateScalar;
  long long v5 = *(_OWORD *)&a3->mSMPTETime.mSubframes;
  *(_OWORD *)&self->_audioTimeStamp.mSMPTETime.mHours = *(_OWORD *)&a3->mSMPTETime.mHours;
  *(_OWORD *)&self->_audioTimeStamp.mSMPTETime.mSubframes = v5;
  *(_OWORD *)&self->_audioTimeStamp.mRateScalar = v4;
  *(_OWORD *)&self->_audioTimeStamp.mSampleTime = v3;
}

- (AudioTimeStamp)audioTimeStamp
{
  long long v3 = *(_OWORD *)&self[1].mSMPTETime.mType;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self[1].mWordClockTime;
  *(_OWORD *)&retstr->mRateScalar = v3;
  long long v4 = *(_OWORD *)&self[2].mHostTime;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self[1].mFlags;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (void)setVoiceBoostUnit:(OpaqueAudioComponentInstance *)a3
{
  self->_voiceBoostUnit = a3;
}

- (OpaqueAudioComponentInstance)voiceBoostUnit
{
  return self->_voiceBoostUnit;
}

- (void)setIntegerConverter:(OpaqueAudioConverter *)a3
{
  self->_integerConverter = a3;
}

- (OpaqueAudioConverter)integerConverter
{
  return self->_integerConverter;
}

- (void)setFloatConverter:(OpaqueAudioConverter *)a3
{
  self->_floatConverter = a3;
}

- (OpaqueAudioConverter)floatConverter
{
  return self->_floatConverter;
}

- (void)setPcmBufferSize:(unint64_t)a3
{
  self->_pcmBufferSize = a3;
}

- (unint64_t)pcmBufferSize
{
  return self->_pcmBufferSize;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (float)voiceBoostGainDecibels
{
  return self->_voiceBoostGainDecibels;
}

- (id)processData:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_voiceBoostUnit
    && ([(VSVoiceBooster *)self voiceBoostGainDecibels], v5 != 0.0)
    && [v4 length]
    && (AudioUnitRenderActionFlags ioActionFlags = 512,
        UInt32 v8 = [v4 length],
        UInt32 mBytesPerFrame = self->_asbd.mBytesPerFrame,
        unsigned int v10 = [(VSVoiceBooster *)self pcmBufferSize],
        [(VSVoiceBooster *)self asbd],
        mBytesPerFrame <= v8))
  {
    unsigned int v11 = 0;
    unsigned int v12 = v8 / mBytesPerFrame;
    unsigned int v13 = v10 / v30;
    while (1)
    {
      if (v12 - v11 >= v13) {
        UInt32 v14 = v13;
      }
      else {
        UInt32 v14 = v12 - v11;
      }
      [(VSVoiceBooster *)self asbd];
      UInt32 v15 = v29 * v14;
      [(VSVoiceBooster *)self asbd];
      uint64_t v16 = v28 * v11;
      *(&inInputData.mNumberBuffers + 1) = 0;
      inInputData.mBuffers[0].mData = 0;
      inInputData.mNumberBuffers = 1;
      inInputData.mBuffers[0].mNumberChannels = 1;
      inInputData.mBuffers[0].mDataByteSize = v15;
      inInputData.mBuffers[0].mData = (void *)([v4 mutableBytes] + v16);
      v17 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 2 * v15, 1, 1, 0);
      v26.mBuffers[0].mDataByteSize = [v17 length];
      id v18 = v17;
      v26.mBuffers[0].mData = (void *)[v18 mutableBytes];
      uint64_t v19 = AudioConverterConvertComplexBuffer(self->_floatConverter, v14, &inInputData, &v26);
      if (v19)
      {
        uint64_t v22 = v19;
        v23 = VSGetLogDefault();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        v24 = objc_msgSend(NSString, "vs_stringFrom4CC:", v22);
        *(_DWORD *)buf = 138412290;
        v33 = v24;
        v25 = "Error AudioConverterConvertComplexBuffer _floatConverter %@";
        goto LABEL_25;
      }
      uint64_t v20 = AudioUnitProcess(self->_voiceBoostUnit, &ioActionFlags, &self->_audioTimeStamp, v14, &v26);
      if (v20)
      {
        uint64_t v22 = v20;
        v23 = VSGetLogDefault();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        v24 = objc_msgSend(NSString, "vs_stringFrom4CC:", v22);
        *(_DWORD *)buf = 138412290;
        v33 = v24;
        v25 = "Error AudioUnitProcess _voiceBoostUnit %@";
        goto LABEL_25;
      }
      uint64_t v21 = AudioConverterConvertComplexBuffer(self->_integerConverter, v14, &v26, &inInputData);
      if (v21) {
        break;
      }
      v11 += v14;
      self->_audioTimeStamp.mSampleTime = self->_audioTimeStamp.mSampleTime + (double)v14;

      if (v11 >= v12) {
        goto LABEL_3;
      }
    }
    uint64_t v22 = v21;
    v23 = VSGetLogDefault();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    v24 = objc_msgSend(NSString, "vs_stringFrom4CC:", v22);
    *(_DWORD *)buf = 138412290;
    v33 = v24;
    v25 = "Error AudioConverterConvertComplexBuffer _integerConverter %@";
LABEL_25:
    _os_log_error_impl(&dword_226CB1000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

LABEL_23:
    v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)v22 userInfo:0];
  }
  else
  {
LABEL_3:
    v6 = 0;
  }

  return v6;
}

- (void)setVoiceBoostGainDecibels:(float)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_voiceBoostGainDecibels == a3) {
    return;
  }
  voiceBoostUnit = self->_voiceBoostUnit;
  if (voiceBoostUnit) {
    goto LABEL_5;
  }
  if ([(VSVoiceBooster *)self initialize])
  {
    voiceBoostUnit = self->_voiceBoostUnit;
LABEL_5:
    uint64_t v6 = AudioUnitSetParameter(voiceBoostUnit, 2u, 0, 0, a3, 0);
    if (v6)
    {
      uint64_t v7 = v6;
      UInt32 v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(NSString, "vs_stringFrom4CC:", v7);
        int v10 = 138412290;
        unsigned int v11 = v9;
        _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "Error AudioUnitSetParameter %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      self->_voiceBoostGainDecibels = a3;
    }
    return;
  }
  [(VSVoiceBooster *)self uninitialize];
}

- (void)uninitialize
{
  floatConverter = self->_floatConverter;
  if (floatConverter)
  {
    AudioConverterDispose(floatConverter);
    self->_floatConverter = 0;
  }
  integerConverter = self->_integerConverter;
  if (integerConverter)
  {
    AudioConverterDispose(integerConverter);
    self->_integerConverter = 0;
  }
  voiceBoostUnit = self->_voiceBoostUnit;
  if (voiceBoostUnit)
  {
    AudioComponentInstanceDispose(voiceBoostUnit);
    self->_voiceBoostUnit = 0;
  }
}

- (BOOL)initialize
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  p_asbd = &self->_asbd;
  long long v4 = *(_OWORD *)&self->_asbd.mBytesPerPacket;
  *(_OWORD *)&inDestinationFormat.mSampleRate = *(_OWORD *)&self->_asbd.mSampleRate;
  *(_OWORD *)&inDestinationFormat.mBytesPerPacket = v4;
  *(void *)&inDestinationFormat.mBitsPerChannel = *(void *)&self->_asbd.mBitsPerChannel;
  *(void *)&inDestinationFormat.mFormatFlags = 0x400000029;
  inDestinationFormat.UInt32 mBytesPerFrame = 4;
  inDestinationFormat.mBitsPerChannel = 32;
  uint64_t v5 = AudioConverterNew(&self->_asbd, &inDestinationFormat, &self->_floatConverter);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      UInt32 v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v6);
      buf.componentType = 138412290;
      *(void *)&buf.componentSubType = v8;
      v9 = "Error AudioUnitSetProperty _floatConverter %@";
LABEL_7:
      p_AudioComponentDescription buf = &buf;
LABEL_8:
      _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)p_buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = AudioConverterNew(&inDestinationFormat, p_asbd, &self->_integerConverter);
    if (!v10)
    {
      BYTE1(buf.componentFlags) = 0;
      HIWORD(buf.componentFlags) = 0;
      buf.componentFlagsMask = 0;
      strcpy((char *)&buf, "xfuakrfclppa");
      Next = AudioComponentFindNext(0, &buf);
      p_voiceBoostUnit = &self->_voiceBoostUnit;
      uint64_t v15 = AudioComponentInstanceNew(Next, &self->_voiceBoostUnit);
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v7 = VSGetLogDefault();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        UInt32 v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v16);
        int v28 = 138412290;
        int v29 = v8;
        v9 = "Error AudioComponentInstanceNew _voiceBoostUnit %@";
      }
      else
      {
        UInt32 inData = LODWORD(self->_pcmBufferSize) / self->_asbd.mBytesPerFrame;
        uint64_t v17 = AudioUnitSetProperty(self->_voiceBoostUnit, 0xEu, 0, 0, &inData, 4u);
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v7 = VSGetLogDefault();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          UInt32 v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v18);
          int v28 = 138412290;
          int v29 = v8;
          v9 = "Error AudioUnitSetProperty _voiceBoostUnit, kAudioUnitProperty_MaximumFramesPerSlice %@";
        }
        else
        {
          uint64_t v19 = AudioUnitSetProperty(*p_voiceBoostUnit, 8u, 1u, 0, &inDestinationFormat, 0x28u);
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v7 = VSGetLogDefault();
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
              goto LABEL_23;
            }
            UInt32 v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v20);
            int v28 = 138412290;
            int v29 = v8;
            v9 = "Error AudioUnitSetProperty _voiceBoostUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Input %@";
          }
          else
          {
            uint64_t v21 = AudioUnitSetProperty(*p_voiceBoostUnit, 8u, 2u, 0, &inDestinationFormat, 0x28u);
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v7 = VSGetLogDefault();
              if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
                goto LABEL_23;
              }
              UInt32 v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v22);
              int v28 = 138412290;
              int v29 = v8;
              v9 = "Error AudioUnitSetProperty _voiceBoostUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Output, %@";
            }
            else
            {
              uint64_t v23 = AudioUnitInitialize(*p_voiceBoostUnit);
              if (!v23) {
                return 1;
              }
              uint64_t v24 = v23;
              uint64_t v7 = VSGetLogDefault();
              if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
                goto LABEL_23;
              }
              UInt32 v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v24);
              int v28 = 138412290;
              int v29 = v8;
              v9 = "Error AudioUnitInitialize _voiceBoostUnit %@";
            }
          }
        }
      }
      p_AudioComponentDescription buf = (AudioComponentDescription *)&v28;
      goto LABEL_8;
    }
    uint64_t v11 = v10;
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      UInt32 v8 = objc_msgSend(NSString, "vs_stringFrom4CC:", v11);
      buf.componentType = 138412290;
      *(void *)&buf.componentSubType = v8;
      v9 = "Error AudioUnitSetProperty _integerConverter %@";
      goto LABEL_7;
    }
  }
LABEL_23:

  return 0;
}

- (void)dealloc
{
  [(VSVoiceBooster *)self uninitialize];
  v3.receiver = self;
  v3.super_class = (Class)VSVoiceBooster;
  [(VSVoiceBooster *)&v3 dealloc];
}

- (VSVoiceBooster)initWithStreamDescription:(AudioStreamBasicDescription *)a3 pcmBufferSize:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VSVoiceBooster;
  result = [(VSVoiceBooster *)&v9 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->mSampleRate;
    long long v8 = *(_OWORD *)&a3->mBytesPerPacket;
    *(void *)&result->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
    *(_OWORD *)&result->_asbd.mSampleRate = v7;
    *(_OWORD *)&result->_asbd.mBytesPerPacket = v8;
    result->_pcmBufferSize = a4;
    result->_audioTimeStamp.mFlags = 2;
  }
  return result;
}

@end