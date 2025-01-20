@interface TransparencyGPBInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt64Value

+ (id)descriptor
{
  id result = (id)qword_1001621D0;
  if (!qword_1001621D0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBInt64Value messageName:@"Int64Value" fileDescription:off_10015AE08 fields:&off_10015AE40 fieldCount:1 storageSize:16 flags:v3];
    qword_1001621D0 = (uint64_t)result;
  }
  return result;
}

@end