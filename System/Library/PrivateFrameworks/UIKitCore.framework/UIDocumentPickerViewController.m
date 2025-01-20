@interface UIDocumentPickerViewController
- (BOOL)_automaticallyDismissesAfterCompletion;
- (BOOL)_forPickingDownloadsFolder;
- (BOOL)_ignoreApplicationEntitlementForImport;
- (BOOL)_isContentManaged;
- (BOOL)allowsMultipleSelection;
- (BOOL)shouldShowFileExtensions;
- (DOCConfiguration)configuration;
- (NSArray)documentTypes;
- (NSArray)uploadURLs;
- (NSMutableArray)_securityScopedURLs;
- (NSURL)directoryURL;
- (UIDocumentPickerMode)documentPickerMode;
- (UIDocumentPickerViewController)initForExportingURLs:(NSArray *)urls;
- (UIDocumentPickerViewController)initForExportingURLs:(NSArray *)urls asCopy:(BOOL)asCopy;
- (UIDocumentPickerViewController)initForOpeningContentTypes:(NSArray *)contentTypes;
- (UIDocumentPickerViewController)initForOpeningContentTypes:(NSArray *)contentTypes asCopy:(BOOL)asCopy;
- (UIDocumentPickerViewController)initWithCoder:(NSCoder *)coder;
- (UIDocumentPickerViewController)initWithDocumentTypes:(NSArray *)allowedUTIs inMode:(UIDocumentPickerMode)mode;
- (UIDocumentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIDocumentPickerViewController)initWithURL:(NSURL *)url inMode:(UIDocumentPickerMode)mode;
- (UIDocumentPickerViewController)initWithURLs:(NSArray *)urls inMode:(UIDocumentPickerMode)mode;
- (UIViewController)_childViewController;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_initForImportingDocumentsWithConversionRules:(id)a3;
- (id)_initIgnoringApplicationEntitlementForImportOfTypes:(id)a3;
- (id)delegate;
- (int64_t)modalPresentationStyle;
- (unint64_t)pickerUserInterfaceStyle;
- (void)_callDelegateWithSelectedURLsAndDismiss:(id)a3;
- (void)_commonInitWithDocumentTypes:(void *)a1;
- (void)_consumeSandboxExtensionForURL:(id)a3;
- (void)_didTapCancel;
- (void)_setAutomaticallyDismissesAfterCompletion:(BOOL)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setForPickingDownloadsFolder:(BOOL)a3;
- (void)_setIgnoreApplicationEntitlementForImport:(BOOL)a3;
- (void)_setIsContentManaged:(BOOL)a3;
- (void)_tellDelegateDocumentPickerWasCancelled;
- (void)dealloc;
- (void)documentBrowser:(id)a3 didPickDocumentURLs:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setAllowsMultipleSelection:(BOOL)allowsMultipleSelection;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDirectoryURL:(NSURL *)directoryURL;
- (void)setDocumentPickerMode:(unint64_t)a3;
- (void)setDocumentTypes:(id)a3;
- (void)setPickerUserInterfaceStyle:(unint64_t)a3;
- (void)setShouldShowFileExtensions:(BOOL)shouldShowFileExtensions;
- (void)setUploadURLs:(id)a3;
- (void)set_securityScopedURLs:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIDocumentPickerViewController

- (UIDocumentPickerViewController)initWithDocumentTypes:(NSArray *)allowedUTIs inMode:(UIDocumentPickerMode)mode
{
  v7 = allowedUTIs;
  if (mode >= UIDocumentPickerModeExportToService)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 115, @"%s can only be called with mode Import or Open", "-[UIDocumentPickerViewController initWithDocumentTypes:inMode:]");
  }
  if ([(NSArray *)v7 count] == 1)
  {
    v8 = (void *)MEMORY[0x1E4F442D8];
    v9 = [(NSArray *)v7 firstObject];
    v10 = [v8 typeWithIdentifier:v9];
    int v11 = [v10 isEqual:*MEMORY[0x1E4F443C8]];

    if (mode != UIDocumentPickerModeOpen)
    {
      if (v11)
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2, self, @"UIDocumentPickerViewController.m", 118, @"%s folder import is not supported, use open", "-[UIDocumentPickerViewController initWithDocumentTypes:inMode:]" object file lineNumber description];
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentPickerViewController;
  v12 = [(UIViewController *)&v17 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    [(UIDocumentPickerViewController *)v12 setDocumentPickerMode:mode];
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v13, v7);
  }

  return v13;
}

