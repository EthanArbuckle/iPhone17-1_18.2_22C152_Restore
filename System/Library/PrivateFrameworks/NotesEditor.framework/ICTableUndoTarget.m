@interface ICTableUndoTarget
- (ICTableAttachmentProvider)provider;
- (ICTableAttachmentViewController)tableAttachmentViewController;
- (ICTableAttachmentViewController)tableAttachmentViewControllerForUndo;
- (ICTableUndoTarget)init;
- (ICTableUndoTarget)initWithProvider:(id)a3 viewController:(id)a4;
- (NSString)description;
- (void)applyUndoGroup:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTableAttachmentViewController:(id)a3;
@end

@implementation ICTableUndoTarget

- (ICTableUndoTarget)init
{
  return 0;
}

- (ICTableUndoTarget)initWithProvider:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICTableUndoTarget;
  v9 = [(ICTableUndoTarget *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeWeak((id *)&v10->_tableAttachmentViewController, v8);
  }

  return v10;
}

- (ICTableAttachmentViewController)tableAttachmentViewControllerForUndo
{
  v3 = [(ICTableUndoTarget *)self tableAttachmentViewController];
  if (!v3)
  {
    objc_opt_class();
    v4 = [(ICTableUndoTarget *)self provider];
    v5 = [v4 delegate];
    v3 = ICCheckedDynamicCast();
  }

  return (ICTableAttachmentViewController *)v3;
}

- (void)applyUndoGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableUndoTarget *)self tableAttachmentViewControllerForUndo];
  [v5 applyUndoGroup:v4];
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ICTableUndoTarget;
  id v4 = [(ICTableUndoTarget *)&v9 description];
  id v5 = [(ICTableUndoTarget *)self tableAttachmentViewController];
  v6 = [(ICTableUndoTarget *)self provider];
  id v7 = [v3 stringWithFormat:@"<%@, %@, %@>", v4, v5, v6];

  return (NSString *)v7;
}

- (ICTableAttachmentProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);

  return (ICTableAttachmentViewController *)WeakRetained;
}

- (void)setTableAttachmentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableAttachmentViewController);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end