@interface TransparencyGPBType
+ (id)descriptor;
@end

@implementation TransparencyGPBType

+ (id)descriptor
{
  id result = (id)qword_10032EBC0;
  if (!qword_10032EBC0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBType messageName:@"Type" fileDescription:off_100323AE0 fields:&off_100323A20 fieldCount:6 storageSize:48 flags:v3];
    qword_10032EBC0 = (uint64_t)result;
  }
  return result;
}

@end