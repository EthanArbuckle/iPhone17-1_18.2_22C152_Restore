@interface SUICVoiceSelectionVoiceCollection
- (AFVoiceInfo)currentVoice;
- (NSArray)dialectLanguageCodes;
- (NSSet)alternativeVoices;
- (NSString)languageCode;
- (SUICVoiceSelectionVoiceCollection)initWithLanguageCode:(id)a3 dialectLanguageCodes:(id)a4 currentVoice:(id)a5 alternativeVoices:(id)a6;
- (id)randomVoice;
- (void)randomVoice;
@end

@implementation SUICVoiceSelectionVoiceCollection

- (SUICVoiceSelectionVoiceCollection)initWithLanguageCode:(id)a3 dialectLanguageCodes:(id)a4 currentVoice:(id)a5 alternativeVoices:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SUICVoiceSelectionVoiceCollection;
  v14 = [(SUICVoiceSelectionVoiceCollection *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    languageCode = v14->_languageCode;
    v14->_languageCode = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    dialectLanguageCodes = v14->_dialectLanguageCodes;
    v14->_dialectLanguageCodes = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    currentVoice = v14->_currentVoice;
    v14->_currentVoice = (AFVoiceInfo *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v13 copyItems:1];
    alternativeVoices = v14->_alternativeVoices;
    v14->_alternativeVoices = (NSSet *)v21;
  }
  return v14;
}

- (id)randomVoice
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(NSSet *)self->_alternativeVoices allObjects];
  v5 = [v3 arrayWithArray:v4];

  if (self->_currentVoice) {
    objc_msgSend(v5, "addObject:");
  }
  if ([v5 count])
  {
    v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", (int)arc4random_uniform(objc_msgSend(v5, "count")));
  }
  else
  {
    v7 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      [(SUICVoiceSelectionVoiceCollection *)(uint64_t)self randomVoice];
    }
    v6 = 0;
  }

  return v6;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSArray)dialectLanguageCodes
{
  return self->_dialectLanguageCodes;
}

- (AFVoiceInfo)currentVoice
{
  return self->_currentVoice;
}

- (NSSet)alternativeVoices
{
  return self->_alternativeVoices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeVoices, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_dialectLanguageCodes, 0);

  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (void)randomVoice
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[SUICVoiceSelectionVoiceCollection randomVoice]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A64CC000, a2, OS_LOG_TYPE_ERROR, "%s Zero voices in this collection %@", (uint8_t *)&v2, 0x16u);
}

@end