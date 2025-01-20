@interface WFWorkflowDatabaseRunDescriptor
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (NSString)name;
- (WFWorkflowDatabaseRunDescriptor)initWithCoder:(id)a3;
- (WFWorkflowDatabaseRunDescriptor)initWithIdentifier:(id)a3;
- (WFWorkflowDatabaseRunDescriptor)initWithIdentifier:(id)a3 name:(id)a4;
- (WFWorkflowDatabaseRunDescriptor)initWithName:(id)a3;
- (id)description;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowDatabaseRunDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)kind
{
  return @"WorkflowInDatabase";
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowDatabaseRunDescriptor *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(WFWorkflowDatabaseRunDescriptor *)self name];
  [v4 encodeObject:v6 forKey:@"name"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(WFWorkflowDatabaseRunDescriptor *)self identifier];
  v7 = [(WFWorkflowDatabaseRunDescriptor *)self name];
  v8 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, name: %@>", v5, self, v6, v7];

  return v8;
}

- (WFWorkflowDatabaseRunDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];

  v7 = [(WFWorkflowDatabaseRunDescriptor *)self initWithIdentifier:v5 name:v6];
  return v7;
}

- (WFWorkflowDatabaseRunDescriptor)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowDatabaseRunDescriptor;
  v8 = [(WFWorkflowDatabaseRunDescriptor *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFWorkflowDatabaseRunDescriptor)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 59, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v6 = [(WFWorkflowDatabaseRunDescriptor *)self initWithIdentifier:v5 name:0];

  return v6;
}

- (WFWorkflowDatabaseRunDescriptor)initWithName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 54, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v6 = [(WFWorkflowDatabaseRunDescriptor *)self initWithIdentifier:0 name:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end