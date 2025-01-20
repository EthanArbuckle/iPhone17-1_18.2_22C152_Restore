@interface _PKEnterCurrencyWithSuggestionsTextField
- (_PKEnterCurrencyWithSuggestionsTextFieldDataSource)suggestionsDataSource;
- (void)insertTextSuggestion:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setSuggestionsDataSource:(id)a3;
@end

@implementation _PKEnterCurrencyWithSuggestionsTextField

- (void)setInputDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PKEnterCurrencyWithSuggestionsTextField;
  [(_PKEnterCurrencyWithSuggestionsTextField *)&v11 setInputDelegate:v4];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61___PKEnterCurrencyWithSuggestionsTextField_setInputDelegate___block_invoke;
  v6[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, &location);
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)insertTextSuggestion:(id)a3
{
  id v8 = a3;
  [(_PKEnterCurrencyWithSuggestionsTextField *)self setText:&stru_1EF1B5B50];
  id v4 = [(_PKEnterCurrencyWithSuggestionsTextField *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v8 inputText];
    int v6 = objc_msgSend(v4, "textField:shouldChangeCharactersInRange:replacementString:", self, 0, 0, v5);

    if (v6)
    {
      id v7 = [v8 inputText];
      [(_PKEnterCurrencyWithSuggestionsTextField *)self setText:v7];
    }
  }
}

- (_PKEnterCurrencyWithSuggestionsTextFieldDataSource)suggestionsDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsDataSource);

  return (_PKEnterCurrencyWithSuggestionsTextFieldDataSource *)WeakRetained;
}

- (void)setSuggestionsDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end