@interface SFExperimentTriggeredFeedback
+ (BOOL)supportsSecureCoding;
- (NSUUID)codepathId;
- (SFCounterfactualInfo)counterfactual;
- (SFExperimentTriggeredFeedback)init;
- (SFExperimentTriggeredFeedback)initWithCfDiffered:(BOOL)a3 cfUsed:(BOOL)a4 cfError:(unint64_t)a5;
- (SFExperimentTriggeredFeedback)initWithCodepathId:(id)a3;
- (SFExperimentTriggeredFeedback)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCodepathId:(id)a3;
- (void)setCounterfactual:(id)a3;
@end

@implementation SFExperimentTriggeredFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_counterfactual, 0);
}

- (void)setCodepathId:(id)a3
{
}

- (NSUUID)codepathId
{
  return self->_codepathId;
}

- (void)setCounterfactual:(id)a3
{
}

- (SFCounterfactualInfo)counterfactual
{
  return self->_counterfactual;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFExperimentTriggeredFeedback;
  [(SFFeedback *)&v8 encodeWithCoder:v4];
  v5 = [(SFExperimentTriggeredFeedback *)self counterfactual];
  if (v5)
  {
    [v4 encodeBool:1 forKey:@"_hasCF"];
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "cfDiffered"), @"_cfDiffered");
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "cfUsed"), @"_cfUsed");
    objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v5, "cfError"), @"_cfError");
  }
  v6 = [(SFExperimentTriggeredFeedback *)self codepathId];

  if (v6)
  {
    v7 = [(SFExperimentTriggeredFeedback *)self codepathId];
    [v4 encodeObject:v7 forKey:@"_codepathId"];
  }
}

- (SFExperimentTriggeredFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFExperimentTriggeredFeedback;
  v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    if ([v4 decodeBoolForKey:@"_hasCF"])
    {
      v6 = objc_alloc_init(SFCounterfactualInfo);
      -[SFCounterfactualInfo setCfDiffered:](v6, "setCfDiffered:", [v4 decodeBoolForKey:@"_cfDiffered"]);
      -[SFCounterfactualInfo setCfUsed:](v6, "setCfUsed:", [v4 decodeBoolForKey:@"_cfUsed"]);
      -[SFCounterfactualInfo setCfError:](v6, "setCfError:", [v4 decodeInt64ForKey:@"_cfError"]);
      [(SFExperimentTriggeredFeedback *)v5 setCounterfactual:v6];
    }
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_codepathId"];
    [(SFExperimentTriggeredFeedback *)v5 setCodepathId:v7];
  }
  return v5;
}

- (SFExperimentTriggeredFeedback)initWithCfDiffered:(BOOL)a3 cfUsed:(BOOL)a4 cfError:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  objc_super v8 = [(SFExperimentTriggeredFeedback *)self init];
  if (v8)
  {
    objc_super v9 = objc_alloc_init(SFCounterfactualInfo);
    [(SFCounterfactualInfo *)v9 setCfDiffered:v7];
    [(SFCounterfactualInfo *)v9 setCfUsed:v6];
    [(SFCounterfactualInfo *)v9 setCfError:a5];
    [(SFExperimentTriggeredFeedback *)v8 setCounterfactual:v9];
    v10 = v8;
  }
  return v8;
}

- (SFExperimentTriggeredFeedback)initWithCodepathId:(id)a3
{
  id v4 = a3;
  v5 = [(SFExperimentTriggeredFeedback *)self init];
  BOOL v6 = v5;
  if (v5)
  {
    [(SFExperimentTriggeredFeedback *)v5 setCodepathId:v4];
    BOOL v7 = v6;
  }

  return v6;
}

- (SFExperimentTriggeredFeedback)init
{
  v3.receiver = self;
  v3.super_class = (Class)SFExperimentTriggeredFeedback;
  return [(SFFeedback *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end