@interface _MFSecDataMessageStore
+ (Class)classForMimePart;
@end

@implementation _MFSecDataMessageStore

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

@end