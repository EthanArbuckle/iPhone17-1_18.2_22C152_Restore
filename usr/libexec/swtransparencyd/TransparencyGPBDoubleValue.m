@interface TransparencyGPBDoubleValue
+ (id)descriptor;
@end

@implementation TransparencyGPBDoubleValue

+ (id)descriptor
{
  id result = (id)qword_1001621C0;
  if (!qword_1001621C0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBDoubleValue messageName:@"DoubleValue" fileDescription:off_10015AE08 fields:&off_10015ADE8 fieldCount:1 storageSize:16 flags:v3];
    qword_1001621C0 = (uint64_t)result;
  }
  return result;
}

@end