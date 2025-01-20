@interface TTSMauiVocalizerBuffer
- (AVAudioPCMBuffer)audioBuffer;
- (NSArray)markers;
- (TTSMauiVocalizerBuffer)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)computeMarkers:(id)a3;
- (void)fillInOutDataForBuffer:(id *)a3;
- (void)rawAudioBufferPointer;
- (void)reset;
- (void)setAudioBuffer:(id)a3;
- (void)setMarkers:(id)a3;
@end

@implementation TTSMauiVocalizerBuffer

- (TTSMauiVocalizerBuffer)init
{
  v9.receiver = self;
  v9.super_class = (Class)TTSMauiVocalizerBuffer;
  v2 = [(TTSMauiVocalizerBuffer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    markers = v2->_markers;
    v2->_markers = (NSArray *)MEMORY[0x263EFFA68];

    id v5 = objc_alloc(MEMORY[0x263EF93A8]);
    v6 = (void *)[objc_alloc(MEMORY[0x263EF9390]) initWithStreamDescription:&kMauiAudioFormat];
    v7 = (void *)[v5 initWithPCMFormat:v6 frameCapacity:256];
    [(TTSMauiVocalizerBuffer *)v3 setAudioBuffer:v7];
  }
  return v3;
}

- (void)computeMarkers:(id)a3
{
  id v18 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  if (self->markerCount)
  {
    unint64_t v5 = 0;
    p_szValue = &self->markerBuffer[0].szValue;
    do
    {
      int v7 = *((_DWORD *)p_szValue - 12);
      if (v7 == 8)
      {
        v16 = *p_szValue;
        id v11 = objc_alloc_init(MEMORY[0x263F7EEB0]);
        v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, objc_msgSend(NSString, "defaultCStringEncoding"));
        [v11 setName:v17];
      }
      else
      {
        unint64_t v8 = (unint64_t)*(p_szValue - 4);
        if (v7 != 2 || v8 == 0) {
          goto LABEL_12;
        }
        unint64_t v10 = (unint64_t)*(p_szValue - 5);
        id v11 = objc_alloc_init(MEMORY[0x263F7EF00]);
        objc_msgSend(v11, "setWordRange:", v10 >> 1, v8 >> 1);
        if (v18)
        {
          uint64_t v12 = [v11 wordRange];
          uint64_t v14 = objc_msgSend(v18, "translateRangeInTransformedString:", v12, v13);
          objc_msgSend(v11, "setWordRange:", v14, v15);
        }
      }
      [v4 addObject:v11];

LABEL_12:
      ++v5;
      p_szValue += 7;
    }
    while (self->markerCount > v5);
  }
  [(TTSMauiVocalizerBuffer *)self setMarkers:v4];
}

- (void)rawAudioBufferPointer
{
  v2 = [(TTSMauiVocalizerBuffer *)self audioBuffer];
  v3 = *(void **)([v2 audioBufferList] + 16);

  return v3;
}

- (void)reset
{
  v3 = [(TTSMauiVocalizerBuffer *)self audioBuffer];
  [v3 setFrameLength:0];

  [(TTSMauiVocalizerBuffer *)self setMarkers:MEMORY[0x263EFFA68]];
  self->markerCount = 0;
}

- (void)fillInOutDataForBuffer:(id *)a3
{
  a3->var4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->markerBuffer;
  a3->var2 = [(TTSMauiVocalizerBuffer *)self rawAudioBufferPointer];
  a3->var3 = 1792;
  id v6 = [(TTSMauiVocalizerBuffer *)self audioBuffer];
  unint64_t v5 = [v6 format];
  a3->var1 = (*(_DWORD *)([v5 streamDescription] + 24) << 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(TTSMauiVocalizerBuffer);
  memcpy(v4->markerBuffer, self->markerBuffer, 0x708uLL);
  unint64_t v5 = [(TTSMauiVocalizerBuffer *)self audioBuffer];
  id v6 = (void *)[v5 copy];
  [(TTSMauiVocalizerBuffer *)v4 setAudioBuffer:v6];

  int v7 = [(TTSMauiVocalizerBuffer *)self markers];
  [(TTSMauiVocalizerBuffer *)v4 setMarkers:v7];

  unint64_t markerCount = v4->markerCount;
  if (markerCount)
  {
    unint64_t v9 = 0;
    p_szValue = &v4->markerBuffer[0].szValue;
    id v11 = &self->markerBuffer[0].szValue;
    do
    {
      if (*v11)
      {
        size_t v12 = strlen(*v11);
        uint64_t v13 = (char *)malloc_type_calloc(v12, 1uLL, 0x100004077774924uLL);
        *p_szValue = v13;
        strncpy(v13, *v11, v12);
        unint64_t markerCount = v4->markerCount;
      }
      ++v9;
      p_szValue += 7;
      v11 += 7;
    }
    while (markerCount > v9);
  }
  return v4;
}

- (AVAudioPCMBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
}

- (NSArray)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markers, 0);

  objc_storeStrong((id *)&self->_audioBuffer, 0);
}

@end