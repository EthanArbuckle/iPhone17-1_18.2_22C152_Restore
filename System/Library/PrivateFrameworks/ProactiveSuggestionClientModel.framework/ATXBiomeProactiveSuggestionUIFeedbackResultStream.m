@interface ATXBiomeProactiveSuggestionUIFeedbackResultStream
- (ATXBiomeProactiveSuggestionUIFeedbackResultStream)init;
- (ATXBiomeProactiveSuggestionUIFeedbackResultStream)initWithStoreConfig:(id)a3;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4;
- (id)source;
- (void)sendEvent:(id)a3;
@end

@implementation ATXBiomeProactiveSuggestionUIFeedbackResultStream

- (NSString)identifier
{
  return (NSString *)@"proactiveSuggestionUIFeedbackResults";
}

- (ATXBiomeProactiveSuggestionUIFeedbackResultStream)init
{
  return [(ATXBiomeProactiveSuggestionUIFeedbackResultStream *)self initWithStoreConfig:0];
}

- (ATXBiomeProactiveSuggestionUIFeedbackResultStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXBiomeProactiveSuggestionUIFeedbackResultStream;
  v5 = [(ATXBiomeProactiveSuggestionUIFeedbackResultStream *)&v11 init];
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
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"proactiveSuggestionUIFeedbackResults" storeConfig:v6 eventDataClass:objc_opt_class()];
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)[(BMStoreStream *)self->_inner publisherFromStartTime:a3];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4
{
  return (id)[(BMStoreStream *)self->_inner publisherWithStartTime:a3 endTime:a4 maxEvents:0 lastN:0 reversed:0];
}

- (id)source
{
  return (id)[(BMStoreStream *)self->_inner source];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXBiomeProactiveSuggestionUIFeedbackResultStream *)self source];
  [v5 sendEvent:v4];
}

- (void).cxx_destruct
{
}

@end