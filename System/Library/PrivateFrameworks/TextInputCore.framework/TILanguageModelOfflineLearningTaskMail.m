@interface TILanguageModelOfflineLearningTaskMail
+ (id)dataSourceForTask;
- (TILanguageModelOfflineLearningTaskMail)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4;
- (id)dataSource;
- (id)forwardedMessageSeparators;
- (id)linePaddingCharacters;
@end

@implementation TILanguageModelOfflineLearningTaskMail

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_forwardedMessageSeparators, 0);

  objc_storeStrong((id *)&self->_linePaddingCharacters, 0);
}

- (id)dataSource
{
  return self->_dataSource;
}

- (id)forwardedMessageSeparators
{
  forwardedMessageSeparators = self->_forwardedMessageSeparators;
  if (!forwardedMessageSeparators)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.TextInput"];
    v5 = [v4 pathForResource:@"ForwardedMessageSeparators" ofType:@"plist"];
    if (v5)
    {
      v6 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v5];
      if (v6)
      {
        v7 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
        v8 = self->_forwardedMessageSeparators;
        self->_forwardedMessageSeparators = v7;
      }
    }

    forwardedMessageSeparators = self->_forwardedMessageSeparators;
  }

  return forwardedMessageSeparators;
}

- (id)linePaddingCharacters
{
  linePaddingCharacters = self->_linePaddingCharacters;
  if (!linePaddingCharacters)
  {
    v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v5 = (void *)[v4 mutableCopy];

    [v5 addCharactersInString:@"\u200E\u200F"];
    v6 = (NSCharacterSet *)[v5 copy];
    v7 = self->_linePaddingCharacters;
    self->_linePaddingCharacters = v6;

    linePaddingCharacters = self->_linePaddingCharacters;
  }

  return linePaddingCharacters;
}

- (TILanguageModelOfflineLearningTaskMail)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TILanguageModelOfflineLearningTaskMail;
  v4 = [(TILanguageModelOfflineLearningTask *)&v8 initWithClientIdentifier:a3 oneTimeTask:a4];
  if (v4)
  {
    uint64_t v5 = +[TILanguageModelOfflineLearningTaskMail dataSourceForTask];
    dataSource = v4->_dataSource;
    v4->_dataSource = (TILinguisticDataSource *)v5;
  }
  return v4;
}

+ (id)dataSourceForTask
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(NSClassFromString(&cfstr_Timaildatasour.isa));
  if (!v2)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v3 = TIOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Failed to load TIMailDataSource", "+[TILanguageModelOfflineLearningTaskMail dataSourceForTask]");
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }

  return v2;
}

@end