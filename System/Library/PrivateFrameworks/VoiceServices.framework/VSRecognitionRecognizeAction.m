@interface VSRecognitionRecognizeAction
- (BOOL)_hasDeferredStartCallback;
- (BOOL)_isActivelyRecognizing;
- (BOOL)_isRecognizing;
- (BOOL)_keywordIndexChanged;
- (BOOL)_setAudioInputPath:(id)a3;
- (BOOL)_setBluetoothInputAllowed:(BOOL)a3;
- (BOOL)_setDebugDumpEnabled:(BOOL)a3;
- (BOOL)_setDebugDumpEnabled:(BOOL)a3 dumpPath:(id)a4;
- (BOOL)_setDebugDumpPath:(id)a3;
- (BOOL)_setEngineResetRequired:(BOOL)a3;
- (BOOL)_setInputLevelUpdateInterval:(double)a3;
- (BOOL)_setPreferredEngine:(int)a3;
- (VSRecognitionRecognizeAction)initWithModelIdentifier:(id)a3;
- (__VSRecognition)_createRecognitionInstanceWithCallbacks:(id *)a3 info:(void *)a4;
- (float)_inputLevel;
- (float)_inputLevelDB;
- (id)_actionForEmptyResults;
- (id)_debugDumpPath;
- (id)_keywordAtIndex:(int64_t)a3;
- (id)_keywords;
- (id)cancel;
- (id)modelIdentifier;
- (id)perform;
- (int)completionType;
- (int64_t)_keywordCount;
- (void)_configureNewRecognitionInstance;
- (void)_handleRecognitionCompleted:(__VSRecognition *)a3 withResults:(__CFArray *)a4 error:(__CFError *)a5;
- (void)_handleRecognitionPrepared:(__VSRecognition *)a3;
- (void)_handleRecognitionStarted:(__VSRecognition *)a3;
- (void)_handledThreadedResults:(id)a3 nextAction:(id)a4;
- (void)_releaseFromPrepare;
- (void)_reset;
- (void)_setResults:(id)a3;
- (void)dealloc;
@end

@implementation VSRecognitionRecognizeAction

- (void)_handledThreadedResults:(id)a3 nextAction:(id)a4
{
  if (self->_results == a3)
  {
    [(VSRecognitionRecognizeAction *)self _setResults:0];
    [(VSRecognitionAction *)self completeWithNextAction:a4 error:0];
  }
}

