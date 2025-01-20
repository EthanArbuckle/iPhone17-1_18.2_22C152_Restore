@interface ICFilterAttachmentActivityItemSource
- (id)activityItemSourceForSelector:(SEL)a3;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)attachmentItem;
- (id)initAttachmentItem:(id)a3;
- (void)setAttachmentItem:(id)a3;
@end

@implementation ICFilterAttachmentActivityItemSource

- (id)initAttachmentItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICFilterAttachmentActivityItemSource;
  v5 = [(ICFilterAttachmentActivityItemSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICFilterAttachmentActivityItemSource *)v5 setAttachmentItem:v4];
  }

  return v6;
}

- (id)activityItemSourceForSelector:(SEL)a3
{
  v3 = [(ICFilterAttachmentActivityItemSource *)self attachmentItem];
  id v4 = ICProtocolCast();

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = a3;
  id v5 = [(ICFilterAttachmentActivityItemSource *)self activityItemSourceForSelector:sel_activityViewControllerPlaceholderItem_];
  v6 = v5;
  if (v5) {
    [v5 activityViewControllerPlaceholderItem:v4];
  }
  else {
  v7 = [(ICFilterAttachmentActivityItemSource *)self attachmentItem];
  }

  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqual:*MEMORY[0x1E4F43590]] & 1) != 0
    || ([v7 isEqual:*MEMORY[0x1E4F435A0]] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.mobilenotes.lock-note"] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F435B8]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F43600]] & 1) != 0)
  {
    goto LABEL_6;
  }
  if (![v7 isEqualToString:*MEMORY[0x1E4F435B0]])
  {
LABEL_15:
    v15 = [(ICFilterAttachmentActivityItemSource *)self activityItemSourceForSelector:sel_activityViewController_itemForActivityType_];
    v16 = v15;
    if (v15) {
      [v15 activityViewController:v6 itemForActivityType:v7];
    }
    else {
    objc_super v8 = [(ICFilterAttachmentActivityItemSource *)self attachmentItem];
    }

    goto LABEL_7;
  }
  v10 = [(ICFilterAttachmentActivityItemSource *)self attachmentItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  v11 = [(ICFilterAttachmentActivityItemSource *)self attachmentItem];
  v12 = [v11 attachment];
  v13 = [v12 attachmentModel];
  char v14 = [v13 canConvertToHTMLForSharing];

  if ((v14 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  objc_super v8 = 0;
LABEL_7:

  return v8;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(ICFilterAttachmentActivityItemSource *)self activityItemSourceForSelector:sel_activityViewController_dataTypeIdentifierForActivityType_];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 activityViewController:v6 dataTypeIdentifierForActivityType:v7];
  }
  else
  {
    v10 = &stru_1F0973378;
  }

  return v10;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(ICFilterAttachmentActivityItemSource *)self attachmentItem];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(ICFilterAttachmentActivityItemSource *)self attachmentItem];
    v11 = [v10 activityViewController:v6 attachmentNameForActivityType:v7];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)attachmentItem
{
  return self->_attachmentItem;
}

- (void)setAttachmentItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end