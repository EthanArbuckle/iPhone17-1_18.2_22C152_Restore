@interface QLItem
+ (BOOL)contentTypeConformsToRTFD:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)contentTypesToPreviewTypes;
+ (id)customExtensionCommunicationEncodedClasses;
+ (id)encodedClasses;
+ (id)itemWithPreviewItem:(id)a3;
+ (id)rtfContentTypes;
+ (id)supportedContentTypeIdentifiers;
+ (id)supportedContentTypes;
+ (id)webContentTypes;
+ (unint64_t)_previewExtensionKindForContentType:(id)a3 firstPartyExtension:(BOOL)a4;
- (BOOL)canBeEdited;
- (BOOL)canBePreviewed;
- (BOOL)canBeShared;
- (BOOL)canHandleEditedCopy;
- (BOOL)hasDeterminedPredictedPreferredContentSizeForOrbPlatter;
- (BOOL)hasDeterminedShouldUseExtensionThumbnail;
- (BOOL)hasDeterminedThirdPartyPreviewExtensionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPromisedItem;
- (BOOL)isStandardQuickLookType;
- (BOOL)originalContentWasUpdated;
- (BOOL)shouldCreateTemporaryDirectoryInHost;
- (BOOL)shouldOpenInFullScreen;
- (BOOL)shouldPreventMachineReadableCodeDetection;
- (BOOL)shouldUseExtensionThumbnail;
- (BOOL)supportsChromelessUI;
- (BOOL)useExtensionThumbnail;
- (BOOL)useFullPDFTransition;
- (BOOL)useLoadingTimeout;
- (BOOL)wantsPreviewInDebugViewController;
- (CGSize)preferredContentSizeForOrbPlatter;
- (FPItem)fpItem;
- (FPSandboxingURLWrapper)sandboxingURLWrapper;
- (NSData)previewItemData;
- (NSDictionary)attachments;
- (NSDictionary)clientPreviewItemDisplayState;
- (NSDictionary)clientPreviewOptions;
- (NSItemProvider)previewItemProvider;
- (NSNumber)internalShouldCreateTemporaryDirectoryInHost;
- (NSNumber)itemSize;
- (NSNumber)previewItemProviderProgress;
- (NSString)description;
- (NSString)generatedItemContentType;
- (NSString)password;
- (NSString)previewItemContentType;
- (NSString)previewItemTitle;
- (NSString)relativePath;
- (NSString)searchableItemApplicationBundleIdentifier;
- (NSString)searchableItemIdentifier;
- (NSString)spotlightQueryString;
- (NSURL)alternateShareURL;
- (NSURL)editedFileURL;
- (NSURL)previewItemURL;
- (NSUUID)uuid;
- (QLGeneratorFetcher)generationFetcher;
- (QLItem)init;
- (QLItem)initWithCoder:(id)a3;
- (QLItem)initWithData:(id)a3 contentType:(id)a4 previewTitle:(id)a5;
- (QLItem)initWithDataProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5;
- (QLItem)initWithFPItem:(id)a3;
- (QLItem)initWithPreviewItemProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 fileSize:(id)a6;
- (QLItem)initWithSearchableItemUniqueIdentifier:(id)a3 applicationBundleIdentifier:(id)a4;
- (QLItem)initWithSearchableItemUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5 previewTitle:(id)a6;
- (QLItem)initWithURL:(id)a3;
- (QLItem)initWithURL:(id)a3 MIMEType:(id)a4;
- (QLItem)initWithURL:(id)a3 previewTitle:(id)a4 editingMode:(int64_t)a5;
- (QLItem)initWithURLSandboxWrapper:(id)a3;
- (QLItem)initWithURLSandboxWrapper:(id)a3 previewTitle:(id)a4 editingMode:(int64_t)a5;
- (QLItemFetcher)fetcher;
- (QLItemThumbnailGeneratorProtocolInternal)thumbnailGenerator;
- (QLPreviewItemDataProvider)previewItemDataProvider;
- (QLPreviewItemEditedCopy)editedCopy;
- (QLPreviewItemEditedCopy)lastSavedEditedCopy;
- (QLPreviewItemPrivateProtocol)originalPreviewItem;
- (QLTBitmapFormat)bitmapFormat;
- (QLURLHandler)generatedURLHandler;
- (QLUTIAnalyzer)UTIAnalyzer;
- (UIColor)backgroundColorOverride;
- (double)maxLoadingTime;
- (id)createPreviewContext;
- (id)internalCopy;
- (id)saveURL;
- (id)shareableURL;
- (int64_t)editingMode;
- (int64_t)processIdentifier;
- (unint64_t)_getGeneratedItemType;
- (unint64_t)_getPreviewItemType;
- (unint64_t)_previewItemTypeForType:(id)a3;
- (unint64_t)_uncachedExtensionPreviewItemType;
- (unint64_t)_uncachedPreviewItemTypeForContentType:(id)a3;
- (unint64_t)editedFileBehavior;
- (unint64_t)generatedPreviewItemType;
- (unint64_t)generatedReplyType;
- (unint64_t)maximumNumberOfCachedPreviews;
- (unint64_t)previewExtensionType;
- (unint64_t)previewExtensionTypeToUse;
- (unint64_t)previewItemType;
- (unint64_t)stringEncoding;
- (void)_commonInit;
- (void)_removeEditedCopyIfExists;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)prepareSaveURL:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBackgroundColorOverride:(id)a3;
- (void)setBitmapFormat:(id)a3;
- (void)setCanBeEdited:(BOOL)a3;
- (void)setCanBeShared:(BOOL)a3;
- (void)setCanHandleEditedCopy:(BOOL)a3;
- (void)setClientPreviewItemDisplayState:(id)a3;
- (void)setClientPreviewOptions:(id)a3;
- (void)setEditedCopy:(id)a3;
- (void)setEditedFileBehavior:(unint64_t)a3;
- (void)setEditingMode:(int64_t)a3;
- (void)setFetcher:(id)a3;
- (void)setFpItem:(id)a3;
- (void)setGeneratedItemContentType:(id)a3;
- (void)setGeneratedPreviewItemType:(unint64_t)a3;
- (void)setGeneratedReplyType:(unint64_t)a3;
- (void)setGeneratedURLHandler:(id)a3;
- (void)setGenerationFetcher:(id)a3;
- (void)setHasDeterminedPredictedPreferredContentSizeForOrbPlatter:(BOOL)a3;
- (void)setHasDeterminedShouldUseExtensionThumbnail:(BOOL)a3;
- (void)setHasDeterminedThirdPartyPreviewExtensionType:(BOOL)a3;
- (void)setInternalShouldCreateTemporaryDirectoryInHost:(id)a3;
- (void)setIsPromisedItem:(BOOL)a3;
- (void)setItemSize:(id)a3;
- (void)setLastSavedEditedCopy:(id)a3;
- (void)setOriginalContentWasUpdated:(BOOL)a3;
- (void)setOriginalPreviewItem:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPreferredContentSizeForOrbPlatter:(CGSize)a3;
- (void)setPreviewExtensionType:(unint64_t)a3;
- (void)setPreviewItemContentType:(id)a3;
- (void)setPreviewItemData:(id)a3;
- (void)setPreviewItemDataProvider:(id)a3;
- (void)setPreviewItemDisplayState:(id)a3;
- (void)setPreviewItemProvider:(id)a3;
- (void)setPreviewItemProviderProgress:(id)a3;
- (void)setPreviewItemTitle:(id)a3;
- (void)setPreviewItemType:(unint64_t)a3;
- (void)setPreviewItemURL:(id)a3;
- (void)setPreviewOptions:(id)a3;
- (void)setProcessIdentifier:(int64_t)a3;
- (void)setRelativePath:(id)a3;
- (void)setSandboxingURLWrapper:(id)a3;
- (void)setSearchableItemApplicationBundleIdentifier:(id)a3;
- (void)setSearchableItemIdentifier:(id)a3;
- (void)setShouldPreventMachineReadableCodeDetection:(BOOL)a3;
- (void)setShouldUseExtensionThumbnail:(BOOL)a3;
- (void)setSpotlightQueryString:(id)a3;
- (void)setStringEncoding:(unint64_t)a3;
- (void)setThumbnailGenerator:(id)a3;
- (void)setUTIAnalyzer:(id)a3;
- (void)setUseFullPDFTransition:(BOOL)a3;
- (void)setUseLoadingTimeout:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setWantsPreviewInDebugViewController:(BOOL)a3;
@end

@implementation QLItem

- (void)_commonInit
{
  self->_canBeShared = 1;
  self->_useLoadingTimeout = 1;
}

- (QLItem)initWithPreviewItemProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 fileSize:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)QLItem;
  v15 = [(QLItem *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_previewItemProvider, a3);
    objc_storeStrong((id *)&v16->_itemSize, a6);
    objc_storeStrong((id *)&v16->_previewItemContentType, a4);
    objc_storeStrong((id *)&v16->_previewItemTitle, a5);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F3A700]) initWithContentType:v12];
    UTIAnalyzer = v16->_UTIAnalyzer;
    v16->_UTIAnalyzer = (QLUTIAnalyzer *)v17;

    [(QLItem *)v16 _commonInit];
    v19 = v16;
  }

  return v16;
}

- (QLItem)initWithFPItem:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QLItem;
  v6 = [(QLItem *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fpItem, a3);
    uint64_t v8 = [v5 typeIdentifier];
    previewItemContentType = v7->_previewItemContentType;
    v7->_previewItemContentType = (NSString *)v8;

    uint64_t v10 = [v5 displayName];
    previewItemTitle = v7->_previewItemTitle;
    v7->_previewItemTitle = (NSString *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F3A700]) initWithContentType:v7->_previewItemContentType];
    UTIAnalyzer = v7->_UTIAnalyzer;
    v7->_UTIAnalyzer = (QLUTIAnalyzer *)v12;

    [(QLItem *)v7 _commonInit];
    id v14 = v7;
  }

  return v7;
}

- (QLItem)initWithData:(id)a3 contentType:(id)a4 previewTitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)QLItem;
  uint64_t v12 = [(QLItem *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewItemData, a3);
    objc_storeStrong((id *)&v13->_previewItemContentType, a4);
    objc_storeStrong((id *)&v13->_previewItemTitle, a5);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F3A700]) initWithContentType:v10];
    UTIAnalyzer = v13->_UTIAnalyzer;
    v13->_UTIAnalyzer = (QLUTIAnalyzer *)v14;

    [(QLItem *)v13 _commonInit];
    objc_super v16 = v13;
  }

  return v13;
}

