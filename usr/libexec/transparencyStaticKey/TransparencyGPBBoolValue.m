@interface TransparencyGPBBoolValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBoolValue

+ (id)descriptor
{
  id result = (id)qword_1000A7440;
  if (!qword_1000A7440)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBBoolValue messageName:@"BoolValue" fileDescription:off_1000A5748 fields:&off_1000A5800 fieldCount:1 storageSize:4 flags:v3];
    qword_1000A7440 = (uint64_t)result;
  }
  return result;
}

@end