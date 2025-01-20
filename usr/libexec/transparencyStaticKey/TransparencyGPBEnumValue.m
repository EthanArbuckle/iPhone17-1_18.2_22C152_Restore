@interface TransparencyGPBEnumValue
+ (id)descriptor;
@end

@implementation TransparencyGPBEnumValue

+ (id)descriptor
{
  id result = (id)qword_1000A7578;
  if (!qword_1000A7578)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEnumValue messageName:@"EnumValue" fileDescription:off_1000A5F70 fields:&off_1000A6168 fieldCount:3 storageSize:24 flags:v3];
    qword_1000A7578 = (uint64_t)result;
  }
  return result;
}

@end