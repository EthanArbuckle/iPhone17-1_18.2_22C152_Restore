@interface WFSiriDialogRequest
+ (BOOL)supportsSecureCoding;
- (WFDialogRequest)dialogRequest;
- (WFSiriDialogRequest)initWithCoder:(id)a3;
- (WFSiriDialogRequest)initWithDialogRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriDialogRequest

- (void).cxx_destruct
{
}

- (WFDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriDialogRequest;
  id v4 = a3;
  [(WFSiriActionRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFSiriDialogRequest *)self dialogRequest];
  [v4 encodeObject:v5 forKey:@"dialogRequest"];
}

- (WFSiriDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogRequest;
  v5 = [(WFSiriActionRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialogRequest"];
    dialogRequest = v5->_dialogRequest;
    v5->_dialogRequest = (WFDialogRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSiriDialogRequest)initWithDialogRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogRequest;
  uint64_t v6 = [(WFSiriActionRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogRequest, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end