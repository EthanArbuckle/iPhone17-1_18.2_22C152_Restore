@interface TSWPInteriorTextWrapController
+ (id)sharedInteriorTextWrapController;
- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5;
- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5;
- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9;
@end

@implementation TSWPInteriorTextWrapController

+ (id)sharedInteriorTextWrapController
{
  id result = (id)+[TSWPInteriorTextWrapController sharedInteriorTextWrapController]::sSharedInstance;
  if (!+[TSWPInteriorTextWrapController sharedInteriorTextWrapController]::sSharedInstance)
  {
    id result = objc_alloc_init((Class)a1);
    +[TSWPInteriorTextWrapController sharedInteriorTextWrapController]::sSharedInstance = (uint64_t)result;
  }
  return result;
}

- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5
{
  v8 = objc_alloc_init(TSWPInteriorCookie);
  objc_opt_class();
  [a4 parent];
  [(TSWPInteriorCookie *)v8 setLayout:TSUDynamicCast()];
  [(TSWPInteriorCookie *)v8 setColumn:a3];
  *a5 = 1;
  return v8;
}

- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *a8 = 1.0;
  objc_opt_class();
  v14 = (void *)TSUDynamicCast();
  if (!v14) {
    return 1;
  }
  v15 = (void *)[v14 layout];

  return objc_msgSend(v15, "cropLine:lineSegmentRects:", a4, x, y, width, height);
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  return 0.0;
}

@end