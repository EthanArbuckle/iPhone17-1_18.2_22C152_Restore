@interface _SBSystemApertureSignificantUpdateTransitionAssertion
- (SAElement)element;
- (_SBSystemApertureSignificantUpdateTransitionAssertion)initWithElement:(id)a3;
- (id)_descriptionConstituents;
- (void)setElement:(id)a3;
@end

@implementation _SBSystemApertureSignificantUpdateTransitionAssertion

- (_SBSystemApertureSignificantUpdateTransitionAssertion)initWithElement:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 4309, @"Invalid parameter not satisfying: %@", @"element" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_SBSystemApertureSignificantUpdateTransitionAssertion;
  v6 = [(SAAssertion *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_element, v5);
    v8 = SBLogSystemApertureController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Created significant update transition assertion: %{public}@", buf, 0xCu);
    }
  }
  return v7;
}

- (id)_descriptionConstituents
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  if (WeakRetained)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBSystemApertureSignificantUpdateTransitionAssertion;
    v4 = [(SAAssertion *)&v10 _descriptionConstituents];
    objc_super v11 = @"element";
    id v5 = MEMORY[0x1D948A070](WeakRetained);
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v7 = [v4 arrayByAddingObject:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SBSystemApertureSignificantUpdateTransitionAssertion;
    v7 = [(SAAssertion *)&v9 _descriptionConstituents];
  }

  return v7;
}

- (SAElement)element
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  return (SAElement *)WeakRetained;
}

- (void)setElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end