@interface TransparencyGPBStringValue
+ (id)descriptor;
@end

@implementation TransparencyGPBStringValue

+ (id)descriptor
{
  id result = (id)qword_10032EC30;
  if (!qword_10032EC30)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBStringValue messageName:@"StringValue" fileDescription:off_100323D98 fields:&off_100323E70 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EC30 = (uint64_t)result;
  }
  return result;
}

@end