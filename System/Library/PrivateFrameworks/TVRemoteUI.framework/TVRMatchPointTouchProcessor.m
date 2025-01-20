@interface TVRMatchPointTouchProcessor
- (UITapGestureRecognizer)tapGesture;
- (_TVRMatchPointArtworkView)artworkView;
- (id)_artworkView;
- (int64_t)_pressTypeForLocationInTouchpadView:(CGPoint)a3;
- (int64_t)highlightedButtonType;
- (void)_handleTap:(id)a3;
- (void)_sendButtonPressToDelegate:(int64_t)a3;
- (void)setArtworkView:(id)a3;
- (void)setHighlightedButtonType:(int64_t)a3;
- (void)setTapGesture:(id)a3;
- (void)setTouchpadView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVRMatchPointTouchProcessor

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  v6 = [(TVRTouchProcessor *)self touchpadView];
  v7 = [v6 haptic];
  [v7 userInteractionBegan];

  v8 = [v5 anyObject];

  v9 = [(TVRTouchProcessor *)self touchpadView];
  [v8 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  int64_t v14 = -[TVRMatchPointTouchProcessor _pressTypeForLocationInTouchpadView:](self, "_pressTypeForLocationInTouchpadView:", v11, v13);
  self->_highlightedButtonType = v14;
  artworkView = self->_artworkView;
  [(_TVRMatchPointArtworkView *)artworkView highlightForButtonType:v14 enabled:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = [(TVRTouchProcessor *)self touchpadView];
  v6 = [v5 haptic];
  [v6 userInteractionEnded];

  artworkView = self->_artworkView;
  int64_t highlightedButtonType = self->_highlightedButtonType;
  [(_TVRMatchPointArtworkView *)artworkView highlightForButtonType:highlightedButtonType enabled:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = [(TVRTouchProcessor *)self touchpadView];
  v6 = [v5 haptic];
  [v6 userInteractionCancelled];

  artworkView = self->_artworkView;
  int64_t highlightedButtonType = self->_highlightedButtonType;
  [(_TVRMatchPointArtworkView *)artworkView highlightForButtonType:highlightedButtonType enabled:0];
}

- (void)setTouchpadView:(id)a3
{
  id v4 = a3;
  if (self->_tapGesture)
  {
    id v5 = [(TVRTouchProcessor *)self touchpadView];
    [v5 removeGestureRecognizer:self->_tapGesture];
  }
  [(_TVRMatchPointArtworkView *)self->_artworkView removeFromSuperview];
  v11.receiver = self;
  v11.super_class = (Class)TVRMatchPointTouchProcessor;
  [(TVRTouchProcessor *)&v11 setTouchpadView:v4];
  tapGesture = self->_tapGesture;
  if (!tapGesture)
  {
    v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleTap_];
    v8 = self->_tapGesture;
    self->_tapGesture = v7;

    tapGesture = self->_tapGesture;
  }
  [v4 addGestureRecognizer:tapGesture];
  v9 = +[TVRButtonHaptic hapticForView:v4];
  [v4 setHaptic:v9];

  double v10 = [(TVRMatchPointTouchProcessor *)self _artworkView];
  [v4 bounds];
  objc_msgSend(v10, "setFrame:");
  [v4 addSubview:v10];
}

- (id)_artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    id v4 = [_TVRMatchPointArtworkView alloc];
    id v5 = -[_TVRMatchPointArtworkView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_artworkView;
    self->_artworkView = v5;

    [(_TVRMatchPointArtworkView *)self->_artworkView setAutoresizingMask:18];
    artworkView = self->_artworkView;
  }
  return artworkView;
}

- (void)_handleTap:(id)a3
{
  id v10 = a3;
  if ([v10 state] == 3)
  {
    id v4 = [(TVRTouchProcessor *)self touchpadView];
    [v10 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    int64_t v9 = -[TVRMatchPointTouchProcessor _pressTypeForLocationInTouchpadView:](self, "_pressTypeForLocationInTouchpadView:", v6, v8);
    if (v9 != 9999) {
      [(TVRMatchPointTouchProcessor *)self _sendButtonPressToDelegate:v9];
    }
  }
}

- (int64_t)_pressTypeForLocationInTouchpadView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  artworkView = self->_artworkView;
  double v7 = [(TVRTouchProcessor *)self touchpadView];
  objc_msgSend(v7, "convertPoint:toView:", self->_artworkView, x, y);
  LOBYTE(artworkView) = -[_TVRMatchPointArtworkView touchLocationIsConsideredCenter:](artworkView, "touchLocationIsConsideredCenter:");

  if (artworkView) {
    return 1;
  }
  int64_t v9 = [(TVRTouchProcessor *)self touchpadView];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v24.origin.double x = v11;
  v24.origin.double y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  double v18 = CGRectGetHeight(v24) - x;
  BOOL v19 = y >= x;
  if (y < x && y < v18) {
    return 12;
  }
  if (y < v18) {
    BOOL v19 = 1;
  }
  if (!v19) {
    return 15;
  }
  BOOL v20 = y < x;
  if (y < v18) {
    BOOL v20 = 1;
  }
  int v21 = !v20;
  if (y < x) {
    int v21 = 1;
  }
  BOOL v22 = !v20;
  int64_t v23 = 13;
  if (!v22) {
    int64_t v23 = 9999;
  }
  if (v21 | (y >= v18)) {
    return v23;
  }
  else {
    return 14;
  }
}

- (void)_sendButtonPressToDelegate:(int64_t)a3
{
  -[TVRTouchProcessor sendPressBegan:](self, "sendPressBegan:");
  [(TVRTouchProcessor *)self sendPressEnded:a3];
}

- (_TVRMatchPointArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (int64_t)highlightedButtonType
{
  return self->_highlightedButtonType;
}

- (void)setHighlightedButtonType:(int64_t)a3
{
  self->_int64_t highlightedButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end