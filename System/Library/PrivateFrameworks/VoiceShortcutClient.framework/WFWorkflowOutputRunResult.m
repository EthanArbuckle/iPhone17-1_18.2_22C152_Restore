@interface WFWorkflowOutputRunResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOutput;
- (NSData)archivedOutput;
- (WFContentCollection)cachedOutput;
- (WFWorkflowOutputRunResult)initWithCoder:(id)a3;
- (WFWorkflowOutputRunResult)initWithOutput:(id)a3;
- (WFWorkflowOutputRunResult)initWithOutput:(id)a3 runError:(id)a4;
- (id)description;
- (id)generateRepresentationFromOutput:(id)a3;
- (id)resultBySettingError:(id)a3;
- (id)unableToDecodeError;
- (void)encodeWithCoder:(id)a3;
- (void)generateOutputFromRepresentation:(id)a3 withCompletion:(id)a4;
- (void)getOutputWithCompletionHandler:(id)a3;
- (void)setCachedOutput:(id)a3;
@end

@implementation WFWorkflowOutputRunResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutput, 0);
  objc_storeStrong((id *)&self->_archivedOutput, 0);
}

- (void)setCachedOutput:(id)a3
{
}

- (WFContentCollection)cachedOutput
{
  return self->_cachedOutput;
}

- (NSData)archivedOutput
{
  return self->_archivedOutput;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFWorkflowOutputRunResult;
  id v4 = a3;
  [(WFWorkflowRunResult *)&v6 encodeWithCoder:v4];
  v5 = [(WFWorkflowOutputRunResult *)self archivedOutput];
  [v4 encodeObject:v5 forKey:@"archivedOutput"];
}

- (WFWorkflowOutputRunResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowOutputRunResult;
  v5 = [(WFWorkflowRunResult *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedOutput"];
    archivedOutput = v5->_archivedOutput;
    v5->_archivedOutput = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)generateOutputFromRepresentation:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  Class v7 = NSClassFromString((NSString *)@"WFContentCollection");
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F28DC0];
    v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__WFWorkflowOutputRunResult_generateOutputFromRepresentation_withCompletion___block_invoke;
    v12[3] = &unk_1E6077F30;
    id v13 = v6;
    id v10 = (id)objc_msgSend(v8, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v9, v12);
  }
  else
  {
    v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFWorkflowOutputRunResult generateOutputFromRepresentation:withCompletion:]";
      _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_FAULT, "%s Unable to get output from WFWorkflowRunRequest, since ContentKit isn't linked.", buf, 0xCu);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __77__WFWorkflowOutputRunResult_generateOutputFromRepresentation_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)generateRepresentationFromOutput:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", a3, 1);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(WFWorkflowOutputRunResult *)self cachedOutput];
  Class v7 = v6;
  if (!v6)
  {
    Class v7 = [(WFWorkflowOutputRunResult *)self archivedOutput];
  }
  v8 = [(WFWorkflowRunResult *)self error];
  v9 = [v3 stringWithFormat:@"<%@: %p Output: %@, Error: %@", v5, self, v7, v8];

  if (!v6) {
  return v9;
  }
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

- (void)getOutputWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(WFWorkflowOutputRunResult *)self cachedOutput];

  if (v5)
  {
    id v6 = [(WFWorkflowOutputRunResult *)self cachedOutput];
    v4[2](v4, v6, 0);
  }
  else
  {
    Class v7 = [(WFWorkflowOutputRunResult *)self archivedOutput];

    if (v7)
    {
      v8 = [(WFWorkflowOutputRunResult *)self archivedOutput];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __60__WFWorkflowOutputRunResult_getOutputWithCompletionHandler___block_invoke;
      v9[3] = &unk_1E6078278;
      v9[4] = self;
      id v10 = v4;
      [(WFWorkflowOutputRunResult *)self generateOutputFromRepresentation:v8 withCompletion:v9];
    }
    else
    {
      v4[2](v4, 0, 0);
    }
  }
}

void __60__WFWorkflowOutputRunResult_getOutputWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setCachedOutput:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)hasOutput
{
  v2 = [(WFWorkflowOutputRunResult *)self archivedOutput];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)resultBySettingError:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WFWorkflowOutputRunResult;
  id v4 = [(WFWorkflowRunResult *)&v11 resultBySettingError:a3];
  id v5 = [(WFWorkflowOutputRunResult *)self archivedOutput];
  uint64_t v6 = [v5 copyWithZone:0];
  Class v7 = (void *)v4[2];
  v4[2] = v6;

  uint64_t v8 = [(WFWorkflowOutputRunResult *)self cachedOutput];
  v9 = (void *)v4[3];
  v4[3] = v8;

  return self;
}

- (WFWorkflowOutputRunResult)initWithOutput:(id)a3 runError:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFWorkflowOutputRunResult;
  uint64_t v8 = [(WFWorkflowRunResult *)&v13 initWithError:a4];
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      id v10 = [(WFWorkflowOutputRunResult *)v8 generateRepresentationFromOutput:v7];
    }
    else
    {
      id v10 = 0;
    }
    objc_storeStrong((id *)&v9->_archivedOutput, v10);
    if (v7) {

    }
    objc_storeStrong((id *)&v9->_cachedOutput, a3);
    objc_super v11 = v9;
  }

  return v9;
}

- (WFWorkflowOutputRunResult)initWithOutput:(id)a3
{
  return [(WFWorkflowOutputRunResult *)self initWithOutput:a3 runError:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end