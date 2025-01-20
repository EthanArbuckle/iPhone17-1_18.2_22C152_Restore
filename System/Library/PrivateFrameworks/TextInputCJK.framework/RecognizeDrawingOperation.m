@interface RecognizeDrawingOperation
+ (id)drawingWithStrokes:(id)a3;
+ (id)recognitionResultsForDrawing:(id)a3 withRecognizer:(id)a4 history:(id)a5 shouldCancel:(id)a6;
+ (id)textRecognitionResultsForDrawing:(id)a3 withRecognizer:(id)a4 keyboardState:(id)a5 history:(id)a6 shouldCancel:(id)a7;
+ (int)autoCorrectionModeForKeyboardAutoCorrectionType:(unint64_t)a3;
+ (int)capitalizationModeForKeyboardAutoCapitalizationType:(unint64_t)a3;
+ (int)recognitionContentTypeForKeyboardState:(id)a3;
- (CHRecognizer)recognizer;
- (NSArray)candidates;
- (NSArray)stickers;
- (NSString)history;
- (RecognizeDrawingOperation)initWithInputManager:(id)a3 strokes:(id)a4 history:(id)a5;
- (TIInputManagerHandwriting)manager;
- (void)dealloc;
- (void)main;
- (void)setCandidates:(id)a3;
- (void)setHistory:(id)a3;
- (void)setManager:(id)a3;
- (void)setRecognizer:(id)a3;
- (void)setStickers:(id)a3;
@end

@implementation RecognizeDrawingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_stickers, 0);
  objc_storeStrong((id *)&self->_im, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

- (void)setRecognizer:(id)a3
{
}

- (CHRecognizer)recognizer
{
  return self->_recognizer;
}

- (void)setStickers:(id)a3
{
}

- (NSArray)stickers
{
  return self->_stickers;
}

- (void)setHistory:(id)a3
{
}

- (NSString)history
{
  return self->_history;
}

- (void)setManager:(id)a3
{
}

- (TIInputManagerHandwriting)manager
{
  return self->_im;
}

- (void)setCandidates:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)main
{
  v3 = (void *)MEMORY[0x2611ED640](self, a2);
  if (self->_strokes)
  {
    v4 = +[RecognizeDrawingOperation drawingWithStrokes:](RecognizeDrawingOperation, "drawingWithStrokes:");
    recognizer = self->_recognizer;
    v6 = [(RecognizeDrawingOperation *)self manager];
    v7 = [v6 keyboardState];
    v8 = +[RecognizeDrawingOperation textRecognitionResultsForDrawing:v4 withRecognizer:recognizer keyboardState:v7 history:self->_history shouldCancel:0];

    if (objc_opt_respondsToSelector()) {
      [v8 performSelector:sel_textRecognitionResultArrayGivenHistory_ withObject:self->_history];
    }
    else {
    v9 = [v8 textRecognitionResultArray];
    }
    [(RecognizeDrawingOperation *)self setCandidates:v9];
    v10 = [(RecognizeDrawingOperation *)self candidates];
    v11 = [v10 firstObject];

    if (v11)
    {
      v12 = [(RecognizeDrawingOperation *)self manager];
      v13 = [v12 stickerCandidateGenerator];

      v14 = [v11 string];
      v15 = [v13 generateStickerQueriesForText:v14 tokenize:0];

      if ([v15 count])
      {
        v16 = dispatch_group_create();
        dispatch_group_enter(v16);
        objc_initWeak(&location, self);
        uint64_t v19 = MEMORY[0x263EF8330];
        uint64_t v20 = 3221225472;
        v21 = __33__RecognizeDrawingOperation_main__block_invoke;
        v22 = &unk_265535580;
        id v23 = v13;
        id v24 = v15;
        objc_copyWeak(&v26, &location);
        v25 = v16;
        v17 = v16;
        TIDispatchAsync();
        dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
    }
    if (([(RecognizeDrawingOperation *)self isCancelled] & 1) == 0)
    {
      v18 = [(RecognizeDrawingOperation *)self manager];
      [v18 performSelectorOnMainThread:sel_mainThreadUpdateCandidates_ withObject:self waitUntilDone:0];
    }
  }
  [(RecognizeDrawingOperation *)self setManager:0];
}

void __33__RecognizeDrawingOperation_main__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) manager];
  v5 = [v4 keyboardState];
  v6 = [v5 secureCandidateRenderTraits];
  v7 = [*(id *)(a1 + 48) manager];
  v8 = [v7 inputMode];
  v9 = [v8 languageWithRegion];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __33__RecognizeDrawingOperation_main__block_invoke_2;
  v10[3] = &unk_265535558;
  objc_copyWeak(&v12, (id *)(a1 + 64));
  id v11 = *(id *)(a1 + 56);
  [v2 generateStickerCandidatesForSearchableQueries:v3 withRenderTraits:v6 shouldAppend:1 language:v9 completionHandler:v10];

  objc_destroyWeak(&v12);
}

