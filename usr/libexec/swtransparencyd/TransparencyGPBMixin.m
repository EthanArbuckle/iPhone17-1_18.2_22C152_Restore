@interface TransparencyGPBMixin
+ (id)descriptor;
@end

@implementation TransparencyGPBMixin

+ (id)descriptor
{
  id result = (id)qword_100162220;
  if (!qword_100162220)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBMixin messageName:@"Mixin" fileDescription:off_10015B058 fields:&off_10015B150 fieldCount:2 storageSize:24 flags:v3];
    qword_100162220 = (uint64_t)result;
  }
  return result;
}

@end