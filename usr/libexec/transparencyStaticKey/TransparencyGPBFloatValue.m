@interface TransparencyGPBFloatValue
+ (id)descriptor;
@end

@implementation TransparencyGPBFloatValue

+ (id)descriptor
{
  id result = (id)qword_1000A7418;
  if (!qword_1000A7418)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBFloatValue messageName:@"FloatValue" fileDescription:off_1000A5748 fields:&off_1000A5760 fieldCount:1 storageSize:8 flags:v3];
    qword_1000A7418 = (uint64_t)result;
  }
  return result;
}

@end