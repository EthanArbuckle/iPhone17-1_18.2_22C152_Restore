@interface ICLinkPresentationActivityItemSource
- (LPFileMetadata)fileMetadata;
- (LPLinkMetadata)linkMetadata;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)detail;
- (id)iconImage;
- (id)title;
- (void)setFileMetadata:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setLinkMetadata:(id)a3;
@end

@implementation ICLinkPresentationActivityItemSource

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  v5 = [(ICLinkPresentationActivityItemSource *)self title];
  v6 = [(ICLinkPresentationActivityItemSource *)self detail];
  v7 = [(ICLinkPresentationActivityItemSource *)self iconImage];
  if ((!v5 || ![v5 length]) && (!v6 || !objc_msgSend(v6, "length")) && !v7) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"(title && title.length > 0) || (summary && summary.length > 0) || iconImage" functionName:"-[ICLinkPresentationActivityItemSource activityViewControllerLinkPresentationMetadata:]" simulateCrash:1 showAlert:0 format:@"No data passed to link presentation"];
  }
  v8 = [(ICLinkPresentationActivityItemSource *)self linkMetadata];

  if (!v8)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v9 = (void *)getLPLinkMetadataClass_softClass;
    uint64_t v29 = getLPLinkMetadataClass_softClass;
    if (!getLPLinkMetadataClass_softClass)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getLPLinkMetadataClass_block_invoke;
      v24 = &unk_1E5FD95C0;
      v25 = &v26;
      __getLPLinkMetadataClass_block_invoke((uint64_t)&v21);
      v9 = (void *)v27[3];
    }
    v10 = v9;
    _Block_object_dispose(&v26, 8);
    id v11 = objc_alloc_init(v10);
    [(ICLinkPresentationActivityItemSource *)self setLinkMetadata:v11];
  }
  v12 = [(ICLinkPresentationActivityItemSource *)self fileMetadata];

  if (!v12)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v13 = (void *)getLPFileMetadataClass_softClass;
    uint64_t v29 = getLPFileMetadataClass_softClass;
    if (!getLPFileMetadataClass_softClass)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getLPFileMetadataClass_block_invoke;
      v24 = &unk_1E5FD95C0;
      v25 = &v26;
      __getLPFileMetadataClass_block_invoke((uint64_t)&v21);
      v13 = (void *)v27[3];
    }
    v14 = v13;
    _Block_object_dispose(&v26, 8);
    id v15 = objc_alloc_init(v14);
    [(ICLinkPresentationActivityItemSource *)self setFileMetadata:v15];
  }
  if (v5 && [v5 length])
  {
    v16 = [(ICLinkPresentationActivityItemSource *)self linkMetadata];
    [v16 setTitle:v5];

    v17 = [(ICLinkPresentationActivityItemSource *)self fileMetadata];
    [v17 setName:v5];
  }
  if (v6 && [v6 length])
  {
    v18 = [(ICLinkPresentationActivityItemSource *)self linkMetadata];
    [v18 setSummary:v6];
  }
  [(ICLinkPresentationActivityItemSource *)self setIconImage:v7];
  v19 = [(ICLinkPresentationActivityItemSource *)self linkMetadata];

  return v19;
}

- (id)iconImage
{
  return 0;
}

- (void)setIconImage:(id)a3
{
  if (a3)
  {
    id v4 = (UIImage *)a3;
    id v12 = (id)[objc_alloc((Class)getLPImageClass()) initWithPlatformImage:v4];
    v5 = [(ICLinkPresentationActivityItemSource *)self fileMetadata];
    [v5 setThumbnail:v12];

    v6 = [(ICLinkPresentationActivityItemSource *)self fileMetadata];
    v7 = [(ICLinkPresentationActivityItemSource *)self linkMetadata];
    [v7 setSpecialization:v6];

    id v8 = objc_alloc((Class)getLPImageClass());
    v9 = UIImagePNGRepresentation(v4);

    v10 = (void *)[v8 initWithData:v9 MIMEType:@"image/png"];
    id v11 = [(ICLinkPresentationActivityItemSource *)self linkMetadata];
    [v11 setIcon:v10];
  }
}

- (id)title
{
  return 0;
}

- (id)detail
{
  return 0;
}

- (LPFileMetadata)fileMetadata
{
  return self->_fileMetadata;
}

- (void)setFileMetadata:(id)a3
{
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_fileMetadata, 0);
}

@end