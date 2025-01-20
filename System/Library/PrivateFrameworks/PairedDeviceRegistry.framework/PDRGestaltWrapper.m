@interface PDRGestaltWrapper
+ (BOOL)amCompanion;
+ (BOOL)isUIBuild;
+ (id)deviceClassString;
@end

@implementation PDRGestaltWrapper

+ (BOOL)isUIBuild
{
  return MEMORY[0x270F95FB8](@"IsUIBuild", a2);
}

+ (id)deviceClassString
{
  v2 = (void *)MGGetStringAnswer();
  return v2;
}

+ (BOOL)amCompanion
{
  return MEMORY[0x270F95FB8](@"watch-companion", a2);
}

@end