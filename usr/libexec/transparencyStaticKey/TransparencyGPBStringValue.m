@interface TransparencyGPBStringValue
+ (id)descriptor;
@end

@implementation TransparencyGPBStringValue

+ (id)descriptor
{
  id result = (id)qword_1000A7448;
  if (!qword_1000A7448)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBStringValue messageName:@"StringValue" fileDescription:off_1000A5748 fields:&off_1000A5820 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7448 = (uint64_t)result;
  }
  return result;
}

@end