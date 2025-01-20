@interface UIDocumentInteractionController
+ (UIDocumentInteractionController)interactionControllerWithURL:(NSURL *)url;
+ (id)_UTIForFileURL:(id)a3;
+ (id)_archiveDecompressQueue;
- (BOOL)__presentPreviewAnimated:(BOOL)a3;
- (BOOL)_canPreviewDecompressedArchive;
- (BOOL)_canSaveToCameraRollForType;
- (BOOL)_delegateCanPerformAction:(SEL)a3;
- (BOOL)_delegateExistsAndImplementsRequiredMethods:(id *)a3;
- (BOOL)_delegateImplementsLegacyActions;
- (BOOL)_delegatePerformAction:(SEL)a3;
- (BOOL)_documentNeedsHelpDecompressingArchiveForPreview;
- (BOOL)_isFilenameValidForDecompressing:(id)a3 allowsPreviewingArchive:(BOOL)a4;
- (BOOL)_isImage;
- (BOOL)_isPackageArchive:(id)a3;
- (BOOL)_isValidURL:(id)a3;
- (BOOL)_presentOpenInMenuAnimated:(BOOL)a3 willPresentBlock:(id)a4;
- (BOOL)_presentOptionsMenuAnimated:(BOOL)a3 willPresentBlock:(id)a4;
- (BOOL)_setupForOpenInMenu;
- (BOOL)_setupForOptionsMenu;
- (BOOL)_setupPreviewController;
- (BOOL)_shouldAutoDecompressIfArchive;
- (BOOL)_shouldAutoDecompressIfArchiveForPreview;
- (BOOL)_shouldIncludeActivityForLegacyDelegatingWithAction:(SEL)a3;
- (BOOL)_shouldIncludePreviewActivity;
- (BOOL)_shouldReturnDefaultApplication;
- (BOOL)excludeDotFilesFromArchiveListings;
- (BOOL)isArchive;
- (BOOL)isContentManaged;
- (BOOL)presentOpenInMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (BOOL)presentOpenInMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
- (BOOL)presentOptionsMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (BOOL)presentOptionsMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
- (BOOL)presentPreviewAnimated:(BOOL)animated;
- (BOOL)previewController:(id)a3 canEditItem:(id)a4;
- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4;
- (BOOL)previewsPresentWithMarkup;
- (BOOL)shouldUnzipDocument;
- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5;
- (NSArray)gestureRecognizers;
- (NSArray)icons;
- (NSString)UTI;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (NSURL)URL;
- (NSURL)_customExtactionRootURL;
- (QLPreviewController)previewController;
- (UIDocumentInteractionController)initWithURL:(id)a3;
- (UIPopoverController)popoverController;
- (_UIDICActivityViewController)activityViewController;
- (_UIDICPreviewItem)previewControllerItem;
- (id)__decompressArchiveAndSetupPayload:(id)a3 completion:(id)a4;
- (id)_appOpeningDocumentProxy;
- (id)_completionWithItemsHandler;
- (id)_decompressedArchiveDocumentURL;
- (id)_defaultApplication;
- (id)_documentProxy;
- (id)_documentProxyWithIsContentManaged:(BOOL)a3 usingURL:(id)a4;
- (id)_newActivityIfNecessaryForLegacyActionDelegatingWithAction:(SEL)a3;
- (id)_newPreviewActivity;
- (id)_pathsInArchive:(id)a3;
- (id)_preferredApplicationForDocumentOpening;
- (id)_preparedActivityViewControllerWithItems:(id)a3 activities:(id)a4 options:(unint64_t)a5;
- (id)additionalActivitiesTypesForPreviewController:(id)a3;
- (id)annotation;
- (id)delegate;
- (id)dismissActionsForPreviewController:(id)a3;
- (id)excludedActivityTypesForPreviewController:(id)a3;
- (id)extractSubitemFromArchive:(id)a3 completion:(id)a4;
- (id)physicalURL;
- (id)presentingNavigationController;
- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (unint64_t)_archiveExtractionOptions;
- (void)__openUsingDefaultCopyMechanismToTransferDocumentToApplication:(id)a3;
- (void)__openUsingInPlaceMechanismToTransferDocumentToApplication:(id)a3;
- (void)__performLaunchServiceDocumentOpenWithApplication:(id)a3 launchServiceOptions:(id)a4;
- (void)_clearPreviousPresentationContext;
- (void)_decompressArchiveAndSetupPayload:(id)a3;
- (void)_dismissEverythingWithExtremePrejudiceAnimated:(BOOL)a3;
- (void)_fixupFileExtensionIfNeeded;
- (void)_invalidate;
- (void)_invokeDelegateDidFinishOpenWithApplicationIdentifier:(id)a3;
- (void)_invokeDelegateWillBeginOpenWithApplicationIdentifier:(id)a3;
- (void)_openDocumentWithApplication:(id)a3;
- (void)_presentOptionsMenu:(id)a3;
- (void)_presentPreview:(id)a3;
- (void)_setCompletionWithItemsHandler:(id)a3;
- (void)_setCustomExtactionRootURL:(id)a3;
- (void)_setDecompressedArchiveDocumentURL:(id)a3;
- (void)_setupPreviewController;
- (void)_updateURLIsContentManaged;
- (void)activityViewController:(id)a3 didFinishPerformingActivityType:(id)a4 completed:(BOOL)a5 items:(id)a6 error:(id)a7;
- (void)activityViewController:(id)a3 didFinishPresentingActivityType:(id)a4;
- (void)activityViewController:(id)a3 openActivityDidEndSendingToApplication:(id)a4;
- (void)activityViewController:(id)a3 openActivityWillBeginSendingToApplication:(id)a4;
- (void)dealloc;
- (void)dismissMenuAnimated:(BOOL)animated;
- (void)dismissPreviewAnimated:(BOOL)animated;
- (void)markupAction:(id)a3;
- (void)openDocumentWithDefaultApplication;
- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4;
- (void)popoverController:(id)a3 animationCompleted:(int64_t)a4;
- (void)previewControllerDidDismiss:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setAnnotation:(id)annotation;
- (void)setDelegate:(id)delegate;
- (void)setExcludeDotFilesFromArchiveListings:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setName:(NSString *)name;
- (void)setPopoverController:(id)a3;
- (void)setPreviewURLOverride:(id)a3;
- (void)setPreviewsPresentWithMarkup:(BOOL)a3;
- (void)setShouldUnzipDocument:(BOOL)a3;
- (void)setURL:(NSURL *)URL;
- (void)setUTI:(NSString *)UTI;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation UIDocumentInteractionController

+ (UIDocumentInteractionController)interactionControllerWithURL:(NSURL *)url
{
  v4 = url;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return (UIDocumentInteractionController *)v5;
}

