@interface SYDocument
+ (BOOL)supportsSecureCoding;
+ (id)documentFromData:(id)a3;
- (BOOL)setDocumentAttributes:(id)a3 withError:(id *)a4;
- (NSURL)fileURL;
- (SYDocument)initWithCoder:(id)a3;
- (SYDocument)initWithFileURL:(id)a3;
- (SYDocument)initWithFileURL:(id)a3 error:(id *)a4;
- (SYDocument)initWithURLWrapper:(id)a3;
- (id)dataRepresentationWithError:(id *)a3;
- (id)documentAttributesWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SYDocument

- (SYDocument)initWithFileURL:(id)a3
{
  return [(SYDocument *)self initWithFileURL:a3 error:0];
}

- (SYDocument)initWithFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  v7 = [MEMORY[0x1E4F25D78] wrapperWithURL:v6 readonly:1 error:&v12];
  id v8 = v12;
  if (v7)
  {
    self = [(SYDocument *)self initWithURLWrapper:v7];
    v9 = self;
  }
  else
  {
    v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SYDocument initWithFileURL:error:]((uint64_t)v6, (uint64_t)v8, v10);
    }

    v9 = 0;
    if (a4 && v8)
    {
      v9 = 0;
      *a4 = v8;
    }
  }

  return v9;
}

- (SYDocument)initWithURLWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYDocument;
  id v6 = [(SYDocument *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_urlWrapper, a3);
  }

  return v7;
}

- (NSURL)fileURL
{
  return (NSURL *)[(FPSandboxingURLWrapper *)self->_urlWrapper url];
}

- (id)documentAttributesWithError:(id *)a3
{
  v4 = [(SYDocument *)self fileURL];
  id v5 = +[SYDocumentAttributes documentAttributesForFileAtURL:v4 error:a3];

  return v5;
}

- (BOOL)setDocumentAttributes:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(SYDocument *)self fileURL];
  if (v6) {
    char v8 = [v6 saveToFileURL:v7 error:a4];
  }
  else {
    char v8 = +[SYDocumentAttributes removeDocumentAttributesForFileAtURL:v7 error:a4];
  }
  BOOL v9 = v8;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SYDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDocumentFileURLWrapperKey"];

  if (v5)
  {
    self = [(SYDocument *)self initWithURLWrapper:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)documentFromData:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    id v4 = a3;
    id v9 = 0;
    id v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];

    id v6 = v9;
    if (!v5)
    {
      v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[SYDocument documentFromData:]((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)initWithFileURL:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Unable to create a sandbox file wrapper for fileURL: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)documentFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Error while trying to init from data, error: %@", (uint8_t *)&v2, 0xCu);
}

@end