@interface WFWorkflowFileDescriptor
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (NSString)sourceAppIdentifier;
- (WFFileRepresentation)file;
- (WFWorkflowFileDescriptor)initWithCoder:(id)a3;
- (WFWorkflowFileDescriptor)initWithFile:(id)a3 name:(id)a4;
- (WFWorkflowFileDescriptor)initWithFile:(id)a3 name:(id)a4 sourceAppIdentifier:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowFileDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (WFFileRepresentation)file
{
  return self->_file;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowFileDescriptor *)self file];
  [v4 encodeObject:v5 forKey:@"file"];

  v6 = [(WFWorkflowFileDescriptor *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  id v7 = [(WFWorkflowFileDescriptor *)self sourceAppIdentifier];
  [v4 encodeObject:v7 forKey:@"sourceAppIdentifier"];
}

- (WFWorkflowFileDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowFileDescriptor;
  v5 = [(WFWorkflowFileDescriptor *)&v14 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
  file = v5->_file;
  v5->_file = (WFFileRepresentation *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = v5->_name;
  v5->_name = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppIdentifier"];
  sourceAppIdentifier = v5->_sourceAppIdentifier;
  v5->_sourceAppIdentifier = (NSString *)v10;

  if (!v5->_file) {
    goto LABEL_5;
  }
  if (v5->_name) {
    v12 = v5;
  }
  else {
LABEL_5:
  }
    v12 = 0;

  return v12;
}

- (WFWorkflowFileDescriptor)initWithFile:(id)a3 name:(id)a4 sourceAppIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFWorkflowFile.m", 50, @"Invalid parameter not satisfying: %@", @"file" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFWorkflowFile.m", 51, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFWorkflowFileDescriptor;
  v13 = [(WFWorkflowFileDescriptor *)&v23 init];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_file, a3);
    uint64_t v15 = [v11 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    uint64_t v17 = [v12 copy];
    sourceAppIdentifier = v14->_sourceAppIdentifier;
    v14->_sourceAppIdentifier = (NSString *)v17;

    v19 = v14;
  }

  return v14;
}

- (WFWorkflowFileDescriptor)initWithFile:(id)a3 name:(id)a4
{
  return [(WFWorkflowFileDescriptor *)self initWithFile:a3 name:a4 sourceAppIdentifier:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end