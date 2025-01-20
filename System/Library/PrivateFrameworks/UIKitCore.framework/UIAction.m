@interface UIAction
+ (BOOL)supportsSecureCoding;
+ (NSString)_textFromCameraImageName;
+ (NSString)_textFromCameraTitle;
+ (UIAction)actionWithHandler:(UIActionHandler)handler;
+ (UIAction)actionWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIActionIdentifier)identifier handler:(UIActionHandler)handler;
+ (UIAction)captureTextFromCameraActionForResponder:(UIResponder *)responder identifier:(UIActionIdentifier)identifier;
+ (UIAction)textInteractableItemDefaultAction;
+ (UIImage)_textFromCameraImage;
+ (id)_textFromCameraTitleForResponder:(id)a3;
- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5;
- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4;
- (BOOL)_isDefaultCommand;
- (BOOL)_isLeaf;
- (BOOL)isEqual:(id)a3;
- (BOOL)keepsMenuPresented;
- (BOOL)requiresAuthenticatedInput;
- (NSPointerArray)_getStateObservers;
- (NSString)description;
- (NSString)discoverabilityTitle;
- (UIAction)initWithAction:(id)a3;
- (UIAction)initWithCoder:(id)a3;
- (UIAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 state:(int64_t)a8 handler:(id)a9;
- (UIActionIdentifier)identifier;
- (UIImage)selectedImage;
- (UIMenuElementAttributes)attributes;
- (UIMenuElementState)state;
- (UIPopoverPresentationControllerSourceItem)presentationSourceItem;
- (id)_immutableCopy;
- (id)_leafAlternates;
- (id)_leafKeyInput;
- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4;
- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handler;
- (id)sender;
- (int64_t)_leafKeyModifierFlags;
- (unint64_t)hash;
- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6;
- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4;
- (void)_addStateObserver:(id)a3;
- (void)_performWithTarget:(id)a3;
- (void)_removeStateObserver:(id)a3;
- (void)_setState:(int64_t)a3 notifyingObservers:(BOOL)a4;
- (void)_setStateObservers:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)performWithSender:(id)a3 target:(id)a4;
- (void)setAttributes:(UIMenuElementAttributes)attributes;
- (void)setDiscoverabilityTitle:(NSString *)discoverabilityTitle;
- (void)setHandler:(id)a3;
- (void)setImage:(UIImage *)image;
- (void)setSelectedImage:(id)a3;
- (void)setState:(UIMenuElementState)state;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(NSString *)title;
@end

@implementation UIAction

+ (UIAction)actionWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIActionIdentifier)identifier handler:(UIActionHandler)handler
{
  UIActionHandler v10 = handler;
  v11 = identifier;
  v12 = image;
  v13 = title;
  v14 = (void *)[objc_alloc((Class)a1) initWithTitle:v13 image:v12 identifier:v11 discoverabilityTitle:0 attributes:0 state:0 handler:v10];

  return (UIAction *)v14;
}

- (id)_immutableCopy
{
  v2 = [(UIAction *)[_UIImmutableAction alloc] initWithAction:self];
  return v2;
}

+ (UIAction)actionWithHandler:(UIActionHandler)handler
{
  UIActionHandler v4 = handler;
  v5 = (void *)[objc_alloc((Class)a1) initWithTitle:&stru_1ED0E84C0 image:0 identifier:0 discoverabilityTitle:0 attributes:0 state:0 handler:v4];

  return (UIAction *)v5;
}

- (UIAction)initWithAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v4 image];
  v7 = [v4 identifier];
  v8 = [v4 discoverabilityTitle];
  uint64_t v9 = [v4 attributes];
  uint64_t v10 = [v4 state];
  v11 = [v4 handler];
  v12 = [(UIAction *)self initWithTitle:v5 image:v6 identifier:v7 discoverabilityTitle:v8 attributes:v9 state:v10 handler:v11];

  objc_storeStrong((id *)&v12->super._attributedTitle, *((id *)v4 + 1));
  objc_storeStrong((id *)&v12->super._subtitle, *((id *)v4 + 2));
  v12->_requiresAuthenticatedInput = *((unsigned char *)v4 + 72);
  uint64_t v13 = [v4 accessibilityIdentifier];
  accessibilityIdentifier = v12->super._accessibilityIdentifier;
  v12->super._accessibilityIdentifier = (NSString *)v13;

  v15 = [v4 _accessoryAction];
  [(UIMenuElement *)v12 set_accessoryAction:v15];

  v12->super.__preferredDisplayMode = [v4 _preferredDisplayMode];
  objc_storeStrong((id *)&v12->_selectedImage, *((id *)v4 + 12));

  return v12;
}