- (UIDocumentInteractionController)initWithURL:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIDocumentInteractionController;
  v5 = [(UIDocumentInteractionController *)&v15 init];
  if (v5)
  {
    -[UIDocumentInteractionController setIsContentManaged:](v5, "setIsContentManaged:", objc_msgSend(v4, "ui_isContentManaged"));
    [(UIDocumentInteractionController *)v5 setURL:v4];
    v5->_shouldDecompressArchiveIfNecessary = 0;
    v5->_excludeDotFilesFromArchiveListings = 1;
    decompressedArchiveDocumentURL = v5->_decompressedArchiveDocumentURL;
    v5->_decompressedArchiveDocumentURL = 0;

    id location = 0;
    objc_initWeak(&location, v5);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v8 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v9 = *MEMORY[0x1E4FB2728];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__UIDocumentInteractionController_initWithURL___block_invoke;
    v12[3] = &unk_1E5A23328;
    objc_copyWeak(&v13, &location);
    id v10 = (id)[v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __47__UIDocumentInteractionController_initWithURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissMenuAnimated:0];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(UIPopoverController *)self->_popoverController setDelegate:0];
  [(QLPreviewController *)self->_previewController setDelegate:0];
  [(_UIDICActivityViewController *)self->_activityViewController setDocumentInteractionActivityDelegate:0];
  if (self->_tmpURLToDeleteOnDealloc)
  {
    v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      tmpURLToDeleteOnDealloc = self->_tmpURLToDeleteOnDealloc;
      *(_DWORD *)buf = 138412290;
      v8 = tmpURLToDeleteOnDealloc;
      _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up temporary URL: %@", buf, 0xCu);
    }

    id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    [v5 removeItemAtURL:self->_tmpURLToDeleteOnDealloc error:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentInteractionController;
  [(UIDocumentInteractionController *)&v6 dealloc];
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!v4 || WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if (objc_opt_respondsToSelector()) {
      int v6 = 2;
    }
    else {
      int v6 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFFD | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 4;
    }
    else {
      int v7 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFFB | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 0x20000;
    }
    else {
      int v8 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFDFFFF | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 8;
    }
    else {
      int v9 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFF7 | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 16;
    }
    else {
      int v10 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFEF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 32;
    }
    else {
      int v11 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFDF | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 64;
    }
    else {
      int v12 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFBF | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 128;
    }
    else {
      int v13 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFF7F | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 256;
    }
    else {
      int v14 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFEFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 512;
    }
    else {
      int v15 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFDFF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 1024;
    }
    else {
      int v16 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFBFF | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 2048;
    }
    else {
      int v17 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFF7FF | v17);
    char v18 = objc_opt_respondsToSelector();
    $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
    if (v18) {
      int v20 = 4096;
    }
    else {
      int v20 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&documentInteractionControllerFlags & 0xFFFFEFFF | v20);
    if (*(_WORD *)&documentInteractionControllerFlags & 0x800) != 0 || (v18)
    {
      v21 = share_sheet_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[UIDocumentInteractionController setDelegate:](v21);
      }
    }
    if (objc_opt_respondsToSelector()) {
      int v22 = 0x2000;
    }
    else {
      int v22 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFDFFF | v22);
    if (objc_opt_respondsToSelector()) {
      int v23 = 0x4000;
    }
    else {
      int v23 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFBFFF | v23);
    if (objc_opt_respondsToSelector()) {
      int v24 = 0x8000;
    }
    else {
      int v24 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFF7FFF | v24);
    if (objc_opt_respondsToSelector()) {
      int v25 = 0x10000;
    }
    else {
      int v25 = 0;
    }
    self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFEFFFF | v25);
  }
}

- (void)setIsContentManaged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "setIsContentManaged: %i", (uint8_t *)v6, 8u);
  }

  self->_isContentManaged = v3;
  [(UIDocumentInteractionController *)self _updateURLIsContentManaged];
}

- (void)_updateURLIsContentManaged
{
  id v3 = [(UIDocumentInteractionController *)self URL];
  objc_msgSend(v3, "ui_setIsContentManaged:", self->_isContentManaged);
}

- (void)setURL:(NSURL *)URL
{
  int v9 = URL;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(UIDocumentInteractionController *)v4 previewControllerItem];
  int v6 = [v5 previewItemURL];
  char v7 = [(NSURL *)v9 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    int v8 = [(UIDocumentInteractionController *)v4 previewControllerItem];
    [v8 setPreviewItemURL:v9];

    [(UIDocumentInteractionController *)v4 _invalidate];
    [(UIDocumentInteractionController *)v4 _updateURLIsContentManaged];
  }
  objc_sync_exit(v4);
}

- (NSURL)URL
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(UIDocumentInteractionController *)v2 previewControllerItem];
  id v4 = [v3 previewItemURL];

  objc_sync_exit(v2);
  return (NSURL *)v4;
}

- (void)setUTI:(NSString *)UTI
{
  int v9 = UTI;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(UIDocumentInteractionController *)v4 previewControllerItem];
  int v6 = [v5 previewItemContentType];
  char v7 = [(NSString *)v9 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    int v8 = [(UIDocumentInteractionController *)v4 previewControllerItem];
    [v8 setPreviewItemContentType:v9];

    [(UIDocumentInteractionController *)v4 _invalidate];
  }
  objc_sync_exit(v4);
}

+ (id)_UTIForFileURL:(id)a3
{
  return _UIQLPreviewUTIForURLAndMimeType(a3, 0);
}

- (NSString)UTI
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(UIDocumentInteractionController *)v2 previewControllerItem];
  id v4 = objc_msgSend(v3, "_primitive_previewItemContentType");

  if (!v4)
  {
    id v5 = [(UIDocumentInteractionController *)v2 name];
    if (v5)
    {
      int v6 = [(UIDocumentInteractionController *)v2 URL];
      if (v2->_shouldDecompressArchiveIfNecessary
        && [(UIDocumentInteractionController *)v2 _isFilenameValidForDecompressing:v5 allowsPreviewingArchive:0])
      {
        char v7 = [v6 path];
        int v8 = [v7 stringByDeletingPathExtension];

        uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];

        int v6 = (void *)v9;
      }
      id v4 = +[UIDocumentInteractionController _UTIForFileURL:v6];
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (void)setName:(NSString *)name
{
  uint64_t v9 = name;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(UIDocumentInteractionController *)v4 previewControllerItem];
  int v6 = [v5 previewItemTitle];
  char v7 = [(NSString *)v9 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    int v8 = [(UIDocumentInteractionController *)v4 previewControllerItem];
    [v8 setPreviewItemTitle:v9];

    [(UIDocumentInteractionController *)v4 _invalidate];
  }
  objc_sync_exit(v4);
}

- (NSString)name
{
  id v3 = [(UIDocumentInteractionController *)self URL];
  id v4 = [v3 path];
  id v5 = [v4 lastPathComponent];

  int v6 = self;
  objc_sync_enter(v6);
  char v7 = [(UIDocumentInteractionController *)v6 previewControllerItem];
  uint64_t v8 = [v7 previewItemTitle];
  uint64_t v9 = (void *)v8;
  if (v8) {
    int v10 = (void *)v8;
  }
  else {
    int v10 = v5;
  }
  id v11 = v10;

  objc_sync_exit(v6);
  return (NSString *)v11;
}

- (NSArray)icons
{
  v12[1] = *MEMORY[0x1E4F143B8];
  icons = self->_icons;
  if (!icons)
  {
    id v4 = [(UIDocumentInteractionController *)self _documentProxy];
    id v5 = v4;
    if (v4)
    {
      int v6 = [v4 typeIdentifier];
      if ([(__CFString *)v6 length]
        && (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F224C8])
         || UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F224D0])))
      {
        if (passKitIconsIfIsPassKitDocument_onceToken != -1) {
          dispatch_once(&passKitIconsIfIsPassKitDocument_onceToken, &__block_literal_global_434);
        }
        v12[0] = passKitIconsIfIsPassKitDocument_genericPassIcon;
        char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      }
      else
      {
        char v7 = 0;
      }

      if (![(NSArray *)v7 count])
      {
        uint64_t v8 = iconsToIncludeInIconArrayForDocumentProxy(v5);

        char v7 = (NSArray *)v8;
      }
    }
    else
    {
      char v7 = 0;
    }
    if (![(NSArray *)v7 count])
    {
      if (genericDocumentIcons_onceToken != -1) {
        dispatch_once(&genericDocumentIcons_onceToken, &__block_literal_global_429);
      }
      uint64_t v9 = (NSArray *)(id)genericDocumentIcons_icons;

      char v7 = v9;
    }
    int v10 = self->_icons;
    self->_icons = v7;

    icons = self->_icons;
  }
  return icons;
}

- (BOOL)_isImage
{
  CFStringRef v3 = [(UIDocumentInteractionController *)self UTI];
  LODWORD(v4) = UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F225F8]);
  if (v4)
  {
    CGImageSourceRef v4 = CGImageSourceCreateWithURL((CFURLRef)[(UIDocumentInteractionController *)self URL], 0);
    if (v4)
    {
      CFRelease(v4);
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

- (NSArray)gestureRecognizers
{
  gestureRecognizers = self->_gestureRecognizers;
  if (!gestureRecognizers)
  {
    CGImageSourceRef v4 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__presentPreview_];
    [(NSArray *)v4 addObject:v5];
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__presentOptionsMenu_];
    [(NSArray *)v4 addObject:v6];
    char v7 = self->_gestureRecognizers;
    self->_gestureRecognizers = v4;

    gestureRecognizers = self->_gestureRecognizers;
  }
  return gestureRecognizers;
}

- (void)_invalidate
{
  previewController = self->_previewController;
  self->_previewController = 0;

  icons = self->_icons;
  self->_icons = 0;
}

- (id)_documentProxy
{
  BOOL isContentManaged = self->_isContentManaged;
  CGImageSourceRef v4 = [(UIDocumentInteractionController *)self URL];
  id v5 = [(UIDocumentInteractionController *)self _documentProxyWithIsContentManaged:isContentManaged usingURL:v4];

  return v5;
}

