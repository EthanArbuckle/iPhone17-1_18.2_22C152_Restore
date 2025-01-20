@interface VSRecognitionSession
- (BOOL)_actionStarted:(id)a3;
- (BOOL)hasDeferredAction;
- (BOOL)isActivelyRecognizing;
- (BOOL)isBusy;
- (BOOL)isFinished;
- (BOOL)isRecognizing;
- (BOOL)isValid;
- (BOOL)nextActionWillRecognize;
- (BOOL)nextActionWillTerminateSession;
- (BOOL)sensitiveActionsEnabled;
- (BOOL)setBluetoothInputAllowed:(BOOL)a3;
- (BOOL)setDebugDumpEnabled:(BOOL)a3;
- (BOOL)setNextRecognitionAudioInputPath:(id)a3;
- (BOOL)setNextRecognitionRequiresReset:(BOOL)a3;
- (BOOL)setPreferredEngine:(int)a3;
- (VSRecognitionSession)init;
- (VSRecognitionSession)initWithModelIdentifier:(id)a3;
- (__CFDictionary)_createKeywordIndex;
- (float)inputLevel;
- (float)inputLevelDB;
- (id)_beginSpeakingAttributedString:(id)a3;
- (id)_beginSpeakingString:(id)a3 attributedString:(id)a4;
- (id)_createPhaseSortedKeywordsFromArray:(id)a3;
- (id)_currentRecognizeAction;
- (id)_keywordsForModelIdentifier:(id)a3;
- (id)_recognitionResultHandlingThread;
- (id)_topLevelKeywords;
- (id)beginNextAction;
- (id)beginSpeakingFeedbackString;
- (id)beginSpeakingString:(id)a3;
- (id)cancel;
- (id)cancelMaintainingKeepAlive:(BOOL)a3;
- (id)debugDumpPath;
- (id)displayResultString;
- (id)displayStatusString;
- (id)keywordAtIndex:(int64_t)a3;
- (id)reset;
- (id)spokenFeedbackAttributedString;
- (id)spokenFeedbackString;
- (int64_t)keywordCount;
- (void)_actionCompleted:(id)a3 nextAction:(id)a4 error:(id)a5;
- (void)_init;
- (void)_keywordIndexChanged;
- (void)_notifyDelegateActionStarted;
- (void)_notifyDelegateFinishedSpeakingWithError:(id)a3;
- (void)_notifyDelegateOpenURL:(id)a3 completion:(id)a4;
- (void)_setAction:(id)a3;
- (void)dealloc;
- (void)recognitionResultHandlingThread:(id)a3 didHandleResults:(id)a4 nextAction:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setInputLevelUpdateInterval:(double)a3;
- (void)setKeywordPhase:(unint64_t)a3;
- (void)setPerformRecognitionHandlerActions:(BOOL)a3;
- (void)setSensitiveActionsEnabled:(BOOL)a3;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7;
@end

@implementation VSRecognitionSession

- (void)setPerformRecognitionHandlerActions:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFDFF | v3);
}

- (BOOL)setPreferredEngine:(int)a3
{
  if (((*(_DWORD *)&self->_sessionFlags >> 7) & 3) == a3) {
    goto LABEL_5;
  }
  uint64_t v3 = *(void *)&a3;
  id v5 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (!v5 || (int v6 = [v5 _setPreferredEngine:v3]) != 0)
  {
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFE7F | ((v3 & 3) << 7));
LABEL_5:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)setNextRecognitionRequiresReset:(BOOL)a3
{
  if ((((*((unsigned char *)&self->_sessionFlags + 1) & 0x10) == 0) ^ a3)) {
    return 1;
  }
  BOOL v4 = a3;
  id v6 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (v6)
  {
    BOOL result = [v6 _setEngineResetRequired:v4];
    unsigned int v7 = *(_DWORD *)&self->_sessionFlags & 0xFFFFEFFF;
  }
  else
  {
    if (v4) {
      int v8 = 4096;
    }
    else {
      int v8 = 0;
    }
    unsigned int v7 = *(_DWORD *)&self->_sessionFlags & 0xFFFFEFFF | v8;
    BOOL result = 1;
  }
  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)v7;
  return result;
}

