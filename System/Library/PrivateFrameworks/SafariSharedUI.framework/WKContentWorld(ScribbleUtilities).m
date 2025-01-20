@interface WKContentWorld(ScribbleUtilities)
+ (uint64_t)safari_worldForScribbleScript;
@end

@implementation WKContentWorld(ScribbleUtilities)

+ (uint64_t)safari_worldForScribbleScript
{
  return [MEMORY[0x1E4F46678] worldWithName:@"safari-scribble"];
}

@end