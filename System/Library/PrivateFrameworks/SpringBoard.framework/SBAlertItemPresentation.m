@interface SBAlertItemPresentation
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBAlertItem)alertItem;
- (SBAlertItemPresentation)initWithAlertItem:(id)a3 presenter:(id)a4;
- (SBAlertItemPresenter)presenter;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setAlertItem:(id)a3;
- (void)setPresenter:(id)a3;
@end

@implementation SBAlertItemPresentation

- (SBAlertItemPresentation)initWithAlertItem:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAlertItemPresentation;
  v9 = [(SBAlertItemPresentation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alertItem, a3);
    objc_storeStrong((id *)&v10->_presenter, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  return [(SBAlertItem *)self->_alertItem hash] + 7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  alertItem = self->_alertItem;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__SBAlertItemPresentation_isEqual___block_invoke;
  v10[3] = &unk_1E6AF5180;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:alertItem counterpart:v10];
  LOBYTE(alertItem) = [v5 isEqual];

  return (char)alertItem;
}

id __35__SBAlertItemPresentation_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (NSString)description
{
  return (NSString *)[(SBAlertItemPresentation *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBAlertItemPresentation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_alertItem withName:@"alertItem" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_presenter withName:@"presenter" skipIfNil:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBAlertItemPresentation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (SBAlertItem)alertItem
{
  return self->_alertItem;
}

- (void)setAlertItem:(id)a3
{
}

- (SBAlertItemPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_alertItem, 0);
}

@end