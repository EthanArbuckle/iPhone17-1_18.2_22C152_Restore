@interface _UITextInteractableItem
+ (id)customItemWithTag:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6;
+ (id)itemForAttachment:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6;
+ (id)itemForLink:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6;
- (BOOL)_actionPresentsMenu:(id)a3;
- (BOOL)_allowHighlight;
- (BOOL)_allowInteraction:(int64_t)a3;
- (BOOL)_showsPreviewByDefault;
- (BOOL)canInvokeDefaultAction;
- (BOOL)defaultActionPresentsMenu;
- (BOOL)hasPrimaryAction;
- (BOOL)isAttachmentItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLinkItem;
- (BOOL)isTagItem;
- (BOOL)showsMenuPreview;
- (CGPoint)location;
- (CGRect)bounds;
- (NSArray)rects;
- (UIAction)defaultAction;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIEditMenuInteraction)editMenuInteraction;
- (UINotificationFeedbackGenerator)feedbackGenerator;
- (UITextItem)representedTextItem;
- (UITextItemMenuConfiguration)preparedMenuConfiguration;
- (UITextRange)range;
- (_UITextContent)textContent;
- (_UITextInteractableItem)initWithRange:(id)a3 view:(id)a4 location:(CGPoint)a5;
- (_UITextItemHighlightView)highlightView;
- (_UITextItemInteracting)textItemInteractingView;
- (_UITextItemInteractionHandler)itemHandler;
- (id)_itemRepresentationWithRange:(_NSRange)a3;
- (id)_solverWithUnifyRects:(BOOL)a3;
- (id)contextMenuConfiguration;
- (id)itemRepresentationWithRange:(_NSRange)a3;
- (id)preparedPrimaryActionWithDefaultAction:(id)a3;
- (int64_t)preferredMenuExpression;
- (unint64_t)preferredElementDisplayMode;
- (void)_defaultAction;
- (void)_warnForInvalidAction;
- (void)dealloc;
- (void)highlight;
- (void)invokeDefaultAction;
- (void)prepareMenuConfigurationWithDefaultMenu:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setEditMenuInteraction:(id)a3;
- (void)setItemHandler:(id)a3;
- (void)setTextContent:(id)a3;
- (void)unhighlight;
@end

@implementation _UITextInteractableItem

- (CGRect)bounds
{
  v2 = [(_UITextInteractableItem *)self _solverWithUnifyRects:1];
  [v2 boundingRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSArray)rects
{
  v2 = [(_UITextInteractableItem *)self _solverWithUnifyRects:0];
  double v3 = [v2 rects];

  return (NSArray *)v3;
}

- (_UITextInteractableItem)initWithRange:(id)a3 view:(id)a4 location:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UITextInteractableItem;
  double v12 = [(_UITextInteractableItem *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_range, a3);
    objc_storeWeak((id *)&v13->_textItemInteractingView, v11);
    v13->_location.CGFloat x = x;
    v13->_location.CGFloat y = y;
  }

  return v13;
}

+ (id)itemForLink:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [v12 _textInteractableItemCache];
  double v14 = [v13 itemForLink:v10 range:v11];

  if (!v14)
  {
    double v14 = -[_UITextInteractableItem initWithRange:view:location:]([_UITextInteractableLinkItem alloc], "initWithRange:view:location:", v11, v12, x, y);
    [(_UITextInteractableLinkItem *)v14 setLink:v10];
    objc_super v15 = +[_UITextLinkInteractionHandler handlerForItem:v14 textContentView:v12];
    [(_UITextInteractableItem *)v14 setItemHandler:v15];
  }
  return v14;
}

+ (id)itemForAttachment:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [v12 _textInteractableItemCache];
  double v14 = [v13 itemForAttachment:v10 range:v11];

  if (!v14)
  {
    double v14 = -[_UITextInteractableItem initWithRange:view:location:]([_UITextInteractableAttachmentItem alloc], "initWithRange:view:location:", v11, v12, x, y);
    [(_UITextInteractableAttachmentItem *)v14 setAttachment:v10];
    objc_super v15 = [[_UITextAttachmentInteractionHandler alloc] initWithAttachmentItem:v14 textContentView:v12];
    [(_UITextInteractableItem *)v14 setItemHandler:v15];
  }
  return v14;
}

