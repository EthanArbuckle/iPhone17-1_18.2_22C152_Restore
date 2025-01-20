@interface PPSentimentScoreEncoder
+ (char)encodeSentimentScore:(double)a3;
+ (double)decodeSentimentScore:(char)a3;
@end

@implementation PPSentimentScoreEncoder

+ (double)decodeSentimentScore:(char)a3
{
  return (double)a3 * 0.00787401575;
}

+ (char)encodeSentimentScore:(double)a3
{
  if (a3 < -1.0) {
    a3 = -1.0;
  }
  double v3 = a3 / 0.00787401575;
  BOOL v4 = a3 < 1.0;
  double v5 = 127.0;
  if (v4) {
    return (int)v3;
  }
  return (int)v5;
}

@end