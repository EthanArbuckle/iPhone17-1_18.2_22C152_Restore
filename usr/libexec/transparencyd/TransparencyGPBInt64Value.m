@interface TransparencyGPBInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt64Value

+ (id)descriptor
{
  id result = (id)qword_10032EC08;
  if (!qword_10032EC08)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBInt64Value messageName:@"Int64Value" fileDescription:off_100323D98 fields:&off_100323DD0 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EC08 = (uint64_t)result;
  }
  return result;
}

@end