- (id)_documentProxyWithIsContentManaged:(BOOL)a3 usingURL:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v7 = [(UIDocumentInteractionController *)self delegate];
  uint64_t v8 = [(UIDocumentInteractionController *)self name];
  if (v8)
  {
    if ([(UIDocumentInteractionController *)self _shouldAutoDecompressIfArchive])
    {
      uint64_t v9 = [v8 stringByDeletingPathExtension];

      uint64_t v8 = (void *)v9;
    }
    int v10 = [(UIDocumentInteractionController *)self UTI];
    id v11 = [(UIDocumentInteractionController *)self previewControllerItem];
    if (![(UIDocumentInteractionController *)self _shouldAutoDecompressIfArchive])
    {
      int v12 = [v11 previewItemTitle];
      if (v12)
      {
      }
      else
      {
        int v16 = objc_msgSend(v11, "_primitive_previewItemContentType");

        if (v6 && !v16)
        {
          uint64_t v13 = [MEMORY[0x1E4F22430] documentProxyForURL:v6 isContentManaged:v4 sourceAuditToken:0];
          goto LABEL_8;
        }
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F22430] documentProxyForName:v8 type:v10 MIMEType:0 isContentManaged:v4 sourceAuditToken:0];
LABEL_8:
    int v14 = (void *)v13;

    goto LABEL_10;
  }
  int v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)_delegateExistsAndImplementsRequiredMethods:(id *)a3
{
  id v5 = [(UIDocumentInteractionController *)self delegate];
  if (v5)
  {
    if (*(unsigned char *)&self->_documentInteractionControllerFlags)
    {
      BOOL v7 = 1;
      goto LABEL_8;
    }
    id v6 = @"UIDocumentInteractionController delegate must implement documentInteractionControllerViewControllerForPreview: to allow preview";
  }
  else
  {
    id v6 = @"UIDocumentInteractionController has no delegate.  A delegate is required and must implement documentInteractionControllerViewControllerForPreview: to allow preview.";
  }
  BOOL v7 = 0;
  if (a3) {
    *a3 = v6;
  }
LABEL_8:

  return v7;
}

- (void)setPreviewURLOverride:(id)a3
{
  id v9 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  id v5 = [(UIDocumentInteractionController *)v4 previewControllerItem];
  id v6 = [v5 previewItemURLOverride];
  char v7 = [v9 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(UIDocumentInteractionController *)v4 previewControllerItem];
    [v8 setPreviewItemURLOverride:v9];

    [(UIDocumentInteractionController *)v4 _invalidate];
  }
  objc_sync_exit(v4);
}

- (BOOL)_shouldReturnDefaultApplication
{
  v20[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F225F8];
  v20[0] = *MEMORY[0x1E4F22688];
  v20[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22720];
  v20[2] = *MEMORY[0x1E4F22538];
  v20[3] = v4;
  v20[4] = *MEMORY[0x1E4F22668];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
  id v6 = [(UIDocumentInteractionController *)self UTI];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        if (UTTypeConformsTo(v6, *(CFStringRef *)(*((void *)&v15 + 1) + 8 * i)))
        {
          uint64_t v13 = [(UIDocumentInteractionController *)self previewControllerItem];
          int v12 = _UIQLCanPreviewItem(v13) ^ 1;

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v12) = 1;
LABEL_11:

  return v12;
}

- (id)_defaultApplication
{
  if ([(UIDocumentInteractionController *)self _shouldReturnDefaultApplication])
  {
    uint64_t v3 = [(UIDocumentInteractionController *)self _preferredApplicationForDocumentOpening];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)_dismissEverythingWithExtremePrejudiceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ((_UIAppUseModernRotationAndPresentationBehaviors() & 1) != 0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceIdiom],
        v5,
        (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    id v7 = [(UIDocumentInteractionController *)self activityViewController];
    [v7 dismissViewControllerAnimated:v3 completion:0];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__UIDocumentInteractionController__dismissEverythingWithExtremePrejudiceAnimated___block_invoke;
    block[3] = &unk_1E5A21CD0;
    block[4] = self;
    BOOL v9 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __82__UIDocumentInteractionController__dismissEverythingWithExtremePrejudiceAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) popoverController];
  [v2 dismissPopoverAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isArchive
{
  BOOL v3 = [(UIDocumentInteractionController *)self URL];
  uint64_t v4 = [v3 path];
  id v5 = [v4 lastPathComponent];
  if ([(UIDocumentInteractionController *)self _isFilenameValidForDecompressing:v5 allowsPreviewingArchive:1])
  {
    uint64_t v6 = [(UIDocumentInteractionController *)self URL];
    BOOL v7 = ![(UIDocumentInteractionController *)self _isPackageArchive:v6];
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)extractSubitemFromArchive:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__UIDocumentInteractionController_extractSubitemFromArchive_completion___block_invoke;
  v10[3] = &unk_1E5A23350;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(UIDocumentInteractionController *)self __decompressArchiveAndSetupPayload:a3 completion:v10];

  return v8;
}

uint64_t __72__UIDocumentInteractionController_extractSubitemFromArchive_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (QLPreviewController)previewController
{
  previewController = self->_previewController;
  if (!previewController)
  {
    uint64_t v4 = (QLPreviewController *)objc_alloc_init(_UIQLPreviewControllerClass());
    id v5 = self->_previewController;
    self->_previewController = v4;

    [(QLPreviewController *)self->_previewController setDelegate:self];
    previewController = self->_previewController;
  }
  return previewController;
}

