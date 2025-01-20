@interface TransferNavigationController
- (BOOL)canDismiss;
- (BOOL)shouldAutorotate;
- (MailScene)scene;
- (TransferMailboxPickerController)mailboxPickerController;
- (TransferNavigationController)initWithMessages:(id)a3 scene:(id)a4;
- (TransferNavigationController)initWithMessages:(id)a3 scene:(id)a4 options:(unint64_t)a5;
- (void)purgeMemoryForReason:(int)a3;
- (void)setDidFinish:(id)a3;
- (void)setMailboxPrediction:(id)a3;
- (void)setScene:(id)a3;
- (void)setWillTransferMessagesToMailbox:(id)a3;
- (void)updatePrompt;
@end

@implementation TransferNavigationController

- (TransferNavigationController)initWithMessages:(id)a3 scene:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[TransferMailboxPickerController alloc] initWithItems:v7 scene:v8];
  v13.receiver = self;
  v13.super_class = (Class)TransferNavigationController;
  v10 = [(TransferNavigationController *)&v13 initWithRootViewController:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_scene, v8);
    objc_storeStrong((id *)&v11->_mailboxPickerController, v9);
    v11->_multipleMessages = (unint64_t)[v7 count] > 1;
    [(TransferNavigationController *)v11 updatePrompt];
  }

  return v11;
}

- (TransferNavigationController)initWithMessages:(id)a3 scene:(id)a4
{
  return [(TransferNavigationController *)self initWithMessages:a3 scene:a4 options:0];
}

- (void)setWillTransferMessagesToMailbox:(id)a3
{
}

- (void)setDidFinish:(id)a3
{
}

- (void)setMailboxPrediction:(id)a3
{
}

- (void)updatePrompt
{
  v3 = [(TransferNavigationController *)self scene];
  v4 = (char *)[v3 interfaceOrientation];

  v5 = 0;
  if ((+[UIDevice mf_isPad] & 1) == 0
    && (unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    BOOL v6 = !self->_multipleMessages;
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    if (v6) {
      [v7 localizedStringForKey:@"MOVE_MESSAGE_PROMPT" value:&stru_100619928 table:@"Main"];
    }
    else {
    v5 = [v7 localizedStringForKey:@"MOVE_MESSAGES_PROMPT" value:&stru_100619928 table:@"Main"];
    }
  }
  BOOL v9 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = [(TransferNavigationController *)self navigationBar];
  v11 = [v10 items];

  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) setPrompt:v5];
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  +[UIView setAnimationsEnabled:v9];
}

- (BOOL)canDismiss
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)purgeMemoryForReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = +[UIDevice mf_isPad];
  if (v3 == 1 || (v5 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)TransferNavigationController;
    [(TransferNavigationController *)&v6 purgeMemoryForReason:v3];
  }
}

- (TransferMailboxPickerController)mailboxPickerController
{
  return self->_mailboxPickerController;
}

- (MailScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);

  objc_storeStrong((id *)&self->_mailboxPickerController, 0);
}

@end