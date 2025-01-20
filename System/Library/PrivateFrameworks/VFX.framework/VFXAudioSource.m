@interface VFXAudioSource
+ (BOOL)supportsSecureCoding;
+ (VFXAudioSource)audioSourceWithAVAudioPCMBuffer:(id)a3;
+ (id)audioSourceNamed:(id)a3;
- (BOOL)isPositional;
- (BOOL)loops;
- (BOOL)shouldStream;
- (VFXAudioSource)initWithAVAudioPCMBuffer:(id)a3;
- (VFXAudioSource)initWithCoder:(id)a3;
- (VFXAudioSource)initWithFileNamed:(id)a3;
- (VFXAudioSource)initWithFileNamed:(id)a3 inBundle:(id)a4;
- (VFXAudioSource)initWithURL:(id)a3;
- (double)duration;
- (float)rate;
- (float)reverbBlend;
- (float)volume;
- (id)audioBuffer;
- (id)audioBufferFormat;
- (id)audioFile;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileName;
- (int64_t)renderingAlgorithm;
- (void)_customDecodingOfVFXAudioSource:(id)a3;
- (void)_customEncodingOfVFXAudioSource:(id)a3;
- (void)_load;
- (void)_loadURLWithBundle:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)load;
- (void)loadIfNeeded;
- (void)setLoops:(BOOL)a3;
- (void)setPositional:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setReverbBlend:(float)a3;
- (void)setShouldStream:(BOOL)a3;
- (void)setVolume:(float)a3;
@end

@implementation VFXAudioSource

+ (VFXAudioSource)audioSourceWithAVAudioPCMBuffer:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  v7 = objc_msgSend_initWithAVAudioPCMBuffer_(v4, v5, (uint64_t)a3, v6);

  return (VFXAudioSource *)v7;
}

- (VFXAudioSource)initWithAVAudioPCMBuffer:(id)a3
{
  v5 = (VFXAudioSource *)objc_msgSend_init(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    v5->_audioBuffer = (AVAudioPCMBuffer *)a3;
    objc_msgSend_setPositional_(v5, v6, 1, v7);
    LODWORD(v8) = 1.0;
    objc_msgSend_setVolume_(v5, v9, v10, v11, v8);
    LODWORD(v12) = 1.0;
    objc_msgSend_setRate_(v5, v13, v14, v15, v12);
  }
  return v5;
}

- (int64_t)renderingAlgorithm
{
  if (objc_msgSend_isPositional(self, a2, v2, v3)) {
    return 0;
  }
  else {
    return 5;
  }
}

- (void)_loadURLWithBundle:(id)a3
{
  audioName = self->_audioName;
  if (audioName)
  {
    uint64_t v7 = objc_msgSend_pathExtension(audioName, a2, (uint64_t)a3, v3);
    if (v7 && (uint64_t v11 = (uint64_t)v7, objc_msgSend_length(v7, v8, v9, v10)))
    {
      uint64_t v14 = objc_msgSend_stringByDeletingPathExtension(self->_audioName, v8, v12, v13);
      v16 = objc_msgSend_URLForResource_withExtension_(a3, v15, v14, v11);
    }
    else
    {
      v16 = objc_msgSend_URLForResource_withExtension_(a3, v8, (uint64_t)self->_audioName, @"caf");
      if (v16) {
        goto LABEL_9;
      }
      v16 = objc_msgSend_URLForResource_withExtension_(a3, v23, (uint64_t)self->_audioName, @"caff");
      if (v16) {
        goto LABEL_9;
      }
      v16 = objc_msgSend_URLForResource_withExtension_(a3, v24, (uint64_t)self->_audioName, @"aiff");
    }
    if (!v16)
    {
      sub_1B63F2F54(16, @"Error: failed to load audio source at %@", v17, v18, v19, v20, v21, v22, (uint64_t)self->_audioName);
      v16 = 0;
    }
LABEL_9:
    self->_audioURL = (NSURL *)v16;
  }
}

- (VFXAudioSource)initWithFileNamed:(id)a3 inBundle:(id)a4
{
  uint64_t v6 = (VFXAudioSource *)objc_msgSend_init(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    v6->_audioName = (NSString *)a3;
    objc_msgSend_setPositional_(v6, v7, 1, v8);
    LODWORD(v9) = 1.0;
    objc_msgSend_setVolume_(v6, v10, v11, v12, v9);
    LODWORD(v13) = 1.0;
    objc_msgSend_setRate_(v6, v14, v15, v16, v13);
    objc_msgSend__loadURLWithBundle_(v6, v17, (uint64_t)a4, v18);
  }
  return v6;
}

- (id)fileName
{
  return self->_audioName;
}

- (VFXAudioSource)initWithFileNamed:(id)a3
{
  uint64_t v6 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, (uint64_t)a3, v3);

  return (VFXAudioSource *)MEMORY[0x1F4181798](self, sel_initWithFileNamed_inBundle_, a3, v6);
}