- (void)_commonInitWithDocumentTypes:(void *)a1
{
  id v21 = a2;
  [a1 _setAutomaticallyDismissesAfterCompletion:1];
  [a1 setDocumentTypes:v21];
  switch([a1 documentPickerMode])
  {
    case 0:
      id DOCConfigurationClass = getDOCConfigurationClass();
      id v4 = v21;
      uint64_t v5 = 0;
      goto LABEL_10;
    case 1:
      if ([v21 count] != 1) {
        goto LABEL_9;
      }
      v13 = (void *)MEMORY[0x1E4F442D8];
      v14 = [v21 firstObject];
      v15 = [v13 typeWithIdentifier:v14];
      int v16 = [v15 isEqual:*MEMORY[0x1E4F443C8]];

      if (v16)
      {
        uint64_t v17 = [getDOCConfigurationClass() configurationForFolderPicking];
      }
      else
      {
LABEL_9:
        id DOCConfigurationClass = getDOCConfigurationClass();
        id v4 = v21;
        uint64_t v5 = 1;
LABEL_10:
        uint64_t v17 = [DOCConfigurationClass configurationForImportingDocumentsWithContentTypes:v4 mode:v5];
      }
      v7 = (void *)v17;
      [a1 setConfiguration:v17];
      goto LABEL_12;
    case 2:
      id v6 = getDOCConfigurationClass();
      v7 = [a1 uploadURLs];
      v8 = v6;
      v9 = v7;
      uint64_t v10 = 2;
      goto LABEL_5;
    case 3:
      id v11 = getDOCConfigurationClass();
      v7 = [a1 uploadURLs];
      v8 = v11;
      v9 = v7;
      uint64_t v10 = 3;
LABEL_5:
      v12 = [v8 configurationForExportingDocumentsToURLs:v9 mode:v10];
      [a1 setConfiguration:v12];

LABEL_12:
      break;
    default:
      break;
  }
  v18 = [a1 configuration];
  [v18 setForPickingDocuments:1];

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v19 = +[UIDevice currentDevice];
    BOOL v20 = [v19 userInterfaceIdiom] != 0;

    [a1 setModalPresentationStyle:v20];
  }
}

- (UIDocumentPickerViewController)initForOpeningContentTypes:(NSArray *)contentTypes asCopy:(BOOL)asCopy
{
  BOOL v4 = asCopy;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v7 = contentTypes;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v7, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v9 = v7;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v23 + 1) + 8 * v13) identifier];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  if ([v8 count] == 1)
  {
    v15 = [v8 firstObject];
    int v16 = UTTypeEqual(v15, (CFStringRef)*MEMORY[0x1E4F225C8]);

    if (v16 && v4)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"UIDocumentPickerViewController.m", 149, @"%s folder import is not supported, use asCopy:false", "-[UIDocumentPickerViewController initForOpeningContentTypes:asCopy:]" object file lineNumber description];
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)UIDocumentPickerViewController;
  v18 = [(UIViewController *)&v22 initWithNibName:0 bundle:0];
  v19 = v18;
  if (v18)
  {
    [(UIDocumentPickerViewController *)v18 setDocumentPickerMode:!v4];
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v19, v8);
  }

  return v19;
}

- (UIDocumentPickerViewController)initForOpeningContentTypes:(NSArray *)contentTypes
{
  return [(UIDocumentPickerViewController *)self initForOpeningContentTypes:contentTypes asCopy:0];
}

- (UIDocumentPickerViewController)initWithCoder:(NSCoder *)coder
{
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentPickerViewController;
  v3 = [(UIViewController *)&v6 initWithCoder:coder];
  BOOL v4 = v3;
  if (v3) {
    [(UIDocumentPickerViewController *)v3 _setAutomaticallyDismissesAfterCompletion:1];
  }
  return v4;
}

- (UIDocumentPickerViewController)initWithURL:(NSURL *)url inMode:(UIDocumentPickerMode)mode
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v7 = url;
  v8 = v7;
  if ((mode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 175, @"%s can only be called with mode Export or Move", "-[UIDocumentPickerViewController initWithURL:inMode:]");

    if (v8) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 176, @"%s must be called with a valid URL", "-[UIDocumentPickerViewController initWithURL:inMode:]");