- (void)_handleRecognitionCompleted:(__VSRecognition *)a3 withResults:(__CFArray *)a4 error:(__CFError *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v5 = 64;
  if (self->_recognition != a3) {
    return;
  }
  v9 = self;
  v10 = 0;
  int v11 = 0;
  if (!a4 || a5)
  {
    v21 = 0;
    v16 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v12 = [(__CFArray *)a4 count];
    CFIndex v14 = v12 - 1;
    if (v12 < 1)
    {
      v10 = 0;
      v21 = 0;
      int v11 = 0;
      v16 = 0;
      uint64_t v17 = 0;
    }
    else
    {
      CFIndex v15 = 0;
      uint64_t v26 = 0;
      id v27 = 0;
      LOBYTE(v5) = 0;
      v16 = 0;
      uint64_t v17 = 0;
      BOOL v18 = 1;
      *(void *)&long long v13 = 138412290;
      long long v24 = v13;
      otherArray = a4;
      while (1)
      {
        v10 = (void *)-[__CFArray objectAtIndex:](a4, "objectAtIndex:", v15, v24);
        if (*(unsigned char *)&self->_recognizeFlags)
        {
          v19 = VSGetLogDefault();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            v29 = v10;
            _os_log_debug_impl(&dword_20CABC000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        if (v18)
        {
          v16 = (void *)[v10 createHandler];
          ++v17;
          if (v16)
          {
            char v20 = objc_opt_respondsToSelector();
            if (v15 >= v14)
            {
              LOBYTE(v5) = v20 & 1;
              a4 = (__CFArray *)-[__CFArray subarrayWithRange:](a4, "subarrayWithRange:", v15, 1);
            }
            else if (v20)
            {
              uint64_t v26 = [v10 modelIdentifier];
              if (v15)
              {
                id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
                [v27 addObject:v10];
              }
              LOBYTE(v5) = 1;
            }
            else
            {
              LOBYTE(v5) = 0;
            }
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v10, "modelIdentifier"), "isEqualToString:", v26))
        {
          if (v27) {
            [v27 addObject:v10];
          }
          ++v17;
        }
        else if (!v27)
        {
          id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
          v31.location = 0;
          v31.length = v15;
          CFArrayAppendArray((CFMutableArrayRef)v27, otherArray, v31);
        }
        int v11 = v5;
        if (v14 == v15) {
          break;
        }
        BOOL v18 = v16 == 0;
        ++v15;
        if (v16)
        {
          if (!v5) {
            break;
          }
        }
      }
      a5 = 0;
      v21 = (__CFArray *)v27;
    }
  }
  [(VSRecognitionRecognizeAction *)self _setResults:0];
  if (v21) {
    a4 = v21;
  }
  if (a5 || v17)
  {
    if (v16)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || ![v16 requiresThreadedProcessing])
      {
        if (v11)
        {
          [(__CFArray *)a4 makeObjectsPerformSelector:sel_setRecognitionAction_ withObject:self];
          id v22 = (id)[v16 actionForRecognitionResults:a4];
          [(__CFArray *)a4 makeObjectsPerformSelector:sel_setRecognitionAction_ withObject:0];
        }
        else
        {
          [v10 setRecognitionAction:self];
          id v22 = (id)[v16 actionForRecognitionResult:v10];
          [v10 setRecognitionAction:0];
        }
        goto LABEL_46;
      }
      if ((v11 & 1) == 0) {
        a4 = (__CFArray *)[MEMORY[0x263EFF8C0] arrayWithObject:v10];
      }
      [(VSRecognitionRecognizeAction *)self _setResults:a4];
      objc_msgSend((id)objc_msgSend(-[VSRecognitionAction _session](self, "_session"), "_recognitionResultHandlingThread"), "handleResults:withHandler:", a4, v16);
    }
    id v22 = 0;
  }
  else
  {
    id v22 = [(VSRecognitionRecognizeAction *)self _actionForEmptyResults];
  }
LABEL_46:
  recognition = self->_recognition;
  if (recognition)
  {
    CFRelease(recognition);
    self->_recognition = 0;
  }
  if (!self->_results) {
    [(VSRecognitionAction *)self completeWithNextAction:v22 error:a5];
  }
}

- (void)_handleRecognitionStarted:(__VSRecognition *)a3
{
  if (self->_recognition == a3) {
    *(unsigned char *)&self->_recognizeFlags |= 0x20u;
  }
}

- (void)_handleRecognitionPrepared:(__VSRecognition *)a3
{
  if (self->_recognition == a3
    && objc_msgSend(-[VSRecognitionAction _session](self, "_session"), "_actionStarted:", self)
    && self->_recognition)
  {
    [(VSRecognitionRecognizeAction *)self _releaseFromPrepare];
  }
}

- (void)_reset
{
  *(unsigned char *)&self->_recognizeFlags &= 0xD7u;
  audioInputPath = self->_audioInputPath;
  if (audioInputPath)
  {

    self->_audioInputPath = 0;
  }
  recognition = self->_recognition;
  if (recognition) {
    CFRelease(recognition);
  }
  self->_recognition = 0;
  [(VSRecognitionRecognizeAction *)self _setResults:0];
}

- (void)_setResults:(id)a3
{
  results = self->_results;
  if (results != a3)
  {

    self->_results = (NSArray *)a3;
  }
}

- (id)_actionForEmptyResults
{
  return 0;
}

