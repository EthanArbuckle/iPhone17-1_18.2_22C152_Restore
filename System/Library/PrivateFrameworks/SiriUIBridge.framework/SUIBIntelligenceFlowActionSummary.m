@interface SUIBIntelligenceFlowActionSummary
+ (BOOL)supportsSecureCoding;
- (NSDictionary)parameterSummaries;
- (NSString)formatString;
- (SUIBIntelligenceFlowActionSummary)init;
- (SUIBIntelligenceFlowActionSummary)initWithBuilder:(id)a3;
- (SUIBIntelligenceFlowActionSummary)initWithCoder:(id)a3;
- (id)parameterMatches;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBIntelligenceFlowActionSummary

- (SUIBIntelligenceFlowActionSummary)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBIntelligenceFlowActionSummaryMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SUIBIntelligenceFlowActionSummary;
  v5 = [(SUIBIntelligenceFlowActionSummary *)&v15 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBIntelligenceFlowActionSummaryMutation);
    v4[2](v4, v7);
    v8 = [(SUIBIntelligenceFlowActionSummaryMutation *)v7 formatString];
    uint64_t v9 = [v8 copy];
    formatString = v6->_formatString;
    v6->_formatString = (NSString *)v9;

    v11 = [(SUIBIntelligenceFlowActionSummaryMutation *)v7 parameterSummaries];
    uint64_t v12 = [v11 copy];
    parameterSummaries = v6->_parameterSummaries;
    v6->_parameterSummaries = (NSDictionary *)v12;
  }
  return v6;
}

- (SUIBIntelligenceFlowActionSummary)init
{
  return [(SUIBIntelligenceFlowActionSummary *)self initWithBuilder:&__block_literal_global];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBIntelligenceFlowActionSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBIntelligenceFlowActionSummary::formatString"];
  uint64_t v6 = objc_opt_class();
  v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"SUIBIntelligenceFlowActionSummary::parameterSummaries"];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__SUIBIntelligenceFlowActionSummary_initWithCoder___block_invoke;
  v12[3] = &unk_265517DB8;
  id v13 = v5;
  id v14 = v7;
  id v8 = v7;
  id v9 = v5;
  v10 = [(SUIBIntelligenceFlowActionSummary *)self initWithBuilder:v12];

  return v10;
}

void __51__SUIBIntelligenceFlowActionSummary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setFormatString:v3];
  [v4 setParameterSummaries:*(void *)(a1 + 40)];
}

- (void)encodeWithCoder:(id)a3
{
  formatString = self->_formatString;
  id v5 = a3;
  [v5 encodeObject:formatString forKey:@"SUIBIntelligenceFlowActionSummary::formatString"];
  [v5 encodeObject:self->_parameterSummaries forKey:@"SUIBIntelligenceFlowActionSummary::parameterSummaries"];
}

- (id)parameterMatches
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [(SUIBIntelligenceFlowActionSummary *)self formatString];
  uint64_t v3 = +[SUIBIntelligenceFlowActionSummaryParameterMatcher matchesIn:v2];

  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [SUIBRegexMatch alloc];
        uint64_t v12 = -[SUIBRegexMatch initWithBridgedMatch:](v11, "initWithBridgedMatch:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[v4 copy];
  return v13;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSDictionary)parameterSummaries
{
  return self->_parameterSummaries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSummaries, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

@end