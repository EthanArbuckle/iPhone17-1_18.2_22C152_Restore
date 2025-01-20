@interface TransparencyGPBFloatValue
+ (id)descriptor;
@end

@implementation TransparencyGPBFloatValue

+ (id)descriptor
{
  id result = (id)qword_1001621C8;
  if (!qword_1001621C8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBFloatValue messageName:@"FloatValue" fileDescription:off_10015AE08 fields:&off_10015AE20 fieldCount:1 storageSize:8 flags:v3];
    qword_1001621C8 = (uint64_t)result;
  }
  return result;
}

@end