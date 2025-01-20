@interface UIWindowSceneActivationAction
+ (UIWindowSceneActivationAction)actionWithHandler:(UIActionHandler)handler;
+ (UIWindowSceneActivationAction)actionWithIdentifier:(UIActionIdentifier)identifier alternateAction:(UIAction *)alternateAction configurationProvider:(UIWindowSceneActivationActionConfigurationProvider)configurationProvider;
+ (UIWindowSceneActivationAction)actionWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIActionIdentifier)identifier handler:(UIActionHandler)handler;
+ (id)_defaultImage;
+ (id)_defaultTitle;
- (BOOL)keepsMenuPresented;
- (UIAction)_alternateAction;
- (UIWindowSceneActivationAction)initWithCoder:(id)a3;
- (UIWindowSceneActivationAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 alternateAction:(id)a8 configurationProvider:(id)a9;
- (UIWindowSceneActivationAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 state:(int64_t)a8 handler:(id)a9;
- (_UIWindowSceneActivator)_preferredActivator;
- (id)_configurationProvider;
- (id)_immutableCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_requestSceneActivation;
- (void)_setAlternateAction:(id)a3;
- (void)_setConfigurationProvider:(id)a3;
- (void)_willBePreparedForInitialDisplay:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)set_preferredActivator:(id)a3;
@end

@implementation UIWindowSceneActivationAction

+ (UIWindowSceneActivationAction)actionWithIdentifier:(UIActionIdentifier)identifier alternateAction:(UIAction *)alternateAction configurationProvider:(UIWindowSceneActivationActionConfigurationProvider)configurationProvider
{
  UIWindowSceneActivationActionConfigurationProvider v8 = configurationProvider;
  v9 = alternateAction;
  v10 = identifier;
  id v11 = objc_alloc((Class)a1);
  v12 = [a1 _defaultTitle];
  v13 = [a1 _defaultImage];
  v14 = (void *)[v11 initWithTitle:v12 image:v13 identifier:v10 discoverabilityTitle:0 attributes:0 alternateAction:v9 configurationProvider:v8];

  return (UIWindowSceneActivationAction *)v14;
}

- (UIWindowSceneActivationAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 alternateAction:(id)a8 configurationProvider:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  int v21 = [(id)UIApp supportsMultipleScenes];
  if (!v19 || (v21 & 1) != 0)
  {
    uint64_t v25 = 0;
    if (!v21) {
      a7 |= 4uLL;
    }
    v26 = &__block_literal_global_241;
  }
  else
  {
    uint64_t v22 = [v19 title];

    uint64_t v23 = [v19 image];

    uint64_t v24 = [v19 discoverabilityTitle];

    a7 = [v19 attributes];
    uint64_t v25 = [v19 state];
    id v16 = (id)v23;
    id v18 = (id)v24;
    id v15 = (id)v22;
    v26 = &__block_literal_global_6_8;
  }
  v33.receiver = self;
  v33.super_class = (Class)UIWindowSceneActivationAction;
  v27 = [(UIAction *)&v33 initWithTitle:v15 image:v16 identifier:v17 discoverabilityTitle:v18 attributes:a7 state:v25 handler:v26];
  if (v27)
  {
    uint64_t v28 = [v19 copy];
    alternateAction = v27->__alternateAction;
    v27->__alternateAction = (UIAction *)v28;

    uint64_t v30 = [v20 copy];
    id configurationProvider = v27->__configurationProvider;
    v27->__id configurationProvider = (id)v30;
  }
  return v27;
}

uint64_t __134__UIWindowSceneActivationAction_initWithTitle_image_identifier_discoverabilityTitle_attributes_alternateAction_configurationProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _requestSceneActivation];
}

void __134__UIWindowSceneActivationAction_initWithTitle_image_identifier_discoverabilityTitle_attributes_alternateAction_configurationProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 _alternateAction];
  v3 = [v2 sender];

  [v4 performWithSender:v3 target:0];
}

- (void)setTitle:(NSString *)title
{
  id v4 = title;
  v5 = v4;
  if (!v4)
  {
    v5 = [(id)objc_opt_class() _defaultTitle];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIWindowSceneActivationAction;
  [(UIAction *)&v6 setTitle:v5];
  if (!v4) {
}
  }

- (void)_requestSceneActivation
{
  v3 = [(UIAction *)self sender];
  id v4 = [(UIWindowSceneActivationAction *)self _configurationProvider];
  v5 = ((void (**)(void, UIWindowSceneActivationAction *))v4)[2](v4, self);

  if (!v5)
  {
    objc_super v6 = 0;
    goto LABEL_13;
  }
  objc_super v6 = (void *)[v5 copy];

  v7 = [(UIWindowSceneActivationAction *)self _preferredActivator];
  id v8 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    v10 = [v9 window];
    id v11 = [v10 windowScene];

    if (v11) {
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 _viewForPresenting];
    v12 = [v9 window];
    v13 = [v12 windowScene];

    if (!v13)
    {
      id v15 = 0;
      goto LABEL_11;
    }
LABEL_7:
    v14 = [v9 window];
    id v15 = [v14 windowScene];

LABEL_11:
    goto LABEL_12;
  }
  id v15 = 0;
LABEL_12:

  _UIWindowSceneActivationPrepareConfiguration(v6, 0, v7, v15, &__block_literal_global_11_0);
LABEL_13:
  [(UIWindowSceneActivationAction *)self set_preferredActivator:0];
  id v16 = [(UIWindowSceneActivationAction *)self _alternateAction];
  id v17 = [v6 userActivity];

  if (v17)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__UIWindowSceneActivationAction__requestSceneActivation__block_invoke_2;
    v18[3] = &unk_1E52EF7F8;
    id v19 = v16;
    id v20 = v3;
    _UIWindowSceneActivateConfiguration(v6, v20, v18);
  }
  else if (v16)
  {
    [v16 performWithSender:v3 target:0];
  }
}

