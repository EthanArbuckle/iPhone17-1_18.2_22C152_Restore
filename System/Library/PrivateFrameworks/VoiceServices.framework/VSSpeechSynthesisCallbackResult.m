@interface VSSpeechSynthesisCallbackResult
- (AudioStreamBasicDescription)asbd;
- (BOOL)hasAlignmentStall;
- (BOOL)hasAudioClick;
- (BOOL)neuralDidFallback;
- (NSError)error;
- (NSMutableArray)wordTimings;
- (NSString)text;
- (VSSpeechSynthesisCallbackResult)initWithCallback:(id)a3;
- (id).cxx_construct;
- (id)callback;
- (id)mutablePCMData;
- (id)pcmData;
- (id)phonemes;
- (id)wordTimingInfos;
- (int)synthesisCallback:(int)a3;
- (int64_t)state;
- (int64_t)stopMark;
- (unint64_t)lastUTF16Offset;
- (unint64_t)lastUTF8Offset;
- (unint64_t)numOfPromptsTriggered;
- (unint64_t)samplesProcessed;
- (unint64_t)utf16OffsetFromUTF8:(unint64_t)a3;
- (unint64_t)utf8BytesForChar:(unsigned __int16)a3;
- (void)markerBuffer;
- (void)phonemeBuffer;
- (void)processMarkerBuffer;
- (void)sampleBuffer;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setCallback:(id)a3;
- (void)setError:(id)a3;
- (void)setHasAlignmentStall:(BOOL)a3;
- (void)setHasAudioClick:(BOOL)a3;
- (void)setLastUTF16Offset:(unint64_t)a3;
- (void)setLastUTF8Offset:(unint64_t)a3;
- (void)setNeuralDidFallback:(BOOL)a3;
- (void)setNumOfPromptsTriggered:(unint64_t)a3;
- (void)setSamplesProcessed:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setStopMark:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setWordTimings:(id)a3;
@end

@implementation VSSpeechSynthesisCallbackResult

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_error, 0);
  begin = (void **)self->_phonemeBuffer.__begin_;
  if (begin)
  {
    end = (void **)self->_phonemeBuffer.__end_;
    v5 = self->_phonemeBuffer.__begin_;
    if (end != begin)
    {
      do
      {
        if (*((char *)end - 1) < 0) {
          operator delete(*(end - 3));
        }
        end -= 3;
      }
      while (end != begin);
      v5 = self->_phonemeBuffer.__begin_;
    }
    self->_phonemeBuffer.__end_ = begin;
    operator delete(v5);
  }
  if (self->_markers.__begin_)
  {
    std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100]((uint64_t *)&self->_markers);
    operator delete(self->_markers.__begin_);
  }
  v6 = self->_samples.__begin_;
  if (v6)
  {
    self->_samples.__end_ = v6;
    operator delete(v6);
  }
}

- (void)setLastUTF16Offset:(unint64_t)a3
{
  self->_lastUTF16Offset = a3;
}

- (unint64_t)lastUTF16Offset
{
  return self->_lastUTF16Offset;
}

- (void)setLastUTF8Offset:(unint64_t)a3
{
  self->_lastUTF8Offset = a3;
}

- (unint64_t)lastUTF8Offset
{
  return self->_lastUTF8Offset;
}

- (void)setSamplesProcessed:(unint64_t)a3
{
  self->_samplesProcessed = a3;
}

- (unint64_t)samplesProcessed
{
  return self->_samplesProcessed;
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
  long long v3 = *(_OWORD *)&self[4].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[4].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[5].mSampleRate;
  return self;
}

- (void)setWordTimings:(id)a3
{
}

- (NSMutableArray)wordTimings
{
  return self->_wordTimings;
}

- (void)setCallback:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setStopMark:(int64_t)a3
{
  self->_stopMark = a3;
}

