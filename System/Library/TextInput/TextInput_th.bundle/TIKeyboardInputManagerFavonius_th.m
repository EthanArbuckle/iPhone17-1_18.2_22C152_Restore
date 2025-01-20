@interface TIKeyboardInputManagerFavonius_th
- (BOOL)deletesComposedTextByComposedCharacterSequence;
- (BOOL)shouldExtendPriorWord;
- (BOOL)supportsLearning;
- (id)keyboardBehaviors;
- (id)trimmedInputStem;
- (id)trimmedInputStemForStem:(id)a3;
- (id)wordSeparator;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)candidateRejected:(id)a3;
- (void)initImplementation;
- (void)loadDictionaries;
- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6;
- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7;
- (void)setWordBoundary;
- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5;
@end

@implementation TIKeyboardInputManagerFavonius_th

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (void)loadDictionaries
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  [(TIKeyboardInputManagerFavonius_th *)&v4 loadDictionaries];
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (v3) {
    *(unsigned char *)(*(void *)(v3 + 224) + 64) = 1;
  }
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (id)wordSeparator
{
  return &stru_26F5E4DB8;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E600]);

  return v2;
}

- (id)trimmedInputStem
{
  uint64_t v3 = [(TIKeyboardInputManagerFavonius_th *)self inputStem];
  objc_super v4 = [(TIKeyboardInputManagerFavonius_th *)self trimmedInputStemForStem:v3];

  return v4;
}

- (id)trimmedInputStemForStem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]))
  {
    uint64_t v6 = [v4 _lastLongCharacter];
    if (v6)
    {
      v7 = [NSString _stringWithUnichar:v6];
    }
    else
    {
      v7 = &stru_26F5E4DB8;
    }
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerFavonius_th;
    v9 = (char *)[(TIKeyboardInputManagerFavonius_th *)&v16 countOfWordsIninputStem:v5];
    v15.receiver = self;
    v15.super_class = (Class)TIKeyboardInputManagerFavonius_th;
    v10 = (char *)[(TIKeyboardInputManagerFavonius_th *)&v15 maxPriorWordTokensAfterTrimming];
    if (v9) {
      double v11 = (float)((float)(unint64_t)[v5 length] / (float)(unint64_t)v9);
    }
    else {
      double v11 = 1.0;
    }
    if ([(TIKeyboardInputManagerFavonius_th *)self stringEndsWord:v7])
    {
      v8 = &stru_26F5E4DB8;
    }
    else
    {
      if ((unint64_t)[v5 length] <= 0xC && (v9 <= v10 + 1 || v11 <= 2.5))
      {
        v12 = v5;
      }
      else
      {
        v14.receiver = self;
        v14.super_class = (Class)TIKeyboardInputManagerFavonius_th;
        v12 = [(TIKeyboardInputManagerFavonius_th *)&v14 trimmedInputStem];
      }
      v8 = v12;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setWordBoundary
{
  uint64_t v2 = (int)*MEMORY[0x263F7EB98];
  if (*(Class *)((char *)&self->super.super.super.isa + v2))
  {
    [(TIKeyboardInputManagerFavonius_th *)self dropInput];
    uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa + v2);
    MEMORY[0x270F7CE08](v4, 0);
  }
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  [(TIKeyboardInputManagerBase *)&v6 textAccepted:a3 fromPredictiveInputBar:a4 withInput:a5];
  [(TIKeyboardInputManagerFavonius_th *)self setWordBoundary];
}

- (void)candidateRejected:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  [(TIKeyboardInputManagerBase *)&v4 candidateRejected:a3];
  [(TIKeyboardInputManagerFavonius_th *)self setWordBoundary];
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  [(TIKeyboardInputManagerBase *)&v7 registerLearning:a3 fullCandidate:a4 keyboardState:a5 mode:a6];
  [(TIKeyboardInputManagerFavonius_th *)self setWordBoundary];
}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  [(TIKeyboardInputManagerBase *)&v8 registerLearningForCompletion:a3 fullCompletion:a4 context:a5 prefix:a6 mode:a7];
  [(TIKeyboardInputManagerFavonius_th *)self setWordBoundary];
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(TIKeyboardInputManagerFavonius_th *)self inputStem];
  v9 = [v6 string];
  v10 = [v8 stringByAppendingString:v9];

  double v11 = [(TIKeyboardInputManagerFavonius_th *)self trimmedInputStemForStem:v10];
  v12 = [(TIKeyboardInputManagerFavonius_th *)self lastAutocorrectionList];
  v13 = [v12 corrections];
  objc_super v14 = [v13 autocorrection];

  objc_super v15 = [v14 input];
  objc_super v16 = [v14 candidate];
  int v17 = [v15 isEqualToString:v16];

  unint64_t v18 = [v11 length];
  if (v18 < [v8 length] && ((objc_msgSend(v8, "hasSuffix:", v11) ^ 1 | v17) & 1) == 0)
  {
    [(TIKeyboardInputManagerFavonius_th *)self textAccepted:v14 fromPredictiveInputBar:0 withInput:0];
    [v7 deleteTextBackward:v8];
    v19 = [v14 candidate];
    [v7 insertText:v19];

    v20 = [(TIKeyboardInputManagerFavonius_th *)self previousTouchEvent];
    [(TIKeyboardInputManagerFavonius_th *)self addTouch:v20 shouldHitTest:1];
  }
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  [(TIKeyboardInputManagerFavonius_th *)&v21 addInput:v6 withContext:v7];
}

@end