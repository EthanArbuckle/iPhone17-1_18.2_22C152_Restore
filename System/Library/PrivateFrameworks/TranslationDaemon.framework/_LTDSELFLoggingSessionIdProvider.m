@interface _LTDSELFLoggingSessionIdProvider
- (NSDate)dateSessionIdMostRecentlyAccessesOrCreated;
- (SISchemaUUID)sessionId;
- (void)sessionId;
@end

@implementation _LTDSELFLoggingSessionIdProvider

- (SISchemaUUID)sessionId
{
  v3 = [MEMORY[0x263EFF910] now];
  v4 = self->_dateSessionIdMostRecentlyAccessesOrCreated;
  objc_storeStrong((id *)&self->_dateSessionIdMostRecentlyAccessesOrCreated, v3);
  if (!v4)
  {
LABEL_6:
    id v8 = objc_alloc(MEMORY[0x263F6EEE0]);
    id v9 = objc_alloc_init(MEMORY[0x263F08C38]);
    v10 = (SISchemaUUID *)[v8 initWithNSUUID:v9];
    cachedSessionId = self->_cachedSessionId;
    self->_cachedSessionId = v10;

    v6 = self->_cachedSessionId;
    goto LABEL_7;
  }
  [v3 timeIntervalSinceDate:v4];
  v6 = self->_cachedSessionId;
  if (!v6 || v5 >= 480.0)
  {
    v7 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_LTDSELFLoggingSessionIdProvider sessionId](v7);
    }
    goto LABEL_6;
  }
LABEL_7:
  v12 = v6;

  return v12;
}

- (NSDate)dateSessionIdMostRecentlyAccessesOrCreated
{
  return self->_dateSessionIdMostRecentlyAccessesOrCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSessionIdMostRecentlyAccessesOrCreated, 0);
  objc_storeStrong((id *)&self->_cachedSessionId, 0);
}

- (void)sessionId
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 0x407E000000000000;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "It is been more than %f@ seconds, generating new SELF logging session id", (uint8_t *)&v1, 0xCu);
}

@end