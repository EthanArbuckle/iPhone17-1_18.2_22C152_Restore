@interface WFReachabilityConfigurationResponse
+ (BOOL)supportsSecureCoding;
- (NSURL)reachabilityHostURL;
- (NWPathEvaluator)pathEvaluator;
- (WFReachabilityConfigurationResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setReachabilityHostURL:(id)a3;
@end

@implementation WFReachabilityConfigurationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFReachabilityConfigurationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFReachabilityConfigurationResponse;
  v5 = [(WFResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFReachabilityConfiguratiionReachabilityHostURLKey"];
    [(WFReachabilityConfigurationResponse *)v5 setReachabilityHostURL:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFReachabilityConfigurationResponse;
  id v4 = a3;
  [(WFResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFReachabilityConfigurationResponse *)self reachabilityHostURL];
  [v4 encodeObject:v5 forKey:@"WFReachabilityConfiguratiionReachabilityHostURLKey"];
}

- (NWPathEvaluator)pathEvaluator
{
  v2 = [(WFReachabilityConfigurationResponse *)self reachabilityHostURL];
  v3 = objc_msgSend(MEMORY[0x263F14420], "wf_pathEvaluatorForURL:", v2);

  return (NWPathEvaluator *)v3;
}

- (NSURL)reachabilityHostURL
{
  return self->_reachabilityHostURL;
}

- (void)setReachabilityHostURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end