- (QLItem)initWithDataProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)QLItem;
  uint64_t v12 = [(QLItem *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewItemDataProvider, a3);
    objc_storeStrong((id *)&v13->_previewItemContentType, a4);
    objc_storeStrong((id *)&v13->_previewItemTitle, a5);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F3A700]) initWithContentType:v10];
    UTIAnalyzer = v13->_UTIAnalyzer;
    v13->_UTIAnalyzer = (QLUTIAnalyzer *)v14;

    [(QLItem *)v13 _commonInit];
    objc_super v16 = v13;
  }

  return v13;
}

- (QLItem)initWithURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLItem;
  id v5 = [(QLItem *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(QLItem *)v5 setPreviewItemURL:v4];
    id v7 = objc_alloc(MEMORY[0x1E4F3A700]);
    uint64_t v8 = [(QLItem *)v6 previewItemURL];
    uint64_t v9 = [v7 initWithURL:v8];
    UTIAnalyzer = v6->_UTIAnalyzer;
    v6->_UTIAnalyzer = (QLUTIAnalyzer *)v9;

    [(QLItem *)v6 _commonInit];
    id v11 = v6;
  }

  return v6;
}

- (QLItem)initWithURL:(id)a3 previewTitle:(id)a4 editingMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)QLItem;
  id v10 = [(QLItem *)&v18 init];
  id v11 = v10;
  if (v10)
  {
    [(QLItem *)v10 setPreviewItemURL:v8];
    objc_storeStrong((id *)&v11->_previewItemTitle, a4);
    v11->_editingMode = a5;
    id v12 = objc_alloc(MEMORY[0x1E4F3A700]);
    objc_super v13 = [(QLItem *)v11 previewItemURL];
    uint64_t v14 = [v12 initWithURL:v13];
    UTIAnalyzer = v11->_UTIAnalyzer;
    v11->_UTIAnalyzer = (QLUTIAnalyzer *)v14;

    [(QLItem *)v11 _commonInit];
    objc_super v16 = v11;
  }

  return v11;
}

- (QLItem)initWithURLSandboxWrapper:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLItem;
  v6 = [(QLItem *)&v14 init];
  if (v6)
  {
    id v7 = [v5 url];
    [(QLItem *)v6 setPreviewItemURL:v7];

    objc_storeStrong((id *)&v6->_sandboxingURLWrapper, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F3A700]);
    id v9 = [(QLItem *)v6 previewItemURL];
    uint64_t v10 = [v8 initWithURL:v9];
    UTIAnalyzer = v6->_UTIAnalyzer;
    v6->_UTIAnalyzer = (QLUTIAnalyzer *)v10;

    [(QLItem *)v6 _commonInit];
    id v12 = v6;
  }

  return v6;
}

- (QLItem)initWithURLSandboxWrapper:(id)a3 previewTitle:(id)a4 editingMode:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)QLItem;
  id v11 = [(QLItem *)&v19 init];
  if (v11)
  {
    id v12 = [v9 url];
    [(QLItem *)v11 setPreviewItemURL:v12];

    objc_storeStrong((id *)&v11->_sandboxingURLWrapper, a3);
    objc_storeStrong((id *)&v11->_previewItemTitle, a4);
    v11->_editingMode = a5;
    id v13 = objc_alloc(MEMORY[0x1E4F3A700]);
    objc_super v14 = [(QLItem *)v11 previewItemURL];
    uint64_t v15 = [v13 initWithURL:v14];
    UTIAnalyzer = v11->_UTIAnalyzer;
    v11->_UTIAnalyzer = (QLUTIAnalyzer *)v15;

    [(QLItem *)v11 _commonInit];
    uint64_t v17 = v11;
  }

  return v11;
}

- (QLItem)initWithURL:(id)a3 MIMEType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLItem;
  id v8 = [(QLItem *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    [(QLItem *)v8 setPreviewItemURL:v6];
    id v10 = (void *)QLTypeCopyUTIForURLAndMimeType(v6, v7);
    [(QLItem *)v9 setPreviewItemContentType:v10];

    [(QLItem *)v9 _commonInit];
    id v11 = v9;
  }

  return v9;
}

- (QLItem)initWithSearchableItemUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5 previewTitle:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)QLItem;
  uint64_t v15 = [(QLItem *)&v19 init];
  objc_super v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchableItemIdentifier, a3);
    objc_storeStrong((id *)&v16->_spotlightQueryString, a4);
    objc_storeStrong((id *)&v16->_searchableItemApplicationBundleIdentifier, a5);
    objc_storeStrong((id *)&v16->_previewItemTitle, a6);
    [(QLItem *)v16 _commonInit];
    uint64_t v17 = v16;
  }

  return v16;
}

- (QLItem)initWithSearchableItemUniqueIdentifier:(id)a3 applicationBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLItem;
  id v9 = [(QLItem *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    v9->_previewItemType = 14;
    objc_storeStrong((id *)&v9->_searchableItemIdentifier, a3);
    objc_storeStrong((id *)&v10->_searchableItemApplicationBundleIdentifier, a4);
    [(QLItem *)v10 _commonInit];
    id v11 = v10;
  }

  return v10;
}

- (QLItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)QLItem;
  v2 = [(QLItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(QLItem *)v2 _commonInit];
    id v4 = v3;
  }

  return v3;
}

+ (id)itemWithPreviewItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    id v5 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v3 internalCopy];
      [v5 setOriginalPreviewItem:v3];
    }
    else
    {
      id v5 = (id)objc_opt_new();
      [v5 setOriginalPreviewItem:v3];
      if (objc_opt_respondsToSelector())
      {
        objc_super v6 = [v3 previewItemTitle];

        if (v6)
        {
          id v7 = [v3 previewItemTitle];
          [v5 setPreviewItemTitle:v7];
        }
      }
      if (objc_opt_respondsToSelector())
      {
        id v8 = [v3 backgroundColorOverride];
        [v5 setBackgroundColorOverride:v8];
      }
      if (objc_opt_respondsToSelector())
      {
        id v9 = [v3 previewItemContentType];
        [v5 setPreviewItemContentType:v9];
      }
      if (objc_opt_respondsToSelector())
      {
        id v10 = [v3 MIMEType];
        id v11 = (void *)QLTypeCopyUTIForURLAndMimeType(0, v10);
        [v5 setPreviewItemContentType:v11];
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v5, "setIsPromisedItem:", objc_msgSend(v3, "isPromisedItem"));
      }
      else
      {
        id v12 = [v5 previewItemURL];
        [v5 setIsPromisedItem:v12 == 0];
      }
      objc_super v13 = [v5 previewItemContentType];

      id v14 = objc_alloc(MEMORY[0x1E4F3A700]);
      if (v13)
      {
        uint64_t v15 = [v5 previewItemContentType];
        uint64_t v16 = [v14 initWithContentType:v15];
      }
      else
      {
        uint64_t v15 = [v5 previewItemURL];
        uint64_t v16 = [v14 initWithURL:v15];
      }
      uint64_t v17 = (void *)v16;
      [v5 setUTIAnalyzer:v16];

      if (objc_opt_respondsToSelector())
      {
        objc_super v18 = [v3 previewOptions];
        [v5 setClientPreviewOptions:v18];
      }
      if (objc_opt_respondsToSelector())
      {
        objc_super v19 = [v3 previewItemDisplayState];
        [v5 setPreviewItemDisplayState:v19];
      }
    }
  }

  return v5;
}

