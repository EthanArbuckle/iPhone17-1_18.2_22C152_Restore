@interface WFShowActionInterfaceDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnsupported;
- (BOOL)shouldDismissDialogInTransientMode;
- (NSString)description;
- (NSString)userInterfaceType;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (WFShowActionInterfaceDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFShowActionInterfaceDialogResponse)initWithCancelled:(BOOL)a3;
- (WFShowActionInterfaceDialogResponse)initWithCoder:(id)a3;
- (WFShowActionInterfaceDialogResponse)initWithListenerEndpoint:(id)a3 userInterfaceType:(id)a4;
- (WFShowActionInterfaceDialogResponse)initWithUnsupported:(BOOL)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFShowActionInterfaceDialogResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceType, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
}

- (BOOL)isUnsupported
{
  return self->_unsupported;
}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (WFShowActionInterfaceDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v5 = [(WFDialogResponse *)&v14 initWithBSXPCCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"listenerEndpoint"];
    v7 = (NSXPCListenerEndpoint *)objc_alloc_init(MEMORY[0x1E4F292A0]);
    [(NSXPCListenerEndpoint *)v7 _setEndpoint:v6];
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = v7;
    v9 = v7;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInterfaceType"];
    userInterfaceType = v5->_userInterfaceType;
    v5->_userInterfaceType = (NSString *)v10;

    v5->_unsupported = [v4 decodeBoolForKey:@"unsupported"];
    v12 = v5;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFShowActionInterfaceDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v8 encodeWithBSXPCCoder:v4];
  v5 = [(WFShowActionInterfaceDialogResponse *)self listenerEndpoint];
  v6 = [v5 _endpoint];
  [v4 encodeXPCObject:v6 forKey:@"listenerEndpoint"];

  v7 = [(WFShowActionInterfaceDialogResponse *)self userInterfaceType];
  [v4 encodeObject:v7 forKey:@"userInterfaceType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFShowActionInterfaceDialogResponse isUnsupported](self, "isUnsupported"), @"unsupported");
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFShowActionInterfaceDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v7 encodeWithCoder:v4];
  v5 = [(WFShowActionInterfaceDialogResponse *)self listenerEndpoint];
  [v4 encodeObject:v5 forKey:@"listenerEndpoint"];

  v6 = [(WFShowActionInterfaceDialogResponse *)self userInterfaceType];
  [v4 encodeObject:v6 forKey:@"userInterfaceType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFShowActionInterfaceDialogResponse isUnsupported](self, "isUnsupported"), @"unsupported");
}

- (NSString)description
{
  BOOL v3 = [(WFShowActionInterfaceDialogResponse *)self isUnsupported];
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  objc_super v7 = (void *)v6;
  if (v3)
  {
    objc_super v8 = [v4 stringWithFormat:@"<%@: %p, unsupported: YES>", v6, self];
  }
  else
  {
    v9 = [(WFShowActionInterfaceDialogResponse *)self listenerEndpoint];
    uint64_t v10 = [(WFShowActionInterfaceDialogResponse *)self userInterfaceType];
    objc_super v8 = [v4 stringWithFormat:@"<%@: %p, listenerEndpoint: %@, userInterfaceType: %@>", v7, self, v9, v10];
  }
  return (NSString *)v8;
}

- (BOOL)shouldDismissDialogInTransientMode
{
  return 0;
}

- (WFShowActionInterfaceDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v5 = [(WFDialogResponse *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listenerEndpoint"];
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInterfaceType"];
    userInterfaceType = v5->_userInterfaceType;
    v5->_userInterfaceType = (NSString *)v8;

    v5->_unsupported = [v4 decodeBoolForKey:@"unsupported"];
    uint64_t v10 = v5;
  }

  return v5;
}

- (WFShowActionInterfaceDialogResponse)initWithListenerEndpoint:(id)a3 userInterfaceType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFShowActionInterfaceDialogResponse;
  v9 = [(WFDialogResponse *)&v15 initWithCancelled:0];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listenerEndpoint, a3);
    uint64_t v11 = [v8 copy];
    userInterfaceType = v10->_userInterfaceType;
    v10->_userInterfaceType = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (WFShowActionInterfaceDialogResponse)initWithUnsupported:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFShowActionInterfaceDialogResponse;
  id v4 = [(WFDialogResponse *)&v8 initWithCancelled:0];
  v5 = v4;
  if (v4)
  {
    v4->_unsupported = a3;
    uint64_t v6 = v4;
  }

  return v5;
}

- (WFShowActionInterfaceDialogResponse)initWithCancelled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFShowActionInterfaceDialogResponse;
  return [(WFDialogResponse *)&v4 initWithCancelled:a3];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end