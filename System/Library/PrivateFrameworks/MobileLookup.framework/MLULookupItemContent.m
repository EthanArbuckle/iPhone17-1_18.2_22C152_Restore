@interface MLULookupItemContent
+ (id)contentWithAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4;
+ (id)contentWithText:(id)a3 range:(_NSRange)a4;
+ (id)contentWithURL:(id)a3 result:(__DDResult *)a4 documentProperties:(id)a5;
- (BOOL)commitPreviewInController:(id)a3;
- (BOOL)valid;
- (BOOL)wantsSeamlessCommit;
- (CNContact)contact;
- (NSURL)commitURL;
- (UIViewController)commitViewController;
- (UIViewController)previewViewController;
- (id)children;
- (id)requiredEntitlements;
- (unint64_t)commitType;
- (void)dismissViewController;
- (void)setCommitType:(unint64_t)a3;
- (void)setCommitURL:(id)a3;
- (void)setCommitViewController:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)setupViewControllerInCommitMode;
@end

@implementation MLULookupItemContent

+ (id)contentWithURL:(id)a3 result:(__DDResult *)a4 documentProperties:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[MLULookupItemDDContent alloc] initWithURL:v8 result:a4 documentProperties:v7];

  if ([(MLULookupItemContent *)v9 valid]) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }

  return v10;
}

+ (id)contentWithAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[MLULookupItemAttachmentContent alloc] initWithAttachments:v5 currentAttachmentIndex:a4];

  return v6;
}

+ (id)contentWithText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  id v7 = -[MLULookupItemRawTextContent initWithText:range:]([MLULookupItemRawTextContent alloc], "initWithText:range:", v6, location, length);

  return v7;
}

- (id)requiredEntitlements
{
  return 0;
}

- (id)children
{
  return 0;
}

- (BOOL)wantsSeamlessCommit
{
  return [(MLULookupItemContent *)self commitType] == 2;
}

- (void)setupViewControllerInCommitMode
{
  v3 = [(MLULookupItemContent *)self previewViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(MLULookupItemContent *)self previewViewController];
    id v5 = [v8 visibleViewController];
    id v6 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_dismissViewController];
    id v7 = [v5 navigationItem];
    [v7 setRightBarButtonItem:v6];

    [v8 setNavigationBarHidden:0];
    [v8 setNeedsStatusBarAppearanceUpdate];
  }
}

- (BOOL)commitPreviewInController:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  unint64_t v4 = [(MLULookupItemContent *)self commitType];
  if (v4 == 2)
  {
    [(MLULookupItemContent *)self setupViewControllerInCommitMode];
    return 1;
  }
  else
  {
    if (v4 == 4)
    {
      id v5 = [(MLULookupItemContent *)self commitURL];
      id v6 = [MEMORY[0x263F1C408] sharedApplication];
      id v7 = v6;
      if (v5)
      {
        if ([v6 canOpenURL:v5])
        {
          id v8 = [MEMORY[0x263F01880] defaultWorkspace];
          uint64_t v11 = *MEMORY[0x263F79548];
          v12[0] = MEMORY[0x263EFFA88];
          v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
          [v8 openURL:v5 withOptions:v9];
        }
      }
    }
    return 0;
  }
}

- (void)dismissViewController
{
  id v2 = [(MLULookupItemContent *)self previewViewController];
  [v2 dismissViewControllerAnimated:1 completion:&__block_literal_global];
}

- (CNContact)contact
{
  return 0;
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
}

- (unint64_t)commitType
{
  return self->_commitType;
}

- (void)setCommitType:(unint64_t)a3
{
  self->_commitType = a3;
}

- (UIViewController)commitViewController
{
  return self->_commitViewController;
}

- (void)setCommitViewController:(id)a3
{
}

- (NSURL)commitURL
{
  return self->_commitURL;
}

- (void)setCommitURL:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitURL, 0);
  objc_storeStrong((id *)&self->_commitViewController, 0);

  objc_storeStrong((id *)&self->_previewViewController, 0);
}

@end