- (int64_t)stopMark
{
  return self->_stopMark;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setHasAudioClick:(BOOL)a3
{
  self->_hasAudioClick = a3;
}

- (BOOL)hasAudioClick
{
  return self->_hasAudioClick;
}

- (void)setHasAlignmentStall:(BOOL)a3
{
  self->_hasAlignmentStall = a3;
}

- (BOOL)hasAlignmentStall
{
  return self->_hasAlignmentStall;
}

- (void)setNeuralDidFallback:(BOOL)a3
{
  self->_neuralDidFallback = a3;
}

- (BOOL)neuralDidFallback
{
  return self->_neuralDidFallback;
}

- (void)setNumOfPromptsTriggered:(unint64_t)a3
{
  self->_numOfPromptsTriggered = a3;
}

- (unint64_t)numOfPromptsTriggered
{
  return self->_numOfPromptsTriggered;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (id)phonemes
{
  long long v3 = [MEMORY[0x263EFF980] array];
  begin = self->_phonemeBuffer.__begin_;
  for (i = self->_phonemeBuffer.__end_; begin != i; begin += 3)
  {
    v6 = begin;
    if (*((char *)begin + 23) < 0) {
      v6 = (void *)*begin;
    }
    v7 = [NSString stringWithUTF8String:v6];
    [v3 addObject:v7];
  }
  return v3;
}

- (void)phonemeBuffer
{
  return &self->_phonemeBuffer;
}

- (id)wordTimingInfos
{
  return self->_wordTimings;
}

- (void)processMarkerBuffer
{
  begin = self->_markers.__begin_;
  end = self->_markers.__end_;
  if (begin != end)
  {
    v5 = &begin->markerName[26];
    do
    {
      long long v10 = *((_OWORD *)v5 - 2);
      long long v11 = *((_OWORD *)v5 - 1);
      if ((char)v5[23] < 0) {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      }
      else {
        std::string __p = *(std::string *)v5;
      }
      if (v10 == 2)
      {
        ++self->_numOfPromptsTriggered;
      }
      else if (!v10)
      {
        v6 = objc_alloc_init(VSSpeechWordTimingInfo);
        [(VSSpeechSynthesisCallbackResult *)self asbd];
        [(VSSpeechWordTimingInfo *)v6 setStartTime:(double)*((unint64_t *)&v11 + 1) / v9];
        unint64_t v7 = [(VSSpeechSynthesisCallbackResult *)self utf16OffsetFromUTF8:*((void *)&v10 + 1)];
        -[VSSpeechWordTimingInfo setTextRange:](v6, "setTextRange:", v7, [(VSSpeechSynthesisCallbackResult *)self utf16OffsetFromUTF8:(void)v11 + *((void *)&v10 + 1)]- v7);
        [(NSMutableArray *)self->_wordTimings addObject:v6];
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      v8 = v5 - 32;
      v5 += 56;
    }
    while (v8 + 56 != (unsigned __int8 *)end);
  }
}

- (unint64_t)utf16OffsetFromUTF8:(unint64_t)a3
{
  unint64_t lastUTF8Offset = self->_lastUTF8Offset;
  BOOL v6 = lastUTF8Offset > a3;
  if (lastUTF8Offset >= a3)
  {
    while (v6)
    {
      unint64_t lastUTF16Offset = self->_lastUTF16Offset;
      if (!lastUTF16Offset) {
        break;
      }
      text = self->_text;
      self->_unint64_t lastUTF16Offset = lastUTF16Offset - 1;
      unint64_t v15 = self->_lastUTF8Offset
          - -[VSSpeechSynthesisCallbackResult utf8BytesForChar:](self, "utf8BytesForChar:", -[NSString characterAtIndex:](text, "characterAtIndex:"));
      self->_unint64_t lastUTF8Offset = v15;
      BOOL v6 = v15 > a3;
    }
  }
  else
  {
    NSUInteger v7 = [(NSString *)self->_text length];
    if (self->_lastUTF8Offset < a3)
    {
      NSUInteger v8 = v7;
      do
      {
        unint64_t v9 = self->_lastUTF16Offset;
        if (v9 >= v8) {
          break;
        }
        long long v10 = self->_text;
        self->_unint64_t lastUTF16Offset = v9 + 1;
        unint64_t v11 = self->_lastUTF8Offset
            + -[VSSpeechSynthesisCallbackResult utf8BytesForChar:](self, "utf8BytesForChar:", -[NSString characterAtIndex:](v10, "characterAtIndex:"));
        self->_unint64_t lastUTF8Offset = v11;
      }
      while (v11 < a3);
    }
  }
  return self->_lastUTF16Offset;
}

- (unint64_t)utf8BytesForChar:(unsigned __int16)a3
{
  unint64_t v3 = 1;
  uint64_t v4 = 2;
  if (a3 >= 0x7FFu) {
    uint64_t v4 = 3;
  }
  if (a3 >= 0x7Fu) {
    unint64_t v3 = v4;
  }
  if ((a3 & 0xF800) == 0xD800) {
    return 2;
  }
  else {
    return v3;
  }
}

- (void)markerBuffer
{
  return &self->_markers;
}

- (void)sampleBuffer
{
  return &self->_samples;
}

- (id)mutablePCMData
{
  return (id)[MEMORY[0x263EFF990] dataWithBytesNoCopy:self->_samples.__begin_ length:self->_samples.__end_ - self->_samples.__begin_ freeWhenDone:0];
}

- (id)pcmData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:self->_samples.__begin_ length:self->_samples.__end_ - self->_samples.__begin_ freeWhenDone:0];
}

- (int)synthesisCallback:(int)a3
{
  switch(a3)
  {
    case 0:
      self->_state = 1;
      self->_unint64_t lastUTF8Offset = 0;
      self->_unint64_t lastUTF16Offset = 0;
      self->_samplesProcessed = 0;
      (*((void (**)(void))self->_callback + 2))();
      uint64_t v4 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v4;

      [(NSMutableArray *)self->_wordTimings removeAllObjects];
      return self->_error != 0;
    case 1:
      self->_state = 3;
      (*((void (**)(void))self->_callback + 2))();
      v45 = (NSError *)objc_claimAutoreleasedReturnValue();
      v46 = self->_error;
      self->_error = v45;

      id callback = self->_callback;
      self->_id callback = 0;

      return self->_error != 0;
    case 4:
      self->_state = 2;
      if (self->_stopMark == 1)
      {
        begin = self->_markers.__begin_;
        end = self->_markers.__end_;
        if (begin != end)
        {
          v52 = self->_markers.__end_;
          do
          {
            long long v8 = *(_OWORD *)&begin->markerName[10];
            long long v54 = *(_OWORD *)&begin->id;
            long long v55 = v8;
            if ((char)begin->markerName[49] < 0)
            {
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)&begin->markerName[26], *(void *)&begin->markerName[34]);
            }
            else
            {
              long long v9 = *(_OWORD *)&begin->markerName[26];
              __p.__r_.__value_.__r.__words[2] = *(void *)&begin->markerName[42];
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
            }
            if (v54) {
              goto LABEL_10;
            }
            uint64_t v10 = *((void *)&v55 + 1);
            [(VSSpeechSynthesisCallbackResult *)self asbd];
            unint64_t v11 = v10 * v53;
            v12 = self->_samples.__begin_;
            v13 = self->_samples.__end_;
            if (v11 <= v13 - v12)
            {
              long long v21 = 0uLL;
              if (v11 < v13 - v12) {
                self->_samples.__end_ = &v12[v11];
              }
              goto LABEL_33;
            }
            value = self->_samples.__end_cap_.__value_;
            if (value - v13 >= v11 - (v13 - v12))
            {
              bzero(self->_samples.__end_, v11 - (v13 - v12));
              self->_samples.__end_ = &v12[v11];
            }
            else
            {
              if ((v11 & 0x8000000000000000) != 0) {
                std::vector<TTSSynthesizer::Marker>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v15 = value - v12;
              uint64_t v16 = 2 * v15;
              if (2 * v15 <= v11) {
                uint64_t v16 = v11;
              }
              if (v15 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v17 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v17 = v16;
              }
              v18 = (char *)operator new(v17);
              v19 = &v18[v13 - v12];
              bzero(v19, v11 - (v13 - v12));
              if (v13 == v12)
              {
                long long v21 = 0uLL;
              }
              else
              {
                v20 = &v13[~(unint64_t)v12];
                long long v21 = 0uLL;
                do
                {
                  char v22 = *--v13;
                  (v20--)[(void)v18] = v22;
                }
                while (v13 != v12);
                v13 = self->_samples.__begin_;
                v19 = v18;
              }
              self->_samples.__begin_ = v19;
              self->_samples.__end_ = &v18[v11];
              self->_samples.__end_cap_.__value_ = &v18[v17];
              if (!v13) {
                goto LABEL_33;
              }
              operator delete(v13);
            }
            long long v21 = 0uLL;
LABEL_33:
            v23 = self->_markers.__begin_;
            v24 = self->_markers.__end_;
            unint64_t v25 = 0x6DB6DB6DB6DB6DB7 * (((char *)&v54 - (char *)v23) >> 3) + 1;
            unint64_t v26 = 0x6DB6DB6DB6DB6DB7 * (((char *)v24 - (char *)v23) >> 3);
            BOOL v27 = v25 >= v26;
            unint64_t v28 = v25 - v26;
            if (v25 <= v26)
            {
              end = v52;
              if (!v27)
              {
                v43 = (Marker *)((char *)v23 + 56 * v25);
                while (v24 != v43)
                {
                  if ((char)v24[-1].markerName[255] < 0) {
                    operator delete(*(void **)&v24[-1].markerName[232]);
                  }
                  v24 = (Marker *)((char *)v24 - 56);
                }
                self->_markers.__end_ = v43;
              }
              goto LABEL_10;
            }
            v29 = self->_markers.__end_cap_.__value_;
            if (0x6DB6DB6DB6DB6DB7 * (((char *)v29 - (char *)v24) >> 3) >= v28)
            {
              v44 = (Marker *)((char *)v24 + 56 * v28);
              end = v52;
              do
              {
                *(void *)&v24->markerName[42] = 0;
                *(_OWORD *)&v24->markerName[10] = v21;
                *(_OWORD *)&v24->markerName[26] = v21;
                *(_OWORD *)&v24->id = v21;
                v24->markerName[49] = 1;
                v24 = (Marker *)((char *)v24 + 56);
              }
              while (v24 != v44);
              self->_markers.__end_ = v44;
              goto LABEL_10;
            }
            if (v25 > 0x492492492492492) {
              std::vector<TTSSynthesizer::Marker>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v30 = 0x6DB6DB6DB6DB6DB7 * (((char *)v29 - (char *)v23) >> 3);
            uint64_t v31 = 2 * v30;
            if (2 * v30 <= v25) {
              uint64_t v31 = v25;
            }
            if (v30 >= 0x249249249249249) {
              unint64_t v32 = 0x492492492492492;
            }
            else {
              unint64_t v32 = v31;
            }
            if (v32 > 0x492492492492492) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v33 = (char *)operator new(56 * v32);
            v34 = (Marker *)&v33[56 * v26];
            v35 = (Marker *)&v33[56 * v25];
            v36 = v34;
            do
            {
              *(void *)&v36->markerName[42] = 0;
              *(_OWORD *)&v36->markerName[10] = 0uLL;
              *(_OWORD *)&v36->markerName[26] = 0uLL;
              *(_OWORD *)&v36->id = 0uLL;
              v36->markerName[49] = 1;
              v36 = (Marker *)((char *)v36 + 56);
            }
            while (v36 != v35);
            v37 = (Marker *)&v33[56 * v32];
            v38 = self->_markers.__begin_;
            v39 = self->_markers.__end_;
            end = v52;
            if (v39 != v38)
            {
              do
              {
                long long v40 = *(_OWORD *)&v39[-1].markerName[200];
                *(_OWORD *)&v34[-1].markerName[216] = *(_OWORD *)&v39[-1].markerName[216];
                *(_OWORD *)&v34[-1].markerName[200] = v40;
                long long v41 = *(_OWORD *)&v39[-1].markerName[232];
                *(void *)&v34[-1].markerName[248] = *(void *)&v39[-1].markerName[248];
                *(_OWORD *)&v34[-1].markerName[232] = v41;
                v34 = (Marker *)((char *)v34 - 56);
                *(void *)&v39[-1].markerName[240] = 0;
                *(void *)&v39[-1].markerName[248] = 0;
                *(void *)&v39[-1].markerName[232] = 0;
                v39 = (Marker *)((char *)v39 - 56);
              }
              while (v39 != v38);
              v42 = self->_markers.__begin_;
              v39 = self->_markers.__end_;
              self->_markers.__begin_ = v34;
              self->_markers.__end_ = v35;
              self->_markers.__end_cap_.__value_ = v37;
              if (v39 != v42)
              {
                do
                {
                  if ((char)v39[-1].markerName[255] < 0) {
                    operator delete(*(void **)&v39[-1].markerName[232]);
                  }
                  v39 = (Marker *)((char *)v39 - 56);
                }
                while (v39 != v42);
                v39 = v42;
              }
              if (!v39) {
                goto LABEL_10;
              }
LABEL_64:
              operator delete(v39);
              goto LABEL_10;
            }
            self->_markers.__begin_ = v34;
            self->_markers.__end_ = v35;
            self->_markers.__end_cap_.__value_ = v37;
            if (v39) {
              goto LABEL_64;
            }
LABEL_10:
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            begin = (Marker *)((char *)begin + 56);
          }
          while (begin != end);
        }
      }
      (*((void (**)(void))self->_callback + 2))();
      v48 = (NSError *)objc_claimAutoreleasedReturnValue();
      v49 = self->_error;
      self->_error = v48;

      unint64_t v50 = self->_samples.__end_ - self->_samples.__begin_;
      [(VSSpeechSynthesisCallbackResult *)self asbd];
      self->_samplesProcessed += v50 / DWORD2(v55);
      self->_samples.__end_ = self->_samples.__begin_;
      return self->_error != 0;
    case 5:
      [(VSSpeechSynthesisCallbackResult *)self processMarkerBuffer];
      std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100]((uint64_t *)&self->_markers);
      return self->_error != 0;
    default:
      return self->_error != 0;
  }
}

- (VSSpeechSynthesisCallbackResult)initWithCallback:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSSpeechSynthesisCallbackResult;
  v5 = [(VSSpeechSynthesisCallbackResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x210554730](v4);
    id callback = v5->_callback;
    v5->_id callback = (id)v6;

    long long v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    wordTimings = v5->_wordTimings;
    v5->_wordTimings = v8;
  }
  return v5;
}

@end