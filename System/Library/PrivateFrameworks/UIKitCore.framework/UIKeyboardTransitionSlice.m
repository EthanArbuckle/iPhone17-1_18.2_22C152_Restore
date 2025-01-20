@interface UIKeyboardTransitionSlice
+ (UIKeyboardTransitionSlice)sliceWithStart:(CGRect)a3 end:(CGRect)a4;
- (BOOL)delayCrossfade;
- (BOOL)hasGeometry;
- (CGRect)endRect;
- (CGRect)startRect;
- (UIKBCacheToken)endToken;
- (UIKBCacheToken)startToken;
- (UIKeyboardTransitionSlice)init;
- (id)description;
- (int)normalization;
- (void)addStartRect:(CGRect)a3 end:(CGRect)a4;
- (void)setDelayCrossfade:(BOOL)a3;
- (void)setEndRect:(CGRect)a3;
- (void)setEndToken:(id)a3;
- (void)setNormalization:(int)a3;
- (void)setStartRect:(CGRect)a3;
- (void)setStartToken:(id)a3;
@end

@implementation UIKeyboardTransitionSlice

- (UIKeyboardTransitionSlice)init
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardTransitionSlice;
  v2 = [(UIKeyboardTransitionSlice *)&v10 init];
  v3 = (UIKeyboardTransitionSlice *)v2;
  if (v2)
  {
    long long v4 = *MEMORY[0x1E4F1DB20];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v2 + 24) = v5;
    *(_OWORD *)(v2 + 40) = v4;
    *(_OWORD *)(v2 + 56) = v5;
    v6 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = 0;

    endToken = v3->_endToken;
    v3->_endToken = 0;

    v3->_normalization = 0;
    v3->_delayCrossfade = 0;
    v8 = v3;
  }

  return v3;
}

+ (UIKeyboardTransitionSlice)sliceWithStart:(CGRect)a3 end:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  id v12 = objc_alloc_init((Class)a1);
  objc_msgSend(v12, "setStartRect:", v11, v10, v9, v8);
  objc_msgSend(v12, "setEndRect:", x, y, width, height);
  return (UIKeyboardTransitionSlice *)v12;
}

- (void)addStartRect:(CGRect)a3 end:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  self->_startRect = CGRectUnion(self->_startRect, a3);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  self->_endRect = CGRectUnion(self->_endRect, v9);
}

- (BOOL)hasGeometry
{
  return !CGRectIsNull(self->_startRect);
}

- (id)description
{
  v3 = NSString;
  long long v4 = NSStringFromCGRect(self->_startRect);
  long long v5 = NSStringFromCGRect(self->_endRect);
  v6 = [v3 stringWithFormat:@"%@ : %@", v4, v5];

  return v6;
}

- (CGRect)startRect
{
  objc_copyStruct(v6, &self->_startRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setStartRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_startRect, &v3, 32, 1, 0);
}

- (CGRect)endRect
{
  objc_copyStruct(v6, &self->_endRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setEndRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_endRect, &v3, 32, 1, 0);
}

- (UIKBCacheToken)startToken
{
  return (UIKBCacheToken *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStartToken:(id)a3
{
}

- (UIKBCacheToken)endToken
{
  return (UIKBCacheToken *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEndToken:(id)a3
{
}

- (int)normalization
{
  return self->_normalization;
}

- (void)setNormalization:(int)a3
{
  self->_normalization = a3;
}

- (BOOL)delayCrossfade
{
  return self->_delayCrossfade;
}

- (void)setDelayCrossfade:(BOOL)a3
{
  self->_delayCrossfade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endToken, 0);
  objc_storeStrong((id *)&self->_startToken, 0);
}

@end