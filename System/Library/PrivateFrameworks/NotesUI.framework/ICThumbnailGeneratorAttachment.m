@interface ICThumbnailGeneratorAttachment
- (void)generateThumbnailForMediaURL:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation ICThumbnailGeneratorAttachment

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 associatedObjectIdentifier];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__67;
  v63 = __Block_byref_object_dispose__67;
  id v64 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__67;
  v53 = __Block_byref_object_dispose__67;
  id v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__67;
  v43 = __Block_byref_object_dispose__67;
  id v44 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__67;
  v37[4] = __Block_byref_object_dispose__67;
  id v38 = 0;
  v9 = [(ICThumbnailGenerator *)self managedObjectContext];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke;
  v27[3] = &unk_1E5FDDD90;
  v31 = v37;
  id v10 = v8;
  id v28 = v10;
  v29 = self;
  v32 = &v45;
  v33 = &v59;
  v34 = &v39;
  id v11 = v6;
  id v30 = v11;
  v35 = &v49;
  v36 = &v55;
  [v9 performBlockAndWait:v27];

  v12 = (void (**)(void, void))v7;
  v13 = [[ICThumbnailDescription alloc] initWithConfiguration:v11];
  [(ICThumbnailDescription *)v13 setThumbnailDecorationType:v46[3]];
  [(ICThumbnailDescription *)v13 setImageScaling:v56[3]];
  if (v10)
  {
    uint64_t v14 = v40[5];
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E4F1CAD0];
      v65[0] = v10;
      v65[1] = v14;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
      v17 = [v15 setWithArray:v16];
      [(ICThumbnailDescription *)v13 setAssociatedObjectIdentifiers:v17];
    }
  }
  v18 = (void *)v50[5];
  if (!v18 || ![v18 canLoadImage])
  {
    uint64_t v20 = v60[5];
    if (!v20)
    {
      ((void (**)(void, ICThumbnailDescription *))v12)[2](v12, v13);
      goto LABEL_12;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke_2;
    v21[3] = &unk_1E5FDDDB8;
    v25 = &v59;
    id v22 = v11;
    v26 = &v45;
    v23 = v13;
    v24 = v12;
    [(ICThumbnailGeneratorAttachment *)self generateThumbnailForMediaURL:v20 configuration:v22 completion:v21];

    v19 = v22;
    goto LABEL_10;
  }
  v19 = [(id)v50[5] loadOrientedImage];
  if (v19)
  {
    [(ICThumbnailDescription *)v13 setImage:v19];
    ((void (**)(void, ICThumbnailDescription *))v12)[2](v12, v13);
LABEL_10:
  }
LABEL_12:

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

void __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F832A0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v5 = [v2 attachmentWithIdentifier:v3 context:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = (void *)MEMORY[0x1E4F832A0];
  v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) typeUTI];
  LODWORD(v8) = [v8 typeUTIIsPlayableMovie:v9];

  if (v8) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) media];
  uint64_t v11 = [v10 mediaURL];
  uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) note];
  uint64_t v15 = [v14 identifier];
  uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  v18 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) attachmentModel];
  int v19 = [v18 needToGeneratePreviews];

  if (v19)
  {
    uint64_t v20 = +[ICAttachmentPreviewGenerator sharedGenerator];
    [v20 generatePreviewIfNeededForAttachment:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  v21 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) attachmentModel];
  int v22 = [v21 hasPreviews];

  if (v22)
  {
    v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [*(id *)(a1 + 48) preferredSize];
    double v25 = v24;
    double v27 = v26;
    [*(id *)(a1 + 48) scale];
    double v29 = v28;
    id v30 = [*(id *)(a1 + 48) appearanceInfo];
    v31 = objc_msgSend(v23, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v30, "type"), 1, v25, v27, v29);

    uint64_t v32 = [v31 newImageLoaderForUpdatingImageOnCompletion:1];
    uint64_t v33 = *(void *)(*(void *)(a1 + 88) + 8);
    v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v31 scaleWhenDrawing];
  }
  id v35 = [*(id *)(a1 + 40) managedObjectContext];
  objc_msgSend(v35, "ic_refreshObject:mergeChanges:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
}

void __80__ICThumbnailGeneratorAttachment_generateThumbnailWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [*(id *)(a1 + 32) preferredSize];
    objc_msgSend(v4, "ic_fileIconForURL:withPreferredSize:", v5);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      uint64_t v6 = os_log_create("com.apple.notes", "Thumbnails");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_INFO, "Recovered from thumbnail generation error using file icon", v7, 2u);
      }

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    }
  }
  [*(id *)(a1 + 40) setImage:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)generateThumbnailForMediaURL:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v8 scale];
  if (v10 <= 0.0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"configuration.scale > 0." functionName:"-[ICThumbnailGeneratorAttachment generateThumbnailForMediaURL:configuration:completion:]" simulateCrash:1 showAlert:0 format:@"Passing invalid scale to QLThumbnailGenerationRequest"];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F3A6C0]);
  [v8 preferredSize];
  double v13 = v12;
  double v15 = v14;
  [v8 scale];
  double v17 = v16;

  v18 = objc_msgSend(v11, "initWithFileAtURL:size:scale:representationTypes:", v9, -1, v13, v15, v17);
  int v19 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke;
  v21[3] = &unk_1E5FDDDE0;
  id v22 = v7;
  id v20 = v7;
  [v19 generateBestRepresentationForRequest:v18 completionHandler:v21];
}

void __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.notes", "Thumbnails");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  id v8 = [v5 UIImage];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__ICThumbnailGeneratorAttachment_generateThumbnailForMediaURL_configuration_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error generating thumbnail %@", (uint8_t *)&v2, 0xCu);
}

@end