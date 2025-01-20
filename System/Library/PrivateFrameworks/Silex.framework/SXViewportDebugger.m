@interface SXViewportDebugger
- (SXViewport)viewport;
- (SXViewportDebuggerOverlayView)appearStateIndicator;
- (SXViewportDebuggerOverlayView)dynamicBoundsView;
- (id)colorForAppearState:(unint64_t)a3;
- (id)initWithViewport:(id *)a1;
- (uint64_t)presentOnView:(uint64_t)result;
- (void)dealloc;
- (void)update;
@end

@implementation SXViewportDebugger

- (id)initWithViewport:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)SXViewportDebugger;
    v5 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      v6 = [SXViewportDebuggerOverlayView alloc];
      double v7 = *MEMORY[0x263F001A8];
      double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
      uint64_t v11 = -[SXViewportDebuggerOverlayView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
      id v12 = a1[2];
      a1[2] = (id)v11;

      id v13 = a1[2];
      v14 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
      [v13 setBackgroundColor:v14];

      v15 = (id *)a1[2];
      v16 = [MEMORY[0x263F1C550] blueColor];
      -[SXViewportDebuggerOverlayView setBorderColor:](v15, v16);

      v17 = -[SXViewportDebuggerOverlayView initWithFrame:]([SXViewportDebuggerOverlayView alloc], "initWithFrame:", v7, v8, v9, v10);
      id v18 = a1[3];
      a1[3] = v17;

      [a1[1] addViewportChangeListener:a1 forOptions:14];
    }
  }

  return a1;
}

- (void)dealloc
{
  v3 = [(SXViewportDebugger *)self dynamicBoundsView];
  [v3 removeFromSuperview];

  id v4 = [(SXViewportDebugger *)self appearStateIndicator];
  [v4 removeFromSuperview];

  v5.receiver = self;
  v5.super_class = (Class)SXViewportDebugger;
  [(SXViewportDebugger *)&v5 dealloc];
}

- (uint64_t)presentOnView:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    id v3 = a2;
    id v4 = [v2 dynamicBoundsView];
    [v3 addSubview:v4];

    objc_super v5 = [v2 appearStateIndicator];
    [v3 addSubview:v5];

    return [v2 update];
  }
  return result;
}

- (void)update
{
  id v3 = [(SXViewportDebugger *)self viewport];
  id v4 = [(SXViewportDebugger *)self viewport];
  [v4 dynamicBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(SXViewportDebugger *)self dynamicBoundsView];
  v14 = [v13 superview];
  objc_msgSend(v3, "convertRect:toView:", v14, v6, v8, v10, v12);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  v23 = [(SXViewportDebugger *)self dynamicBoundsView];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(SXViewportDebugger *)self appearStateIndicator];
  v25 = [(SXViewportDebugger *)self viewport];
  v26 = -[SXViewportDebugger colorForAppearState:](self, "colorForAppearState:", [v25 appearState]);
  [v24 setBackgroundColor:v26];

  id v30 = [(SXViewportDebugger *)self appearStateIndicator];
  v27 = [(SXViewportDebugger *)self viewport];
  [v27 bounds];
  CGFloat v28 = CGRectGetHeight(v32) + -100.0;
  v29 = [(SXViewportDebugger *)self viewport];
  [v29 bounds];
  objc_msgSend(v30, "setFrame:", 10.0, v28, CGRectGetWidth(v33) + -20.0, 10.0);
}

- (id)colorForAppearState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double v5 = objc_msgSend(MEMORY[0x263F1C550], "redColor", v3);
      goto LABEL_9;
    case 1uLL:
      double v5 = objc_msgSend(MEMORY[0x263F1C550], "yellowColor", v3);
      goto LABEL_9;
    case 2uLL:
      double v5 = objc_msgSend(MEMORY[0x263F1C550], "greenColor", v3);
      goto LABEL_9;
    case 3uLL:
      double v5 = objc_msgSend(MEMORY[0x263F1C550], "orangeColor", v3);
LABEL_9:
      break;
    default:
      double v5 = 0;
      break;
  }
  return v5;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXViewportDebuggerOverlayView)dynamicBoundsView
{
  return self->_dynamicBoundsView;
}

- (SXViewportDebuggerOverlayView)appearStateIndicator
{
  return self->_appearStateIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearStateIndicator, 0);
  objc_storeStrong((id *)&self->_dynamicBoundsView, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end