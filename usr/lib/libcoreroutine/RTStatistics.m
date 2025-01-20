@interface RTStatistics
+ (double)betaDistributionCdfAtX:(double)a3 paramA:(double)a4 paramB:(double)a5;
+ (double)calculateModelConfidenceWithCorrectPredictions:(double)a3 incorrectPredictions:(double)a4;
+ (double)calculateModelConfidenceWithCorrectPredictions:(double)a3 incorrectPredictions:(double)a4 iterations:(unint64_t)a5 minimumConfidence:(double)a6;
@end

@implementation RTStatistics

+ (double)calculateModelConfidenceWithCorrectPredictions:(double)a3 incorrectPredictions:(double)a4
{
  +[RTStatistics calculateModelConfidenceWithCorrectPredictions:20 incorrectPredictions:a3 iterations:a4 minimumConfidence:0.95];
  return result;
}

+ (double)calculateModelConfidenceWithCorrectPredictions:(double)a3 incorrectPredictions:(double)a4 iterations:(unint64_t)a5 minimumConfidence:(double)a6
{
  if (!a5) {
    return 0.5;
  }
  unint64_t v7 = a5;
  double v10 = 0.0;
  double v11 = 1.0;
  do
  {
    +[RTStatistics betaDistributionCdfAtX:(v10 + v11) * 0.5 paramA:a3 paramB:a4];
    if (1.0 - v12 >= a6) {
      double v10 = (v10 + v11) * 0.5;
    }
    else {
      double v11 = (v10 + v11) * 0.5;
    }
    --v7;
  }
  while (v7);
  return (v11 + v10) * 0.5;
}

+ (double)betaDistributionCdfAtX:(double)a3 paramA:(double)a4 paramB:(double)a5
{
  double i = -1.0;
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    double i = 0.0;
    if (a3 != 0.0)
    {
      double i = 1.0;
      if (a3 != 1.0)
      {
        double v10 = 0.0005;
        for (i = 0.0; v10 <= a3; double v10 = v10 + 0.001)
        {
          double v11 = log(v10);
          long double v12 = log(1.0 - v10);
          double i = i + exp((a5 + -1.0) * v12 + (a4 + -1.0) * v11) * 0.001;
        }
      }
    }
  }
  double v13 = lgamma(a4);
  long double v14 = v13 + lgamma(a5);
  long double v15 = lgamma(a4 + a5);
  double result = i / exp(v14 - v15);
  if (result > 1.0) {
    double result = 1.0;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

@end