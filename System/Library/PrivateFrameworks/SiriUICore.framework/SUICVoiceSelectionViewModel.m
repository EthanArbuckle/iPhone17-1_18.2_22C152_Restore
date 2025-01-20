@interface SUICVoiceSelectionViewModel
- (NSArray)languages;
- (NSArray)voices;
- (SUICVoiceSelectionViewModel)initWithLanguages:(id)a3 voices:(id)a4;
@end

@implementation SUICVoiceSelectionViewModel

- (SUICVoiceSelectionViewModel)initWithLanguages:(id)a3 voices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUICVoiceSelectionViewModel;
  v8 = [(SUICVoiceSelectionViewModel *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6 copyItems:1];
    languages = v8->_languages;
    v8->_languages = (NSArray *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:1];
    voices = v8->_voices;
    v8->_voices = (NSArray *)v11;
  }
  return v8;
}

- (NSArray)languages
{
  return self->_languages;
}

- (NSArray)voices
{
  return self->_voices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voices, 0);

  objc_storeStrong((id *)&self->_languages, 0);
}

@end