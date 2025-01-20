@interface _UIFocusSoundPool
- (_UIFocusSoundPool)initWithSoundFileURL:(id)a3;
- (_UIFocusSoundPool)initWithSystemSoundID:(unsigned int)a3;
- (unsigned)originalSystemSoundID;
- (unsigned)playableSystemSoundID;
@end

@implementation _UIFocusSoundPool

- (_UIFocusSoundPool)initWithSystemSoundID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusSoundPool;
  result = [(_UIFocusSoundPool *)&v5 init];
  if (result)
  {
    result->_originalSystemSoundID = a3;
    result->_queueIndex = 0;
  }
  return result;
}

- (_UIFocusSoundPool)initWithSoundFileURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusSoundPool;
  v6 = [(_UIFocusSoundPool *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_soundFileURL, a3);
    v7->_queueIndex = 0;
  }

  return v7;
}

- (unsigned)playableSystemSoundID
{
  queue = self->_queue;
  if (!queue)
  {
    soundFileURL = self->_soundFileURL;
    if (soundFileURL)
    {
      id v5 = soundFileURL;
      uint64_t v6 = 10;
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
      do
      {
        unsigned int v23 = 0;
        v8 = v5;
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        objc_super v9 = (void (*)(NSURL *, unsigned int *))off_1EB260760;
        v32 = off_1EB260760;
        if (!off_1EB260760)
        {
          uint64_t v24 = MEMORY[0x1E4F143A8];
          uint64_t v25 = 3221225472;
          v26 = __getAudioServicesCreateSystemSoundIDSymbolLoc_block_invoke;
          v27 = &unk_1E52D9900;
          v28 = &v29;
          v10 = AudioToolboxLibrary_0();
          v11 = dlsym(v10, "AudioServicesCreateSystemSoundID");
          *(void *)(v28[1] + 24) = v11;
          off_1EB260760 = *(_UNKNOWN **)(v28[1] + 24);
          objc_super v9 = (void (*)(NSURL *, unsigned int *))v30[3];
        }
        _Block_object_dispose(&v29, 8);
        if (!v9)
        {
          v21 = [MEMORY[0x1E4F28B00] currentHandler];
          v22 = objc_msgSend(NSString, "stringWithUTF8String:", "OSStatus __AudioServicesCreateSystemSoundID(CFURLRef, SystemSoundID *)");
          objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"_UIFocusSoundGenerator.m", 30, @"%s", dlerror());
          while (1)
          {

            __break(1u);
LABEL_17:
            v21 = [MEMORY[0x1E4F28B00] currentHandler];
            v22 = objc_msgSend(NSString, "stringWithUTF8String:", "CFArrayRef __AudioServicesCreateSystemSoundIDsFromID(SystemSoundID, UInt32)");
            objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"_UIFocusSoundGenerator.m", 31, @"%s", dlerror());
          }
        }
        v9(v8, &v23);
        v12 = [NSNumber numberWithUnsignedInt:v23];
        [v7 addObject:v12];

        --v6;
      }
      while (v6);
      v13 = (NSArray *)[v7 copy];
    }
    else
    {
      uint64_t originalSystemSoundID = self->_originalSystemSoundID;
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2020000000;
      v15 = (uint64_t (*)(uint64_t, uint64_t))off_1EB260758;
      v32 = off_1EB260758;
      if (!off_1EB260758)
      {
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        v26 = __getAudioServicesCreateSystemSoundIDsFromIDSymbolLoc_block_invoke;
        v27 = &unk_1E52D9900;
        v28 = &v29;
        v16 = AudioToolboxLibrary_0();
        v30[3] = (uint64_t)dlsym(v16, "AudioServicesCreateSystemSoundIDsFromID");
        off_1EB260758 = *(_UNKNOWN **)(v28[1] + 24);
        v15 = (uint64_t (*)(uint64_t, uint64_t))v30[3];
      }
      _Block_object_dispose(&v29, 8);
      if (!v15) {
        goto LABEL_17;
      }
      v13 = (NSArray *)v15(originalSystemSoundID, 10);
    }
    v17 = self->_queue;
    self->_queue = v13;

    queue = self->_queue;
  }
  ++self->_queueIndex;
  v18 = -[NSArray objectAtIndexedSubscript:](queue, "objectAtIndexedSubscript:");
  unsigned int v19 = [v18 unsignedIntegerValue];

  self->_queueIndex %= [(NSArray *)self->_queue count];
  return v19;
}

- (unsigned)originalSystemSoundID
{
  return self->_originalSystemSoundID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_soundFileURL, 0);
}

@end