@interface WFPerformQueryDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSArray)queryResults;
- (NSString)description;
- (WFPerformQueryDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFPerformQueryDialogResponse)initWithCoder:(id)a3;
- (WFPerformQueryDialogResponse)initWithQueryResults:(id)a3 cancelled:(BOOL)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFPerformQueryDialogResponse

- (void).cxx_destruct
{
}

- (NSArray)queryResults
{
  return self->_queryResults;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFPerformQueryDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFPerformQueryDialogResponse *)self queryResults];
  [v4 encodeCollection:v5 forKey:@"queryResults"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogResponse isCancelled](self, "isCancelled"), @"cancelled");
}

- (WFPerformQueryDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFPerformQueryDialogResponse;
  v5 = [(WFDialogResponse *)&v11 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"queryResults"];
    queryResults = v5->_queryResults;
    v5->_queryResults = (NSArray *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFPerformQueryDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFPerformQueryDialogResponse *)self queryResults];
  [v4 encodeObject:v5 forKey:@"queryResults"];
}

- (WFPerformQueryDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFPerformQueryDialogResponse;
  v5 = [(WFDialogResponse *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"queryResults"];
    queryResults = v5->_queryResults;
    v5->_queryResults = (NSArray *)v9;

    objc_super v11 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(WFPerformQueryDialogResponse *)self queryResults];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v8 = [v3 stringWithFormat:@"<%@: %p, queryResults: %@, cancelled: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (WFPerformQueryDialogResponse)initWithQueryResults:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFPerformQueryDialogResponse;
  v8 = [(WFDialogResponse *)&v12 initWithCancelled:v4];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queryResults, a3);
    v10 = v9;
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