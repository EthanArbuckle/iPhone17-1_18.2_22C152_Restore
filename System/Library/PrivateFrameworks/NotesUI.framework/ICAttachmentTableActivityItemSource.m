@interface ICAttachmentTableActivityItemSource
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation ICAttachmentTableActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1B3E9ED80]();
  objc_opt_class();
  v9 = [(ICAttachmentActivityItemSource *)self attachment];
  v10 = [v9 attachmentModel];
  v11 = ICCheckedDynamicCast();

  int v12 = [v7 isEqualToString:*MEMORY[0x1E4F43590]];
  int v13 = [v7 isEqualToString:*MEMORY[0x1E4F43610]];
  v14 = [v11 table];
  v15 = v14;
  if ((v12 & 1) != 0 || v13)
  {
    id v19 = [v14 joinedAttributedStringForColumns:0 rows:0];

    v21 = [v19 string];
    v20 = v21;
    if (v12)
    {
      uint64_t v22 = [v21 dataUsingEncoding:4];

      v20 = (void *)v22;
    }
  }
  else
  {
    v16 = [v11 attachment];
    v17 = [v16 managedObjectContext];
    v18 = [v15 attributedStringWithNSTextTablesForColumns:0 rows:0 context:v17];

    id v19 = v18;
    v20 = v19;
  }

  return v20;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ICAttachmentTableActivityItemSource;
  id v5 = a4;
  id v6 = [(ICAttachmentActivityItemSource *)&v10 activityViewController:a3 dataTypeIdentifierForActivityType:v5];
  int v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E4F43590], v10.receiver, v10.super_class);

  if (v7)
  {
    uint64_t v8 = [(id)*MEMORY[0x1E4F44510] identifier];

    id v6 = (void *)v8;
  }
  return v6;
}

@end