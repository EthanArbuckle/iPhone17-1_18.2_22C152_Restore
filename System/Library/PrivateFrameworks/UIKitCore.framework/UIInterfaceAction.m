@interface UIInterfaceAction
+ (BOOL)changedProperties:(id)a3 containsAny:(id)a4;
+ (UIInterfaceAction)actionWithCustomContentView:(id)a3 handler:(id)a4;
+ (UIInterfaceAction)actionWithCustomContentViewController:(id)a3;
+ (UIInterfaceAction)actionWithTitle:(id)a3 type:(int64_t)a4 handler:(id)a5;
+ (id)_observableDisplayProperties;
+ (void)_setInterfaceActionCanInvokeActionsWithoutPresentingController:(BOOL)a3;
- (BOOL)_isFocused;
- (BOOL)_isPreferred;
- (BOOL)isEnabled;
- (CGSize)_layoutSizeForImageProperty:(id)a3;
- (CGSize)leadingImageLayoutSize;
- (CGSize)trailingImageLayoutSize;
- (NSPointerArray)weakDisplayPropertyObservers;
- (NSString)classificationTitle;
- (NSString)title;
- (UIColor)_imageTintColor;
- (UIColor)_titleTextColor;
- (UIImage)leadingImage;
- (UIImage)trailingImage;
- (UIInterfaceAction)initWithTitle:(id)a3 type:(int64_t)a4 customContentViewController:(id)a5 customContentView:(id)a6 handler:(id)a7;
- (UIInterfaceActionRepresentationView)_visualRepresentation;
- (UIInterfaceActionVisualStyle)_visualStyle;
- (UIView)customContentView;
- (UIViewController)customContentViewController;
- (_UIInterfaceActionPresenting)_presentingController;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)handler;
- (int64_t)titleAlignment;
- (int64_t)type;
- (void)_addActionDisplayPropertyObserver:(id)a3;
- (void)_invokeHandlerWithCompletionBlock:(id)a3;
- (void)_notifyObserversDidChangeActionProperty:(id)a3;
- (void)_notifyObserversVisualStyleDidChange;
- (void)_removeActionDisplayPropertyObserver:(id)a3;
- (void)_setImageTintColor:(id)a3;
- (void)_setIsFocused:(BOOL)a3;
- (void)_setIsPreferred:(BOOL)a3;
- (void)_setPresentingController:(id)a3;
- (void)_setTitleTextColor:(id)a3;
- (void)_setVisualRepresentation:(id)a3;
- (void)_setVisualStyle:(id)a3;
- (void)setClassificationTitle:(id)a3;
- (void)setCustomContentViewController:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setLeadingImage:(id)a3;
- (void)setLeadingImageLayoutSize:(CGSize)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAlignment:(int64_t)a3;
- (void)setTrailingImage:(id)a3;
- (void)setTrailingImageLayoutSize:(CGSize)a3;
- (void)setType:(int64_t)a3;
@end

@implementation UIInterfaceAction

+ (BOOL)changedProperties:(id)a3 containsAny:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(v5, "containsObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

+ (UIInterfaceAction)actionWithTitle:(id)a3 type:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 type:a4 customContentViewController:0 customContentView:0 handler:v8];

  return (UIInterfaceAction *)v10;
}

+ (UIInterfaceAction)actionWithCustomContentViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithTitle:&stru_1ED0E84C0 type:100 customContentViewController:v4 customContentView:0 handler:0];

  return (UIInterfaceAction *)v5;
}

+ (UIInterfaceAction)actionWithCustomContentView:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTitle:&stru_1ED0E84C0 type:100 customContentViewController:0 customContentView:v7 handler:v6];

  return (UIInterfaceAction *)v8;
}

- (UIInterfaceAction)initWithTitle:(id)a3 type:(int64_t)a4 customContentViewController:(id)a5 customContentView:(id)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)UIInterfaceAction;
  uint64_t v17 = [(UIInterfaceAction *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    v18->_titleAlignment = 1;
    v18->_type = a4;
    v19 = _Block_copy(v16);
    id handler = v18->_handler;
    v18->_id handler = v19;

    objc_storeStrong((id *)&v18->_customContentViewController, a5);
    objc_storeStrong((id *)&v18->_customContentView, a6);
    uint64_t v21 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    weakDisplayPropertyObservers = v18->_weakDisplayPropertyObservers;
    v18->_weakDisplayPropertyObservers = (NSPointerArray *)v21;

    v18->_enabled = 1;
  }

  return v18;
}

