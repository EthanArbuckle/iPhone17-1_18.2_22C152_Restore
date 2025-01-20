@interface PXFlatVideoOverlayButton
- (BOOL)_didConfigureForPause;
- (BOOL)showAsPause;
- (PXFlatVideoOverlayButton)initWithConfiguration:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_setDidConfigureForPause:(BOOL)a3;
- (void)setShowAsPause:(BOOL)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation PXFlatVideoOverlayButton

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
}

- (void)_setDidConfigureForPause:(BOOL)a3
{
  self->__didConfigureForPause = a3;
}

- (BOOL)_didConfigureForPause
{
  return self->__didConfigureForPause;
}

- (BOOL)showAsPause
{
  return self->_showAsPause;
}

- (void)setShowAsPause:(BOOL)a3
{
  if (self->_showAsPause != a3)
  {
    BOOL v3 = a3;
    self->_showAsPause = a3;
    if (a3 && ![(PXFlatVideoOverlayButton *)self _didConfigureForPause])
    {
      if ([(PXVideoOverlayButtonConfiguration *)self->_overlayConfiguration style] == 3)
      {
        v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pause.fill"];
        v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:44.0];
        v7 = [v5 imageWithSymbolConfiguration:v6];
        v8 = [v7 imageWithRenderingMode:2];

        [(PXFlatVideoOverlayButton *)self setImage:v8 forState:4];
      }
      else
      {
        v9 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 7);
        [(PXFlatVideoOverlayButton *)self setImage:v9 forState:4];

        v8 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 8);
      }
      [(PXFlatVideoOverlayButton *)self setImage:v8 forState:5];

      [(PXFlatVideoOverlayButton *)self _setDidConfigureForPause:1];
    }
    [(PXFlatVideoOverlayButton *)self setSelected:v3];
  }
}

- (void)_handleTap:(id)a3
{
  id v10 = a3;
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  p_action = &self->_action;
  LOBYTE(self) = objc_opt_respondsToSelector();

  if (self)
  {
    id v7 = objc_loadWeakRetained(p_target);
    v8 = v7;
    if (*p_action) {
      SEL v9 = *p_action;
    }
    else {
      SEL v9 = 0;
    }
    [v7 performSelector:v9 withObject:v10];
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_action = v6;
}

- (PXFlatVideoOverlayButton)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXFlatVideoOverlayButton;
  v6 = -[PXFlatVideoOverlayButton initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_overlayConfiguration, a3);
    if ([v5 style] == 5)
    {
      v8 = [MEMORY[0x1E4FB14D8] borderedButtonConfiguration];
      SEL v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
      [v8 setImage:v9];

      id v10 = [v5 localizedTitle];
      [v8 setTitle:v10];

      [(PXFlatVideoOverlayButton *)v7 setConfiguration:v8];
    }
    else
    {
      if ([v5 style] == 3)
      {
        v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
        v12 = [MEMORY[0x1E4FB1830] configurationWithPointSize:44.0];
        v13 = [v11 imageWithSymbolConfiguration:v12];
        v8 = [v13 imageWithRenderingMode:2];

        [(PXFlatVideoOverlayButton *)v7 setImage:v8 forState:0];
      }
      else
      {
        v14 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 3);
        [(PXFlatVideoOverlayButton *)v7 setImage:v14 forState:0];

        v8 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 4);
      }
      [(PXFlatVideoOverlayButton *)v7 setImage:v8 forState:1];
    }

    [(PXFlatVideoOverlayButton *)v7 sizeToFit];
    [(PXFlatVideoOverlayButton *)v7 setDeliversTouchesForGesturesToSuperview:0];
    [(PXFlatVideoOverlayButton *)v7 addTarget:v7 action:sel__handleTap_ forControlEvents:64];
  }

  return v7;
}

@end