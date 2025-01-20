@interface ICInspectAttachmentsNoteActivity
- (ICInspectAttachmentsNoteActivity)initWithAttachments:(id)a3 presentingViewController:(id)a4;
- (NSArray)attachments;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)showAttachmentInspectorWithAttachment:(id)a3;
- (void)showAttachmentsPickerActionSheet;
@end

@implementation ICInspectAttachmentsNoteActivity

- (ICInspectAttachmentsNoteActivity)initWithAttachments:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICInspectAttachmentsNoteActivity;
  v9 = [(ICInspectAttachmentsNoteActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachments, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"paperclip.badge.ellipsis"];
}

- (id)activityTitle
{
  return @"Inspect Attachments";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.attachmentsInspector";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v11 = a3;
  v4 = [(ICInspectAttachmentsNoteActivity *)self presentingViewController];

  if (!v4)
  {
    [(ICInspectAttachmentsNoteActivity *)self activityDidFinish:0];
    v9 = v11;
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v5 = [(ICInspectAttachmentsNoteActivity *)self attachments];
  id v6 = [v5 count];

  if (v6)
  {
    if (v6 == (id)1)
    {
      id v7 = [(ICInspectAttachmentsNoteActivity *)self attachments];
      id v8 = [v7 firstObject];
      [(ICInspectAttachmentsNoteActivity *)self showAttachmentInspectorWithAttachment:v8];
    }
    else
    {
      [(ICInspectAttachmentsNoteActivity *)self showAttachmentsPickerActionSheet];
    }
  }
  [(ICInspectAttachmentsNoteActivity *)self activityDidFinish:1];
  v9 = v11;
  if (v11)
  {
LABEL_9:
    v10 = [(ICInspectAttachmentsNoteActivity *)self activityType];
    (*((void (**)(void))v11 + 2))();

    v9 = v11;
  }
LABEL_10:
}

- (void)showAttachmentInspectorWithAttachment:(id)a3
{
  id v4 = a3;
  id v7 = [[ICAttachmentInspectorViewController alloc] initWithAttachment:v4];

  v5 = [(ICAttachmentInspectorViewController *)v7 ic_embedInNavigationControllerForModalPresentation];
  id v6 = [(ICInspectAttachmentsNoteActivity *)self presentingViewController];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)showAttachmentsPickerActionSheet
{
  v3 = +[UIAlertController alertControllerWithTitle:@"Inspect Attachment" message:@"Select attachment to inspect" preferredStyle:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(ICInspectAttachmentsNoteActivity *)self attachments];
  id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v9 = [v8 title];
        v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          [v8 attachmentType];
          NSStringFromICAttachmentType();
          id v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_super v12 = v11;

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10008C950;
        v17[3] = &unk_100626A98;
        v17[4] = self;
        v17[5] = v8;
        v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v17];
        [v3 addAction:v13];
      }
      id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  v14 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v3 addAction:v14];
  v15 = [(ICInspectAttachmentsNoteActivity *)self presentingViewController];
  [v15 presentViewController:v3 animated:1 completion:0];
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_attachments, 0);
}

@end