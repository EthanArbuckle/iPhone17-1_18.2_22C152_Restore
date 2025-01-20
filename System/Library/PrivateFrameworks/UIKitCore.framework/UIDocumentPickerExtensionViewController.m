@interface UIDocumentPickerExtensionViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (NSArray)validTypes;
- (NSString)providerIdentifier;
- (NSURL)documentStorageURL;
- (NSURL)originalURL;
- (UIDocumentPickerMode)documentPickerMode;
- (void)_prepareWithExtensionInfo:(id)a3 completionHandler:(id)a4;
- (void)_setDocumentStorageURL:(id)a3;
- (void)_setPickableTypes:(id)a3;
- (void)_setPickerMode:(unint64_t)a3;
- (void)_setProviderIdentifier:(id)a3;
- (void)_setTintColor:(id)a3;
- (void)_setUploadURL:(id)a3;
- (void)_setUploadURLWrapper:(id)a3;
- (void)dismissGrantingAccessToURL:(NSURL *)url;
@end

@implementation UIDocumentPickerExtensionViewController

- (void)dismissGrantingAccessToURL:(NSURL *)url
{
  v5 = url;
  v22 = v5;
  if (v5)
  {
    if (![(NSURL *)v5 isFileURL])
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"UIDocumentPickerExtensionViewController.m" lineNumber:44 description:@"Can only grant access to file URLs"];
    }
    v6 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];

    if (v6)
    {
      v7 = [(NSURL *)v22 absoluteString];
      v8 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];
      v9 = [v8 absoluteString];
      char v10 = [v7 hasPrefix:v9];

      if ((v10 & 1) == 0)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        v21 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];
        [v20 handleFailureInMethod:a2, self, @"UIDocumentPickerExtensionViewController.m", 47, @"%@ dismissed with a URL (%@) not contained in its documentStorageURL (%@)", self, v22, v21 object file lineNumber description];
      }
    }
    if ([(UIDocumentPickerExtensionViewController *)self documentPickerMode] == UIDocumentPickerModeMoveToService
      || [(UIDocumentPickerExtensionViewController *)self documentPickerMode] == UIDocumentPickerModeExportToService)
    {
      v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      v12 = [(NSURL *)v22 path];
      char v13 = [v11 fileExistsAtPath:v12 isDirectory:0];

      if ((v13 & 1) == 0)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"UIDocumentPickerExtensionViewController.m", 52, @"%@ was dismissed with a nonexistent URL (%@) in Move or Export mode", self, v22 object file lineNumber description];
      }
    }
    BOOL v15 = (self->_documentPickerMode & 0xFFFFFFFFFFFFFFFDLL) != 1;
    v16 = [(UIViewController *)self navigationController];
    v17 = [v16 _remoteViewControllerProxy];
    v18 = +[_UIDocumentPickerNSURLWrapper wrapperWithURL:v22 createSandboxIfNoneAttached:v15];
    [v17 _didSelectURLWrapper:v18];
  }
  else
  {
    v16 = [(UIViewController *)self navigationController];
    v17 = [v16 _remoteViewControllerProxy];
    [v17 _dismissViewController];
  }
}

- (void)_setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self view];
  [v5 setTintColor:v4];
}

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED52FE00];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel__prepareWithExtensionInfo_completionHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED531DD8];
}

- (void)_setUploadURLWrapper:(id)a3
{
  id v4 = [a3 url];
  [(UIDocumentPickerExtensionViewController *)self _setUploadURL:v4];
}

- (void)_setUploadURL:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_originalURL] & 1) == 0)
  {
    [(NSURL *)self->_originalURL stopAccessingSecurityScopedResource];
    id v4 = (NSURL *)[v6 copy];
    originalURL = self->_originalURL;
    self->_originalURL = v4;

    [(NSURL *)self->_originalURL startAccessingSecurityScopedResource];
  }
}

- (void)_prepareWithExtensionInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void))a4;
  id v8 = a3;
  v9 = [v8 objectForKey:@"documentGroup"];
  char v10 = [v8 objectForKey:@"documentStorageURL"];
  [(UIDocumentPickerExtensionViewController *)self _setDocumentStorageURL:v10];

  v11 = [v8 objectForKey:@"providerIdentifier"];
  [(UIDocumentPickerExtensionViewController *)self _setProviderIdentifier:v11];

  v12 = [v8 objectForKey:@"localizedName"];

  char v13 = [(UIViewController *)self navigationItem];
  [v13 setTitle:v12];

  if (v9)
  {
    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v15 = [v14 containerURLForSecurityApplicationGroupIdentifier:v9];

    if (!v15)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"UIDocumentPickerExtensionViewController.m", 122, @"Could not access the group container with identifier %@. Is the necessary entitlement set?", v9 object file lineNumber description];
    }
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    BOOL v17 = CheckSandboxAccess(v15);
    if (has_internal_diagnostics)
    {
      if (!v17)
      {
        v32 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v15;
          _os_log_fault_impl(&dword_1853B0000, v32, OS_LOG_TYPE_FAULT, "No access to group container %@, even though we just got it from NSFileManager.", buf, 0xCu);
        }
      }
    }
    else if (!v17)
    {
      v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_prepareWithExtensionInfo_completionHandler____s_category)+ 8);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "No access to group container %@, even though we just got it from NSFileManager.", buf, 0xCu);
      }
    }
  }
  v18 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];

  if (v18)
  {
    v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    v20 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];
    v21 = [v20 path];
    [v19 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:0];
  }
  if ([(UIDocumentPickerExtensionViewController *)self documentPickerMode] == UIDocumentPickerModeMoveToService
    || [(UIDocumentPickerExtensionViewController *)self documentPickerMode] == UIDocumentPickerModeOpen)
  {
    v22 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];

    if (!v22)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2 object:self file:@"UIDocumentPickerExtensionViewController.m" lineNumber:136 description:@"documentStorageURL is nil in Open or Move mode."];
    }
    v23 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];
    BOOL v24 = CheckSandboxAccess(v23);

    if (!v24)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v26 = [(UIDocumentPickerExtensionViewController *)self documentStorageURL];
      v27 = (void *)v26;
      if (v9)
      {
        v28 = [MEMORY[0x1E4F28CB8] defaultManager];
        v29 = [v28 containerURLForSecurityApplicationGroupIdentifier:v9];
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerExtensionViewController.m", 142, @"No access to documentStorageURL %@; group container is at %@.",
          v27,
          v29);
      }
      else
      {
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerExtensionViewController.m", 147, @"No access to documentStorageURL %@; no NSExtensionFileProviderDocumentGroup found.",
          v26);
      }
    }
  }
  [(UIDocumentPickerExtensionViewController *)self prepareForPresentationInMode:[(UIDocumentPickerExtensionViewController *)self documentPickerMode]];
  [(UIViewController *)self view];

  v7[2](v7, _UIApplicationLinkedOnVersion);
}

- (UIDocumentPickerMode)documentPickerMode
{
  return self->_documentPickerMode;
}

- (void)_setPickerMode:(unint64_t)a3
{
  self->_documentPickerMode = a3;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSArray)validTypes
{
  return self->_validTypes;
}

- (void)_setPickableTypes:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)_setProviderIdentifier:(id)a3
{
}

- (NSURL)documentStorageURL
{
  return self->_documentStorageURL;
}

- (void)_setDocumentStorageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentStorageURL, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_validTypes, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end