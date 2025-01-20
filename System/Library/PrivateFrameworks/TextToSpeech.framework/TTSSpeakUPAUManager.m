@interface TTSSpeakUPAUManager
+ (AudioComponentDescription)component;
+ (void)registerAU;
@end

@implementation TTSSpeakUPAUManager

+ (AudioComponentDescription)component
{
  return result;
}

+ (void)registerAU
{
  *(_OWORD *)&v2.componentType = xmmword_1A689D7D0;
  v2.componentFlagsMask = 0;
  AudioComponentRegister(&v2, @"SPEECH ENHANCER", 0, (AudioComponentFactoryFunction)sub_1A6720934);
}

@end