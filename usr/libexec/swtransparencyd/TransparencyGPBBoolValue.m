@interface TransparencyGPBBoolValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBoolValue

+ (id)descriptor
{
  id result = (id)qword_1001621F0;
  if (!qword_1001621F0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBBoolValue messageName:@"BoolValue" fileDescription:off_10015AE08 fields:&off_10015AEC0 fieldCount:1 storageSize:4 flags:v3];
    qword_1001621F0 = (uint64_t)result;
  }
  return result;
}

@end