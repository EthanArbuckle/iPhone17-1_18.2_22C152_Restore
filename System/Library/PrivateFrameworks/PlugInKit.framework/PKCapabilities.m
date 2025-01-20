@interface PKCapabilities
+ (BOOL)supportsAutoreleasePoolDuringPlugInLaunch;
+ (id)frameworkQueueAttr;
@end

@implementation PKCapabilities

+ (id)frameworkQueueAttr
{
  return 0;
}

+ (BOOL)supportsAutoreleasePoolDuringPlugInLaunch
{
  return MEMORY[0x1F40CBEC8](0x7E20901FFFFFFFFLL, a2);
}

@end