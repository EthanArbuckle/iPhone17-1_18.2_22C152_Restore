@interface PXMessagesExtensionViewModel
+ (PXMessagesExtensionViewModel)sharedRootViewModel;
- (BOOL)isDrawerActive;
- (NSArray)recipients;
- (NSDate)selectedMessageDate;
- (NSString)selectedMessageText;
- (NSURL)selectedURL;
- (UIViewController)presentedViewController;
- (unint64_t)selectedActivityType;
- (void)clearSelection;
- (void)performChanges:(id)a3;
- (void)setDrawerActive:(BOOL)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSelectedActivityType:(unint64_t)a3;
- (void)setSelectedMessageDate:(id)a3;
- (void)setSelectedMessageText:(id)a3;
- (void)setSelectedURL:(id)a3;
@end

@implementation PXMessagesExtensionViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_selectedMessageDate, 0);
  objc_storeStrong((id *)&self->_selectedMessageText, 0);
  objc_storeStrong((id *)&self->_selectedURL, 0);
}

- (BOOL)isDrawerActive
{
  return self->_drawerActive;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (NSDate)selectedMessageDate
{
  return self->_selectedMessageDate;
}

- (NSString)selectedMessageText
{
  return self->_selectedMessageText;
}

- (unint64_t)selectedActivityType
{
  return self->_selectedActivityType;
}

- (NSURL)selectedURL
{
  return self->_selectedURL;
}

- (void)setRecipients:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_recipients, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    recipients = self->_recipients;
    self->_recipients = v4;

    [(PXMessagesExtensionViewModel *)self signalChange:32];
  }
}

- (void)clearSelection
{
  [(PXMessagesExtensionViewModel *)self setSelectedURL:0];
  [(PXMessagesExtensionViewModel *)self setSelectedActivityType:0];
  [(PXMessagesExtensionViewModel *)self setPresentedViewController:0];
}

- (void)setSelectedMessageDate:(id)a3
{
  v5 = (NSDate *)a3;
  if (self->_selectedMessageDate != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_selectedMessageDate, a3);
    [(PXMessagesExtensionViewModel *)self signalChange:4];
    v5 = v6;
  }
}

- (void)setSelectedMessageText:(id)a3
{
  if (self->_selectedMessageText != a3)
  {
    v4 = (NSString *)[a3 copy];
    selectedMessageText = self->_selectedMessageText;
    self->_selectedMessageText = v4;

    [(PXMessagesExtensionViewModel *)self signalChange:4];
  }
}

- (void)setPresentedViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  if (self->_presentedViewController != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    [(PXMessagesExtensionViewModel *)self signalChange:16];
    v5 = v6;
  }
}

- (void)setDrawerActive:(BOOL)a3
{
  if (self->_drawerActive != a3)
  {
    self->_drawerActive = a3;
    [(PXMessagesExtensionViewModel *)self signalChange:8];
  }
}

- (void)setSelectedActivityType:(unint64_t)a3
{
  if (self->_selectedActivityType != a3)
  {
    self->_selectedActivityType = a3;
    [(PXMessagesExtensionViewModel *)self signalChange:2];
  }
}

- (void)setSelectedURL:(id)a3
{
  v7 = (NSURL *)a3;
  v5 = self->_selectedURL;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSURL *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedURL, a3);
      [(PXMessagesExtensionViewModel *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesExtensionViewModel;
  [(PXMessagesExtensionViewModel *)&v3 performChanges:a3];
}

+ (PXMessagesExtensionViewModel)sharedRootViewModel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXMessagesExtensionViewModel_sharedRootViewModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRootViewModel_onceToken != -1) {
    dispatch_once(&sharedRootViewModel_onceToken, block);
  }
  v2 = (void *)sharedRootViewModel__sharedRootViewModel;
  return (PXMessagesExtensionViewModel *)v2;
}

void __51__PXMessagesExtensionViewModel_sharedRootViewModel__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRootViewModel__sharedRootViewModel;
  sharedRootViewModel__sharedRootViewModel = (uint64_t)v1;
}

@end