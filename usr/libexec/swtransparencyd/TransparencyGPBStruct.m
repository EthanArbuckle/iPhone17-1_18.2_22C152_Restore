@interface TransparencyGPBStruct
+ (id)descriptor;
@end

@implementation TransparencyGPBStruct

+ (id)descriptor
{
  id result = (id)qword_100162150;
  if (!qword_100162150)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBStruct messageName:@"Struct" fileDescription:off_10015A938 fields:&off_10015A918 fieldCount:1 storageSize:16 flags:v3];
    qword_100162150 = (uint64_t)result;
  }
  return result;
}

@end