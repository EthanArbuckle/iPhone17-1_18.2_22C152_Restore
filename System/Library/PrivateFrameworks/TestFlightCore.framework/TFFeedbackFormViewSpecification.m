@interface TFFeedbackFormViewSpecification
+ (UIEdgeInsets)formCellInsetsInTraitEnvironment:(id)a3;
@end

@implementation TFFeedbackFormViewSpecification

+ (UIEdgeInsets)formCellInsetsInTraitEnvironment:(id)a3
{
  v3 = [a3 traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  double v5 = 20.0;
  if (v4 != 2) {
    double v5 = 16.0;
  }
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v5;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

@end