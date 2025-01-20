@interface TransparencyGPBUInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt64Value

+ (id)descriptor
{
  id result = (id)qword_1001621D8;
  if (!qword_1001621D8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBUInt64Value messageName:@"UInt64Value" fileDescription:off_10015AE08 fields:&off_10015AE60 fieldCount:1 storageSize:16 flags:v3];
    qword_1001621D8 = (uint64_t)result;
  }
  return result;
}

@end