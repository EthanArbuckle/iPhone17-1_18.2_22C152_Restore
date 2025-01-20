@interface PFParallaxLayoutNumericTextOverlapParameters
- (double)bottomAreaHeight;
- (double)maxBottomOverlap;
- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4;
- (double)targetBottomOverlap;
@end

@implementation PFParallaxLayoutNumericTextOverlapParameters

- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4
{
  double result = a3.size.height * 4.0 / 3.0 * 0.2 / a3.size.width;
  if (a4) {
    return result + (1.0 - result) * 0.25;
  }
  return result;
}

- (double)maxBottomOverlap
{
  return 1.0;
}

- (double)targetBottomOverlap
{
  return 0.5;
}

- (double)bottomAreaHeight
{
  return 0.25;
}

@end