UIWindowSceneProminentPlacement *__56__UIWindowSceneActivationAction__requestSceneActivation__block_invoke()
{
  return +[UIWindowSceneProminentPlacement prominentPlacement];
}

void *__56__UIWindowSceneActivationAction__requestSceneActivation__block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result performWithSender:*(void *)(a1 + 40) target:0];
  }
  return result;
}

- (id)_immutableCopy
{
  v3 = [_UIWindowSceneActivationImmutableAction alloc];
  id v4 = [(UIMenuElement *)self title];
  v5 = [(UIMenuElement *)self image];
  objc_super v6 = [(UIAction *)self identifier];
  v7 = [(UIAction *)self discoverabilityTitle];
  UIMenuElementAttributes v8 = [(UIAction *)self attributes];
  id v9 = [(UIWindowSceneActivationAction *)self _alternateAction];
  v10 = [(UIWindowSceneActivationAction *)self _configurationProvider];
  id v11 = [(UIWindowSceneActivationAction *)v3 initWithTitle:v4 image:v5 identifier:v6 discoverabilityTitle:v7 attributes:v8 alternateAction:v9 configurationProvider:v10];

  v12 = [(UIWindowSceneActivationAction *)self _preferredActivator];
  [(UIWindowSceneActivationAction *)v11 set_preferredActivator:v12];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UIWindowSceneActivationAction alloc];
  v5 = [(UIMenuElement *)self title];
  objc_super v6 = [(UIMenuElement *)self image];
  v7 = [(UIAction *)self identifier];
  UIMenuElementAttributes v8 = [(UIAction *)self discoverabilityTitle];
  UIMenuElementAttributes v9 = [(UIAction *)self attributes];
  v10 = [(UIWindowSceneActivationAction *)self _alternateAction];
  id v11 = [(UIWindowSceneActivationAction *)self _configurationProvider];
  v12 = [(UIWindowSceneActivationAction *)v4 initWithTitle:v5 image:v6 identifier:v7 discoverabilityTitle:v8 attributes:v9 alternateAction:v10 configurationProvider:v11];

  v13 = [(UIWindowSceneActivationAction *)self _preferredActivator];
  [(UIWindowSceneActivationAction *)v12 set_preferredActivator:v13];

  return v12;
}

- (BOOL)keepsMenuPresented
{
  return 1;
}

- (void)_willBePreparedForInitialDisplay:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIWindowSceneActivationAction;
  [(UIMenuElement *)&v5 _willBePreparedForInitialDisplay:v4];
  if ([v4 conformsToProtocol:&unk_1ED59BC80]) {
    [(UIWindowSceneActivationAction *)self set_preferredActivator:v4];
  }
}

+ (id)_defaultTitle
{
  return _UILocalizedString(@"Open in New Window", @"A title for a menu item used for opening some content in a new window.", @"Open in New Window");
}

+ (id)_defaultImage
{
  return +[UIImage systemImageNamed:@"rectangle.badge.plus"];
}

- (UIWindowSceneActivationAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 state:(int64_t)a8 handler:(id)a9
{
  id v11 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7, a8);
  [v11 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:218 description:@"Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"];

  return 0;
}

- (UIWindowSceneActivationAction)initWithCoder:(id)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIWindowSceneActivationAction.m" lineNumber:223 description:@"Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"];

  return 0;
}

+ (UIWindowSceneActivationAction)actionWithHandler:(UIActionHandler)handler
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", handler);
  [v5 handleFailureInMethod:a2 object:a1 file:@"UIWindowSceneActivationAction.m" lineNumber:228 description:@"Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"];

  return 0;
}

+ (UIWindowSceneActivationAction)actionWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIActionIdentifier)identifier handler:(UIActionHandler)handler
{
  UIMenuElementAttributes v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", title, image, identifier, handler);
  [v8 handleFailureInMethod:a2 object:a1 file:@"UIWindowSceneActivationAction.m" lineNumber:236 description:@"Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"];

  return 0;
}

- (_UIWindowSceneActivator)_preferredActivator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__preferredActivator);
  return (_UIWindowSceneActivator *)WeakRetained;
}

- (void)set_preferredActivator:(id)a3
{
}

- (id)_configurationProvider
{
  return self->__configurationProvider;
}

- (void)_setConfigurationProvider:(id)a3
{
}

- (UIAction)_alternateAction
{
  return self->__alternateAction;
}

- (void)_setAlternateAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateAction, 0);
  objc_storeStrong(&self->__configurationProvider, 0);
  objc_destroyWeak((id *)&self->__preferredActivator);
}

@end