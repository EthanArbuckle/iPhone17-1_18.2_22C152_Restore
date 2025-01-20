@interface UIPrintLabelTappableLinkGestureRecognizer
- (BOOL)didTapAttributedTextInLabel:(id)a3 inRange:(_NSRange)a4;
@end

@implementation UIPrintLabelTappableLinkGestureRecognizer

- (BOOL)didTapAttributedTextInLabel:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4FB1370]);
  id v13 = objc_alloc(MEMORY[0x1E4FB13A0]);
  v14 = objc_msgSend(v13, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  id v15 = objc_alloc(MEMORY[0x1E4FB13A8]);
  v16 = [v7 attributedText];
  v17 = (void *)[v15 initWithAttributedString:v16];

  [v12 addTextContainer:v14];
  [v17 addLayoutManager:v12];
  [v14 setLineFragmentPadding:0.0];
  objc_msgSend(v14, "setLineBreakMode:", objc_msgSend(v7, "lineBreakMode"));
  objc_msgSend(v14, "setMaximumNumberOfLines:", objc_msgSend(v7, "numberOfLines"));
  objc_msgSend(v14, "setSize:", v9, v11);
  [(UIPrintLabelTappableLinkGestureRecognizer *)self locationInView:v7];
  double v19 = v18;
  double v21 = v20;

  [v12 usedRectForTextContainer:v14];
  unint64_t v26 = objc_msgSend(v12, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v14, 0, v19 - -(v23 - (v9 - v22) * 0.5), v21 - -(v25 - (v11 - v24) * 0.5));
  BOOL v28 = v26 >= location && v26 - location < length;

  return v28;
}

@end