@interface _TUIVideoPlayButton
+ (CGSize)computeSizeFittingVideoSize:(CGSize)a3;
- (AVBackgroundView)backgroundView;
- (UIImageView)glyphView;
- (_TUIVideoPlayButton)init;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setGlyphView:(id)a3;
@end

@implementation _TUIVideoPlayButton

- (_TUIVideoPlayButton)init
{
  v13.receiver = self;
  v13.super_class = (Class)_TUIVideoPlayButton;
  v2 = -[_TUIVideoPlayButton initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = +[UIImage tui_imageNamed:@"play_glyph" inBundle:v3];
    v5 = [v4 imageWithRenderingMode:2];

    id v6 = [v5 imageFlippedForRightToLeftLayoutDirection];
    v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    glyphView = v2->_glyphView;
    v2->_glyphView = v7;

    [(UIImageView *)v2->_glyphView setImage:v5];
    [(UIImageView *)v2->_glyphView setUserInteractionEnabled:0];
    v9 = +[UIColor whiteColor];
    [(UIImageView *)v2->_glyphView setTintColor:v9];

    v10 = (AVBackgroundView *)objc_alloc_init((Class)AVBackgroundView);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v10;

    [(AVBackgroundView *)v2->_backgroundView addSubview:v2->_glyphView applyingMaterialStyle:0 tintEffectStyle:0];
    [(AVBackgroundView *)v2->_backgroundView setUserInteractionEnabled:0];
    [(AVBackgroundView *)v2->_backgroundView setCircular:1];
    [(_TUIVideoPlayButton *)v2 addSubview:v2->_backgroundView];
  }
  return v2;
}

+ (CGSize)computeSizeFittingVideoSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.width = a3.height;
  }
  double v3 = fmin(a3.width, 31.0);
  if (v3 < 60.0) {
    double v3 = 60.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_TUIVideoPlayButton;
  [(_TUIVideoPlayButton *)&v13 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(_TUIVideoPlayButton *)self bounds];
  -[AVBackgroundView setFrame:](backgroundView, "setFrame:");
  glyphView = self->_glyphView;
  [(_TUIVideoPlayButton *)self bounds];
  -[UIImageView sizeThatFits:](glyphView, "sizeThatFits:", v5, v6);
  double v8 = v7;
  double v10 = v9;
  v11 = self->_glyphView;
  [(_TUIVideoPlayButton *)self bounds];
  CGFloat v12 = CGRectGetMidX(v14) - v8 * 0.5;
  [(_TUIVideoPlayButton *)self bounds];
  -[UIImageView setFrame:](v11, "setFrame:", v12, CGRectGetMidY(v15) - v10 * 0.5, v8, v10);
}

- (UIImageView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (AVBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end