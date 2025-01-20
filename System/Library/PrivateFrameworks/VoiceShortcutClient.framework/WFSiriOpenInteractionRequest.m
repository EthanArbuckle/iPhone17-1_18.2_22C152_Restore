@interface WFSiriOpenInteractionRequest
+ (BOOL)supportsSecureCoding;
- (INInteraction)interaction;
- (WFSiriOpenInteractionRequest)initWithCoder:(id)a3;
- (WFSiriOpenInteractionRequest)initWithInteraction:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriOpenInteractionRequest

- (void).cxx_destruct
{
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriOpenInteractionRequest;
  id v4 = a3;
  [(WFSiriActionRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFSiriOpenInteractionRequest *)self interaction];
  [v4 encodeObject:v5 forKey:@"interaction"];
}

- (WFSiriOpenInteractionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriOpenInteractionRequest;
  v5 = [(WFSiriActionRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interaction"];
    interaction = v5->_interaction;
    v5->_interaction = (INInteraction *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSiriOpenInteractionRequest)initWithInteraction:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriOpenInteractionRequest;
  uint64_t v6 = [(WFSiriActionRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interaction, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end