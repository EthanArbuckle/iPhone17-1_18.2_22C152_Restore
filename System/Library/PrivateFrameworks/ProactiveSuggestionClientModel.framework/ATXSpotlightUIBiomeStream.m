@interface ATXSpotlightUIBiomeStream
- (ATXSpotlightUIBiomeStream)init;
- (ATXSpotlightUIBiomeStream)initWithStoreConfig:(id)a3;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)source;
- (void)sendEvent:(id)a3;
@end

@implementation ATXSpotlightUIBiomeStream

- (NSString)identifier
{
  return (NSString *)@"spotlightUI";
}

- (ATXSpotlightUIBiomeStream)init
{
  return [(ATXSpotlightUIBiomeStream *)self initWithStoreConfig:0];
}

- (ATXSpotlightUIBiomeStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXSpotlightUIBiomeStream;
  v5 = [(ATXSpotlightUIBiomeStream *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"spotlightUI" storeConfig:v6 eventDataClass:objc_opt_class()];
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;
  }
  return v5;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = [(ATXSpotlightUIBiomeStream *)self source];
  [v5 sendEvent:v4];

  id v6 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXSpotlightUIBiomeStream sendEvent:](v4, v6);
  }
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)[(BMStoreStream *)self->_inner publisherFromStartTime:a3];
}

- (id)source
{
  return (id)[(BMStoreStream *)self->_inner source];
}

- (void).cxx_destruct
{
}

- (void)sendEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = +[ATXSpotlightUIEvent stringForATXSpotlightUIEventType:](ATXSpotlightUIEvent, "stringForATXSpotlightUIEventType:", [a1 eventType]);
  uint64_t v5 = [a1 eventType];
  id v6 = [a1 suggestionType];
  v7 = [a1 suggestionUniqueId];
  uint64_t v8 = [a1 suggestionSubtype];
  v9 = [a1 suggestionContext];
  int v10 = 138413570;
  objc_super v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  v15 = v6;
  __int16 v16 = 2112;
  v17 = v7;
  __int16 v18 = 2112;
  v19 = v8;
  __int16 v20 = 2112;
  v21 = v9;
  _os_log_debug_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXSpotlightUIEvent\n\teventType: %lu\n\tsuggestionType: %@\n\tsuggestionUniqueId: %@\n\tsuggestionSubtype: %@\n\tsuggestionContext: %@", (uint8_t *)&v10, 0x3Eu);
}

@end