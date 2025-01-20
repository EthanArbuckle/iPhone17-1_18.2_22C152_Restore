@interface NSSExternalAnalyticsEvent
- (NSDictionary)requestQueryParameters;
- (NSSExternalAnalyticsEvent)init;
- (NSSExternalAnalyticsEvent)initWithSession:(id)a3 requestQueryParameters:(id)a4;
- (NTPBSession)session;
- (id)copy;
- (id)requestMetadataWithExternalAnalyticsIdentifier:(id)a3;
@end

@implementation NSSExternalAnalyticsEvent

- (NSSExternalAnalyticsEvent)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSExternalAnalyticsEvent init]";
    __int16 v9 = 2080;
    v10 = "NSSExternalAnalyticsEvent.m";
    __int16 v11 = 1024;
    int v12 = 46;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NSSExternalAnalyticsEvent init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSSExternalAnalyticsEvent)initWithSession:(id)a3 requestQueryParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NSSExternalAnalyticsEvent initWithSession:requestQueryParameters:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSExternalAnalyticsEvent initWithSession:requestQueryParameters:]();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NSSExternalAnalyticsEvent;
  v8 = [(NSSExternalAnalyticsEvent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    session = v8->_session;
    v8->_session = (NTPBSession *)v9;

    uint64_t v11 = [v7 copy];
    requestQueryParameters = v8->_requestQueryParameters;
    v8->_requestQueryParameters = (NSDictionary *)v11;
  }
  return v8;
}

- (id)copy
{
  v3.receiver = self;
  v3.super_class = (Class)NSSExternalAnalyticsEvent;
  return [(NSSExternalAnalyticsEvent *)&v3 copy];
}

- (id)requestMetadataWithExternalAnalyticsIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSExternalAnalyticsEvent requestMetadataWithExternalAnalyticsIdentifier:]();
  }
  v5 = [(NSSExternalAnalyticsEvent *)self requestQueryParameters];
  id v6 = [v5 objectForKey:@"udid"];
  id v7 = [v5 objectForKey:@"articleID"];
  v8 = [v5 objectForKey:@"pub"];
  uint64_t v9 = [v5 objectForKey:@"event"];
  uint64_t v10 = NTPBExternalAnalyticsEventTypeFromExternalEventURLQueryParameter(v9);

  uint64_t v11 = [NSSExternalAnalyticsRequestMetadata alloc];
  int v12 = [(NSSExternalAnalyticsEvent *)self session];
  __int16 v13 = [(NSSExternalAnalyticsRequestMetadata *)v11 initWithSession:v12 eventIdentifier:v6 externalAnalyticsIdentifier:v4 contentViewedIdentifier:v7 publisherIdentifier:v8 eventType:v10];

  return v13;
}

- (NSDictionary)requestQueryParameters
{
  return self->_requestQueryParameters;
}

- (NTPBSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_requestQueryParameters, 0);
}

- (void)initWithSession:requestQueryParameters:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestQueryParameters", v6, 2u);
}

- (void)initWithSession:requestQueryParameters:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"session", v6, 2u);
}

- (void)requestMetadataWithExternalAnalyticsIdentifier:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"externalAnalyticsIdentifier", v6, 2u);
}

@end