@interface STGenericIntent
+ (BOOL)supportsSecureCoding;
- (AFSiriTask)siriTask;
- (BOOL)appInForeground;
- (BOOL)finishedState;
- (BOOL)handled;
- (BOOL)isLaunch;
- (NSMutableDictionary)parameters;
- (NSString)attributes;
- (NSString)name;
- (NSString)utterance;
- (STGenericIntent)initWithCoder:(id)a3;
- (STGenericIntent)initWithName:(id)a3;
- (STGenericIntentRequest)intentRequest;
- (id)getDateRangeParameter:(id)a3;
- (id)getGroupParameter:(id)a3;
- (id)getPersonParameter:(id)a3;
- (id)getPlacesParameter:(id)a3;
- (id)getTopicParameter:(id)a3;
- (void)addParam:(id)a3 withValue:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)finished;
- (void)handleWithProgress:(int64_t)a3;
- (void)setAppInForeground:(BOOL)a3;
- (void)setAttributes:(id)a3;
- (void)setFinishedState:(BOOL)a3;
- (void)setHandled:(BOOL)a3;
- (void)setIntentRequest:(id)a3;
- (void)setIsLaunch:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setParameters:(id)a3;
- (void)setSiriTask:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation STGenericIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentRequest, 0);
  objc_storeStrong((id *)&self->_siriTask, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setFinishedState:(BOOL)a3
{
  self->_finishedState = a3;
}

- (BOOL)finishedState
{
  return self->_finishedState;
}

- (void)setHandled:(BOOL)a3
{
  self->_handled = a3;
}

- (BOOL)handled
{
  return self->_handled;
}

- (void)setIntentRequest:(id)a3
{
}

- (STGenericIntentRequest)intentRequest
{
  return self->_intentRequest;
}

- (void)setSiriTask:(id)a3
{
}

- (AFSiriTask)siriTask
{
  return self->_siriTask;
}

- (void)setParameters:(id)a3
{
}

- (NSMutableDictionary)parameters
{
  return self->_parameters;
}

- (void)setIsLaunch:(BOOL)a3
{
  self->_isLaunch = a3;
}

- (BOOL)isLaunch
{
  return self->_isLaunch;
}

- (void)setAppInForeground:(BOOL)a3
{
  self->_appInForeground = a3;
}

- (BOOL)appInForeground
{
  return self->_appInForeground;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)attributes
{
  return self->_attributes;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (STGenericIntent)initWithCoder:(id)a3
{
  v21[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STGenericIntent;
  v5 = [(STGenericIntent *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_utterance"];
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSString *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    v21[5] = objc_opt_class();
    v21[6] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:7];
    v14 = [v12 setWithArray:v13];

    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"parameters"];
    uint64_t v16 = [v15 mutableCopy];
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v16;

    v5->_appInForeground = 1;
    siriTask = v5->_siriTask;
    v5->_siriTask = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"_name"];
  [v5 encodeObject:self->_utterance forKey:@"_utterance"];
  [v5 encodeObject:self->_parameters forKey:@"_parameters"];
  [v5 encodeObject:self->_attributes forKey:@"_attributes"];
}

- (void)addParam:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STGenericIntent *)self parameters];
  [v8 setObject:v6 forKey:v7];
}

- (id)getPlacesParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(STGenericIntent *)self parameters];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)getGroupParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(STGenericIntent *)self parameters];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)getPersonParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(STGenericIntent *)self parameters];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)getTopicParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(STGenericIntent *)self parameters];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)getDateRangeParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(STGenericIntent *)self parameters];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)handleWithProgress:(int64_t)a3
{
  id v5 = +[STGenericIntentHelper sharedHelper];
  id v6 = [v5 siriResponseQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__STGenericIntent_handleWithProgress___block_invoke;
  v7[3] = &unk_264762428;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

void __38__STGenericIntent_handleWithProgress___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) siriTask];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) siriTask];
    id v4 = [*(id *)(a1 + 32) intentRequest];
    id v5 = [v4 responseWithCode:*(void *)(a1 + 40)];
    [v3 completeWithResponse:v5];

    [*(id *)(a1 + 32) setHandled:1];
    [*(id *)(a1 + 32) setSiriTask:0];
    id v6 = *(void **)(a1 + 32);
    [v6 setIntentRequest:0];
  }
}

- (void)finished
{
  if (![(STGenericIntent *)self finishedState])
  {
    [(STGenericIntent *)self setFinishedState:1];
    v3 = MEMORY[0x263EF83A0];
    dispatch_async(v3, &__block_literal_global_408);
  }
}

void __27__STGenericIntent_finished__block_invoke()
{
  id v1 = +[STGenericIntentHelper sharedHelper];
  v0 = [v1 waitForIntentCompleteSemaphore];
  dispatch_semaphore_signal(v0);
}

- (STGenericIntent)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STGenericIntent;
  id v6 = [(STGenericIntent *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    parameters = v7->_parameters;
    v7->_parameters = (NSMutableDictionary *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end