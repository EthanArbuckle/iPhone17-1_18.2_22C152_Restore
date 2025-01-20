@interface UIImage
- (CGRect)bk_frameForImageFittedInFrame:(CGRect)a3;
@end

@implementation UIImage

- (CGRect)bk_frameForImageFittedInFrame:(CGRect)a3
{
  v3 = self;
  [(UIImage *)v3 size];
  CGRectMakeWithSize();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UIImage *)v3 alignmentRectInsets];
  sub_1002AF2CC(v5, v7, v9, v11, v12, v13);
  BCNormalizedInsetsForRects();
  CGRectFitRectInRectAbsoluteNoRounding();
  BCRectByApplyingNormalizedInsets();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

@end