@interface ICAttachmentGalleryActivityItemSource
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation ICAttachmentGalleryActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [(ICAttachmentActivityItemSource *)self attachment];
  v5 = +[ICDocCamPDFGenerator versionPDFPathForAttachment:v4];
  v6 = [v3 fileURLWithPath:v5];

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)objc_msgSend((id)*MEMORY[0x1E4F443B8], "identifier", a3, a4);
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  v4 = [(ICAttachmentActivityItemSource *)self attachment];
  v5 = [v4 title];

  v6 = (void *)MEMORY[0x1E4F832A0];
  v7 = [(id)*MEMORY[0x1E4F44450] identifier];
  v8 = [v6 filenameExtensionForUTI:v7];

  if (v8)
  {
    v9 = [v5 pathExtension];
    char v10 = [v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [v5 stringByAppendingPathExtension:v8];

      v5 = (void *)v11;
    }
  }

  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__75;
  v21 = __Block_byref_object_dispose__75;
  id v22 = 0;
  v8 = [MEMORY[0x1E4F83428] sharedContext];
  v9 = [v8 workerManagedObjectContext];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke;
  v14[3] = &unk_1E5FD93E0;
  v14[4] = self;
  id v10 = v9;
  id v15 = v10;
  v16 = &v17;
  [v10 performBlockAndWait:v14];
  if ([v7 isEqualToString:*MEMORY[0x1E4F435A0]])
  {
    uint64_t v11 = (void *)v18[5];
    v18[5] = 0;
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  v3 = [v2 objectID];

  objc_opt_class();
  v4 = *(void **)(a1 + 40);
  id v14 = 0;
  v5 = [v4 existingObjectWithID:v3 error:&v14];
  id v6 = v14;
  id v7 = ICDynamicCast();

  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    v9 = +[ICDocCamPDFGenerator versionPDFPathForAttachment:v7];
    uint64_t v11 = [v10 fileURLWithPath:v9];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke_cold_1((uint64_t)v6, v9);
    }
  }
}

void __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "ICAttachmentGalleryActivityItemSource could not find attachment %@", (uint8_t *)&v2, 0xCu);
}

@end