- (VFXAudioSource)initWithURL:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VFXAudioSource;
  id v4 = [(VFXAudioSource *)&v16 init];
  if (v4)
  {
    v4->_audioURL = (NSURL *)a3;
    objc_msgSend_setPositional_(v4, v5, 1, v6);
    LODWORD(v7) = 1.0;
    objc_msgSend_setVolume_(v4, v8, v9, v10, v7);
    LODWORD(v11) = 1.0;
    objc_msgSend_setRate_(v4, v12, v13, v14, v11);
  }
  return v4;
}

+ (id)audioSourceNamed:(id)a3
{
  if (qword_1E9DDB2C8 != -1) {
    dispatch_once(&qword_1E9DDB2C8, &unk_1F0FB5CE8);
  }
  id result = (id)objc_msgSend_objectForKey_((void *)qword_1E9DDB2C0, a2, (uint64_t)a3, v3);
  if (!result)
  {
    uint64_t v6 = [VFXAudioSource alloc];
    uint64_t v9 = objc_msgSend_initWithFileNamed_(v6, v7, (uint64_t)a3, v8);
    double v11 = (void *)v9;
    if (a3 && v9) {
      objc_msgSend_setObject_forKey_((void *)qword_1E9DDB2C0, v10, v9, (uint64_t)a3);
    }
    return v11;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXAudioSource;
  [(VFXAudioSource *)&v3 dealloc];
}

- (void)load
{
  if (!self->_loaded) {
    objc_msgSend__load(self, a2, v2, v3);
  }
}

- (void)_load
{
  self->_loaded = 1;
  if (!self->_audioURL && self->_audioName)
  {
    uint64_t v5 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, v2, v3);
    objc_msgSend__loadURLWithBundle_(self, v6, v5, v7);
  }
  if (!self->_audioFile && self->_audioURL)
  {
    v32 = 0;
    id v8 = objc_alloc(MEMORY[0x1E4F15390]);
    self->_audioFile = (AVAudioFile *)objc_msgSend_initForReading_error_(v8, v9, (uint64_t)self->_audioURL, (uint64_t)&v32);
  }
  if ((objc_msgSend_shouldStream(self, a2, v2, v3) & 1) == 0 && !self->_audioBuffer && self->_audioFile)
  {
    v32 = 0;
    id v10 = objc_alloc(MEMORY[0x1E4F153B0]);
    uint64_t v14 = objc_msgSend_processingFormat(self->_audioFile, v11, v12, v13);
    uint64_t v18 = objc_msgSend_length(self->_audioFile, v15, v16, v17);
    uint64_t v20 = (AVAudioPCMBuffer *)objc_msgSend_initWithPCMFormat_frameCapacity_(v10, v19, v14, v18);
    self->_audioBuffer = v20;
    if ((objc_msgSend_readIntoBuffer_error_(self->_audioFile, v21, (uint64_t)v20, (uint64_t)&v32) & 1) == 0)
    {
      uint64_t v25 = objc_msgSend_localizedDescription(v32, v22, v23, v24);
      sub_1B63F2F54(16, @"Error: Error reading file into buffer: %@", v26, v27, v28, v29, v30, v31, v25);
    }
  }
}

- (void)loadIfNeeded
{
  if (!self->_loaded) {
    objc_msgSend_load(self, a2, v2, v3);
  }
}

- (id)audioBufferFormat
{
  objc_msgSend_loadIfNeeded(self, a2, v2, v3);
  audioBuffer = self->_audioBuffer;

  return (id)objc_msgSend_format(audioBuffer, v5, v6, v7);
}

- (id)audioBuffer
{
  objc_msgSend_loadIfNeeded(self, a2, v2, v3);
  return self->_audioBuffer;
}

- (id)audioFile
{
  objc_msgSend_loadIfNeeded(self, a2, v2, v3);
  return self->_audioFile;
}

