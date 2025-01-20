@interface TransparencyGPBMixin
+ (id)descriptor;
@end

@implementation TransparencyGPBMixin

+ (id)descriptor
{
  id result = (id)qword_10032EC58;
  if (!qword_10032EC58)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBMixin messageName:@"Mixin" fileDescription:off_100323FE8 fields:&off_1003240E0 fieldCount:2 storageSize:24 flags:v3];
    qword_10032EC58 = (uint64_t)result;
  }
  return result;
}

@end