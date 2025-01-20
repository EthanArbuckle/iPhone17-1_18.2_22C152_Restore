@interface ICThumbnailGeneratorNote
- (ICThumbnailGeneratorNote)initWithManagedObjectContext:(id)a3;
- (OS_dispatch_queue)completionQueue;
- (double)margin;
- (double)maximumWidth;
- (id)generateThumbnailImageWithNote:(id)a3 configuration:(id)a4;
- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4;
- (void)setMargin:(double)a3;
- (void)setMaximumWidth:(double)a3;
@end

@implementation ICThumbnailGeneratorNote

- (ICThumbnailGeneratorNote)initWithManagedObjectContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICThumbnailGeneratorNote;
  v3 = [(ICThumbnailGenerator *)&v9 initWithManagedObjectContext:a3];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.notes.thumbnail-completion-queue", v5);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v6;

    v3->_maximumWidth = 400.0;
    v3->_margin = 20.0;
  }
  return v3;
}

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ICThumbnailGenerator *)self managedObjectContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke;
  v11[3] = &unk_1E5FDBB10;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

void __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F83418];
  v3 = [a1[4] associatedObjectIdentifier];
  v4 = [a1[5] managedObjectContext];
  v5 = [v2 noteWithIdentifier:v3 context:v4];

  id v6 = [a1[5] generateThumbnailImageWithNote:v5 configuration:a1[4]];
  id v7 = [a1[5] completionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E5FDBB10;
  id v10 = a1[4];
  id v11 = v6;
  id v12 = a1[6];
  id v8 = v6;
  dispatch_async(v7, block);
}

void __74__ICThumbnailGeneratorNote_generateThumbnailWithConfiguration_completion___block_invoke_2(void *a1)
{
  v2 = [[ICThumbnailDescription alloc] initWithConfiguration:a1[4]];
  [(ICThumbnailDescription *)v2 setImage:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)generateThumbnailImageWithNote:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 textStorage];

  if (v8)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__66;
    v24 = __Block_byref_object_dispose__66;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke;
    v15[3] = &unk_1E5FDA508;
    id v16 = v7;
    v17 = self;
    id v18 = v6;
    v19 = &v20;
    [v16 performAsCurrentAppearance:v15];
    id v9 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F83418];
    id v11 = [(ICThumbnailGenerator *)self managedObjectContext];
    id v12 = (void *)[v10 newEmptyNoteInContext:v11];

    id v9 = [(ICThumbnailGeneratorNote *)self generateThumbnailImageWithNote:v12 configuration:v7];
    v13 = [(ICThumbnailGenerator *)self managedObjectContext];
    [v13 deleteObject:v12];
  }
  return v9;
}

void __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredSize];
  double v3 = v2;
  [*(id *)(a1 + 32) preferredSize];
  double v5 = v3 / v4;
  [*(id *)(a1 + 40) maximumWidth];
  double v7 = v6;
  [*(id *)(a1 + 32) preferredSize];
  if (v7 < v8) {
    double v7 = v8;
  }
  [*(id *)(a1 + 40) margin];
  double v10 = v7 / v5 - v9;
  id v11 = -[ICTextContainer initWithSize:]([ICTextContainer alloc], "initWithSize:", v7, 1.79769313e308);
  [(ICTextContainer *)v11 setInPreviewMode:1];
  [*(id *)(a1 + 40) margin];
  -[ICTextContainer setLineFragmentPadding:](v11, "setLineFragmentPadding:");
  id v12 = objc_alloc_init(ICTextController);
  [(ICTTTextController *)v12 setInPreviewMode:1];
  v13 = [[ICPreviewLayoutManager alloc] initWithNote:*(void *)(a1 + 48) maxCharacterCount:1600 textContainer:v11 textController:v12];
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isiPad")) {
    BOOL v14 = [*(id *)(a1 + 32) thumbnailType] == 7
  }
       || [*(id *)(a1 + 32) thumbnailType] == 4
       || [*(id *)(a1 + 32) thumbnailType] == 10
       || [*(id *)(a1 + 32) thumbnailType] == 11;
  else {
    BOOL v14 = 0;
  }
  [(ICPreviewLayoutManager *)v13 setInsideSystemPaper:v14];
  [*(id *)(a1 + 32) preferredSize];
  double v16 = v15 / v7;
  if (v16 >= 0.1) {
    double v17 = v16;
  }
  else {
    double v17 = 0.1;
  }
  id v18 = (void *)MEMORY[0x1E4FB17E0];
  v19 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v20 = [v18 formatForTraitCollection:v19];

  [*(id *)(a1 + 32) scale];
  objc_msgSend(v20, "setScale:");
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:format:", v20, 0.0, 0.0, v7 * v17, v7 / v5 * v17);
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke_2;
  v37 = &unk_1E5FDDD10;
  double v41 = v17;
  uint64_t v22 = v13;
  v38 = v22;
  double v42 = v7;
  double v43 = v10;
  v23 = v11;
  uint64_t v24 = *(void *)(a1 + 40);
  v39 = v23;
  uint64_t v40 = v24;
  uint64_t v25 = [v21 imageWithActions:&v34];
  uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  v28 = objc_msgSend(*(id *)(a1 + 32), "backgroundColor", v34, v35, v36, v37);

  if (v28)
  {
    v29 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v30 = [*(id *)(a1 + 32) backgroundColor];
    uint64_t v31 = objc_msgSend(v29, "ic_imageWithBackgroundColor:", v30);
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;
  }
}

uint64_t __73__ICThumbnailGeneratorNote_generateThumbnailImageWithNote_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  CGContextScaleCTM((CGContextRef)[a2 CGContext], *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56));
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForBoundingRect:inTextContainer:", *(void *)(a1 + 40), 0.0, 0.0, *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v5 = v4;
  double v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) margin];
  return objc_msgSend(v6, "drawGlyphsForGlyphRange:atPoint:", v3, v5, 0.0, v7);
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void).cxx_destruct
{
}

@end