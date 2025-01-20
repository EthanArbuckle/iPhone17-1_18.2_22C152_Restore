@interface PLWallpaperButton
+ (id)autoLayoutCommonWallpaperButton;
+ (id)autoLayoutCommonWallpaperButtonWithStyle:(int64_t)a3;
- (PLWallpaperButton)initWithFrame:(CGRect)a3;
- (PLWallpaperButton)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIImageView)titleMaskImageView;
- (_UIBackdropView)backdropView;
- (void)_setupBackdropView;
- (void)_updateContentEdgeInsets;
- (void)backdropViewDidChange:(id)a3;
- (void)dealloc;
- (void)safeAreaInsetsDidChange;
- (void)setBackdropView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitleMaskImageView:(id)a3;
@end

@implementation PLWallpaperButton

- (void)setBackdropView:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setTitleMaskImageView:(id)a3
{
}

- (UIImageView)titleMaskImageView
{
  return self->_titleMaskImageView;
}

- (void)backdropViewDidChange:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "outputSettings"), "legibleColor");
  [(PLWallpaperButton *)self setTitleColor:v4 forState:0];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PLWallpaperButton *)self backdropView];
  v6 = (void *)[(_UIBackdropView *)v5 inputSettings];
  v7 = (void *)[(_UIBackdropView *)v5 outputSettings];
  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  [(PLWallpaperButton *)&v8 setEnabled:v3];
  [v6 restoreDefaultValues];
  objc_msgSend(v6, "setEnabled:", -[PLWallpaperButton isEnabled](self, "isEnabled"));
  [v7 computeOutputSettingsUsingModel:v6];
  [(_UIBackdropView *)v5 applySettings:v7];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PLWallpaperButton *)self backdropView];
  v6 = (void *)[(_UIBackdropView *)v5 inputSettings];
  v7 = (void *)[(_UIBackdropView *)v5 outputSettings];
  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  [(PLWallpaperButton *)&v8 setSelected:v3];
  [v6 restoreDefaultValues];
  objc_msgSend(v6, "setSelected:", -[PLWallpaperButton isSelected](self, "isSelected"));
  [v7 computeOutputSettingsUsingModel:v6];
  [(_UIBackdropView *)v5 applySettings:v7];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PLWallpaperButton *)self backdropView];
  v6 = (void *)[(_UIBackdropView *)v5 inputSettings];
  v7 = (void *)[(_UIBackdropView *)v5 outputSettings];
  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  [(PLWallpaperButton *)&v8 setHighlighted:v3];
  [v6 restoreDefaultValues];
  objc_msgSend(v6, "setHighlighted:", -[PLWallpaperButton isHighlighted](self, "isHighlighted"));
  [v7 computeOutputSettingsUsingModel:v6];
  [(_UIBackdropView *)v5 applySettings:v7];
}

- (void)_setupBackdropView
{
  BOOL v3 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2010];
  self->_backdropView = v3;
  [(_UIBackdropView *)v3 addObserver:self];
  [(PLWallpaperButton *)self addSubview:self->_backdropView];
  [(_UIBackdropView *)self->_backdropView setUserInteractionEnabled:0];
  [(_UIBackdropView *)self->_backdropView setAppliesOutputSettingsAnimationDuration:0.0];
  [(PLWallpaperButton *)self sendSubviewToBack:self->_backdropView];
  backdropView = self->_backdropView;
  [(PLWallpaperButton *)self backdropViewDidChange:backdropView];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLWallpaperButton;
  [(PLWallpaperButton *)&v3 dealloc];
}

- (void)_updateContentEdgeInsets
{
  [(PLWallpaperButton *)self safeAreaInsets];
  -[PLWallpaperButton setContentEdgeInsets:](self, "setContentEdgeInsets:");
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PLWallpaperButton;
  [(PLWallpaperButton *)&v3 safeAreaInsetsDidChange];
  [(PLWallpaperButton *)self _updateContentEdgeInsets];
}

- (PLWallpaperButton)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  v5 = -[PLWallpaperButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(PLWallpaperButton *)v5 setOpaque:0];
    if (!a4) {
      [(PLWallpaperButton *)v6 _setupBackdropView];
    }
    [(PLWallpaperButton *)v6 _updateContentEdgeInsets];
  }
  return v6;
}

- (PLWallpaperButton)initWithFrame:(CGRect)a3
{
  return -[PLWallpaperButton initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)autoLayoutCommonWallpaperButtonWithStyle:(int64_t)a3
{
  uint64_t v4 = [PLWallpaperButton alloc];
  v5 = -[PLWallpaperButton initWithFrame:style:](v4, "initWithFrame:style:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PLWallpaperButton *)v5 setExclusiveTouch:1];
  [(PLWallpaperButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1144750080;
  [(PLWallpaperButton *)v5 setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1132068864;
  [(PLWallpaperButton *)v5 setContentHuggingPriority:0 forAxis:v7];
  return v5;
}

+ (id)autoLayoutCommonWallpaperButton
{
  return +[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:0];
}

@end