- (void)dealloc
{
  id v3 = [(QLItem *)self editedCopy];
  char v4 = [v3 temporaryDirectoryWasCreatedInHost];

  if ((v4 & 1) == 0) {
    [(QLItem *)self _removeEditedCopyIfExists];
  }
  v5.receiver = self;
  v5.super_class = (Class)QLItem;
  [(QLItem *)&v5 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(QLItem *)self previewItemURL];
    id v7 = [v5 previewItemURL];
    int v8 = __18__QLItem_isEqual___block_invoke((uint64_t)v7, v6, v7);

    if (!v8) {
      goto LABEL_28;
    }
    id v9 = [(QLItem *)self previewItemData];
    id v10 = [v5 previewItemData];
    int v11 = __18__QLItem_isEqual___block_invoke((uint64_t)v10, v9, v10);

    if (!v11) {
      goto LABEL_28;
    }
    id v12 = [(QLItem *)self fpItem];
    objc_super v13 = [v5 fpItem];
    int v14 = __18__QLItem_isEqual___block_invoke((uint64_t)v13, v12, v13);

    if (!v14) {
      goto LABEL_28;
    }
    uint64_t v15 = [(QLItem *)self relativePath];
    uint64_t v16 = [v5 relativePath];
    int v17 = __18__QLItem_isEqual___block_invoke((uint64_t)v16, v15, v16);

    if (!v17) {
      goto LABEL_28;
    }
    objc_super v18 = [(QLItem *)self previewItemProvider];
    objc_super v19 = [v5 previewItemProvider];
    int v20 = __18__QLItem_isEqual___block_invoke((uint64_t)v19, v18, v19);

    if (!v20) {
      goto LABEL_28;
    }
    objc_super v21 = [(QLItem *)self itemSize];
    v22 = [v5 itemSize];
    int v23 = __18__QLItem_isEqual___block_invoke((uint64_t)v22, v21, v22);

    if (!v23) {
      goto LABEL_28;
    }
    v24 = [(QLItem *)self previewItemContentType];
    v25 = [v5 previewItemContentType];
    int v26 = __18__QLItem_isEqual___block_invoke((uint64_t)v25, v24, v25);

    if (!v26) {
      goto LABEL_28;
    }
    v27 = [(QLItem *)self backgroundColorOverride];
    v28 = [v5 backgroundColorOverride];
    int v29 = __18__QLItem_isEqual___block_invoke((uint64_t)v28, v27, v28);

    if (!v29) {
      goto LABEL_28;
    }
    v30 = [(QLItem *)self previewItemTitle];
    v31 = [v5 previewItemTitle];
    int v32 = __18__QLItem_isEqual___block_invoke((uint64_t)v31, v30, v31);

    if (!v32) {
      goto LABEL_28;
    }
    v33 = [(QLItem *)self editedFileURL];
    v34 = [v5 editedFileURL];
    int v35 = __18__QLItem_isEqual___block_invoke((uint64_t)v34, v33, v34);

    if (!v35) {
      goto LABEL_28;
    }
    v36 = [(QLItem *)self password];
    v37 = [v5 password];
    int v38 = __18__QLItem_isEqual___block_invoke((uint64_t)v37, v36, v37);

    if (!v38) {
      goto LABEL_28;
    }
    v39 = [(QLItem *)self uuid];
    v40 = [v5 uuid];
    int v41 = __18__QLItem_isEqual___block_invoke((uint64_t)v40, v39, v40);

    if (!v41) {
      goto LABEL_28;
    }
    v42 = [(QLItem *)self previewItemDataProvider];
    v43 = [v5 previewItemDataProvider];

    if (v42 != v43) {
      goto LABEL_28;
    }
    unint64_t v44 = [(QLItem *)self previewItemType];
    if (v44 != [v5 previewItemType]) {
      goto LABEL_28;
    }
    int64_t v45 = [(QLItem *)self processIdentifier];
    if (v45 != [v5 processIdentifier]) {
      goto LABEL_28;
    }
    int v46 = [(QLItem *)self isPromisedItem];
    if (v46 != [v5 isPromisedItem]) {
      goto LABEL_28;
    }
    int v47 = [(QLItem *)self useFullPDFTransition];
    if (v47 != [v5 useFullPDFTransition]) {
      goto LABEL_28;
    }
    int v48 = [(QLItem *)self useLoadingTimeout];
    if (v48 != [v5 useLoadingTimeout]) {
      goto LABEL_28;
    }
    int v49 = [(QLItem *)self wantsPreviewInDebugViewController];
    if (v49 != [v5 wantsPreviewInDebugViewController]) {
      goto LABEL_28;
    }
    v50 = [(QLItem *)self sandboxingURLWrapper];
    v51 = [v50 url];
    v52 = [v5 sandboxingURLWrapper];
    v53 = [v52 url];
    int v54 = __18__QLItem_isEqual___block_invoke((uint64_t)v53, v51, v53);

    if (!v54) {
      goto LABEL_28;
    }
    v55 = [(QLItem *)self searchableItemIdentifier];
    v56 = [v5 searchableItemIdentifier];
    int v57 = __18__QLItem_isEqual___block_invoke((uint64_t)v56, v55, v56);

    if (!v57) {
      goto LABEL_28;
    }
    v58 = [(QLItem *)self spotlightQueryString];
    v59 = [v5 spotlightQueryString];
    int v60 = __18__QLItem_isEqual___block_invoke((uint64_t)v59, v58, v59);

    if (!v60) {
      goto LABEL_28;
    }
    v61 = [(QLItem *)self searchableItemApplicationBundleIdentifier];
    v62 = [v5 searchableItemApplicationBundleIdentifier];
    int v63 = __18__QLItem_isEqual___block_invoke((uint64_t)v62, v61, v62);

    if (!v63) {
      goto LABEL_28;
    }
    v64 = [(QLItem *)self previewItemProviderProgress];
    v65 = [v5 previewItemProviderProgress];
    int v66 = __18__QLItem_isEqual___block_invoke((uint64_t)v65, v64, v65);

    if (v66)
    {
      v67 = [(QLItem *)self clientPreviewOptions];
      v68 = [v5 clientPreviewOptions];
      char v69 = __18__QLItem_isEqual___block_invoke((uint64_t)v68, v67, v68);
    }
    else
    {
LABEL_28:
      char v69 = 0;
    }
  }
  else
  {
    char v69 = 0;
  }

  return v69;
}

uint64_t __18__QLItem_isEqual___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = a2;
  unint64_t v5 = a3;
  objc_super v6 = (void *)v5;
  if (v4 | v5)
  {
    uint64_t v7 = 0;
    if (v4 && v5) {
      uint64_t v7 = [(id)v4 isEqual:v5];
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)internalCopy
{
  id v3 = objc_opt_new();
  [v3 setPreviewItemURL:self->_previewItemURL];
  [v3 setPreviewItemData:self->_previewItemData];
  [v3 setFpItem:self->_fpItem];
  [v3 setPreviewItemProvider:self->_previewItemProvider];
  [v3 setRelativePath:self->_relativePath];
  [v3 setItemSize:self->_itemSize];
  unint64_t v4 = [(QLItem *)self fetcher];
  [v3 setFetcher:v4];

  [v3 setUTIAnalyzer:self->_UTIAnalyzer];
  [v3 setPreviewItemContentType:self->_previewItemContentType];
  [v3 setPreviewItemType:self->_previewItemType];
  [v3 setBackgroundColorOverride:self->_backgroundColorOverride];
  [v3 setPreviewItemTitle:self->_previewItemTitle];
  [v3 setEditedCopy:self->_editedCopy];
  [v3 setPassword:self->_password];
  [v3 setUuid:self->_uuid];
  [v3 setProcessIdentifier:self->_processIdentifier];
  [v3 setIsPromisedItem:self->_isPromisedItem];
  [v3 setUseFullPDFTransition:self->_useFullPDFTransition];
  [v3 setUseLoadingTimeout:self->_useLoadingTimeout];
  [v3 setSearchableItemIdentifier:self->_searchableItemIdentifier];
  [v3 setSpotlightQueryString:self->_spotlightQueryString];
  [v3 setSearchableItemApplicationBundleIdentifier:self->_searchableItemApplicationBundleIdentifier];
  [v3 setCanBeShared:self->_canBeShared];
  [v3 setCanBeEdited:self->_canBeEdited];
  [v3 setCanHandleEditedCopy:self->_canHandleEditedCopy];
  [v3 setOriginalContentWasUpdated:self->_originalContentWasUpdated];
  [v3 setEditingMode:self->_editingMode];
  [v3 setEditedFileBehavior:self->_editedFileBehavior];
  [v3 setShouldPreventMachineReadableCodeDetection:self->_shouldPreventMachineReadableCodeDetection];
  [v3 setWantsPreviewInDebugViewController:self->_wantsPreviewInDebugViewController];
  [v3 setPreviewItemDataProvider:self->_previewItemDataProvider];
  [v3 setSandboxingURLWrapper:self->_sandboxingURLWrapper];
  [v3 setClientPreviewOptions:self->_clientPreviewOptions];
  [v3 setClientPreviewItemDisplayState:self->_clientPreviewItemDisplayState];
  [v3 setInternalShouldCreateTemporaryDirectoryInHost:self->_internalShouldCreateTemporaryDirectoryInHost];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v44 = a3;
  unint64_t v4 = [(QLItem *)self previewItemURL];

  if (v4)
  {
    unint64_t v5 = [(QLItem *)self previewItemURL];
    [v44 encodeObject:v5 forKey:@"previewItemURL"];
  }
  objc_super v6 = [(QLItem *)self previewItemData];

  if (v6)
  {
    uint64_t v7 = [(QLItem *)self previewItemData];
    [v44 encodeObject:v7 forKey:@"previewItemData"];
  }
  int v8 = [(QLItem *)self fpItem];

  if (v8)
  {
    id v9 = [(QLItem *)self fpItem];
    [v44 encodeObject:v9 forKey:@"fpItem"];
  }
  id v10 = [(QLItem *)self relativePath];

  if (v10)
  {
    int v11 = [(QLItem *)self relativePath];
    [v44 encodeObject:v11 forKey:@"relativePath"];
  }
  id v12 = [(QLItem *)self itemSize];

  if (v12)
  {
    objc_super v13 = [(QLItem *)self itemSize];
    [v44 encodeObject:v13 forKey:@"itemSize"];
  }
  int v14 = [(QLItem *)self fetcher];

  if (v14)
  {
    uint64_t v15 = [(QLItem *)self fetcher];
    [v44 encodeObject:v15 forKey:@"fetcher"];
  }
  uint64_t v16 = [(QLItem *)self UTIAnalyzer];

  if (v16)
  {
    int v17 = [(QLItem *)self UTIAnalyzer];
    [v44 encodeObject:v17 forKey:@"UTIAnalyzer"];
  }
  objc_super v18 = [(QLItem *)self previewItemContentType];

  if (v18)
  {
    objc_super v19 = [(QLItem *)self previewItemContentType];
    [v44 encodeObject:v19 forKey:@"previewItemContentType"];
  }
  int v20 = [(QLItem *)self backgroundColorOverride];

  if (v20)
  {
    objc_super v21 = [(QLItem *)self backgroundColorOverride];
    [v44 encodeObject:v21 forKey:@"backgroundColorOverride"];
  }
  v22 = [(QLItem *)self previewItemTitle];

  if (v22)
  {
    int v23 = [(QLItem *)self previewItemTitle];
    [v44 encodeObject:v23 forKey:@"previewItemTitle"];
  }
  v24 = [(QLItem *)self password];

  if (v24)
  {
    v25 = [(QLItem *)self password];
    [v44 encodeObject:v25 forKey:@"password"];
  }
  int v26 = [(QLItem *)self uuid];

  if (v26)
  {
    v27 = [(QLItem *)self uuid];
    [v44 encodeObject:v27 forKey:@"uuid"];
  }
  v28 = [(QLItem *)self searchableItemIdentifier];

  if (v28)
  {
    int v29 = [(QLItem *)self searchableItemIdentifier];
    [v44 encodeObject:v29 forKey:@"searchableItemIdentifier"];
  }
  v30 = [(QLItem *)self spotlightQueryString];

  if (v30)
  {
    v31 = [(QLItem *)self spotlightQueryString];
    [v44 encodeObject:v31 forKey:@"spotlightQueryString"];
  }
  int v32 = [(QLItem *)self searchableItemApplicationBundleIdentifier];

  if (v32)
  {
    v33 = [(QLItem *)self searchableItemApplicationBundleIdentifier];
    [v44 encodeObject:v33 forKey:@"searchableItemApplicationBundleIdentifier"];
  }
  v34 = [(QLItem *)self sandboxingURLWrapper];

  if (v34)
  {
    int v35 = [(QLItem *)self sandboxingURLWrapper];
    [v44 encodeObject:v35 forKey:@"sandboxingURLWrapper"];
  }
  v36 = [(QLItem *)self clientPreviewOptions];

  if (v36)
  {
    v37 = [(QLItem *)self clientPreviewOptions];
    [v44 encodeObject:v37 forKey:@"clientPreviewOptions"];
  }
  int v38 = [(QLItem *)self clientPreviewItemDisplayState];

  if (v38)
  {
    v39 = [(QLItem *)self clientPreviewItemDisplayState];
    [v44 encodeObject:v39 forKey:@"clientPreviewItemDisplayState"];
  }
  v40 = [(QLItem *)self generatedURLHandler];

  if (v40)
  {
    int v41 = [(QLItem *)self generatedURLHandler];
    [v44 encodeObject:v41 forKey:@"generatedURLHandler"];
  }
  v42 = [(QLItem *)self internalShouldCreateTemporaryDirectoryInHost];
  objc_msgSend(v44, "encodeBool:forKey:", objc_msgSend(v42, "BOOLValue"), @"internalShouldCreateTemporaryDirectoryInHost");

  v43 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v44, "encodeInteger:forKey:", (int)objc_msgSend(v43, "processIdentifier"), @"processIdentifier");

  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem isPromisedItem](self, "isPromisedItem"), @"isPromisedItem");
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem useFullPDFTransition](self, "useFullPDFTransition"), @"useFullPDFTransition");
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem useLoadingTimeout](self, "useLoadingTimeout"), @"useLoadingTimeout");
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem canBeShared](self, "canBeShared"), @"canBeShared");
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem canBeEdited](self, "canBeEdited"), @"canBeEdited");
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem canHandleEditedCopy](self, "canHandleEditedCopy"), @"canHandleEditedCopy");
  objc_msgSend(v44, "encodeInteger:forKey:", -[QLItem editingMode](self, "editingMode"), @"editingMode");
  objc_msgSend(v44, "encodeInteger:forKey:", -[QLItem editedFileBehavior](self, "editedFileBehavior"), @"editedFileBehavior");
  objc_msgSend(v44, "encodeInteger:forKey:", -[QLItem shouldPreventMachineReadableCodeDetection](self, "shouldPreventMachineReadableCodeDetection"), @"shouldPreventMachineReadableCodeDetection");
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem wantsPreviewInDebugViewController](self, "wantsPreviewInDebugViewController"), @"wantsPreviewInDebugViewController");
}

