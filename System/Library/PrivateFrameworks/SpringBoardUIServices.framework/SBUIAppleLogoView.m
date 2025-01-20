@interface SBUIAppleLogoView
- (SBUIAppleLogoView)initWithFrame:(CGRect)a3;
- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 appearance:(int64_t)a4 progressBarVisible:(BOOL)a5;
- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 inverted:(BOOL)a4;
- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 inverted:(BOOL)a4 progressBarVisible:(BOOL)a5;
- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 progressBarVisible:(BOOL)a4;
- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 useWhiteLogo:(BOOL)a4;
- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 useWhiteLogo:(BOOL)a4 progressBarVisible:(BOOL)a5;
- (float)progress;
- (void)layoutSubviews;
- (void)setProgress:(float)a3;
- (void)setStatusText:(id)a3;
@end

@implementation SBUIAppleLogoView

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 appearance:(int64_t)a4 progressBarVisible:(BOOL)a5
{
  BOOL v5 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SBUIAppleLogoView;
  v7 = -[SBUIAppleLogoView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F93C40]) initWithProgressBarVisibility:v5 createContext:0 contextLevel:a4 appearance:0.0];
    progressWindow = v7->_progressWindow;
    v7->_progressWindow = (PUIProgressWindow *)v8;

    [(PUIProgressWindow *)v7->_progressWindow setVisible:1];
    v10 = [(PUIProgressWindow *)v7->_progressWindow layer];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [(PUIProgressWindow *)v7->_progressWindow layer];
    v20 = v19;
    if (v19) {
      [v19 transform];
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }
    BOOL v21 = CATransform3DIsIdentity(&v34);

    if (!v21)
    {
      v22 = [(PUIProgressWindow *)v7->_progressWindow layer];
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v33[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v33[5] = v23;
      long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v33[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v33[7] = v24;
      long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v33[0] = *MEMORY[0x1E4F39B10];
      v33[1] = v25;
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v33[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v33[3] = v26;
      [v22 setTransform:v33];

      v27 = [(PUIProgressWindow *)v7->_progressWindow layer];
      objc_msgSend(v27, "setPosition:", v16 * 0.5, v18 * 0.5);
    }
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v12, v14, v16, v18);
    layerView = v7->_layerView;
    v7->_layerView = (UIView *)v28;

    v30 = [(UIView *)v7->_layerView layer];
    v31 = [(PUIProgressWindow *)v7->_progressWindow layer];
    [v30 addSublayer:v31];

    [(SBUIAppleLogoView *)v7 addSubview:v7->_layerView];
  }
  return v7;
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 inverted:(BOOL)a4 progressBarVisible:(BOOL)a5
{
  return -[SBUIAppleLogoView initWithFrame:appearance:progressBarVisible:](self, "initWithFrame:appearance:progressBarVisible:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 inverted:(BOOL)a4
{
  return -[SBUIAppleLogoView initWithFrame:inverted:progressBarVisible:](self, "initWithFrame:inverted:progressBarVisible:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 useWhiteLogo:(BOOL)a4 progressBarVisible:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v11 = (MGGetSInt32Answer() != 1) ^ a4;
  return -[SBUIAppleLogoView initWithFrame:inverted:progressBarVisible:](self, "initWithFrame:inverted:progressBarVisible:", v11, v5, x, y, width, height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 useWhiteLogo:(BOOL)a4
{
  return -[SBUIAppleLogoView initWithFrame:useWhiteLogo:progressBarVisible:](self, "initWithFrame:useWhiteLogo:progressBarVisible:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 progressBarVisible:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v10 = MGGetSInt32Answer() != 1;
  return -[SBUIAppleLogoView initWithFrame:useWhiteLogo:progressBarVisible:](self, "initWithFrame:useWhiteLogo:progressBarVisible:", v10, v4, x, y, width, height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3
{
  return -[SBUIAppleLogoView initWithFrame:progressBarVisible:](self, "initWithFrame:progressBarVisible:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
  -[PUIProgressWindow setProgressValue:](self->_progressWindow, "setProgressValue:");
}

- (void)setStatusText:(id)a3
{
}

- (void)layoutSubviews
{
  [(SBUIAppleLogoView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(PUIProgressWindow *)self->_progressWindow layer];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  layerView = self->_layerView;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v20[0] = *MEMORY[0x1E4F1DAB8];
  v20[1] = v17;
  v20[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)layerView setTransform:v20];
  -[UIView setFrame:](self->_layerView, "setFrame:", v9, v11, v13, v15);
  double v18 = self->_layerView;
  CGAffineTransformMakeScale(&v19, v4 / v13, v6 / v15);
  [(UIView *)v18 setTransform:&v19];
  -[UIView setCenter:](self->_layerView, "setCenter:", v4 * 0.5, v6 * 0.5);
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressWindow, 0);
  objc_storeStrong((id *)&self->_layerView, 0);
}

@end