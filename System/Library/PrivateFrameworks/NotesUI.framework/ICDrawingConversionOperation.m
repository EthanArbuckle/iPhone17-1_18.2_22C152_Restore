@interface ICDrawingConversionOperation
- (BOOL)isAutomatic;
- (ICAttachment)attachment;
- (ICBaseTextAttachment)textAttachment;
- (ICDrawingConversionOperation)initWithAttachment:(id)a3 textAttachment:(id)a4 automatic:(BOOL)a5;
- (NSManagedObjectID)attachmentID;
- (NSManagedObjectID)finalAttachmentID;
- (void)main;
- (void)setAttachment:(id)a3;
- (void)setTextAttachment:(id)a3;
@end

@implementation ICDrawingConversionOperation

- (ICDrawingConversionOperation)initWithAttachment:(id)a3 textAttachment:(id)a4 automatic:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDrawingConversionOperation;
  v11 = [(ICDrawingConversionOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_isAutomatic = a5;
    objc_storeStrong((id *)&v11->_attachment, a3);
    uint64_t v13 = [v9 objectID];
    attachmentID = v12->_attachmentID;
    v12->_attachmentID = (NSManagedObjectID *)v13;

    objc_storeStrong((id *)&v12->_textAttachment, a4);
  }

  return v12;
}

- (void)main
{
  v3 = +[ICDrawingPencilKitConverter sharedConverter];
  v4 = [MEMORY[0x1E4F83428] sharedContext];
  v5 = [v4 workerManagedObjectContext];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__ICDrawingConversionOperation_main__block_invoke;
  v8[3] = &unk_1E5FD8FE8;
  id v9 = v5;
  id v10 = self;
  id v11 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlockAndWait:v8];
  [v6 operationComplete:self];
}

void __36__ICDrawingConversionOperation_main__block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) existingObjectWithID:*(void *)(*(void *)(a1 + 40) + 256) error:0];
  if (+[ICDrawingPencilKitConverter canUpdateFullscreenSketchAttachment:](ICDrawingPencilKitConverter, "canUpdateFullscreenSketchAttachment:"))
  {
    uint64_t v2 = [v12 rangeInNote];
    uint64_t v4 = v3;
    v5 = [v12 note];
    id v6 = objc_msgSend(*(id *)(a1 + 48), "convertSketchAttachment:toInlineDrawingAtRange:inNote:", v12, v2, v4, v5);
    objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", @"saving context after updating fullscreen sketch in operation");
    uint64_t v7 = [v6 objectID];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 264);
    *(void *)(v8 + 264) = v7;
  }
  else
  {
    if (!+[ICDrawingPencilKitConverter canUpdateInlineDrawingAttachment:v12])goto LABEL_6; {
    v5 = [*(id *)(a1 + 48) updateInlineDrawingAttachment:v12];
    }
    objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", @"saving context after updating inline drawing in operation");
    uint64_t v10 = [v5 objectID];
    uint64_t v11 = *(void *)(a1 + 40);
    id v6 = *(void **)(v11 + 264);
    *(void *)(v11 + 264) = v10;
  }

LABEL_6:
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (NSManagedObjectID)attachmentID
{
  return self->_attachmentID;
}

- (NSManagedObjectID)finalAttachmentID
{
  return self->_finalAttachmentID;
}

- (ICBaseTextAttachment)textAttachment
{
  return self->_textAttachment;
}

- (void)setTextAttachment:(id)a3
{
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_textAttachment, 0);
  objc_storeStrong((id *)&self->_finalAttachmentID, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end