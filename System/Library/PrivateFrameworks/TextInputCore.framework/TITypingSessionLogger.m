@interface TITypingSessionLogger
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldPrintEvent:(id)a3;
- (NSArray)typingEvents;
- (TITypingSessionLogger)init;
- (TITypingSessionLogger)initWithCoder:(id)a3;
- (id)logDetailsForKeyboardState:(id)a3;
- (id)savedSession;
- (id)temporaryKeyboardsDirectory;
- (unint64_t)eventCount;
- (void)acceptingCandidateWithTrigger:(id)a3;
- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4;
- (void)addKeyInput:(id)a3 keyboardState:(id)a4;
- (void)addTouchEvent:(id)a3;
- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11;
- (void)candidatesOffered:(id)a3 keyboardState:(id)a4;
- (void)changingContextWithTrigger:(id)a3;
- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10;
- (void)encodeWithCoder:(id)a3;
- (void)layoutDidChange:(id)a3 keyboardState:(id)a4;
- (void)saveRecording;
- (void)sendTo:(id)a3;
- (void)setClientID:(id)a3 keyboardState:(id)a4;
@end

@implementation TITypingSessionLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingEvents, 0);

  objc_storeStrong((id *)&self->_savedSession, 0);
}

- (NSArray)typingEvents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (id)savedSession
{
  return self->_savedSession;
}

- (id)temporaryKeyboardsDirectory
{
  v2 = NSTemporaryDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/Keyboard"];

  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = 0;
  [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v6];

  return v3;
}

- (void)saveRecording
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    id v21 = 0;
    v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v21];
    id v4 = v21;
    if (v4)
    {
      v5 = IXADefaultLogFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = NSString;
        v7 = [v4 description];
        v8 = [v6 stringWithFormat:@"%s failed to store session in file: %@", "-[TITypingSessionLogger saveRecording]", v7];
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      v5 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
      uint64_t v9 = [v5 stringForKey:@"typingSessionRecordingName"];
      v10 = (void *)v9;
      v11 = &stru_1F3F7A998;
      if (v9) {
        v11 = (__CFString *)v9;
      }
      v12 = v11;

      if (![(__CFString *)v12 length])
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v13 setDateFormat:@"MM-dd-HH-mm"];
        v14 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v15 = [v13 stringFromDate:v14];

        v12 = (__CFString *)v15;
      }
      v16 = [(TITypingSessionLogger *)self temporaryKeyboardsDirectory];
      v17 = [NSString stringWithFormat:@"typingSessionLog-%@.data", v12];
      v18 = [v16 stringByAppendingPathComponent:v17];

      [v3 writeToFile:v18 atomically:1];
    }

    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
    if ([v19 BOOLForKey:@"typingSessionNotificationsEnabled"])
    {
      v20 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v20 postNotificationName:@"com.apple.keyboard.inputAnalytics.sessionRecordingDidComplete" object:0 userInfo:0 deliverImmediately:1];
    }
  }
}

- (id)logDetailsForKeyboardState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 inputMode];
  v5 = TIInputModeGetLanguage();

  uint64_t v6 = [v3 inputMode];
  v7 = TIInputModeGetRegion();

  v8 = [v3 layoutState];
  uint64_t v9 = [v8 softwareLayout];

  LODWORD(v8) = [v3 hardwareKeyboardMode];
  unsigned int v10 = [v3 floatingKeyboardMode];
  unsigned int v11 = [v3 splitKeyboardMode];
  unsigned int v12 = [v3 landscapeOrientation];

  id v13 = [NSString stringWithFormat:@"%@_%@|%d|%d|%d|%d|%@", v5, v7, v8, v10, v11, v12, v9];

  return v13;
}

- (void)sendTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_typingEvents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "sendTo:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)shouldPrintEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            objc_opt_isKindOfClass();
          }
        }
      }
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setClientID:(id)a3 keyboardState:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IXADefaultLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = NSString;
    long long v12 = [(TITypingSessionLogger *)self logDetailsForKeyboardState:v7];
    long long v13 = [v11 stringWithFormat:@"%s Set Client ID: %@, KeyboardState=%@", "-[TITypingSessionLogger setClientID:keyboardState:]", v6, v12];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v13;
    _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  typingEvents = self->_typingEvents;
  long long v10 = [[TIKeyboardInteractionProtocolEventSetClientID alloc] initWithClientID:v6 keyboardState:v7];
  [(NSMutableArray *)typingEvents addObject:v10];
}

- (void)layoutDidChange:(id)a3 keyboardState:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IXADefaultLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = NSString;
    uint64_t v12 = [v6 firstKeyString];
    long long v13 = [(TITypingSessionLogger *)self logDetailsForKeyboardState:v7];
    v14 = [v11 stringWithFormat:@"%s Layout Did Change: firstKeyString=%s, KeyboardState=%@", "-[TITypingSessionLogger layoutDidChange:keyboardState:]", v12, v13];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v14;
    _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  typingEvents = self->_typingEvents;
  long long v10 = [[TIKeyboardInteractionProtocolEventLayoutDidChange alloc] initWithLayout:v6 keyboardState:v7];
  [(NSMutableArray *)typingEvents addObject:v10];
}

- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  BOOL v26 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a10;
  id v16 = a7;
  id v17 = a3;
  v18 = IXADefaultLogFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v21 = "NO";
    if (v12) {
      id v21 = "YES";
    }
    v22 = v21;
    v23 = NSString;
    v25 = [(TITypingSessionLogger *)self logDetailsForKeyboardState:v15];
    uint64_t v24 = [v23 stringWithFormat:@"%s Context Did Change: wordDelete=%s, KeyboardState=%@", "-[TITypingSessionLogger contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:]", v22, v25];
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_debug_impl(&dword_1E3F0E000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  typingEvents = self->_typingEvents;
  v20 = -[TIKeyboardInteractionProtocolEventContextDidChange initWithContext:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:]([TIKeyboardInteractionProtocolEventContextDidChange alloc], "initWithContext:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", v17, v12, v11, v26, v16, a8.location, a8.length, a9, v15);

  [(NSMutableArray *)typingEvents addObject:v20];
}

- (void)changingContextWithTrigger:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = IXADefaultLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s Changing context, trigger=%@", "-[TITypingSessionLogger changingContextWithTrigger:]", v4];
    *(_DWORD *)buf = 138412290;
    long long v10 = v8;
    _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  typingEvents = self->_typingEvents;
  id v7 = [[TIKeyboardInteractionProtocolEventChangingContextWithTrigger alloc] initWithContextChangeTrigger:v4];
  [(NSMutableArray *)typingEvents addObject:v7];
}

- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  BOOL v29 = a8;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a11;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = IXADefaultLogFacility();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    BOOL v26 = NSString;
    v28 = [(TITypingSessionLogger *)self logDetailsForKeyboardState:v17];
    v27 = [v26 stringWithFormat:@"%s Candidate accepted, Cand=%@, KeyboardState=%@", "-[TITypingSessionLogger candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", v16, v28];
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_debug_impl(&dword_1E3F0E000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  typingEvents = self->_typingEvents;
  LOBYTE(v25) = a9;
  uint64_t v24 = [[TIKeyboardInteractionProtocolEventCandidateAccepted alloc] initWithCandidateAccepted:v16 withInput:v21 documentState:v20 inputContext:v19 inputStem:v18 predictionBarHit:v29 useCandidateSelection:v25 candidateIndex:a10 keyboardState:v17];

  [(NSMutableArray *)typingEvents addObject:v24];
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = IXADefaultLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s Accepting candidate, trigger=%@", "-[TITypingSessionLogger acceptingCandidateWithTrigger:]", v4];
    *(_DWORD *)buf = 138412290;
    long long v10 = v8;
    _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  typingEvents = self->_typingEvents;
  id v7 = [[TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger alloc] initWithCandidateAcceptedTrigger:v4];
  [(NSMutableArray *)typingEvents addObject:v7];
}

- (void)candidatesOffered:(id)a3 keyboardState:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = IXADefaultLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = NSString;
      BOOL v12 = [v6 corrections];
      long long v13 = [v12 autocorrection];
      v14 = [v6 predictions];
      id v15 = [(TITypingSessionLogger *)self logDetailsForKeyboardState:v7];
      id v16 = [v11 stringWithFormat:@"%s Candidates offered, AC=%@, Predictions=%@, KeyboardState=%@", "-[TITypingSessionLogger candidatesOffered:keyboardState:]", v13, v14, v15];
      *(_DWORD *)buf = 138412290;
      id v18 = v16;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  typingEvents = self->_typingEvents;
  long long v10 = [[TIKeyboardInteractionProtocolEventCandidatesOffered alloc] initWithCandidatesOffered:v6 keyboardState:v7];
  [(NSMutableArray *)typingEvents addObject:v10];
}

- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  typingEvents = self->_typingEvents;
  id v6 = a4;
  id v7 = [[TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount alloc] initWithSyllableCount:a3 keyboardState:v6];

  [(NSMutableArray *)typingEvents addObject:v7];
}

- (void)addTouchEvent:(id)a3
{
  typingEvents = self->_typingEvents;
  id v4 = a3;
  v5 = [[TIKeyboardInteractionProtocolEventAddTouchEvent alloc] initWithTouchEvent:v4];

  [(NSMutableArray *)typingEvents addObject:v5];
}

- (void)addKeyInput:(id)a3 keyboardState:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IXADefaultLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = NSString;
    BOOL v12 = [(TITypingSessionLogger *)self logDetailsForKeyboardState:v7];
    long long v13 = [v11 stringWithFormat:@"%s Add Key Input: %@, KeyboardState=%@", "-[TITypingSessionLogger addKeyInput:keyboardState:]", v6, v12];
    *(_DWORD *)buf = 138412290;
    id v15 = v13;
    _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  typingEvents = self->_typingEvents;
  long long v10 = [[TIKeyboardInteractionProtocolEventAddKeyInput alloc] initWithKeyInput:v6 keyboardState:v7];
  [(NSMutableArray *)typingEvents addObject:v10];
}

- (unint64_t)eventCount
{
  return [(NSMutableArray *)self->_typingEvents count];
}

- (void)encodeWithCoder:(id)a3
{
}

- (TITypingSessionLogger)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TITypingSessionLogger;
  v5 = [(TITypingSessionLogger *)&v23 init];
  if (v5)
  {
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v22, "setWithObjects:", v21, v20, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"typingEvents"];
    typingEvents = v5->_typingEvents;
    v5->_typingEvents = (NSMutableArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typingSession"];
    savedSession = v5->_savedSession;
    v5->_savedSession = (TIKeyboardInteractionProtocol *)v17;
  }
  return v5;
}

- (TITypingSessionLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITypingSessionLogger;
  v2 = [(TITypingSessionLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    typingEvents = v2->_typingEvents;
    v2->_typingEvents = (NSMutableArray *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end