- (UIAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 state:(int64_t)a8 handler:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)UIAction;
  v18 = [(UIMenuElement *)&v26 initWithTitle:a3 image:a4 imageName:0];
  if (v18)
  {
    if (v15)
    {
      v19 = (void *)[v15 copy];
    }
    else
    {
      v20 = NSString;
      a3 = [MEMORY[0x1E4F29128] UUID];
      v19 = [v20 stringWithFormat:@"com.apple.action.dynamic.%@", a3];
    }
    objc_storeStrong((id *)&v18->_identifier, v19);
    if (!v15)
    {

      v19 = a3;
    }

    uint64_t v21 = [v16 copy];
    discoverabilityTitle = v18->_discoverabilityTitle;
    v18->_discoverabilityTitle = (NSString *)v21;

    v18->_attributes = a7;
    v18->_state = a8;
    uint64_t v23 = [v17 copy];
    id handler = v18->_handler;
    v18->_id handler = (id)v23;
  }
  return v18;
}

- (UIMenuElementState)state
{
  return self->_state;
}

- (UIActionIdentifier)identifier
{
  return self->_identifier;
}

- (UIMenuElementAttributes)attributes
{
  return self->_attributes;
}

- (id)handler
{
  return self->_handler;
}

- (NSString)discoverabilityTitle
{
  return self->_discoverabilityTitle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UIAction alloc];
  return [(UIAction *)v4 initWithAction:self];
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a5) {
    (*((void (**)(id, UIAction *))a5 + 2))(a5, self);
  }
}

- (void)_addStateObserver:(id)a3
{
}

- (NSPointerArray)_getStateObservers
{
  return self->stateObservers;
}

- (void)_setStateObservers:(id)a3
{
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4) {
    (*((void (**)(id, UIAction *))a4 + 2))(a4, self);
  }
}

- (void)setSubtitle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIAction;
  [(UIMenuElement *)&v3 _setSubtitle:a3];
}

- (void)setSelectedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_discoverabilityTitle, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->stateObservers, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSString *)self->_identifier isEqualToString:v4[14]];

  return v5;
}

- (void)setState:(UIMenuElementState)state
{
}

- (void)setAttributes:(UIMenuElementAttributes)attributes
{
  self->_attributes = attributes;
}

- (void)_setState:(int64_t)a3 notifyingObservers:(BOOL)a4
{
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a4) {
      _UIMenuStateObserverableLeafStateDidChange(self);
    }
  }
}

- (void)setTitle:(NSString *)title
{
  v3.receiver = self;
  v3.super_class = (Class)UIAction;
  [(UIMenuElement *)&v3 _setTitle:title];
}

- (void)setImage:(UIImage *)image
{
  v3.receiver = self;
  v3.super_class = (Class)UIAction;
  [(UIMenuElement *)&v3 _setImage:image];
}

+ (NSString)_textFromCameraTitle
{
  return (NSString *)_UINSLocalizedStringWithDefaultValue(@"Scan Text", @"Scan Text");
}

