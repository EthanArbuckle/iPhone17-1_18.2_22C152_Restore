@interface WFSiriLinkResponse
+ (BOOL)supportsSecureCoding;
- (LNActionOutput)actionOutput;
- (WFSiriLinkResponse)initWithCoder:(id)a3;
- (WFSiriLinkResponse)initWithOutput:(id)a3 andError:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriLinkResponse

- (void).cxx_destruct
{
}

- (LNActionOutput)actionOutput
{
  return self->_actionOutput;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriLinkResponse;
  id v4 = a3;
  [(WFSiriActionResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFSiriLinkResponse *)self actionOutput];
  [v4 encodeObject:v5 forKey:@"actionOutput"];
}

- (WFSiriLinkResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriLinkResponse;
  v5 = [(WFSiriActionResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionOutput"];
    actionOutput = v5->_actionOutput;
    v5->_actionOutput = (LNActionOutput *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSiriLinkResponse)initWithOutput:(id)a3 andError:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSiriLinkResponse;
  v8 = [(WFSiriActionResponse *)&v12 initWithError:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_actionOutput, a3);
    objc_super v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end