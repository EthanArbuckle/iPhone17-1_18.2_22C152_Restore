@interface ICAttachmentDrawingActivityItemSource
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)attachmentTypeUTI;
@end

@implementation ICAttachmentDrawingActivityItemSource

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
  v8 = (void *)MEMORY[0x1B3E9ED80]();
  objc_opt_class();
  v9 = [(ICAttachmentActivityItemSource *)self attachment];
  v10 = [v9 attachmentModel];
  v11 = ICCheckedDynamicCast();

  v12 = [v11 imageForActivityItem];
  v13 = UIImagePNGRepresentation(v12);

  return v13;
}

@end