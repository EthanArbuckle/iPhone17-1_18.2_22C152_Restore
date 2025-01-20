@interface TIKeyboardInputManagerBase
- (BOOL)hasHandledInput;
- (BOOL)isHardwareKeyboardAutocorrectionEnabled;
- (BOOL)isHighMemoryManager;
- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (NSString)currentInputModeIdentifier;
- (TIInputMode)inputMode;
- (TIKeyboardInputManagerBase)init;
- (TIKeyboardInputManagerBase)initWithInputMode:(id)a3 keyboardState:(id)a4;
- (TIKeyboardInputManagerLogging)inputManagerLogger;
- (TITypologyPreferences)typologyPreferences;
- (_NSRange)smartSelectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7;
- (id)configurationPropertyList;
- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4;
- (id)generateRefinementsForCandidate:(id)a3;
- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)humanReadableTrace;
- (id)keyboardConfiguration;
- (id)resourceInputModes;
- (int64_t)deletionCountForString:(id)a3;
- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)resume;
- (void)setInputManagerLogger:(id)a3;
- (void)setTypologyPreferences:(id)a3;
@end

@implementation TIKeyboardInputManagerBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputManagerLogger, 0);
  objc_storeStrong((id *)&self->_typologyPreferences, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setInputManagerLogger:(id)a3
{
}

- (TIKeyboardInputManagerLogging)inputManagerLogger
{
  return self->_inputManagerLogger;
}

- (void)setTypologyPreferences:(id)a3
{
}

- (TITypologyPreferences)typologyPreferences
{
  return self->_typologyPreferences;
}

- (BOOL)hasHandledInput
{
  return self->_hasHandledInput;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (int64_t)deletionCountForString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length] && (uint64_t v5 = objc_msgSend(v4, "length"), v5 >= 1))
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    do
    {
      [v4 _rangeOfBackwardDeletionClusterAtIndex:v6 - 1];
      v6 -= v8;
      ++v7;
    }
    while (v6 > 0);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (_NSRange)smartSelectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  return -1;
}

- (id)generateRefinementsForCandidate:(id)a3
{
  return 0;
}

- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4
{
  return 0;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  return 0;
}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  return &stru_1F3F7A998;
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  if (a5)
  {
    id v5 = a5;
    [v5 open];
    id v6 = [MEMORY[0x1E4FAE310] setWithCandidates:0];
    [v5 pushCandidateResultSet:v6];
    [v5 close];
  }
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  if (a5)
  {
    id v5 = a5;
    [v5 open];
    id v6 = [MEMORY[0x1E4FAE278] listWithAutocorrection:0 predictions:0];
    [v5 pushCandidates:v6];
    [v5 close];
  }
}

- (id)handleKeyboardInput:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FAE370];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 string];

  if (v6)
  {
    int64_t v7 = [v4 string];

    [v5 setInsertionText:v7];
  }
  else
  {
    int v8 = [v4 isBackspace];

    if (v8) {
      [v5 setDeletionCount:1];
    }
  }

  return v5;
}

- (id)keyboardConfiguration
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FAE320]);
  id v3 = objc_alloc_init(MEMORY[0x1E4FAE340]);
  [v2 setInputManagerState:v3];

  return v2;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (BOOL)isHighMemoryManager
{
  return 0;
}

- (void)resume
{
  self->_hasHandledInput = 0;
}

- (NSString)currentInputModeIdentifier
{
  return [(TIInputMode *)self->_inputMode normalizedIdentifier];
}

- (TIKeyboardInputManagerBase)initWithInputMode:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerBase;
  int64_t v7 = [(TIKeyboardInputManagerBase *)&v10 init];
  int v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_inputMode, a3);
  }

  return v8;
}

- (TIKeyboardInputManagerBase)init
{
  return [(TIKeyboardInputManagerBase *)self initWithInputMode:0 keyboardState:0];
}

- (id)configurationPropertyList
{
  return 0;
}

- (id)humanReadableTrace
{
  return 0;
}

- (BOOL)isHardwareKeyboardAutocorrectionEnabled
{
  return 0;
}

- (id)resourceInputModes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end