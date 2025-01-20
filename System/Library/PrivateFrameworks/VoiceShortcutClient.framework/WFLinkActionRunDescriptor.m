@interface WFLinkActionRunDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutoShortcut;
- (LNAction)action;
- (LNActionMetadata)metadata;
- (LNFullyQualifiedActionIdentifier)identifier;
- (NSString)name;
- (WFLinkActionRunDescriptor)initWithCoder:(id)a3;
- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 action:(id)a4 metadata:(id)a5;
- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 action:(id)a4 metadata:(id)a5 isAutoShortcut:(BOOL)a6;
- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 name:(id)a4 action:(id)a5 metadata:(id)a6 isAutoShortcut:(BOOL)a7;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFLinkActionRunDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isAutoShortcut
{
  return self->_isAutoShortcut;
}

- (NSString)name
{
  return self->_name;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (LNAction)action
{
  return self->_action;
}

- (LNFullyQualifiedActionIdentifier)identifier
{
  return self->_identifier;
}

- (id)kind
{
  if ([(WFLinkActionRunDescriptor *)self isAutoShortcut]) {
    v2 = @"AppShortcut";
  }
  else {
    v2 = @"AppIntent";
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(WFLinkActionRunDescriptor *)self identifier];
  [v8 encodeObject:v4 forKey:@"identifier"];

  v5 = [(WFLinkActionRunDescriptor *)self action];
  [v8 encodeObject:v5 forKey:@"action"];

  v6 = [(WFLinkActionRunDescriptor *)self metadata];
  [v8 encodeObject:v6 forKey:@"metadata"];

  v7 = [(WFLinkActionRunDescriptor *)self name];
  [v8 encodeObject:v7 forKey:@"name"];

  objc_msgSend(v8, "encodeBool:forKey:", -[WFLinkActionRunDescriptor isAutoShortcut](self, "isAutoShortcut"), @"isAutoShortcut");
}

- (WFLinkActionRunDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v5 = (void *)getLNFullyQualifiedActionIdentifierClass_softClass;
  uint64_t v26 = getLNFullyQualifiedActionIdentifierClass_softClass;
  if (!getLNFullyQualifiedActionIdentifierClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getLNFullyQualifiedActionIdentifierClass_block_invoke;
    v21 = &unk_1E6079C28;
    v22 = &v23;
    __getLNFullyQualifiedActionIdentifierClass_block_invoke((uint64_t)&v18);
    v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"identifier"];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v8 = (void *)getLNActionClass_softClass;
  uint64_t v26 = getLNActionClass_softClass;
  if (!getLNActionClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getLNActionClass_block_invoke;
    v21 = &unk_1E6079C28;
    v22 = &v23;
    __getLNActionClass_block_invoke((uint64_t)&v18);
    id v8 = (void *)v24[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v23, 8);
  v10 = [v4 decodeObjectOfClass:v9 forKey:@"action"];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v11 = (void *)getLNActionMetadataClass_softClass;
  uint64_t v26 = getLNActionMetadataClass_softClass;
  if (!getLNActionMetadataClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getLNActionMetadataClass_block_invoke;
    v21 = &unk_1E6079C28;
    v22 = &v23;
    __getLNActionMetadataClass_block_invoke((uint64_t)&v18);
    v11 = (void *)v24[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v23, 8);
  uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"metadata"];
  v14 = (void *)v13;
  v15 = 0;
  if (v10 && v13)
  {
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    self = -[WFLinkActionRunDescriptor initWithIdentifier:name:action:metadata:isAutoShortcut:](self, "initWithIdentifier:name:action:metadata:isAutoShortcut:", v7, v16, v10, v14, [v4 decodeBoolForKey:@"isAutoShortcut"]);

    v15 = self;
  }

  return v15;
}

- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 action:(id)a4 metadata:(id)a5
{
  return [(WFLinkActionRunDescriptor *)self initWithIdentifier:a3 action:a4 metadata:a5 isAutoShortcut:0];
}

- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 action:(id)a4 metadata:(id)a5 isAutoShortcut:(BOOL)a6
{
  return [(WFLinkActionRunDescriptor *)self initWithIdentifier:a3 name:0 action:a4 metadata:a5 isAutoShortcut:a6];
}

- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 name:(id)a4 action:(id)a5 metadata:(id)a6 isAutoShortcut:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 216, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 215, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 217, @"Invalid parameter not satisfying: %@", @"metadata" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)WFLinkActionRunDescriptor;
  v17 = [(WFLinkActionRunDescriptor *)&v25 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_action, a5);
    objc_storeStrong((id *)&v18->_metadata, a6);
    objc_storeStrong((id *)&v18->_name, a4);
    v18->_isAutoShortcut = a7;
    uint64_t v19 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end