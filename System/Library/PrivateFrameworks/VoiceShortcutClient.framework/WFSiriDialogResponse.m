@interface WFSiriDialogResponse
+ (BOOL)supportsSecureCoding;
- (WFDialogResponse)dialogResponse;
- (WFSiriDialogResponse)initWithCoder:(id)a3;
- (WFSiriDialogResponse)initWithDialogResponse:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriDialogResponse

- (void).cxx_destruct
{
}

- (WFDialogResponse)dialogResponse
{
  return self->_dialogResponse;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriDialogResponse;
  id v4 = a3;
  [(WFSiriActionResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFSiriDialogResponse *)self dialogResponse];
  [v4 encodeObject:v5 forKey:@"dialogResponse"];
}

- (WFSiriDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogResponse;
  v5 = [(WFSiriActionResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialogResponse"];
    dialogResponse = v5->_dialogResponse;
    v5->_dialogResponse = (WFDialogResponse *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSiriDialogResponse)initWithDialogResponse:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogResponse;
  uint64_t v6 = [(WFSiriActionResponse *)&v10 initWithError:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogResponse, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end