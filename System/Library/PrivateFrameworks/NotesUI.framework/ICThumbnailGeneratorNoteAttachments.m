@interface ICThumbnailGeneratorNoteAttachments
- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4;
- (void)postProcessThumbnail:(id)a3 configuration:(id)a4;
@end

@implementation ICThumbnailGeneratorNoteAttachments

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[ICThumbnailDescription alloc] initWithConfiguration:v6];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11;
  v28 = __Block_byref_object_dispose__11;
  id v29 = 0;
  v9 = [(ICThumbnailGenerator *)self managedObjectContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke;
  v20[3] = &unk_1E5FD93E0;
  id v10 = v6;
  id v21 = v10;
  v22 = self;
  v23 = &v24;
  [v9 performBlockAndWait:v20];

  if (v25[5])
  {
    v11 = [ICThumbnailGeneratorAttachment alloc];
    v12 = [(ICThumbnailGenerator *)self managedObjectContext];
    v13 = [(ICThumbnailGenerator *)v11 initWithManagedObjectContext:v12];

    uint64_t v14 = v25[5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke_2;
    v15[3] = &unk_1E5FD9F68;
    v16 = v8;
    v17 = self;
    id v18 = v10;
    id v19 = v7;
    [(ICThumbnailGeneratorAttachment *)v13 generateThumbnailWithConfiguration:v14 completion:v15];
  }
  else
  {
    (*((void (**)(id, ICThumbnailDescription *))v7 + 2))(v7, v8);
  }

  _Block_object_dispose(&v24, 8);
}

void __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) thumbnailType] == 2)
  {
    v2 = (void *)MEMORY[0x1E4F83418];
    v3 = [*(id *)(a1 + 32) associatedObjectIdentifier];
    v4 = [*(id *)(a1 + 40) managedObjectContext];
    id v5 = [v2 noteWithIdentifier:v3 context:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 updateThumbnailAttachmentIdentifier])
      {
        id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v7 = *MEMORY[0x1E4F83110];
        v8 = [v5 objectID];
        [v6 postNotificationName:v7 object:v8];

        v9 = [*(id *)(a1 + 40) managedObjectContext];
        objc_msgSend(v9, "ic_save");

        id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v11 = *MEMORY[0x1E4F83108];
        v12 = [v5 objectID];
        [v10 postNotificationName:v11 object:v12];
      }
      v13 = [v5 thumbnailAttachmentIdentifier];

      if (v13)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F832A0];
        v15 = [v5 thumbnailAttachmentIdentifier];
        v16 = [*(id *)(a1 + 40) managedObjectContext];
        id v33 = [v14 attachmentWithIdentifier:v15 context:v16];
      }
      else
      {
        id v33 = 0;
      }
      v20 = [*(id *)(a1 + 40) managedObjectContext];
      objc_msgSend(v20, "ic_refreshObject:mergeChanges:", v5, 0);

      goto LABEL_13;
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) thumbnailType] != 3) {
      return;
    }
    v17 = (void *)MEMORY[0x1E4F832A0];
    id v18 = [*(id *)(a1 + 32) associatedObjectIdentifier];
    id v19 = [*(id *)(a1 + 40) managedObjectContext];
    id v5 = [v17 attachmentWithIdentifier:v18 context:v19];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v5;
      id v33 = v5;
      goto LABEL_13;
    }
  }
  id v33 = 0;
LABEL_13:

  if (v33)
  {
    id v21 = [ICThumbnailConfiguration alloc];
    [*(id *)(a1 + 32) preferredSize];
    double v23 = v22;
    double v25 = v24;
    [*(id *)(a1 + 32) scale];
    double v27 = v26;
    v28 = [*(id *)(a1 + 32) appearanceInfo];
    uint64_t v29 = -[ICThumbnailConfiguration initForAttachment:preferredSize:scale:appearanceInfo:](v21, "initForAttachment:preferredSize:scale:appearanceInfo:", v33, v28, v23, v25, v27);
    uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
    v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    v32 = [*(id *)(a1 + 40) managedObjectContext];
    objc_msgSend(v32, "ic_refreshObject:mergeChanges:", v33, 0);
  }
}