- (void)_releaseFromPrepare
{
  CFTypeRef cf = 0;
  if (!_VSRecognitionPrepareAndBegin((char *)self->_recognition, 1, &cf))
  {
    CFRelease(self->_recognition);
    self->_recognition = 0;
    [(VSRecognitionAction *)self completeWithNextAction:0 error:cf];
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (id)cancel
{
  id v5 = 0;
  recognition = self->_recognition;
  if (recognition)
  {
    VSRecognitionCancel((uint64_t)recognition, (CFErrorRef *)&v5);
    CFRelease(self->_recognition);
    self->_recognition = 0;
  }
  [(VSRecognitionRecognizeAction *)self _setResults:0];
  return v5;
}

- (id)perform
{
  userInfoKeys[1] = *(void **)MEMORY[0x263EF8340];
  id v9 = 0;
  if (self->_recognition)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v3 = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = @"recognition already attempted or in progress";
    userInfoKeys[0] = v3;
    CFIndex v4 = -4003;
LABEL_3:
    id v9 = CFErrorCreateWithUserInfoKeysAndValues(v2, @"VSErrorDomain", v4, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    return v9;
  }
  *(unsigned char *)&self->_recognizeFlags &= ~0x20u;
  [(VSRecognitionRecognizeAction *)self _configureNewRecognitionInstance];
  recognition = (char *)self->_recognition;
  if (!recognition)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v8 = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = @"could not create recognition instance";
    userInfoKeys[0] = v8;
    CFIndex v4 = -4001;
    goto LABEL_3;
  }
  if (!_VSRecognitionPrepareAndBegin(recognition, 0, &v9))
  {
    CFRelease(self->_recognition);
    self->_recognition = 0;
  }
  return v9;
}

- (void)_configureNewRecognitionInstance
{
  long long v10 = xmmword_26C1AFB70;
  int v11 = off_26C1AFB80;
  v3 = [(VSRecognitionRecognizeAction *)self _createRecognitionInstanceWithCallbacks:&v10 info:self];
  self->_recognition = v3;
  if (v3)
  {
    $273D3D7B8EE1076586458444117ACD93 recognizeFlags = self->_recognizeFlags;
    int v5 = (*(unsigned int *)&recognizeFlags >> 1) & 3;
    if (v5)
    {
      VSRecognitionSetPreferredEngine((uint64_t)v3, v5);
      *(unsigned char *)&$273D3D7B8EE1076586458444117ACD93 recognizeFlags = self->_recognizeFlags;
    }
    if (*(unsigned char *)&recognizeFlags)
    {
      v6 = self->_debugDumpPath ? self->_debugDumpPath : (NSString *)*MEMORY[0x263EFFD08];
      if (VSRecognitionSetDebugDumpPath((uint64_t)self->_recognition, v6) && !self->_debugDumpPath) {
        self->_debugDumpPath = (NSString *)VSRecognitionCopyDebugDumpPath((uint64_t)self->_recognition);
      }
    }
    audioInputPath = self->_audioInputPath;
    recognition = self->_recognition;
    if (audioInputPath)
    {
      VSRecognitionSetAudioInputPath((uint64_t)recognition, audioInputPath);
      recognition = self->_recognition;
    }
    if ((*(unsigned char *)&self->_recognizeFlags & 8) != 0)
    {
      VSRecognitionSetEngineResetRequired((uint64_t)recognition, 1);
      recognition = self->_recognition;
    }
    double levelInterval = self->_levelInterval;
    if (levelInterval > 0.0)
    {
      VSRecognitionSetInputLevelUpdateInterval((uint64_t)recognition, levelInterval);
      recognition = self->_recognition;
    }
    VSRecognitionSetBluetoothInputAllowed((uint64_t)recognition, (*(unsigned char *)&self->_recognizeFlags & 0x10) != 0);
  }
}

- (__VSRecognition)_createRecognitionInstanceWithCallbacks:(id *)a3 info:(void *)a4
{
  if (self->_modelIdentifier) {
    CFStringRef modelIdentifier = (const __CFString *)self->_modelIdentifier;
  }
  else {
    CFStringRef modelIdentifier = @"_default";
  }
  return (__VSRecognition *)_VSRecognitionCreate((const __CFAllocator *)*MEMORY[0x263EFFB08], modelIdentifier, 0, (long long *)a3, (uint64_t)a4);
}

- (BOOL)_setEngineResetRequired:(BOOL)a3
{
  char recognizeFlags = (char)self->_recognizeFlags;
  if ((((recognizeFlags & 8) == 0) ^ a3))
  {
LABEL_9:
    LOBYTE(v7) = 1;
    return v7;
  }
  BOOL v4 = a3;
  recognition = self->_recognition;
  if (!recognition)
  {
LABEL_5:
    if (v4) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_char recognizeFlags = recognizeFlags & 0xF7 | v8;
    goto LABEL_9;
  }
  int v7 = VSRecognitionSetEngineResetRequired((uint64_t)recognition, a3);
  if (v7)
  {
    char recognizeFlags = (char)self->_recognizeFlags;
    goto LABEL_5;
  }
  return v7;
}

- (BOOL)_setAudioInputPath:(id)a3
{
  audioInputPath = self->_audioInputPath;
  if (audioInputPath == a3) {
    goto LABEL_6;
  }
  recognition = self->_recognition;
  if (!recognition)
  {
LABEL_5:

    self->_audioInputPath = (NSString *)a3;
LABEL_6:
    LOBYTE(v7) = 1;
    return v7;
  }
  int v7 = VSRecognitionSetAudioInputPath((uint64_t)recognition, a3);
  if (v7)
  {
    audioInputPath = self->_audioInputPath;
    goto LABEL_5;
  }
  return v7;
}

- (BOOL)_setPreferredEngine:(int)a3
{
  $273D3D7B8EE1076586458444117ACD93 recognizeFlags = self->_recognizeFlags;
  if (((*(unsigned int *)&recognizeFlags >> 1) & 3) == a3) {
    goto LABEL_6;
  }
  char v4 = a3;
  recognition = self->_recognition;
  if (!recognition)
  {
LABEL_5:
    *(unsigned char *)&self->_$273D3D7B8EE1076586458444117ACD93 recognizeFlags = *(unsigned char *)&recognizeFlags & 0xF9 | (2 * (v4 & 3));
LABEL_6:
    LOBYTE(v7) = 1;
    return v7;
  }
  int v7 = VSRecognitionSetPreferredEngine((uint64_t)recognition, a3);
  if (v7)
  {
    *(unsigned char *)&$273D3D7B8EE1076586458444117ACD93 recognizeFlags = self->_recognizeFlags;
    goto LABEL_5;
  }
  return v7;
}

- (id)_debugDumpPath
{
  return self->_debugDumpPath;
}

- (BOOL)_setDebugDumpPath:(id)a3
{
  return [(VSRecognitionRecognizeAction *)self _setDebugDumpEnabled:a3 != 0 dumpPath:a3];
}

- (BOOL)_setDebugDumpEnabled:(BOOL)a3
{
  return [(VSRecognitionRecognizeAction *)self _setDebugDumpEnabled:a3 dumpPath:0];
}

- (BOOL)_setDebugDumpEnabled:(BOOL)a3 dumpPath:(id)a4
{
  if ((((*(unsigned char *)&self->_recognizeFlags & 1) == 0) ^ a3)) {
    return 1;
  }
  BOOL v5 = a3;

  self->_debugDumpPath = 0;
  recognition = self->_recognition;
  if (!recognition)
  {
    BOOL v10 = 1;
LABEL_11:
    if (v5)
    {
      if (a4 || (uint64_t v12 = self->_recognition) == 0) {
        int v11 = (NSString *)a4;
      }
      else {
        int v11 = (NSString *)VSRecognitionCopyDebugDumpPath((uint64_t)v12);
      }
      self->_debugDumpPath = v11;
    }
    goto LABEL_17;
  }
  id v8 = (id)*MEMORY[0x263EFFD08];
  if (a4) {
    id v8 = a4;
  }
  if (v5) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  BOOL v10 = VSRecognitionSetDebugDumpPath((uint64_t)recognition, v9) != 0;
  if (v10) {
    goto LABEL_11;
  }
LABEL_17:
  if (v10)
  {
    *(unsigned char *)&self->_$273D3D7B8EE1076586458444117ACD93 recognizeFlags = *(unsigned char *)&self->_recognizeFlags & 0xFE | v5;
    return 1;
  }
  return 0;
}

- (BOOL)_keywordIndexChanged
{
  keywords = self->_keywords;
  if (keywords)
  {

    self->_keywords = 0;
  }
  return 1;
}

- (int64_t)_keywordCount
{
  id v2 = [(VSRecognitionRecognizeAction *)self _keywords];
  return [v2 count];
}

- (id)_keywordAtIndex:(int64_t)a3
{
  id v4 = [(VSRecognitionRecognizeAction *)self _keywords];
  if ([v4 count] <= (unint64_t)a3) {
    return 0;
  }
  return (id)[v4 objectAtIndex:a3];
}

- (id)_keywords
{
  id result = self->_keywords;
  if (!result)
  {
    id result = (id)objc_msgSend(-[VSRecognitionAction _session](self, "_session"), "_keywordsForModelIdentifier:", self->_modelIdentifier);
    self->_keywords = (NSArray *)result;
    if (!result)
    {
      id result = objc_alloc_init(MEMORY[0x263EFF8C0]);
      self->_keywords = (NSArray *)result;
    }
  }
  return result;
}

- (float)_inputLevelDB
{
  recognition = self->_recognition;
  if (recognition && (*(unsigned char *)&self->_recognizeFlags & 0x20) != 0) {
    return VSRecognitionGetInputLevelDB((uint64_t)recognition);
  }
  else {
    return 0.0;
  }
}

- (float)_inputLevel
{
  recognition = self->_recognition;
  if (recognition && (*(unsigned char *)&self->_recognizeFlags & 0x20) != 0) {
    return VSRecognitionGetInputLevel((uint64_t)recognition);
  }
  else {
    return 0.0;
  }
}

- (BOOL)_setInputLevelUpdateInterval:(double)a3
{
  BOOL result = self->_levelInterval == a3
        || (self->_double levelInterval = a3, (recognition = self->_recognition) == 0)
        || VSRecognitionSetInputLevelUpdateInterval((uint64_t)recognition, a3) != 0;
  return result;
}

- (BOOL)_setBluetoothInputAllowed:(BOOL)a3
{
  char recognizeFlags = (char)self->_recognizeFlags;
  if (((((recognizeFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (self->_recognition) {
      return 0;
    }
    *(unsigned char *)&self->_char recognizeFlags = recognizeFlags | 0x10;
  }
  return 1;
}

- (BOOL)_hasDeferredStartCallback
{
  return 1;
}

- (BOOL)_isActivelyRecognizing
{
  recognition = self->_recognition;
  return recognition && recognition[24] == 1;
}

- (BOOL)_isRecognizing
{
  recognition = self->_recognition;
  return recognition && recognition[24] < 2u;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (int)completionType
{
  return 1;
}

- (void)dealloc
{
  [(VSRecognitionRecognizeAction *)self cancel];

  recognition = self->_recognition;
  if (recognition) {
    CFRelease(recognition);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionRecognizeAction;
  [(VSRecognitionAction *)&v4 dealloc];
}

- (VSRecognitionRecognizeAction)initWithModelIdentifier:(id)a3
{
  objc_super v4 = [(VSRecognitionRecognizeAction *)self init];
  if (v4) {
    v4->_CFStringRef modelIdentifier = (NSString *)a3;
  }
  return v4;
}

@end