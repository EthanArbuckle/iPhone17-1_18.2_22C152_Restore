@interface WFSignedShortcutFileProvider
- (WFFileRepresentation)signedShortcutFile;
- (WFShortcutPackageFile)shortcutFile;
- (WFSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4;
- (id)item;
- (void)setShortcutFile:(id)a3;
- (void)setSignedShortcutFile:(id)a3;
@end

@implementation WFSignedShortcutFileProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedShortcutFile, 0);
  objc_storeStrong((id *)&self->_shortcutFile, 0);
}

- (void)setSignedShortcutFile:(id)a3
{
}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (void)setShortcutFile:(id)a3
{
}

- (WFShortcutPackageFile)shortcutFile
{
  return self->_shortcutFile;
}

- (id)item
{
  v3 = [(UIActivityItemProvider *)self activityType];
  if (([v3 isEqualToString:@"is.workflow.activity.homescreen"] & 1) != 0
    || ([v3 isEqualToString:@"is.workflow.activity.launchcenter"] & 1) != 0
    || ([v3 isEqualToString:@"is.workflow.activity.submit"] & 1) != 0
    || ([v3 isEqualToString:@"is.workflow.my.filesharer"] & 1) != 0
    || ([v3 isEqualToString:@"is.workflow.my.fileduplicator"] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F6BD28]] & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFSignedShortcutFileProvider;
    v4 = [(WFWorkflowItemProvider *)&v6 item];
  }

  return v4;
}

- (WFSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  objc_super v6 = (void *)MEMORY[0x263F339A0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 proposedTemporaryFileURLForFilename:@"Shortcut.shortcut"];
  v12.receiver = self;
  v12.super_class = (Class)WFSignedShortcutFileProvider;
  v10 = [(WFWorkflowItemProvider *)&v12 initWithWorkflow:v8 userInterface:v7 placeholderItem:v9];

  return v10;
}

@end