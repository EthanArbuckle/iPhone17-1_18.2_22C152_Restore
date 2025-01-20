@interface TSSKUI
+ (id)fontMetricsSection1;
@end

@implementation TSSKUI

+ (id)fontMetricsSection1
{
  return (id)[MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2930]];
}

@end