- (_UIDICPreviewItem)previewControllerItem
{
  previewControllerItem = self->_previewControllerItem;
  if (!previewControllerItem)
  {
    uint64_t v4 = objc_alloc_init(_UIDICPreviewItem);
    id v5 = self->_previewControllerItem;
    self->_previewControllerItem = v4;

    previewControllerItem = self->_previewControllerItem;
  }
  return previewControllerItem;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  *a5 = self->_presentView;
  double x = self->_presentRect.origin.x;
  double y = self->_presentRect.origin.y;
  double width = self->_presentRect.size.width;
  double height = self->_presentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)previewControllerDidDismiss:(id)a3
{
  BOOL v3 = self;
  uint64_t v4 = v3;
  if ((*(unsigned char *)&v3->_documentInteractionControllerFlags & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v3->_delegate);
    [WeakRetained documentInteractionControllerDidEndPreview:v4];
  }
  presentingViewController = v4->_presentingViewController;
  v4->_presentingViewController = 0;

  previewController = v4->_previewController;
  v4->_previewController = 0;
}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 2) & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [WeakRetained documentInteractionControllerTransitionImageForPreview:self contentRect:a5];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)previewController:(id)a3 canEditItem:(id)a4
{
  id v5 = a3;
  if ([(UIDocumentInteractionController *)self previewsPresentWithMarkup])
  {
    id v6 = [(UIDocumentInteractionController *)self dismissActionsForPreviewController:v5];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4
{
  return 0;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(UIDocumentInteractionController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIDocumentInteractionController *)self delegate];
    BOOL v7 = [v6 documentInteractionControllerMarkupDismissActions:self];

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          Class v14 = _UIQLDismissActionClass();
          long long v15 = [v13 title];
          long long v16 = [v13 image];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __70__UIDocumentInteractionController_dismissActionsForPreviewController___block_invoke;
          v21[3] = &unk_1E5A23378;
          v21[4] = v13;
          long long v17 = [(objc_class *)v14 actionWithTitle:v15 image:v16 handler:v21];

          [v8 addObject:v17];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    if ([v8 count]) {
      id v18 = v8;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  return v18;
}

void __70__UIDocumentInteractionController_dismissActionsForPreviewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [*(id *)(a1 + 32) completionHandler];

  if (v5)
  {
    uint64_t v21 = a1;
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
          uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
          Class v14 = [v12 editedFileURL];

          if (v14)
          {
            long long v15 = [v12 editedFileURL];
            [v13 setObject:v15 forKeyedSubscript:@"UIDocumentInteractionControllerResultModifiedURL"];
          }
          long long v16 = [v12 item];
          long long v17 = [v16 previewItemURL];

          if (v17)
          {
            id v18 = [v12 item];
            v19 = [v18 previewItemURL];
            [v13 setObject:v19 forKeyedSubscript:@"UIDocumentInteractionControllerResultOriginalURL"];
          }
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    int v20 = [*(id *)(v21 + 32) completionHandler];
    ((void (**)(void, void, void *))v20)[2](v20, *(void *)(v21 + 32), v6);

    id v4 = v22;
  }
}

- (void)markupAction:(id)a3
{
  id v4 = [(UIDocumentInteractionController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = [(UIDocumentInteractionController *)self delegate];
    previewController = self->_previewController;
    id v7 = [(QLPreviewController *)previewController currentPreviewItem];
    uint64_t v8 = [v7 previewItemURL];
    [v9 previewController:previewController willMarkUpAtURL:v8];
  }
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v3 = [WeakRetained excludedActivityTypesForDocumentInteractionController:self];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)additionalActivitiesTypesForPreviewController:(id)a3
{
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v3 = [WeakRetained additionalActivitiesForDocumentInteractionController:self];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (BOOL)_canPreviewDecompressedArchive
{
  BOOL v3 = [(UIDocumentInteractionController *)self URL];
  id v4 = [v3 path];

  if ([(UIDocumentInteractionController *)self _isFilenameValidForDecompressing:v4 allowsPreviewingArchive:0])
  {
    id v5 = [v4 stringByDeletingPathExtension];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;
  id v7 = [(UIDocumentInteractionController *)self previewControllerItem];
  uint64_t v8 = objc_msgSend(v7, "_primitive_previewItemContentType");

  if (!v8)
  {
    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    uint64_t v8 = _UIQLPreviewUTIForURLAndMimeType(v9, 0);
  }
  char v10 = _UIQLCanPreviewContentWithUTI(v8);

  return v10;
}

- (void)_clearPreviousPresentationContext
{
  presentView = self->_presentView;
  self->_presentView = 0;

  presentItem = self->_presentItem;
  self->_presentItem = 0;
}

- (BOOL)_presentOptionsMenuAnimated:(BOOL)a3 willPresentBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(UIDocumentInteractionController *)self _clearPreviousPresentationContext];
  if ([(UIDocumentInteractionController *)self _shouldAutoDecompressIfArchive])
  {
    id location = 0;
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__UIDocumentInteractionController__presentOptionsMenuAnimated_willPresentBlock___block_invoke;
    v8[3] = &unk_1E5A233A0;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    BOOL v11 = v4;
    [(UIDocumentInteractionController *)self _decompressArchiveAndSetupPayload:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if ([(UIDocumentInteractionController *)self _setupForOptionsMenu])
  {
    (*((void (**)(id, UIDocumentInteractionController *))v6 + 2))(v6, self);
    _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(self, v4);
  }

  return 1;
}

uint64_t __80__UIDocumentInteractionController__presentOptionsMenuAnimated_willPresentBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2)
  {
    id v7 = WeakRetained;
    id WeakRetained = (id)[WeakRetained _setupForOptionsMenu];
    id v5 = v7;
    if (WeakRetained)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(v7, *(unsigned __int8 *)(a1 + 48));
      id v5 = v7;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v5);
}

- (BOOL)presentOptionsMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
  BOOL v5 = animated;
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  BOOL v11 = view;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__UIDocumentInteractionController_presentOptionsMenuFromRect_inView_animated___block_invoke;
  v14[3] = &unk_1E5A233C8;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  long long v15 = v11;
  int v12 = v11;
  LOBYTE(v5) = [(UIDocumentInteractionController *)self _presentOptionsMenuAnimated:v5 willPresentBlock:v14];

  return v5;
}

__n128 __78__UIDocumentInteractionController_presentOptionsMenuFromRect_inView_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v2;
  objc_storeStrong((id *)(a2 + 72), *(id *)(a1 + 32));
  return result;
}

- (BOOL)presentOptionsMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v6 = item;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__UIDocumentInteractionController_presentOptionsMenuFromBarButtonItem_animated___block_invoke;
  v9[3] = &unk_1E5A233F0;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(v4) = [(UIDocumentInteractionController *)self _presentOptionsMenuAnimated:v4 willPresentBlock:v9];

  return v4;
}

void __80__UIDocumentInteractionController_presentOptionsMenuFromBarButtonItem_animated___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)presentingNavigationController
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    presentingViewController = self->_presentingViewController;
  }
  else {
    presentingViewController = 0;
  }
  return presentingViewController;
}

- (BOOL)presentPreviewAnimated:(BOOL)animated
{
  BOOL v3 = animated;
  BOOL v5 = [(UIDocumentInteractionController *)self previewController];
  [v5 setAdditionalRightBarButtonItems:MEMORY[0x1E4F1CBF0]];

  return [(UIDocumentInteractionController *)self __presentPreviewAnimated:v3];
}

- (BOOL)__presentPreviewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIDocumentInteractionController *)self _setupPreviewController];
  if (v5)
  {
    id v6 = [(UIDocumentInteractionController *)self previewController];
    _UIShimSetIsContentManaged(v6, [(UIDocumentInteractionController *)self isContentManaged]);

    id v7 = [(UIDocumentInteractionController *)self previewController];
    uint64_t v8 = [(UIDocumentInteractionController *)self previewControllerItem];
    [v7 presentPreviewItem:v8 onViewController:self->_presentingViewController withDelegate:self animated:v3];
  }
  return v5;
}

- (BOOL)_presentOpenInMenuAnimated:(BOOL)a3 willPresentBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(UIDocumentInteractionController *)self _clearPreviousPresentationContext];
  if ([(UIDocumentInteractionController *)self _shouldAutoDecompressIfArchive])
  {
    id location = 0;
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__UIDocumentInteractionController__presentOpenInMenuAnimated_willPresentBlock___block_invoke;
    v8[3] = &unk_1E5A233A0;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    BOOL v11 = v4;
    [(UIDocumentInteractionController *)self _decompressArchiveAndSetupPayload:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if ([(UIDocumentInteractionController *)self _setupForOpenInMenu])
  {
    (*((void (**)(id, UIDocumentInteractionController *))v6 + 2))(v6, self);
    _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(self, v4);
  }

  return 1;
}

uint64_t __79__UIDocumentInteractionController__presentOpenInMenuAnimated_willPresentBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2)
  {
    id v7 = WeakRetained;
    id WeakRetained = (id)[WeakRetained _setupForOpenInMenu];
    id v5 = v7;
    if (WeakRetained)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(v7, *(unsigned __int8 *)(a1 + 48));
      id v5 = v7;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v5);
}

- (BOOL)presentOpenInMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
  BOOL v5 = animated;
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  BOOL v11 = view;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__UIDocumentInteractionController_presentOpenInMenuFromRect_inView_animated___block_invoke;
  v14[3] = &unk_1E5A233C8;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  long long v15 = v11;
  int v12 = v11;
  LOBYTE(v5) = [(UIDocumentInteractionController *)self _presentOpenInMenuAnimated:v5 willPresentBlock:v14];

  return v5;
}

__n128 __77__UIDocumentInteractionController_presentOpenInMenuFromRect_inView_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v2;
  objc_storeStrong((id *)(a2 + 72), *(id *)(a1 + 32));
  return result;
}

- (BOOL)presentOpenInMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v6 = item;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__UIDocumentInteractionController_presentOpenInMenuFromBarButtonItem_animated___block_invoke;
  v9[3] = &unk_1E5A233F0;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(v4) = [(UIDocumentInteractionController *)self _presentOpenInMenuAnimated:v4 willPresentBlock:v9];

  return v4;
}

void __79__UIDocumentInteractionController_presentOpenInMenuFromBarButtonItem_animated___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)dismissPreviewAnimated:(BOOL)animated
{
  BOOL v3 = animated;
  id v4 = [(UIDocumentInteractionController *)self previewController];
  [v4 dismissModalViewControllerAnimated:v3];
}

- (void)dismissMenuAnimated:(BOOL)animated
{
  BOOL v3 = animated;
  if (![(_UIDICActivityViewController *)self->_activityViewController isPerformingActivity])
  {
    [(UIDocumentInteractionController *)self _dismissEverythingWithExtremePrejudiceAnimated:v3];
  }
}

- (void)_presentPreview:(id)a3
{
  id v5 = a3;
  if (![(UIDocumentInteractionController *)self presentPreviewAnimated:1])
  {
    id v4 = [v5 view];
    [v4 bounds];
    -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](self, "presentOptionsMenuFromRect:inView:animated:", v4, 1);
  }
}

- (void)_presentOptionsMenu:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1)
  {
    id v4 = [v5 view];
    [v4 bounds];
    -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](self, "presentOptionsMenuFromRect:inView:animated:", v4, 1);
  }
}

