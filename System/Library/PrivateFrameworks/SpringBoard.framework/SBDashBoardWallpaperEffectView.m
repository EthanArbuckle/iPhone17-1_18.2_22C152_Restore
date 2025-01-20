@interface SBDashBoardWallpaperEffectView
- (SBDashBoardWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3 transformOptions:(unint64_t)a4;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setCoverSheetWallpaperStyle:(int64_t)a3;
@end

@implementation SBDashBoardWallpaperEffectView

- (SBDashBoardWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3 transformOptions:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardWallpaperEffectView;
  v4 = [(SBWallpaperEffectView *)&v9 initWithWallpaperVariant:a3 transformOptions:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA7998]);
    [(SBDashBoardWallpaperEffectView *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (SBUIBackgroundView *)v6;

    [(SBDashBoardWallpaperEffectView *)v4 addSubview:v4->_backgroundView];
  }
  return v4;
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardWallpaperEffectView;
  [(SBDashBoardWallpaperEffectView *)&v4 didAddSubview:a3];
  [(SBDashBoardWallpaperEffectView *)self bringSubviewToFront:self->_backgroundView];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardWallpaperEffectView;
  [(PBUIWallpaperEffectViewBase *)&v4 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(SBDashBoardWallpaperEffectView *)self bounds];
  -[SBUIBackgroundView setFrame:](backgroundView, "setFrame:");
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

- (void)setCoverSheetWallpaperStyle:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 10;
  }
  else {
    uint64_t v3 = 0;
  }
  [(PBUIWallpaperEffectViewBase *)self setStyle:v3];
}

- (void).cxx_destruct
{
}

@end