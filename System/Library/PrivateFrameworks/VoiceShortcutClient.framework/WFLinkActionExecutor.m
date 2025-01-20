@interface WFLinkActionExecutor
- (LNAction)linkAction;
- (LNActionMetadata)metadata;
- (NSString)appBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)sourceOverride;
- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 error:(id *)a7;
- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 source:(unsigned __int16)a7 error:(id *)a8;
- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 source:(unsigned __int16)a7 sourceOverride:(id)a8 error:(id *)a9;
- (id)completionHandler;
- (id)executorOptions;
- (int64_t)authenticationPolicy;
- (unsigned)source;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WFLinkActionExecutor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceOverride, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)sourceOverride
{
  return self->_sourceOverride;
}

- (unsigned)source
{
  return self->_source;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8 = a5;
  v6 = [(WFLinkActionExecutor *)self completionHandler];

  if (v6)
  {
    v7 = [(WFLinkActionExecutor *)self completionHandler];
    ((void (**)(void, id))v7)[2](v7, v8);

    [(WFLinkActionExecutor *)self setCompletionHandler:0];
  }
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F72808];
  id v6 = a4;
  id v7 = [v4 errorWithDomain:v5 code:2010 userInfo:0];
  [v6 respondWithError:v7];
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F72808];
  id v6 = a4;
  id v7 = [v4 errorWithDomain:v5 code:2010 userInfo:0];
  [v6 respondWithError:v7];
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F72808];
  id v6 = a4;
  id v7 = [v4 errorWithDomain:v5 code:2010 userInfo:0];
  [v6 respondWithError:v7];
}

- (id)executorOptions
{
  v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F72C70]);
  uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v6 = [v5 localeIdentifier];
  id v7 = (void *)[v4 initWithLocaleIdentifier:v6];
  [v3 setEnvironment:v7];

  [v3 setClientLabel:@"App Intent Runner"];
  uint64_t v8 = 1;
  [v3 setAllowsPrepareBeforePerform:1];
  objc_msgSend(v3, "setSource:", -[WFLinkActionExecutor source](self, "source"));
  v9 = [(WFLinkActionExecutor *)self sourceOverride];
  [v3 setSourceOverride:v9];

  int64_t v10 = [(WFLinkActionExecutor *)self authenticationPolicy];
  if (v10 != 1)
  {
    if (v10 != 2) {
      goto LABEL_5;
    }
    uint64_t v8 = 0;
  }
  [v3 setRequestUnlockIfNeeded:v8];
LABEL_5:
  return v3;
}

- (void)performWithCompletionHandler:(id)a3
{
  [(WFLinkActionExecutor *)self setCompletionHandler:a3];
  id v14 = (id)objc_opt_new();
  id v4 = [(WFLinkActionExecutor *)self extensionBundleIdentifier];
  [v14 setPreferredExtensionBundleIdentifier:v4];

  uint64_t v5 = (void *)MEMORY[0x1E4F72BC0];
  id v6 = [(WFLinkActionExecutor *)self metadata];
  id v7 = [v5 policyWithActionMetadata:v6 signals:v14];

  uint64_t v8 = [v7 connectionWithError:0];
  v9 = [(WFLinkActionExecutor *)self linkAction];
  int64_t v10 = [v9 parameters];
  v11 = [v7 actionWithParameters:v10];

  v12 = [(WFLinkActionExecutor *)self executorOptions];
  v13 = [v8 executorForAction:v11 options:v12 delegate:self];

  [v13 perform];
}

- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 error:(id *)a7
{
  return [(WFLinkActionExecutor *)self initWithLinkAction:a3 appBundleIdentifier:a4 extensionBundleIdentifier:a5 authenticationPolicy:a6 source:0 error:a7];
}

- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 source:(unsigned __int16)a7 sourceOverride:(id)a8 error:(id *)a9
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"WFLinkActionExecutor.m", 63, @"Invalid parameter not satisfying: %@", @"linkAction" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v48 = [MEMORY[0x1E4F28B00] currentHandler];
  [v48 handleFailureInMethod:a2, self, @"WFLinkActionExecutor.m", 64, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];

LABEL_3:
  v49.receiver = self;
  v49.super_class = (Class)WFLinkActionExecutor;
  v21 = [(WFLinkActionExecutor *)&v49 init];
  v22 = v21;
  if (v21)
  {
    id v46 = v20;
    objc_storeStrong((id *)&v21->_linkAction, a3);
    uint64_t v23 = [v18 copy];
    appBundleIdentifier = v22->_appBundleIdentifier;
    v22->_appBundleIdentifier = (NSString *)v23;

    v22->_source = a7;
    objc_storeStrong((id *)&v22->_sourceOverride, a8);
    uint64_t v25 = [v19 copy];
    extensionBundleIdentifier = v22->_extensionBundleIdentifier;
    v22->_extensionBundleIdentifier = (NSString *)v25;

    v22->_authenticationPolicy = a6;
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F72CE0]) initWithOptions:2];
    metadataProvider = v22->_metadataProvider;
    v22->_metadataProvider = (LNMetadataProvider *)v27;

    v29 = v22->_metadataProvider;
    id v30 = objc_alloc(MEMORY[0x1E4F72CA0]);
    v31 = [v17 identifier];
    v32 = (void *)[v30 initWithActionIdentifier:v31 bundleIdentifier:v18];
    v52[0] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    v34 = [(LNMetadataProvider *)v29 actionsWithFullyQualifiedIdentifiers:v33 error:a9];
    v35 = [v34 objectForKeyedSubscript:v18];
    v36 = [v17 identifier];
    uint64_t v37 = [v35 objectForKeyedSubscript:v36];
    metadata = v22->_metadata;
    v22->_metadata = (LNActionMetadata *)v37;

    if (v22->_metadata)
    {
      v39 = v22;
    }
    else
    {
      if (a9)
      {
        v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        v41 = NSString;
        v43 = v42 = [v17 identifier];
        v51 = v43;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        *a9 = [v40 errorWithDomain:@"WFLinkActionWorkflowRunnerClientErrorDomain" code:1 userInfo:v44];
      }
      v39 = 0;
    }
    id v20 = v46;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 source:(unsigned __int16)a7 error:(id *)a8
{
  return [(WFLinkActionExecutor *)self initWithLinkAction:a3 appBundleIdentifier:a4 extensionBundleIdentifier:a5 authenticationPolicy:a6 source:a7 sourceOverride:0 error:a8];
}

@end