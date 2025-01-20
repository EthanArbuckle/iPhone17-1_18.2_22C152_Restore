@interface TransparencyGPBStruct
+ (id)descriptor;
@end

@implementation TransparencyGPBStruct

+ (id)descriptor
{
  id result = (id)qword_10032EB88;
  if (!qword_10032EB88)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBStruct messageName:@"Struct" fileDescription:off_1003238C8 fields:&off_1003238A8 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EB88 = (uint64_t)result;
  }
  return result;
}

@end