- (double)duration
{
  if (objc_msgSend_loops(self, a2, v2, v3)) {
    return 1.79769313e308;
  }
  objc_msgSend_loadIfNeeded(self, v5, v6, v7);
  audioFile = self->_audioFile;
  if (!audioFile) {
    return 0.0;
  }
  if (self->_audioBuffer) {
    double v16 = (float)objc_msgSend_frameLength(self->_audioBuffer, v9, v10, v11);
  }
  else {
    double v16 = (double)objc_msgSend_length(audioFile, v9, v10, v11);
  }
  uint64_t v17 = objc_msgSend_fileFormat(self->_audioFile, v13, v14, v15);
  objc_msgSend_sampleRate(v17, v18, v19, v20);
  return v16 / v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  audioName = self->_audioName;
  if (audioName)
  {
    uint64_t v6 = objc_msgSend_audioSourceNamed_(VFXAudioSource, a2, (uint64_t)audioName, v3);
  }
  else
  {
    if (self->_audioURL)
    {
      uint64_t v9 = [VFXAudioSource alloc];
      id v7 = (id)objc_msgSend_initWithURL_(v9, v10, (uint64_t)self->_audioURL, v11);
      goto LABEL_6;
    }
    audioBuffer = self->_audioBuffer;
    if (!audioBuffer)
    {
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = objc_msgSend_audioSourceWithAVAudioPCMBuffer_(VFXAudioSource, a2, (uint64_t)audioBuffer, v3);
  }
  id v7 = v6;
LABEL_6:
  uint64_t v12 = v7;
LABEL_7:
  uint64_t isPositional = objc_msgSend_isPositional(self, a2, (uint64_t)audioBuffer, v3);
  objc_msgSend_setPositional_(v12, v14, isPositional, v15);
  objc_msgSend_volume(self, v16, v17, v18);
  objc_msgSend_setVolume_(v12, v19, v20, v21);
  objc_msgSend_rate(self, v22, v23, v24);
  objc_msgSend_setRate_(v12, v25, v26, v27);
  uint64_t v31 = objc_msgSend_loops(self, v28, v29, v30);
  objc_msgSend_setLoops_(v12, v32, v31, v33);
  uint64_t shouldStream = objc_msgSend_shouldStream(self, v34, v35, v36);
  objc_msgSend_setShouldStream_(v12, v38, shouldStream, v39);
  return v12;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_customEncodingOfVFXAudioSource:(id)a3
{
  audioName = self->_audioName;
  if (audioName)
  {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)audioName, @"name");
  }
  else if (self->_audioURL)
  {
    objc_msgSend_encodeObject_forKey_(a3, a2, 0, @"url");
  }
  else
  {
    sub_1B63F2F54(16, @"Error: can't archive audio data directly", 0, v3, v4, v5, v6, v7, v41);
  }
  objc_msgSend_volume(self, v11, v12, v13);
  objc_msgSend_encodeFloat_forKey_(a3, v14, @"volume", v15);
  objc_msgSend_rate(self, v16, v17, v18);
  objc_msgSend_encodeFloat_forKey_(a3, v19, @"rate", v20);
  objc_msgSend_reverbBlend(self, v21, v22, v23);
  objc_msgSend_encodeFloat_forKey_(a3, v24, @"reverbBlend", v25);
  uint64_t isPositional = objc_msgSend_isPositional(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(a3, v30, isPositional, @"positional");
  uint64_t v34 = objc_msgSend_loops(self, v31, v32, v33);
  objc_msgSend_encodeBool_forKey_(a3, v35, v34, @"loops");
  uint64_t shouldStream = objc_msgSend_shouldStream(self, v36, v37, v38);

  objc_msgSend_encodeBool_forKey_(a3, v39, shouldStream, @"shouldStream");
}

- (void)_customDecodingOfVFXAudioSource:(id)a3
{
  p_audioName = &self->_audioName;
  if (self->_audioName)
  {
    uint64_t v7 = @"name";
  }
  else
  {
    p_audioName = &self->_audioURL;
    if (!self->_audioURL) {
      goto LABEL_6;
    }
    uint64_t v7 = @"url";
  }
  uint64_t v8 = objc_opt_class();
  void *p_audioName = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)v7);
LABEL_6:
  objc_msgSend_decodeFloatForKey_(a3, a2, @"volume", v3);
  objc_msgSend_setVolume_(self, v10, v11, v12);
  objc_msgSend_decodeFloatForKey_(a3, v13, @"rate", v14);
  objc_msgSend_setRate_(self, v15, v16, v17);
  objc_msgSend_decodeFloatForKey_(a3, v18, @"reverbBlend", v19);
  objc_msgSend_setReverbBlend_(self, v20, v21, v22);
  uint64_t v25 = objc_msgSend_decodeBoolForKey_(a3, v23, @"positional", v24);
  objc_msgSend_setPositional_(self, v26, v25, v27);
  uint64_t v30 = objc_msgSend_decodeBoolForKey_(a3, v28, @"loops", v29);
  objc_msgSend_setLoops_(self, v31, v30, v32);
  uint64_t v35 = objc_msgSend_decodeBoolForKey_(a3, v33, @"shouldStream", v34);
  objc_msgSend_setShouldStream_(self, v36, v35, v37);

  objc_msgSend_loadIfNeeded(self, v38, v39, v40);
}

- (void)encodeWithCoder:(id)a3
{
}

- (VFXAudioSource)initWithCoder:(id)a3
{
  uint64_t v5 = (VFXAudioSource *)objc_msgSend_init(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = v5;
  if (v5) {
    objc_msgSend__customDecodingOfVFXAudioSource_(v5, v6, (uint64_t)a3, v7);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)volume
{
  return self->volume;
}

- (void)setVolume:(float)a3
{
  self->volume = a3;
}

- (BOOL)isPositional
{
  return self->positional;
}

- (void)setPositional:(BOOL)a3
{
  self->positional = a3;
}

- (float)rate
{
  return self->rate;
}

- (void)setRate:(float)a3
{
  self->rate = a3;
}

- (float)reverbBlend
{
  return self->reverbBlend;
}

- (void)setReverbBlend:(float)a3
{
  self->reverbBlend = a3;
}

- (BOOL)loops
{
  return self->_loops;
}

- (void)setLoops:(BOOL)a3
{
  self->_loops = a3;
}

- (BOOL)shouldStream
{
  return self->_shouldStream;
}

- (void)setShouldStream:(BOOL)a3
{
  self->_uint64_t shouldStream = a3;
}

@end