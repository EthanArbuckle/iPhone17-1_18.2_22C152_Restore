@interface UITextView(NCTextSupportingAdditions)
- (double)unui_drawingHeightWithNumberOfLines:()NCTextSupportingAdditions;
- (double)unui_measuringHeightWithNumberOfLines:()NCTextSupportingAdditions;
- (uint64_t)nc_numberOfLines;
- (uint64_t)unui_numberOfLinesInFrame:()NCTextSupportingAdditions maximum:drawingContext:;
- (void)nc_setNumberOfLines:()NCTextSupportingAdditions;
@end

@implementation UITextView(NCTextSupportingAdditions)

- (uint64_t)nc_numberOfLines
{
  v1 = [a1 textContainer];
  uint64_t v2 = [v1 maximumNumberOfLines];

  return v2;
}

- (void)nc_setNumberOfLines:()NCTextSupportingAdditions
{
  id v4 = [a1 textContainer];
  [v4 setMaximumNumberOfLines:a3];
}

- (uint64_t)unui_numberOfLinesInFrame:()NCTextSupportingAdditions maximum:drawingContext:
{
  id v14 = a8;
  v15 = [a1 font];
  v16 = [a1 text];
  uint64_t v17 = objc_msgSend(v15, "unui_numberOfLinesForText:inFrame:maximum:drawingContext:", v16, a7, v14, a2, a3, a4, a5);

  return v17;
}

- (double)unui_measuringHeightWithNumberOfLines:()NCTextSupportingAdditions
{
  v5 = [a1 font];
  v6 = [a1 text];
  objc_msgSend(v5, "unui_measuringHeightForText:withNumberOfLines:", v6, a3);
  double v8 = v7;

  return v8;
}

- (double)unui_drawingHeightWithNumberOfLines:()NCTextSupportingAdditions
{
  v5 = [a1 font];
  v6 = [a1 text];
  objc_msgSend(v5, "unui_drawingHeightForText:withNumberOfLines:additionalPadding:", v6, a3, 1.5);
  double v8 = v7;

  return v8;
}

@end