void __33__RecognizeDrawingOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setStickers:v4];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dealloc
{
  [(RecognizeDrawingOperation *)self setCandidates:0];
  [(RecognizeDrawingOperation *)self setManager:0];
  v3.receiver = self;
  v3.super_class = (Class)RecognizeDrawingOperation;
  [(RecognizeDrawingOperation *)&v3 dealloc];
}

- (RecognizeDrawingOperation)initWithInputManager:(id)a3 strokes:(id)a4 history:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RecognizeDrawingOperation;
  id v11 = [(RecognizeDrawingOperation *)&v18 init];
  id v12 = v11;
  if (v11)
  {
    [(RecognizeDrawingOperation *)v11 setManager:v8];
    objc_storeStrong((id *)&v12->_strokes, a4);
    uint64_t v13 = [v8 recognitionLanguage];
    recognitionLanguage = v12->_recognitionLanguage;
    v12->_recognitionLanguage = (NSLocale *)v13;

    objc_storeStrong((id *)&v12->_history, a5);
    uint64_t v15 = [v8 recognizer];
    recognizer = v12->_recognizer;
    v12->_recognizer = (CHRecognizer *)v15;
  }
  return v12;
}

+ (id)drawingWithStrokes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F35C88]);
  if ([v3 numberOfStrokes])
  {
    unint64_t v5 = 0;
    do
    {
      if ([v3 numberOfPointsInStrokeAtIndex:v5])
      {
        unint64_t v6 = 0;
        do
        {
          [v3 pointAtIndex:v6 inStrokeAtIndex:v5];
          objc_msgSend(v4, "addPoint:");
          ++v6;
        }
        while ([v3 numberOfPointsInStrokeAtIndex:v5] > v6);
      }
      [v4 endStroke];
      ++v5;
    }
    while ([v3 numberOfStrokes] > v5);
  }

  return v4;
}

+ (id)recognitionResultsForDrawing:(id)a3 withRecognizer:(id)a4 history:(id)a5 shouldCancel:(id)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (TIGetHandwritingMultipleCharacterRecognitionEnabledValue(void)::onceToken != -1) {
    dispatch_once(&TIGetHandwritingMultipleCharacterRecognitionEnabledValue(void)::onceToken, &__block_literal_global_417);
  }
  uint64_t v13 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  v14 = [v13 valueForPreferenceKey:@"HandwritingMultipleCharacterRecognitionEnabled"];

  LODWORD(v13) = [v14 BOOLValue];
  if (v13) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 1;
  }
  [v10 setRecognitionMode:v15];
  if (v11)
  {
    uint64_t v19 = *MEMORY[0x263F35C78];
    v20[0] = v11;
    v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  }
  else
  {
    v16 = 0;
  }
  v17 = [v10 recognitionResultsForDrawing:v9 options:v16 shouldCancel:v12];

  return v17;
}

