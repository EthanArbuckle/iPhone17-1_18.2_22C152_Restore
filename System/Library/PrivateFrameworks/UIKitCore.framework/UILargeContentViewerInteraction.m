@interface UILargeContentViewerInteraction
+ (BOOL)isEnabled;
+ (void)initialize;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UIGestureRecognizer)gestureRecognizerForExclusionRelationship;
- (UILargeContentViewerInteraction)init;
- (UILargeContentViewerInteraction)initWithDelegate:(id)delegate;
- (UIView)view;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_itemAtPoint:(CGPoint)a3;
- (id)_viewControllerForAccessibilityHUDGestureManager:(id)a3;
- (id)delegate;
- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4;
- (void)didMoveToView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UILargeContentViewerInteraction

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

+ (BOOL)isEnabled
{
  return _MergedGlobals_1280;
}

- (UILargeContentViewerInteraction)init
{
  return [(UILargeContentViewerInteraction *)self initWithDelegate:0];
}

- (void)didMoveToView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    if (obj)
    {
      v5 = [[UIAccessibilityHUDGestureManager alloc] initWithView:obj delegate:self];
      [obj _setLargeContentViewerGestureManager:v5];
    }
  }
}

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)p_view);
    v7 = [v6 _largeContentViewerGestureManager];
    [v7 _invalidate];

    id v8 = objc_loadWeakRetained((id *)p_view);
    [v8 _setLargeContentViewerGestureManager:0];
  }
}

+ (void)initialize
{
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_592);
  }
}

- (UILargeContentViewerInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v8.receiver = self;
  v8.super_class = (Class)UILargeContentViewerInteraction;
  v5 = [(UILargeContentViewerInteraction *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

void __45__UILargeContentViewerInteraction_initialize__block_invoke()
{
  v0 = [(id)UIApp preferredContentSizeCategory];
  _MergedGlobals_1280 = UIContentSizeCategoryIsAccessibilityCategory(v0);

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v2 = [v4 addObserverForName:@"UIContentSizeCategoryDidChangeNotification" object:0 queue:v1 usingBlock:&__block_literal_global_93_3];
  v3 = (void *)qword_1EB2649D8;
  qword_1EB2649D8 = v2;
}

void __45__UILargeContentViewerInteraction_initialize__block_invoke_2()
{
  v0 = [(id)UIApp preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v0);

  if (_MergedGlobals_1280 != IsAccessibilityCategory)
  {
    _MergedGlobals_1280 = IsAccessibilityCategory;
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];
  }
}

- (UIGestureRecognizer)gestureRecognizerForExclusionRelationship
{
  id v2 = [(UILargeContentViewerInteraction *)self view];
  v3 = [v2 _largeContentViewerGestureManager];
  id v4 = [v3 _recognizer];

  return (UIGestureRecognizer *)v4;
}

- (id)_itemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(UILargeContentViewerInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    objc_super v8 = [(UILargeContentViewerInteraction *)self delegate];
    v9 = objc_msgSend(v8, "largeContentViewerInteraction:itemAtPoint:", self, x, y);

    if ([v9 showsLargeContentViewer]) {
      goto LABEL_6;
    }
    uint64_t v10 = 0;
  }
  else
  {
    v9 = [(UILargeContentViewerInteraction *)self view];
    uint64_t v10 = objc_msgSend(v9, "_largeContentViewerItemAtPoint:", x, y);
  }

  v9 = (void *)v10;
LABEL_6:
  return v9;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  id v4 = -[UILargeContentViewerInteraction _itemAtPoint:](self, "_itemAtPoint:", a3, a4.x, a4.y);
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 accessibilityHUDRepresentation];
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {
    v5 = 0;
  }
  if (v4)
  {
    id v6 = [UIAccessibilityHUDItem alloc];
    char v7 = [v4 largeContentTitle];
    objc_super v8 = [v4 largeContentImage];
    [v4 largeContentImageInsets];
    v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v6, "initWithTitle:image:imageInsets:scaleImage:", v7, v8, [v4 scalesLargeContentImage], v9, v10, v11, v12);
  }
LABEL_7:

  return v5;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  char v7 = -[UILargeContentViewerInteraction _itemAtPoint:](self, "_itemAtPoint:", x, y);
  objc_super v8 = [(UILargeContentViewerInteraction *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(UILargeContentViewerInteraction *)self delegate];
    objc_msgSend(v10, "largeContentViewerInteraction:didEndOnItem:atPoint:", self, v7, x, y);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v10 = v7;
    if ([v10 isEnabled])
    {
      double v11 = [v12 view];
      objc_msgSend(v10, "convertPoint:fromView:", v11, x, y);
      objc_msgSend(v10, "_activateForAccessibilityHUDLiftAtPoint:");
    }
  }

LABEL_7:
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (id)_viewControllerForAccessibilityHUDGestureManager:(id)a3
{
  v5 = [(UILargeContentViewerInteraction *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(UILargeContentViewerInteraction *)self delegate];
    objc_super v8 = [v7 viewControllerForLargeContentViewerInteraction:self];

    if (v8) {
      goto LABEL_5;
    }
    char v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    double v11 = NSStringFromSelector(a2);
    [v9 raise:v10, @"A non-nil view controller must be returned from %@", v11 format];
  }
  objc_super v8 = 0;
LABEL_5:
  return v8;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end