- (void)openDocumentWithDefaultApplication
{
  id v3 = [(UIDocumentInteractionController *)self _preferredApplicationForDocumentOpening];
  [(UIDocumentInteractionController *)self _openDocumentWithApplication:v3];
}

- (void)_openDocumentWithApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDocumentInteractionController *)self URL];
  char CanOpenInPlaceByReferenceOriginalFile = _UIApplicationCanOpenInPlaceByReferenceOriginalFile(v4, v5);

  BOOL v7 = [(UIDocumentInteractionController *)self _shouldAutoDecompressIfArchive];
  id location = 0;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke;
  v13[3] = &unk_1E5A23418;
  objc_copyWeak(&v15, &location);
  char v16 = CanOpenInPlaceByReferenceOriginalFile;
  id v8 = v4;
  id v14 = v8;
  id v9 = (void (**)(void))MEMORY[0x1A6229A90](v13);
  id v10 = v9;
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke_2;
    v11[3] = &unk_1E5A23350;
    int v12 = v9;
    [(UIDocumentInteractionController *)self _decompressArchiveAndSetupPayload:v11];
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = WeakRetained;
  if (*(unsigned char *)(a1 + 48)) {
    objc_msgSend(WeakRetained, "__openUsingInPlaceMechanismToTransferDocumentToApplication:", v3);
  }
  else {
    objc_msgSend(WeakRetained, "__openUsingDefaultCopyMechanismToTransferDocumentToApplication:", v3);
  }
}

uint64_t __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)__openUsingDefaultCopyMechanismToTransferDocumentToApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationIdentifier];
  [(UIDocumentInteractionController *)self _invokeDelegateWillBeginOpenWithApplicationIdentifier:v5];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v7 = [(UIDocumentInteractionController *)self URL];
  BOOL CanOpenInPlaceByCopyingFromOriginalFile = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(v4, v7);

  if (CanOpenInPlaceByCopyingFromOriginalFile)
  {
    id v9 = [(UIDocumentInteractionController *)self URL];
    id v13 = 0;
    id v10 = objc_msgSend(v9, "ui_bookmarkForExportWithError:", &v13);
    id v11 = v13;
    [v6 setValue:v10 forKey:*MEMORY[0x1E4F22340]];

    [v6 setValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F22378]];
    [(UIDocumentInteractionController *)self __performLaunchServiceDocumentOpenWithApplication:v4 launchServiceOptions:v6];
    int v12 = [v4 applicationIdentifier];
    [(UIDocumentInteractionController *)self _invokeDelegateDidFinishOpenWithApplicationIdentifier:v12];
  }
  else
  {
    [(UIDocumentInteractionController *)self __performLaunchServiceDocumentOpenWithApplication:v4 launchServiceOptions:v6];
  }
}

- (void)__openUsingInPlaceMechanismToTransferDocumentToApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationIdentifier];
  [(UIDocumentInteractionController *)self _invokeDelegateWillBeginOpenWithApplicationIdentifier:v5];
  id v6 = [(UIDocumentInteractionController *)self URL];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke;
  v10[3] = &unk_1E5A23468;
  void v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  BOOL v7 = (void (*)(uint64_t, uint64_t, void *))softLinkFPExtendBookmarkForDocumentURL;
  id v8 = v5;
  id v9 = v4;
  v7((uint64_t)v6, (uint64_t)v8, v10);
}

void __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 copy];
  id v4 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_2;
  v8[3] = &unk_1E5A23440;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_2(uint64_t a1)
{
  long long v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setValue:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4F22340]];
  [v2 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F22378]];
  objc_msgSend(*(id *)(a1 + 40), "__performLaunchServiceDocumentOpenWithApplication:launchServiceOptions:", *(void *)(a1 + 48), v2);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_3;
  v3[3] = &unk_1E5A215A0;
  v3[4] = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invokeDelegateDidFinishOpenWithApplicationIdentifier:*(void *)(a1 + 40)];
}

- (void)__performLaunchServiceDocumentOpenWithApplication:(id)a3 launchServiceOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIDocumentInteractionController *)self annotation];
  id v9 = [v6 applicationIdentifier];
  uint64_t v10 = [(UIDocumentInteractionController *)self URL];
  decompressedArchiveDocumentURL = self->_decompressedArchiveDocumentURL;
  if (decompressedArchiveDocumentURL)
  {
    id v12 = decompressedArchiveDocumentURL;
LABEL_5:
    id v15 = v12;

    uint64_t v10 = v15;
    goto LABEL_6;
  }
  id v13 = [(UIDocumentInteractionController *)self URL];
  BOOL CanOpenInPlaceByCopyingFromOriginalFile = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(v6, v13);

  if (CanOpenInPlaceByCopyingFromOriginalFile)
  {
    id v12 = [(UIDocumentInteractionController *)self physicalURL];
    goto LABEL_5;
  }
LABEL_6:
  char v16 = _UIActivityDefaultOpenApplicationLaunchServiceOptions();
  CGFloat v17 = (void *)[v16 mutableCopy];

  [v17 addEntriesFromDictionary:v7];
  memset(v20, 0, sizeof(v20));
  _SharingUIAuditTokenForCurrentProcess((uint64_t)v20);
  CGFloat v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  CGFloat v19 = [v18 operationToOpenResource:v10 usingApplication:v9 uniqueDocumentIdentifier:self->_uniqueIdentifier isContentManaged:self->_isContentManaged sourceAuditToken:v20 userInfo:v8 options:v17 delegate:self];

  objc_setAssociatedObject(v19, "_UIDICLaunchApplicationOperationTargetApplicationIdentifierProperty", v9, (void *)0x303);
  [v19 start];
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__UIDocumentInteractionController_openResourceOperation_didFinishCopyingResource___block_invoke;
  v7[3] = &unk_1E5A215A0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __82__UIDocumentInteractionController_openResourceOperation_didFinishCopyingResource___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 109) & 4) != 0)
  {
    objc_getAssociatedObject(*(id *)(a1 + 40), "_UIDICLaunchApplicationOperationTargetApplicationIdentifierProperty");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) _invokeDelegateDidFinishOpenWithApplicationIdentifier:v2];
  }
}

- (id)_preferredApplicationForDocumentOpening
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__4;
  id v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  id v2 = [(UIDocumentInteractionController *)self _appOpeningDocumentProxy];
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];

  v15[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__UIDocumentInteractionController__preferredApplicationForDocumentOpening__block_invoke;
  v8[3] = &unk_1E5A23490;
  void v8[4] = &v9;
  _UIEnumerateApplicationsInPreferredOrderForOpeningDocument(v2, v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __74__UIDocumentInteractionController__preferredApplicationForDocumentOpening__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

- (id)_appOpeningDocumentProxy
{
  uint64_t v3 = [(UIDocumentInteractionController *)self URL];

  if (v3)
  {
    id v4 = [(UIDocumentInteractionController *)self physicalURL];
    id v5 = [(UIDocumentInteractionController *)self _documentProxyWithIsContentManaged:self->_isContentManaged usingURL:v4];
  }
  else
  {
    id v5 = [(UIDocumentInteractionController *)self _documentProxy];
  }
  return v5;
}

- (id)physicalURL
{
  uint64_t v3 = [(UIDocumentInteractionController *)self URL];
  uint64_t v4 = [(UIDocumentInteractionController *)self URL];
  id v5 = (void *)_CFURLPromiseCopyPhysicalURL();

  id v6 = [(UIDocumentInteractionController *)self URL];
  LOBYTE(v4) = [v6 isEqual:v5];

  if ((v4 & 1) == 0 && v5)
  {
    id v7 = v5;

    uint64_t v3 = v7;
  }

  return v3;
}

- (void)_invokeDelegateWillBeginOpenWithApplicationIdentifier:(id)a3
{
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 2) != 0)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained documentInteractionController:self willBeginSendingToApplication:v5];
  }
}

- (void)_invokeDelegateDidFinishOpenWithApplicationIdentifier:(id)a3
{
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 4) != 0)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained documentInteractionController:self didEndSendingToApplication:v5];
  }
}

- (id)_preparedActivityViewControllerWithItems:(id)a3 activities:(id)a4 options:(unint64_t)a5
{
  unint64_t v7 = self->_isContentManaged | a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[_UIDICActivityViewController alloc] initWithActivityItems:v9 applicationActivities:v8 options:v7];

  [(_UIDICActivityViewController *)v10 setDocumentInteractionActivityDelegate:self];
  [(UIDocumentInteractionController *)self setActivityViewController:v10];
  return v10;
}

