@interface TPSPhoneNumberEditingPane
- ($428225C1D63A8A498AA71256382FF2B4)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4;
- (NSString)previousStringSuggestion;
- (void)setPreferenceSpecifier:(id)a3;
- (void)setPreviousStringSuggestion:(id)a3;
@end

@implementation TPSPhoneNumberEditingPane

- (void)setPreferenceSpecifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)TPSPhoneNumberEditingPane;
  [(PSTextEditingPane *)&v7 setPreferenceSpecifier:a3];
  id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F88]);
  [v4 setAutocorrectionType:1];
  [v4 setAutoresizesTextToFit:1];
  [v4 setClearButtonMode:0];
  uint64_t v8 = *MEMORY[0x1E4FB0818];
  v9[0] = &unk_1F40C93E8;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 setDefaultTextAttributes:v5];

  [v4 setEnabled:1];
  [v4 setKeyboardType:5];
  [v4 setReturnKeyType:9];
  v6 = [v4 textInputTraits];
  [v6 setContentsIsSingleValue:1];

  [v4 setTextSuggestionDelegate:self];
}

- ($428225C1D63A8A498AA71256382FF2B4)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  id v5 = a3;
  v6 = [(TPSPhoneNumberEditingPane *)self previousStringSuggestion];
  char v7 = [v6 isEqualToString:v5];

  if (v7)
  {
    unint64_t v8 = 0;
    v9 = 0;
  }
  else
  {
    v10 = [(TPSPhoneNumberEditingPane *)self previousStringSuggestion];
    v9 = (void *)UIPhoneNumberSuggestionForString();
    unint64_t v8 = v11;

    if ([v9 count])
    {
      v12 = [v9 firstObject];
      [(TPSPhoneNumberEditingPane *)self setPreviousStringSuggestion:v12];
    }
  }

  v13 = v9;
  unint64_t v14 = v8;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (NSString)previousStringSuggestion
{
  return self->_previousStringSuggestion;
}

- (void)setPreviousStringSuggestion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end