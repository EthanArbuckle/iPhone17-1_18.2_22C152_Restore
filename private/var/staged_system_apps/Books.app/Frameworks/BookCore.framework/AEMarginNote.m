@interface AEMarginNote
- (AEAnnotation)annotation;
- (AEAnnotationTheme)theme;
- (double)xOffset;
- (double)yStart;
- (id)copyWithZone:(_NSZone *)a3;
- (int)side;
- (void)setAnnotation:(id)a3;
- (void)setSide:(int)a3;
- (void)setTheme:(id)a3;
- (void)setXOffset:(double)a3;
- (void)setYStart:(double)a3;
@end

@implementation AEMarginNote

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [v4 setSide:[self side]];
  [(AEMarginNote *)self yStart];
  [v4 setYStart:];
  [(AEMarginNote *)self xOffset];
  [v4 setXOffset:];
  v5 = [(AEMarginNote *)self annotation];
  [v4 setAnnotation:v5];

  v6 = [(AEMarginNote *)self theme];
  [v4 setTheme:v6];

  return v4;
}

- (int)side
{
  return self->mSide;
}

- (void)setSide:(int)a3
{
  self->mSide = a3;
}

- (double)yStart
{
  return self->mYStart;
}

- (void)setYStart:(double)a3
{
  self->mYStart = a3;
}

- (double)xOffset
{
  return self->mXOffset;
}

- (void)setXOffset:(double)a3
{
  self->mXOffset = a3;
}

- (AEAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
}

- (AEAnnotationTheme)theme
{
  return self->mTheme;
}

- (void)setTheme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTheme, 0);

  objc_storeStrong((id *)&self->mAnnotation, 0);
}

@end