+ (id)customItemWithTag:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [v12 _textInteractableItemCache];
  double v14 = [v13 itemForTag:v10 range:v11];

  if (!v14)
  {
    double v14 = -[_UITextInteractableItem initWithRange:view:location:]([_UITextInteractableTagItem alloc], "initWithRange:view:location:", v11, v12, x, y);
    [(_UITextInteractableTagItem *)v14 setTag:v10];
    objc_super v15 = [[_UITextItemInteractionHandler alloc] initWithItem:v14 textContentView:v12];
    [(_UITextInteractableItem *)v14 setItemHandler:v15];
  }
  return v14;
}

- (BOOL)isLinkItem
{
  return 0;
}

- (BOOL)isAttachmentItem
{
  return 0;
}

- (BOOL)isTagItem
{
  return 0;
}

- (id)itemRepresentationWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  representedTextItem = self->_representedTextItem;
  if (!representedTextItem
    || ([(UITextItem *)representedTextItem range] == a3.location ? (BOOL v8 = v7 == length) : (BOOL v8 = 0), !v8))
  {
    -[_UITextInteractableItem _itemRepresentationWithRange:](self, "_itemRepresentationWithRange:", location, length);
    double v9 = (UITextItem *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_representedTextItem;
    self->_representedTextItem = v9;
  }
  id v11 = self->_representedTextItem;
  return v11;
}

- (id)_itemRepresentationWithRange:(_NSRange)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.location, a3.length);
  [v5 handleFailureInMethod:a2 object:self file:@"_UITextInteractableItem.m" lineNumber:183 description:@"itemRepresentation needs to be implemented by the subclass"];

  return 0;
}

- (id)preparedPrimaryActionWithDefaultAction:(id)a3
{
  double v4 = (UIAction *)a3;
  double v5 = +[UIAction textInteractableItemDefaultAction];
  if ((*(unsigned char *)&self->_requested & 1) == 0)
  {
    *(unsigned char *)&self->_requested |= 1u;
    double v6 = [(_UITextInteractableItem *)self textItemInteractingView];
    uint64_t v7 = [v6 _textInteractableItemCache];
    [v7 addItem:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_textItemInteractingView);
    double v9 = [WeakRetained _primaryActionForTextInteractableItem:self defaultAction:v5];

    char v10 = [v9 isEqual:v5];
    id v11 = v5;
    if ((v10 & 1) != 0 || (id v11 = v9) != 0)
    {
      id v12 = v11;
      primaryAction = self->_primaryAction;
      self->_primaryAction = v12;
    }
  }
  BOOL v14 = [(UIAction *)self->_primaryAction isEqual:v5];
  objc_super v15 = v4;
  if (!v14) {
    objc_super v15 = self->_primaryAction;
  }
  v16 = v15;

  return v16;
}

- (void)prepareMenuConfigurationWithDefaultMenu:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_requested & 2) == 0)
  {
    *(unsigned char *)&self->_requested |= 2u;
    if (!v4)
    {
      id v4 = +[UIMenu menuWithChildren:MEMORY[0x1E4F1CBF0]];
    }
    id v8 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textItemInteractingView);
    double v6 = [WeakRetained _menuConfigurationForTextInteractableItem:self defaultMenu:v8];

    preparedMenuConfiguration = self->_preparedMenuConfiguration;
    self->_preparedMenuConfiguration = v6;

    id v4 = v8;
  }
}

- (BOOL)showsMenuPreview
{
  double v3 = [(_UITextInteractableItem *)self preparedMenuConfiguration];
  id v4 = [v3 preview];

  if (v4)
  {
    double v5 = [v4 _previewView];
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = [(_UITextInteractableItem *)self _showsPreviewByDefault];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_showsPreviewByDefault
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UITextInteractableItem *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if ([(_UITextInteractableItem *)v4 isMemberOfClass:objc_opt_class()])
    {
      double v5 = [(_UITextInteractableItem *)v4 textItemInteractingView];
      BOOL v6 = [(_UITextInteractableItem *)self textItemInteractingView];
      id v7 = v5;
      id v8 = v6;
      double v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        LOBYTE(v10) = 0;
        id v11 = v8;
        id v12 = v7;
        if (!v7 || !v8)
        {
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        int v10 = [v7 isEqual:v8];

        if (!v10) {
          goto LABEL_18;
        }
      }
      double v13 = [(_UITextInteractableItem *)v4 range];
      BOOL v14 = [(_UITextInteractableItem *)self range];
      id v12 = v13;
      id v15 = v14;
      id v11 = v15;
      if (v12 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v12 && v15) {
          LOBYTE(v10) = [v12 isEqual:v15];
        }
      }

      goto LABEL_17;
    }
    LOBYTE(v10) = 0;
  }
