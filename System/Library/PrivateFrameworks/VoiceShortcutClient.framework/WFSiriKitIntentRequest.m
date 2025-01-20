@interface WFSiriKitIntentRequest
+ (BOOL)supportsSecureCoding;
- (INIntent)intent;
- (WFSiriKitIntentRequest)initWithCoder:(id)a3;
- (WFSiriKitIntentRequest)initWithIntent:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriKitIntentRequest

- (void).cxx_destruct
{
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriKitIntentRequest;
  id v4 = a3;
  [(WFSiriActionRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFSiriKitIntentRequest *)self intent];
  [v4 encodeObject:v5 forKey:@"intent"];
}

- (WFSiriKitIntentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriKitIntentRequest;
  v5 = [(WFSiriActionRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSiriKitIntentRequest)initWithIntent:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriKitIntentRequest;
  uint64_t v6 = [(WFSiriActionRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intent, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end