LABEL_3:
  v9 = [(NSURL *)v8 lastPathComponent];

  if (!v9)
  {
    BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 177, @"%s must be called with a URL pointing to a file", "-[UIDocumentPickerViewController initWithURL:inMode:]");
  }
  id v24 = 0;
  uint64_t v10 = *MEMORY[0x1E4F1C6E8];
  id v23 = 0;
  BOOL v11 = [(NSURL *)v8 getPromisedItemResourceValue:&v24 forKey:v10 error:&v23];
  id v12 = v24;
  id v13 = v23;
  if (!v11)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"UIDocumentPickerViewController.m", 181, @"%s must be called with a URL pointing to an existing file: %@", "-[UIDocumentPickerViewController initWithURL:inMode:]", v13 object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)UIDocumentPickerViewController;
  v14 = [(UIViewController *)&v22 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    [(UIDocumentPickerViewController *)v14 setDocumentPickerMode:mode];
    v25[0] = v8;
    int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [(UIDocumentPickerViewController *)v15 setUploadURLs:v16];

    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v15, MEMORY[0x1E4F1CBF0]);
  }

  return v15;
}

- (UIDocumentPickerViewController)initWithURLs:(NSArray *)urls inMode:(UIDocumentPickerMode)mode
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = urls;
  objc_super v6 = v5;
  UIDocumentPickerMode v27 = mode;
  if ((mode & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 196, @"%s can only be called with mode Export or Move", "-[UIDocumentPickerViewController initWithURLs:inMode:]");

    if (v6) {
      goto LABEL_3;
    }
LABEL_22:
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 197, @"%s must be called with a valid URL", "-[UIDocumentPickerViewController initWithURLs:inMode:]");

    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_22;
  }
LABEL_3:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v7 = v6;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v8) {
    goto LABEL_18;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v34;
  uint64_t v11 = *MEMORY[0x1E4F1C6E8];
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
      int v14 = [v13 startAccessingSecurityScopedResource];
      v15 = [v13 lastPathComponent];

      if (!v15)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 202, @"%s must be called with a URL pointing to a file", "-[UIDocumentPickerViewController initWithURLs:inMode:]");
      }
      id v31 = 0;
      id v32 = 0;
      char v16 = [v13 getPromisedItemResourceValue:&v32 forKey:v11 error:&v31];
      id v17 = v32;
      id v18 = v31;
      if (v16)
      {
        if (!v14) {
          goto LABEL_13;
        }
LABEL_12:
        [v13 stopAccessingSecurityScopedResource];
        goto LABEL_13;
      }
      BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"UIDocumentPickerViewController.m", 206, @"%s must be called with a URL pointing to an existing file: %@", "-[UIDocumentPickerViewController initWithURLs:inMode:]", v18 object file lineNumber description];

      if (v14) {
        goto LABEL_12;
      }
LABEL_13:

      ++v12;
    }
    while (v9 != v12);
    uint64_t v21 = [(NSArray *)v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v9 = v21;
  }
  while (v21);
LABEL_18:

  v30.receiver = self;
  v30.super_class = (Class)UIDocumentPickerViewController;
  objc_super v22 = [(UIViewController *)&v30 initWithNibName:0 bundle:0];
  id v23 = v22;
  if (v22)
  {
    [(UIDocumentPickerViewController *)v22 setDocumentPickerMode:v27];
    [(UIDocumentPickerViewController *)v23 setUploadURLs:v7];
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v23, MEMORY[0x1E4F1CBF0]);
  }

  return v23;
}

- (UIDocumentPickerViewController)initForExportingURLs:(NSArray *)urls asCopy:(BOOL)asCopy
{
  BOOL v4 = asCopy;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = urls;
  objc_super v6 = v5;
  uint64_t v7 = 2;
  if (!v4) {
    uint64_t v7 = 3;
  }
  uint64_t v27 = v7;
  if (!v5)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 230, @"%s must be called with a valid URL", "-[UIDocumentPickerViewController initForExportingURLs:asCopy:]");
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = v6;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    uint64_t v12 = *MEMORY[0x1E4F1C6E8];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        int v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        int v15 = [v14 startAccessingSecurityScopedResource];
        char v16 = [v14 lastPathComponent];

        if (!v16)
        {
          BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 235, @"%s must be called with a URL pointing to a file", "-[UIDocumentPickerViewController initForExportingURLs:asCopy:]");
        }
        id v31 = 0;
        id v32 = 0;
        char v17 = [v14 getPromisedItemResourceValue:&v32 forKey:v12 error:&v31];
        id v18 = v32;
        id v19 = v31;
        if (v17)
        {
          if (!v15) {
            goto LABEL_15;
          }
LABEL_14:
          [v14 stopAccessingSecurityScopedResource];
          goto LABEL_15;
        }
        uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2, self, @"UIDocumentPickerViewController.m", 239, @"%s must be called with a URL pointing to an existing file: %@", "-[UIDocumentPickerViewController initForExportingURLs:asCopy:]", v19 object file lineNumber description];

        if (v15) {
          goto LABEL_14;
        }