- (void)_setVisualStyle:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_visualStyle] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualStyle, a3);
    [(UIInterfaceAction *)self _notifyObserversVisualStyleDidChange];
  }
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)UIInterfaceAction;
  v3 = [(UIInterfaceAction *)&v10 description];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSString *)self->_title length])
  {
    id v5 = [NSString stringWithFormat:@" title = %@", self->_title];
    [v4 addObject:v5];
  }
  if (self->_customContentView)
  {
    id v6 = [NSString stringWithFormat:@" customContentView = %@", self->_customContentView];
    [v4 addObject:v6];
  }
  if ([v4 count])
  {
    id v7 = [v4 componentsJoinedByString:@", "];
    uint64_t v8 = [v3 stringByAppendingFormat:@" %@", v7];

    v3 = (void *)v8;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithTitle:self->_title type:self->_type customContentViewController:self->_customContentViewController customContentView:self->_customContentView handler:self->_handler];
  *(void *)(v4 + 48) = self->_titleAlignment;
  objc_storeStrong((id *)(v4 + 56), self->_classificationTitle);
  *(unsigned char *)(v4 + 8) = self->_enabled;
  objc_storeStrong((id *)(v4 + 64), self->_leadingImage);
  *(CGSize *)(v4 + 136) = self->_leadingImageLayoutSize;
  objc_storeStrong((id *)(v4 + 72), self->_trailingImage);
  *(CGSize *)(v4 + 152) = self->_trailingImageLayoutSize;
  return (id)v4;
}

+ (void)_setInterfaceActionCanInvokeActionsWithoutPresentingController:(BOOL)a3
{
  __interfaceActionCanInvokeActionsWithoutPresentingController = a3;
}

+ (id)_observableDisplayProperties
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"titleAlignment", @"leadingImage", @"leadingImageLayoutSize", @"trailingImage", @"trailingImageLayoutSize", @"enabled", @"preferred", 0);
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_title] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"title"];
  }
}

- (void)setTitleAlignment:(int64_t)a3
{
  if (self->_titleAlignment != a3)
  {
    self->_titleAlignment = a3;
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"titleAlignment"];
  }
}

- (void)setLeadingImage:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_leadingImage] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingImage, a3);
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"leadingImage"];
  }
}

- (void)setTrailingImage:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_trailingImage] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_trailingImage, a3);
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"trailingImage"];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"enabled"];
  }
}

- (UIView)customContentView
{
  customContentView = self->_customContentView;
  if (customContentView)
  {
    v3 = customContentView;
  }
  else
  {
    uint64_t v4 = [(UIInterfaceAction *)self customContentViewController];
    v3 = [v4 view];
  }
  return v3;
}

- (void)_setIsPreferred:(BOOL)a3
{
  if (self->_preferred != a3)
  {
    self->_preferred = a3;
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"preferred"];
  }
}

- (void)_setIsFocused:(BOOL)a3
{
  if (self->_focused != a3)
  {
    self->_focused = a3;
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"focused"];
  }
}

- (void)_setTitleTextColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_titleTextColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"titleTextColor"];
  }
}

- (void)_setImageTintColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_imageTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_imageTintColor, a3);
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"imageTintColor"];
  }
}

- (CGSize)_layoutSizeForImageProperty:(id)a3
{
  uint64_t v4 = [a3 stringByAppendingString:@"LayoutSize"];
  id v5 = [(UIInterfaceAction *)self valueForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 CGSizeValue];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setLeadingImageLayoutSize:(CGSize)a3
{
  if (self->_leadingImageLayoutSize.width != a3.width || self->_leadingImageLayoutSize.height != a3.height)
  {
    self->_leadingImageLayoutSize = a3;
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"leadingImageLayoutSize"];
  }
}

