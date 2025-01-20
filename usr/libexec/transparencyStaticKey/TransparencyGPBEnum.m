@interface TransparencyGPBEnum
+ (id)descriptor;
@end

@implementation TransparencyGPBEnum

+ (id)descriptor
{
  id result = (id)qword_1000A7570;
  if (!qword_1000A7570)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEnum messageName:@"Enum" fileDescription:off_1000A5F70 fields:&off_1000A60C8 fieldCount:5 storageSize:40 flags:v3];
    qword_1000A7570 = (uint64_t)result;
  }
  return result;
}

@end