- (QLItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)QLItem;
  unint64_t v5 = [(QLItem *)&v54 init];
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    objc_sync_enter(v7);
    int v8 = +[QLItemFetcherFactory possibleFetcherClasses];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"fetcher"];
    fetcher = v7->_fetcher;
    v7->_fetcher = (QLItemFetcher *)v9;

    objc_sync_exit(v7);
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UTIAnalyzer"];
    UTIAnalyzer = v7->_UTIAnalyzer;
    v7->_UTIAnalyzer = (QLUTIAnalyzer *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpItem"];
    fpItem = v7->_fpItem;
    v7->_fpItem = (FPItem *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewItemURL"];
    previewItemURL = v7->_previewItemURL;
    v7->_previewItemURL = (NSURL *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewItemData"];
    previewItemData = v7->_previewItemData;
    v7->_previewItemData = (NSData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relativePath"];
    relativePath = v7->_relativePath;
    v7->_relativePath = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemSize"];
    itemSize = v7->_itemSize;
    v7->_itemSize = (NSNumber *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewItemContentType"];
    previewItemContentType = v7->_previewItemContentType;
    v7->_previewItemContentType = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColorOverride"];
    backgroundColorOverride = v7->_backgroundColorOverride;
    v7->_backgroundColorOverride = (UIColor *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewItemTitle"];
    previewItemTitle = v7->_previewItemTitle;
    v7->_previewItemTitle = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
    password = v7->_password;
    v7->_password = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v31;

    v7->_processIdentifier = [v4 decodeIntegerForKey:@"processIdentifier"];
    v7->_isPromisedItem = [v4 decodeBoolForKey:@"isPromisedItem"];
    v7->_useFullPDFTransition = [v4 decodeBoolForKey:@"useFullPDFTransition"];
    v7->_useLoadingTimeout = [v4 decodeBoolForKey:@"useLoadingTimeout"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchableItemIdentifier"];
    searchableItemIdentifier = v7->_searchableItemIdentifier;
    v7->_searchableItemIdentifier = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spotlightQueryString"];
    spotlightQueryString = v7->_spotlightQueryString;
    v7->_spotlightQueryString = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchableItemApplicationBundleIdentifier"];
    searchableItemApplicationBundleIdentifier = v7->_searchableItemApplicationBundleIdentifier;
    v7->_searchableItemApplicationBundleIdentifier = (NSString *)v37;

    v7->_canBeShared = [v4 decodeBoolForKey:@"canBeShared"];
    v7->_canBeEdited = [v4 decodeBoolForKey:@"canBeEdited"];
    v7->_canHandleEditedCopy = [v4 decodeBoolForKey:@"canHandleEditedCopy"];
    v7->_editedFileBehavior = [v4 decodeIntegerForKey:@"editedFileBehavior"];
    v7->_shouldPreventMachineReadableCodeDetection = [v4 decodeIntegerForKey:@"shouldPreventMachineReadableCodeDetection"] != 0;
    v7->_editingMode = [v4 decodeIntegerForKey:@"editingMode"];
    v7->_wantsPreviewInDebugViewController = [v4 decodeBoolForKey:@"wantsPreviewInDebugViewController"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxingURLWrapper"];
    sandboxingURLWrapper = v7->_sandboxingURLWrapper;
    v7->_sandboxingURLWrapper = (FPSandboxingURLWrapper *)v39;

    uint64_t v41 = [v4 decodeBoolForKey:@"internalShouldCreateTemporaryDirectoryInHost"];
    uint64_t v42 = [MEMORY[0x1E4F28ED0] numberWithBool:v41];
    internalShouldCreateTemporaryDirectoryInHost = v7->_internalShouldCreateTemporaryDirectoryInHost;
    v7->_internalShouldCreateTemporaryDirectoryInHost = (NSNumber *)v42;

    id v44 = +[QLItem customExtensionCommunicationEncodedClasses];
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"clientPreviewOptions"];
    clientPreviewOptions = v7->_clientPreviewOptions;
    v7->_clientPreviewOptions = (NSDictionary *)v45;

    int v47 = +[QLItem customExtensionCommunicationEncodedClasses];
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"clientPreviewItemDisplayState"];
    clientPreviewItemDisplayState = v7->_clientPreviewItemDisplayState;
    v7->_clientPreviewItemDisplayState = (NSDictionary *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"generatedURLHandler"];
    generatedURLHandler = v7->_generatedURLHandler;
    v7->_generatedURLHandler = (QLURLHandler *)v50;

    v52 = v7;
  }

  return v6;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)QLItem;
  id v4 = [(QLItem *)&v8 description];
  unint64_t v5 = [(QLItem *)self previewItemTitle];
  objc_super v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return (NSString *)v6;
}

- (NSDictionary)clientPreviewOptions
{
  clientPreviewOptions = self->_clientPreviewOptions;
  if (clientPreviewOptions)
  {
    id v3 = clientPreviewOptions;
    goto LABEL_8;
  }
  unint64_t v5 = [(QLItem *)self originalPreviewItem];
  if (v5 == self)
  {
  }
  else
  {
    objc_super v6 = v5;
    uint64_t v7 = [(QLItem *)self originalPreviewItem];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(QLItem *)self originalPreviewItem];
      id v3 = [v9 previewOptions];

      goto LABEL_8;
    }
  }
  id v3 = 0;
LABEL_8:
  return v3;
}

- (void)setPreviewOptions:(id)a3
{
}

- (NSDictionary)clientPreviewItemDisplayState
{
  clientPreviewItemDisplayState = self->_clientPreviewItemDisplayState;
  if (clientPreviewItemDisplayState)
  {
    id v3 = clientPreviewItemDisplayState;
    goto LABEL_8;
  }
  unint64_t v5 = [(QLItem *)self originalPreviewItem];
  if (v5 == self)
  {
  }
  else
  {
    objc_super v6 = v5;
    uint64_t v7 = [(QLItem *)self originalPreviewItem];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(QLItem *)self originalPreviewItem];
      id v3 = [v9 previewItemDisplayState];

      goto LABEL_8;
    }
  }
  id v3 = 0;
LABEL_8:
  return v3;
}

- (void)setPreviewItemDisplayState:(id)a3
{
}

- (BOOL)isPromisedItem
{
  id v3 = [(QLItem *)self originalPreviewItem];
  if (v3 == self)
  {
  }
  else
  {
    id v4 = v3;
    unint64_t v5 = [(QLItem *)self originalPreviewItem];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(QLItem *)self originalPreviewItem];
      char v8 = [v7 isPromisedItem];

      return v8;
    }
  }
  return self->_isPromisedItem;
}

- (NSURL)alternateShareURL
{
  v2 = self;
  uint64_t v3 = [(QLItem *)self originalPreviewItem];
  if ((void *)v3 == v2)
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  id v4 = (void *)v3;
  unint64_t v5 = [v2 originalPreviewItem];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v2 = [v2 originalPreviewItem];
    uint64_t v7 = [v2 alternateShareURL];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_7:
  return (NSURL *)v7;
}

- (QLItemFetcher)fetcher
{
  v2 = self;
  objc_sync_enter(v2);
  fetcher = v2->_fetcher;
  if (!fetcher)
  {
    uint64_t v4 = +[QLItemFetcherFactory fetcherForPreviewItem:v2];
    unint64_t v5 = v2->_fetcher;
    v2->_fetcher = (QLItemFetcher *)v4;

    fetcher = v2->_fetcher;
  }
  char v6 = fetcher;
  objc_sync_exit(v2);

  return v6;
}

- (void)setFetcher:(id)a3
{
  uint64_t v4 = (QLItemFetcher *)a3;
  obj = self;
  objc_sync_enter(obj);
  fetcher = obj->_fetcher;
  obj->_fetcher = v4;

  objc_sync_exit(obj);
}

