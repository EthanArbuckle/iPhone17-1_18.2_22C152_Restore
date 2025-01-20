@interface UITextView(NowPlayingInfoViewAdditions)
- (double)infoview_computedHeight;
@end

@implementation UITextView(NowPlayingInfoViewAdditions)

- (double)infoview_computedHeight
{
  [a1 textContainerInset];
  double v3 = v2;
  double v5 = v4;
  [a1 contentInset];
  double v7 = v6;
  double v9 = v8;
  [a1 frame];
  CGFloat v10 = CGRectGetWidth(v21) - v3 - v5;
  v11 = [a1 textContainer];
  [v11 lineFragmentPadding];
  CGFloat v13 = v10 + v12 * -2.0 - v7 - v9;

  v14 = [a1 attributedText];
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 3, 0, v13, 1.79769313e308);
  double v16 = v15;

  [a1 textContainerInset];
  double v18 = v16 + v17;
  [a1 textContainerInset];
  return ceil(v18 + v19);
}

@end