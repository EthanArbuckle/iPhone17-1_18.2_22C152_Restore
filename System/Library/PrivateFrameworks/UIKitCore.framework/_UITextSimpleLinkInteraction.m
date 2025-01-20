@interface _UITextSimpleLinkInteraction
- (BOOL)_allowItemInteractions;
- (BOOL)_beginInteractionSessionForLinkAtPoint:(CGPoint)a3 asTap:(BOOL)a4 precision:(unint64_t)a5;
- (BOOL)_canBeginInteractionSessionForLinkAtPoint:(CGPoint)a3 asTap:(BOOL)a4 precision:(unint64_t)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldProxyContextMenuDelegate;
- (_UITextSimpleLinkInteraction)initWithShouldProxyContextMenuDelegate:(BOOL)a3;
- (id)contextMenuDelegateProxy;
- (id)editMenuInteraction;
- (id)gesturesForFailureRequirements;
- (id)itemInteractableView;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_removeInteractableItemFromCache:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)highlight:(id)a3;
- (void)linkTapped:(id)a3;
@end

@implementation _UITextSimpleLinkInteraction

- (_UITextSimpleLinkInteraction)initWithShouldProxyContextMenuDelegate:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UITextSimpleLinkInteraction;
  v4 = [(UITextInteraction *)&v8 init];
  if (v4)
  {
    v5 = [[UITapGestureRecognizer alloc] initWithTarget:v4 action:sel_linkTapped_];
    linkTap = v4->_linkTap;
    v4->_linkTap = v5;

    [(UITapGestureRecognizer *)v4->_linkTap setNumberOfTouchesRequired:1];
    [(UITapGestureRecognizer *)v4->_linkTap setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v4->_linkTap setAllowableMovement:10.0];
    [(UIGestureRecognizer *)v4->_linkTap setDelaysTouchesEnded:0];
    [(UITextInteraction *)v4 addGestureRecognizer:v4->_linkTap withName:0x1ED174120];
    v4->_shouldProxyContextMenuDelegate = a3;
  }
  return v4;
}

- (BOOL)shouldProxyContextMenuDelegate
{
  return self->_shouldProxyContextMenuDelegate;
}

- (void)didMoveToView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextSimpleLinkInteraction;
  [(UITextInteraction *)&v4 didMoveToView:a3];
  self->_didCheckViewProtocolConformance = 0;
  self->_viewConformsToTextItemInteracting = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedItem, 0);
  objc_storeStrong((id *)&self->_highlighter, 0);
  objc_storeStrong((id *)&self->_linkTap, 0);
}

- (id)contextMenuDelegateProxy
{
  return 0;
}

- (id)editMenuInteraction
{
  return 0;
}

