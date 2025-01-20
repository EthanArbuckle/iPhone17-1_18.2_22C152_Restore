@interface TIKeyboardInputManagerStub
+ (id)serverInterface;
+ (void)setArrayClassesForSelectorsInInterface:(id)a3;
- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4;
- (id)keyboardConfiguration;
- (void)addSupplementalLexicon:(id)a3 completionHandler:(id)a4;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6;
- (void)generateRefinementsForCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5;
- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4 continuation:(id)a5;
- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 continuation:(id)a5;
- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8;
- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5;
- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (void)textAccepted:(id)a3 completionHandler:(id)a4;
- (void)writeTypologyLogWithCompletionHandler:(id)a3;
@end

@implementation TIKeyboardInputManagerStub

+ (id)serverInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__TIKeyboardInputManagerStub_serverInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, block);
  }
  v2 = (void *)serverInterface_result;

  return v2;
}

uint64_t __45__TIKeyboardInputManagerStub_serverInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC42E80];
  v3 = (void *)serverInterface_result;
  serverInterface_result = v2;

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = serverInterface_result;

  return [v4 setArrayClassesForSelectorsInInterface:v5];
}

+ (void)setArrayClassesForSelectorsInInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v16 forSelector:sel_generateReplacementsForString_keyLayout_continuation_ argumentIndex:0 ofReply:1];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v4 setClasses:v8 forSelector:sel_skipHitTestForTouchEvents_keyboardState_ argumentIndex:0 ofReply:0];
  [v4 setClasses:v8 forSelector:sel_performHitTestForTouchEvents_keyboardState_continuation_ argumentIndex:0 ofReply:0];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v4 setClasses:v11 forSelector:sel_smartSelectionForTextInDocument_inRange_language_tokenizedRanges_options_completion_ argumentIndex:3 ofReply:0];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel_stickerWithIdentifier_stickerRoles_completionHandler_ argumentIndex:0 ofReply:1];
}

- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)addSupplementalLexicon:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)writeTypologyLogWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)textAccepted:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(TIKeyboardInputManagerStub *)self keyboardConfiguration];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v8 = a6;
    id v9 = [(TIKeyboardInputManagerStub *)self keyboardConfiguration];
    (*((void (**)(id, id))a6 + 2))(v8, v9);
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  if (a8) {
    (*((void (**)(void))a8 + 2))();
  }
}

- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 lastObject];
  [(TIKeyboardInputManagerStub *)self performHitTestForTouchEvent:v10 keyboardState:v9 continuation:v8];
}

- (void)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  if (v8)
  {
    id v9 = [v7 keyLayout];

    uint64_t v10 = -1;
    if (v12 && v9)
    {
      v11 = [v7 keyLayout];
      [v12 location];
      uint64_t v10 = objc_msgSend(v11, "keyContainingPoint:");
    }
    v8[2](v8, v10);
  }
}

- (void)generateRefinementsForCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = [(TIKeyboardInputManagerStub *)self keyboardConfiguration];
    (*((void (**)(id, id, void))a5 + 2))(v7, v8, 0);
  }
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  if (a6) {
    (*((void (**)(id, void))a6 + 2))(a6, 0);
  }
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  return &stru_1EDBDCE38;
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  if (a6) {
    (*((void (**)(id, void))a6 + 2))(a6, 0);
  }
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  if (a5)
  {
    id v13 = v7;
    id v8 = (void (**)(id, TIKeyboardOutput *, void *))a5;
    id v9 = objc_alloc_init(TIKeyboardOutput);
    uint64_t v10 = [v13 string];

    if (v10)
    {
      v11 = [v13 string];
      [(TIKeyboardOutput *)v9 setInsertionText:v11];
    }
    else if ([v13 isBackspace])
    {
      [(TIKeyboardOutput *)v9 setDeletionCount:1];
    }
    id v12 = [(TIKeyboardInputManagerStub *)self keyboardConfiguration];
    v8[2](v8, v9, v12);

    id v7 = v13;
  }
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(TIKeyboardInputManagerStub *)self keyboardConfiguration];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (id)keyboardConfiguration
{
  uint64_t v2 = objc_alloc_init(TIKeyboardConfiguration);
  v3 = objc_alloc_init(TIKeyboardInputManagerState);
  [(TIKeyboardConfiguration *)v2 setInputManagerState:v3];

  return v2;
}

@end