- (BOOL)_setupForOptionsMenu
{
  v39[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [(UIDocumentInteractionController *)self _fixupFileExtensionIfNeeded];
  if ([(UIDocumentInteractionController *)self _shouldIncludePreviewActivity])
  {
    id v4 = [(UIDocumentInteractionController *)self _newPreviewActivity];
    [v3 addObject:v4];
  }
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained additionalActivitiesForDocumentInteractionController:self];

    if ([v6 count]) {
      [v3 addObjectsFromArray:v6];
    }
  }
  uint64_t v7 = 0;
  v39[0] = sel_print_;
  v39[1] = sel_copy_;
  v39[2] = sel_saveToCameraRoll_;
  do
  {
    id v8 = [(UIDocumentInteractionController *)self _newActivityIfNecessaryForLegacyActionDelegatingWithAction:v39[v7]];
    if (v8) {
      [v3 addObject:v8];
    }

    ++v7;
  }
  while (v7 != 3);
  id v35 = 0;
  objc_initWeak(&v35, self);
  id v9 = [_UIDICActivityItemProvider alloc];
  uint64_t v10 = [(UIDocumentInteractionController *)self URL];
  uint64_t v11 = [(_UIDICActivityItemProvider *)v9 initWithPlaceholderItem:v10 documentInteractionController:self];

  id v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x80) != 0)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    id v13 = [v14 activityItemForDocumentInteractionController:self];

    if (v13)
    {
      id v15 = share_sheet_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v13;
        _os_log_impl(&dword_1A0AD8000, v15, OS_LOG_TYPE_DEFAULT, "delegateProvidedActivityItem: %@", buf, 0xCu);
      }

      [v12 removeAllObjects];
      [v12 addObject:v13];
    }
  }
  else
  {
    id v13 = 0;
  }
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 2) & 1) != 0
    && (id v16 = objc_loadWeakRetained((id *)&self->_delegate),
        [v16 printInfoForDocumentInteractionController:self],
        CGFloat v17 = objc_claimAutoreleasedReturnValue(),
        v16,
        v17))
  {
    [v12 addObject:v17];
  }
  else
  {
    CGFloat v18 = [MEMORY[0x1E4F934A8] printInfo];
    CGFloat v19 = [(UIDocumentInteractionController *)self name];
    [v18 setJobName:v19];

    objc_msgSend(v18, "setOutputType:", -[UIDocumentInteractionController _isImage](self, "_isImage"));
    [v12 addObject:v18];

    CGFloat v17 = 0;
  }
  int v20 = [(UIDocumentInteractionController *)self _preparedActivityViewControllerWithItems:v12 activities:v3 options:0];
  uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x20) != 0)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    long long v23 = [v22 excludedActivityTypesForDocumentInteractionController:self];
    [v21 addObjectsFromArray:v23];
  }
  if ([(UIDocumentInteractionController *)self _delegateImplementsLegacyActions])
  {
    v36[0] = @"com.apple.UIKit.activity.SaveToCameraRoll";
    v36[1] = @"com.apple.UIKit.activity.Print";
    v36[2] = @"com.apple.UIKit.activity.CopyToPasteboard";
    long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    [v21 addObjectsFromArray:v24];
  }
  long long v25 = share_sheet_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v21;
    _os_log_impl(&dword_1A0AD8000, v25, OS_LOG_TYPE_DEFAULT, "excludedActivityTypes: %@", buf, 0xCu);
  }

  [v20 setExcludedActivityTypes:v21];
  if ((_UIAppUseModernRotationAndPresentationBehaviors() & 1) == 0)
  {
    long long v26 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v27 = [v26 userInterfaceIdiom];

    if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(UIPopoverController *)self->_popoverController dismissPopoverAnimated:1];
      id v28 = objc_alloc(MEMORY[0x1E4FB1AF8]);
      v29 = [(UIDocumentInteractionController *)self activityViewController];
      v30 = (UIPopoverController *)[v28 initWithContentViewController:v29];
      popoverController = self->_popoverController;
      self->_popoverController = v30;

      [(UIPopoverController *)self->_popoverController setDelegate:self];
    }
  }
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  if ((*(unsigned char *)&documentInteractionControllerFlags & 0x20) != 0)
  {
    id v33 = objc_loadWeakRetained((id *)&self->_delegate);
    [v33 documentInteractionControllerWillPresentOptionsMenu:self];

    $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  }
  self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&documentInteractionControllerFlags & 0xFFF3FFFF | 0x40000);

  objc_destroyWeak(&v35);
  return 1;
}

- (BOOL)_setupForOpenInMenu
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [(UIDocumentInteractionController *)self _fixupFileExtensionIfNeeded];
  id v4 = [_UIDICActivityItemProvider alloc];
  id v5 = [(UIDocumentInteractionController *)self URL];
  id v6 = [(_UIDICActivityItemProvider *)v4 initWithPlaceholderItem:v5 documentInteractionController:self];

  v20[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v8 = [(UIDocumentInteractionController *)self _preparedActivityViewControllerWithItems:v7 activities:v3 options:2];

  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v10 = [WeakRetained excludedActivityTypesForDocumentInteractionController:self];
    [v8 setExcludedActivityTypes:v10];
  }
  if ((_UIAppUseModernRotationAndPresentationBehaviors() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(UIPopoverController *)self->_popoverController dismissPopoverAnimated:1];
      id v13 = objc_alloc(MEMORY[0x1E4FB1AF8]);
      id v14 = [(UIDocumentInteractionController *)self activityViewController];
      id v15 = (UIPopoverController *)[v13 initWithContentViewController:v14];
      popoverController = self->_popoverController;
      self->_popoverController = v15;

      [(UIPopoverController *)self->_popoverController setDelegate:self];
    }
  }
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  if ((*(unsigned char *)&documentInteractionControllerFlags & 0x80) != 0)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 documentInteractionControllerWillPresentOpenInMenu:self];

    $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  }
  self->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&documentInteractionControllerFlags & 0xFFF3FFFF | 0x80000);

  return 1;
}

- (BOOL)_setupPreviewController
{
  [(UIDocumentInteractionController *)self _fixupFileExtensionIfNeeded];
  uint64_t v3 = [(UIDocumentInteractionController *)self previewControllerItem];
  int v4 = _UIQLCanPreviewItem(v3);

  if (v4)
  {
    id v29 = 0;
    BOOL v5 = [(UIDocumentInteractionController *)self _delegateExistsAndImplementsRequiredMethods:&v29];
    id v6 = v29;
    uint64_t v7 = v6;
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v9 = [WeakRetained documentInteractionControllerViewControllerForPreview:self];
      presentingViewController = self->_presentingViewController;
      self->_presentingViewController = v9;

      presentView = self->_presentView;
      self->_presentView = 0;

      if ((*(unsigned char *)&self->_documentInteractionControllerFlags & 4) != 0)
      {
        id v12 = objc_loadWeakRetained((id *)&self->_delegate);
        id v13 = [v12 documentInteractionControllerViewForPreview:self];
        id v14 = self->_presentView;
        self->_presentView = v13;
      }
      CGSize v15 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_presentRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_presentRect.size = v15;
      id v16 = self->_presentView;
      if (v16)
      {
        if ((*(unsigned char *)&self->_documentInteractionControllerFlags & 2) != 0)
        {
          id v22 = objc_loadWeakRetained((id *)&self->_delegate);
          [v22 documentInteractionControllerRectForPreview:self];
          self->_presentRect.origin.CGFloat x = v23;
          self->_presentRect.origin.CGFloat y = v24;
          self->_presentRect.size.CGFloat width = v25;
          self->_presentRect.size.CGFloat height = v26;
        }
        else
        {
          [(UIView *)v16 bounds];
          self->_presentRect.origin.CGFloat x = v17;
          self->_presentRect.origin.CGFloat y = v18;
          self->_presentRect.size.CGFloat width = v19;
          self->_presentRect.size.CGFloat height = v20;
        }
      }
      presentItem = self->_presentItem;
      self->_presentItem = 0;

      if ((*(unsigned char *)&self->_documentInteractionControllerFlags & 8) == 0)
      {
        LOBYTE(v5) = 1;
        goto LABEL_18;
      }
      uint64_t v21 = objc_loadWeakRetained((id *)&self->_delegate);
      [v21 documentInteractionControllerWillBeginPreview:self];
    }
    else
    {
      if (!v6)
      {
        LOBYTE(v5) = 0;
LABEL_18:

        return v5;
      }
      uint64_t v21 = share_sheet_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        [(UIDocumentInteractionController *)(uint64_t)v7 _setupPreviewController];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)_shouldIncludePreviewActivity
{
  if ((*(unsigned char *)&self->_documentInteractionControllerFlags & 1) == 0) {
    return 0;
  }
  uint64_t v3 = [(UIDocumentInteractionController *)self previewControllerItem];
  char v4 = _UIQLCanPreviewItem(v3);

  return v4;
}

- (id)_newPreviewActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = +[_UIDICActionActivity newPreviewActionActivity];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__UIDocumentInteractionController__newPreviewActivity__block_invoke;
  v4[3] = &unk_1E5A234B8;
  objc_copyWeak(&v5, &location);
  [v2 setActivityFinishedPerformingHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __54__UIDocumentInteractionController__newPreviewActivity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentPreviewAnimated:1];
}