- (BOOL)setNextRecognitionAudioInputPath:(id)a3
{
  if (self->_audioInputPath == a3) {
    return 1;
  }
  id v5 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (!v5)
  {

    self->_audioInputPath = (NSString *)a3;
    return 1;
  }
  return [v5 _setAudioInputPath:a3];
}

- (id)debugDumpPath
{
  return self->_debugDumpPath;
}

- (BOOL)setDebugDumpEnabled:(BOOL)a3
{
  if ((((*(unsigned char *)&self->_sessionFlags & 0x40) == 0) ^ a3))
  {
LABEL_11:
    LOBYTE(v7) = 1;
    return v7;
  }
  BOOL v3 = a3;

  self->_debugDumpPath = 0;
  id v5 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (!v5)
  {
LABEL_7:
    if (v3) {
      int v8 = 64;
    }
    else {
      int v8 = 0;
    }
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFBF | v8);
    goto LABEL_11;
  }
  id v6 = v5;
  int v7 = [v5 _setDebugDumpEnabled:v3];
  if (v7 && v3)
  {
    self->_debugDumpPath = (NSString *)(id)[v6 _debugDumpPath];
    goto LABEL_7;
  }
  if (v7) {
    goto LABEL_7;
  }
  return v7;
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__VSRecognitionSession_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke;
  block[3] = &unk_2640E88C0;
  block[4] = a3;
  block[5] = self;
  block[6] = a7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __105__VSRecognitionSession_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 56))
  {
    int v2 = *(_DWORD *)(v1 + 104);
    if ((v2 & 0x2000) != 0)
    {
      *(_DWORD *)(v1 + 104) = v2 & 0xFFFFDFFF;
      return [*(id *)(result + 40) _notifyDelegateFinishedSpeakingWithError:*(void *)(result + 48)];
    }
  }
  return result;
}

- (void)_notifyDelegateFinishedSpeakingWithError:(id)a3
{
  if ((*(unsigned char *)&self->_sessionFlags & 0x10) != 0) {
    [(VSRecognitionSessionDelegate *)self->_delegate recognitionSession:self didFinishSpeakingFeedbackStringWithError:a3];
  }
}

- (id)_beginSpeakingString:(id)a3 attributedString:(id)a4
{
  if (!self->_synthesizer)
  {
    int v7 = [[VSSpeechSynthesizer alloc] initForInputFeedback];
    self->_synthesizer = v7;
    [(VSSpeechSynthesizer *)v7 setDelegate:self];
  }
  if (!self->_languageID) {
    self->_languageID = (NSString *)VSPreferencesCopySpokenLanguageIdentifier();
  }
  int v8 = objc_alloc_init(VSSpeechRequest);
  v9 = v8;
  if (a4) {
    [(VSSpeechRequest *)v8 setAttributedText:a4];
  }
  else {
    [(VSSpeechRequest *)v8 setText:a3];
  }
  [(VSSpeechRequest *)v9 setLanguageCode:self->_languageID];
  [(VSSpeechRequest *)v9 setOutputPath:0];
  if (![(VSSpeechSynthesizer *)self->_synthesizer startSpeakingRequest:v9]) {
    *(_DWORD *)&self->_sessionFlags |= 0x2000u;
  }

  return 0;
}

- (id)_beginSpeakingAttributedString:(id)a3
{
  if ([a3 length])
  {
    return [(VSRecognitionSession *)self _beginSpeakingString:0 attributedString:a3];
  }
  else
  {
    [(VSRecognitionSession *)self _notifyDelegateFinishedSpeakingWithError:0];
    return 0;
  }
}

- (id)beginSpeakingString:(id)a3
{
  if ([a3 length])
  {
    return [(VSRecognitionSession *)self _beginSpeakingString:a3 attributedString:0];
  }
  else
  {
    [(VSRecognitionSession *)self _notifyDelegateFinishedSpeakingWithError:0];
    return 0;
  }
}

