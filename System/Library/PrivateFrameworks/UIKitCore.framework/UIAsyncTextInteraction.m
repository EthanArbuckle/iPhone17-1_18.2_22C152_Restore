@interface UIAsyncTextInteraction
- (UIAsyncTextInteractionDelegate)delegate;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIContextMenuInteractionDelegate)contextMenuInteractionDelegate;
- (UITextSelectionDisplayInteraction)textSelectionDisplayInteraction;
- (UIView)view;
- (id)asyncTextInput;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)dismissEditMenuForSelection;
- (void)editabilityChanged;
- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5;
- (void)presentEditMenuForSelection;
- (void)scheduleChineseTransliterationForText:(id)a3;
- (void)scheduleReplacementsForText:(id)a3;
- (void)selectionChanged;
- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(int64_t)a6;
- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(int64_t)a5;
- (void)selectionDidChange:(id)a3;
- (void)selectionWillChange:(id)a3;
- (void)setContextMenuInteractionDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showDictionaryFor:(id)a3 fromRect:(CGRect)a4;
- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4;
- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4;
- (void)translate:(id)a3 fromRect:(CGRect)a4;
- (void)willMoveToView:(id)a3;
@end

@implementation UIAsyncTextInteraction

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_view);
    objc_setAssociatedObject(v5, &_UITextInputImplicitInteractionAssistantKey, 0, (void *)0x301);
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)didMoveToView:(id)a3
{
  id object = a3;
  if (object)
  {
    v4 = [[UIWKTextInteractionAssistant alloc] initWithView:object];
    textInteractionAssistant = self->_textInteractionAssistant;
    self->_textInteractionAssistant = v4;

    [(UIWKTextInteractionAssistant *)self->_textInteractionAssistant setDelegate:self];
    objc_setAssociatedObject(object, &_UITextInputImplicitInteractionAssistantKey, self->_textInteractionAssistant, (void *)0x301);
  }
  objc_storeWeak((id *)&self->_view, object);
}

- (void)setContextMenuInteractionDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  v3 = [(UIWKTextInteractionAssistant *)self->_textInteractionAssistant delegate];

  if (v3 == self) {
    [(UIWKTextInteractionAssistant *)self->_textInteractionAssistant setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)UIAsyncTextInteraction;
  [(UIAsyncTextInteraction *)&v4 dealloc];
}

- (id)asyncTextInput
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v4 = [WeakRetained conformsToProtocol:&unk_1ED700940];

  if (v4) {
    id v5 = objc_loadWeakRetained((id *)p_view);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(int64_t)a6
{
}

- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(int64_t)a5
{
}

- (void)showDictionaryFor:(id)a3 fromRect:(CGRect)a4
{
}

- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4
{
}

- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4
{
}

- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5
{
}

- (void)translate:(id)a3 fromRect:(CGRect)a4
{
}

- (void)scheduleReplacementsForText:(id)a3
{
}

- (void)scheduleChineseTransliterationForText:(id)a3
{
}

- (void)presentEditMenuForSelection
{
}

- (void)dismissEditMenuForSelection
{
}

- (UITextSelectionDisplayInteraction)textSelectionDisplayInteraction
{
  return [(UITextInteractionAssistant *)self->_textInteractionAssistant _selectionViewManager];
}

- (void)selectionChanged
{
}

- (void)editabilityChanged
{
}

- (UIContextMenuInteractionDelegate)contextMenuInteractionDelegate
{
  return [(UITextInteractionAssistant *)self->_textInteractionAssistant externalContextMenuInteractionDelegate];
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return [(UITextInteractionAssistant *)self->_textInteractionAssistant contextMenuInteraction];
}

- (void)selectionWillChange:(id)a3
{
  int v4 = [(UIAsyncTextInteraction *)self delegate];

  if (v4)
  {
    id v5 = [(UIAsyncTextInteraction *)self delegate];
    [v5 selectionWillChange:self];
  }
  id v7 = [(UIAsyncTextInteraction *)self asyncTextInput];
  v6 = [v7 asyncSystemInputDelegate];
  [v6 selectionWillChange:v7];
}

- (void)selectionDidChange:(id)a3
{
  id v7 = [(UIAsyncTextInteraction *)self asyncTextInput];
  int v4 = [v7 asyncSystemInputDelegate];
  [v4 selectionDidChange:v7];

  id v5 = [(UIAsyncTextInteraction *)self delegate];

  if (v5)
  {
    v6 = [(UIAsyncTextInteraction *)self delegate];
    [v6 selectionDidChange:self];
  }
}

- (UIAsyncTextInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIAsyncTextInteractionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_textInteractionAssistant, 0);
}

@end