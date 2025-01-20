@interface SBBiometricMonitorView
- (SBBiometricMonitorView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)matchState;
- (int64_t)poseState;
- (int64_t)presenceDetectState;
- (void)layoutSubviews;
- (void)setMatchState:(int64_t)a3;
- (void)setPoseState:(int64_t)a3;
- (void)setPresenceDetectState:(int64_t)a3;
@end

@implementation SBBiometricMonitorView

- (SBBiometricMonitorView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SBBiometricMonitorView;
  v3 = -[SBBiometricMonitorView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    stateView = v3->_stateView;
    v3->_stateView = (UIView *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
    presenceView = v3->_presenceView;
    v3->_presenceView = (UIView *)v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
    poseView = v3->_poseView;
    v3->_poseView = (UIView *)v13;

    [(SBBiometricMonitorView *)v3 addSubview:v3->_presenceView];
    [(SBBiometricMonitorView *)v3 addSubview:v3->_stateView];
    [(SBBiometricMonitorView *)v3 addSubview:v3->_poseView];
  }
  return v3;
}

- (void)setMatchState:(int64_t)a3
{
  self->_matchState = a3;
  switch(a3)
  {
    case 0:
      uint64_t v4 = [MEMORY[0x1E4F428B8] clearColor];
      goto LABEL_7;
    case 1:
      uint64_t v4 = [MEMORY[0x1E4F428B8] yellowColor];
      goto LABEL_7;
    case 2:
      uint64_t v4 = [MEMORY[0x1E4F428B8] greenColor];
      goto LABEL_7;
    case 3:
      uint64_t v4 = [MEMORY[0x1E4F428B8] redColor];
LABEL_7:
      double v5 = (void *)v4;
      break;
    default:
      double v5 = 0;
      break;
  }
  id v6 = v5;
  [(UIView *)self->_stateView setBackgroundColor:v5];
}

- (void)setPresenceDetectState:(int64_t)a3
{
  self->_presenceDetectState = a3;
  switch(a3)
  {
    case 0:
      uint64_t v4 = [MEMORY[0x1E4F428B8] clearColor];
      goto LABEL_7;
    case 1:
      uint64_t v4 = [MEMORY[0x1E4F428B8] whiteColor];
      goto LABEL_7;
    case 2:
      uint64_t v4 = [MEMORY[0x1E4F428B8] greenColor];
      goto LABEL_7;
    case 3:
      uint64_t v4 = [MEMORY[0x1E4F428B8] redColor];
LABEL_7:
      double v5 = (void *)v4;
      break;
    default:
      double v5 = 0;
      break;
  }
  id v6 = v5;
  [(UIView *)self->_presenceView setBackgroundColor:v5];
}

- (void)setPoseState:(int64_t)a3
{
  self->_poseState = a3;
  if (a3 == 1)
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] purpleColor];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] clearColor];
LABEL_5:
    double v5 = (void *)v4;
    goto LABEL_7;
  }
  double v5 = 0;
LABEL_7:
  id v6 = v5;
  [(UIView *)self->_poseView setBackgroundColor:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)layoutSubviews
{
  [(SBBiometricMonitorView *)self bounds];
  UIRectCenteredXInRect();
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  slice.size = v3;
  v16.origin = slice.origin;
  v16.size = v3;
  CGRectDivide(v18, &slice, &v16, 48.0, CGRectMinXEdge);
  UIRectInset();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  UIRectInset();
  v16.origin.x = v12;
  v16.origin.y = v13;
  v16.size.width = v14;
  v16.size.height = v15;
  -[UIView setFrame:](self->_stateView, "setFrame:", v5, v7, v9, v11);
  [(UIView *)self->_stateView _setCornerRadius:20.0];
  -[UIView setFrame:](self->_presenceView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  [(UIView *)self->_presenceView _setCornerRadius:4.0];
  -[UIView setFrame:](self->_poseView, "setFrame:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
}

- (int64_t)matchState
{
  return self->_matchState;
}

- (int64_t)presenceDetectState
{
  return self->_presenceDetectState;
}

- (int64_t)poseState
{
  return self->_poseState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poseView, 0);
  objc_storeStrong((id *)&self->_presenceView, 0);
  objc_storeStrong((id *)&self->_stateView, 0);
}

@end