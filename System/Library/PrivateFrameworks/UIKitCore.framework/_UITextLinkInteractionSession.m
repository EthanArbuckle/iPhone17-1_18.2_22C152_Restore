@interface _UITextLinkInteractionSession
- (BOOL)_allowItemInteractions;
- (BOOL)canInteractWithLinkAtPoint:(CGPoint)a3;
- (BOOL)tapOnLinkWithGesture:(id)a3;
- (_UITextLinkInteractionSession)initWithTextItemInteraction:(id)a3;
- (void)dealloc;
@end

@implementation _UITextLinkInteractionSession

- (_UITextLinkInteractionSession)initWithTextItemInteraction:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextLinkInteractionSession;
  v5 = [(_UITextLinkInteractionSession *)&v8 init];
  if (v5)
  {
    v6 = [v4 view];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_storeWeak((id *)&v5->_interaction, v4);
      objc_storeWeak((id *)&v5->_linkInteractionView, v6);
    }
    else
    {

      v5 = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkInteractionView);
  [WeakRetained cancelInteractionWithLink];

  v4.receiver = self;
  v4.super_class = (Class)_UITextLinkInteractionSession;
  [(_UITextLinkInteractionSession *)&v4 dealloc];
}

- (BOOL)canInteractWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkInteractionView);
  char v6 = objc_msgSend(WeakRetained, "willInteractWithLinkAtPoint:", x, y);

  return v6;
}

- (BOOL)_allowItemInteractions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  char v3 = [WeakRetained _allowItemInteractions];

  return v3;
}

- (BOOL)tapOnLinkWithGesture:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkInteractionView);
  if (WeakRetained
    && [(_UITextLinkInteractionSession *)self _allowItemInteractions]
    && ([v4 view],
        char v6 = objc_claimAutoreleasedReturnValue(),
        [v4 location],
        objc_msgSend(v6, "convertPoint:toView:", WeakRetained),
        double v8 = v7,
        double v10 = v9,
        v6,
        objc_msgSend(WeakRetained, "willInteractWithLinkAtPoint:", v8, v10)))
  {
    [WeakRetained cancelInteractionWithLink];
    objc_msgSend(WeakRetained, "tapLinkAtPoint:", v8, v10);
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkInteractionView);
  objc_destroyWeak((id *)&self->_interaction);
}

@end