+ (id)textRecognitionResultsForDrawing:(id)a3 withRecognizer:(id)a4 keyboardState:(id)a5 history:(id)a6 shouldCancel:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_super v18 = v17;
  if (v15) {
    [v17 setObject:v15 forKey:*MEMORY[0x263F35C78]];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v16;
    id v19 = v13;
    [v18 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F35C70]];
    [v12 bounds];
    double v21 = v20;
    [v12 bounds];
    double v23 = v21 + v22;
    [v12 bounds];
    if (v23 >= 333.3)
    {
      BOOL v25 = v24 <= 666.7;
      double v24 = 0.0;
      if (!v25)
      {
        objc_msgSend(v12, "bounds", 666.7, 0.0);
        double v24 = -v26;
      }
    }
    v42[0] = 0;
    *(double *)&v42[1] = v24;
    v27 = [MEMORY[0x263F08D40] value:v42 withObjCType:"{CGPoint=dd}"];
    [v18 setObject:v27 forKey:*MEMORY[0x263F35C60]];
    uint64_t v41 = 0x4074D55555555555;
    v28 = [MEMORY[0x263F08D40] value:&v41 withObjCType:"d"];
    [v18 setObject:v28 forKey:*MEMORY[0x263F35C68]];
    if (v14)
    {
      objc_msgSend(v19, "setContentType:", objc_msgSend(a1, "recognitionContentTypeForKeyboardState:", v14));
      [v14 textInputTraits];
      v38 = v27;
      v30 = id v29 = a1;
      uint64_t v31 = objc_msgSend(v29, "capitalizationModeForKeyboardAutoCapitalizationType:", objc_msgSend(v30, "autocapitalizationType"));

      [v19 setAutoCapitalizationMode:v31];
      v32 = [v14 textInputTraits];
      uint64_t v33 = [v32 autocorrectionType];
      v34 = v29;
      v27 = v38;
      uint64_t v35 = [v34 autoCorrectionModeForKeyboardAutoCorrectionType:v33];

      [v19 setAutoCorrectionMode:v35];
    }
    uint64_t v40 = 0;
    v36 = [v19 textRecognitionResultForDrawing:v12 options:v18 error:&v40];

    id v16 = v39;
  }
  else
  {
    v36 = [v13 textRecognitionResultForDrawing:v12 options:v18 shouldCancel:v16];
  }

  return v36;
}

+ (int)autoCorrectionModeForKeyboardAutoCorrectionType:(unint64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

+ (int)capitalizationModeForKeyboardAutoCapitalizationType:(unint64_t)a3
{
  if (a3 > 3) {
    return 1;
  }
  else {
    return dword_25EC2B160[a3];
  }
}

+ (int)recognitionContentTypeForKeyboardState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 textInputTraits];
  unint64_t v5 = [v4 textContentType];

  if (v5)
  {
    if ([v5 isEqualToString:*MEMORY[0x263F7E938]])
    {
      int v6 = 3;
      goto LABEL_15;
    }
    if ([v5 isEqualToString:*MEMORY[0x263F7E920]])
    {
      int v6 = 6;
      goto LABEL_15;
    }
    if ([v5 isEqualToString:*MEMORY[0x263F7E918]])
    {
      int v6 = 4;
      goto LABEL_15;
    }
    if ([v5 isEqualToString:*MEMORY[0x263F7E930]])
    {
      int v6 = 5;
      goto LABEL_15;
    }
    if ([v5 isEqualToString:*MEMORY[0x263F7E928]])
    {
      int v6 = 2;
      goto LABEL_15;
    }
  }
  uint64_t v7 = [v3 keyboardType];
  if ((unint64_t)(v7 - 3) > 0xF) {
    int v6 = 0;
  }
  else {
    int v6 = dword_25EC2B178[v7 - 3];
  }
LABEL_15:

  return v6;
}

@end