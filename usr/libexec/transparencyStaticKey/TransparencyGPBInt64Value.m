@interface TransparencyGPBInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt64Value

+ (id)descriptor
{
  id result = (id)qword_1000A7420;
  if (!qword_1000A7420)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBInt64Value messageName:@"Int64Value" fileDescription:off_1000A5748 fields:&off_1000A5780 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7420 = (uint64_t)result;
  }
  return result;
}

@end