@interface UILabel(NCTextSupportingAdditions)
- (double)unui_drawingHeightWithNumberOfLines:()NCTextSupportingAdditions;
- (double)unui_measuringHeightWithNumberOfLines:()NCTextSupportingAdditions;
- (uint64_t)unui_numberOfLinesInFrame:()NCTextSupportingAdditions maximum:drawingContext:;
@end

@implementation UILabel(NCTextSupportingAdditions)

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
  objc_msgSend(v5, "unui_drawingHeightForText:withNumberOfLines:additionalPadding:", v6, a3, 2.0);
  double v8 = v7;

  return v8;
}

@end