LABEL_15:

        ++v13;
      }
      while (v10 != v13);
      uint64_t v22 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v10 = v22;
    }
    while (v22);
  }

  v30.receiver = self;
  v30.super_class = (Class)UIDocumentPickerViewController;
  id v23 = [(UIViewController *)&v30 initWithNibName:0 bundle:0];
  id v24 = v23;
  if (v23)
  {
    [(UIDocumentPickerViewController *)v23 setDocumentPickerMode:v27];
    [(UIDocumentPickerViewController *)v24 setUploadURLs:v8];
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v24, MEMORY[0x1E4F1CBF0]);
  }

  return v24;
}

- (UIDocumentPickerViewController)initForExportingURLs:(NSArray *)urls
{
  return [(UIDocumentPickerViewController *)self initForExportingURLs:urls asCopy:0];
}

- (id)_initForImportingDocumentsWithConversionRules:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDocumentPickerViewController;
  uint64_t v5 = [(UIViewController *)&v12 initWithNibName:0 bundle:0];
  objc_super v6 = v5;
  if (v5)
  {
    [(UIDocumentPickerViewController *)v5 setDocumentPickerMode:0];
    [(UIDocumentPickerViewController *)v6 _setAutomaticallyDismissesAfterCompletion:1];
    uint64_t v7 = [getDOCConfigurationClass() configurationForImportingDocumentsWithConversionRules:v4];
    [(UIDocumentPickerViewController *)v6 setConfiguration:v7];

    uint64_t v8 = [(UIDocumentPickerViewController *)v6 configuration];
    [v8 setForPickingDocuments:1];

    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      uint64_t v9 = +[UIDevice currentDevice];
      BOOL v10 = [v9 userInterfaceIdiom] != 0;

      [(UIViewController *)v6 setModalPresentationStyle:v10];
    }
  }

  return v6;
}

- (void)setAllowsMultipleSelection:(BOOL)allowsMultipleSelection
{
  BOOL v3 = allowsMultipleSelection;
  self->_allowsMultipleSelection = allowsMultipleSelection;
  id v4 = [(UIDocumentPickerViewController *)self _childViewController];
  [v4 setAllowsPickingMultipleItems:v3];
}

- (BOOL)shouldShowFileExtensions
{
  v2 = [(UIDocumentPickerViewController *)self _childViewController];
  char v3 = [v2 shouldShowFileExtensions];

  return v3;
}

- (void)setShouldShowFileExtensions:(BOOL)shouldShowFileExtensions
{
  BOOL v3 = shouldShowFileExtensions;
  id v4 = [(UIDocumentPickerViewController *)self _childViewController];
  [v4 setShouldShowFileExtensions:v3];
}

- (unint64_t)pickerUserInterfaceStyle
{
  v2 = [(UIDocumentPickerViewController *)self _childViewController];
  uint64_t v3 = [v2 browserUserInterfaceStyle];

  return v3 == 1;
}

- (void)setPickerUserInterfaceStyle:(unint64_t)a3
{
  if (a3 == 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = a3 == 1;
  }
  id v4 = [(UIDocumentPickerViewController *)self _childViewController];
  [v4 setBrowserUserInterfaceStyle:v3];
}

- (id)_initIgnoringApplicationEntitlementForImportOfTypes:(id)a3
{
  return [(UIDocumentPickerViewController *)self initWithDocumentTypes:a3 inMode:0];
}

