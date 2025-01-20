@interface ICLinkSnapshotGenerator
- (BOOL)forcesLightMode;
- (BOOL)forcesSmallSize;
- (BOOL)isInsideSystemPaper;
- (ICAttachment)attachment;
- (ICLinkSnapshotGenerator)initWithAttachment:(id)a3;
- (LPLinkMetadata)metadata;
- (LPLinkSnapshotConfiguration)configuration;
- (LPLinkSnapshotGenerator)generator;
- (id)snapshot;
- (void)invalidate;
- (void)setForcesLightMode:(BOOL)a3;
- (void)setForcesSmallSize:(BOOL)a3;
- (void)setInsideSystemPaper:(BOOL)a3;
@end

@implementation ICLinkSnapshotGenerator

- (ICLinkSnapshotGenerator)initWithAttachment:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLinkSnapshotGenerator;
  v6 = [(ICLinkSnapshotGenerator *)&v10 init];
  if (v6)
  {
    v7 = (LPLinkSnapshotGenerator *)objc_alloc_init(MEMORY[0x1E4F30A90]);
    generator = v6->_generator;
    v6->_generator = v7;

    objc_storeStrong((id *)&v6->_attachment, a3);
  }

  return v6;
}

- (LPLinkMetadata)metadata
{
  if (!self->_metadata)
  {
    v3 = [(ICLinkSnapshotGenerator *)self attachment];
    int v4 = [v3 hasSynapseLink];

    id v5 = [(ICLinkSnapshotGenerator *)self attachment];
    id v6 = v5;
    if (v4)
    {
      v7 = [v5 synapseBasedMetadata];
      if (!v7)
      {
        v9 = [(ICLinkSnapshotGenerator *)self attachment];
        v22 = [v9 plainURLMetadata];
        v23 = v22;
        if (v22)
        {
          v24 = v22;
          metadata = self->_metadata;
          self->_metadata = v24;
        }
        else
        {
          metadata = [(ICLinkSnapshotGenerator *)self attachment];
          v35 = [metadata fileMetadata];
          v36 = self->_metadata;
          self->_metadata = v35;
        }
        goto LABEL_24;
      }
      goto LABEL_4;
    }
    objc_super v10 = [v5 URL];
    int v11 = objc_msgSend(v10, "ic_isWebURL");

    v12 = [(ICLinkSnapshotGenerator *)self attachment];
    v13 = v12;
    if (v11)
    {
      v14 = [v12 retrieveLinkMetadata];
      v15 = v14;
      if (v14)
      {
        id v6 = v14;
      }
      else
      {
        v26 = [(ICLinkSnapshotGenerator *)self attachment];
        id v6 = [v26 fallbackRemoteAttachmentMetadata];
      }
      v27 = [(ICLinkSnapshotGenerator *)self attachment];
      [v27 addPreviewImageToMetadata:v6];

      if (!v6)
      {
        v7 = [(ICLinkSnapshotGenerator *)self attachment];
        v31 = [v7 fileMetadata];
        v32 = self->_metadata;
        self->_metadata = v31;

LABEL_30:
        goto LABEL_31;
      }
      v21 = (LPLinkMetadata *)v6;
      id v6 = v21;
    }
    else
    {
      uint64_t v16 = [v12 URL];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [(ICLinkSnapshotGenerator *)self attachment];
        v19 = [v18 URL];
        char v20 = objc_msgSend(v19, "ic_isWebURL");

        if ((v20 & 1) == 0)
        {
          id v6 = [(ICLinkSnapshotGenerator *)self attachment];
          v21 = [v6 plainURLMetadata];
          goto LABEL_29;
        }
      }
      else
      {
      }
      v28 = [(ICLinkSnapshotGenerator *)self attachment];
      int v29 = [v28 isLoadingFromCloud];

      v30 = [(ICLinkSnapshotGenerator *)self attachment];
      id v6 = v30;
      if (v29)
      {
        v21 = [v30 loadingAttachmentsMetadata];
      }
      else
      {
        int v33 = [v30 attachmentType];

        v34 = [(ICLinkSnapshotGenerator *)self attachment];
        id v6 = v34;
        if (v33 == 11)
        {
          v21 = [v34 scannedDocumentsMetadata];
        }
        else
        {
          int v37 = [v34 metadataExists];

          v38 = [(ICLinkSnapshotGenerator *)self attachment];
          id v6 = v38;
          if (v37)
          {
            v7 = [v38 retrieveLinkMetadata];
            if (!v7)
            {
              v9 = [(ICLinkSnapshotGenerator *)self attachment];
              v39 = [v9 fileMetadata];
              v40 = self->_metadata;
              self->_metadata = v39;

              goto LABEL_24;
            }
LABEL_4:
            v8 = v7;
            v9 = self->_metadata;
            self->_metadata = v8;
LABEL_24:

            goto LABEL_30;
          }
          v21 = [v38 fileMetadata];
        }
      }
    }
LABEL_29:
    v7 = self->_metadata;
    self->_metadata = v21;
    goto LABEL_30;
  }
