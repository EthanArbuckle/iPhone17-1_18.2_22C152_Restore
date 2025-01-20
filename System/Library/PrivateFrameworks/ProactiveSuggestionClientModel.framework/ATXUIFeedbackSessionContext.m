@interface ATXUIFeedbackSessionContext
+ (BOOL)supportsSecureCoding;
- (ATXUIFeedbackSessionContext)init;
- (ATXUIFeedbackSessionContext)initWithCoder:(id)a3;
- (ATXUIFeedbackSessionContext)initWithSessions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUIFeedbackSessionContext:(id)a3;
- (NSDictionary)sessions;
- (id)returnAndRemoveUIFeedbackSessionWithSessionIdentifier:(id)a3 endDate:(id)a4;
- (id)uiFeedbackSessionWithSessionIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)trackNewUIFeedbackSessionWithSessionIdentifier:(id)a3 startDate:(id)a4;
@end

@implementation ATXUIFeedbackSessionContext

- (ATXUIFeedbackSessionContext)init
{
  v3 = objc_opt_new();
  v4 = [(ATXUIFeedbackSessionContext *)self initWithSessions:v3];

  return v4;
}

- (ATXUIFeedbackSessionContext)initWithSessions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUIFeedbackSessionContext;
  v6 = [(ATXUIFeedbackSessionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessions, a3);
  }

  return v7;
}

- (void)trackNewUIFeedbackSessionWithSessionIdentifier:(id)a3 startDate:(id)a4
{
  id v6 = a3;
  sessions = self->_sessions;
  id v8 = a4;
  if ((unint64_t)[(NSMutableDictionary *)sessions count] >= 0xA)
  {
    objc_super v9 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXUIFeedbackSessionContext trackNewUIFeedbackSessionWithSessionIdentifier:startDate:]((uint64_t)self, (uint64_t)v6, v9);
    }

    [(NSMutableDictionary *)self->_sessions removeAllObjects];
  }
  v10 = [[ATXProactiveSuggestionUIFeedbackSession alloc] initWithSessionIdentifier:v6];
  [(ATXProactiveSuggestionUIFeedbackSession *)v10 updateSessionStartDateIfUnset:v8];

  [(NSMutableDictionary *)self->_sessions setValue:v10 forKey:v6];
}

- (id)uiFeedbackSessionWithSessionIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sessions valueForKey:a3];
}

- (id)returnAndRemoveUIFeedbackSessionWithSessionIdentifier:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXUIFeedbackSessionContext *)self uiFeedbackSessionWithSessionIdentifier:v7];
  [v8 updateSessionEndDateIfUnset:v6];

  [(NSMutableDictionary *)self->_sessions removeObjectForKey:v7];
  return v8;
}

- (NSDictionary)sessions
{
  v2 = (void *)[(NSMutableDictionary *)self->_sessions copy];
  return (NSDictionary *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXUIFeedbackSessionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1B3E6F520]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_super v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  v10 = (void *)MEMORY[0x1E4F93B90];
  v11 = __atxlog_handle_blending_ecosystem();
  v12 = [v10 robustDecodeObjectOfClasses:v9 forKey:@"sessions" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v11];

  if (v12 && ([v4 error], v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    self = [(ATXUIFeedbackSessionContext *)self initWithSessions:v12];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXUIFeedbackSessionContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUIFeedbackSessionContext *)self isEqualToATXUIFeedbackSessionContext:v5];

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackSessionContext:(id)a3
{
  id v4 = self->_sessions;
  id v5 = v4;
  if (v4 == *((NSMutableDictionary **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSMutableDictionary isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_sessions hash];
}

- (void).cxx_destruct
{
}

- (void)trackNewUIFeedbackSessionWithSessionIdentifier:(NSObject *)a3 startDate:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  int v7 = 138412802;
  uint64_t v8 = v6;
  __int16 v9 = 2048;
  uint64_t v10 = 10;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_ERROR, "%@ - reached max count of %lu tracked sessions, pruning all before starting new session with identifier: %@", (uint8_t *)&v7, 0x20u);
}

@end