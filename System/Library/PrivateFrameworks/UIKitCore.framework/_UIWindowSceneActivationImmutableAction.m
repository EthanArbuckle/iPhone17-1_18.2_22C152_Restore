@interface _UIWindowSceneActivationImmutableAction
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setAlternateAction:(id)a3;
- (void)_setConfigurationProvider:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAttributes:(unint64_t)a3;
- (void)setDiscoverabilityTitle:(id)a3;
- (void)setImage:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIWindowSceneActivationImmutableAction

- (void)setTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:249 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setImage:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:253 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setDiscoverabilityTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:257 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setAttributes:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:261 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setState:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:265 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:269 description:@"Action is immutable because it is a child of a menu"];
}

- (void)_setAlternateAction:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:273 description:@"Action is immutable because it is a child of a menu"];
}

- (void)_setConfigurationProvider:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:277 description:@"Action is immutable because it is a child of a menu"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UIWindowSceneActivationAction alloc];
  id v5 = [(UIMenuElement *)self title];
  v6 = [(UIMenuElement *)self image];
  v7 = [(UIAction *)self identifier];
  v8 = [(UIAction *)self discoverabilityTitle];
  UIMenuElementAttributes v9 = [(UIAction *)self attributes];
  v10 = [(UIWindowSceneActivationAction *)self _alternateAction];
  v11 = [(UIWindowSceneActivationAction *)self _configurationProvider];
  v12 = [(UIWindowSceneActivationAction *)v4 initWithTitle:v5 image:v6 identifier:v7 discoverabilityTitle:v8 attributes:v9 alternateAction:v10 configurationProvider:v11];

  return v12;
}

@end