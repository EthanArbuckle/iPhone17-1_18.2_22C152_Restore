@interface TransparencyGPBOption
+ (id)descriptor;
@end

@implementation TransparencyGPBOption

+ (id)descriptor
{
  id result = (id)qword_10032EBE0;
  if (!qword_10032EBE0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBOption messageName:@"Option" fileDescription:off_100323AE0 fields:&off_100323D38 fieldCount:2 storageSize:24 flags:v3];
    qword_10032EBE0 = (uint64_t)result;
  }
  return result;
}

@end