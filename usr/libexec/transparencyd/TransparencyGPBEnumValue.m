@interface TransparencyGPBEnumValue
+ (id)descriptor;
@end

@implementation TransparencyGPBEnumValue

+ (id)descriptor
{
  id result = (id)qword_10032EBD8;
  if (!qword_10032EBD8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEnumValue messageName:@"EnumValue" fileDescription:off_100323AE0 fields:&off_100323CD8 fieldCount:3 storageSize:24 flags:v3];
    qword_10032EBD8 = (uint64_t)result;
  }
  return result;
}

@end