@interface SUIBIntelligenceFlowParameterSummary
+ (BOOL)supportsSecureCoding;
- (NSString)value;
- (SUIBIntelligenceFlowParameterSummary)init;
- (SUIBIntelligenceFlowParameterSummary)initWithBuilder:(id)a3;
- (SUIBIntelligenceFlowParameterSummary)initWithCoder:(id)a3;
- (unint64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBIntelligenceFlowParameterSummary

- (SUIBIntelligenceFlowParameterSummary)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBIntelligenceFlowParameterSummaryMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBIntelligenceFlowParameterSummary;
  v5 = [(SUIBIntelligenceFlowParameterSummary *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBIntelligenceFlowParameterSummaryMutation);
    v4[2](v4, v7);
    v6->_valueType = [(SUIBIntelligenceFlowParameterSummaryMutation *)v7 valueType];
    v8 = [(SUIBIntelligenceFlowParameterSummaryMutation *)v7 value];
    uint64_t v9 = [v8 copy];
    value = v6->_value;
    v6->_value = (NSString *)v9;
  }
  return v6;
}

- (SUIBIntelligenceFlowParameterSummary)init
{
  return [(SUIBIntelligenceFlowParameterSummary *)self initWithBuilder:&__block_literal_global_0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBIntelligenceFlowParameterSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBIntelligenceFlowParameterSummary::valueType"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBIntelligenceFlowParameterSummary::value"];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__SUIBIntelligenceFlowParameterSummary_initWithCoder___block_invoke;
  v11[3] = &unk_265517E00;
  id v12 = v7;
  uint64_t v13 = v6;
  id v8 = v7;
  uint64_t v9 = [(SUIBIntelligenceFlowParameterSummary *)self initWithBuilder:v11];

  return v9;
}

void __54__SUIBIntelligenceFlowParameterSummary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setValueType:v3];
  [v4 setValue:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t valueType = self->_valueType;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithUnsignedInteger:valueType];
  [v7 encodeObject:v6 forKey:@"SUIBIntelligenceFlowParameterSummary::valueType"];

  [v7 encodeObject:self->_value forKey:@"SUIBIntelligenceFlowParameterSummary::value"];
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
}

@end