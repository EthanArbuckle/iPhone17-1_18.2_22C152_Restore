@interface FCPresentationOperation
- (BOOL)endsPresentationSession;
- (BOOL)ignoreAfterSuccessfulPresentation;
- (FCPresentationOperation)initWithConfigDictionary:(id)a3;
- (NSNumber)maxPrecedingSameSessionPresentations;
- (NSNumber)maxPresentationAttempts;
- (NSNumber)maxRetries;
- (NSString)handlerUID;
- (NSString)operationUID;
- (int64_t)requiredAppLaunchCount;
- (int64_t)suppressOnLaunchConditions;
- (void)setEndsPresentationSession:(BOOL)a3;
- (void)setHandlerUID:(id)a3;
- (void)setIgnoreAfterSuccessfulPresentation:(BOOL)a3;
- (void)setMaxPrecedingSameSessionPresentations:(id)a3;
- (void)setMaxPresentationAttempts:(id)a3;
- (void)setMaxRetries:(id)a3;
- (void)setOperationUID:(id)a3;
- (void)setRequiredAppLaunchCount:(int64_t)a3;
- (void)setSuppressOnLaunchConditions:(int64_t)a3;
@end

@implementation FCPresentationOperation

- (FCPresentationOperation)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FCPresentationOperation;
  v5 = [(FCPresentationOperation *)&v29 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"handlerUID", 0);
    handlerUID = v5->_handlerUID;
    v5->_handlerUID = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationStringValue(v4, @"operationUID", 0);
    operationUID = v5->_operationUID;
    v5->_operationUID = (NSString *)v8;

    v5->_requiredAppLaunchCount = FCAppConfigurationIntegerValue(v4, @"requiredAppLaunchCount", 0);
    uint64_t v10 = [v4 objectForKeyedSubscript:@"maxPrecedingSameSessionPresentations"];
    if (!v10) {
      goto LABEL_5;
    }
    v11 = (void *)v10;
    v12 = [v4 objectForKeyedSubscript:@"maxPrecedingSameSessionPresentations"];
    v13 = [MEMORY[0x1E4F1CA98] null];

    if (v12 == v13)
    {
LABEL_5:
      maxPrecedingSameSessionPresentations = v5->_maxPrecedingSameSessionPresentations;
      v5->_maxPrecedingSameSessionPresentations = 0;
    }
    else
    {
      uint64_t v14 = [NSNumber numberWithInteger:FCAppConfigurationIntegerValue(v4, @"maxPrecedingSameSessionPresentations", 0)];
      maxPrecedingSameSessionPresentations = v5->_maxPrecedingSameSessionPresentations;
      v5->_maxPrecedingSameSessionPresentations = (NSNumber *)v14;
    }

    uint64_t v16 = [v4 objectForKeyedSubscript:@"maxPresentationAttempts"];
    if (!v16) {
      goto LABEL_9;
    }
    v17 = (void *)v16;
    v18 = [v4 objectForKeyedSubscript:@"maxPresentationAttempts"];
    v19 = [MEMORY[0x1E4F1CA98] null];

    if (v18 == v19)
    {
LABEL_9:
      maxPresentationAttempts = v5->_maxPresentationAttempts;
      v5->_maxPresentationAttempts = 0;
    }
    else
    {
      uint64_t v20 = [NSNumber numberWithInteger:FCAppConfigurationIntegerValue(v4, @"maxPresentationAttempts", 0)];
      maxPresentationAttempts = v5->_maxPresentationAttempts;
      v5->_maxPresentationAttempts = (NSNumber *)v20;
    }

    v5->_endsPresentationSession = FCAppConfigurationBoolValue(v4, @"endsPresentationSession", 0);
    v5->_suppressOnLaunchConditions = FCAppConfigurationIntegerValue(v4, @"suppressOnLaunchConditions", 0);
    v5->_ignoreAfterSuccessfulPresentation = FCAppConfigurationBoolValue(v4, @"ignoreAfterSuccessfulPresentation", 0);
    uint64_t v22 = [v4 objectForKeyedSubscript:@"maxRetries"];
    if (!v22) {
      goto LABEL_13;
    }
    v23 = (void *)v22;
    v24 = [v4 objectForKeyedSubscript:@"maxRetries"];
    v25 = [MEMORY[0x1E4F1CA98] null];

    if (v24 == v25)
    {
LABEL_13:
      maxRetries = v5->_maxRetries;
      v5->_maxRetries = 0;
    }
    else
    {
      uint64_t v26 = [NSNumber numberWithInteger:FCAppConfigurationIntegerValue(v4, @"maxRetries", 0)];
      maxRetries = v5->_maxRetries;
      v5->_maxRetries = (NSNumber *)v26;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxRetries, 0);
  objc_storeStrong((id *)&self->_maxPresentationAttempts, 0);
  objc_storeStrong((id *)&self->_maxPrecedingSameSessionPresentations, 0);
  objc_storeStrong((id *)&self->_operationUID, 0);
  objc_storeStrong((id *)&self->_handlerUID, 0);
}

- (NSString)handlerUID
{
  return self->_handlerUID;
}

- (void)setHandlerUID:(id)a3
{
}

- (NSString)operationUID
{
  return self->_operationUID;
}

- (void)setOperationUID:(id)a3
{
}

- (int64_t)requiredAppLaunchCount
{
  return self->_requiredAppLaunchCount;
}

- (void)setRequiredAppLaunchCount:(int64_t)a3
{
  self->_requiredAppLaunchCount = a3;
}

- (NSNumber)maxPrecedingSameSessionPresentations
{
  return self->_maxPrecedingSameSessionPresentations;
}

- (void)setMaxPrecedingSameSessionPresentations:(id)a3
{
}

- (NSNumber)maxPresentationAttempts
{
  return self->_maxPresentationAttempts;
}

- (void)setMaxPresentationAttempts:(id)a3
{
}

- (BOOL)endsPresentationSession
{
  return self->_endsPresentationSession;
}

- (void)setEndsPresentationSession:(BOOL)a3
{
  self->_endsPresentationSession = a3;
}

- (int64_t)suppressOnLaunchConditions
{
  return self->_suppressOnLaunchConditions;
}

- (void)setSuppressOnLaunchConditions:(int64_t)a3
{
  self->_suppressOnLaunchConditions = a3;
}

- (BOOL)ignoreAfterSuccessfulPresentation
{
  return self->_ignoreAfterSuccessfulPresentation;
}

- (void)setIgnoreAfterSuccessfulPresentation:(BOOL)a3
{
  self->_ignoreAfterSuccessfulPresentation = a3;
}

- (NSNumber)maxRetries
{
  return self->_maxRetries;
}

- (void)setMaxRetries:(id)a3
{
}

@end