- (void)documentBrowser:(id)a3 didPickDocumentURLs:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7 || ![v7 count])
  {
    uint64_t v9 = _UIDocumentLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = (id)objc_opt_class();
      id v13 = v16;
      _os_log_error_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@ : didPickDocumentURLs called with nil or 0 URLS", buf, 0xCu);
    }
    uint64_t v10 = [(UIViewController *)self presentingViewController];
    if (v10
      && (uint64_t v11 = (void *)v10,
          BOOL v12 = [(UIDocumentPickerViewController *)self _automaticallyDismissesAfterCompletion], v11, v12))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__UIDocumentPickerViewController_documentBrowser_didPickDocumentURLs___block_invoke;
      v14[3] = &unk_1E52D9F70;
      v14[4] = self;
      [(UIViewController *)self dismissViewControllerAnimated:1 completion:v14];
    }
    else
    {
      [(UIDocumentPickerViewController *)self _tellDelegateDocumentPickerWasCancelled];
    }
  }
  if ([v8 count]) {
    [(UIDocumentPickerViewController *)self _callDelegateWithSelectedURLsAndDismiss:v8];
  }
}

uint64_t __70__UIDocumentPickerViewController_documentBrowser_didPickDocumentURLs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellDelegateDocumentPickerWasCancelled];
}

- (UIDocumentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  uint64_t v9 = NSString;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = NSStringFromSelector(sel_initWithDocumentTypes_inMode_);
  BOOL v12 = NSStringFromSelector(sel_initWithURL_inMode_);
  id v13 = [v9 stringWithFormat:@"You cannot initialize a %@ except by the %@ and %@ initializers.", v10, v11, v12];
  id v14 = [v7 exceptionWithName:v8 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)_setIsContentManaged:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isContentManaged = a3;
  id v4 = [(UIDocumentPickerViewController *)self configuration];
  _UIShimSetIsContentManaged(v4, v3);
}

- (void)_setForPickingDownloadsFolder:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIDocumentPickerViewController *)self configuration];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(UIDocumentPickerViewController *)self configuration];
    id v7 = [NSNumber numberWithBool:v3];
    [v8 setValue:v7 forKey:@"forPickingDownloadsFolder"];
  }
}

- (BOOL)_forPickingDownloadsFolder
{
  BOOL v3 = [(UIDocumentPickerViewController *)self configuration];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(UIDocumentPickerViewController *)self configuration];
  char v6 = [v5 valueForKey:@"forPickingDownloadsFolder"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (void)viewDidLoad
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)UIDocumentPickerViewController;
  [(UIViewController *)&v11 viewDidLoad];
  if (!self->_childViewController)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2050000000;
    BOOL v3 = (void *)qword_1EB25BD08;
    uint64_t v16 = qword_1EB25BD08;
    if (!qword_1EB25BD08)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getUIDocumentBrowserViewControllerClass_block_invoke;
      v12[3] = &unk_1E52D9900;
      v12[4] = &v13;
      __getUIDocumentBrowserViewControllerClass_block_invoke((uint64_t)v12);
      BOOL v3 = (void *)v14[3];
    }
    char v4 = v3;
    _Block_object_dispose(&v13, 8);
    id v5 = [v4 alloc];
    char v6 = [(UIDocumentPickerViewController *)self configuration];
    char v7 = (void *)[v5 initWithConfiguration:v6];

    [v7 setAllowsDocumentCreation:0];
    [v7 setDelegate:self];
    id v8 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:1 target:self action:sel__didTapCancel];
    [v7 setAllowsPickingMultipleItems:self->_allowsMultipleSelection];
    v17[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v7 setAdditionalTrailingNavigationBarButtonItems:v9];

    [(UIDocumentPickerViewController *)self _setChildViewController:v7];
    uint64_t v10 = [(UIViewController *)self presentationController];
    [v10 setDelegate:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIDocumentPickerViewController;
  [(UIViewController *)&v7 viewWillAppear:a3];
  char v4 = [(UIDocumentPickerViewController *)self directoryURL];

  if (v4)
  {
    id v5 = [(UIDocumentPickerViewController *)self _childViewController];
    char v6 = [(UIDocumentPickerViewController *)self directoryURL];
    [v5 revealDocumentAtURL:v6 importIfNeeded:0 completion:&__block_literal_global_157];
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_securityScopedURLs;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) stopAccessingSecurityScopedResource];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  securityScopedURLs = self->_securityScopedURLs;
  self->_securityScopedURLs = 0;

  [(UIDocumentPickerViewController *)self setDelegate:0];
  v9.receiver = self;
  v9.super_class = (Class)UIDocumentPickerViewController;
  [(UIViewController *)&v9 dealloc];
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1ED508C70])
  {
    BOOL v3 = [(UIViewController *)self->_childViewController _containedRemoteViewController];
  }
  else
  {
    BOOL v3 = 0;
  }
  return (_UIRemoteViewController *)v3;
}

