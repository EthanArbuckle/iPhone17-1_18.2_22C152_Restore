@interface UIView(SKUIContextActions)
- (double)defaultPresentationPosition;
@end

@implementation UIView(SKUIContextActions)

- (double)defaultPresentationPosition
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v2 = [a1 _collectionView];
  NSSelectorFromString(&cfstr_Currenttouch.isa);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_5:
    [a1 bounds];
    return v9;
  }
  v3 = [v2 _currentTouch];
  [v3 locationInView:a1];
  CGFloat v5 = v4;
  CGFloat v7 = v6;

  v11.size.width = *(CGFloat *)MEMORY[0x1E4F1DB30];
  v11.size.height = *(CGFloat *)(MEMORY[0x1E4F1DB30] + 8);
  v11.origin.x = v5;
  v11.origin.y = v7;
  *(void *)&double v8 = (unint64_t)CGRectInset(v11, -20.0, -20.0);

  return v8;
}

@end