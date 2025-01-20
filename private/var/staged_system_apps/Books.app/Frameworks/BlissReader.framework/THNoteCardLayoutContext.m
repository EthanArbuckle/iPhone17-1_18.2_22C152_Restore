@interface THNoteCardLayoutContext
+ (THNoteCardLayoutContext)contextWithScale:(double)a3 hostView:(id)a4;
- (BOOL)_isCompactHeight;
- (BOOL)_isCompactWidth;
- (CGPoint)bottomCardOffset;
- (CGSize)noteCardOffset;
- (CGSize)noteCardShadowOffsetForScreenScale:(double)a3;
- (CGSize)noteCardSize;
- (THNoteCardLayoutContext)initWithScale:(double)a3 hostView:(id)a4;
- (double)bottomCardAngle;
- (double)noteCardBodyBottomMargin;
- (double)noteCardBodyHeight;
- (double)noteCardBodyLeftMargin;
- (double)noteCardBodyRightMargin;
- (double)noteCardBodyTopMargin;
- (double)noteCardBodyWidth;
- (double)noteCardColorBarPaddingFromScrollBottom;
- (double)noteCardColorBarWidth;
- (double)noteCardFooterBaselineOffset;
- (double)noteCardHeaderBaselineOffset;
- (double)noteCardLeftMargin;
- (double)noteCardRightMargin;
- (double)noteCardSectionTitlePaddingToPageNumber;
- (double)noteCardShadowOpacity;
- (double)noteCardShadowRadiusForScreenScale:(double)a3;
- (double)scale;
- (double)textScale;
- (id)noteCardFooterFont;
- (id)noteCardHeaderFont;
- (void)dealloc;
@end

@implementation THNoteCardLayoutContext

+ (THNoteCardLayoutContext)contextWithScale:(double)a3 hostView:(id)a4
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithScale:a4 hostView:a3];

  return (THNoteCardLayoutContext *)v4;
}

- (THNoteCardLayoutContext)initWithScale:(double)a3 hostView:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THNoteCardLayoutContext;
  v6 = [(THNoteCardLayoutContext *)&v8 init];
  if (v6)
  {
    v6->_hostView = (UIView *)a4;
    v6->_scale = a3;
  }
  return v6;
}

- (void)dealloc
{
  self->_hostView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayoutContext;
  [(THNoteCardLayoutContext *)&v3 dealloc];
}

- (double)scale
{
  return self->_scale;
}

- (double)textScale
{
  if ([(THNoteCardLayoutContext *)self _isCompactWidth]
    || [(THNoteCardLayoutContext *)self _isCompactHeight])
  {
    return fmin(self->_scale * 1.5, 1.0);
  }
  else
  {
    return self->_scale;
  }
}

- (CGSize)noteCardSize
{
  double scale = self->_scale;
  double v3 = 895.0 * scale;
  double v4 = scale * 614.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)noteCardOffset
{
  double scale = self->_scale;
  double v3 = *(double *)&kTHNoteCardOffset * scale;
  double v4 = scale * *((double *)&kTHNoteCardOffset + 1);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)noteCardLeftMargin
{
  return 40.0 * self->_scale;
}

- (double)noteCardRightMargin
{
  return 40.0 * self->_scale;
}

- (double)noteCardBodyLeftMargin
{
  return *(double *)&kTHNoteCardBodyLeftMargin * self->_scale;
}

- (double)noteCardBodyRightMargin
{
  return 57.0 * self->_scale;
}

- (double)noteCardBodyTopMargin
{
  return 80.0 * self->_scale;
}

- (double)noteCardBodyBottomMargin
{
  return 88.0 * self->_scale;
}

- (double)noteCardBodyWidth
{
  return *(double *)&kTHNoteCardBodyWidth * self->_scale;
}

- (double)noteCardBodyHeight
{
  return 446.0 * self->_scale;
}

- (double)noteCardHeaderBaselineOffset
{
  return 55.0 * self->_scale;
}

- (double)noteCardFooterBaselineOffset
{
  return 40.0 * self->_scale;
}

- (double)noteCardColorBarWidth
{
  return 4.0 * self->_scale;
}

- (double)noteCardColorBarPaddingFromScrollBottom
{
  return 3.0 * self->_scale;
}

- (double)noteCardSectionTitlePaddingToPageNumber
{
  return 25.0 * self->_scale;
}

- (double)noteCardShadowOpacity
{
  return 0.25;
}

- (CGSize)noteCardShadowOffsetForScreenScale:(double)a3
{
  double scale = self->_scale;
  BOOL v4 = a3 <= 1.0;
  if (a3 <= 1.0) {
    v5 = &kTHNoteCardShadowOffset;
  }
  else {
    v5 = &kTHNoteCardShadowOffsetRetina;
  }
  double v6 = *(double *)v5 * scale;
  v7 = (double *)&kTHNoteCardShadowOffsetRetina + 1;
  if (v4) {
    v7 = (double *)&kTHNoteCardShadowOffset + 1;
  }
  double v8 = scale * *v7;
  result.height = v8;
  result.width = v6;
  return result;
}

- (double)noteCardShadowRadiusForScreenScale:(double)a3
{
  double v3 = (double *)&kTHNoteCardShadowRadiusRetina;
  if (a3 <= 1.0) {
    double v3 = (double *)&kTHNoteCardShadowRadius;
  }
  return *v3 * self->_scale;
}

- (id)noteCardHeaderFont
{
  return +[TSUFont systemFontOfSize:21.0 * self->_scale];
}

- (id)noteCardFooterFont
{
  return +[TSUFont systemFontOfSize:25.0 * self->_scale];
}

- (BOOL)_isCompactWidth
{
  v2 = [(UIWindow *)[(UIView *)self->_hostView window] rootViewController];

  return [(UIViewController *)v2 im_isCompactWidth];
}

- (BOOL)_isCompactHeight
{
  v2 = [(UIWindow *)[(UIView *)self->_hostView window] rootViewController];

  return [(UIViewController *)v2 im_isCompactHeight];
}

- (double)bottomCardAngle
{
  if ([(THNoteCardLayoutContext *)self _isCompactWidth])
  {
    unsigned int v3 = [(THNoteCardLayoutContext *)self _isCompactHeight];
    BOOL v4 = (double *)&kTHNoteCardBottomCardAngleCompactWidthCompactHeight;
    if (!v3) {
      BOOL v4 = (double *)&kTHNoteCardBottomCardAngleCompactWidthRegularHeight;
    }
  }
  else
  {
    BOOL v4 = (double *)&kTHNoteCardBottomCardAngleAnyWidthAnyHeight;
  }
  return *v4;
}

- (CGPoint)bottomCardOffset
{
  if ([(THNoteCardLayoutContext *)self _isCompactWidth]) {
    [(THNoteCardLayoutContext *)self _isCompactHeight];
  }

  TSDMultiplyPointScalar();
  result.y = v4;
  result.x = v3;
  return result;
}

@end