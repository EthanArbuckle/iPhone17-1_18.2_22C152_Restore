@interface WFPausedShortcutData
+ (BOOL)supportsSecureCoding;
- (NSData)contextData;
- (NSData)descriptorData;
- (WFPausedShortcutData)initWithCoder:(id)a3;
- (WFPausedShortcutData)initWithContext:(id)a3 descriptor:(id)a4;
- (WFWorkflowRunDescriptor)descriptor;
- (WFWorkflowRunningContext)context;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextData:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDescriptorData:(id)a3;
@end

@implementation WFPausedShortcutData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_descriptorData, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
}

- (void)setDescriptor:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (void)setDescriptorData:(id)a3
{
}

- (NSData)descriptorData
{
  return self->_descriptorData;
}

- (void)setContextData:(id)a3
{
}

- (NSData)contextData
{
  return self->_contextData;
}

- (WFWorkflowRunDescriptor)descriptor
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  descriptor = self->_descriptor;
  if (!descriptor)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    descriptorData = self->_descriptorData;
    id v13 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:descriptorData error:&v13];
    id v8 = v13;
    v9 = self->_descriptor;
    self->_descriptor = v7;

    if (v8)
    {
      v10 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v15 = "-[WFPausedShortcutData descriptor]";
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_ERROR, "%s Unable to decode run descriptor: %@", buf, 0x16u);
      }
    }

    descriptor = self->_descriptor;
  }
  return descriptor;
}

- (WFWorkflowRunningContext)context
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  if (!context)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    contextData = self->_contextData;
    id v13 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:contextData error:&v13];
    id v8 = v13;
    v9 = self->_context;
    self->_context = v7;

    if (v8)
    {
      v10 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v15 = "-[WFPausedShortcutData context]";
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_ERROR, "%s Unable to decode running context: %@", buf, 0x16u);
      }
    }

    context = self->_context;
  }
  return context;
}

- (WFPausedShortcutData)initWithContext:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPausedShortcutData;
  id v8 = [(WFPausedShortcutData *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    contextData = v8->_contextData;
    v8->_contextData = (NSData *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    descriptorData = v8->_descriptorData;
    v8->_descriptorData = (NSData *)v11;

    id v13 = v8;
  }

  return v8;
}

- (WFPausedShortcutData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFPausedShortcutData;
  uint64_t v5 = [(WFPausedShortcutData *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"contextData"];
    contextData = v5->_contextData;
    v5->_contextData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"descriptorData"];
    descriptorData = v5->_descriptorData;
    v5->_descriptorData = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFPausedShortcutData *)self contextData];
  [v4 encodeObject:v5 forKey:@"contextData"];

  id v6 = [(WFPausedShortcutData *)self descriptorData];
  [v4 encodeObject:v6 forKey:@"descriptorData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end