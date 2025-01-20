@interface QLSingleItemThumbnailGenerator
+ (BOOL)supportsSecureCoding;
- (QLItem)item;
- (QLItemThumbnailGenerator)thumbnailGenerator;
- (QLSingleItemThumbnailGenerator)initWithCoder:(id)a3;
- (QLSingleItemThumbnailGenerator)initWithItem:(id)a3;
- (id)genericIconWithSize:(CGSize)a3;
- (void)_generateUncachedThumbnailWithSize:(CGSize)a3 contentMode:(unint64_t)a4 thumbnailVersion:(id)a5 completionBlock:(id)a6;
- (void)_handleThumbnailGenerationFinishedWithThumbnailRepresentation:(id)a3 size:(CGSize)a4 version:(id)a5 clientCompletionBlock:(id)a6;
- (void)_thumbnailVersionForItem:(id)a3 completionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)generateThumbnailWithSize:(CGSize)a3 completionBlock:(id)a4;
- (void)generateThumbnailWithSize:(CGSize)a3 contentMode:(unint64_t)a4 completionBlock:(id)a5;
- (void)setItem:(id)a3;
- (void)setThumbnailGenerator:(id)a3;
@end

@implementation QLSingleItemThumbnailGenerator

- (QLSingleItemThumbnailGenerator)initWithItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLSingleItemThumbnailGenerator;
  v5 = [(QLSingleItemThumbnailGenerator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    v7 = v6;
  }

  return v6;
}

- (QLItemThumbnailGenerator)thumbnailGenerator
{
  thumbnailGenerator = self->_thumbnailGenerator;
  if (!thumbnailGenerator)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_thumbnailGenerator)
    {
      v5 = (QLItemThumbnailGenerator *)objc_opt_new();
      v6 = self->_thumbnailGenerator;
      self->_thumbnailGenerator = v5;
    }
    objc_sync_exit(v4);

    thumbnailGenerator = self->_thumbnailGenerator;
  }
  v7 = thumbnailGenerator;
  return v7;
}

- (void)_thumbnailVersionForItem:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [v6 fpItem];
  objc_super v9 = [v6 editedFileURL];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F3A6F0]);
    v11 = [v6 editedFileURL];
    v12 = (void *)[v10 initWithFileURL:v11 automaticallyGenerated:1];

LABEL_5:
    v7[2](v7, v12);
    goto LABEL_6;
  }
  if (v8)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F3A6F0]) initWithFPItem:v8 automaticallyGenerated:1];
    goto LABEL_5;
  }
  v12 = [v6 fetcher];
  v13 = [v12 urlForThumbnail];
  if (v13)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F3A6F0]) initWithFileURL:v13 automaticallyGenerated:1];
    v7[2](v7, v14);
  }
  else
  {
    v15 = [(QLSingleItemThumbnailGenerator *)self thumbnailGenerator];
    v16 = [v15 fetcherClassesForPreviewItem:v6];
    v17 = objc_opt_new();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__QLSingleItemThumbnailGenerator__thumbnailVersionForItem_completionBlock___block_invoke;
    v18[3] = &unk_1E6DD3BB0;
    v19 = v7;
    [v12 fetchContentWithAllowedOutputClasses:v16 inQueue:v17 updateBlock:0 completionBlock:v18];
  }
LABEL_6:
}

void __75__QLSingleItemThumbnailGenerator__thumbnailVersionForItem_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_super v9 = (NSObject **)MEMORY[0x1E4F945F0];
    id v10 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v10 = *v9;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v19 = 138412290;
    v20 = v7;
    v11 = "Could not generate thumbnail because an error occurred while fetching the contents of the item: %@. #Thumbnail";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 12;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v15 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        v17 = (NSObject **)MEMORY[0x1E4F945F0];
        QLSInitLogging();
        v15 = *v17;
      }
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      LOWORD(v19) = 0;
      v11 = "Could not get thumbnail version because no versions can be created for data and spotlight contents. #Thumbnail";
      v12 = v15;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v16 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        v18 = (NSObject **)MEMORY[0x1E4F945F0];
        QLSInitLogging();
        v16 = *v18;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      LOWORD(v19) = 0;
      v11 = "Could not get thumbnail version because content of the item is not supported. #Thumbnail";
      v12 = v16;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    }
    uint32_t v14 = 2;
