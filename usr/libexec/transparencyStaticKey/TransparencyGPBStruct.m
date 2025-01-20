@interface TransparencyGPBStruct
+ (id)descriptor;
@end

@implementation TransparencyGPBStruct

+ (id)descriptor
{
  id result = (id)qword_1000A7620;
  if (!qword_1000A7620)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBStruct messageName:@"Struct" fileDescription:off_1000A69C8 fields:&off_1000A69A8 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7620 = (uint64_t)result;
  }
  return result;
}

@end