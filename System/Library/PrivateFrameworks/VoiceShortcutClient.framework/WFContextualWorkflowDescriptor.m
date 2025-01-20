@interface WFContextualWorkflowDescriptor
+ (BOOL)supportsSecureCoding;
- (WFContextualWorkflowDescriptor)initWithCoder:(id)a3;
- (WFContextualWorkflowDescriptor)initWithDescriptor:(id)a3 serializedRepresentation:(id)a4;
- (WFPropertyListObject)serializedRepresentation;
- (WFWorkflowDescriptor)descriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualWorkflowDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedRepresentation, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (WFPropertyListObject)serializedRepresentation
{
  return self->_serializedRepresentation;
}

- (WFWorkflowDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFContextualWorkflowDescriptor *)self descriptor];
  [v4 encodeObject:v5 forKey:@"descriptor"];

  id v6 = [(WFContextualWorkflowDescriptor *)self serializedRepresentation];
  [v4 encodeObject:v6 forKey:@"serializedRepresentation"];
}

- (WFContextualWorkflowDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFContextualWorkflowDescriptor;
  v5 = [(WFContextualWorkflowDescriptor *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (WFWorkflowDescriptor *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"serializedRepresentation"];
    serializedRepresentation = v5->_serializedRepresentation;
    v5->_serializedRepresentation = (WFPropertyListObject *)v15;

    v17 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WFContextualWorkflowDescriptor alloc];
  v5 = [(WFContextualWorkflowDescriptor *)self descriptor];
  uint64_t v6 = [(WFContextualWorkflowDescriptor *)self serializedRepresentation];
  v7 = [(WFContextualWorkflowDescriptor *)v4 initWithDescriptor:v5 serializedRepresentation:v6];

  return v7;
}

- (WFContextualWorkflowDescriptor)initWithDescriptor:(id)a3 serializedRepresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContextualWorkflowDescriptor;
  uint64_t v9 = [(WFContextualWorkflowDescriptor *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_serializedRepresentation, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end