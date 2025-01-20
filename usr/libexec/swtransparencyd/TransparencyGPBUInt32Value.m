@interface TransparencyGPBUInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt32Value

+ (id)descriptor
{
  id result = (id)qword_1001621E8;
  if (!qword_1001621E8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBUInt32Value messageName:@"UInt32Value" fileDescription:off_10015AE08 fields:&off_10015AEA0 fieldCount:1 storageSize:8 flags:v3];
    qword_1001621E8 = (uint64_t)result;
  }
  return result;
}

@end