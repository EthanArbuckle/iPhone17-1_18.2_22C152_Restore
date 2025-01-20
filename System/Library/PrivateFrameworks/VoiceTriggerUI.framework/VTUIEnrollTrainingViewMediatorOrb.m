@interface VTUIEnrollTrainingViewMediatorOrb
- (VTUIEnrollTrainingView)enrollTrainingView;
- (VTUIEnrollTrainingViewMediatorOrb)initWithTrainingView:(id)a3;
- (void)addTargetToRadarExitButton:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)animateSuccessfulStep:(BOOL)a3 completion:(id)a4;
- (void)animateToListeningState;
- (void)animateToOff;
- (void)clearInstructionLabel;
- (void)hideContinuationAndPreludeLabel:(BOOL)a3;
- (void)hideContinuationLabel:(BOOL)a3;
- (void)hideInstructions;
- (void)hidePreludeLabel:(BOOL)a3;
- (void)hideRadarButton:(BOOL)a3;
- (void)hideSkipButton:(BOOL)a3;
- (void)hideTrainingElements;
- (void)hideTrainingView:(BOOL)a3;
- (void)setEnrollTrainingView:(id)a3;
- (void)setInstructionContinuationLabel:(id)a3;
- (void)setInstructionPreludeLabel:(id)a3;
- (void)setNeedsUpdateConstraints;
- (void)setPowerLevel:(float)a3;
- (void)showRadarExitButton:(id)a3;
- (void)showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5;
- (void)showTrainingElements;
- (void)showTrainingView;
- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5;
@end

@implementation VTUIEnrollTrainingViewMediatorOrb

- (VTUIEnrollTrainingViewMediatorOrb)initWithTrainingView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VTUIEnrollTrainingViewMediatorOrb;
  v6 = [(VTUIEnrollTrainingViewMediatorOrb *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_enrollTrainingView, a3);
  }

  return v7;
}

- (void)hideTrainingElements
{
  v3 = [(VTUIEnrollTrainingView *)self->_enrollTrainingView orbView];
  [v3 setHidden:1];

  enrollTrainingView = self->_enrollTrainingView;
  [(VTUIEnrollTrainingView *)enrollTrainingView setCheckMarkViewHidden:1];
}

- (void)showTrainingElements
{
  v3 = [(VTUIEnrollTrainingView *)self->_enrollTrainingView orbView];
  [v3 setHidden:0];

  enrollTrainingView = self->_enrollTrainingView;
  [(VTUIEnrollTrainingView *)enrollTrainingView setCheckMarkViewHidden:0];
}

- (void)setNeedsUpdateConstraints
{
}

- (void)clearInstructionLabel
{
}

- (void)animateSuccessfulStep:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    objc_super v9 = "-[VTUIEnrollTrainingViewMediatorOrb animateSuccessfulStep:completion:]";
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s Animate. For Success: %d", (uint8_t *)&v8, 0x12u);
  }
  [(VTUIEnrollTrainingView *)self->_enrollTrainingView startCheckMarkAnimation:v4 completion:v6];
}

- (void)hideSkipButton:(BOOL)a3
{
}

- (void)hideRadarButton:(BOOL)a3
{
}

- (void)hideTrainingView:(BOOL)a3
{
  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView) {
    [(VTUIEnrollTrainingView *)enrollTrainingView setHidden:1];
  }
}

- (void)showTrainingView
{
  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView) {
    [(VTUIEnrollTrainingView *)enrollTrainingView setHidden:0];
  }
}

- (void)hideContinuationAndPreludeLabel:(BOOL)a3
{
}

- (void)hidePreludeLabel:(BOOL)a3
{
}

- (void)hideContinuationLabel:(BOOL)a3
{
}

- (void)hideInstructions
{
  [(VTUIEnrollTrainingView *)self->_enrollTrainingView clearInstructionLabel];
  [(VTUIEnrollTrainingViewMediatorOrb *)self hideContinuationAndPreludeLabel:1];
}

- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
}

- (void)setInstructionPreludeLabel:(id)a3
{
  enrollTrainingView = self->_enrollTrainingView;
  id v4 = a3;
  id v5 = [(VTUIEnrollTrainingView *)enrollTrainingView instructionPreludeLabel];
  [v5 setText:v4];
}

- (void)setInstructionContinuationLabel:(id)a3
{
  enrollTrainingView = self->_enrollTrainingView;
  id v4 = a3;
  id v5 = [(VTUIEnrollTrainingView *)enrollTrainingView instructionContinuationLabel];
  [v5 setText:v4];
}

- (void)animateToOff
{
  id v2 = [(VTUIEnrollTrainingView *)self->_enrollTrainingView orbView];
  [v2 animateToOffWithCompletion:0];
}

- (void)animateToListeningState
{
  id v2 = [(VTUIEnrollTrainingView *)self->_enrollTrainingView orbView];
  [v2 setMode:1];
}

- (void)showRadarExitButton:(id)a3
{
}

- (void)addTargetToRadarExitButton:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  enrollTrainingView = self->_enrollTrainingView;
  id v8 = a3;
  id v9 = [(VTUIEnrollTrainingView *)enrollTrainingView radarExitButton];
  [v9 addTarget:v8 action:a4 forControlEvents:a5];
}

- (void)showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke;
  v13[3] = &unk_264D4CA18;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  dispatch_after(v10, MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = [a1[4] length];
    id v4 = [WeakRetained[1] statusLabel];
    id v5 = v4;
    if (v3)
    {
      [v4 setAlpha:0.0];

      id v6 = [WeakRetained[1] statusLabel];
      [v6 setText:a1[4]];

      v7 = (void *)MEMORY[0x263F82E00];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_2;
      v18[3] = &unk_264D4C280;
      v18[4] = WeakRetained;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_3;
      v16[3] = &unk_264D4C6E8;
      id v17 = a1[5];
      [v7 animateWithDuration:v18 animations:v16 completion:0.3];
      id v8 = v17;
LABEL_6:

      goto LABEL_9;
    }
    [v4 alpha];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = (void *)MEMORY[0x263F82E00];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_4;
      v15[3] = &unk_264D4C280;
      v15[4] = WeakRetained;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_5;
      v13[3] = &unk_264D4C710;
      void v13[4] = WeakRetained;
      id v14 = a1[5];
      [v11 animateWithDuration:v15 animations:v13 completion:0.3];
      id v8 = v14;
      goto LABEL_6;
    }
  }
  id v12 = (void (**)(void))a1[5];
  if (v12) {
    v12[2]();
  }
LABEL_9:
}

void __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 8) statusLabel];
  [v1 setAlpha:1.0];
}

uint64_t __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 8) statusLabel];
  [v1 setAlpha:0.0];
}

uint64_t __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) statusLabel];
  [v2 setText:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setPowerLevel:(float)a3
{
  id v5 = [(VTUIEnrollTrainingView *)self->_enrollTrainingView orbView];
  *(float *)&double v4 = a3;
  [v5 setPowerLevel:v4];
}

- (VTUIEnrollTrainingView)enrollTrainingView
{
  return self->_enrollTrainingView;
}

- (void)setEnrollTrainingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end