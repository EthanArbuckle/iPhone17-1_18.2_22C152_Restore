@interface VTAudioFileReader
- (VTAudioFileReader)initWithURL:(id)a3;
- (id)readSamples:(unint64_t)a3;
- (void)close;
- (void)dealloc;
@end

@implementation VTAudioFileReader

- (void)close
{
  fFile = self->_fFile;
  if (fFile) {
    ExtAudioFileDispose(fFile);
  }
}

- (id)readSamples:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v4 = 2 * a3;
  [MEMORY[0x263EFF990] dataWithLength:2 * a3];
  *(void *)&ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mNumberChannels = 1;
  ioData.mBuffers[0].mDataByteSize = v4;
  id v5 = objc_claimAutoreleasedReturnValue();
  ioData.mBuffers[0].mData = (void *)[v5 bytes];
  UInt32 ioNumberFrames = v4;
  OSStatus v6 = ExtAudioFileRead(self->_fFile, &ioNumberFrames, &ioData);
  UInt32 v7 = ioNumberFrames;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = ioNumberFrames == 0;
  }
  if (v8)
  {
    OSStatus v9 = v6;
    v10 = VTLogContextFacilityVoiceTrigger;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        UInt32 v15 = v9;
        _os_log_error_impl(&dword_21844F000, v10, OS_LOG_TYPE_ERROR, "::: Error reading data from audio file : %d", buf, 8u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        UInt32 v15 = v7;
        _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Reach to EOF: appending digital zero, chunkSize = %d", buf, 8u);
      }
      bzero((void *)[v5 bytes], v4);
    }
  }

  return v5;
}

- (void)dealloc
{
  [(VTAudioFileReader *)self close];
  v3.receiver = self;
  v3.super_class = (Class)VTAudioFileReader;
  [(VTAudioFileReader *)&v3 dealloc];
}

- (VTAudioFileReader)initWithURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFURLRef v4 = (const __CFURL *)a3;
  v12.receiver = self;
  v12.super_class = (Class)VTAudioFileReader;
  id v5 = [(VTAudioFileReader *)&v12 init];
  OSStatus v6 = v5;
  if (v5 && (OSStatus v7 = ExtAudioFileOpenURL(v4, &v5->_fFile)) != 0)
  {
    OSStatus v8 = v7;
    OSStatus v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFURLRef v14 = v4;
      __int16 v15 = 1024;
      OSStatus v16 = v8;
      _os_log_error_impl(&dword_21844F000, v9, OS_LOG_TYPE_ERROR, "::: Error reading file %@, err: %d", buf, 0x12u);
    }
    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

@end