LABEL_20:
    _os_log_impl(&dword_1E2805000, v12, v13, v11, (uint8_t *)&v19, v14);
LABEL_21:
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
    goto LABEL_22;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F3A6F0]) initWithFileURL:v5 automaticallyGenerated:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_22:
}

- (void)generateThumbnailWithSize:(CGSize)a3 completionBlock:(id)a4
{
}

- (void)generateThumbnailWithSize:(CGSize)a3 contentMode:(unint64_t)a4 completionBlock:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  if (v9)
  {
    id v10 = self->_version;
    v11 = self->_thumbnailRepresentation;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    os_log_type_t v13 = self;
    objc_sync_enter(v13);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__QLSingleItemThumbnailGenerator_generateThumbnailWithSize_contentMode_completionBlock___block_invoke;
    v16[3] = &unk_1E6DD42D0;
    v16[4] = v13;
    CGFloat v20 = width;
    CGFloat v21 = height;
    uint32_t v14 = v11;
    v17 = v14;
    v15 = v10;
    v18 = v15;
    id v19 = v9;
    unint64_t v22 = a4;
    [(QLSingleItemThumbnailGenerator *)v13 _thumbnailVersionForItem:WeakRetained completionBlock:v16];

    objc_sync_exit(v13);
  }
}

void __88__QLSingleItemThumbnailGenerator_generateThumbnailWithSize_contentMode_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(double *)(v5 + 24) == *(double *)(a1 + 64) && *(double *)(v5 + 32) == *(double *)(a1 + 72);
  id v12 = v3;
  char v7 = 1;
  if (v6 && v3 && *(void *)(a1 + 40))
  {
    char v8 = [v3 isEqual:*(void *)(a1 + 48)];
    id v4 = v12;
    char v7 = v8 ^ 1;
  }
  id v9 = *(void **)(a1 + 40);
  if (!v9) {
    goto LABEL_13;
  }
  if (!*(void *)(a1 + 48)) {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    v11 = [v9 UIImage];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, *(unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  }
  else
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "_generateUncachedThumbnailWithSize:contentMode:thumbnailVersion:completionBlock:", *(void *)(a1 + 80), v4, *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

- (void)_generateUncachedThumbnailWithSize:(CGSize)a3 contentMode:(unint64_t)a4 thumbnailVersion:(id)a5 completionBlock:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a5;
  id v12 = a6;
  if (width >= height) {
    double v13 = height;
  }
  else {
    double v13 = width;
  }
  if (a4 == 2) {
    double v14 = v13;
  }
  else {
    double v14 = 0.0;
  }
  v15 = [(QLSingleItemThumbnailGenerator *)self thumbnailGenerator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  v17 = [MEMORY[0x1E4F42D90] mainScreen];
  [v17 scale];
  double v19 = v18;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __114__QLSingleItemThumbnailGenerator__generateUncachedThumbnailWithSize_contentMode_thumbnailVersion_completionBlock___block_invoke;
  v22[3] = &unk_1E6DD42F8;
  double v25 = width;
  double v26 = height;
  v22[4] = self;
  id v23 = v11;
  id v24 = v12;
  id v20 = v12;
  id v21 = v11;
  objc_msgSend(v15, "generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:completionBlock:", WeakRetained, v22, width, height, v14, v19);
}

uint64_t __114__QLSingleItemThumbnailGenerator__generateUncachedThumbnailWithSize_contentMode_thumbnailVersion_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleThumbnailGenerationFinishedWithThumbnailRepresentation:size:version:clientCompletionBlock:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)genericIconWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_item = &self->_item;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  uint64_t v7 = [WeakRetained previewItemType];

  if (v7 != 14)
  {
    double v19 = (void *)MEMORY[0x1E4F22430];
    id v20 = objc_loadWeakRetained((id *)p_item);
    id v21 = [v20 previewItemContentType];
    double v13 = [v19 documentProxyForName:&stru_1F3DC97E0 type:v21 MIMEType:0];

    if (width == QLCGSizeFromQLItemThumbnailSize(0) && height == v22)
    {
      uint64_t v23 = 13;
    }
    else
    {
      id v11 = 0;
      if (width != QLCGSizeFromQLItemThumbnailSize(1) || height != v25) {
        goto LABEL_18;
      }
      uint64_t v23 = 12;
    }
    id v11 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v13 format:v23];
