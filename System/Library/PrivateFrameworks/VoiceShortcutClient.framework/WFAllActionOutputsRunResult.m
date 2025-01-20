@interface WFAllActionOutputsRunResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOutputs;
- (NSData)archivedOutputs;
- (NSDictionary)cachedOutputs;
- (WFAllActionOutputsRunResult)initWithActionOutputs:(id)a3 runError:(id)a4;
- (WFAllActionOutputsRunResult)initWithCoder:(id)a3;
- (id)unableToDecodeError;
- (void)encodeWithCoder:(id)a3;
- (void)generateOutputsFromRepresentation:(id)a3 withCompletion:(id)a4;
- (void)getActionOutputsWithCompletionHandler:(id)a3;
- (void)setCachedOutputs:(id)a3;
@end

@implementation WFAllActionOutputsRunResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutputs, 0);
  objc_storeStrong((id *)&self->_archivedOutputs, 0);
}

- (void)setCachedOutputs:(id)a3
{
}

- (NSDictionary)cachedOutputs
{
  return self->_cachedOutputs;
}

- (NSData)archivedOutputs
{
  return self->_archivedOutputs;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAllActionOutputsRunResult;
  id v4 = a3;
  [(WFWorkflowRunResult *)&v6 encodeWithCoder:v4];
  v5 = [(WFAllActionOutputsRunResult *)self archivedOutputs];
  [v4 encodeObject:v5 forKey:@"archivedOutputs"];
}

- (WFAllActionOutputsRunResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAllActionOutputsRunResult;
  v5 = [(WFWorkflowRunResult *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedOutputs"];
    archivedOutputs = v5->_archivedOutputs;
    v5->_archivedOutputs = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)generateOutputsFromRepresentation:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  Class v7 = NSClassFromString((NSString *)@"WFContentCollection");
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = v7;
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    objc_super v10 = [v8 setWithArray:v9];

    v11 = (void *)MEMORY[0x1E4F28DC0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__WFAllActionOutputsRunResult_generateOutputsFromRepresentation_withCompletion___block_invoke;
    v14[3] = &unk_1E6079780;
    id v15 = v6;
    id v12 = (id)objc_msgSend(v11, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v10, v14);
  }
  else
  {
    v13 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFAllActionOutputsRunResult generateOutputsFromRepresentation:withCompletion:]";
      _os_log_impl(&dword_1B3C5C000, v13, OS_LOG_TYPE_FAULT, "%s Unable to get output from WFWorkflowRunRequest, since ContentKit isn't linked.", buf, 0xCu);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __80__WFAllActionOutputsRunResult_generateOutputsFromRepresentation_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)unableToDecodeError
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  v9[0] = *MEMORY[0x1E4F28588];
  id v4 = WFLocalizedString(@"Unable to finish running");
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E4F28568];
  id v5 = WFLocalizedString(@"The output of the shortcut could not be processed.");
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  Class v7 = [v2 errorWithDomain:v3 code:0x7FFFFFFFFFFFFFFFLL userInfo:v6];

  return v7;
}

- (void)getActionOutputsWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(WFAllActionOutputsRunResult *)self cachedOutputs];

  if (v5)
  {
    id v6 = [(WFAllActionOutputsRunResult *)self cachedOutputs];
    v4[2](v4, v6, 0);
  }
  else
  {
    Class v7 = [(WFAllActionOutputsRunResult *)self archivedOutputs];

    if (v7)
    {
      v8 = [(WFAllActionOutputsRunResult *)self archivedOutputs];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __69__WFAllActionOutputsRunResult_getActionOutputsWithCompletionHandler___block_invoke;
      v9[3] = &unk_1E6079758;
      v9[4] = self;
      objc_super v10 = v4;
      [(WFAllActionOutputsRunResult *)self generateOutputsFromRepresentation:v8 withCompletion:v9];
    }
    else
    {
      v4[2](v4, 0, 0);
    }
  }
}

void __69__WFAllActionOutputsRunResult_getActionOutputsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setCachedOutputs:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)hasOutputs
{
  v2 = [(WFAllActionOutputsRunResult *)self archivedOutputs];
  BOOL v3 = v2 != 0;

  return v3;
}

- (WFAllActionOutputsRunResult)initWithActionOutputs:(id)a3 runError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFAllActionOutputsRunResult.m", 26, @"Invalid parameter not satisfying: %@", @"actionOutputs" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFAllActionOutputsRunResult;
  v9 = [(WFWorkflowRunResult *)&v17 initWithError:v8];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 1);
    archivedOutputs = v9->_archivedOutputs;
    v9->_archivedOutputs = (NSData *)v10;

    uint64_t v12 = [v7 copy];
    cachedOutputs = v9->_cachedOutputs;
    v9->_cachedOutputs = (NSDictionary *)v12;

    v14 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end