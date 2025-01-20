@interface SUICSiriLanguage
- (BOOL)_setupAssistantHasCompletedInitialRunAvailable;
- (BOOL)setupAssistantHasCompletedInitialRunChecked;
- (NSString)spokenLanguageCode;
- (SUICSiriLanguage)init;
- (SUICSiriLanguage)initWithDelegate:(id)a3;
- (SUICSiriLanguageDelegate)_delegate;
- (id)_computeSpokenLanguageCode;
- (uint64_t)_computeSpokenLanguageCode;
- (void)_setSpokenLanguageCode:(id)a3;
- (void)_updateSpokenLanguageCode;
- (void)dealloc;
- (void)setSetupAssistantHasCompletedInitialRunAvailable:(BOOL)a3;
- (void)setSetupAssistantHasCompletedInitialRunChecked:(BOOL)a3;
@end

@implementation SUICSiriLanguage

- (SUICSiriLanguage)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUICSiriLanguage;
  v5 = [(SUICSiriLanguage *)&v12 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_setupAssistantHasCompletedInitialRunChecked = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [(SUICSiriLanguage *)v6 _computeSpokenLanguageCode];
    spokenLanguageCode = v6->_spokenLanguageCode;
    v6->_spokenLanguageCode = (NSString *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__spokenLanguageDidChange_ name:*MEMORY[0x1E4F4E2F8] object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v6;
}

- (SUICSiriLanguage)init
{
  return [(SUICSiriLanguage *)self initWithDelegate:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUICSiriLanguage;
  [(SUICSiriLanguage *)&v4 dealloc];
}

- (void)_updateSpokenLanguageCode
{
  id v3 = [(SUICSiriLanguage *)self _computeSpokenLanguageCode];
  [(SUICSiriLanguage *)self _setSpokenLanguageCode:v3];
}

- (void)_setSpokenLanguageCode:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_spokenLanguageCode, "isEqualToString:"))
  {
    objc_super v4 = (NSString *)[v7 copy];
    spokenLanguageCode = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v4;

    v6 = [(SUICSiriLanguage *)self _delegate];
    [v6 siriLanguageSpokenLanguageCodeDidChange:self];
  }
}

- (BOOL)_setupAssistantHasCompletedInitialRunAvailable
{
  if (self->_setupAssistantHasCompletedInitialRunChecked) {
    return self->_setupAssistantHasCompletedInitialRunAvailable;
  }
  BOOL result = SetupAssistantLibraryCore() != 0;
  self->_setupAssistantHasCompletedInitialRunAvailable = result;
  self->_setupAssistantHasCompletedInitialRunChecked = 1;
  return result;
}

- (id)_computeSpokenLanguageCode
{
  id v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
  objc_super v4 = [v3 languageCode];

  if ([(SUICSiriLanguage *)self _setupAssistantHasCompletedInitialRunAvailable])
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v5 = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
    v22 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
    if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke;
      v18[3] = &unk_1E5C59750;
      v18[4] = &v19;
      __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke((uint64_t)v18);
      v5 = (uint64_t (*)(void))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v5)
    {
      v17 = (_Unwind_Exception *)-[SUICSiriLanguage _computeSpokenLanguageCode]();
      _Block_object_dispose(&v19, 8);
      _Unwind_Resume(v17);
    }
    if ((v5() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      if (![v6 count])
      {
LABEL_20:

        goto LABEL_21;
      }
      id v7 = [v6 objectAtIndex:0];
      if ([v7 isEqualToString:@"en-GB"])
      {
        v8 = [MEMORY[0x1E4F1CA20] currentLocale];
        v9 = [v8 objectForKey:*MEMORY[0x1E4F1C400]];

        if (([v9 isEqualToString:@"AU"] & 1) == 0)
        {
LABEL_15:

LABEL_16:
          v13 = AFPreferencesSupportedLanguages();
          int v14 = [v13 containsObject:v7];

          if (v14 && ([v4 isEqualToString:v7] & 1) == 0)
          {
            id v15 = v7;

            objc_super v4 = v15;
          }

          goto LABEL_20;
        }
        v10 = @"en-AU";
      }
      else
      {
        if ((unint64_t)[v7 length] >= 6)
        {
          uint64_t v11 = [v7 substringToIndex:2];

          id v7 = (void *)v11;
        }
        if ((unint64_t)[v7 length] > 2) {
          goto LABEL_16;
        }
        objc_super v12 = [MEMORY[0x1E4F1CA20] currentLocale];
        v9 = [v12 objectForKey:*MEMORY[0x1E4F1C400]];

        v10 = [NSString stringWithFormat:@"%@-%@", v7, v9];
      }

      id v7 = v10;
      goto LABEL_15;
    }
  }
LABEL_21:

  return v4;
}

- (NSString)spokenLanguageCode
{
  return self->_spokenLanguageCode;
}

- (SUICSiriLanguageDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUICSiriLanguageDelegate *)WeakRetained;
}

- (BOOL)setupAssistantHasCompletedInitialRunChecked
{
  return self->_setupAssistantHasCompletedInitialRunChecked;
}

- (void)setSetupAssistantHasCompletedInitialRunChecked:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunChecked = a3;
}

- (void)setSetupAssistantHasCompletedInitialRunAvailable:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
}

- (uint64_t)_computeSpokenLanguageCode
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[SUICOrbView _commonInitWithFrame:](v0);
}

@end