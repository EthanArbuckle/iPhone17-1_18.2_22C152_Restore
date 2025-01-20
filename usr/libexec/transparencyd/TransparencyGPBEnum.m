@interface TransparencyGPBEnum
+ (id)descriptor;
@end

@implementation TransparencyGPBEnum

+ (id)descriptor
{
  id result = (id)qword_10032EBD0;
  if (!qword_10032EBD0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEnum messageName:@"Enum" fileDescription:off_100323AE0 fields:&off_100323C38 fieldCount:5 storageSize:40 flags:v3];
    qword_10032EBD0 = (uint64_t)result;
  }
  return result;
}

@end