+ (NSString)_textFromCameraImageName
{
  return (NSString *)@"text.viewfinder";
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

+ (UIAction)textInteractableItemDefaultAction
{
  if (_MergedGlobals_951 != -1) {
    dispatch_once(&_MergedGlobals_951, &__block_literal_global_37);
  }
  v2 = (void *)qword_1EB25F0B8;
  return (UIAction *)v2;
}

void __82__UIAction_UITextInteractableItemDefaultAction__textInteractableItemDefaultAction__block_invoke()
{
  uint64_t v0 = +[UIAction actionWithTitle:&stru_1ED0E84C0 image:0 identifier:@"UITextInteractableItemDefaultAction" handler:&__block_literal_global_7];
  v1 = (void *)qword_1EB25F0B8;
  qword_1EB25F0B8 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (BOOL)keepsMenuPresented
{
  return ([(UIAction *)self attributes] >> 3) & 1;
}

- (UIAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIAction;
  BOOL v5 = [(UIMenuElement *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoverabilityTitle"];
    discoverabilityTitle = v5->_discoverabilityTitle;
    v5->_discoverabilityTitle = (NSString *)v8;

    v5->_attributes = [v4 decodeIntegerForKey:@"attributes"];
    v5->_state = [v4 decodeIntegerForKey:@"states"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedImage"];
    selectedImage = v5->_selectedImage;
    v5->_selectedImage = (UIImage *)v10;

    v5->_requiresAuthenticatedInput = [v4 decodeBoolForKey:@"requiresAuthenticatedInput"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAction;
  [(UIMenuElement *)&v9 encodeWithCoder:v4];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  discoverabilityTitle = self->_discoverabilityTitle;
  if (discoverabilityTitle) {
    [v4 encodeObject:discoverabilityTitle forKey:@"discoverabilityTitle"];
  }
  unint64_t attributes = self->_attributes;
  if (attributes) {
    [v4 encodeInteger:attributes forKey:@"attributes"];
  }
  int64_t state = self->_state;
  if (state) {
    [v4 encodeInteger:state forKey:@"states"];
  }
  selectedImage = self->_selectedImage;
  if (selectedImage) {
    [v4 encodeObject:selectedImage forKey:@"selectedImage"];
  }
  if (self->_requiresAuthenticatedInput) {
    [v4 encodeBool:1 forKey:@"requiresAuthenticatedInput"];
  }
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  if (a5) {
    return (*((uint64_t (**)(id, UIAction *))a5 + 2))(a5, self);
  }
  else {
    return 0;
  }
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4) {
    return (*((uint64_t (**)(id, UIAction *))a4 + 2))(a4, self);
  }
  else {
    return 0;
  }
}

- (id)_leafAlternates
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_leafKeyInput
{
  return 0;
}

- (int64_t)_leafKeyModifierFlags
{
  return 0;
}

- (BOOL)_isDefaultCommand
{
  return 0;
}

- (id)sender
{
  return _UIMenuLeafAPISenderFromSender(self->_sender);
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return (UIPopoverPresentationControllerSourceItem *)_UIMenuLeafPresentationSourceItemFromSender(self->_sender);
}

- (void)performWithSender:(id)a3 target:(id)a4
{
  id v9 = a3;
  _UIMenuStateObserverableLeafWillPerformAction(self);
  if (self->_handler)
  {
    p_id sender = &self->_sender;
    objc_storeStrong(&self->_sender, a3);
    v7 = self;
    (*((void (**)(void))self->_handler + 2))();
    id sender = self->_sender;
    id *p_sender = 0;
  }
}

- (void)_performWithTarget:(id)a3
{
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  return 0;
}

- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5
{
  return (id)[a5 validatedActionForTarget:a4 action:self];
}

- (NSString)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(UIMenuElement *)self title];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p title = %@", v4, self, v5];;

  v7 = [(UIMenuElement *)self image];
  if (v7)
  {
    [v6 appendFormat:@"; image = <%@: %p", objc_opt_class(), v7];
    if ([v7 isSymbolImage])
    {
      uint64_t v8 = _UIImageName(v7);
      [v6 appendFormat:@"; symbol = (%@)", v8];
    }
    [v6 appendString:@">"];
  }
  if ([(UIAction *)self attributes])
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    if ([(UIAction *)self attributes]) {
      [v9 addObject:@"Disabled"];
    }
    if (([(UIAction *)self attributes] & 2) != 0) {
      [v9 addObject:@"Destructive"];
    }
    if (([(UIAction *)self attributes] & 4) != 0) {
      [v9 addObject:@"Hidden"];
    }
    if ([(UIAction *)self keepsMenuPresented]) {
      [v9 addObject:@"KeepsMenuPresented"];
    }
    uint64_t v10 = [v9 componentsJoinedByString:@"|"];
    [v6 appendFormat:@"; unint64_t attributes = (%@)", v10];
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (void)_removeStateObserver:(id)a3
{
}

- (BOOL)requiresAuthenticatedInput
{
  return self->_requiresAuthenticatedInput;
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setDiscoverabilityTitle:(NSString *)discoverabilityTitle
{
}

- (void)setHandler:(id)a3
{
}

+ (UIAction)captureTextFromCameraActionForResponder:(UIResponder *)responder identifier:(UIActionIdentifier)identifier
{
  BOOL v5 = responder;
  uint64_t v6 = identifier;
  v7 = +[UIAction _textFromCameraTitleForResponder:v5];
  uint64_t v8 = +[UIAction _textFromCameraImage];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__UIAction_UICaptureTextFromCameraSupporting__captureTextFromCameraActionForResponder_identifier___block_invoke;
  v12[3] = &unk_1E52DB038;
  objc_super v13 = v5;
  id v9 = v5;
  uint64_t v10 = +[UIAction actionWithTitle:v7 image:v8 identifier:v6 handler:v12];

  return (UIAction *)v10;
}

uint64_t __98__UIAction_UICaptureTextFromCameraSupporting__captureTextFromCameraActionForResponder_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) captureTextFromCamera:a2];
}

+ (id)_textFromCameraTitleForResponder:(id)a3
{
  objc_super v3 = +[UIKeyboardCameraSession keyboardCameraContentTypeForResponder:a3];
  if ([v3 isEqualToString:@"tel"])
  {
    uint64_t v4 = @"Scan Phone Number";
  }
  else if ([v3 isEqualToString:@"street-address"])
  {
    uint64_t v4 = @"Scan Address";
  }
  else if ([v3 isEqualToString:@"url"])
  {
    uint64_t v4 = @"Scan URL";
  }
  else if ([v3 isEqualToString:@"email"])
  {
    uint64_t v4 = @"Scan Email Address";
  }
  else if ([v3 isEqualToString:@"flight-number"])
  {
    uint64_t v4 = @"Scan Flight Number";
  }
  else if ([v3 isEqualToString:@"shipment-tracking-number"])
  {
    uint64_t v4 = @"Scan Tracking Number";
  }
  else if ([v3 isEqualToString:@"date-time"])
  {
    uint64_t v4 = @"Scan Date or Time";
  }
  else
  {
    uint64_t v4 = @"Scan Text";
  }
  BOOL v5 = _UINSLocalizedStringWithDefaultValue(v4, v4);

  return v5;
}

+ (UIImage)_textFromCameraImage
{
  v2 = +[UIAction _textFromCameraImageName];
  objc_super v3 = +[UIImage systemImageNamed:v2];

  return (UIImage *)v3;
}

@end