LABEL_31:
  v41 = self->_metadata;
  return v41;
}

- (LPLinkSnapshotConfiguration)configuration
{
  configuration = self->_configuration;
  if (!configuration)
  {
    int v4 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    if ([(ICLinkSnapshotGenerator *)self forcesLightMode])
    {
      uint64_t v5 = [v4 traitCollectionByModifyingTraits:&__block_literal_global];

      int v4 = (void *)v5;
    }
    id v6 = [(ICLinkSnapshotGenerator *)self attachment];
    v7 = [(ICLinkSnapshotGenerator *)self metadata];
    BOOL v8 = +[ICAttachmentBrickView usesSmallSizeForAttachment:v6 withMetadata:v7 type:2 insideSystemPaper:[(ICLinkSnapshotGenerator *)self isInsideSystemPaper]];

    if ([(ICLinkSnapshotGenerator *)self forcesSmallSize] || v8) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = 9;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F30A88]);
    int v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
    v13 = (LPLinkSnapshotConfiguration *)objc_msgSend(v10, "initWithTraitCollection:preferredSizeClass:maximumSize:scale:", v4, v9, 327.0, 800.0, v12);
    v14 = self->_configuration;
    self->_configuration = v13;

    configuration = self->_configuration;
  }
  return configuration;
}

uint64_t __40__ICLinkSnapshotGenerator_configuration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:1];
}

- (void)invalidate
{
  metadata = self->_metadata;
  self->_metadata = 0;

  configuration = self->_configuration;
  self->_configuration = 0;
}

- (id)snapshot
{
  v23[1] = *MEMORY[0x1E4F143B8];
  [(ICLinkSnapshotGenerator *)self invalidate];
  id v3 = [(ICLinkSnapshotGenerator *)self metadata];

  if (v3)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    char v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    uint64_t v5 = [(ICLinkSnapshotGenerator *)self generator];
    id v6 = [(ICLinkSnapshotGenerator *)self metadata];
    v7 = [(ICLinkSnapshotGenerator *)self configuration];
    v23[0] = v7;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__ICLinkSnapshotGenerator_snapshot__block_invoke;
    v12[3] = &unk_1E5FD8E60;
    objc_copyWeak(&v15, &location);
    v14 = &v17;
    uint64_t v9 = v4;
    v13 = v9;
    [v5 snapshotForMetadata:v6 configurations:v8 completionHandler:v12];

    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v9, v10);
    id v3 = (id)v18[5];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v17, 8);
  }
  return v3;
}

void __35__ICLinkSnapshotGenerator_snapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    if (v5 || ![v6 count])
    {
      BOOL v8 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __35__ICLinkSnapshotGenerator_snapshot__block_invoke_cold_1((uint64_t)v5, v8);
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4FB1818];
      dispatch_time_t v10 = [v6 firstObject];
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      double v12 = [v11 configuration];
      [v12 scale];
      uint64_t v13 = objc_msgSend(v9, "imageWithData:scale:", v10);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (BOOL)forcesSmallSize
{
  return self->_forcesSmallSize;
}

- (void)setForcesSmallSize:(BOOL)a3
{
  self->_forcesSmallSize = a3;
}

- (BOOL)forcesLightMode
{
  return self->_forcesLightMode;
}

- (void)setForcesLightMode:(BOOL)a3
{
  self->_forcesLightMode = a3;
}

- (BOOL)isInsideSystemPaper
{
  return self->_insideSystemPaper;
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
}

- (LPLinkSnapshotGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

void __35__ICLinkSnapshotGenerator_snapshot__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Cannot create Link Presentation snapshot {error: %@}", (uint8_t *)&v2, 0xCu);
}

@end