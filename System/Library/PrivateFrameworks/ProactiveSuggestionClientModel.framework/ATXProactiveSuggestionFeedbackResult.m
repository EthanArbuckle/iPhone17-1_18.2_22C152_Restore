@interface ATXProactiveSuggestionFeedbackResult
+ (BOOL)supportsSecureCoding;
- (ATXBlendingModelUICacheUpdate)uiCacheUpdate;
- (ATXClientModelCacheUpdate)clientCacheUpdate;
- (ATXProactiveSuggestionFeedbackContextProtocol)context;
- (ATXProactiveSuggestionFeedbackResult)initWithCoder:(id)a3;
- (ATXProactiveSuggestionFeedbackResult)initWithConsumerSubType:(unsigned __int8)a3 sessionType:(int64_t)a4 clientCacheUpdate:(id)a5 uiCacheUpdate:(id)a6 context:(id)a7;
- (id)validContextClassNames;
- (int64_t)sessionType;
- (unsigned)consumerSubType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProactiveSuggestionFeedbackResult

- (ATXProactiveSuggestionFeedbackResult)initWithConsumerSubType:(unsigned __int8)a3 sessionType:(int64_t)a4 clientCacheUpdate:(id)a5 uiCacheUpdate:(id)a6 context:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ATXProactiveSuggestionFeedbackResult;
  v16 = [(ATXProactiveSuggestionFeedbackResult *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_consumerSubType = a3;
    v16->_sessionType = a4;
    objc_storeStrong((id *)&v16->_clientCacheUpdate, a5);
    objc_storeStrong((id *)&v17->_uiCacheUpdate, a6);
    objc_storeStrong((id *)&v17->_context, a7);
  }

  return v17;
}

- (id)validContextClassNames
{
  v2 = (void *)MEMORY[0x1B3E6F520](self, a2);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ATXPredictionContext", @"ATXUIFeedbackTestPredictionContext", 0);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  [v8 encodeObject:v4 forKey:@"consumerSubType"];

  v5 = [NSNumber numberWithInteger:self->_sessionType];
  [v8 encodeObject:v5 forKey:@"sessionType"];

  [v8 encodeObject:self->_clientCacheUpdate forKey:@"clientCache"];
  [v8 encodeObject:self->_context forKey:@"context"];
  [v8 encodeObject:self->_uiCacheUpdate forKey:@"clientCache"];
  if (self->_context)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v8 encodeObject:v7 forKey:@"contextString"];
  }
}

- (ATXProactiveSuggestionFeedbackResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_blending_ecosystem();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"consumerSubType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionFeedbackResult" errorCode:-1 logHandle:v7];

  if (v8)
  {
    v9 = [v4 error];

    if (!v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v8 found:0];
      if (v12)
      {
        uint64_t v13 = v12;
        id v14 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v15 = objc_opt_class();
        v16 = __atxlog_handle_blending_ecosystem();
        v17 = [v14 robustDecodeObjectOfClass:v15 forKey:@"sessionType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionFeedbackResult" errorCode:-1 logHandle:v16];

        if (!v17
          || ([v4 error], v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
        {
          v10 = 0;
LABEL_34:

          goto LABEL_4;
        }
        objc_super v19 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v20 = objc_opt_class();
        v21 = __atxlog_handle_blending_ecosystem();
        v22 = [v19 robustDecodeObjectOfClass:v20 forKey:@"clientCache" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionFeedbackResult" errorCode:-1 logHandle:v21];

        if (!v22
          || ([v4 error], v23 = objc_claimAutoreleasedReturnValue(), v23, v23))
        {
          v10 = 0;
LABEL_33:

          goto LABEL_34;
        }
        v42 = v22;
        v24 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v25 = objc_opt_class();
        v26 = __atxlog_handle_blending_ecosystem();
        v27 = [v24 robustDecodeObjectOfClass:v25 forKey:@"clientCache" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionFeedbackResult" errorCode:-1 logHandle:v26];

        if (!v27)
        {
          v10 = 0;
          v22 = v42;
          goto LABEL_32;
        }
        v28 = [v4 error];

        v22 = v42;
        if (v28)
        {
          v10 = 0;
LABEL_32:

          goto LABEL_33;
        }
        aClassNamea = (NSString *)MEMORY[0x1E4F93B90];
        uint64_t v29 = objc_opt_class();
        v30 = __atxlog_handle_blending_ecosystem();
        aClassName = [(NSString *)aClassNamea robustDecodeObjectOfClass:v29 forKey:@"contextString" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionFeedbackResult" errorCode:-1 logHandle:v30];

        v31 = [v4 error];

        if (v31)
        {
          v10 = 0;
          v32 = aClassName;
          v22 = v42;
LABEL_31:

          goto LABEL_32;
        }
        v32 = aClassName;
        if (aClassName)
        {
          v33 = [(ATXProactiveSuggestionFeedbackResult *)self validContextClassNames];
          int v34 = [v33 containsObject:aClassName];

          if (!v34)
          {
            v38 = 0;
            v32 = aClassName;
            v22 = v42;
            goto LABEL_27;
          }
          v32 = aClassName;
          if (NSClassFromString(aClassName))
          {
            v35 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v36 = objc_opt_class();
            v37 = __atxlog_handle_blending_ecosystem();
            v38 = [v35 robustDecodeObjectOfClass:v36 forKey:@"contextString" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionFeedbackResult" errorCode:-1 logHandle:v37];

            if (v38)
            {
              v39 = [v4 error];

              if (!v39) {
                goto LABEL_25;
              }
            }
          }
          else
          {
            v38 = 0;
          }
          v10 = 0;
          v22 = v42;
          goto LABEL_30;
        }
        v38 = 0;
LABEL_25:
        v22 = v42;
LABEL_27:
        self = -[ATXProactiveSuggestionFeedbackResult initWithConsumerSubType:sessionType:clientCacheUpdate:uiCacheUpdate:context:](self, "initWithConsumerSubType:sessionType:clientCacheUpdate:uiCacheUpdate:context:", v13, [v17 integerValue], v22, v27, v38);
        v10 = self;
LABEL_30:

        goto LABEL_31;
      }
    }
  }
  v10 = 0;
LABEL_4:

  return v10;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (ATXClientModelCacheUpdate)clientCacheUpdate
{
  return self->_clientCacheUpdate;
}

- (ATXBlendingModelUICacheUpdate)uiCacheUpdate
{
  return self->_uiCacheUpdate;
}

- (ATXProactiveSuggestionFeedbackContextProtocol)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uiCacheUpdate, 0);
  objc_storeStrong((id *)&self->_clientCacheUpdate, 0);
}

@end