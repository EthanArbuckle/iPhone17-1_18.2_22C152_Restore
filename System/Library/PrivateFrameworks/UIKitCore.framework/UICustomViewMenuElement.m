@interface UICustomViewMenuElement
+ (id)elementWithViewProvider:(id)a3;
- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5;
- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4;
- (BOOL)_forceCustomViewSupport;
- (BOOL)_isDefaultCommand;
- (BOOL)_isLeaf;
- (BOOL)keepsMenuPresented;
- (BOOL)requiresAuthenticatedInput;
- (NSString)discoverabilityTitle;
- (UICustomViewMenuElement)initWithMenuElement:(id)a3;
- (UIImage)selectedImage;
- (UIMenuElement)menuElementRepresentation;
- (UIPopoverPresentationControllerSourceItem)presentationSourceItem;
- (UIView)contentView;
- (id)_immutableCopy;
- (id)_leafAlternates;
- (id)_leafKeyInput;
- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4;
- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5;
- (id)primaryActionHandler;
- (id)sender;
- (id)viewProvider;
- (int64_t)_leafKeyModifierFlags;
- (int64_t)state;
- (unint64_t)attributes;
- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6;
- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4;
- (void)_setForceCustomViewSupport:(BOOL)a3;
- (void)performWithSender:(id)a3 target:(id)a4;
- (void)setAttributes:(unint64_t)a3;
- (void)setDiscoverabilityTitle:(id)a3;
- (void)setMenuElementRepresentation:(id)a3;
- (void)setPrimaryActionHandler:(id)a3;
- (void)setSelectedImage:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setViewProvider:(id)a3;
@end

@implementation UICustomViewMenuElement

+ (id)elementWithViewProvider:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [NSString string];
  v7 = (void *)[v5 initWithTitle:v6 image:0 imageName:0];

  [v7 setViewProvider:v4];
  return v7;
}

- (void)setViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewProvider, 0);
  objc_storeStrong(&self->_primaryActionHandler, 0);
  objc_storeStrong((id *)&self->_menuElementRepresentation, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->discoverabilityTitle, 0);
}

- (UICustomViewMenuElement)initWithMenuElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UICustomViewMenuElement;
  id v5 = [(UIMenuElement *)&v11 initWithTitle:&stru_1ED0E84C0 image:0 imageName:0];
  if (v5)
  {
    v6 = _Block_copy(*((const void **)v4 + 17));
    id viewProvider = v5->_viewProvider;
    v5->_id viewProvider = v6;

    objc_storeStrong((id *)&v5->_menuElementRepresentation, *((id *)v4 + 15));
    v8 = _Block_copy(*((const void **)v4 + 16));
    id primaryActionHandler = v5->_primaryActionHandler;
    v5->_id primaryActionHandler = v8;

    v5->_forceCustomViewSupport = *((unsigned char *)v4 + 73);
  }

  return v5;
}

- (UIView)contentView
{
  v3 = [(UICustomViewMenuElement *)self viewProvider];

  if (v3)
  {
    id v4 = [(UICustomViewMenuElement *)self viewProvider];
    id v5 = ((void (**)(void, UICustomViewMenuElement *))v4)[2](v4, self);
  }
  else
  {
    id v5 = 0;
  }
  return (UIView *)v5;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (id)_immutableCopy
{
  v2 = [(UICustomViewMenuElement *)[_UIImmutableCustomViewMenuElement alloc] initWithMenuElement:self];
  return v2;
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(UICustomViewMenuElement *)self menuElementRepresentation];

  if (v13)
  {
    v14 = [(UICustomViewMenuElement *)self menuElementRepresentation];
    [v14 _acceptMenuVisit:v15 commandVisit:v10 actionVisit:v11 deferredElementVisit:v12];
  }
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4) {
    (*((void (**)(id, UICustomViewMenuElement *))a4 + 2))(a4, self);
  }
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4) {
    return (*((uint64_t (**)(id, UICustomViewMenuElement *))a4 + 2))(a4, self);
  }
  else {
    return 0;
  }
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UICustomViewMenuElement *)self menuElementRepresentation];

  if (v11)
  {
    id v12 = [(UICustomViewMenuElement *)self menuElementRepresentation];
    char v13 = [v12 _acceptBoolMenuVisit:v8 commandVisit:v9 actionVisit:v10];
  }
  else
  {
    char v13 = 1;
  }

  return v13;
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

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return 0;
}

- (void)performWithSender:(id)a3 target:(id)a4
{
  id v5 = [(UICustomViewMenuElement *)self primaryActionHandler];

  if (v5)
  {
    v6 = [(UICustomViewMenuElement *)self primaryActionHandler];
    v6[2](v6, self);
  }
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  return 0;
}

- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5
{
  return 0;
}

- (BOOL)keepsMenuPresented
{
  return 0;
}

- (unint64_t)attributes
{
  return self->attributes;
}

- (void)setAttributes:(unint64_t)a3
{
  self->attributes = a3;
}

- (NSString)discoverabilityTitle
{
  return self->discoverabilityTitle;
}

- (void)setDiscoverabilityTitle:(id)a3
{
}

- (BOOL)requiresAuthenticatedInput
{
  return self->requiresAuthenticatedInput;
}

- (int64_t)state
{
  return self->state;
}

- (void)setState:(int64_t)a3
{
  self->state = a3;
}

- (BOOL)_forceCustomViewSupport
{
  return self->_forceCustomViewSupport;
}

- (void)_setForceCustomViewSupport:(BOOL)a3
{
  self->_forceCustomViewSupport = a3;
}

- (id)sender
{
  return self->_sender;
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
}

- (UIMenuElement)menuElementRepresentation
{
  return self->_menuElementRepresentation;
}

- (void)setMenuElementRepresentation:(id)a3
{
}

- (id)primaryActionHandler
{
  return self->_primaryActionHandler;
}

- (void)setPrimaryActionHandler:(id)a3
{
}

- (id)viewProvider
{
  return self->_viewProvider;
}

@end