- (id)beginSpeakingFeedbackString
{
  userInfoKeys[1] = *(void **)MEMORY[0x263EF8340];
  if ((*((unsigned char *)&self->_sessionFlags + 1) & 0x20) != 0 || !self->_currentAction)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    id v6 = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = @"session is already speaking";
    userInfoKeys[0] = v6;
    CFErrorRef v7 = CFErrorCreateWithUserInfoKeysAndValues(v5, @"VSErrorDomain", -4003, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    int v8 = v7;
    return v7;
  }
  else
  {
    id v3 = [(VSRecognitionSession *)self spokenFeedbackAttributedString];
    if (v3)
    {
      return [(VSRecognitionSession *)self _beginSpeakingAttributedString:v3];
    }
    else
    {
      id v9 = [(VSRecognitionSession *)self spokenFeedbackString];
      return [(VSRecognitionSession *)self beginSpeakingString:v9];
    }
  }
}

- (void)_keywordIndexChanged
{
  topLevelKeywords = self->_topLevelKeywords;
  if (topLevelKeywords)
  {

    self->_topLevelKeywords = 0;
  }
  if (objc_msgSend(-[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction"), "_keywordIndexChanged"))
  {
    BOOL v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"VSRecognitionSessionKeywordsDidChangeNotification" object:self userInfo:0];
  }
}

- (id)_keywordsForModelIdentifier:(id)a3
{
  if (a3)
  {
    CFAllocatorRef v5 = [(VSRecognitionSession *)self _createKeywordIndex];
    if (!v5) {
      return 0;
    }
    id v6 = v5;
    CFMutableArrayRef v7 = VSKeywordIndexCopyKeywordsForModelIdentifier(v5, a3);
    if (v7)
    {
      CFMutableArrayRef v8 = v7;
      id v9 = [(VSRecognitionSession *)self _createPhaseSortedKeywordsFromArray:v7];
    }
    else
    {
      id v9 = 0;
    }
    id v11 = v9;
    CFRelease(v6);
    return v9;
  }
  else
  {
    return [(VSRecognitionSession *)self _topLevelKeywords];
  }
}

- (id)_topLevelKeywords
{
  topLevelKeywords = self->_topLevelKeywords;
  if (!topLevelKeywords)
  {
    BOOL v4 = [(VSRecognitionSession *)self _createKeywordIndex];
    if (v4)
    {
      CFAllocatorRef v5 = v4;
      CFMutableArrayRef v6 = VSKeywordIndexCopyKeywordsForTopLevelModels(v4);
      if (v6)
      {
        CFMutableArrayRef v7 = v6;
        topLevelKeywords = [(VSRecognitionSession *)self _createPhaseSortedKeywordsFromArray:v6];

        CFRelease(v5);
        if (topLevelKeywords)
        {
LABEL_8:
          self->_topLevelKeywords = topLevelKeywords;
          return topLevelKeywords;
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
    topLevelKeywords = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    goto LABEL_8;
  }
  return topLevelKeywords;
}

- (id)_createPhaseSortedKeywordsFromArray:(id)a3
{
  if (![a3 count]) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v6 = [a3 _scrambledKeywordsAndAddToSet:v5];
  if (self->_keywordPhase)
  {
    CFMutableArrayRef v7 = (void *)v6;
    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
    id v10 = 0;
    while ([v5 count])
    {
      [v8 removeAllObjects];
      if (self->_keywordPhase)
      {
        unint64_t v11 = 0;
        do
        {
          if (![v5 count]) {
            break;
          }
          uint64_t v12 = [v7 _nextKeywordUsingCursors:Mutable];
          if (v12)
          {
            uint64_t v13 = v12;
            if (([v8 containsObject:v12] & 1) == 0)
            {
              if (!v10) {
                id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
              }
              [v10 addObject:v13];
              [v8 addObject:v13];
              [v5 removeObject:v13];
              ++v11;
            }
          }
        }
        while (v11 < self->_keywordPhase);
      }
    }
    CFRelease(Mutable);
  }
  else
  {
    id v10 = (id)[v5 allObjects];
  }

  return v10;
}

- (__CFDictionary)_createKeywordIndex
{
  pthread_mutex_lock(&_createKeywordIndex___KeywordIndexLock);
  id v3 = (const __CFAllocator **)MEMORY[0x263EFFB08];
  if (!_createKeywordIndex___KeywordIndexURL) {
    _createKeywordIndex___KeywordIndexURL = (uint64_t)VSKeywordIndexCopyDefaultURL((const __CFAllocator *)*MEMORY[0x263EFFB08]);
  }
  pthread_mutex_unlock(&_createKeywordIndex___KeywordIndexLock);
  if (_createKeywordIndex___KeywordIndexURL) {
    BOOL v4 = (__CFDictionary *)VSKeywordIndexCreateWithURL(*v3, (const __CFURL *)_createKeywordIndex___KeywordIndexURL);
  }
  else {
    BOOL v4 = 0;
  }
  if ((*((unsigned char *)&self->_sessionFlags + 2) & 4) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_VSRecognitionSessionKeywordIndexChangedNotificationHandler, @"com.apple.voiceservices.kwidxchanged", 0, CFNotificationSuspensionBehaviorDrop);
    *(_DWORD *)&self->_sessionFlags |= 0x40000u;
  }
  return v4;
}

- (int64_t)keywordCount
{
  id v2 = [(VSRecognitionSession *)self _currentRecognizeAction];
  return [v2 _keywordCount];
}

- (id)keywordAtIndex:(int64_t)a3
{
  id v4 = [(VSRecognitionSession *)self _currentRecognizeAction];
  return (id)[v4 _keywordAtIndex:a3];
}

- (void)setKeywordPhase:(unint64_t)a3
{
  if (self->_keywordPhase != a3)
  {
    self->_keywordPhase = a3;

    self->_topLevelKeywords = 0;
  }
}

- (float)inputLevelDB
{
  id v2 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (!v2) {
    return 0.0;
  }
  [v2 _inputLevelDB];
  return result;
}

- (float)inputLevel
{
  id v2 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (!v2) {
    return 0.0;
  }
  [v2 _inputLevel];
  return result;
}

- (void)setInputLevelUpdateInterval:(double)a3
{
  if (self->_levelInterval != a3)
  {
    self->_levelInterval = a3;
    id v4 = [(VSRecognitionSession *)self _currentRecognizeAction];
    if (v4)
    {
      [v4 _setInputLevelUpdateInterval:a3];
    }
  }
}

- (id)displayStatusString
{
  return [(VSRecognitionAction *)self->_currentAction statusDisplayString];
}

- (id)displayResultString
{
  return [(VSRecognitionAction *)self->_currentAction resultDisplayString];
}

- (id)spokenFeedbackAttributedString
{
  return [(VSRecognitionAction *)self->_currentAction spokenFeedbackAttributedString];
}

- (id)spokenFeedbackString
{
  return [(VSRecognitionAction *)self->_currentAction spokenFeedbackString];
}

- (void)recognitionResultHandlingThread:(id)a3 didHandleResults:(id)a4 nextAction:(id)a5
{
  id v7 = [(VSRecognitionSession *)self _currentRecognizeAction];
  [v7 _handledThreadedResults:a4 nextAction:a5];
}

- (id)_recognitionResultHandlingThread
{
  id result = self->_handlingThread;
  if (!result)
  {
    id v4 = objc_alloc_init(VSRecognitionResultHandlingThread);
    self->_handlingThread = v4;
    [(VSRecognitionResultHandlingThread *)v4 setDelegate:self];
    return self->_handlingThread;
  }
  return result;
}

- (id)_currentRecognizeAction
{
  if (objc_opt_isKindOfClass()) {
    return self->_currentAction;
  }
  else {
    return 0;
  }
}

- (void)_setAction:(id)a3
{
  currentAction = self->_currentAction;
  if (currentAction != a3)
  {
    [(VSRecognitionAction *)self->_currentAction _setSession:0];

    uint64_t v6 = (VSRecognitionAction *)a3;
    self->_currentAction = v6;
    [(VSRecognitionAction *)v6 _setSession:self];
  }
  id v7 = [(VSRecognitionSession *)self _currentRecognizeAction];
  unsigned int sessionFlags = self->_sessionFlags;
  if (v7)
  {
    id v9 = v7;
    if ((sessionFlags & 0x40) != 0)
    {
      if (self->_debugDumpPath) {
        objc_msgSend(v7, "_setDebugDumpPath:");
      }
      else {
        [v7 _setDebugDumpEnabled:1];
      }
    }
    [v9 _setPreferredEngine:(*(_DWORD *)&self->_sessionFlags >> 7) & 3];
    [v9 _setAudioInputPath:self->_audioInputPath];
    [v9 _setInputLevelUpdateInterval:self->_levelInterval];
    [v9 _setEngineResetRequired:(*(_DWORD *)&self->_sessionFlags >> 12) & 1];
    [v9 _setBluetoothInputAllowed:(*(_DWORD *)&self->_sessionFlags >> 11) & 1];

    self->_audioInputPath = 0;
    unsigned int sessionFlags = *(_DWORD *)&self->_sessionFlags & 0xFFFFEFFF;
  }
  self->_unsigned int sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(sessionFlags & 0xFFFEBFFF);
  if (currentAction != a3)
  {
    id v10 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"VSRecognitionSessionKeywordsDidChangeNotification" object:self];
  }
}

- (void)_notifyDelegateOpenURL:(id)a3 completion:(id)a4
{
  $6825843C93F9D5008761B55003A2C12E sessionFlags = self->_sessionFlags;
  if ((*(unsigned char *)&sessionFlags & 8) != 0)
  {
    delegate = self->_delegate;
    [(VSRecognitionSessionDelegate *)delegate recognitionSession:self openURL:a3 completion:a4];
  }
  else if ((*(unsigned char *)&sessionFlags & 4) != 0)
  {
    uint64_t v9 = -[VSRecognitionSessionDelegate recognitionSession:openURL:](self->_delegate, "recognitionSession:openURL:");
    id v10 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v10(a4, v9);
  }
}

- (void)_notifyDelegateActionStarted
{
  if ((*(unsigned char *)&self->_sessionFlags & 2) != 0) {
    [(VSRecognitionSessionDelegate *)self->_delegate recognitionSessionDidBeginAction:self];
  }
}

- (BOOL)_actionStarted:(id)a3
{
  if (self->_currentAction == a3 && [a3 _hasDeferredStartCallback])
  {
    if (*(unsigned char *)&self->_sessionFlags)
    {
      int v4 = [(VSRecognitionSessionDelegate *)self->_delegate recognitionSessionWillBeginAction:self];
      if (!v4)
      {
        *(_DWORD *)&self->_sessionFlags |= 0x10000u;
        return v4;
      }
    }
    [(VSRecognitionSession *)self _notifyDelegateActionStarted];
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (void)_actionCompleted:(id)a3 nextAction:(id)a4 error:(id)a5
{
  id v15 = a4;
  id v16 = a3;
  id v14 = a5;
  if (self->_currentAction == a3)
  {
    $6825843C93F9D5008761B55003A2C12E sessionFlags = self->_sessionFlags;
    if ((*(_DWORD *)&sessionFlags & 0x20000) == 0)
    {
      if ((*(_WORD *)&sessionFlags & 0x8000) != 0)
      {
        unint64_t v11 = objc_msgSend(MEMORY[0x263EFF958], "invocationWithMethodSignature:", -[VSRecognitionSession methodSignatureForSelector:](self, "methodSignatureForSelector:", a2));
        [v11 setSelector:a2];
        [v11 setTarget:self];
        [v11 setArgument:&v16 atIndex:2];
        [v11 setArgument:&v15 atIndex:3];
        [v11 setArgument:&v14 atIndex:4];
        [v11 retainArguments];
        [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:v11 invocation:0 repeats:0.0];
      }
      else
      {
        id v8 = a4;
        id v12 = a3;
        if ((*((unsigned char *)&self->_sessionFlags + 1) & 2) == 0)
        {
          if ([(VSRecognitionSession *)self _currentRecognizeAction])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              id v8 = 0;
            }
          }
        }
        if (a5) {
          id v9 = 0;
        }
        else {
          id v9 = v8;
        }
        -[VSRecognitionSession _setAction:](self, "_setAction:", v9, v12, v14, v15, v16);
        if (a5 || !v8 && ![v13 completionType]) {
          *(_DWORD *)&self->_sessionFlags |= 0x20000u;
        }
        if ((*(unsigned char *)&self->_sessionFlags & 0x20) != 0) {
          [(VSRecognitionSessionDelegate *)self->_delegate recognitionSession:self didCompleteActionWithError:a5];
        }
      }
    }
  }
}

- (id)cancel
{
  return [(VSRecognitionSession *)self cancelMaintainingKeepAlive:0];
}

- (id)cancelMaintainingKeepAlive:(BOOL)a3
{
  id v5 = [(VSRecognitionAction *)self->_currentAction cancel];
  [(VSRecognitionSession *)self _setAction:0];
  *(_DWORD *)&self->_sessionFlags |= 0x20000u;
  if (!a3)
  {
    [(VSKeepAlive *)self->_keepAlive setActive:0];

    self->_keepAlive = 0;
  }
  id handlingThread = self->_handlingThread;
  if (handlingThread)
  {
    [handlingThread invalidate];
    [self->_handlingThread setDelegate:0];

    self->_id handlingThread = 0;
  }
  $6825843C93F9D5008761B55003A2C12E sessionFlags = self->_sessionFlags;
  if ((*(_WORD *)&sessionFlags & 0x2000) != 0)
  {
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&sessionFlags & 0xFFFFDFFF);
    [(VSSpeechSynthesizer *)self->_synthesizer stopSpeakingAtNextBoundary:0 synchronously:0 error:0];
  }
  return v5;
}

- (BOOL)setBluetoothInputAllowed:(BOOL)a3
{
  if ((((*((unsigned char *)&self->_sessionFlags + 1) & 8) == 0) ^ a3))
  {
LABEL_8:
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v3 = a3;
  id v5 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (!v5 || (int v6 = [v5 _setBluetoothInputAllowed:v3]) != 0)
  {
    if (v3) {
      int v7 = 2048;
    }
    else {
      int v7 = 0;
    }
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFF7FF | v7);
    goto LABEL_8;
  }
  return v6;
}

- (BOOL)sensitiveActionsEnabled
{
  return (*((unsigned __int8 *)&self->_sessionFlags + 1) >> 2) & 1;
}

- (void)setSensitiveActionsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFBFF | v3);
}

