@interface SHListeningMediaTimingFunctionProvider
+ (id)inOutQuartMediaTimingFunction;
+ (id)inOutSineMediaTimingFunction;
@end

@implementation SHListeningMediaTimingFunctionProvider

+ (id)inOutSineMediaTimingFunction
{
  LODWORD(v2) = 1054951342;
  LODWORD(v3) = 1028443341;
  LODWORD(v4) = 1057803469;
  LODWORD(v5) = 1064514355;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :v3 :v4 :v5];
}

+ (id)inOutQuartMediaTimingFunction
{
  LODWORD(v2) = 1054951342;
  LODWORD(v3) = 1028443341;
  LODWORD(v4) = 1057803469;
  LODWORD(v5) = 1064514355;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :v3 :v4 :v5];
}

@end