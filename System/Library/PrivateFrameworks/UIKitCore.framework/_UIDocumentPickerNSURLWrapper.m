@interface _UIDocumentPickerNSURLWrapper
+ (BOOL)supportsSecureCoding;
+ (id)wrapperForExportWithURL:(id)a3 error:(id *)a4;
+ (id)wrapperWithURL:(id)a3;
+ (id)wrapperWithURL:(id)a3 readonly:(BOOL)a4;
+ (void)assembleURL:(id)a3 sandbox:(id)a4 physicalURL:(id)a5 physicalSandbox:(id)a6;
- (NSData)promiseScope;
- (NSData)scope;
- (NSURL)promiseURL;
- (NSURL)url;
- (_UIDocumentPickerNSURLWrapper)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPromiseScope:(id)a3;
- (void)setPromiseURL:(id)a3;
- (void)setScope:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation _UIDocumentPickerNSURLWrapper

+ (id)wrapperWithURL:(id)a3
{
  return (id)[a1 wrapperWithURL:a3 readonly:0];
}

+ (id)wrapperWithURL:(id)a3 readonly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:a1 file:@"NSURL+UIDocumentPicker.m" lineNumber:324 description:@"tried to create wrapper with nil url"];
  }
  v7 = objc_alloc_init(_UIDocumentPickerNSURLWrapper);
  [(_UIDocumentPickerNSURLWrapper *)v7 setUrl:v6];
  v8 = (void *)_CFURLPromiseCopyPhysicalURL();
  if (([v6 isEqual:v8] & 1) == 0) {
    [(_UIDocumentPickerNSURLWrapper *)v7 setPromiseURL:v8];
  }
  int v9 = [v6 startAccessingSecurityScopedResource];
  int v10 = [v8 startAccessingSecurityScopedResource];
  v11 = (uint64_t *)MEMORY[0x1E4F14000];
  if (!v4) {
    v11 = (uint64_t *)MEMORY[0x1E4F14008];
  }
  uint64_t v12 = *v11;
  v13 = @"read-write";
  if (v4) {
    v13 = @"read-only";
  }
  v14 = v13;
  id v27 = 0;
  v15 = objc_msgSend(v6, "ui_issueSandboxExtensionOfClass:error:", v12, &v27);
  id v16 = v27;
  [(_UIDocumentPickerNSURLWrapper *)v7 setScope:v15];

  v17 = [(_UIDocumentPickerNSURLWrapper *)v7 scope];

  if (v17)
  {
    if (v8) {
      goto LABEL_11;
    }
LABEL_19:
    id v19 = v16;
    if (v9) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"NSURL+UIDocumentPicker.m", 339, @"Could not issue %@ sandbox extension (%@).", v14, v16 object file lineNumber description];

  if (!v8) {
    goto LABEL_19;
  }
LABEL_11:
  id v26 = v16;
  v18 = objc_msgSend(v8, "ui_issueSandboxExtensionOfClass:error:", v12, &v26);
  id v19 = v26;

  [(_UIDocumentPickerNSURLWrapper *)v7 setPromiseScope:v18];
  v20 = [(_UIDocumentPickerNSURLWrapper *)v7 scope];

  if (!v20)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"NSURL+UIDocumentPicker.m", 342, @"Could not issue %@ sandbox extension (%@).", v14, v19 object file lineNumber description];

    if (v9) {
      goto LABEL_20;
    }
LABEL_13:
    if (!v10) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!v9) {
    goto LABEL_13;
  }
LABEL_20:
  [v6 stopAccessingSecurityScopedResource];
  if (v10) {
LABEL_14:
  }
    [v8 stopAccessingSecurityScopedResource];
LABEL_15:

  return v7;
}

+ (id)wrapperForExportWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(_UIDocumentPickerNSURLWrapper);
  [(_UIDocumentPickerNSURLWrapper *)v6 setUrl:v5];
  v7 = [(_UIDocumentPickerNSURLWrapper *)v6 url];
  v8 = objc_msgSend(v7, "ui_issueReadSandboxExtensionWithError:", a4);
  [(_UIDocumentPickerNSURLWrapper *)v6 setScope:v8];

  int v9 = [(_UIDocumentPickerNSURLWrapper *)v6 scope];

  if (v9)
  {
    int v10 = (void *)_CFURLPromiseCopyPhysicalURL();
    if (!v10) {
      goto LABEL_5;
    }
    if ([v5 isEqual:v10]) {
      goto LABEL_5;
    }
    [(_UIDocumentPickerNSURLWrapper *)v6 setPromiseURL:v10];
    v11 = objc_msgSend(v10, "ui_issueReadSandboxExtensionWithError:", a4);
    [(_UIDocumentPickerNSURLWrapper *)v6 setPromiseScope:v11];

    uint64_t v12 = [(_UIDocumentPickerNSURLWrapper *)v6 promiseScope];

    if (v12) {
LABEL_5:
    }
      uint64_t v12 = v6;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(_UIDocumentPickerNSURLWrapper *)self url];
  [v9 encodeObject:v4 forKey:@"NSURL"];

  id v5 = [(_UIDocumentPickerNSURLWrapper *)self scope];
  [v9 encodeObject:v5 forKey:@"NSURLScope"];

  id v6 = [(_UIDocumentPickerNSURLWrapper *)self promiseURL];

  if (v6)
  {
    v7 = [(_UIDocumentPickerNSURLWrapper *)self promiseURL];
    [v9 encodeObject:v7 forKey:@"NSPromise"];

    v8 = [(_UIDocumentPickerNSURLWrapper *)self promiseScope];
    [v9 encodeObject:v8 forKey:@"NSPromiseScope"];
  }
}

+ (void)assembleURL:(id)a3 sandbox:(id)a4 physicalURL:(id)a5 physicalSandbox:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v12)
  {
    if (v9) {
      MEMORY[0x18C107170](v12, v9);
    }
    if (v10 && v11) {
      MEMORY[0x18C107170](v10, v11);
    }
    _CFURLPromiseSetPhysicalURL();
  }
}

- (_UIDocumentPickerNSURLWrapper)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSURL"];
  v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSPromise"];
  v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSURLScope"];
  id v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSPromiseScope"];

  [(id)objc_opt_class() assembleURL:v6 sandbox:v8 physicalURL:v7 physicalSandbox:v9];
  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NSURL+UIDocumentPicker.m" lineNumber:420 description:@"tried to unarchive a wrapper with nil url"];
  }
  [(_UIDocumentPickerNSURLWrapper *)self setUrl:v6];

  return self;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)promiseURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPromiseURL:(id)a3
{
}

- (NSData)scope
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScope:(id)a3
{
}

- (NSData)promiseScope
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPromiseScope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_promiseURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end