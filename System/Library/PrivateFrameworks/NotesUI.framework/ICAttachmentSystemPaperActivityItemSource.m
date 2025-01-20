@interface ICAttachmentSystemPaperActivityItemSource
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)attachmentTypeUTI;
@end

@implementation ICAttachmentSystemPaperActivityItemSource

- (id)attachmentTypeUTI
{
  return (id)[(id)*MEMORY[0x1E4F44460] identifier];
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__30;
  v18 = __Block_byref_object_dispose__30;
  id v19 = 0;
  v8 = (void *)MEMORY[0x1B3E9ED80]();
  v9 = [(ICAttachmentActivityItemSource *)self attachment];
  v10 = [v9 managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__ICAttachmentSystemPaperActivityItemSource_activityViewController_itemForActivityType___block_invoke;
  v13[3] = &unk_1E5FDB2D0;
  v13[4] = self;
  v13[5] = &v14;
  [v10 performBlockAndWait:v13];

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __88__ICAttachmentSystemPaperActivityItemSource_activityViewController_itemForActivityType___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) attachment];
  v3 = [v2 attachmentModel];
  ICCheckedDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [v8 imageForActivityItem];
  uint64_t v5 = UIImagePNGRepresentation(v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end