- (BOOL)nextActionWillRecognize
{
  return (*((unsigned char *)&self->_sessionFlags + 1) & 0x40) == 0
      && [(VSRecognitionSession *)self _currentRecognizeAction] != 0;
}

- (BOOL)nextActionWillTerminateSession
{
  return [(VSRecognitionAction *)self->_currentAction completionType] == 0;
}

- (BOOL)isBusy
{
  return (*((unsigned char *)&self->_sessionFlags + 1) & 0x40) != 0 && self->_currentAction != 0;
}

- (BOOL)hasDeferredAction
{
  return *((unsigned char *)&self->_sessionFlags + 2) & 1;
}

- (BOOL)isValid
{
  return (*((unsigned char *)&self->_sessionFlags + 2) & 2) == 0;
}

- (BOOL)isFinished
{
  return self->_currentAction == 0;
}

- (BOOL)isActivelyRecognizing
{
  id v2 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (v2)
  {
    LOBYTE(v2) = [v2 _isActivelyRecognizing];
  }
  return (char)v2;
}

- (BOOL)isRecognizing
{
  id v2 = [(VSRecognitionSession *)self _currentRecognizeAction];
  if (v2)
  {
    LOBYTE(v2) = [v2 _isRecognizing];
  }
  return (char)v2;
}

