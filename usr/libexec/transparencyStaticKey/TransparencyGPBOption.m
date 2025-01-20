@interface TransparencyGPBOption
+ (id)descriptor;
@end

@implementation TransparencyGPBOption

+ (id)descriptor
{
  id result = (id)qword_1000A7580;
  if (!qword_1000A7580)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBOption messageName:@"Option" fileDescription:off_1000A5F70 fields:&off_1000A61C8 fieldCount:2 storageSize:24 flags:v3];
    qword_1000A7580 = (uint64_t)result;
  }
  return result;
}

@end