- (id)gesturesForFailureRequirements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_linkTap;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)itemInteractableView
{
  if (!self->_didCheckViewProtocolConformance)
  {
    v3 = [(UITextInteraction *)self view];
    if (objc_opt_respondsToSelector()) {
      char v4 = [v3 conformsToProtocol:&unk_1ED42F900];
    }
    else {
      char v4 = 0;
    }
    self->_viewConformsToTextItemInteracting = v4;
    self->_didCheckViewProtocolConformance = 1;
  }
  if (self->_viewConformsToTextItemInteracting)
  {
    v5 = [(UITextInteraction *)self view];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_removeInteractableItemFromCache:(id)a3
{
  id v4 = a3;
  id v6 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  v5 = [v6 _textInteractableItemCache];
  [v5 removeItem:v4];
}

- (void)linkTapped:(id)a3
{
  v10 = a3;
  if ([(_UITextSimpleLinkInteraction *)self _allowItemInteractions])
  {
    id v4 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
    if (v4)
    {
      [v10 locationInView:v4];
      if (v10) {
        uint64_t v5 = v10[23];
      }
      else {
        uint64_t v5 = 0;
      }
      id v6 = objc_msgSend(v4, "_textInteractableItemAtPoint:precision:", v5);
      v7 = [(UITextLinkInteraction *)self contextMenuInteraction];
      if (v7
        || ([(UITextInteraction *)self assistantDelegate],
            objc_super v8 = objc_claimAutoreleasedReturnValue(),
            [v8 contextMenuInteraction],
            v7 = objc_claimAutoreleasedReturnValue(),
            v8,
            v7))
      {
        [v6 setContextMenuInteraction:v7];
      }
      v9 = [(_UITextSimpleLinkInteraction *)self editMenuInteraction];
      if (v9) {
        [v6 setEditMenuInteraction:v9];
      }
      self->_presentingFromSimpleTap = 1;
      [v6 invokeDefaultAction];
      self->_presentingFromSimpleTap = 0;
      if (([v6 defaultActionPresentsMenu] & 1) == 0) {
        [(_UITextSimpleLinkInteraction *)self _removeInteractableItemFromCache:v6];
      }
    }
    else
    {
      id v6 = [(UITextInteraction *)self linkInteractionSession];
      [v6 tapOnLinkWithGesture:v10];
    }
  }
}

- (void)highlight:(id)a3
{
  id v4 = a3;
  if ([(_UITextSimpleLinkInteraction *)self _allowItemInteractions])
  {
    uint64_t v5 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
    [v4 locationInView:v5];
    if (v5)
    {
      if (v4) {
        uint64_t v6 = v4[23];
      }
      else {
        uint64_t v6 = 0;
      }
      v7 = objc_msgSend(v5, "_textInteractableItemAtPoint:precision:", v6);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __42___UITextSimpleLinkInteraction_highlight___block_invoke;
      aBlock[3] = &unk_1E52D9F98;
      id v8 = v7;
      id v26 = v8;
      v27 = self;
      v9 = (void (**)(void))_Block_copy(aBlock);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __42___UITextSimpleLinkInteraction_highlight___block_invoke_2;
      v23[3] = &unk_1E52D9F98;
      v23[4] = self;
      id v10 = v8;
      id v24 = v10;
      v11 = (void (**)(void))_Block_copy(v23);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __42___UITextSimpleLinkInteraction_highlight___block_invoke_3;
      v20 = &unk_1E52D9F98;
      id v21 = v10;
      v22 = self;
      id v12 = v10;
      v13 = _Block_copy(&v17);
      v14 = (void (**)(void))_Block_copy(v13);
    }
    else
    {
      v15 = [(UITextInteraction *)self linkInteractionSession];
      if (v15) {
        v13 = &__block_literal_global_344_1;
      }
      else {
        v13 = 0;
      }
      if (v15) {
        v14 = (void (**)(void))&__block_literal_global_346_1;
      }
      else {
        v14 = 0;
      }
      if (v15) {
        v11 = (void (**)(void))&__block_literal_global_342_0;
      }
      else {
        v11 = 0;
      }
      if (v15) {
        v9 = (void (**)(void))&__block_literal_global_558;
      }
      else {
        v9 = 0;
      }
    }
    switch(objc_msgSend(v4, "state", v17, v18, v19, v20))
    {
      case 1:
        v16 = v9;
        if (v9) {
          goto LABEL_21;
        }
        break;
      case 2:
        v16 = v11;
        if (v11) {
          goto LABEL_21;
        }
        break;
      case 3:
      case 4:
        v16 = v14;
        if (v14) {
          goto LABEL_21;
        }
        break;
      case 5:
        v16 = (void (**)(void))v13;
        if (v13) {
LABEL_21:
        }
          v16[2]();
        break;
      default:
        break;
    }
  }
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  v13.receiver = self;
  v13.super_class = (Class)_UITextSimpleLinkInteraction;
  if ([(UITextInteraction *)&v13 interaction_gestureRecognizerShouldBegin:v4]&& [(_UITextSimpleLinkInteraction *)self _allowItemInteractions])
  {
    uint64_t v5 = [(UIGestureRecognizer *)v4 view];
    [(UITapGestureRecognizer *)v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    if (v4) {
      unint64_t inputPrecision = v4->super._inputPrecision;
    }
    else {
      unint64_t inputPrecision = 0;
    }
    BOOL v11 = -[_UITextSimpleLinkInteraction _beginInteractionSessionForLinkAtPoint:asTap:precision:](self, "_beginInteractionSessionForLinkAtPoint:asTap:precision:", self->_linkTap == v4, inputPrecision, v7, v9);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UITapGestureRecognizer *)a3;
  double v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UITextSimpleLinkInteraction;
  if ([(UITextInteraction *)&v16 interaction_gestureRecognizer:v6 shouldReceiveTouch:v7]&& [(_UITextSimpleLinkInteraction *)self _allowItemInteractions])
  {
    double v8 = [(UIGestureRecognizer *)v6 view];
    [v7 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    if (v7) {
      uint64_t v13 = v7[6];
    }
    else {
      uint64_t v13 = 0;
    }
    BOOL v14 = -[_UITextSimpleLinkInteraction _canBeginInteractionSessionForLinkAtPoint:asTap:precision:](self, "_canBeginInteractionSessionForLinkAtPoint:asTap:precision:", self->_linkTap == v6, v13, v10, v12);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (self->_linkTap == a3)
  {
    double v9 = [v6 name];
    if ([v9 isEqualToString:0x1ED1740E0])
    {
      char v8 = 1;
    }
    else
    {
      double v10 = [v7 name];
      char v8 = [v10 isEqualToString:0x1ED174100];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  char v8 = (UITapGestureRecognizer *)a3;
  id v4 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  if (self->_linkTap == v8 && v4 != 0)
  {
    [(UITapGestureRecognizer *)v8 locationInView:v4];
    if (v8) {
      unint64_t inputPrecision = v8->super._inputPrecision;
    }
    else {
      unint64_t inputPrecision = 0;
    }
    double v7 = objc_msgSend(v4, "_textInteractableItemAtPoint:precision:", inputPrecision);
    [(_UITextSimpleLinkInteraction *)self _removeInteractableItemFromCache:v7];
  }
}

- (BOOL)_canBeginInteractionSessionForLinkAtPoint:(CGPoint)a3 asTap:(BOOL)a4 precision:(unint64_t)a5
{
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  double v10 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  double v11 = v10;
  if (v10)
  {
    double v12 = objc_msgSend(v10, "_textInteractableItemAtPoint:precision:", a5, x, y);
    uint64_t v13 = v12;
    int v14 = v12 != 0;
    if (v12 && v6) {
      int v14 = [v12 canInvokeDefaultAction];
    }
    if (v13 && (v14 & 1) == 0) {
      [(_UITextSimpleLinkInteraction *)self _removeInteractableItemFromCache:v13];
    }
  }
  else
  {
    int v14 = 0;
  }
  v15 = [(UITextInteraction *)self view];
  if (objc_opt_respondsToSelector()) {
    v14 |= objc_msgSend(v15, "willInteractWithLinkAtPoint:", x, y);
  }

  return v14;
}

- (BOOL)_beginInteractionSessionForLinkAtPoint:(CGPoint)a3 asTap:(BOOL)a4 precision:(unint64_t)a5
{
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  double v10 = [[_UITextLinkInteractionSession alloc] initWithTextItemInteraction:self];
  double v11 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  double v12 = v11;
  if (v11)
  {
    uint64_t v13 = objc_msgSend(v11, "_textInteractableItemAtPoint:precision:", a5, x, y);
    int v14 = v13;
    char v15 = v13 != 0;
    if (v13 && v6) {
      char v15 = [v13 canInvokeDefaultAction];
    }
  }
  else
  {
    if (!v10 || !-[_UITextLinkInteractionSession canInteractWithLinkAtPoint:](v10, "canInteractWithLinkAtPoint:", x, y))
    {
      char v15 = 0;
      goto LABEL_10;
    }
    [(UITextInteraction *)self cancelLinkInteractionSession];
    int v14 = [(UITextInteraction *)self root];
    [v14 _setLinkInteractionSession:v10];
    char v15 = 1;
  }

LABEL_10:
  return v15;
}

- (BOOL)_allowItemInteractions
{
  v3 = [(UITextInteraction *)self view];
  BOOL v4 = +[UITextItemInteractionInteraction mightResponderHaveTextItemInteractions:v3];

  if (!v4)
  {
    BOOL v6 = [(UITextInteraction *)self assistantDelegate];
    double v7 = [v6 activeSelection];

    uint64_t v8 = [v7 selectedRange];
    if (v8)
    {
      double v9 = (void *)v8;
      double v10 = [v7 selectedRange];
      if ([v10 _isCaret])
      {
        double v11 = [(UITextInteraction *)self assistantDelegate];
        double v12 = [v11 _editMenuAssistant];
        int v13 = [v12 _editMenuIsVisible];

        if (!v13) {
          goto LABEL_6;
        }
      }
      else
      {
      }
      v15.receiver = self;
      v15.super_class = (Class)_UITextSimpleLinkInteraction;
      BOOL v5 = [(UITextItemInteractionInteraction *)&v15 _allowItemInteractions];
      goto LABEL_9;
    }
LABEL_6:
    BOOL v5 = 1;
LABEL_9:

    return v5;
  }
  return 1;
}

@end