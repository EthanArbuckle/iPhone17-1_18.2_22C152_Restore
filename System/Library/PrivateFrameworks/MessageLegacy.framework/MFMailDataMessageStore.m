@interface MFMailDataMessageStore
+ (Class)classForMimePart;
@end

@implementation MFMailDataMessageStore

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

@end