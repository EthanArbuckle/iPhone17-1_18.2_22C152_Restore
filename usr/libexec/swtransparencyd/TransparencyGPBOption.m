@interface TransparencyGPBOption
+ (id)descriptor;
@end

@implementation TransparencyGPBOption

+ (id)descriptor
{
  id result = (id)qword_1001621A8;
  if (!qword_1001621A8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBOption messageName:@"Option" fileDescription:off_10015AB50 fields:&off_10015ADA8 fieldCount:2 storageSize:24 flags:v3];
    qword_1001621A8 = (uint64_t)result;
  }
  return result;
}

@end