- (id)createPreviewContext
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(QLItem *)self thumbnailGenerator];
  [v3 setThumbnailGenerator:v4];

  unint64_t v5 = [(QLItem *)self previewItemTitle];
  [v3 setPreviewTitle:v5];

  char v6 = [(QLItem *)self previewItemContentType];
  [v3 setOriginalContentType:v6];

  uint64_t v7 = [(QLItem *)self generatedItemContentType];
  if (v7)
  {
    [v3 setContentType:v7];
  }
  else
  {
    char v8 = [(QLItem *)self previewItemContentType];
    [v3 setContentType:v8];
  }
  objc_msgSend(v3, "setCanBeEdited:", -[QLItem canBeEdited](self, "canBeEdited"));
  objc_msgSend(v3, "setCanBeShared:", -[QLItem canBeShared](self, "canBeShared"));
  objc_msgSend(v3, "setEditedFileBehavior:", -[QLItem editedFileBehavior](self, "editedFileBehavior"));
  objc_msgSend(v3, "setShouldPreventMachineReadableCodeDetection:", -[QLItem shouldPreventMachineReadableCodeDetection](self, "shouldPreventMachineReadableCodeDetection"));
  uint64_t v9 = [(QLItem *)self password];
  [v3 setPassword:v9];

  objc_msgSend(v3, "setPreviewItemType:", -[QLItem previewItemType](self, "previewItemType"));
  id v10 = [(QLItem *)self backgroundColorOverride];
  [v3 setBackgroundColor:v10];

  uint64_t v11 = [(QLItem *)self itemSize];
  [v3 setItemSize:v11];

  objc_msgSend(v3, "setProcessIdentifier:", -[QLItem processIdentifier](self, "processIdentifier"));
  [v3 setItem:self];
  id v12 = [(QLItem *)self clientPreviewOptions];
  [v3 setClientPreviewOptions:v12];

  objc_msgSend(v3, "setStringEncoding:", -[QLItem stringEncoding](self, "stringEncoding"));
  uint64_t v13 = [(QLItem *)self attachments];
  [v3 setAttachments:v13];

  int v14 = [(QLItem *)self bitmapFormat];
  [v3 setBitmapFormat:v14];

  return v3;
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    uint64_t v4 = (NSUUID *)objc_opt_new();
    unint64_t v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  char v6 = uuid;
  return v6;
}

- (NSNumber)itemSize
{
  itemSize = self->_itemSize;
  if (!itemSize)
  {
    uint64_t v4 = [(QLItem *)self fetcher];
    unint64_t v5 = [v4 itemSize];
    char v6 = self->_itemSize;
    self->_itemSize = v5;

    itemSize = self->_itemSize;
  }
  uint64_t v7 = itemSize;
  return v7;
}

- (NSURL)previewItemURL
{
  previewItemURL = self->_previewItemURL;
  if (!previewItemURL)
  {
    generatedURLHandler = self->_generatedURLHandler;
    if (generatedURLHandler) {
      [(QLURLHandler *)generatedURLHandler fileURL];
    }
    else {
    unint64_t v5 = [(QLPreviewItemPrivateProtocol *)self->_originalPreviewItem previewItemURL];
    }
    char v6 = self->_previewItemURL;
    self->_previewItemURL = v5;

    previewItemURL = self->_previewItemURL;
  }
  uint64_t v7 = previewItemURL;
  return v7;
}

- (BOOL)canBePreviewed
{
  return [(QLItem *)self previewItemType] != 15;
}

- (QLItemThumbnailGeneratorProtocolInternal)thumbnailGenerator
{
  thumbnailGenerator = self->_thumbnailGenerator;
  if (!thumbnailGenerator)
  {
    uint64_t v4 = [[QLSingleItemThumbnailGenerator alloc] initWithItem:self];
    unint64_t v5 = self->_thumbnailGenerator;
    self->_thumbnailGenerator = (QLItemThumbnailGeneratorProtocolInternal *)v4;

    thumbnailGenerator = self->_thumbnailGenerator;
  }
  char v6 = thumbnailGenerator;
  return v6;
}

- (QLPreviewItemPrivateProtocol)originalPreviewItem
{
  if (self->_originalPreviewItem) {
    self = (QLItem *)self->_originalPreviewItem;
  }
  return (QLPreviewItemPrivateProtocol *)self;
}

- (void)setPreviewItemProviderProgress:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__QLItem_setPreviewItemProviderProgress___block_invoke;
  v6[3] = &unk_1E6DD3AA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  QLRunInMainThread(v6);
}

void __41__QLItem_setPreviewItemProviderProgress___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) fetcher];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) fetcher];
    [*(id *)(*(void *)(a1 + 32) + 40) floatValue];
    [v5 updatedURLWithProgress:v4];
  }
}

- (NSString)previewItemTitle
{
  previewItemTitle = self->_previewItemTitle;
  if (!previewItemTitle)
  {
    float v4 = [(QLItem *)self previewItemURL];

    if (v4)
    {
      id v5 = [(QLItem *)self previewItemURL];
      char v6 = [v5 path];

      id v7 = [(QLItem *)self previewItemURL];
      char v8 = v7;
      if (v6)
      {
        uint64_t v9 = [v7 path];
LABEL_9:
        uint64_t v11 = (void *)v9;

        goto LABEL_10;
      }
      uint64_t v11 = [v7 resourceSpecifier];

      if (v11)
      {
        char v8 = [(QLItem *)self previewItemURL];
        uint64_t v9 = [v8 resourceSpecifier];
        goto LABEL_9;
      }
    }
    else
    {
      id v10 = [(QLItem *)self relativePath];

      if (!v10)
      {
LABEL_11:
        previewItemTitle = self->_previewItemTitle;
        goto LABEL_12;
      }
      uint64_t v11 = [(QLItem *)self relativePath];
    }
LABEL_10:
    id v12 = [v11 lastPathComponent];
    uint64_t v13 = [v12 stringByDeletingPathExtension];
    int v14 = self->_previewItemTitle;
    self->_previewItemTitle = v13;

    goto LABEL_11;
  }
LABEL_12:
  uint64_t v15 = previewItemTitle;
  return v15;
}

- (NSString)previewItemContentType
{
  previewItemContentType = self->_previewItemContentType;
  if (!previewItemContentType)
  {
    float v4 = [(QLItem *)self UTIAnalyzer];
    id v5 = [v4 contentType];
    char v6 = self->_previewItemContentType;
    self->_previewItemContentType = v5;

    previewItemContentType = self->_previewItemContentType;
  }
  id v7 = previewItemContentType;
  return v7;
}

- (unint64_t)previewItemType
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_previewItemType;
  if (!result)
  {
    self->_unint64_t previewItemType = [(QLItem *)self _getPreviewItemType];
    float v4 = (NSObject **)MEMORY[0x1E4F945F0];
    id v5 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t previewItemType = self->_previewItemType;
      int v7 = 138412546;
      char v8 = self;
      __int16 v9 = 2048;
      unint64_t v10 = previewItemType;
      _os_log_impl(&dword_1E2805000, v5, OS_LOG_TYPE_INFO, "Determined preview item type of item (%@) - Preview type is %lu #PreviewItem", (uint8_t *)&v7, 0x16u);
    }
    return self->_previewItemType;
  }
  return result;
}

- (unint64_t)generatedPreviewItemType
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = [(QLItem *)self generatedItemContentType];

  if (!v3) {
    return 0;
  }
  unint64_t result = self->_generatedPreviewItemType;
  if (!result)
  {
    self->_unint64_t generatedPreviewItemType = [(QLItem *)self _getGeneratedItemType];
    id v5 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      int v7 = (NSObject **)MEMORY[0x1E4F945F0];
      QLSInitLogging();
      id v5 = *v7;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t generatedPreviewItemType = self->_generatedPreviewItemType;
      int v8 = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2048;
      unint64_t v11 = generatedPreviewItemType;
      _os_log_impl(&dword_1E2805000, v5, OS_LOG_TYPE_DEBUG, "Determined generated preview item type of item (%@) - Generated preview type is %lu #PreviewItem", (uint8_t *)&v8, 0x16u);
    }
    return self->_generatedPreviewItemType;
  }
  return result;
}

- (id)shareableURL
{
  char v3 = [(QLItem *)self editedFileURL];
  int v4 = [v3 startAccessingSecurityScopedResource];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v3 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = v3;
  }
  else
  {
    __int16 v9 = [(QLItem *)self alternateShareURL];

    if (v9) {
      [(QLItem *)self alternateShareURL];
    }
    else {
    id v8 = [(QLItem *)self saveURL];
    }
  }
  __int16 v10 = v8;
  if (v4) {
    [v3 stopAccessingSecurityScopedResource];
  }

  return v10;
}

- (BOOL)shouldCreateTemporaryDirectoryInHost
{
  v2 = [(QLItem *)self internalShouldCreateTemporaryDirectoryInHost];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)internalShouldCreateTemporaryDirectoryInHost
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_internalShouldCreateTemporaryDirectoryInHost)
  {
    char v3 = [(QLItem *)self previewItemURL];

    int v4 = (NSObject **)MEMORY[0x1E4F945F0];
    id v5 = *MEMORY[0x1E4F945F0];
    if (v3)
    {
      if (!v5)
      {
        QLSInitLogging();
        id v5 = *v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        char v6 = v5;
        int v7 = [(QLItem *)self description];
        int v14 = 138412290;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1E2805000, v6, OS_LOG_TYPE_DEFAULT, "QLPreviewItem has an url, create a tmp dir in the host: %@ #PreviewItem", (uint8_t *)&v14, 0xCu);
      }
      id v8 = (NSNumber *)MEMORY[0x1E4F1CC38];
    }
    else
    {
      if (!v5)
      {
        QLSInitLogging();
        id v5 = *v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = v5;
        __int16 v10 = [(QLItem *)self description];
        int v14 = 138412290;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_DEFAULT, "QLPreviewItem has no url yet, don't create a tmp dir in the host: %@ #PreviewItem", (uint8_t *)&v14, 0xCu);
      }
      id v8 = (NSNumber *)MEMORY[0x1E4F1CC28];
    }
    internalShouldCreateTemporaryDirectoryInHost = self->_internalShouldCreateTemporaryDirectoryInHost;
    self->_internalShouldCreateTemporaryDirectoryInHost = v8;
  }
  uint64_t v12 = self->_internalShouldCreateTemporaryDirectoryInHost;
  return v12;
}

