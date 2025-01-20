@interface SAUIAlertingAssertion
- (SAUIAlertingAssertion)initWithPreferredLayoutModeAssertion:(id)a3 invalidationInterval:(double)a4;
- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion;
@end

@implementation SAUIAlertingAssertion

- (SAUIAlertingAssertion)initWithPreferredLayoutModeAssertion:(id)a3 invalidationInterval:(double)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SAUIAlertingAssertion;
  v8 = [(SAAutomaticallyInvalidatingAssertion *)&v20 initWithInvalidationInterval:a4];
  v9 = v8;
  if (v8)
  {
    p_preferredLayoutModeAssertion = (id *)&v8->_preferredLayoutModeAssertion;
    objc_storeStrong((id *)&v8->_preferredLayoutModeAssertion, a3);
    objc_initWeak(&location, v9);
    objc_initWeak(&from, *p_preferredLayoutModeAssertion);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke;
    v15[3] = &unk_26552BE70;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &location);
    [(SAAssertion *)v9 addInvalidationBlock:v15];
    id v11 = *p_preferredLayoutModeAssertion;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke_2;
    v13[3] = &unk_26552BBF0;
    objc_copyWeak(&v14, &location);
    [v11 addInvalidationBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isValid]) {
    [WeakRetained invalidateWithReason:v7];
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5 && *((id *)v5 + 10) == WeakRetained)
  {
    *((void *)v5 + 10) = 0;
  }
}

void __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isValid]) {
    [WeakRetained invalidateWithReason:v5];
  }
}

- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion
{
  return self->_preferredLayoutModeAssertion;
}

- (void).cxx_destruct
{
}

@end