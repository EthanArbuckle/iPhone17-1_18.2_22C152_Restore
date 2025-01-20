@interface TSDMutableExteriorTextWrap
- (void)setAlphaThreshold:(double)a3;
- (void)setDirection:(int)a3;
- (void)setFitType:(int)a3;
- (void)setIsHTMLWrap:(BOOL)a3;
- (void)setMargin:(double)a3;
- (void)setType:(int)a3;
@end

@implementation TSDMutableExteriorTextWrap

- (void)setIsHTMLWrap:(BOOL)a3
{
  self->super._isHTMLWrap = a3;
}

- (void)setType:(int)a3
{
  self->super._type = a3;
}

- (void)setDirection:(int)a3
{
  self->super._direction = a3;
}

- (void)setFitType:(int)a3
{
  self->super._fitType = a3;
}

- (void)setMargin:(double)a3
{
  self->super._margin = a3;
}

- (void)setAlphaThreshold:(double)a3
{
  self->super._alphaThreshold = a3;
}

@end