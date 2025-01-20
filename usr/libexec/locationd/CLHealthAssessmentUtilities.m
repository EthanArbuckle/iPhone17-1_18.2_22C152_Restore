@interface CLHealthAssessmentUtilities
+ (void)limitStart:(double *)a3 andEnd:(double *)a4 maxDuration:(double)a5 from:(double)a6;
@end

@implementation CLHealthAssessmentUtilities

+ (void)limitStart:(double *)a3 andEnd:(double *)a4 maxDuration:(double)a5 from:(double)a6
{
  double v6 = a6 - a5;
  *a3 = fmax(*a3, v6);
  *a4 = fmax(*a4, v6);
}

@end