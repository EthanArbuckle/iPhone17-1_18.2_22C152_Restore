@interface TransparencyGPBType
+ (id)descriptor;
@end

@implementation TransparencyGPBType

+ (id)descriptor
{
  id result = (id)qword_1000A7560;
  if (!qword_1000A7560)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBType messageName:@"Type" fileDescription:off_1000A5F70 fields:&off_1000A5EB0 fieldCount:6 storageSize:48 flags:v3];
    qword_1000A7560 = (uint64_t)result;
  }
  return result;
}

@end