- (BOOL)_shouldIncludeActivityForLegacyDelegatingWithAction:(SEL)a3
{
  BOOL v5 = [(UIDocumentInteractionController *)self _delegateImplementsLegacyActions];
  if (v5)
  {
    LOBYTE(v5) = [(UIDocumentInteractionController *)self _delegateCanPerformAction:a3];
  }
  return v5;
}

- (id)_newActivityIfNecessaryForLegacyActionDelegatingWithAction:(SEL)a3
{
  if (-[UIDocumentInteractionController _shouldIncludeActivityForLegacyDelegatingWithAction:](self, "_shouldIncludeActivityForLegacyDelegatingWithAction:"))
  {
    if (sel_print_ == a3)
    {
      id v6 = +[_UIDICActionActivity newLegacyDelegationActionActivityForPrint];
    }
    else if (sel_copy_ == a3)
    {
      id v6 = +[_UIDICActionActivity newLegacyDelegationActionActivityForCopy];
    }
    else
    {
      if (sel_saveToCameraRoll_ != a3)
      {
        BOOL v5 = 0;
LABEL_11:
        id location = 0;
        objc_initWeak(&location, self);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __94__UIDocumentInteractionController__newActivityIfNecessaryForLegacyActionDelegatingWithAction___block_invoke;
        v8[3] = &unk_1E5A234E0;
        objc_copyWeak(v9, &location);
        v9[1] = (id)a3;
        [v5 setActivityPerformingHandler:v8];
        objc_destroyWeak(v9);
        objc_destroyWeak(&location);
        return v5;
      }
      id v6 = +[_UIDICActionActivity newLegacyDelegationActionActivityForSaveToCameraRoll];
    }
    BOOL v5 = v6;
    goto LABEL_11;
  }
  return 0;
}

uint64_t __94__UIDocumentInteractionController__newActivityIfNecessaryForLegacyActionDelegatingWithAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _delegatePerformAction:*(void *)(a1 + 40)];

  return v3;
}

- (void)setShouldUnzipDocument:(BOOL)a3
{
  if (self->_shouldDecompressArchiveIfNecessary != a3)
  {
    self->_shouldDecompressArchiveIfNecessarCGFloat y = a3;
    [(UIDocumentInteractionController *)self _invalidate];
  }
}

- (BOOL)shouldUnzipDocument
{
  return self->_shouldDecompressArchiveIfNecessary;
}

+ (id)_archiveDecompressQueue
{
  if (_archiveDecompressQueue_onceToken != -1) {
    dispatch_once(&_archiveDecompressQueue_onceToken, &__block_literal_global_38);
  }
  id v2 = (void *)_archiveDecompressQueue_theQueue;
  return v2;
}

uint64_t __58__UIDocumentInteractionController__archiveDecompressQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_archiveDecompressQueue_theQueue;
  _archiveDecompressQueue_theQueue = (uint64_t)v0;

  [(id)_archiveDecompressQueue_theQueue setMaxConcurrentOperationCount:1];
  id v2 = (void *)_archiveDecompressQueue_theQueue;
  return [v2 setName:@"com.apple.archiveDecompressQueue"];
}

- (unint64_t)_archiveExtractionOptions
{
  return self->_excludeDotFilesFromArchiveListings;
}

- (id)_pathsInArchive:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIDocumentInteractionController *)self URL];
  unint64_t v6 = [(UIDocumentInteractionController *)self _archiveExtractionOptions];
  uint64_t v7 = (void *)MEMORY[0x1E4F28B48];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__UIDocumentInteractionController__pathsInArchive___block_invoke;
  v13[3] = &unk_1E5A225A0;
  id v14 = v5;
  id v15 = v4;
  unint64_t v16 = v6;
  id v8 = v4;
  id v9 = v5;
  uint64_t v10 = [v7 blockOperationWithBlock:v13];
  uint64_t v11 = +[UIDocumentInteractionController _archiveDecompressQueue];
  [v11 addOperation:v10];

  return v10;
}

void __51__UIDocumentInteractionController__pathsInArchive___block_invoke(uint64_t a1)
{
}

- (id)__decompressArchiveAndSetupPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIDocumentInteractionController *)self URL];
  unint64_t v9 = [(UIDocumentInteractionController *)self _archiveExtractionOptions];
  uint64_t v10 = (void *)MEMORY[0x1E4F28B48];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__UIDocumentInteractionController___decompressArchiveAndSetupPayload_completion___block_invoke;
  v17[3] = &unk_1E5A23508;
  id v18 = v8;
  id v19 = v6;
  CGFloat v20 = self;
  id v21 = v7;
  unint64_t v22 = v9;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  id v14 = [v10 blockOperationWithBlock:v17];
  id v15 = +[UIDocumentInteractionController _archiveDecompressQueue];
  [v15 addOperation:v14];

  return v14;
}

void __81__UIDocumentInteractionController___decompressArchiveAndSetupPayload_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) _customExtactionRootURL];
  _UIDICArchiveExtractArchiveSubpathToRoot(v2, v3, v4, *(void **)(a1 + 56), *(void *)(a1 + 64));
}

- (void)_decompressArchiveAndSetupPayload:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__4;
  void v11[4] = __Block_byref_object_dispose__4;
  id v12 = 0;
  BOOL v5 = self;
  id v12 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke;
  v8[3] = &unk_1E5A23558;
  uint64_t v10 = v11;
  id v6 = v4;
  id v9 = v6;
  id v7 = [(UIDocumentInteractionController *)v5 __decompressArchiveAndSetupPayload:0 completion:v8];

  _Block_object_dispose(v11, 8);
}

void __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setURL:v7];
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) previewControllerItem];
    [v10 setURLToDeleteOnDealloc:v8];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke_2;
  v15[3] = &unk_1E5A23530;
  id v11 = *(id *)(a1 + 32);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

uint64_t __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_setDecompressedArchiveDocumentURL:(id)a3
{
  id v6 = (NSURL *)a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if (v5->_decompressedArchiveDocumentURL != v6) {
    objc_storeStrong((id *)&v5->_decompressedArchiveDocumentURL, a3);
  }
  objc_sync_exit(v5);
}

- (id)_decompressedArchiveDocumentURL
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_decompressedArchiveDocumentURL;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_shouldAutoDecompressIfArchive
{
  if (!self->_shouldDecompressArchiveIfNecessary) {
    return 0;
  }
  id v2 = self;
  uint64_t v3 = [(UIDocumentInteractionController *)self URL];
  id v4 = [v3 lastPathComponent];
  LOBYTE(v2) = [(UIDocumentInteractionController *)v2 _isFilenameValidForDecompressing:v4 allowsPreviewingArchive:0];

  return (char)v2;
}

- (BOOL)_shouldAutoDecompressIfArchiveForPreview
{
  if (!self->_shouldDecompressArchiveIfNecessary) {
    return 0;
  }
  id v2 = self;
  uint64_t v3 = [(UIDocumentInteractionController *)self URL];
  id v4 = [v3 lastPathComponent];
  LOBYTE(v2) = [(UIDocumentInteractionController *)v2 _isFilenameValidForDecompressing:v4 allowsPreviewingArchive:1];

  return (char)v2;
}

- (BOOL)_documentNeedsHelpDecompressingArchiveForPreview
{
  id v2 = [(UIDocumentInteractionController *)self URL];
  char v3 = _UIQLPreviewNeedsHelpDecompressingURL(v2);

  return v3;
}

