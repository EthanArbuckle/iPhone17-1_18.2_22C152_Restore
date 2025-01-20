@interface _ICURLRequest
+ (id)requestWithURL:(id)a3;
+ (id)requestWithURL:(id)a3 fromSourceApplication:(id)a4;
+ (id)requestWithURL:(id)a3 scheme:(id)a4 userInterface:(id)a5 bundleIdentifier:(id)a6 successHandler:(id)a7 failureHandler:(id)a8;
- (BOOL)deferCompletionUntilReturn;
- (BOOL)isCallbackRequest;
- (BOOL)isInternalCallbackRequest;
- (ICScheme)scheme;
- (NSDictionary)parameters;
- (NSString)action;
- (NSString)bundleIdentifier;
- (NSString)sourceName;
- (NSString)subAction;
- (NSString)successURLQueryString;
- (NSURL)URL;
- (NSURL)generatedCallbackURL;
- (NSUUID)uniqueID;
- (WFUserInterfaceHost)userInterface;
- (_ICURLRequest)initWithURL:(id)a3 scheme:(id)a4 userInterface:(id)a5 successHandler:(id)a6 failureHandler:(id)a7 bundleIdentifier:(id)a8;
- (id)description;
- (id)failureHandler;
- (id)opener;
- (id)successHandler;
- (int64_t)retries;
- (void)parseActions;
- (void)setCallbackRequest:(BOOL)a3;
- (void)setDeferCompletionUntilReturn:(BOOL)a3;
- (void)setFailureHandler:(id)a3;
- (void)setGeneratedCallbackURL:(id)a3;
- (void)setInternalCallbackRequest:(BOOL)a3;
- (void)setParameters:(id)a3;
- (void)setRetries:(int64_t)a3;
- (void)setSourceName:(id)a3;
- (void)setSuccessHandler:(id)a3;
- (void)setSuccessURLQueryString:(id)a3;
@end

@implementation _ICURLRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedCallbackURL, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_successURLQueryString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_successHandler, 0);
  objc_destroyWeak((id *)&self->_userInterface);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_subAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setInternalCallbackRequest:(BOOL)a3
{
  self->_internalCallbackRequest = a3;
}

- (BOOL)isInternalCallbackRequest
{
  return self->_internalCallbackRequest;
}

- (void)setRetries:(int64_t)a3
{
  self->_retries = a3;
}

- (int64_t)retries
{
  return self->_retries;
}

- (void)setGeneratedCallbackURL:(id)a3
{
}

- (NSURL)generatedCallbackURL
{
  return self->_generatedCallbackURL;
}

- (void)setSourceName:(id)a3
{
}

- (void)setSuccessURLQueryString:(id)a3
{
}

- (NSString)successURLQueryString
{
  return self->_successURLQueryString;
}

- (void)setDeferCompletionUntilReturn:(BOOL)a3
{
  self->_deferCompletionUntilReturn = a3;
}

- (BOOL)deferCompletionUntilReturn
{
  return self->_deferCompletionUntilReturn;
}

- (void)setCallbackRequest:(BOOL)a3
{
  self->_callbackRequest = a3;
}

- (BOOL)isCallbackRequest
{
  return self->_callbackRequest;
}

- (void)setParameters:(id)a3
{
}

- (void)setFailureHandler:(id)a3
{
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (void)setSuccessHandler:(id)a3
{
}

- (id)successHandler
{
  return self->_successHandler;
}

- (WFUserInterfaceHost)userInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterface);
  return (WFUserInterfaceHost *)WeakRetained;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (ICScheme)scheme
{
  return self->_scheme;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICURLRequest;
  v4 = [(_ICURLRequest *)&v8 description];
  v5 = [(_ICURLRequest *)self URL];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSString)sourceName
{
  sourceName = self->_sourceName;
  if (sourceName)
  {
    v3 = sourceName;
  }
  else
  {
    v4 = [(_ICURLRequest *)self parameters];
    v3 = [v4 objectForKey:@"x-source"];
  }
  return v3;
}

