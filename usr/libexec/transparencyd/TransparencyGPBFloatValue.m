@interface TransparencyGPBFloatValue
+ (id)descriptor;
@end

@implementation TransparencyGPBFloatValue

+ (id)descriptor
{
  id result = (id)qword_10032EC00;
  if (!qword_10032EC00)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBFloatValue messageName:@"FloatValue" fileDescription:off_100323D98 fields:&off_100323DB0 fieldCount:1 storageSize:8 flags:v3];
    qword_10032EC00 = (uint64_t)result;
  }
  return result;
}

@end