- (CGSize)leadingImageLayoutSize
{
  double width = self->_leadingImageLayoutSize.width;
  double height = self->_leadingImageLayoutSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    [(UIImage *)self->_leadingImage size];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTrailingImageLayoutSize:(CGSize)a3
{
  if (self->_trailingImageLayoutSize.width != a3.width || self->_trailingImageLayoutSize.height != a3.height)
  {
    self->_trailingImageLayoutSize = a3;
    [(UIInterfaceAction *)self _notifyObserversDidChangeActionProperty:@"trailingImageLayoutSize"];
  }
}

- (CGSize)trailingImageLayoutSize
{
  double width = self->_trailingImageLayoutSize.width;
  double height = self->_trailingImageLayoutSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    [(UIImage *)self->_trailingImage size];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_invokeHandlerWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(UIInterfaceAction *)self _presentingController];
  if (v5)
  {
    id handler = self->_handler;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__UIInterfaceAction__invokeHandlerWithCompletionBlock___block_invoke;
    v9[3] = &unk_1E52DA040;
    id v10 = v4;
    [v5 interfaceAction:self invokeActionHandler:handler completion:v9];
  }
  else if (__interfaceActionCanInvokeActionsWithoutPresentingController)
  {
    double v7 = (void (**)(id, UIInterfaceAction *, unsigned char *))self->_handler;
    if (v7)
    {
      char v8 = 0;
      v7[2](v7, self, &v8);
    }
  }
}

uint64_t __55__UIInterfaceAction__invokeHandlerWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addActionDisplayPropertyObserver:(id)a3
{
  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  id v5 = a3;
  [(NSPointerArray *)weakDisplayPropertyObservers compact];
  [(NSPointerArray *)self->_weakDisplayPropertyObservers addPointer:v5];
}

- (void)_removeActionDisplayPropertyObserver:(id)a3
{
  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  id v5 = a3;
  [(NSPointerArray *)weakDisplayPropertyObservers compact];
  double v6 = [(NSPointerArray *)self->_weakDisplayPropertyObservers allObjects];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = self->_weakDisplayPropertyObservers;
    [(NSPointerArray *)v8 removePointerAtIndex:v7];
  }
}

- (void)_notifyObserversVisualStyleDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSPointerArray *)self->_weakDisplayPropertyObservers compact];
  id WeakRetained = objc_loadWeakRetained((id *)&self->__visualRepresentation);
  [WeakRetained interfaceAction:self reloadDisplayedContentVisualStyle:self->_visualStyle];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (void *)[(NSPointerArray *)self->_weakDisplayPropertyObservers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) interfaceAction:self reloadDisplayedContentVisualStyle:self->_visualStyle];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_notifyObserversDidChangeActionProperty:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSPointerArray *)self->_weakDisplayPropertyObservers compact];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->__visualRepresentation);
  [WeakRetained interfaceAction:self reloadDisplayedContentActionProperties:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)[(NSPointerArray *)self->_weakDisplayPropertyObservers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) interfaceAction:self reloadDisplayedContentActionProperties:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIViewController)customContentViewController
{
  return self->_customContentViewController;
}

- (void)setCustomContentViewController:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (NSString)classificationTitle
{
  return self->_classificationTitle;
}

- (void)setClassificationTitle:(id)a3
{
}

- (UIImage)leadingImage
{
  return self->_leadingImage;
}

- (UIImage)trailingImage
{
  return self->_trailingImage;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSPointerArray)weakDisplayPropertyObservers
{
  return self->_weakDisplayPropertyObservers;
}

- (UIInterfaceActionRepresentationView)_visualRepresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__visualRepresentation);
  return (UIInterfaceActionRepresentationView *)WeakRetained;
}

- (void)_setVisualRepresentation:(id)a3
{
}

- (_UIInterfaceActionPresenting)_presentingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__presentingController);
  return (_UIInterfaceActionPresenting *)WeakRetained;
}

- (void)_setPresentingController:(id)a3
{
}

- (BOOL)_isPreferred
{
  return self->_preferred;
}

- (BOOL)_isFocused
{
  return self->_focused;
}

- (UIInterfaceActionVisualStyle)_visualStyle
{
  return self->_visualStyle;
}

- (UIColor)_titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)_imageTintColor
{
  return self->_imageTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->__presentingController);
  objc_destroyWeak((id *)&self->__visualRepresentation);
  objc_storeStrong((id *)&self->_weakDisplayPropertyObservers, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_classificationTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customContentViewController, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
}

@end