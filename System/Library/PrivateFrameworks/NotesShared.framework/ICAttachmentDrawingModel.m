@interface ICAttachmentDrawingModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)canSaveURL;
- (BOOL)hasPreviews;
- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4;
- (BOOL)observingAttachment;
- (BOOL)preferLocalPreviewImages;
- (BOOL)previewsSupportMultipleAppearances;
- (BOOL)shouldSyncPreviewImageToCloud:(id)a3;
- (BOOL)supportsQuickLook;
- (CGAffineTransform)previewImageOrientationTransform;
- (ICAttachmentDrawingModel)initWithAttachment:(id)a3;
- (ICDrawing)drawing;
- (id)drawingDocument;
- (id)previewImageURL;
- (id)previewItemTitle;
- (id)previewItemURL;
- (id)saveURL;
- (int64_t)previewImageOrientation;
- (void)dealloc;
- (void)drawingPreviewIsUpToDate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setObservingAttachment:(BOOL)a3;
- (void)startObservingAttachment;
- (void)stopObservingAttachment:(id)a3;
- (void)writeMergeableData;
@end

@implementation ICAttachmentDrawingModel

- (ICAttachmentDrawingModel)initWithAttachment:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICAttachmentDrawingModel;
  v3 = [(ICAttachmentModel *)&v6 initWithAttachment:a3];
  v4 = v3;
  if (v3) {
    [(ICAttachmentDrawingModel *)v3 startObservingAttachment];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(ICAttachmentModel *)self attachment];

  if (v3)
  {
    v4 = [(ICAttachmentModel *)self attachment];
    [(ICAttachmentDrawingModel *)self stopObservingAttachment:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentDrawingModel;
  [(ICAttachmentModel *)&v5 dealloc];
}

- (void)startObservingAttachment
{
  if (![(ICAttachmentDrawingModel *)self observingAttachment])
  {
    v3 = [(ICAttachmentModel *)self attachment];
    objc_msgSend(v3, "ic_addObserver:forKeyPath:context:", self, @"mergeableData", &compoundliteral_0);

    [(ICAttachmentDrawingModel *)self setObservingAttachment:1];
  }
}

- (void)stopObservingAttachment:(id)a3
{
  id v7 = a3;
  if ([(ICAttachmentDrawingModel *)self observingAttachment])
  {
    uint64_t v4 = [(ICAttachmentModel *)self attachment];
    if (v4)
    {
      objc_super v5 = (void *)v4;
      id v6 = [(ICAttachmentModel *)self attachment];

      if (v6 != v7) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"!self.attachment || self.attachment == attachment", "-[ICAttachmentDrawingModel stopObservingAttachment:]", 1, 0, @"unexpected attachment %@ in stopObservingAttachment for %@", v7, self functionName simulateCrash showAlert format];
      }
    }
    objc_msgSend(v7, "ic_removeObserver:forKeyPath:context:", self, @"mergeableData", &compoundliteral_0);
    [(ICAttachmentDrawingModel *)self setObservingAttachment:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICAttachmentDrawingModel *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/Shared/CoreData/AttachmentModel/ICAttachmentDrawingModel.m"])
  {
    char v13 = [(ICAttachmentDrawingModel *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &compoundliteral_0 && (v13 & 1) == 0 && self->_drawingDocument)
    {
      id v18 = [(ICAttachmentModel *)self attachment];
      if (![v18 faultingState])
      {
        v14 = [(ICAttachmentModel *)self attachment];
        char v15 = [v14 isSettingMergeableData];

        if (v15) {
          return;
        }
        v16 = [(ICAttachmentModel *)self attachment];
        id v18 = [v16 mergeableData];

        [(ICAttachmentModel *)self mergeWithMergeableData:v18];
        v17 = [(ICAttachmentModel *)self attachment];
        [v17 saveMergeableDataIfNeeded];
      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ICAttachmentDrawingModel;
    [(ICAttachmentDrawingModel *)&v19 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  uint64_t v4 = NSString;
  objc_super v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_SKETCHES_%lu" value:@"NOTE_LIST_SKETCHES_%lu" table:0 allowSiri:1];
  id v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (ICDrawing)drawing
{
  v2 = [(ICAttachmentDrawingModel *)self drawingDocument];
  v3 = [v2 drawing];

  return (ICDrawing *)v3;
}

- (id)drawingDocument
{
  drawingDocument = self->_drawingDocument;
  if (!drawingDocument)
  {
    uint64_t v4 = [ICDrawingVersionedDocument alloc];
    objc_super v5 = [(ICAttachmentModel *)self attachment];
    id v6 = [v5 mergeableData];
    id v7 = [(ICAttachmentModel *)self currentReplicaID];
    v8 = [(ICTTVersionedDocument *)v4 initWithData:v6 replicaID:v7];
    v9 = self->_drawingDocument;
    self->_drawingDocument = v8;

    drawingDocument = self->_drawingDocument;
  }
  return drawingDocument;
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  id v6 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentDrawingModel mergeWithMergeableData:mergeableFieldState:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  v14 = [ICDrawingVersionedDocument alloc];
  char v15 = [(ICAttachmentModel *)self currentReplicaID];
  v16 = [(ICTTVersionedDocument *)v14 initWithData:v5 replicaID:v15];

  v17 = [(ICAttachmentDrawingModel *)self drawingDocument];
  uint64_t v18 = [v17 mergeWithDrawingVersionedDocument:v16];

  BOOL v19 = v18 == 2;
  if (v18 == 2)
  {
    v20 = [(ICAttachmentModel *)self attachment];
    v21 = [v20 previewUpdateDate];
    v22 = [(ICAttachmentModel *)self attachment];
    v23 = [v22 modificationDate];
    uint64_t v24 = [v21 compare:v23];

    if (v24 != -1)
    {
      v25 = [(ICAttachmentModel *)self attachment];
      [v25 setPreviewUpdateDate:0];
    }
    v26 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentDrawingModel mergeWithMergeableData:mergeableFieldState:](v26, v27, v28, v29, v30, v31, v32, v33);
    }

    [(ICAttachmentModel *)self setMergeableDataDirty:1];
  }

  return v19;
}

- (void)writeMergeableData
{
  [(ICAttachmentModel *)self setMergeableDataDirty:0];
  id v5 = [(ICAttachmentDrawingModel *)self drawingDocument];
  v3 = [v5 serialize];
  uint64_t v4 = [(ICAttachmentModel *)self attachment];
  [v4 setMergeableData:v3];
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 1;
}

- (id)saveURL
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__29;
  uint64_t v12 = __Block_byref_object_dispose__29;
  id v13 = 0;
  v3 = [(ICAttachmentModel *)self attachment];
  uint64_t v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ICAttachmentDrawingModel_saveURL__block_invoke;
  v7[3] = &unk_1E64A44A8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __35__ICAttachmentDrawingModel_saveURL__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  +[ICDrawing defaultPixelSize];
  objc_msgSend(v2, "attachmentPreviewImageWithMinSize:scale:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = [v6 orientedPreviewImageURL];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)canSaveURL
{
  return 1;
}

- (BOOL)supportsQuickLook
{
  return 0;
}

- (BOOL)preferLocalPreviewImages
{
  return 1;
}

- (void)drawingPreviewIsUpToDate
{
}

- (CGAffineTransform)previewImageOrientationTransform
{
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  uint64_t v4 = (int)[v3 orientation];

  +[ICDrawing defaultSize];
  +[ICDrawing fullSize:forOrientation:](ICDrawing, "fullSize:forOrientation:", v4);
  return +[ICDrawing orientationTransform:size:](ICDrawing, "orientationTransform:size:", v4);
}

- (int64_t)previewImageOrientation
{
  v2 = [(ICAttachmentModel *)self attachment];
  int64_t v3 = (int)[v2 orientation];

  return v3;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  id v3 = a3;
  [v3 width];
  double v5 = v4;
  [v3 height];
  if (v5 < v6) {
    double v5 = v6;
  }
  [v3 scale];
  double v8 = v7 * v5;
  int v9 = [v3 appearanceType];

  return v8 <= 640.0 && v9 == 0;
}

- (id)previewImageURL
{
  v2 = [(ICAttachmentModel *)self attachment];
  +[ICDrawing defaultPixelSize];
  id v3 = objc_msgSend(v2, "attachmentPreviewImageWithMinSize:scale:");

  double v4 = [v3 orientedPreviewImageURL];

  return v4;
}

- (id)previewItemTitle
{
  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentDrawingModel;
  id v3 = [(ICAttachmentModel *)&v9 previewItemTitle];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(ICAttachmentModel *)self attachment];
    double v7 = [v6 note];
    id v5 = [v7 title];
  }
  return v5;
}

- (id)previewItemURL
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__29;
  uint64_t v12 = __Block_byref_object_dispose__29;
  id v13 = 0;
  id v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ICAttachmentDrawingModel_previewItemURL__block_invoke;
  v7[3] = &unk_1E64A4528;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__ICAttachmentDrawingModel_previewItemURL__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) previewImageURL];
  id v3 = v2;
  if (!v2)
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)ICAttachmentDrawingModel;
    id v3 = objc_msgSendSuper2(&v7, sel_previewItemURL);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (!v2) {

  }
  uint64_t v4 = [*(id *)(a1 + 32) generateHardLinkURLIfNecessaryForURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)observingAttachment
{
  return self->_observingAttachment;
}

- (void)setObservingAttachment:(BOOL)a3
{
  self->_observingAttachment = a3;
}

- (void).cxx_destruct
{
}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end