@interface TransparencyGPBEnumValue
+ (id)descriptor;
@end

@implementation TransparencyGPBEnumValue

+ (id)descriptor
{
  id result = (id)qword_1001621A0;
  if (!qword_1001621A0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEnumValue messageName:@"EnumValue" fileDescription:off_10015AB50 fields:&off_10015AD48 fieldCount:3 storageSize:24 flags:v3];
    qword_1001621A0 = (uint64_t)result;
  }
  return result;
}

@end