- (BOOL)_isPackageArchive:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 lastPathComponent];
  id v6 = [v5 stringByDeletingPathExtension];
  id v7 = [v6 pathExtension];

  uint64_t v23 = 0;
  CGFloat v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  BOOL v8 = [(UIDocumentInteractionController *)self _isFilenameValidForDecompressing:v5 allowsPreviewingArchive:0];
  if (v7) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9 && ([(__CFString *)v7 isEqualToString:&stru_1EF308000] & 1) == 0)
  {
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F224F8];
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v7, (CFStringRef)*MEMORY[0x1E4F225A0]);
    CFStringRef v12 = PreferredIdentifierForTag;
    id v13 = (CFStringRef *)MEMORY[0x1E4F22680];
    if (PreferredIdentifierForTag)
    {
      BOOL v14 = UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E4F22680]) != 0;
      *((unsigned char *)v24 + 24) = v14;
      CFRelease(v12);
    }
    if (*((unsigned char *)v24 + 24))
    {
      CFStringRef v15 = UTTypeCreatePreferredIdentifierForTag(v10, v7, 0);
      CFStringRef v16 = v15;
      if (v15)
      {
        if (!UTTypeConformsTo(v15, *v13))
        {
          *((unsigned char *)v24 + 24) = 0;
          char v17 = [(UIDocumentInteractionController *)self _archiveExtractionOptions];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          void v20[2] = __53__UIDocumentInteractionController__isPackageArchive___block_invoke;
          v20[3] = &unk_1E5A23580;
          id v21 = v7;
          unint64_t v22 = &v23;
          _UIDICArchiveEnumerateFilePaths(v4, v20, v17);
        }
        CFRelease(v16);
      }
    }
  }
  char v18 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __53__UIDocumentInteractionController__isPackageArchive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "stringByDeletingLastPathComponent", (void)v11);
        BOOL v9 = [v8 pathExtension];
        int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

        if (v10)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)_isFilenameValidForDecompressing:(id)a3 allowsPreviewingArchive:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 pathExtension];
  if (_UIIsArchiveExtension(v7))
  {
    BOOL v8 = _UIStringByDeletingArchiveExtensions(v6);
    BOOL v9 = [v8 pathExtension];
    int v10 = [(UIDocumentInteractionController *)self previewControllerItem];
    CFStringRef v11 = [v10 previewItemContentType];

    if (!a4
      && UTTypeConformsTo(v11, (CFStringRef)*MEMORY[0x1E4F22530])
      && ([v9 isEqualToString:&stru_1EF308000] & 1) != 0)
    {
      BOOL v12 = 0;
      if (!v11) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v12 = 1;
      if (!v11)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    CFRelease(v11);
    goto LABEL_10;
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_isValidURL:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 path];

  LOBYTE(v4) = [v5 isWritableFileAtPath:v6];
  return (char)v4;
}

- (BOOL)_canSaveToCameraRollForType
{
  CFStringRef v2 = [(UIDocumentInteractionController *)self UTI];
  if (!UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22660]))
  {
    BOOL v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F225F8]) != 0;
    if (!v2) {
      return v3;
    }
    goto LABEL_3;
  }
  BOOL v3 = 1;
  if (v2) {
LABEL_3:
  }
    CFRelease(v2);
  return v3;
}

- (BOOL)_delegateImplementsLegacyActions
{
  return (*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x18) != 0;
}

- (BOOL)_delegateCanPerformAction:(SEL)a3
{
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 8) == 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = [WeakRetained documentInteractionController:self canPerformAction:a3];

  return (char)a3;
}

- (BOOL)_delegatePerformAction:(SEL)a3
{
  if ((*((unsigned char *)&self->_documentInteractionControllerFlags + 1) & 0x10) == 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = [WeakRetained documentInteractionController:self performAction:a3];

  return (char)a3;
}

- (void)popoverController:(id)a3 animationCompleted:(int64_t)a4
{
  id v6 = [(UIDocumentInteractionController *)self delegate];
  if (a4 == 1)
  {
    id v10 = v6;
    id v7 = self;
    $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
    if ((*(_DWORD *)&documentInteractionControllerFlags & 0x80000) != 0)
    {
      if ((*(_WORD *)&documentInteractionControllerFlags & 0x100) != 0)
      {
        [v10 documentInteractionControllerDidDismissOpenInMenu:v7];
        $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
      }
      unsigned int v9 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFF7FFFF;
      id v6 = v10;
    }
    else
    {
      id v6 = v10;
      if ((*(_DWORD *)&documentInteractionControllerFlags & 0x40000) == 0) {
        goto LABEL_11;
      }
      if ((*(unsigned char *)&documentInteractionControllerFlags & 0x40) != 0)
      {
        [v10 documentInteractionControllerDidDismissOptionsMenu:v7];
        id v6 = v10;
        $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
      }
      unsigned int v9 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFFBFFFF;
    }
    v7->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)v9;
  }
LABEL_11:
}

- (void)activityViewController:(id)a3 openActivityWillBeginSendingToApplication:(id)a4
{
}

- (void)activityViewController:(id)a3 openActivityDidEndSendingToApplication:(id)a4
{
}

- (void)activityViewController:(id)a3 didFinishPresentingActivityType:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = self;
  BOOL v8 = v7;
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
  if ((*(_DWORD *)&documentInteractionControllerFlags & 0x80000) != 0)
  {
    if ((*(_WORD *)&documentInteractionControllerFlags & 0x100) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
      [WeakRetained documentInteractionControllerDidDismissOpenInMenu:v8];

      $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = v8->_documentInteractionControllerFlags;
    }
    unsigned int v11 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFF7FFFF;
  }
  else
  {
    if ((*(_DWORD *)&documentInteractionControllerFlags & 0x40000) == 0) {
      goto LABEL_10;
    }
    if ((*(unsigned char *)&documentInteractionControllerFlags & 0x40) != 0)
    {
      id v10 = objc_loadWeakRetained((id *)&v7->_delegate);
      [v10 documentInteractionControllerDidDismissOptionsMenu:v8];

      $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = v8->_documentInteractionControllerFlags;
    }
    unsigned int v11 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFFBFFFF;
  }
  v8->_$96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)v11;
LABEL_10:
}

- (void)activityViewController:(id)a3 didFinishPerformingActivityType:(id)a4 completed:(BOOL)a5 items:(id)a6 error:(id)a7
{
  completionWithItemsHandler = (void (**)(id, id, BOOL, id, id))self->_completionWithItemsHandler;
  if (completionWithItemsHandler)
  {
    completionWithItemsHandler[2](completionWithItemsHandler, a4, a5, a6, a7);
    id v9 = self->_completionWithItemsHandler;
    self->_completionWithItemsHandler = 0;
  }
}

- (void)_fixupFileExtensionIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "ERROR: Couldn't create temporary folder at: %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (id)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)annotation
{
}

- (id)_completionWithItemsHandler
{
  return self->_completionWithItemsHandler;
}

- (void)_setCompletionWithItemsHandler:(id)a3
{
}

- (_UIDICActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)setPopoverController:(id)a3
{
}

- (NSURL)_customExtactionRootURL
{
  return self->__customExtactionRootURL;
}

- (void)_setCustomExtactionRootURL:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (BOOL)previewsPresentWithMarkup
{
  return self->_previewsPresentWithMarkup;
}

- (void)setPreviewsPresentWithMarkup:(BOOL)a3
{
  self->_previewsPresentWithMarkup = a3;
}

- (BOOL)excludeDotFilesFromArchiveListings
{
  return self->_excludeDotFilesFromArchiveListings;
}

- (void)setExcludeDotFilesFromArchiveListings:(BOOL)a3
{
  self->_excludeDotFilesFromArchiveListings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->__customExtactionRootURL, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong(&self->_completionWithItemsHandler, 0);
  objc_storeStrong(&self->_annotation, 0);
  objc_storeStrong((id *)&self->_previewControllerItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_decompressedArchiveDocumentURL, 0);
  objc_storeStrong((id *)&self->_tmpURLToDeleteOnDealloc, 0);
  objc_storeStrong((id *)&self->_presentItem, 0);
  objc_storeStrong((id *)&self->_presentView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

- (void)setDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "ERROR: UIDocumentInteractionControllerDelegate implements legacy action methods. Please remove them.", v1, 2u);
}

- (void)_setupPreviewController
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "ERROR: %@", (uint8_t *)&v2, 0xCu);
}

@end