- (void)prepareSaveURL:(id)a3
{
  int v4 = (void (**)(void))a3;
  id v5 = [(QLItem *)self fetcher];
  id v6 = v5;
  if (v5) {
    [v5 prepareShareableItem:v4];
  }
  else {
    v4[2](v4);
  }
}

- (id)saveURL
{
  char v3 = [(QLItem *)self fetcher];
  int v4 = [v3 shareableItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(QLItem *)self fetcher];
    int v7 = [v6 shareableItem];
  }
  else
  {
    id v8 = [(QLItem *)self previewItemURL];

    if (v8)
    {
      int v7 = [(QLItem *)self previewItemURL];
    }
    else
    {
      int v7 = 0;
    }
  }
  return v7;
}

- (void)setEditedCopy:(id)a3
{
  id v5 = (QLPreviewItemEditedCopy *)a3;
  editedCopy = self->_editedCopy;
  if (editedCopy != v5)
  {
    __int16 v10 = v5;
    if (![(QLPreviewItemEditedCopy *)editedCopy isEqual:v5])
    {
      int v7 = [(QLPreviewItemEditedCopy *)self->_editedCopy url];
      id v8 = [(QLPreviewItemEditedCopy *)v10 url];
      char v9 = [v7 isEqual:v8];

      if ((v9 & 1) == 0) {
        [(QLItem *)self _removeEditedCopyIfExists];
      }
      objc_storeStrong((id *)&self->_editedCopy, a3);
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)_removeEditedCopyIfExists
{
  [(QLPreviewItemEditedCopy *)self->_editedCopy removeFromDisk:1];
  editedCopy = self->_editedCopy;
  self->_editedCopy = 0;
}

- (NSURL)editedFileURL
{
  return [(QLPreviewItemEditedCopy *)self->_editedCopy url];
}

- (BOOL)supportsChromelessUI
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  unint64_t v3 = [(QLItem *)self previewItemType];
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 1;
  }
  if (v3 != 1) {
    return v3 == 11;
  }
  id v6 = [(QLItem *)self UTIAnalyzer];
  BOOL v4 = ([v6 isAudioOnly] & 1) == 0 && (_os_feature_enabled_impl() & 1) != 0;

  return v4;
}

- (BOOL)shouldOpenInFullScreen
{
  if (!_os_feature_enabled_impl()) {
    goto LABEL_6;
  }
  unint64_t v3 = [(QLItem *)self previewItemType];
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v3 == 1)
    {
      id v5 = [(QLItem *)self UTIAnalyzer];
      int v4 = [v5 isAudioOnly] ^ 1;

      return v4;
    }
LABEL_6:
    LOBYTE(v4) = 0;
    return v4;
  }
  LOBYTE(v4) = 1;
  return v4;
}

+ (id)customExtensionCommunicationEncodedClasses
{
  if (customExtensionCommunicationEncodedClasses_onceToken != -1) {
    dispatch_once(&customExtensionCommunicationEncodedClasses_onceToken, &__block_literal_global_137);
  }
  v2 = (void *)customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses;
  return v2;
}

uint64_t __52__QLItem_customExtensionCommunicationEncodedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)encodedClasses
{
  if (encodedClasses_onceToken != -1) {
    dispatch_once(&encodedClasses_onceToken, &__block_literal_global_144);
  }
  uint64_t v2 = (void *)encodedClasses__encodedClasses;
  return v2;
}

void __24__QLItem_encodedClasses__block_invoke()
{
  v0 = +[QLItemFetcherFactory possibleFetcherClasses];
  id v4 = (id)[v0 mutableCopy];

  [v4 addObject:objc_opt_class()];
  uint64_t v1 = +[QLItem customExtensionCommunicationEncodedClasses];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  uint64_t v3 = (void *)encodedClasses__encodedClasses;
  encodedClasses__encodedClasses = v2;
}

- (BOOL)hasDeterminedPredictedPreferredContentSizeForOrbPlatter
{
  return self->hasDeterminedPredictedPreferredContentSizeForOrbPlatter;
}

- (void)setHasDeterminedPredictedPreferredContentSizeForOrbPlatter:(BOOL)a3
{
  self->hasDeterminedPredictedPreferredContentSizeForOrbPlatter = a3;
}

