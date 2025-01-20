@interface MLULookupItemRawTextContent
- (MLULookupItemRawTextContent)initWithText:(id)a3 range:(_NSRange)a4;
- (id)previewActions;
- (unint64_t)commitType;
- (void)dismissViewController;
- (void)setupViewControllerInCommitMode;
@end

@implementation MLULookupItemRawTextContent

- (id)previewActions
{
  return 0;
}

- (MLULookupItemRawTextContent)initWithText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLULookupItemRawTextContent;
  v8 = [(MLULookupItemRawTextContent *)&v13 init];
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263F394F0]), "initWithString:range:", v7, location, length);
    [(MLULookupItemContent *)v8 setPreviewViewController:v9];

    v10 = [(MLULookupItemContent *)v8 previewViewController];
    [v10 setModalPresentationStyle:6];

    v11 = [(MLULookupItemRawTextContent *)v8 parsecCollectionViewController];
    [v11 setPreviewMode:1];

    [(MLULookupItemContent *)v8 setValid:1];
  }

  return v8;
}

- (unint64_t)commitType
{
  return 2;
}

- (void)dismissViewController
{
  v2.receiver = self;
  v2.super_class = (Class)MLULookupItemRawTextContent;
  [(MLULookupItemContent *)&v2 dismissViewController];
}

- (void)setupViewControllerInCommitMode
{
  id v2 = [(MLULookupItemRawTextContent *)self parsecCollectionViewController];
  [v2 setPreviewMode:0];
}

@end