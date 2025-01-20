@interface WFStepwiseExecutionResultMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)didRunOpensIntent;
- (LNAttribution)attribution;
- (LNUndoContext)undoContext;
- (WFStepwiseExecutionResultMetadata)initWithCoder:(id)a3;
- (WFStepwiseExecutionResultMetadata)initWithUndoContext:(id)a3 didRunOpensIntent:(BOOL)a4 attribution:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setUndoContext:(id)a3;
@end

@implementation WFStepwiseExecutionResultMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_undoContext, 0);
}

- (void)setAttribution:(id)a3
{
}

- (LNAttribution)attribution
{
  return self->_attribution;
}

- (BOOL)didRunOpensIntent
{
  return self->_didRunOpensIntent;
}

- (void)setUndoContext:(id)a3
{
}

- (LNUndoContext)undoContext
{
  return self->_undoContext;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFStepwiseExecutionResultMetadata *)self undoContext];
  [v4 encodeObject:v5 forKey:@"undoContext"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFStepwiseExecutionResultMetadata didRunOpensIntent](self, "didRunOpensIntent"), @"didRunOpensIntent");
  id v6 = [(WFStepwiseExecutionResultMetadata *)self attribution];
  [v4 encodeObject:v6 forKey:@"attribution"];
}

- (WFStepwiseExecutionResultMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"undoContext"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"didRunOpensIntent"];
  uint64_t v7 = [v6 BOOLValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attribution"];

  v9 = [(WFStepwiseExecutionResultMetadata *)self initWithUndoContext:v5 didRunOpensIntent:v7 attribution:v8];
  return v9;
}

- (WFStepwiseExecutionResultMetadata)initWithUndoContext:(id)a3 didRunOpensIntent:(BOOL)a4 attribution:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFStepwiseExecutionResultMetadata;
  v11 = [(WFStepwiseExecutionResultMetadata *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_didRunOpensIntent = a4;
    objc_storeStrong((id *)&v11->_undoContext, a3);
    objc_storeStrong((id *)&v12->_attribution, a5);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end