@interface PRUISAnalysisServiceResponse
+ (BOOL)supportsSecureCoding;
- (NSSet)requestedAnalyses;
- (NSString)description;
- (NSUUID)requestIdentifier;
- (PRUISAnalysisServiceResponse)initWithCoder:(id)a3;
- (PRUISAnalysisServiceResponse)initWithRequestIdentifier:(id)a3 reports:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)resultForAnalysis:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRUISAnalysisServiceResponse

- (PRUISAnalysisServiceResponse)initWithRequestIdentifier:(id)a3 reports:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRUISAnalysisServiceResponse;
  v9 = [(PRUISAnalysisServiceResponse *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestIdentifier, a3);
    uint64_t v11 = [v8 copy];
    reports = v10->_reports;
    v10->_reports = (NSDictionary *)v11;
  }
  return v10;
}

- (NSSet)requestedAnalyses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(NSDictionary *)self->_reports allKeys];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)resultForAnalysis:(id)a3
{
  return [(NSDictionary *)self->_reports objectForKeyedSubscript:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_requestIdentifier forKey:@"_requestIdentifier"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PRUISAnalysisServiceResponse_encodeWithCoder___block_invoke;
  v6[3] = &unk_26546B4B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  PRUISAnalysisEnumerate(v6);
}

void __48__PRUISAnalysisServiceResponse_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "resultForAnalysis:");
  if (v3) {
    [*(id *)(a1 + 40) encodeObject:v3 forKey:v4];
  }
}

- (PRUISAnalysisServiceResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"_requestIdentifier"];

  id v7 = objc_opt_new();
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  objc_super v14 = __46__PRUISAnalysisServiceResponse_initWithCoder___block_invoke;
  v15 = &unk_26546B4B8;
  id v16 = v4;
  id v17 = v7;
  id v8 = v7;
  id v9 = v4;
  PRUISAnalysisEnumerate(&v12);
  v10 = -[PRUISAnalysisServiceResponse initWithRequestIdentifier:reports:](self, "initWithRequestIdentifier:reports:", v6, v8, v12, v13, v14, v15);

  return v10;
}

void __46__PRUISAnalysisServiceResponse_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = PRUISAnalysisResultClassForPRUISAnalysis(v5);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:v3 forKey:v5];
    if (v4) {
      [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v5];
    }
  }
}

- (NSString)description
{
  return (NSString *)[(PRUISAnalysisServiceResponse *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PRUISAnalysisServiceResponse *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  id v7 = (id)[v6 appendObject:self->_requestIdentifier withName:@"_requestIdentifier"];
  [v6 appendDictionarySection:self->_reports withName:@"reports" multilinePrefix:v5 skipIfEmpty:0];

  return v6;
}

- (id)succinctDescription
{
  v2 = [(PRUISAnalysisServiceResponse *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_reports, 0);
}

@end