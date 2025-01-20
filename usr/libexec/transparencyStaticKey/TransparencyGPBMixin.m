@interface TransparencyGPBMixin
+ (id)descriptor;
@end

@implementation TransparencyGPBMixin

+ (id)descriptor
{
  id result = (id)qword_1000A75B0;
  if (!qword_1000A75B0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBMixin messageName:@"Mixin" fileDescription:off_1000A6468 fields:&off_1000A6560 fieldCount:2 storageSize:24 flags:v3];
    qword_1000A75B0 = (uint64_t)result;
  }
  return result;
}

@end