- (void)_setChildViewController:(id)a3
{
  uint64_t v5 = (UIViewController *)a3;
  if (self->_childViewController)
  {
    long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentPickerViewController.m", 607, @"%s: remote view controller can only be set once", "-[UIDocumentPickerViewController _setChildViewController:]");

    childViewController = self->_childViewController;
  }
  else
  {
    childViewController = 0;
  }
  self->_childViewController = v5;
  uint64_t v7 = v5;

  [(UIViewController *)self->_childViewController beginAppearanceTransition:1 animated:0];
  [(UIViewController *)self addChildViewController:self->_childViewController];
  id v8 = [(UIViewController *)self->_childViewController view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(UIViewController *)self view];
  long long v10 = [(UIViewController *)self->_childViewController view];
  [v9 addSubview:v10];

  long long v11 = [(UIViewController *)self view];
  long long v12 = (void *)MEMORY[0x1E4F5B268];
  long long v13 = [(UIViewController *)self view];
  id v14 = [(UIViewController *)self->_childViewController view];
  uint64_t v15 = [v12 constraintWithItem:v13 attribute:7 relatedBy:0 toItem:v14 attribute:7 multiplier:1.0 constant:0.0];
  [v11 addConstraint:v15];

  uint64_t v16 = [(UIViewController *)self view];
  uint64_t v17 = (void *)MEMORY[0x1E4F5B268];
  id v18 = [(UIViewController *)self view];
  id v19 = [(UIViewController *)self->_childViewController view];
  BOOL v20 = [v17 constraintWithItem:v18 attribute:8 relatedBy:0 toItem:v19 attribute:8 multiplier:1.0 constant:0.0];
  [v16 addConstraint:v20];

  uint64_t v21 = [(UIViewController *)self view];
  uint64_t v22 = (void *)MEMORY[0x1E4F5B268];
  id v23 = [(UIViewController *)self view];
  id v24 = [(UIViewController *)self->_childViewController view];
  long long v25 = [v22 constraintWithItem:v23 attribute:1 relatedBy:0 toItem:v24 attribute:1 multiplier:1.0 constant:0.0];
  [v21 addConstraint:v25];

  long long v26 = [(UIViewController *)self view];
  uint64_t v27 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v28 = [(UIViewController *)self view];
  v29 = [(UIViewController *)self->_childViewController view];
  objc_super v30 = [v27 constraintWithItem:v28 attribute:3 relatedBy:0 toItem:v29 attribute:3 multiplier:1.0 constant:0.0];
  [v26 addConstraint:v30];

  [(UIViewController *)self->_childViewController didMoveToParentViewController:self];
  [(UIViewController *)self->_childViewController endAppearanceTransition];
  [(UIViewController *)self->_childViewController preferredContentSize];
  double v32 = v31;
  double v34 = v33;

  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v32, v34);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIDocumentPickerViewController;
  id v4 = a3;
  [(UIViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)_tellDelegateDocumentPickerWasCancelled
{
  id v4 = [(UIDocumentPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 documentPickerWasCancelled:self];
  }
  BOOL v3 = [(UIDocumentPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 documentPickerWasCancelled:self completion:&__block_literal_global_124_0];
  }
}

- (void)_callDelegateWithSelectedURLsAndDismiss:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UIViewController *)self presentingViewController];
  if ((dyld_program_sdk_at_least() & 1) == 0
    && [(UIDocumentPickerViewController *)self documentPickerMode] == UIDocumentPickerModeOpen)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * v10);
          long long v12 = (void *)MEMORY[0x18C108260]();
          [(UIDocumentPickerViewController *)self _consumeSandboxExtensionForURL:v11];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }
  }
  if (!dyld_program_sdk_at_least())
  {
    id v14 = [(UIDocumentPickerViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    uint64_t v16 = [(UIDocumentPickerViewController *)self delegate];
    uint64_t v17 = v16;
    if (v15)
    {
      [v16 documentPicker:self didPickDocumentsAtURLs:v4];
    }
    else
    {
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
      {
LABEL_20:
        [v5 dismissViewControllerAnimated:1 completion:0];
        goto LABEL_26;
      }
      uint64_t v17 = [(UIDocumentPickerViewController *)self delegate];
      id v19 = [v4 firstObject];
      [v17 documentPicker:self didPickDocumentAtURL:v19];
    }
    goto LABEL_20;
  }
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke;
    aBlock[3] = &unk_1E52D9F98;
    aBlock[4] = self;
    id v25 = v4;
    long long v13 = (void (**)(void))_Block_copy(aBlock);
    if ([(UIDocumentPickerViewController *)self _automaticallyDismissesAfterCompletion])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke_2;
      v22[3] = &unk_1E52DA040;
      id v23 = v13;
      [v5 dismissViewControllerAnimated:1 completion:v22];
    }
    else
    {
      v13[2](v13);
    }
  }
  else
  {
    BOOL v20 = [(UIDocumentPickerViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v21 = [v4 firstObject];
      [v20 documentPicker:self didPickDocumentAtURL:v21 completion:&__block_literal_global_132_0];
    }
  }
LABEL_26:
}