LABEL_19:

  return v10;
}

- (int64_t)preferredMenuExpression
{
  return [(UITextItemMenuConfiguration *)self->_preparedMenuConfiguration _preferredExpression];
}

- (unint64_t)preferredElementDisplayMode
{
  return [(UITextItemMenuConfiguration *)self->_preparedMenuConfiguration _preferredElementDisplayMode];
}

- (id)contextMenuConfiguration
{
  double v3 = [(_UITextInteractableItem *)self itemHandler];
  id v4 = [v3 contextMenuConfiguration];

  if (!v4) {
    [(_UITextInteractableItem *)self _warnForInvalidAction];
  }
  return v4;
}

- (void)_warnForInvalidAction
{
  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    id v4 = objc_alloc_init(UINotificationFeedbackGenerator);
    double v5 = self->_feedbackGenerator;
    self->_feedbackGenerator = v4;

    feedbackGenerator = self->_feedbackGenerator;
  }
  [(UINotificationFeedbackGenerator *)feedbackGenerator notificationOccurred:1];
}

- (void)_defaultAction
{
  if (a1)
  {
    v2 = a1;
    double v3 = (void *)a1[13];
    if (!v3)
    {
      id v4 = [a1 itemHandler];
      uint64_t v5 = [v4 primaryAction];
      BOOL v6 = (void *)v2[13];
      v2[13] = v5;

      double v3 = (void *)v2[13];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)canInvokeDefaultAction
{
  double v3 = [(_UITextInteractableItem *)self textItemInteractingView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(_UITextInteractableItem *)self textItemInteractingView];
    char v6 = [v5 _delegatesAllowingTextItemInteractions];

    if (v6) {
      return 1;
    }
  }
  id v8 = -[_UITextInteractableItem _defaultAction](self);
  BOOL v7 = v8 != 0;

  return v7;
}

- (void)invokeDefaultAction
{
  double v3 = -[_UITextInteractableItem _defaultAction](self);
  if ([(_UITextInteractableItem *)self _allowInteraction:0] && v3)
  {
    if ([(_UITextInteractableItem *)self _allowHighlight]
      && ![(_UITextInteractableItem *)self _actionPresentsMenu:v3])
    {
      [(_UITextInteractableItem *)self highlight];
      [v3 performWithSender:0 target:0];
      dispatch_time_t v4 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46___UITextInteractableItem_invokeDefaultAction__block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x1E4F14428], block);
    }
    else
    {
      [v3 performWithSender:0 target:0];
    }
  }
}

