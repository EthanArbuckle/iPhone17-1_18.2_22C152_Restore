@interface PXUIButtonConfiguration
+ (id)configurationWithCursorEffect:(int64_t)a3;
- (BOOL)allowAnimatedHighlighting;
- (PXUIButtonConfiguration)init;
- (UIEdgeInsets)hitTestOutset;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cursorEffect;
- (void)setAllowAnimatedHighlighting:(BOOL)a3;
- (void)setCursorEffect:(int64_t)a3;
- (void)setHitTestOutset:(UIEdgeInsets)a3;
@end

@implementation PXUIButtonConfiguration

- (void)setCursorEffect:(int64_t)a3
{
  self->_cursorEffect = a3;
}

- (int64_t)cursorEffect
{
  return self->_cursorEffect;
}

- (void)setAllowAnimatedHighlighting:(BOOL)a3
{
  self->_allowAnimatedHighlighting = a3;
}

- (BOOL)allowAnimatedHighlighting
{
  return self->_allowAnimatedHighlighting;
}

- (void)setHitTestOutset:(UIEdgeInsets)a3
{
  self->_hitTestOutset = a3;
}

- (UIEdgeInsets)hitTestOutset
{
  double top = self->_hitTestOutset.top;
  double left = self->_hitTestOutset.left;
  double bottom = self->_hitTestOutset.bottom;
  double right = self->_hitTestOutset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->_hitTestOutset.top;
  *(_OWORD *)((char *)result + 40) = *(_OWORD *)&self->_hitTestOutset.bottom;
  *(_OWORD *)((char *)result + 24) = v5;
  *((unsigned char *)result + 8) = self->_allowAnimatedHighlighting;
  *((void *)result + 2) = self->_cursorEffect;
  return result;
}

- (PXUIButtonConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXUIButtonConfiguration;
  id result = [(PXUIButtonConfiguration *)&v4 init];
  if (result)
  {
    long long v3 = *((_OWORD *)off_1E5DAAF08 + 1);
    *(_OWORD *)&result->_hitTestOutset.double top = *(_OWORD *)off_1E5DAAF08;
    *(_OWORD *)&result->_hitTestOutset.double bottom = v3;
    result->_allowAnimatedHighlighting = 0;
    result->_cursorEffect = 0;
  }
  return result;
}

+ (id)configurationWithCursorEffect:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setHitTestOutset:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  [v4 setCursorEffect:a3];
  return v4;
}

@end