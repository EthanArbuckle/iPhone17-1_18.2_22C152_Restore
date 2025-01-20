@interface UIDeferredMenuElement
+ (BOOL)supportsSecureCoding;
+ (UIDeferredMenuElement)elementWithProvider:(void *)elementProvider;
+ (UIDeferredMenuElement)elementWithUncachedProvider:(void *)elementProvider;
+ (id)_elementCachingItems:(BOOL)a3 provider:(id)a4;
- (BOOL)_isDefaultCommand;
- (BOOL)_isLeaf;
- (BOOL)_isLoadingPlaceholder;
- (BOOL)cachesItems;
- (BOOL)fulfilled;
- (BOOL)keepsMenuPresented;
- (BOOL)requiresAuthenticatedInput;
- (NSArray)fulfilledElements;
- (NSString)description;
- (NSString)discoverabilityTitle;
- (UIDeferredMenuElement)initWithCoder:(id)a3;
- (UIDeferredMenuElementDelegate)delegate;
- (UIImage)selectedImage;
- (UIPopoverPresentationControllerSourceItem)presentationSourceItem;
- (id)_leafAlternates;
- (id)_leafKeyInput;
- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4;
- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5;
- (id)elementProvider;
- (id)metadata;
- (id)sender;
- (int64_t)_leafKeyModifierFlags;
- (int64_t)state;
- (unint64_t)attributes;
- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6;
- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4;
- (void)_fulfillIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoverabilityTitle:(id)a3;
- (void)setElementProvider:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSelectedImage:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation UIDeferredMenuElement

+ (UIDeferredMenuElement)elementWithUncachedProvider:(void *)elementProvider
{
  return (UIDeferredMenuElement *)[a1 _elementCachingItems:0 provider:elementProvider];
}

+ (id)_elementCachingItems:(BOOL)a3 provider:(id)a4
{
  id v5 = a4;
  v6 = [UIDeferredMenuElement alloc];
  v7 = _UINSLocalizedStringWithDefaultValue(@"CONTEXT_MENU_LOADING", @"Loading…");
  v8 = [(UIMenuElement *)v6 initWithTitle:v7 image:0 imageName:0];

  v8->_cachesItems = a3;
  [(UIDeferredMenuElement *)v8 setAttributes:1];
  [(UIDeferredMenuElement *)v8 setElementProvider:v5];

  return v8;
}

- (void)setElementProvider:(id)a3
{
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

+ (UIDeferredMenuElement)elementWithProvider:(void *)elementProvider
{
  return (UIDeferredMenuElement *)[a1 _elementCachingItems:1 provider:elementProvider];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fulfilledElements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_metadata, 0);
  objc_storeStrong(&self->_elementProvider, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_discoverabilityTitle, 0);
}

- (void)_fulfillIfNecessary
{
  v3 = [(UIDeferredMenuElement *)self delegate];
  if (v3)
  {
    BOOL isSignalingFulfillment = self->_isSignalingFulfillment;

    if (!isSignalingFulfillment)
    {
      if (!self->_cachesItems)
      {
        self->_fulfilled = 0;
        fulfilledElements = self->_fulfilledElements;
        self->_fulfilledElements = 0;
      }
      if (![(UIDeferredMenuElement *)self fulfilled])
      {
        self->_fulfilled = 1;
        v6 = [(UIDeferredMenuElement *)self elementProvider];
        if (self->_cachesItems) {
          [(UIDeferredMenuElement *)self setElementProvider:0];
        }
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __44__UIDeferredMenuElement__fulfillIfNecessary__block_invoke;
        v7[3] = &unk_1E52D99A8;
        v7[4] = self;
        ((void (**)(void, void *))v6)[2](v6, v7);
      }
    }
  }
}

void __44__UIDeferredMenuElement__fulfillIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v3;

  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  v6 = [*(id *)(a1 + 32) delegate];
  [v6 deferredMenuElementWasFulfilled:*(void *)(a1 + 32)];

  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (BOOL)_isLoadingPlaceholder
{
  return 1;
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a6) {
    (*((void (**)(id, UIDeferredMenuElement *))a6 + 2))(a6, self);
  }
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4) {
    (*((void (**)(id, UIDeferredMenuElement *))a4 + 2))(a4, self);
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

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return 0;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIDeferredMenuElement;
  [(UIMenuElement *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDeferredMenuElement cachesItems](self, "cachesItems"), @"cachesItems");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDeferredMenuElement fulfilled](self, "fulfilled"), @"fulfilled");
  id v5 = [(UIDeferredMenuElement *)self fulfilledElements];

  if (v5)
  {
    v6 = [(UIDeferredMenuElement *)self fulfilledElements];
    [v4 encodeObject:v6 forKey:@"fulfilledElements"];
  }
}

- (UIDeferredMenuElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIDeferredMenuElement;
  id v5 = [(UIMenuElement *)&v13 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(UIDeferredMenuElement *)v5 setAttributes:1];
    v6->_cachesItems = [v4 decodeBoolForKey:@"cachesItems"];
    v6->_fulfilled = [v4 decodeBoolForKey:@"fulfilled"];
    objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"fulfilledElements"];
    fulfilledElements = v6->_fulfilledElements;
    v6->_fulfilledElements = (NSArray *)v10;
  }
  return v6;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)UIDeferredMenuElement;
  v2 = [(UIDeferredMenuElement *)&v4 description];
  return (NSString *)v2;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (NSString)discoverabilityTitle
{
  return self->_discoverabilityTitle;
}

- (void)setDiscoverabilityTitle:(id)a3
{
}

- (BOOL)requiresAuthenticatedInput
{
  return self->_requiresAuthenticatedInput;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)cachesItems
{
  return self->_cachesItems;
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

- (id)elementProvider
{
  return self->_elementProvider;
}

- (id)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (UIDeferredMenuElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDeferredMenuElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)fulfilledElements
{
  return self->_fulfilledElements;
}

- (BOOL)fulfilled
{
  return self->_fulfilled;
}

@end