- (NSDictionary)parameters
{
  parameters = self->_parameters;
  if (!parameters)
  {
    v4 = [(_ICURLRequest *)self URL];
    objc_msgSend(v4, "dc_queryDictionary");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_parameters;
    self->_parameters = v5;

    parameters = self->_parameters;
  }
  return parameters;
}

- (void)parseActions
{
  id v16 = [(_ICURLRequest *)self URL];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [v16 pathComponents];
  v5 = (void *)[v3 initWithArray:v4];

  [v5 removeObject:@"/"];
  v6 = [v16 scheme];
  if (([v6 isEqualToString:@"http"] & 1) != 0
    || [v6 isEqualToString:@"https"])
  {
    v7 = [v5 firstObject];
    action = self->_action;
    self->_action = v7;
    unint64_t v9 = 1;
  }
  else
  {
    v10 = [v16 host];
    unint64_t v9 = 0;
    action = self->_action;
    self->_action = v10;
  }

  if ([v5 count] <= v9)
  {
    p_subAction = &self->_subAction;
    subAction = self->_subAction;
    self->_subAction = 0;
  }
  else
  {
    v11 = [v5 objectAtIndex:v9];
    p_subAction = &self->_subAction;
    subAction = self->_subAction;
    self->_subAction = v11;
  }

  if ([(NSString *)self->_action isEqualToString:@"x-callback-url"])
  {
    self->_callbackRequest = 1;
    objc_storeStrong((id *)&self->_action, self->_subAction);
    if ([v5 count] <= v9 + 1)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = [v5 objectAtIndex:v9 + 1];
    }
    v15 = *p_subAction;
    *p_subAction = (NSString *)v14;
  }
}

- (NSString)subAction
{
  subAction = self->_subAction;
  if (!subAction)
  {
    [(_ICURLRequest *)self parseActions];
    subAction = self->_subAction;
  }
  return subAction;
}

- (NSString)action
{
  action = self->_action;
  if (!action)
  {
    [(_ICURLRequest *)self parseActions];
    action = self->_action;
  }
  return action;
}

- (id)opener
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23___ICURLRequest_opener__block_invoke;
  aBlock[3] = &unk_1E6551910;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  return v2;
}

- (_ICURLRequest)initWithURL:(id)a3 scheme:(id)a4 userInterface:(id)a5 successHandler:(id)a6 failureHandler:(id)a7 bundleIdentifier:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = [(_ICURLRequest *)self init];
  if (v21)
  {
    uint64_t v22 = [MEMORY[0x1E4F29128] UUID];
    uniqueID = v21->_uniqueID;
    v21->_uniqueID = (NSUUID *)v22;

    objc_storeStrong((id *)&v21->_URL, a3);
    objc_storeStrong((id *)&v21->_scheme, a4);
    objc_storeWeak((id *)&v21->_userInterface, v17);
    uint64_t v24 = [v18 copy];
    id successHandler = v21->_successHandler;
    v21->_id successHandler = (id)v24;

    uint64_t v26 = [v19 copy];
    id failureHandler = v21->_failureHandler;
    v21->_id failureHandler = (id)v26;

    uint64_t v28 = [v20 copy];
    bundleIdentifier = v21->_bundleIdentifier;
    v21->_bundleIdentifier = (NSString *)v28;

    v21->_callbackRequest = [v16 isCallbackScheme];
    v21->_deferCompletionUntilReturn = [v16 isCallbackScheme];
    v30 = v21;
  }

  return v21;
}

+ (id)requestWithURL:(id)a3 scheme:(id)a4 userInterface:(id)a5 bundleIdentifier:(id)a6 successHandler:(id)a7 failureHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)[objc_alloc((Class)a1) initWithURL:v19 scheme:v18 userInterface:v17 successHandler:v15 failureHandler:v14 bundleIdentifier:v16];

  return v20;
}

+ (id)requestWithURL:(id)a3 fromSourceApplication:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)[objc_alloc((Class)a1) initWithURL:v7 scheme:0 userInterface:0 successHandler:0 failureHandler:0 bundleIdentifier:v6];

  return v8;
}

+ (id)requestWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4 scheme:0 userInterface:0 successHandler:0 failureHandler:0 bundleIdentifier:0];

  return v5;
}

@end