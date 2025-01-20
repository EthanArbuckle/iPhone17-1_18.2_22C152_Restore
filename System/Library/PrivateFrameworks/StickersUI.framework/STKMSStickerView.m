@interface STKMSStickerView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (STKMSStickerView)init;
- (STKMSStickerViewDelegate)delegate;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (void)_prepareForReuse;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startAnimatingWithOffset:(double)a3;
@end

@implementation STKMSStickerView

- (STKMSStickerView)init
{
  v8.receiver = self;
  v8.super_class = (Class)STKMSStickerView;
  v2 = [(STKMSStickerView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(STKMSStickerView *)v2 setClipsToBounds:0];
    v4 = [(STKMSStickerView *)v3 layer];
    [v4 setMasksToBounds:0];

    uint64_t v5 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:v3 action:sel_handleLongPress_];
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v5;

    [(UILongPressGestureRecognizer *)v3->_longPressGestureRecognizer setDelegate:v3];
    [(STKMSStickerView *)v3 addGestureRecognizer:v3->_longPressGestureRecognizer];
  }
  return v3;
}

- (void)startAnimatingWithOffset:(double)a3
{
  if (objc_opt_respondsToSelector()) {
    [(MSStickerView *)self setAnimationOffset:a3];
  }

  [(MSStickerView *)self startAnimating];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(STKMSStickerView *)self delegate];
  [v8 handleWillDrag:self];

  v11.receiver = self;
  v11.super_class = (Class)STKMSStickerView;
  v9 = [(MSStickerView *)&v11 dragInteraction:v7 itemsForBeginningSession:v6];

  return v9;
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STKMSStickerView *)self delegate];

  if (v5)
  {
    id v6 = [(STKMSStickerView *)self delegate];
    int v7 = [v6 canHandleTap];

    if (v7)
    {
      objc_super v8 = [(STKMSStickerView *)self delegate];
      [v8 handleWillTap:self];

      v11.receiver = self;
      v11.super_class = (Class)STKMSStickerView;
      [(MSStickerView *)&v11 handleTap:v4];
      v9 = [(STKMSStickerView *)self delegate];
      [v9 handleTap:self recognizer:v4];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)STKMSStickerView;
    [(MSStickerView *)&v10 handleTap:v4];
  }
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  id v5 = [(STKMSStickerView *)self delegate];
  [v5 handleLongPress:self recognizer:v4];
}

- (void)_prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)STKMSStickerView;
  [(MSStickerView *)&v3 _prepareForReuse];
  [(MSStickerView *)self setImageData:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (STKMSStickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STKMSStickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
}

@end