void __85__ICThumbnailGeneratorNoteAttachments_generateThumbnailWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImageScaling:", objc_msgSend(v6, "imageScaling"));
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailDecorationType:", objc_msgSend(v6, "thumbnailDecorationType"));
  v3 = [v6 associatedObjectIdentifiers];
  [*(id *)(a1 + 32) setAssociatedObjectIdentifiers:v3];

  v4 = [v6 image];

  if (v4)
  {
    id v5 = [v6 image];
    [*(id *)(a1 + 32) setImage:v5];

    [*(id *)(a1 + 40) postProcessThumbnail:*(void *)(a1 + 32) configuration:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)postProcessThumbnail:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 image];
  [v6 preferredSize];
  double v9 = v8;
  double v11 = v10;
  v12 = [MEMORY[0x1E4FB17E0] defaultFormat];
  [v6 scale];
  objc_msgSend(v12, "setScale:");
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v12, v9, v11);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke;
  v18[3] = &unk_1E5FD9FB8;
  double v22 = v9;
  double v23 = v11;
  id v19 = v6;
  id v20 = v5;
  id v21 = v7;
  id v14 = v7;
  id v15 = v5;
  id v16 = v6;
  v17 = [v13 imageWithActions:v18];
  [v15 setImage:v17];
}

void __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v10 = *MEMORY[0x1E4F1DAD8];
  long long v11 = v2;
  v3 = [*(id *)(a1 + 32) traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke_2;
  v4[3] = &unk_1E5FD9F90;
  long long v7 = v10;
  long long v8 = v11;
  id v5 = *(id *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v3 performAsCurrentTraitCollection:v4];
}

void __74__ICThumbnailGeneratorNoteAttachments_postProcessThumbnail_configuration___block_invoke_2(uint64_t a1)
{
  id v33 = [MEMORY[0x1E4FB1618] colorNamed:@"list_thumbnail_background_color"];
  [v33 setFill];
  UIRectFill(*(CGRect *)(a1 + 48));
  uint64_t v2 = [*(id *)(a1 + 32) thumbnailDecorationType];
  double v3 = *(double *)(a1 + 80);
  if (v2 == 2)
  {
    if (v3 + -20.0 >= 0.0) {
      double v4 = v3 + -20.0;
    }
    else {
      double v4 = 0.0;
    }
    double v5 = *(double *)(a1 + 88);
    if (v5 + -20.0 >= 0.0) {
      double v6 = v5 + -20.0;
    }
    else {
      double v6 = 0.0;
    }
    [*(id *)(a1 + 40) size];
    double v8 = v4 / v7;
    [*(id *)(a1 + 40) size];
    if (v8 >= v6 / v9) {
      double v10 = v6 / v9;
    }
    else {
      double v10 = v8;
    }
  }
  else
  {
    [*(id *)(a1 + 40) size];
    double v11 = *(double *)(a1 + 88);
    double v13 = v3 / v12;
    [*(id *)(a1 + 40) size];
    if (v13 >= v11 / v14) {
      double v10 = v13;
    }
    else {
      double v10 = v11 / v14;
    }
  }
  [*(id *)(a1 + 40) size];
  double v16 = v10 * v15;
  [*(id *)(a1 + 40) size];
  double v18 = v10 * v17;
  CGFloat v19 = CGRectGetMidX(*(CGRect *)(a1 + 48)) - v16 * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v19, CGRectGetMidY(*(CGRect *)(a1 + 48)) - v18 * 0.5, v16, v18);
  if ([*(id *)(a1 + 32) thumbnailDecorationType] == 1)
  {
    id v20 = [MEMORY[0x1E4FB1818] imageNamed:@"attachment_thumb_video_gradient"];
    double v21 = *(double *)(a1 + 88);
    [v20 size];
    double v23 = v21 - v22;
    double v24 = *(double *)(a1 + 80);
    [v20 size];
    objc_msgSend(v20, "drawInRect:", 0.0, v23, v24, v25);
    double v26 = [MEMORY[0x1E4FB1818] imageNamed:@"attachment_thumb_video_camera_icon"];
    double v27 = *(double *)(a1 + 88);
    [v26 size];
    double v29 = v27 - v28;
    [v26 size];
    double v31 = v30;
    [v26 size];
    objc_msgSend(v26, "drawInRect:", 6.0, v29, v31, v32);
  }
}

@end