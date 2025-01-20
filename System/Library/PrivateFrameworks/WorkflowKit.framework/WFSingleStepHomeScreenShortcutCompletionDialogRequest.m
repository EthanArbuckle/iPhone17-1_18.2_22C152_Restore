@interface WFSingleStepHomeScreenShortcutCompletionDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)requiresRunningShortcut;
- (NSString)applicationBundleIdentifier;
- (WFSingleStepHomeScreenShortcutCompletionDialogRequest)initWithShortcutName:(id)a3 applicationBundleIdentifier:(id)a4;
- (void)setRequiresRunningShortcut:(BOOL)a3;
@end

@implementation WFSingleStepHomeScreenShortcutCompletionDialogRequest

- (void).cxx_destruct
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setRequiresRunningShortcut:(BOOL)a3
{
  self->_requiresRunningShortcut = a3;
}

- (BOOL)requiresRunningShortcut
{
  return 0;
}

- (WFSingleStepHomeScreenShortcutCompletionDialogRequest)initWithShortcutName:(id)a3 applicationBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4FB46B8] currentDevice];
  char v9 = [v8 hasSystemAperture];

  if ((v9 & 1) != 0 || ![v6 length])
  {
    if ([v6 length])
    {
      id v13 = v6;
    }
    else
    {
      WFLocalizedString(@"Shortcuts");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v13;
  }
  else
  {
    v10 = NSString;
    v11 = WFLocalizedString(@"%@ │ Shortcuts");
    v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v6);
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB4560]) initWithBundleIdentifier:v7];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB46C0]) initWithTitle:v12 icon:v14];
  v20.receiver = self;
  v20.super_class = (Class)WFSingleStepHomeScreenShortcutCompletionDialogRequest;
  v16 = [(WFDialogRequest *)&v20 initWithAttribution:v15 prompt:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_applicationBundleIdentifier, a4);
    v17->_requiresRunningShortcut = 0;
    v18 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end