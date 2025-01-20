@interface SUICArtworksManager
+ (double)FontWeightButton;
+ (double)FontWeightButtonSmall;
+ (double)FontWeightFooter;
+ (double)FontWeightMain;
+ (double)FontWeightProgress;
+ (double)FontWeightTitle;
@end

@implementation SUICArtworksManager

+ (double)FontWeightTitle
{
  return *MEMORY[0x1E4FB09C8];
}

+ (double)FontWeightMain
{
  return *MEMORY[0x1E4FB09D8];
}

+ (double)FontWeightFooter
{
  return *MEMORY[0x1E4FB09D8];
}

+ (double)FontWeightProgress
{
  return *MEMORY[0x1E4FB09B8];
}

+ (double)FontWeightButton
{
  return *MEMORY[0x1E4FB09D8];
}

+ (double)FontWeightButtonSmall
{
  return *MEMORY[0x1E4FB09D8];
}

@end