void __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  id v8 = v4;
  if (v3)
  {
    [v4 documentPicker:*(void *)(a1 + 32) didPickDocumentsAtURLs:*(void *)(a1 + 40)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) firstObject];
    [v8 documentPicker:v6 didPickDocumentAtURL:v7];
  }
}

uint64_t __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didTapCancel
{
  uint64_t v3 = [(UIViewController *)self presentingViewController];
  if (v3
    && (id v4 = (void *)v3,
        BOOL v5 = [(UIDocumentPickerViewController *)self _automaticallyDismissesAfterCompletion], v4, v5))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__UIDocumentPickerViewController__didTapCancel__block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [(UIViewController *)self dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    [(UIDocumentPickerViewController *)self _tellDelegateDocumentPickerWasCancelled];
  }
}

uint64_t __47__UIDocumentPickerViewController__didTapCancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellDelegateDocumentPickerWasCancelled];
}

- (void)_consumeSandboxExtensionForURL:(id)a3
{
  id v8 = a3;
  securityScopedURLs = self->_securityScopedURLs;
  if (!securityScopedURLs)
  {
    BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = self->_securityScopedURLs;
    self->_securityScopedURLs = v5;

    securityScopedURLs = self->_securityScopedURLs;
  }
  if ((unint64_t)[(NSMutableArray *)securityScopedURLs count] >= 0xA)
  {
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_securityScopedURLs firstObject];
      [v7 stopAccessingSecurityScopedResource];

      [(NSMutableArray *)self->_securityScopedURLs removeObjectAtIndex:0];
    }
    while ((unint64_t)[(NSMutableArray *)self->_securityScopedURLs count] > 9);
  }
  if ([v8 startAccessingSecurityScopedResource]) {
    [(NSMutableArray *)self->_securityScopedURLs addObject:v8];
  }
}

- (NSMutableArray)_securityScopedURLs
{
  return self->_securityScopedURLs;
}

- (void)set_securityScopedURLs:(id)a3
{
}

- (BOOL)_ignoreApplicationEntitlementForImport
{
  return self->_ignoreApplicationEntitlementForImport;
}

- (void)_setIgnoreApplicationEntitlementForImport:(BOOL)a3
{
  self->_ignoreApplicationEntitlementForImport = a3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (UIDocumentPickerMode)documentPickerMode
{
  return self->_documentPickerMode;
}

- (void)setDocumentPickerMode:(unint64_t)a3
{
  self->_documentPickerMode = a3;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(NSURL *)directoryURL
{
}

- (NSArray)documentTypes
{
  return self->_documentTypes;
}

- (void)setDocumentTypes:(id)a3
{
}

- (UIViewController)_childViewController
{
  return self->_childViewController;
}

- (NSArray)uploadURLs
{
  return self->_uploadURLs;
}

- (void)setUploadURLs:(id)a3
{
}

- (DOCConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)_isContentManaged
{
  return self->_isContentManaged;
}

- (BOOL)_automaticallyDismissesAfterCompletion
{
  return self->_automaticallyDismissesAfterCompletion;
}

- (void)_setAutomaticallyDismissesAfterCompletion:(BOOL)a3
{
  self->_automaticallyDismissesAfterCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uploadURLs, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_documentTypes, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_securityScopedURLs, 0);
  objc_storeStrong((id *)&self->_weak_delegate, 0);
}

@end