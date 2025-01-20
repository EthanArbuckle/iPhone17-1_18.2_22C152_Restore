@interface TILanguageModelOfflineLearningTaskMessages
+ (id)dataSourceForTask;
- (TILanguageModelOfflineLearningTaskMessages)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4;
- (id)dataSource;
@end

@implementation TILanguageModelOfflineLearningTaskMessages

- (void).cxx_destruct
{
}

- (id)dataSource
{
  return self->_dataSource;
}

- (TILanguageModelOfflineLearningTaskMessages)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TILanguageModelOfflineLearningTaskMessages;
  v4 = [(TILanguageModelOfflineLearningTask *)&v8 initWithClientIdentifier:a3 oneTimeTask:a4];
  if (v4)
  {
    uint64_t v5 = +[TILanguageModelOfflineLearningTaskMessages dataSourceForTask];
    dataSource = v4->_dataSource;
    v4->_dataSource = (TILinguisticDataSource *)v5;
  }
  return v4;
}

+ (id)dataSourceForTask
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/TextInput/Plugins/MessagesDataKeyboardPlugin.bundle"];
  id v3 = objc_alloc_init((Class)[v2 classNamed:@"MessagesTextInputModelDataSource"]);
  if (!v3)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = [NSString stringWithFormat:@"%s Failed to load Messages plugin from %@", "+[TILanguageModelOfflineLearningTaskMessages dataSourceForTask]", @"/System/Library/TextInput/Plugins/MessagesDataKeyboardPlugin.bundle"];
      *(_DWORD *)buf = 138412290;
      objc_super v8 = v6;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }

  return v3;
}

@end