- (CGSize)preferredContentSizeForOrbPlatter
{
  double width = self->preferredContentSizeForOrbPlatter.width;
  double height = self->preferredContentSizeForOrbPlatter.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSizeForOrbPlatter:(CGSize)a3
{
  self->preferredContentSizeForOrbPlatter = a3;
}

- (BOOL)useFullPDFTransition
{
  return self->_useFullPDFTransition;
}

- (void)setUseFullPDFTransition:(BOOL)a3
{
  self->_useFullPDFTransition = a3;
}

- (BOOL)useLoadingTimeout
{
  return self->_useLoadingTimeout;
}

- (void)setUseLoadingTimeout:(BOOL)a3
{
  self->_useLoadingTimeout = a3;
}

- (NSNumber)previewItemProviderProgress
{
  return self->_previewItemProviderProgress;
}

- (BOOL)wantsPreviewInDebugViewController
{
  return self->_wantsPreviewInDebugViewController;
}

- (void)setWantsPreviewInDebugViewController:(BOOL)a3
{
  self->_wantsPreviewInDebugViewController = a3;
}

- (FPItem)fpItem
{
  return (FPItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFpItem:(id)a3
{
}

- (void)setOriginalPreviewItem:(id)a3
{
}

- (void)setPreviewItemURL:(id)a3
{
}

- (NSData)previewItemData
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPreviewItemData:(id)a3
{
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_stringEncoding = a3;
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAttachments:(id)a3
{
}

- (QLTBitmapFormat)bitmapFormat
{
  return (QLTBitmapFormat *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBitmapFormat:(id)a3
{
}

- (QLURLHandler)generatedURLHandler
{
  return (QLURLHandler *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGeneratedURLHandler:(id)a3
{
}

- (QLPreviewItemDataProvider)previewItemDataProvider
{
  return (QLPreviewItemDataProvider *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPreviewItemDataProvider:(id)a3
{
}

- (NSString)searchableItemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSearchableItemIdentifier:(id)a3
{
}

- (NSString)spotlightQueryString
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSpotlightQueryString:(id)a3
{
}

- (NSString)searchableItemApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSearchableItemApplicationBundleIdentifier:(id)a3
{
}

- (NSString)relativePath
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRelativePath:(id)a3
{
}

- (NSItemProvider)previewItemProvider
{
  return (NSItemProvider *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPreviewItemProvider:(id)a3
{
}

- (void)setItemSize:(id)a3
{
}

- (void)setThumbnailGenerator:(id)a3
{
}

- (QLUTIAnalyzer)UTIAnalyzer
{
  return self->_UTIAnalyzer;
}

- (void)setUTIAnalyzer:(id)a3
{
}

- (void)setPreviewItemContentType:(id)a3
{
}

- (UIColor)backgroundColorOverride
{
  return self->_backgroundColorOverride;
}

- (void)setBackgroundColorOverride:(id)a3
{
}

- (void)setPreviewItemTitle:(id)a3
{
}

- (QLPreviewItemEditedCopy)editedCopy
{
  return self->_editedCopy;
}

- (QLPreviewItemEditedCopy)lastSavedEditedCopy
{
  return self->_lastSavedEditedCopy;
}

- (void)setLastSavedEditedCopy:(id)a3
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPassword:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (void)setPreviewItemType:(unint64_t)a3
{
  self->_unint64_t previewItemType = a3;
}

- (int64_t)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int64_t)a3
{
  self->_processIdentifier = a3;
}

- (void)setIsPromisedItem:(BOOL)a3
{
  self->_isPromisedItem = a3;
}

- (BOOL)canBeEdited
{
  return self->_canBeEdited;
}

- (void)setCanBeEdited:(BOOL)a3
{
  self->_canBeEdited = a3;
}

- (BOOL)canHandleEditedCopy
{
  return self->_canHandleEditedCopy;
}

- (void)setCanHandleEditedCopy:(BOOL)a3
{
  self->_canHandleEditedCopy = a3;
}

- (BOOL)originalContentWasUpdated
{
  return self->_originalContentWasUpdated;
}

- (void)setOriginalContentWasUpdated:(BOOL)a3
{
  self->_originalContentWasUpdated = a3;
}

- (BOOL)shouldPreventMachineReadableCodeDetection
{
  return self->_shouldPreventMachineReadableCodeDetection;
}

- (void)setShouldPreventMachineReadableCodeDetection:(BOOL)a3
{
  self->_shouldPreventMachineReadableCodeDetection = a3;
}

- (int64_t)editingMode
{
  return self->_editingMode;
}

- (void)setEditingMode:(int64_t)a3
{
  self->_editingMode = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (unint64_t)editedFileBehavior
{
  return self->_editedFileBehavior;
}

- (void)setEditedFileBehavior:(unint64_t)a3
{
  self->_editedFileBehavior = a3;
}

- (void)setInternalShouldCreateTemporaryDirectoryInHost:(id)a3
{
}

- (BOOL)hasDeterminedThirdPartyPreviewExtensionType
{
  return self->_hasDeterminedThirdPartyPreviewExtensionType;
}

- (void)setHasDeterminedThirdPartyPreviewExtensionType:(BOOL)a3
{
  self->_hasDeterminedThirdPartyPreviewExtensionType = a3;
}

- (unint64_t)previewExtensionType
{
  return self->_previewExtensionType;
}

- (void)setPreviewExtensionType:(unint64_t)a3
{
  self->_previewExtensionType = a3;
}

- (BOOL)hasDeterminedShouldUseExtensionThumbnail
{
  return self->_hasDeterminedShouldUseExtensionThumbnail;
}

- (void)setHasDeterminedShouldUseExtensionThumbnail:(BOOL)a3
{
  self->_hasDeterminedShouldUseExtensionThumbnail = a3;
}

- (BOOL)shouldUseExtensionThumbnail
{
  return self->_shouldUseExtensionThumbnail;
}

- (void)setShouldUseExtensionThumbnail:(BOOL)a3
{
  self->_shouldUseExtensionThumbnail = a3;
}

- (FPSandboxingURLWrapper)sandboxingURLWrapper
{
  return self->_sandboxingURLWrapper;
}

- (void)setSandboxingURLWrapper:(id)a3
{
}

- (void)setClientPreviewOptions:(id)a3
{
}

- (void)setClientPreviewItemDisplayState:(id)a3
{
}

- (QLGeneratorFetcher)generationFetcher
{
  return (QLGeneratorFetcher *)objc_getProperty(self, a2, 312, 1);
}

- (void)setGenerationFetcher:(id)a3
{
}

- (NSString)generatedItemContentType
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setGeneratedItemContentType:(id)a3
{
}

- (void)setGeneratedPreviewItemType:(unint64_t)a3
{
  self->_unint64_t generatedPreviewItemType = a3;
}

- (unint64_t)generatedReplyType
{
  return self->_generatedReplyType;
}

- (void)setGeneratedReplyType:(unint64_t)a3
{
  self->_generatedReplyType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedItemContentType, 0);
  objc_storeStrong((id *)&self->_generationFetcher, 0);
  objc_storeStrong((id *)&self->_clientPreviewItemDisplayState, 0);
  objc_storeStrong((id *)&self->_clientPreviewOptions, 0);
  objc_storeStrong((id *)&self->_sandboxingURLWrapper, 0);
  objc_storeStrong((id *)&self->_internalShouldCreateTemporaryDirectoryInHost, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_lastSavedEditedCopy, 0);
  objc_storeStrong((id *)&self->_editedCopy, 0);
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColorOverride, 0);
  objc_storeStrong((id *)&self->_previewItemContentType, 0);
  objc_storeStrong((id *)&self->_UTIAnalyzer, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_itemSize, 0);
  objc_storeStrong((id *)&self->_previewItemProvider, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_searchableItemApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifier, 0);
  objc_storeStrong((id *)&self->_previewItemDataProvider, 0);
  objc_storeStrong((id *)&self->_generatedURLHandler, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_previewItemData, 0);
  objc_storeStrong((id *)&self->_previewItemURL, 0);
  objc_storeStrong((id *)&self->_originalPreviewItem, 0);
  objc_storeStrong((id *)&self->_fpItem, 0);
  objc_storeStrong((id *)&self->_previewItemProviderProgress, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
}

+ (id)supportedContentTypeIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__QLItem_PreviewInfo__supportedContentTypeIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedContentTypeIdentifiers_once != -1) {
    dispatch_once(&supportedContentTypeIdentifiers_once, block);
  }
  uint64_t v2 = (void *)supportedContentTypeIdentifiers_sSupportedTypeIdentifiers;
  return v2;
}

void __54__QLItem_PreviewInfo__supportedContentTypeIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [*(id *)(a1 + 32) contentTypesToPreviewTypes];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = [v1 setWithArray:v2];
  id v4 = (void *)supportedContentTypeIdentifiers_sSupportedTypeIdentifiers;
  supportedContentTypeIdentifiers_sSupportedTypeIdentifiers = v3;
}

+ (id)supportedContentTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__QLItem_PreviewInfo__supportedContentTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedContentTypes_once != -1) {
    dispatch_once(&supportedContentTypes_once, block);
  }
  uint64_t v2 = (void *)supportedContentTypes_sSupportedTypes;
  return v2;
}

void __44__QLItem_PreviewInfo__supportedContentTypes__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [*(id *)(a1 + 32) contentTypesToPreviewTypes];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = [v1 setWithArray:v2];
  id v4 = (void *)supportedContentTypes_sSupportedTypes;
  supportedContentTypes_sSupportedTypes = v3;
}

+ (id)webContentTypes
{
  if (webContentTypes_once != -1) {
    dispatch_once(&webContentTypes_once, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)webContentTypes_sSet;
  return v2;
}

void __38__QLItem_PreviewInfo__webContentTypes__block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v1 = (void *)webContentTypes_sSet;
  webContentTypes_sSet = v0;

  uint64_t v2 = (void *)webContentTypes_sSet;
  uint64_t v3 = +[QLPreviewConverter convertibleTypes];
  [v2 unionSet:v3];

  id v4 = (void *)webContentTypes_sSet;
  uint64_t v5 = *MEMORY[0x1E4F443F0];
  v7[0] = *MEMORY[0x1E4F444C0];
  v7[1] = v5;
  v7[2] = *MEMORY[0x1E4F44538];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  [v4 addObjectsFromArray:v6];
}

+ (id)rtfContentTypes
{
  if (rtfContentTypes_once != -1) {
    dispatch_once(&rtfContentTypes_once, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)rtfContentTypes_sSet;
  return v2;
}

uint64_t __38__QLItem_PreviewInfo__rtfContentTypes__block_invoke()
{
  rtfContentTypes_sSet = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", *MEMORY[0x1E4F444A0], *MEMORY[0x1E4F444A8], *MEMORY[0x1E4F443C0], 0);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)contentTypeConformsToRTFD:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
  id v4 = +[QLItem rtfContentTypes];
  char v5 = _QLContentTypeConformsToContentTypeInSet(v3, v4);

  return v5;
}

+ (id)contentTypesToPreviewTypes
{
  if (contentTypesToPreviewTypes_once != -1) {
    dispatch_once(&contentTypesToPreviewTypes_once, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)contentTypesToPreviewTypes_sSupportedTypes;
  return v2;
}

void __49__QLItem_PreviewInfo__contentTypesToPreviewTypes__block_invoke()
{
  v59[15] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F44358];
  v58[0] = *MEMORY[0x1E4F44450];
  v58[1] = v0;
  v59[0] = &unk_1F3DD2C80;
  v59[1] = &unk_1F3DD2C98;
  uint64_t v1 = *MEMORY[0x1E4F44328];
  v58[2] = *MEMORY[0x1E4F44518];
  v58[3] = v1;
  v59[2] = &unk_1F3DD2CB0;
  v59[3] = &unk_1F3DD2CC8;
  uint64_t v2 = *MEMORY[0x1E4F444A0];
  v58[4] = *MEMORY[0x1E4F44470];
  v58[5] = v2;
  v59[4] = &unk_1F3DD2CE0;
  v59[5] = &unk_1F3DD2CE0;
  uint64_t v3 = *MEMORY[0x1E4F443C0];
  v58[6] = *MEMORY[0x1E4F444A8];
  v58[7] = v3;
  v59[6] = &unk_1F3DD2CE0;
  v59[7] = &unk_1F3DD2CE0;
  uint64_t v4 = *MEMORY[0x1E4F44420];
  v58[8] = *MEMORY[0x1E4F44418];
  v58[9] = v4;
  v59[8] = &unk_1F3DD2CE0;
  v59[9] = &unk_1F3DD2CF8;
  uint64_t v5 = *MEMORY[0x1E4F443F0];
  v58[10] = *MEMORY[0x1E4F444C0];
  v58[11] = v5;
  v59[10] = &unk_1F3DD2D10;
  v59[11] = &unk_1F3DD2D10;
  uint64_t v6 = *MEMORY[0x1E4F44488];
  v58[12] = *MEMORY[0x1E4F44538];
  v58[13] = v6;
  v59[12] = &unk_1F3DD2D10;
  v59[13] = &unk_1F3DD2CE0;
  v58[14] = *MEMORY[0x1E4F44550];
  v59[14] = &unk_1F3DD2CE0;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:15];
  uint64_t v8 = [v7 mutableCopy];
  char v9 = (void *)contentTypesToPreviewTypes_sSupportedTypes;
  contentTypesToPreviewTypes_sSupportedTypes = v8;

  uint64_t v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.web-internet-location"];
  unint64_t v11 = (NSObject **)MEMORY[0x1E4F945F0];
  v40 = (void *)v10;
  if (v10)
  {
    [(id)contentTypesToPreviewTypes_sSupportedTypes setObject:&unk_1F3DD2D28 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_FAULT, "UTI com.apple.web-internet-location not recognized by the system #UTI", buf, 2u);
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.ndjson"];
  uint64_t v39 = (void *)v13;
  if (v13)
  {
    objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1F3DD2CE0, v13, v13, v40);
  }
  else
  {
    int v14 = *v11;
    if (!*v11)
    {
      QLSInitLogging();
      int v14 = *v11;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v14, OS_LOG_TYPE_FAULT, "UTI public.ndjson not recognized by the system #UTI", buf, 2u);
    }
  }
  if (_os_feature_enabled_impl()) {
    [(id)contentTypesToPreviewTypes_sSupportedTypes setObject:&unk_1F3DD2D40 forKeyedSubscript:*MEMORY[0x1E4F442F0]];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  CFArrayRef v15 = CGImageSourceCopyTypeIdentifiers();
  uint64_t v16 = [(__CFArray *)v15 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", v20, v39);
        if (v21)
        {
          [(id)contentTypesToPreviewTypes_sSupportedTypes setObject:&unk_1F3DD2D58 forKeyedSubscript:v21];
        }
        else
        {
          v22 = *MEMORY[0x1E4F945F0];
          if (!*MEMORY[0x1E4F945F0])
          {
            QLSInitLogging();
            v22 = *MEMORY[0x1E4F945F0];
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v56 = v20;
            _os_log_impl(&dword_1E2805000, v22, OS_LOG_TYPE_DEBUG, "Invalid UTI %@ returned by CGImageSourceCopyTypeIdentifiers() #UTI", buf, 0xCu);
          }
        }
      }
      uint64_t v17 = [(__CFArray *)v15 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v17);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v23 = [MEMORY[0x1E4F166C8] audiovisualTypes];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        uint64_t v29 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", v28, v39);
        if (v29)
        {
          [(id)contentTypesToPreviewTypes_sSupportedTypes setObject:&unk_1F3DD2D70 forKeyedSubscript:v29];
        }
        else
        {
          v30 = *MEMORY[0x1E4F945F0];
          if (!*MEMORY[0x1E4F945F0])
          {
            QLSInitLogging();
            v30 = *MEMORY[0x1E4F945F0];
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v56 = v28;
            _os_log_impl(&dword_1E2805000, v30, OS_LOG_TYPE_DEBUG, "Invalid UTI %@ returned by [AVURLAsset audiovisualTypes] #UTI", buf, 0xCu);
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v25);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v31 = +[QLPreviewConverter convertibleUTIs];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v41 + 1) + 8 * k);
        uint64_t v37 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", v36, v39);
        if (v37)
        {
          [(id)contentTypesToPreviewTypes_sSupportedTypes setObject:&unk_1F3DD2D10 forKeyedSubscript:v37];
        }
        else
        {
          int v38 = *MEMORY[0x1E4F945F0];
          if (!*MEMORY[0x1E4F945F0])
          {
            QLSInitLogging();
            int v38 = *MEMORY[0x1E4F945F0];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v56 = v36;
            _os_log_impl(&dword_1E2805000, v38, OS_LOG_TYPE_FAULT, "Invalid UTI %@ returned by [QLPreviewConverter convertibleUTIs] #UTI", buf, 0xCu);
          }
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v33);
  }

  [(id)contentTypesToPreviewTypes_sSupportedTypes setObject:&unk_1F3DD2CE0 forKeyedSubscript:*MEMORY[0x1E4F44548]];
}

- (unint64_t)_uncachedExtensionPreviewItemType
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(QLItem *)self previewItemContentType];
  if (v3
    && ([MEMORY[0x1E4F442D8] typeWithIdentifier:v3],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 _isWildcard],
        v4,
        (v5 & 1) != 0)
    || (unint64_t v6 = [(QLItem *)self previewExtensionTypeToUse], v6 == 15))
  {
    int v7 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      unint64_t v11 = v3;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_DEFAULT, "Could not determine preview item type because type is wildcard or 3rd party extension not allowed: %@ #PreviewItem", (uint8_t *)&v10, 0xCu);
    }
    unint64_t v6 = 15;
  }

  return v6;
}

