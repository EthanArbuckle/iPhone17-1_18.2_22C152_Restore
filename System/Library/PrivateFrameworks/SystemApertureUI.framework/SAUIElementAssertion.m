@interface SAUIElementAssertion
- (SAElement)element;
- (SAUIElementAssertion)initWithElement:(id)a3 invalidationHandler:(id)a4;
- (id)_descriptionConstituents;
- (int64_t)invalidationLayoutModeChangeReason;
- (void)invalidateWithReason:(id)a3 layoutModeChangeReason:(int64_t)a4;
- (void)setInvalidationLayoutModeChangeReason:(int64_t)a3;
@end

@implementation SAUIElementAssertion

- (SAUIElementAssertion)initWithElement:(id)a3 invalidationHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SAUIElementAssertion.m", 22, @"Invalid parameter not satisfying: %@", @"element" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SAUIElementAssertion.m", 23, @"Invalid parameter not satisfying: %@", @"invalidationHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)SAUIElementAssertion;
  v10 = [(SAAssertion *)&v20 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_element, v7);
    [(SAAssertion *)v11 addInvalidationBlock:v9];
    v12 = (void *)*MEMORY[0x263F7C298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F7C298], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = objc_opt_class();
      id v15 = v14;
      v16 = MEMORY[0x2611E1490](v7);
      *(_DWORD *)buf = 138543874;
      v22 = v14;
      __int16 v23 = 2050;
      v24 = v11;
      __int16 v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_25E6E1000, v13, OS_LOG_TYPE_DEFAULT, "Created assertion (<%{public}@: %{public}p>) for element: %{public}@", buf, 0x20u);
    }
  }

  return v11;
}

- (void)invalidateWithReason:(id)a3 layoutModeChangeReason:(int64_t)a4
{
  self->_invalidationLayoutModeChangeReason = a4;
  v4.receiver = self;
  v4.super_class = (Class)SAUIElementAssertion;
  [(SAAssertion *)&v4 invalidateWithReason:a3];
}

- (id)_descriptionConstituents
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (WeakRetained)
  {
    v5 = [WeakRetained description];
    [v4 setObject:v5 forKey:@"element"];
  }
  if (![(SAAssertion *)self isValid])
  {
    v6 = SAUIStringFromLayoutModeChangeReason(self->_invalidationLayoutModeChangeReason);
    [v4 setObject:v6 forKey:@"invalidationLayoutModeChangeReason"];
  }
  if ([v4 count])
  {
    v11.receiver = self;
    v11.super_class = (Class)SAUIElementAssertion;
    id v7 = [(SAAssertion *)&v11 _descriptionConstituents];
    id v8 = [v7 arrayByAddingObject:v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SAUIElementAssertion;
    id v8 = [(SAAssertion *)&v10 _descriptionConstituents];
  }

  return v8;
}

- (SAElement)element
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  return (SAElement *)WeakRetained;
}

- (int64_t)invalidationLayoutModeChangeReason
{
  return self->_invalidationLayoutModeChangeReason;
}

- (void)setInvalidationLayoutModeChangeReason:(int64_t)a3
{
  self->_invalidationLayoutModeChangeReason = a3;
}

- (void).cxx_destruct
{
}

@end