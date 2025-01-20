@interface SUIBRequestProgress
+ (BOOL)supportsSecureCoding;
- (SUIBIntelligenceFlowActionSummary)intelligenceFlowActionSummary;
- (SUIBIntelligenceFlowProgressUpdate)intelligenceFlowProgressUpdate;
- (SUIBNLRouterSummary)nlRouterSummary;
- (SUIBRequestProgress)init;
- (SUIBRequestProgress)initWithBuilder:(id)a3;
- (SUIBRequestProgress)initWithCoder:(id)a3;
- (unint64_t)progressType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBRequestProgress

- (SUIBRequestProgress)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBRequestProgressMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SUIBRequestProgress;
  v5 = [(SUIBRequestProgress *)&v15 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBRequestProgressMutation);
    v4[2](v4, v7);
    v6->_progressType = [(SUIBRequestProgressMutation *)v7 progressType];
    uint64_t v8 = [(SUIBRequestProgressMutation *)v7 nlRouterSummary];
    nlRouterSummary = v6->_nlRouterSummary;
    v6->_nlRouterSummary = (SUIBNLRouterSummary *)v8;

    uint64_t v10 = [(SUIBRequestProgressMutation *)v7 intelligenceFlowActionSummary];
    intelligenceFlowActionSummary = v6->_intelligenceFlowActionSummary;
    v6->_intelligenceFlowActionSummary = (SUIBIntelligenceFlowActionSummary *)v10;

    uint64_t v12 = [(SUIBRequestProgressMutation *)v7 intelligenceFlowProgressUpdate];
    intelligenceFlowProgressUpdate = v6->_intelligenceFlowProgressUpdate;
    v6->_intelligenceFlowProgressUpdate = (SUIBIntelligenceFlowProgressUpdate *)v12;
  }
  return v6;
}

- (SUIBRequestProgress)init
{
  return [(SUIBRequestProgress *)self initWithBuilder:&__block_literal_global_4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBRequestProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBRequestProgress::progressType"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBRequestProgress::nlRouterSummary"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBRequestProgress::intelligenceFlowActionSummary"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBRequestProgress::intelligenceFlowProgressUpdate"];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __37__SUIBRequestProgress_initWithCoder___block_invoke;
  v15[3] = &unk_265517F20;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  uint64_t v19 = v6;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  v13 = [(SUIBRequestProgress *)self initWithBuilder:v15];

  return v13;
}

void __37__SUIBRequestProgress_initWithCoder___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[7];
  id v4 = a2;
  [v4 setProgressType:v3];
  [v4 setNlRouterSummary:a1[4]];
  [v4 setIntelligenceFlowActionSummary:a1[5]];
  [v4 setIntelligenceFlowProgressUpdate:a1[6]];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t progressType = self->_progressType;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithUnsignedInteger:progressType];
  [v7 encodeObject:v6 forKey:@"SUIBRequestProgress::progressType"];

  [v7 encodeObject:self->_nlRouterSummary forKey:@"SUIBRequestProgress::nlRouterSummary"];
  [v7 encodeObject:self->_intelligenceFlowActionSummary forKey:@"SUIBRequestProgress::intelligenceFlowActionSummary"];
  [v7 encodeObject:self->_intelligenceFlowProgressUpdate forKey:@"SUIBRequestProgress::intelligenceFlowProgressUpdate"];
}

- (unint64_t)progressType
{
  return self->_progressType;
}

- (SUIBNLRouterSummary)nlRouterSummary
{
  return self->_nlRouterSummary;
}

- (SUIBIntelligenceFlowActionSummary)intelligenceFlowActionSummary
{
  return self->_intelligenceFlowActionSummary;
}

- (SUIBIntelligenceFlowProgressUpdate)intelligenceFlowProgressUpdate
{
  return self->_intelligenceFlowProgressUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligenceFlowProgressUpdate, 0);
  objc_storeStrong((id *)&self->_intelligenceFlowActionSummary, 0);
  objc_storeStrong((id *)&self->_nlRouterSummary, 0);
}

@end