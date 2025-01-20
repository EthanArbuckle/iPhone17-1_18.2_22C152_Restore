@interface TransparencyGPBBoolValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBoolValue

+ (id)descriptor
{
  id result = (id)qword_10032EC28;
  if (!qword_10032EC28)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBBoolValue messageName:@"BoolValue" fileDescription:off_100323D98 fields:&off_100323E50 fieldCount:1 storageSize:4 flags:v3];
    qword_10032EC28 = (uint64_t)result;
  }
  return result;
}

@end