@interface WFAskParameterDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (WFAskParameterDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFAskParameterDialogResponse)initWithCoder:(id)a3;
- (WFAskParameterDialogResponse)initWithSerializedParameterState:(id)a3 cancelled:(BOOL)a4;
- (WFPropertyListObject)serializedParameterState;
- (id)description;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAskParameterDialogResponse

- (void).cxx_destruct
{
}

- (WFPropertyListObject)serializedParameterState
{
  return self->_serializedParameterState;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFAskParameterDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v8 encodeWithBSXPCCoder:v4];
  v5 = (void *)MEMORY[0x1E4F28DB0];
  v6 = [(WFAskParameterDialogResponse *)self serializedParameterState];
  v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

  [v4 encodeObject:v7 forKey:@"serializedParameterState"];
}

- (WFAskParameterDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFAskParameterDialogResponse;
  v5 = [(WFDialogResponse *)&v19 initWithBSXPCCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedParameterState"];
    v7 = (void *)MEMORY[0x1E4F28DC0];
    objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v7 unarchivedObjectOfClasses:v14 fromData:v6 error:0];
    serializedParameterState = v5->_serializedParameterState;
    v5->_serializedParameterState = (WFPropertyListObject *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAskParameterDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFAskParameterDialogResponse *)self serializedParameterState];
  [v4 encodeObject:v5 forKey:@"serializedParameterState"];
}

- (WFAskParameterDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFAskParameterDialogResponse;
  v5 = [(WFDialogResponse *)&v17 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"serializedParameterState"];
    serializedParameterState = v5->_serializedParameterState;
    v5->_serializedParameterState = (WFPropertyListObject *)v13;

    uint64_t v15 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(WFAskParameterDialogResponse *)self serializedParameterState];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, serializedParameterState: %@, cancelled: %@>", v5, self, v6, v7];

  return v8;
}

- (WFAskParameterDialogResponse)initWithSerializedParameterState:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFAskParameterDialogResponse;
  uint64_t v8 = [(WFDialogResponse *)&v12 initWithCancelled:v4];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serializedParameterState, a3);
    uint64_t v10 = v9;
  }

  return v9;
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