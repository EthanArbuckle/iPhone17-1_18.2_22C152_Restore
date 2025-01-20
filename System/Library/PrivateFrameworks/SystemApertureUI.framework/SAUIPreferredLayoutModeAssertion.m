@interface SAUIPreferredLayoutModeAssertion
- (BOOL)layoutModePreferenceMayBeImplicitlyInvalidated;
- (SAElement)representedElement;
- (SAUIPreferredLayoutModeAssertion)initWithRepresentedElement:(id)a3 layoutModePreference:(id)a4;
- (SAUIPreferredLayoutModeAssertion)initWithRepresentedElement:(id)a3 preferredLayoutMode:(int64_t)a4 reason:(int64_t)a5;
- (id)_descriptionConstituents;
- (int64_t)layoutModeChangeReason;
- (int64_t)preferredLayoutMode;
@end

@implementation SAUIPreferredLayoutModeAssertion

- (SAUIPreferredLayoutModeAssertion)initWithRepresentedElement:(id)a3 layoutModePreference:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SAUIPreferredLayoutModeAssertion.m", 29, @"Invalid parameter not satisfying: %@", @"representedElement" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SAUIPreferredLayoutModeAssertion;
  v9 = [(SAAssertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutModePreference, a4);
    objc_storeWeak((id *)&v10->_representedElement, v7);
    v11 = SAUILogElementViewControlling;
    if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_25E6E1000, v11, OS_LOG_TYPE_DEFAULT, "Created preferred layout mode assertion: %{public}@", buf, 0xCu);
    }
  }

  return v10;
}

- (SAUIPreferredLayoutModeAssertion)initWithRepresentedElement:(id)a3 preferredLayoutMode:(int64_t)a4 reason:(int64_t)a5
{
  id v8 = a3;
  v9 = [[SAUILayoutModePreference alloc] initWithPreferredLayoutMode:a4 reason:a5];
  v10 = [(SAUIPreferredLayoutModeAssertion *)self initWithRepresentedElement:v8 layoutModePreference:v9];

  return v10;
}

- (int64_t)preferredLayoutMode
{
  return [(SAUILayoutModePreference *)self->_layoutModePreference preferredLayoutMode];
}

- (int64_t)layoutModeChangeReason
{
  return [(SAUILayoutModePreference *)self->_layoutModePreference layoutModeChangeReason];
}

- (BOOL)layoutModePreferenceMayBeImplicitlyInvalidated
{
  return [(SAUILayoutModePreference *)self->_layoutModePreference layoutModePreferenceMayBeImplicitlyInvalidated];
}

- (id)_descriptionConstituents
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representedElement);
  if (WeakRetained)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@: %p", objc_opt_class(), WeakRetained];
    if (objc_opt_respondsToSelector())
    {
      v6 = [WeakRetained clientIdentifier];
      [v5 appendFormat:@"; clientIdentifier: %@", v6];
    }
    if (objc_opt_respondsToSelector())
    {
      id v7 = [WeakRetained elementIdentifier];
      [v5 appendFormat:@"; elementIdentifier: %@", v7];
    }
    [v5 appendString:@">"];
    [v3 setObject:v5 forKey:@"representedElement"];
  }
  id v8 = SAUIStringFromElementViewLayoutMode([(SAUIPreferredLayoutModeAssertion *)self preferredLayoutMode]);
  [v3 setObject:v8 forKey:@"preferredLayoutMode"];

  v9 = SAUIStringFromLayoutModeChangeReason([(SAUIPreferredLayoutModeAssertion *)self layoutModeChangeReason]);
  [v3 setObject:v9 forKey:@"layoutModeChangeReason"];

  v13.receiver = self;
  v13.super_class = (Class)SAUIPreferredLayoutModeAssertion;
  v10 = [(SAAssertion *)&v13 _descriptionConstituents];
  v11 = [v10 arrayByAddingObject:v3];

  return v11;
}

- (SAElement)representedElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representedElement);
  return (SAElement *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_representedElement);
  objc_storeStrong((id *)&self->_layoutModePreference, 0);
}

@end