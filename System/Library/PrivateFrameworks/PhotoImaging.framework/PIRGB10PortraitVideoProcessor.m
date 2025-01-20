@interface PIRGB10PortraitVideoProcessor
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation PIRGB10PortraitVideoProcessor

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E268];
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (!a3) {
    return *MEMORY[0x1E4F1E268];
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PIRGB10PortraitVideoProcessor;
  return objc_msgSendSuper2(&v4, sel_formatForInputAtIndex_);
}

@end