@interface SUIBIntelligenceFlowProgressUpdate
+ (BOOL)supportsSecureCoding;
- (NSString)additionalProgressDescription;
- (NSString)progressDescription;
- (SUIBIntelligenceFlowProgressUpdate)init;
- (SUIBIntelligenceFlowProgressUpdate)initWithBuilder:(id)a3;
- (SUIBIntelligenceFlowProgressUpdate)initWithCoder:(id)a3;
- (float)progress;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBIntelligenceFlowProgressUpdate

- (SUIBIntelligenceFlowProgressUpdate)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBIntelligenceFlowProgressUpdateMutation *))a3;
  v16.receiver = self;
  v16.super_class = (Class)SUIBIntelligenceFlowProgressUpdate;
  v5 = [(SUIBIntelligenceFlowProgressUpdate *)&v16 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBIntelligenceFlowProgressUpdateMutation);
    v4[2](v4, v7);
    [(SUIBIntelligenceFlowProgressUpdateMutation *)v7 progress];
    v6->_progress = v8;
    v9 = [(SUIBIntelligenceFlowProgressUpdateMutation *)v7 progressDescription];
    uint64_t v10 = [v9 copy];
    progressDescription = v6->_progressDescription;
    v6->_progressDescription = (NSString *)v10;

    v12 = [(SUIBIntelligenceFlowProgressUpdateMutation *)v7 additionalProgressDescription];
    uint64_t v13 = [v12 copy];
    additionalProgressDescription = v6->_additionalProgressDescription;
    v6->_additionalProgressDescription = (NSString *)v13;
  }
  return v6;
}

- (SUIBIntelligenceFlowProgressUpdate)init
{
  return [(SUIBIntelligenceFlowProgressUpdate *)self initWithBuilder:&__block_literal_global_1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBIntelligenceFlowProgressUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"SUIBIntelligenceFlowProgressUpdate::progress"];
  int v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBIntelligenceFlowProgressUpdate::progressDescription"];
  float v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBIntelligenceFlowProgressUpdate::additionalProgressDescription"];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__SUIBIntelligenceFlowProgressUpdate_initWithCoder___block_invoke;
  v13[3] = &unk_265517E48;
  int v16 = v6;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  v11 = [(SUIBIntelligenceFlowProgressUpdate *)self initWithBuilder:v13];

  return v11;
}

void __52__SUIBIntelligenceFlowProgressUpdate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 48);
  id v5 = a2;
  LODWORD(v4) = v3;
  [v5 setProgress:v4];
  [v5 setProgressDescription:*(void *)(a1 + 32)];
  [v5 setAdditionalProgressDescription:*(void *)(a1 + 40)];
}

- (void)encodeWithCoder:(id)a3
{
  float progress = self->_progress;
  id v6 = a3;
  *(float *)&double v5 = progress;
  [v6 encodeFloat:@"SUIBIntelligenceFlowProgressUpdate::progress" forKey:v5];
  [v6 encodeObject:self->_progressDescription forKey:@"SUIBIntelligenceFlowProgressUpdate::progressDescription"];
  [v6 encodeObject:self->_additionalProgressDescription forKey:@"SUIBIntelligenceFlowProgressUpdate::additionalProgressDescription"];
}

- (float)progress
{
  return self->_progress;
}

- (NSString)progressDescription
{
  return self->_progressDescription;
}

- (NSString)additionalProgressDescription
{
  return self->_additionalProgressDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProgressDescription, 0);
  objc_storeStrong((id *)&self->_progressDescription, 0);
}

@end