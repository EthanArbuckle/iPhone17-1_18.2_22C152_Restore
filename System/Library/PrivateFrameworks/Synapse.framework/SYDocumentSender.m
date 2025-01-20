@interface SYDocumentSender
+ (BOOL)supportsSecureCoding;
- (NSString)handle;
- (NSString)name;
- (NSString)preferredFormattedName;
- (SYDocumentSender)initWithCoder:(id)a3;
- (SYDocumentSender)initWithName:(id)a3 handle:(id)a4;
- (id)description;
- (id)formattedNameWithStyle:(int64_t)a3;
- (id)personNameComponentsFormattedWithStyle:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SYDocumentSender

- (SYDocumentSender)initWithName:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SYDocumentSender;
  v8 = [(SYDocumentSender *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    handle = v8->_handle;
    v8->_handle = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(SYDocumentSender *)self name];
  id v7 = [(SYDocumentSender *)self handle];
  v8 = [v3 stringWithFormat:@"<%@: %p> {name = %@, handle = %@}", v5, self, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SYDocumentSender *)self name];
  [v4 encodeObject:v5 forKey:@"SYDocumentSenderNameKey"];

  id v6 = [(SYDocumentSender *)self handle];
  [v4 encodeObject:v6 forKey:@"SYDocumentSenderHandleKey"];
}

- (SYDocumentSender)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentSenderNameKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentSenderHandleKey"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(SYDocumentSender *)self initWithName:v5 handle:v6];
    v8 = self;
  }

  return v8;
}

- (NSString)preferredFormattedName
{
  return (NSString *)[(SYDocumentSender *)self formattedNameWithStyle:1];
}

- (id)formattedNameWithStyle:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  [v5 setStyle:a3];
  id v6 = [(SYDocumentSender *)self name];
  BOOL v7 = [v5 personNameComponentsFromString:v6];

  if (v7)
  {
    uint64_t v8 = [v5 stringFromPersonNameComponents:v7];
    goto LABEL_12;
  }
  uint64_t v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SYDocumentSender formattedNameWithStyle:](self);
  }

  v10 = [(SYDocumentSender *)self name];
  if ([v10 length])
  {
    uint64_t v11 = [(SYDocumentSender *)self name];
    v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v13 = [v11 stringByTrimmingCharactersInSet:v12];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      uint64_t v8 = [(SYDocumentSender *)self name];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SYDocumentSender formattedNameWithStyle:](self);
  }

  uint64_t v8 = [(SYDocumentSender *)self handle];
LABEL_12:
  v16 = (void *)v8;

  return v16;
}

- (id)personNameComponentsFormattedWithStyle:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  [v5 setStyle:a3];
  id v6 = [(SYDocumentSender *)self name];
  BOOL v7 = [v5 personNameComponentsFromString:v6];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)formattedNameWithStyle:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Have to fallback to handle. Name was empty or nil: %{private}@, style: %ld", v4, v5, v6, v7, v8);
}

- (void)formattedNameWithStyle:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v2, v3, "Unable to get person name components from string: %{private}@, style: %ld", v4, v5, v6, v7, v8);
}

@end