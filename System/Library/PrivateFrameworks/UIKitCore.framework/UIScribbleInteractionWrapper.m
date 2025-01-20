@interface UIScribbleInteractionWrapper
- (BOOL)beginSuppressingPlaceholderForElement:(id)a3;
- (BOOL)focusWillTransformElement:(id)a3;
- (BOOL)isElement:(id)a3 inFrontOf:(id)a4;
- (BOOL)isElementContainer;
- (BOOL)isElementFocused:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeginAtLocation:(CGPoint)a3;
- (BOOL)shouldDisableInputAssistant;
- (BOOL)supportsIsElementFocused;
- (BOOL)supportsIsElementInFrontOfElement;
- (BOOL)supportsShouldBegin;
- (CGRect)frameForElement:(id)a3;
- (NSString)description;
- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3 element:(id)a4;
- (UIInteraction)interaction;
- (UIScribbleInteractionWrapper)initWithCustomScribbleInteraction:(id)a3 indirectScribbleInteraction:(id)a4;
- (UIView)view;
- (id)suggestedStrokeColorForElement:(id)a3;
- (void)didFinishWritingInElement:(id)a3;
- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5;
- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4;
- (void)willBeginWritingInElement:(id)a3;
@end

@implementation UIScribbleInteractionWrapper

- (UIScribbleInteractionWrapper)initWithCustomScribbleInteraction:(id)a3 indirectScribbleInteraction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIScribbleInteractionWrapper;
  v8 = [(UIScribbleInteractionWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scribbleInteraction, v6);
    objc_storeWeak((id *)&v9->_indirectInteraction, v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    id v7 = objc_loadWeakRetained(v5 + 1);
    if (WeakRetained == v7)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
      id v10 = objc_loadWeakRetained(v5 + 2);
      BOOL v8 = v9 == v10;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)UIScribbleInteractionWrapper;
  v3 = [(UIScribbleInteractionWrapper *)&v8 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  id v5 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  id v6 = [v3 stringByAppendingFormat:@" %@, %@", WeakRetained, v5];

  return (NSString *)v6;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  id v4 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  id v5 = v4;
  if (WeakRetained) {
    id v4 = WeakRetained;
  }
  id v6 = [v4 view];

  return (UIView *)v6;
}

- (UIInteraction)interaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  id v4 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  id v5 = v4;
  if (WeakRetained) {
    id v4 = WeakRetained;
  }
  id v6 = (UIInteraction *)v4;

  return v6;
}

- (BOOL)supportsShouldBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (CGRect)frameForElement:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DB20];
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  id v10 = [WeakRetained delegate];
  objc_super v11 = v10;
  if (v4 && WeakRetained)
  {
    [v10 indirectScribbleInteraction:WeakRetained frameForElement:v4];
    double v5 = v12;
    double v6 = v13;
    double v7 = v14;
    double v8 = v15;
  }

  double v16 = v5;
  double v17 = v6;
  double v18 = v7;
  double v19 = v8;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)beginSuppressingPlaceholderForElement:(id)a3
{
  return 0;
}

- (BOOL)focusWillTransformElement:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    double v6 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      char v7 = [v6 scribbleInteractionShouldDelayFocus:WeakRetained];
      goto LABEL_6;
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  double v6 = [WeakRetained delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  char v7 = [v6 indirectScribbleInteraction:WeakRetained shouldDelayFocusForElement:v4];
LABEL_6:
  BOOL v8 = v7;
LABEL_8:

  return v8;
}

- (BOOL)shouldBeginAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  double v6 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend(v6, "scribbleInteraction:shouldBeginAtLocation:", WeakRetained, x, y);
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)willBeginWritingInElement:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
    objc_msgSend(WeakRetained, "_setHandlingWritingCount:", objc_msgSend(WeakRetained, "_handlingWritingCount") + 1);
    double v5 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 indirectScribbleInteraction:WeakRetained willBeginWritingInElement:v8];
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    [WeakRetained _setHandlingWriting:1];
    double v5 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 scribbleInteractionWillBeginWriting:WeakRetained];
    }
  }

  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  char v7 = [(UIScribbleInteractionWrapper *)self view];
  [v6 postNotificationName:@"_UIScribbleWillBeginWriting" object:v7];
}

- (void)didFinishWritingInElement:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
    objc_msgSend(WeakRetained, "_setHandlingWritingCount:", objc_msgSend(WeakRetained, "_handlingWritingCount") - 1);
    double v5 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 indirectScribbleInteraction:WeakRetained didFinishWritingInElement:v6];
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    [WeakRetained _setHandlingWriting:0];
    double v5 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 scribbleInteractionDidFinishWriting:WeakRetained];
    }
  }
}

- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  objc_super v11 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke;
    v12[3] = &unk_1E52E3E60;
    id v13 = v9;
    objc_msgSend(v11, "indirectScribbleInteraction:requestElementsInRect:completion:", WeakRetained, v12, x, y, width, height);
  }
  else if (v9)
  {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], 0x7FFFFFFFFFFFFFFFLL);
  }
}

void __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2;
  v6[3] = &unk_1E52DB330;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0x7FFFFFFFFFFFFFFFLL);
}

- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  double v12 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__UIScribbleInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
    v13[3] = &unk_1E5300530;
    id v14 = v10;
    objc_msgSend(v12, "indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:", WeakRetained, v9, v13, x, y);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __92__UIScribbleInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3 element:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  id v11 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  double v12 = v11;
  if (v9 && v11)
  {
    id v13 = [v11 delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v13, "_indirectScribbleInteraction:hitToleranceInsetsForElement:defaultInsets:", v12, v9, top, left, bottom, right);
LABEL_8:
      double top = v14;
      double left = v15;
      double bottom = v16;
      double right = v17;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    id v13 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v13, "_scribbleInteraction:hitToleranceInsetsWithDefaultInsets:", WeakRetained, top, left, bottom, right);
      goto LABEL_8;
    }
LABEL_9:
  }
  double v18 = top;
  double v19 = left;
  double v20 = bottom;
  double v21 = right;
  result.double right = v21;
  result.double bottom = v20;
  result.double left = v19;
  result.double top = v18;
  return result;
}

- (BOOL)isElementContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)supportsIsElementInFrontOfElement
{
  return 0;
}

- (BOOL)isElement:(id)a3 inFrontOf:(id)a4
{
  return 0;
}

- (id)suggestedStrokeColorForElement:(id)a3
{
  return 0;
}

- (BOOL)supportsIsElementFocused
{
  return 1;
}

- (BOOL)isElementFocused:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  id v6 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 indirectScribbleInteraction:WeakRetained isElementFocused:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldDisableInputAssistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  id v4 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  if (WeakRetained)
  {
    id v5 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      char v6 = [v5 _scribbleInteractionShouldDisableInputAssistant:WeakRetained];
    }
    else {
      char v6 = 0;
    }

    if (v6) {
      goto LABEL_12;
    }
  }
  else
  {
    char v6 = 0;
  }
  if (v4)
  {
    char v7 = [v4 delegate];
    if (objc_opt_respondsToSelector()) {
      char v6 = [v7 _indirectScribbleInteractionShouldDisableInputAssistant:v4];
    }
    else {
      char v6 = 0;
    }
  }
LABEL_12:

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_indirectInteraction);
  objc_destroyWeak((id *)&self->_scribbleInteraction);
}

@end