- (BOOL)hasPrimaryAction
{
  double v3 = -[_UITextInteractableItem _defaultAction](self);
  if (v3) {
    BOOL v4 = ![(_UITextInteractableItem *)self _actionPresentsMenu:v3];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)defaultActionPresentsMenu
{
  double v3 = -[_UITextInteractableItem _defaultAction](self);
  if (v3) {
    BOOL v4 = [(_UITextInteractableItem *)self _actionPresentsMenu:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_actionPresentsMenu:(id)a3
{
  double v3 = [a3 identifier];
  char v4 = [v3 isEqualToString:0x1ED0EB960];

  return v4;
}

- (BOOL)_allowInteraction:(int64_t)a3
{
  if (a3)
  {
    uint64_t v5 = [(_UITextInteractableItem *)self textItemInteractingView];
    int v6 = [v5 _allowsLinkPreviewInteractionInViewServices];

    if (!v6) {
      return 0;
    }
  }
  BOOL v7 = [(_UITextInteractableItem *)self textItemInteractingView];
  char v8 = [v7 _allowInteraction:a3 forTextInteractableItem:self];

  return v8;
}

- (void)dealloc
{
  [(_UITextInteractableItem *)self unhighlight];
  v3.receiver = self;
  v3.super_class = (Class)_UITextInteractableItem;
  [(_UITextInteractableItem *)&v3 dealloc];
}

- (BOOL)_allowHighlight
{
  objc_super v3 = [(_UITextInteractableItem *)self textItemInteractingView];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 _allowHighlightForTextInteractableItem:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)highlight
{
  objc_super v3 = [(_UITextInteractableItem *)self textItemInteractingView];
  if (v3)
  {
    id v12 = v3;
    char v4 = self->_highlightView;
    if (!self->_highlightView)
    {
      uint64_t v5 = [_UITextItemHighlightView alloc];
      int v6 = -[_UITextItemHighlightView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

      [(_UITextItemHighlightView *)v6 setCornerRadius:5.0];
      [(_UITextItemHighlightView *)v6 setHorizontalPadding:4.0];
      BOOL v7 = [v12 textInputView];
      [v7 addSubview:v6];

      objc_storeStrong((id *)&self->_highlightView, v6);
      char v4 = v6;
    }
    char v8 = [(_UITextInteractableItem *)self rects];
    [(_UITextItemHighlightView *)v4 setTextLineRects:v8];

    [(UIView *)v4 setNeedsDisplay];
    if (objc_opt_respondsToSelector())
    {
      double v9 = [v12 _selectionDisplayInteraction];
      [(_UIInvalidatable *)self->_selectionHiddenAssertion _invalidate];
      int v10 = [v9 _obtainSelectionUIHiddenAssertionForReason:@"Link Interaction" animated:0];
      selectionHiddenAssertion = self->_selectionHiddenAssertion;
      self->_selectionHiddenAssertion = v10;
    }
    objc_super v3 = v12;
  }
}

- (void)unhighlight
{
  highlightView = self->_highlightView;
  if (highlightView)
  {
    [(UIView *)highlightView removeFromSuperview];
    char v4 = self->_highlightView;
    self->_highlightView = 0;

    [(_UIInvalidatable *)self->_selectionHiddenAssertion _invalidate];
    selectionHiddenAssertion = self->_selectionHiddenAssertion;
    self->_selectionHiddenAssertion = 0;
  }
}

- (id)_solverWithUnifyRects:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UITextInteractableItem *)self textItemInteractingView];
  int v6 = [v5 textContainer];

  BOOL v7 = [_UIBoundingTextRectsSolver alloc];
  char v8 = [(_UITextInteractableItem *)self range];
  double v9 = [(_UIBoundingTextRectsSolver *)v7 initWithTextContainer:v6 range:v8 unifyRects:v3];

  return v9;
}

- (UITextRange)range
{
  return self->_range;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UITextItem)representedTextItem
{
  return self->_representedTextItem;
}

- (_UITextItemInteractionHandler)itemHandler
{
  return self->_itemHandler;
}

- (void)setItemHandler:(id)a3
{
}

- (_UITextItemInteracting)textItemInteractingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textItemInteractingView);
  return (_UITextItemInteracting *)WeakRetained;
}

- (UITextItemMenuConfiguration)preparedMenuConfiguration
{
  return self->_preparedMenuConfiguration;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextMenuInteraction);
  return (UIContextMenuInteraction *)WeakRetained;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (UIEditMenuInteraction)editMenuInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editMenuInteraction);
  return (UIEditMenuInteraction *)WeakRetained;
}

- (void)setEditMenuInteraction:(id)a3
{
}

- (_UITextContent)textContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContent);
  return (_UITextContent *)WeakRetained;
}

- (void)setTextContent:(id)a3
{
}

- (_UITextItemHighlightView)highlightView
{
  return self->_highlightView;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (UINotificationFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_destroyWeak((id *)&self->_textContent);
  objc_destroyWeak((id *)&self->_editMenuInteraction);
  objc_destroyWeak((id *)&self->_contextMenuInteraction);
  objc_storeStrong((id *)&self->_preparedMenuConfiguration, 0);
  objc_destroyWeak((id *)&self->_textItemInteractingView);
  objc_storeStrong((id *)&self->_itemHandler, 0);
  objc_storeStrong((id *)&self->_representedTextItem, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_selectionHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
}

@end