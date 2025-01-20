@interface REUIElementDonatedActionAction
- (BOOL)siriActionsPerformer:(id)a3 wantsToDismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (BOOL)siriActionsPerformer:(id)a3 wantsToPresentViewController:(id)a4;
- (NSString)appName;
- (NSString)bundleIdentifier;
- (REUIDonatedElementProperties)properties;
- (REUIElementDonatedActionAction)initWithProperties:(id)a3;
- (REUISiriActionsPerformer)performer;
- (UIImage)appIcon;
- (id)_newPerformer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fullsizeAppIcon;
- (id)siriActionsPerformerWantsAlertBackgroundImage:(id)a3;
- (id)siriActionsPerformerWantsBackgroundViewToBlur:(id)a3;
- (void)dealloc;
- (void)setPerformer:(id)a3;
- (void)setProperties:(id)a3;
- (void)siriActionsPerformer:(id)a3 didFailWithError:(id)a4;
- (void)siriActionsPerformerDidSucceed:(id)a3;
@end

@implementation REUIElementDonatedActionAction

- (REUIElementDonatedActionAction)initWithProperties:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REUIElementDonatedActionAction;
  v6 = [(REUIElementDonatedActionAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_properties, a3);
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return [(REUIDonatedElementProperties *)self->_properties bundleIdentifier];
}

- (NSString)appName
{
  return [(REUIDonatedElementProperties *)self->_properties appName];
}

- (UIImage)appIcon
{
  return [(REUIDonatedElementProperties *)self->_properties appIcon];
}

- (id)fullsizeAppIcon
{
  return [(REUIDonatedElementProperties *)self->_properties fullsizeAppIcon];
}

- (void)dealloc
{
  [(REUISiriActionsPerformer *)self->_performer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)REUIElementDonatedActionAction;
  [(REUIElementDonatedActionAction *)&v3 dealloc];
}

- (id)_newPerformer
{
  return 0;
}

- (id)siriActionsPerformerWantsAlertBackgroundImage:(id)a3
{
  v4 = [(REElementAction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(REElementAction *)self delegate];
    v6 = [v5 intentActionWantsBackgroundImageForAlert:self];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)siriActionsPerformerWantsBackgroundViewToBlur:(id)a3
{
  v4 = [(REElementAction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(REElementAction *)self delegate];
    v6 = [v5 intentActionWantsBackgroundToBlurForAlert:self];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)siriActionsPerformerDidSucceed:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__REUIElementDonatedActionAction_siriActionsPerformerDidSucceed___block_invoke;
  block[3] = &unk_2644B7EC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__REUIElementDonatedActionAction_siriActionsPerformerDidSucceed___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    v2 = [*(id *)(a1 + 32) delegate];
    [v2 elementAction:*(void *)(a1 + 32) didFinishTask:1];
  }
  objc_super v3 = [*(id *)(a1 + 32) performer];
  [v3 setStrongDelegate:0];

  [*(id *)(a1 + 32) setPerformer:0];
}

- (void)siriActionsPerformer:(id)a3 didFailWithError:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__REUIElementDonatedActionAction_siriActionsPerformer_didFailWithError___block_invoke;
  block[3] = &unk_2644B7EC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__REUIElementDonatedActionAction_siriActionsPerformer_didFailWithError___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    v2 = [*(id *)(a1 + 32) delegate];
    [v2 elementAction:*(void *)(a1 + 32) didFinishTask:0];
  }
  objc_super v3 = [*(id *)(a1 + 32) performer];
  [v3 setStrongDelegate:0];

  [*(id *)(a1 + 32) setPerformer:0];
}

- (BOOL)siriActionsPerformer:(id)a3 wantsToPresentViewController:(id)a4
{
  id v5 = a4;
  v6 = [(REElementAction *)self delegate];
  char v7 = objc_opt_respondsToSelector();
  if (v7)
  {
    v8 = [(REElementAction *)self delegate];
    [v8 elementAction:self wantsViewControllerDisplayed:v5];
  }
  return v7 & 1;
}

- (BOOL)siriActionsPerformer:(id)a3 wantsToDismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(REUIDonatedElementProperties *)self->_properties copyWithZone:a3];
  char v7 = (void *)[v5 initWithProperties:v6];

  return v7;
}

- (REUISiriActionsPerformer)performer
{
  return self->_performer;
}

- (void)setPerformer:(id)a3
{
}

- (REUIDonatedElementProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

@end