- (unint64_t)_uncachedPreviewItemTypeForContentType:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
  }
  else
  {
    char v5 = 0;
  }
  unint64_t v6 = +[QLItem contentTypesToPreviewTypes];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 15;
  if (+[QLItem contentTypeConformsToRTFD:v4])
  {
    unint64_t v7 = 4;
  }
  else
  {
    uint64_t v8 = +[QLItem webContentTypes];
    if (_QLContentTypeConformsToContentTypeInSet(v5, v8))
    {
      if (+[QLItem _previewExtensionKindForContentType:v4 firstPartyExtension:1] == 15)unint64_t v7 = 6; {
      else
      }
        unint64_t v7 = 12;
    }
    else if (_os_feature_enabled_impl() {
           && ([v5 conformsToType:*MEMORY[0x1E4F442F0]] & 1) != 0)
    }
    {
      unint64_t v7 = 5;
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F44418];
      if (![v5 conformsToType:*MEMORY[0x1E4F44418]]
        || ([v5 isEqual:v9] & 1) != 0
        || (unint64_t v7 = [(QLItem *)self _uncachedExtensionPreviewItemType], v7 == 15))
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        uint64_t v16 = __62__QLItem_PreviewInfo___uncachedPreviewItemTypeForContentType___block_invoke;
        uint64_t v17 = &unk_1E6DD40E0;
        id v10 = v5;
        id v18 = v10;
        uint64_t v19 = &v20;
        [v6 enumerateKeysAndObjectsUsingBlock:&v14];
        unint64_t v7 = v21[3];
        if (v7 == 15)
        {
          unint64_t v11 = (NSObject **)MEMORY[0x1E4F945F0];
          uint64_t v12 = *MEMORY[0x1E4F945F0];
          if (!*MEMORY[0x1E4F945F0])
          {
            QLSInitLogging();
            uint64_t v12 = *v11;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v10;
          }
          unint64_t v7 = [(QLItem *)self _uncachedExtensionPreviewItemType];
        }
      }
    }
  }
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __62__QLItem_PreviewInfo___uncachedPreviewItemTypeForContentType___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) conformsToType:a2])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 integerValue];
    *a4 = 1;
  }
}

- (unint64_t)_getPreviewItemType
{
  uint64_t v3 = [(QLItem *)self previewItemContentType];
  if (v3)
  {
    unint64_t v4 = [(QLItem *)self _previewItemTypeForType:v3];
LABEL_5:
    unint64_t v6 = v4;
    goto LABEL_6;
  }
  char v5 = [(QLItem *)self searchableItemIdentifier];

  if (v5)
  {
    unint64_t v4 = [(QLItem *)self _uncachedExtensionPreviewItemType];
    goto LABEL_5;
  }
  uint64_t v8 = (NSObject **)MEMORY[0x1E4F945F0];
  uint64_t v9 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    uint64_t v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_DEFAULT, "Could not determine preview item type of preview item because content type is nil #PreviewItem", v10, 2u);
  }
  unint64_t v6 = 15;
LABEL_6:

  return v6;
}

- (unint64_t)_getGeneratedItemType
{
  uint64_t v3 = [(QLItem *)self generatedItemContentType];
  unint64_t v4 = [(id)*MEMORY[0x1E4F44400] identifier];
  if (![v3 isEqualToString:v4])
  {

    goto LABEL_5;
  }
  unint64_t v5 = [(QLItem *)self generatedReplyType];

  if (v5)
  {
LABEL_5:
    unint64_t v6 = [(QLItem *)self _previewItemTypeForType:v3];
    goto LABEL_6;
  }
  unint64_t v6 = 2;
LABEL_6:

  return v6;
}

- (unint64_t)_previewItemTypeForType:(id)a3
{
  id v4 = a3;
  if (_previewItemTypeForType__once != -1) {
    dispatch_once(&_previewItemTypeForType__once, &__block_literal_global_41);
  }
  id v5 = (id)_previewItemTypeForType__sCache;
  objc_sync_enter(v5);
  unint64_t v6 = [(id)_previewItemTypeForType__sCache objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    unint64_t v7 = [v6 integerValue];
    if (v7 == 15) {
      unint64_t v7 = [(QLItem *)self _uncachedExtensionPreviewItemType];
    }
  }
  else
  {
    unint64_t v7 = [(QLItem *)self _uncachedPreviewItemTypeForContentType:v4];
    id v8 = (id)_previewItemTypeForType__sCache;
    objc_sync_enter(v8);
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7];
    [(id)_previewItemTypeForType__sCache setObject:v9 forKeyedSubscript:v4];

    objc_sync_exit(v8);
  }

  return v7;
}

uint64_t __47__QLItem_PreviewInfo___previewItemTypeForType___block_invoke()
{
  _previewItemTypeForType__sCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isStandardQuickLookType
{
  unint64_t v2 = [(QLItem *)self previewItemType];
  return v2 != 15 && (v2 & 0xFFFFFFFFFFFFFFFDLL) != 12;
}

+ (unint64_t)_previewExtensionKindForContentType:(id)a3 firstPartyExtension:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F945C0];
  id v6 = a3;
  unint64_t v7 = [v5 sharedManager];
  LOBYTE(v11) = 1;
  id v8 = [v7 extensionForContentType:v6 allowExtensionsForParentTypes:v4 firstPartyExtension:v4 applicationBundleIdentifier:0 extensionPath:0 extensionType:0 generationType:1 shouldUseRestrictedExtension:v11];

  if (v8)
  {
    if ([v8 isGenerationPreview]) {
      unint64_t v9 = 13;
    }
    else {
      unint64_t v9 = 12;
    }
  }
  else
  {
    unint64_t v9 = 15;
  }

  return v9;
}

- (unint64_t)previewExtensionTypeToUse
{
  if (![(QLItem *)self hasDeterminedThirdPartyPreviewExtensionType])
  {
    uint64_t v3 = [MEMORY[0x1E4F945C0] sharedManager];
    BOOL v4 = [(QLItem *)self searchableItemIdentifier];

    if (v4)
    {
      id v5 = [(QLItem *)self searchableItemApplicationBundleIdentifier];
      int v6 = [v3 existsExtensionForContentType:0 allowExtensionsForParentTypes:0 applicationBundleIdentifier:v5 extensionType:0 generationType:2];

      if (v6) {
        unint64_t v7 = 14;
      }
      else {
        unint64_t v7 = 15;
      }
    }
    else
    {
      id v8 = [(QLItem *)self previewItemContentType];
      unint64_t v7 = +[QLItem _previewExtensionKindForContentType:v8 firstPartyExtension:0];
    }
    [(QLItem *)self setPreviewExtensionType:v7];
    [(QLItem *)self setHasDeterminedThirdPartyPreviewExtensionType:1];
  }
  return [(QLItem *)self previewExtensionType];
}

- (BOOL)useExtensionThumbnail
{
  if (![(QLItem *)self hasDeterminedShouldUseExtensionThumbnail])
  {
    if ([(QLItem *)self isStandardQuickLookType])
    {
      [(QLItem *)self setShouldUseExtensionThumbnail:0];
    }
    else
    {
      uint64_t v3 = [MEMORY[0x1E4F945C0] sharedManager];
      BOOL v4 = [(QLItem *)self searchableItemIdentifier];

      if (v4)
      {
        [(QLItem *)self setShouldUseExtensionThumbnail:0];
        id v5 = [(QLItem *)self searchableItemApplicationBundleIdentifier];
        int v6 = [v3 existsExtensionForContentType:0 allowExtensionsForParentTypes:0 applicationBundleIdentifier:v5 extensionType:1 generationType:2];
      }
      else
      {
        id v5 = [(QLItem *)self previewItemContentType];
        -[QLItem setShouldUseExtensionThumbnail:](self, "setShouldUseExtensionThumbnail:", [v3 existsExtensionForContentType:v5 allowExtensionsForParentTypes:0 applicationBundleIdentifier:0 extensionType:1 generationType:1]);

        int v6 = 0;
      }
      [(QLItem *)self setShouldUseExtensionThumbnail:v6 | [(QLItem *)self shouldUseExtensionThumbnail]];
      if (v4) {
    }
      }
    [(QLItem *)self setHasDeterminedShouldUseExtensionThumbnail:1];
  }
  return [(QLItem *)self shouldUseExtensionThumbnail];
}

- (double)maxLoadingTime
{
  if (([(QLItem *)self previewItemType] & 0xFFFFFFFFFFFFFFFDLL) != 0xC) {
    return 0.0;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F945C0], "ql_previewExtensionCustomLoadingTimeForItem:", self);
  if (!v3) {
    return 0.0;
  }
  BOOL v4 = v3;
  [v3 doubleValue];
  double v6 = v5;

  return v6;
}

- (unint64_t)maximumNumberOfCachedPreviews
{
  unint64_t v2 = [(QLItem *)self previewItemType];
  if (v2 - 2 > 7) {
    return 0;
  }
  else {
    return qword_1E282B440[v2 - 2];
  }
}

@end