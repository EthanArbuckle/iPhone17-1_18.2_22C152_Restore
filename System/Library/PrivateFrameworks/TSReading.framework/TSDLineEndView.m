@interface TSDLineEndView
+ (id)viewWithLineEnd:(id)a3 onRight:(BOOL)a4;
- (BOOL)onRight;
- (TSDLineEnd)lineEnd;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setLineEnd:(id)a3;
- (void)setOnRight:(BOOL)a3;
@end

@implementation TSDLineEndView

+ (id)viewWithLineEnd:(id)a3 onRight:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_alloc_init(TSDLineEndView);
  [(TSDLineEndView *)v6 setOpaque:0];
  [(TSDLineEndView *)v6 setAlpha:0.699999988];
  [(TSDLineEndView *)v6 setLineEnd:a3];
  -[TSDLineEndView setBounds:](v6, "setBounds:", 0.0, 0.0, 27.0, 11.0);
  [(TSDLineEndView *)v6 setOnRight:v4];
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDLineEndView;
  [(TSDLineEndView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  mLineEnd = self->mLineEnd;
  BOOL mOnRight = self->mOnRight;
  [(TSDLineEndView *)self contentScaleFactor];
  double v8 = v7;
  [(TSDLineEndView *)self bounds];
  v11 = -[TSDLineEnd newLineEndImageOnRight:forContentsScale:withSize:](mLineEnd, "newLineEndImageOnRight:forContentsScale:withSize:", mOnRight, v8, v9, v10);
  [(TSDLineEndView *)self bounds];
  v13.origin.x = TSDRectWithSize();
  CGContextDrawImage(CurrentContext, v13, v11);

  CGImageRelease(v11);
}

- (TSDLineEnd)lineEnd
{
  return self->mLineEnd;
}

- (void)setLineEnd:(id)a3
{
}

- (BOOL)onRight
{
  return self->mOnRight;
}

- (void)setOnRight:(BOOL)a3
{
  self->BOOL mOnRight = a3;
}

@end