@interface NCNotificationRequestInlineActionsProvider
- (BOOL)auxiliaryOptionsVisible;
- (NCNotificationRequest)notificationRequest;
- (NCNotificationRequestInlineActionsProvider)initWithNotificationRequest:(id)a3 delegate:(id)a4;
- (NCNotificationRequestInlineActionsProviderDelegate)delegate;
- (NSArray)auxiliaryOptionActions;
- (id)_primaryAction;
- (id)_secondaryAction;
- (void)handlePrimaryAction:(id)a3;
- (void)handleSecondaryAction:(id)a3;
- (void)setAuxiliaryOptionsVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationRequest:(id)a3;
@end

@implementation NCNotificationRequestInlineActionsProvider

- (NCNotificationRequestInlineActionsProvider)initWithNotificationRequest:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationRequestInlineActionsProvider;
  v9 = [(NCNotificationRequestInlineActionsProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationRequest, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (NSArray)auxiliaryOptionActions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  v4 = [(NCNotificationRequestInlineActionsProvider *)self _primaryAction];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 title];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4FB13F0];
      v9 = [v5 title];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke;
      v21[3] = &unk_1E6A91930;
      objc_copyWeak(&v22, &location);
      v10 = [v8 actionWithTitle:v9 image:0 identifier:@"notification-request-inline-action-provider-primary-action" handler:v21];

      [v3 addObject:v10];
      objc_destroyWeak(&v22);
    }
  }
  v11 = [(NCNotificationRequestInlineActionsProvider *)self _secondaryAction];
  objc_super v12 = v11;
  if (v11)
  {
    v13 = [v11 title];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E4FB13F0];
      v16 = [v12 title];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke_2;
      v19[3] = &unk_1E6A91930;
      objc_copyWeak(&v20, &location);
      v17 = [v15 actionWithTitle:v16 image:0 identifier:@"notification-request-inline-action-provider-secondary-action" handler:v19];

      [v3 addObject:v17];
      objc_destroyWeak(&v20);
    }
  }

  objc_destroyWeak(&location);

  return (NSArray *)v3;
}

void __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handlePrimaryAction:v4];
}

void __68__NCNotificationRequestInlineActionsProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleSecondaryAction:v4];
}

- (id)_primaryAction
{
  id v3 = [(NCNotificationRequestInlineActionsProvider *)self notificationRequest];
  v4 = [v3 defaultEnvironmentActions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(NCNotificationRequestInlineActionsProvider *)self notificationRequest];
    uint64_t v7 = [v6 defaultEnvironmentActions];
    id v8 = [v7 objectAtIndex:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_secondaryAction
{
  id v3 = [(NCNotificationRequestInlineActionsProvider *)self notificationRequest];
  v4 = [v3 defaultEnvironmentActions];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    id v8 = 0;
  }
  else
  {
    v6 = [(NCNotificationRequestInlineActionsProvider *)self notificationRequest];
    uint64_t v7 = [v6 defaultEnvironmentActions];
    id v8 = [v7 objectAtIndex:1];
  }

  return v8;
}

- (void)handlePrimaryAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [(NCNotificationRequestInlineActionsProvider *)self _primaryAction];
  [WeakRetained contentProvider:self performAction:v4 animated:1];
}

- (void)handleSecondaryAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [(NCNotificationRequestInlineActionsProvider *)self _secondaryAction];
  [WeakRetained contentProvider:self performAction:v4 animated:1];
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setNotificationRequest:(id)a3
{
}

- (NCNotificationRequestInlineActionsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationRequestInlineActionsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)auxiliaryOptionsVisible
{
  return self->_auxiliaryOptionsVisible;
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  self->_auxiliaryOptionsVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_notificationRequest, 0);
}

@end