LABEL_18:

    goto LABEL_19;
  }
  if (width == QLCGSizeFromQLItemThumbnailSize(0) && height == v8)
  {
    id v24 = (void *)MEMORY[0x1E4F42A80];
    double v13 = objc_loadWeakRetained((id *)p_item);
    double v14 = [v13 searchableItemApplicationBundleIdentifier];
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 scale];
    v16 = v24;
    v17 = v14;
    uint64_t v18 = 13;
    goto LABEL_13;
  }
  id v11 = 0;
  if (width == QLCGSizeFromQLItemThumbnailSize(1) && height == v10)
  {
    id v12 = (void *)MEMORY[0x1E4F42A80];
    double v13 = objc_loadWeakRetained((id *)p_item);
    double v14 = [v13 searchableItemApplicationBundleIdentifier];
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 scale];
    v16 = v12;
    v17 = v14;
    uint64_t v18 = 12;
LABEL_13:
    id v11 = objc_msgSend(v16, "_applicationIconImageForBundleIdentifier:format:scale:", v17, v18);

    goto LABEL_18;
  }
LABEL_19:
  return v11;
}

- (void)_handleThumbnailGenerationFinishedWithThumbnailRepresentation:(id)a3 size:(CGSize)a4 version:(id)a5 clientCompletionBlock:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = (QLThumbnailRepresentation *)a3;
  id v12 = (QLThumbnailVersion *)a5;
  double v19 = (void (**)(id, void *, BOOL))a6;
  double v13 = [(QLThumbnailRepresentation *)v11 UIImage];
  BOOL v14 = [(QLThumbnailRepresentation *)v11 type] != QLThumbnailRepresentationTypeIcon;
  if (!v13)
  {
    double v13 = -[QLSingleItemThumbnailGenerator genericIconWithSize:](self, "genericIconWithSize:", width, height);
    BOOL v14 = 0;
  }
  v15 = self;
  objc_sync_enter(v15);
  v15->_thumbnailSize.double width = width;
  v15->_thumbnailSize.double height = height;
  thumbnailRepresentation = v15->_thumbnailRepresentation;
  v15->_thumbnailRepresentation = v11;
  v17 = v11;

  version = v15->_version;
  v15->_version = v12;

  v15->_isRepresentative = v14;
  objc_sync_exit(v15);

  if (v19) {
    v19[2](v19, v13, v14);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  p_item = &self->_item;
  id WeakRetained = objc_loadWeakRetained((id *)p_item);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_item);
    [v7 encodeObject:v6 forKey:@"generatorItem"];
  }
}

- (QLSingleItemThumbnailGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLSingleItemThumbnailGenerator;
  uint64_t v5 = [(QLSingleItemThumbnailGenerator *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"generatorItem"];
    objc_storeWeak((id *)&v5->_item, v6);

    id v7 = v5;
  }

  return v5;
}

- (void)setThumbnailGenerator:(id)a3
{
}

- (QLItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (QLItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_thumbnailRepresentation, 0);
}

@end