@interface SUICVoiceSelectionDefaultDataManager
- (BOOL)isVoiceSelected:(id)a3;
- (NSDictionary)currentVoiceSelectionForOutputLanguage;
- (NSString)outputLanguage;
- (NSString)recognitionLanguageCode;
- (SUICVoiceSelectionDataProviderObserving)voiceSelectionDataProviderObserver;
- (SUICVoiceSelectionDefaultDataManager)init;
- (SUICVoiceSelectionVoiceCollection)voiceSelectionVoiceCollection;
- (id)dialectLanguageCodeForLanguage:(id)a3;
- (id)voicesForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4;
- (void)changeSiriDialectLanguageToLanguageIdentifiedByLanguageCode:(id)a3 completion:(id)a4;
- (void)changeSiriVoiceToVoice:(id)a3 completion:(id)a4;
- (void)regenerateVoiceCollectionForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4;
- (void)setCurrentVoiceSelectionForOutputLanguage:(id)a3;
- (void)setOutputLanguage:(id)a3;
- (void)setRecognitionLanguageCode:(id)a3;
- (void)setVoiceSelectionDataProviderObserver:(id)a3;
- (void)setVoiceSelectionVoiceCollection:(id)a3;
@end

@implementation SUICVoiceSelectionDefaultDataManager

- (SUICVoiceSelectionDefaultDataManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUICVoiceSelectionDefaultDataManager;
  v2 = [(SUICVoiceSelectionDefaultDataManager *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9E8] dictionary];
    [(SUICVoiceSelectionDefaultDataManager *)v2 setCurrentVoiceSelectionForOutputLanguage:v3];
  }
  return v2;
}

- (void)setRecognitionLanguageCode:(id)a3
{
  v4 = (NSString *)[a3 copy];
  recognitionLanguageCode = self->_recognitionLanguageCode;
  self->_recognitionLanguageCode = v4;

  AFOutputVoiceLanguageForRecognitionLanguage();
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  outputLanguage = self->_outputLanguage;
  self->_outputLanguage = v6;

  v8 = self->_recognitionLanguageCode;
  v9 = self->_outputLanguage;

  [(SUICVoiceSelectionDefaultDataManager *)self regenerateVoiceCollectionForRecognitionLanguageCode:v8 outputLanguageCode:v9];
}

- (void)changeSiriVoiceToVoice:(id)a3 completion:(id)a4
{
  v12 = (void (**)(id, uint64_t, void))a4;
  v6 = (void *)MEMORY[0x1E4F1CA60];
  currentVoiceSelectionForOutputLanguage = self->_currentVoiceSelectionForOutputLanguage;
  id v8 = a3;
  v9 = [v6 dictionaryWithDictionary:currentVoiceSelectionForOutputLanguage];
  v10 = [v8 languageCode];
  [v9 setObject:v8 forKey:v10];

  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v9];
  [(SUICVoiceSelectionDefaultDataManager *)self setCurrentVoiceSelectionForOutputLanguage:v11];

  [(SUICVoiceSelectionDefaultDataManager *)self regenerateVoiceCollectionForRecognitionLanguageCode:self->_recognitionLanguageCode outputLanguageCode:self->_outputLanguage];
  if (v12) {
    v12[2](v12, 1, 0);
  }
}

- (void)changeSiriDialectLanguageToLanguageIdentifiedByLanguageCode:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  if (![(NSString *)self->_outputLanguage isEqualToString:v8])
  {
    objc_storeStrong((id *)&self->_outputLanguage, a3);
    [(SUICVoiceSelectionDefaultDataManager *)self regenerateVoiceCollectionForRecognitionLanguageCode:self->_recognitionLanguageCode outputLanguageCode:self->_outputLanguage];
  }
  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (void)regenerateVoiceCollectionForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA80] set];
  v9 = [(SUICVoiceSelectionDefaultDataManager *)self voicesForRecognitionLanguageCode:v6 outputLanguageCode:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = 0;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([(SUICVoiceSelectionDefaultDataManager *)self isVoiceSelected:v15])
        {
          id v16 = v15;

          v12 = v16;
        }
        else
        {
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v17 = [SUICVoiceSelectionVoiceCollection alloc];
  v18 = [(SUICVoiceSelectionDefaultDataManager *)self dialectLanguageCodeForLanguage:v7];
  v19 = [(SUICVoiceSelectionVoiceCollection *)v17 initWithLanguageCode:v7 dialectLanguageCodes:v18 currentVoice:v12 alternativeVoices:v8];

  [(SUICVoiceSelectionDefaultDataManager *)self setVoiceSelectionVoiceCollection:v19];
}

- (BOOL)isVoiceSelected:(id)a3
{
  currentVoiceSelectionForOutputLanguage = self->_currentVoiceSelectionForOutputLanguage;
  id v4 = a3;
  objc_super v5 = [v4 languageCode];
  id v6 = [(NSDictionary *)currentVoiceSelectionForOutputLanguage objectForKey:v5];
  id v7 = [v6 name];

  id v8 = [v4 name];

  LOBYTE(v4) = [v7 isEqualToString:v8];
  return (char)v4;
}

- (id)voicesForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F4E680] allVoicesForSiriSessionLanguage:a3];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "languageCode", (void)v17);
        int v15 = [v14 isEqualToString:v5];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)dialectLanguageCodeForLanguage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(MEMORY[0x1E4F4E680], "allVoicesForSiriSessionLanguage:", v3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) languageCode];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 removeObject:v3];
  uint64_t v11 = [v4 allObjects];

  return v11;
}

- (void)setVoiceSelectionVoiceCollection:(id)a3
{
  id v4 = (SUICVoiceSelectionVoiceCollection *)[a3 copy];
  voiceSelectionVoiceCollection = self->_voiceSelectionVoiceCollection;
  self->_voiceSelectionVoiceCollection = v4;

  id v6 = [(SUICVoiceSelectionDefaultDataManager *)self voiceSelectionDataProviderObserver];
  [v6 voiceSelectionDataProviderVoiceCollectionDidChange:self];
}

- (NSString)recognitionLanguageCode
{
  return self->_recognitionLanguageCode;
}

- (SUICVoiceSelectionVoiceCollection)voiceSelectionVoiceCollection
{
  return self->_voiceSelectionVoiceCollection;
}

- (SUICVoiceSelectionDataProviderObserving)voiceSelectionDataProviderObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceSelectionDataProviderObserver);

  return (SUICVoiceSelectionDataProviderObserving *)WeakRetained;
}

- (void)setVoiceSelectionDataProviderObserver:(id)a3
{
}

- (NSString)outputLanguage
{
  return self->_outputLanguage;
}

- (void)setOutputLanguage:(id)a3
{
}

- (NSDictionary)currentVoiceSelectionForOutputLanguage
{
  return self->_currentVoiceSelectionForOutputLanguage;
}

- (void)setCurrentVoiceSelectionForOutputLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVoiceSelectionForOutputLanguage, 0);
  objc_storeStrong((id *)&self->_outputLanguage, 0);
  objc_destroyWeak((id *)&self->_voiceSelectionDataProviderObserver);
  objc_storeStrong((id *)&self->_voiceSelectionVoiceCollection, 0);

  objc_storeStrong((id *)&self->_recognitionLanguageCode, 0);
}

@end