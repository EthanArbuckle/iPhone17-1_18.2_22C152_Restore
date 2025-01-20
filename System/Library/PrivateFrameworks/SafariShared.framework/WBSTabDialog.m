@interface WBSTabDialog
+ (id)tabDialogWithPresentationBlock:(id)a3 dismissalBlock:(id)a4;
- (BOOL)blocksWebProcessUntilDismissed;
- (NSArray)cancellationExemptions;
- (WBSTabDialog)init;
- (id)_init;
- (id)createInfo;
- (void)setBlocksWebProcessUntilDismissed:(BOOL)a3;
- (void)setCancellationExemptions:(id)a3;
@end

@implementation WBSTabDialog

+ (id)tabDialogWithPresentationBlock:(id)a3 dismissalBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _init];
  uint64_t v9 = MEMORY[0x1AD0C4F80](v7);

  v10 = (void *)v8[1];
  v8[1] = v9;

  uint64_t v11 = MEMORY[0x1AD0C4F80](v6);
  v12 = (void *)v8[2];
  v8[2] = v11;

  return v8;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WBSTabDialog;
  return [(WBSTabDialog *)&v3 init];
}

- (WBSTabDialog)init
{
  v3.receiver = self;
  v3.super_class = (Class)WBSTabDialog;
  return [(WBSTabDialog *)&v3 init];
}

- (id)createInfo
{
  objc_super v3 = [[WBSTabDialogInformation alloc] initWithPresentationBlock:self->_presentationBlock dismissalBlock:self->_dismissalBlock blocksWebProcessUntilDismissed:self->_blocksWebProcessUntilDismissed];
  [(WBSTabDialogInformation *)v3 setCancellationExemptions:self->_cancellationExemptions];
  return v3;
}

- (BOOL)blocksWebProcessUntilDismissed
{
  return self->_blocksWebProcessUntilDismissed;
}

- (void)setBlocksWebProcessUntilDismissed:(BOOL)a3
{
  self->_blocksWebProcessUntilDismissed = a3;
}

- (NSArray)cancellationExemptions
{
  return self->_cancellationExemptions;
}

- (void)setCancellationExemptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationExemptions, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
}

@end