@interface _WTView
- (CGRect)platformGetVisibleRect;
- (_WTView)init;
- (_WTView)initWithCoder:(id)a3;
- (_WTView)initWithFrame:(CGRect)a3;
- (id)platformInstalledDisplayLinkWithTarget:(id)a3 selector:(SEL)a4;
- (void)_commonLayoutSubviews;
- (void)layoutSubviews;
- (void)platformPerformWithoutAnimation:(id)a3;
@end

@implementation _WTView

- (_WTView)init
{
  v6.receiver = self;
  v6.super_class = (Class)_WTView;
  v2 = [(_WTView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(_WTView *)v2 _commonPlatformViewInit];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_WTView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WTView;
  v3 = [(_WTView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(_WTView *)v3 _commonPlatformViewInit];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_WTView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WTView;
  v3 = -[_WTView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_WTView *)v3 _commonPlatformViewInit];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_WTView;
  [(_WTView *)&v3 layoutSubviews];
  [(_WTView *)self _commonLayoutSubviews];
}

- (void)_commonLayoutSubviews
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __32___WTView__commonLayoutSubviews__block_invoke;
  v2[3] = &unk_26558E530;
  v2[4] = self;
  [(_WTView *)self platformPerformWithoutAnimation:v2];
}

- (id)platformInstalledDisplayLinkWithTarget:(id)a3 selector:(SEL)a4
{
  v4 = [MEMORY[0x263F15780] displayLinkWithTarget:a3 selector:a4];
  v5 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v4 addToRunLoop:v5 forMode:*MEMORY[0x263EFF588]];

  return v4;
}

- (CGRect)platformGetVisibleRect
{
  [(_WTView *)self frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(_WTView *)self superview];
  [v11 bounds];
  v27.origin.CGFloat x = v12;
  v27.origin.CGFloat y = v13;
  v27.size.CGFloat width = v14;
  v27.size.CGFloat height = v15;
  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  CGRect v25 = CGRectIntersection(v24, v27);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)platformPerformWithoutAnimation:(id)a3
{
}

@end