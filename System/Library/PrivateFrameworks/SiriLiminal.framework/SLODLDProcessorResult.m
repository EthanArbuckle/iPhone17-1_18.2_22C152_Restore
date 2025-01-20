@interface SLODLDProcessorResult
- (NSArray)tokens;
- (NSData)outputEmb;
- (NSDictionary)features;
- (NSString)configVersion;
- (SLODLDProcessorResult)initWithScore:(float)a3 withVersion:(id)a4 tokens:(id)a5 features:(id)a6 outputEmb:(id)a7 outputAnchor:(float)a8 conversationalScore:(float)a9;
- (float)conversationalScore;
- (float)odldScore;
- (float)outputAnchor;
- (id)description;
@end

@implementation SLODLDProcessorResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_outputEmb, 0);
}

- (float)conversationalScore
{
  return self->_conversationalScore;
}

- (NSDictionary)features
{
  return self->_features;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (float)outputAnchor
{
  return self->_outputAnchor;
}

- (NSData)outputEmb
{
  return self->_outputEmb;
}

- (float)odldScore
{
  return self->_odldScore;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ODLD Score: %f Social Score: %f Tokens: %@, Embeddings: %@, Conversational Score: %f", self->_odldScore, self->_outputAnchor, self->_tokens, self->_outputEmb, self->_conversationalScore];
}

- (SLODLDProcessorResult)initWithScore:(float)a3 withVersion:(id)a4 tokens:(id)a5 features:(id)a6 outputEmb:(id)a7 outputAnchor:(float)a8 conversationalScore:(float)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v31.receiver = self;
  v31.super_class = (Class)SLODLDProcessorResult;
  v20 = [(SLODLDProcessorResult *)&v31 init];
  v21 = v20;
  if (v20)
  {
    v20->_odldScore = a3;
    uint64_t v22 = [v16 copy];
    configVersion = v21->_configVersion;
    v21->_configVersion = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    tokens = v21->_tokens;
    v21->_tokens = (NSArray *)v24;

    uint64_t v26 = [v18 copy];
    features = v21->_features;
    v21->_features = (NSDictionary *)v26;

    uint64_t v28 = [v19 copy];
    outputEmb = v21->_outputEmb;
    v21->_outputEmb = (NSData *)v28;

    v21->_outputAnchor = a8;
    v21->_conversationalScore = a9;
  }

  return v21;
}

@end