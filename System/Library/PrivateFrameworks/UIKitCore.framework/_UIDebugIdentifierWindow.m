@interface _UIDebugIdentifierWindow
- (BOOL)_ignoresHitTest;
- (BOOL)canBecomeKeyWindow;
- (_UIDebugIdentifierWindow)initWithWindowScene:(id)a3;
- (void)_updateSceneIdentifierLabel;
@end

@implementation _UIDebugIdentifierWindow

- (_UIDebugIdentifierWindow)initWithWindowScene:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIDebugIdentifierWindow;
  v3 = [(UIWindow *)&v12 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    [(UIWindow *)v3 setWindowLevel:10000.0];
    [(UIView *)v4 setUserInteractionEnabled:0];
    v5 = [UILabel alloc];
    uint64_t v6 = -[UILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sceneIdentifierLabel = v4->_sceneIdentifierLabel;
    v4->_sceneIdentifierLabel = (UILabel *)v6;

    v8 = [off_1E52D39B8 monospacedSystemFontOfSize:14.0 weight:*(double *)off_1E52D6BF0];
    [(UILabel *)v4->_sceneIdentifierLabel setFont:v8];

    v9 = +[UIColor blackColor];
    [(UIView *)v4->_sceneIdentifierLabel setBackgroundColor:v9];

    v10 = +[UIColor whiteColor];
    [(UILabel *)v4->_sceneIdentifierLabel setTextColor:v10];

    [(UIView *)v4 addSubview:v4->_sceneIdentifierLabel];
    [(_UIDebugIdentifierWindow *)v4 _updateSceneIdentifierLabel];
  }
  return v4;
}

- (void)_updateSceneIdentifierLabel
{
  v3 = [(UIWindow *)self windowScene];
  v4 = [v3 _FBSScene];
  id v11 = [v4 identityToken];

  if (v11)
  {
    v5 = [v11 stringRepresentation];
    uint64_t v6 = [v5 componentsSeparatedByString:@"-"];
    v7 = [v6 lastObject];

    if (v7) {
      v8 = v7;
    }
    else {
      v8 = @"(nil)";
    }
  }
  else
  {
    v8 = @"(nil)";
  }
  [(UILabel *)self->_sceneIdentifierLabel setText:v8];
  [(UIView *)self->_sceneIdentifierLabel sizeToFit];
  [(UIView *)self->_sceneIdentifierLabel frame];
  double v10 = v9;
  [(UIView *)self->_sceneIdentifierLabel frame];
  -[UILabel setFrame:](self->_sceneIdentifierLabel, "setFrame:", 10.0, 10.0, v10);
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (void).cxx_destruct
{
}

@end