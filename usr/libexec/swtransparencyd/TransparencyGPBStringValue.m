@interface TransparencyGPBStringValue
+ (id)descriptor;
@end

@implementation TransparencyGPBStringValue

+ (id)descriptor
{
  id result = (id)qword_1001621F8;
  if (!qword_1001621F8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBStringValue messageName:@"StringValue" fileDescription:off_10015AE08 fields:&off_10015AEE0 fieldCount:1 storageSize:16 flags:v3];
    qword_1001621F8 = (uint64_t)result;
  }
  return result;
}

@end