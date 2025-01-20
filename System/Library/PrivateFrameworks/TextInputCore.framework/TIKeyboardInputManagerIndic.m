@interface TIKeyboardInputManagerIndic
- (BOOL)alphabeticLayout;
- (BOOL)deletesComposedTextByComposedCharacterSequence;
- (Class)scriptComposerClass;
- (TIIndicScriptComposer)scriptComposer;
- (TIKeyboardInputManagerIndic)initWithConfig:(id)a3 keyboardState:(id)a4;
- (id)contextualDisplayKeys;
- (id)handleKeyboardInput:(id)a3;
- (void)setAlphabeticLayout:(BOOL)a3;
- (void)setKeyLayout:(id)a3;
- (void)setScriptComposer:(id)a3;
- (void)syncToLayoutState:(id)a3;
@end

@implementation TIKeyboardInputManagerIndic

- (void).cxx_destruct
{
}

- (void)setScriptComposer:(id)a3
{
}

- (TIIndicScriptComposer)scriptComposer
{
  return (TIIndicScriptComposer *)objc_getProperty(self, a2, 584, 1);
}

- (void)setAlphabeticLayout:(BOOL)a3
{
  *(&self->_alphabeticLayout + 1) = a3;
}

- (BOOL)alphabeticLayout
{
  return *(&self->_alphabeticLayout + 1);
}

- (Class)scriptComposerClass
{
  return (Class)objc_opt_class();
}

- (id)contextualDisplayKeys
{
  if ([(TIKeyboardInputManagerIndic *)self alphabeticLayout])
  {
    v3 = [(TIKeyboardInputManagerIndic *)self scriptComposer];
    v4 = [v3 contextualDisplayKeys];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setKeyLayout:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerIndic *)self alphabeticLayout])
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FAE360]) initWithCapacity:50];
    objc_msgSend(v5, "setUsesTwoHands:", objc_msgSend(v4, "usesTwoHands"));
    objc_msgSend(v5, "setShifted:", objc_msgSend(v4, "isShifted"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__TIKeyboardInputManagerIndic_setKeyLayout___block_invoke;
    v9[3] = &unk_1E6E2CE58;
    v9[4] = self;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateKeysUsingBlock:v9];
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerIndic;
    [(TIKeyboardInputManager *)&v8 setKeyLayout:v6];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerIndic;
    [(TIKeyboardInputManager *)&v7 setKeyLayout:v4];
  }
}

void __44__TIKeyboardInputManagerIndic_setKeyLayout___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  id v13 = [NSString stringWithUTF8String:a2];
  v11 = [*(id *)(a1 + 32) scriptComposer];
  v12 = [v11 stringByComposingInput:v13];

  objc_msgSend(*(id *)(a1 + 40), "addKeyWithString:frame:", v12, a3, a4, a5, a6);
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerIndic *)self alphabeticLayout]
    && ([v4 isPopupVariant] & 1) == 0)
  {
    v5 = [(TIKeyboardInputManagerIndic *)self scriptComposer];
    id v6 = [v4 string];
    objc_super v7 = [v5 stringByComposingInput:v6];
    [v4 setString:v7];
  }
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerIndic;
  objc_super v8 = [(TIKeyboardInputManager *)&v10 handleKeyboardInput:v4];

  return v8;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (void)syncToLayoutState:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerIndic;
  id v4 = a3;
  [(TIKeyboardInputManager *)&v10 syncToLayoutState:v4];
  v5 = [v4 softwareLayout];

  id v6 = v5;
  KB::String::String((KB::String *)v11, (const char *)[v6 UTF8String]);
  [(TIKeyboardInputManagerIndic *)self setAlphabeticLayout:TI::IndicUtils::isAlphabeticLayout((KB::String *)v11)];
  if (v12 && v11[6] == 1) {
    free(v12);
  }

  objc_super v7 = [(TIKeyboardInputManagerBase *)self inputMode];
  objc_super v8 = [v7 languageWithRegion];
  v9 = [(TIKeyboardInputManagerIndic *)self scriptComposer];
  [v9 setLanguageIdentifier:v8];
}

- (TIKeyboardInputManagerIndic)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerIndic;
  id v4 = [(TIKeyboardInputManager *)&v17 initWithConfig:a3 keyboardState:a4];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4->super.m_impl + 697) = 0;
    objc_initWeak(&location, v4);
    id v6 = objc_alloc([(TIKeyboardInputManagerIndic *)v5 scriptComposerClass]);
    objc_super v7 = [(TIKeyboardInputManagerBase *)v5 inputMode];
    objc_super v8 = [v7 languageWithRegion];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __60__TIKeyboardInputManagerIndic_initWithConfig_keyboardState___block_invoke;
    v14 = &unk_1E6E2CE30;
    objc_copyWeak(&v15, &location);
    v9 = (void *)[v6 initWithLanguage:v8 contextFetcher:&v11];
    -[TIKeyboardInputManagerIndic setScriptComposer:](v5, "setScriptComposer:", v9, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v5;
}

id __60__TIKeyboardInputManagerIndic_initWithConfig_keyboardState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained keyboardState];
  v3 = [v2 documentState];
  id v4 = [v3 contextBeforeInput];

  return v4;
}

@end