- (id)reset
{
  userInfoKeys[1] = *(void **)MEMORY[0x263EF8340];
  if ((*((unsigned char *)&self->_sessionFlags + 2) & 2) != 0 || self->_currentAction)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    int v4 = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = @"session is invalid or not finished";
    userInfoKeys[0] = v4;
    CFErrorRef v5 = CFErrorCreateWithUserInfoKeysAndValues(v3, @"VSErrorDomain", -4003, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
  }
  else
  {
    int v7 = [[VSRecognitionRecognizeAction alloc] initWithModelIdentifier:self->_modelIdentifier];
    [(VSRecognitionSession *)self _setAction:v7];

    CFErrorRef v5 = 0;
  }
  return v5;
}

- (id)beginNextAction
{
  userInfoKeys[1] = *(void **)MEMORY[0x263EF8340];
  $6825843C93F9D5008761B55003A2C12E sessionFlags = self->_sessionFlags;
  currentAction = self->_currentAction;
  if ((*(_WORD *)&sessionFlags & 0x4000) != 0)
  {
    if ((*(_DWORD *)&sessionFlags & 0x10000) != 0 && currentAction)
    {
      self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&sessionFlags & 0xFFFEFFFF);
      [(VSRecognitionSession *)self _notifyDelegateActionStarted];
      [(VSRecognitionAction *)self->_currentAction _continueAfterDeferredStart];
      return 0;
    }
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    userInfoKeys[0] = *(void **)MEMORY[0x263EFFC48];
    id v9 = @"action already in progress";
LABEL_10:
    userInfoValues = v9;
    CFErrorRef v6 = CFErrorCreateWithUserInfoKeysAndValues(v8, @"VSErrorDomain", -4003, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    id v10 = v6;
    return v6;
  }
  if (!currentAction)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    userInfoKeys[0] = *(void **)MEMORY[0x263EFFC48];
    id v9 = @"session is finished or invalid";
    goto LABEL_10;
  }
  CFErrorRef v5 = currentAction;
  *(_DWORD *)&self->_sessionFlags |= 0xC000u;
  CFErrorRef v6 = [(VSRecognitionAction *)self->_currentAction perform];
  $6825843C93F9D5008761B55003A2C12E v7 = self->_sessionFlags;
  self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&v7 & 0xFFFF7FFF);
  if (v6)
  {
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&v7 & 0xFFFF3FFF);
  }
  else
  {
    if (![(VSRecognitionAction *)self->_currentAction _hasDeferredStartCallback]) {
      [(VSRecognitionSession *)self _notifyDelegateActionStarted];
    }
    if ((*(unsigned char *)&self->_sessionFlags & 0x40) != 0 && !self->_debugDumpPath)
    {
      id v11 = [(VSRecognitionSession *)self _currentRecognizeAction];
      if (v11) {
        self->_debugDumpPath = (NSString *)(id)[v11 _debugDumpPath];
      }
    }
    if (!self->_keepAlive)
    {
      id v12 = objc_alloc_init(VSKeepAlive);
      self->_keepAlive = v12;
      [(VSKeepAlive *)v12 setAudioType:3];
      [(VSKeepAlive *)self->_keepAlive setKeepAudioSessionActive:1];
      [(VSKeepAlive *)self->_keepAlive setActive:1];
    }
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (VSRecognitionSessionDelegate *)a3;
    if (objc_opt_respondsToSelector()) {
      int v4 = 2;
    }
    else {
      int v4 = 0;
    }
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFFD | v4);
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if (objc_opt_respondsToSelector()) {
      int v5 = 4;
    }
    else {
      int v5 = 0;
    }
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFFB | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 8;
    }
    else {
      int v6 = 0;
    }
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFF7 | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 32;
    }
    else {
      int v7 = 0;
    }
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFDF | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 16;
    }
    else {
      int v8 = 0;
    }
    self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFEF | v8);
  }
}

- (void)dealloc
{
  [(VSRecognitionSession *)self cancel];

  [(VSSpeechSynthesizer *)self->_synthesizer setDelegate:0];
  [(VSKeepAlive *)self->_keepAlive setActive:0];

  if ((*((unsigned char *)&self->_sessionFlags + 2) & 4) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.voiceservices.kwidxchanged", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionSession;
  [(VSRecognitionSession *)&v4 dealloc];
}

- (VSRecognitionSession)initWithModelIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSRecognitionSession;
  objc_super v4 = [(VSRecognitionSession *)&v6 init];
  if (v4)
  {
    v4->_modelIdentifier = (NSString *)a3;
    [(VSRecognitionSession *)v4 _init];
  }
  return v4;
}

- (VSRecognitionSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSRecognitionSession;
  id v2 = [(VSRecognitionSession *)&v5 init];
  CFAllocatorRef v3 = v2;
  if (v2) {
    [(VSRecognitionSession *)v2 _init];
  }
  return v3;
}

- (void)_init
{
  self->_$6825843C93F9D5008761B55003A2C12E sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFF87F | 0x600);
  [(VSRecognitionSession *)self reset];
  unsigned int v2 = time(0);
  srandom(v2);
}

@end