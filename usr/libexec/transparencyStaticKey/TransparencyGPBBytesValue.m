@interface TransparencyGPBBytesValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBytesValue

+ (id)descriptor
{
  id result = (id)qword_1000A7450;
  if (!qword_1000A7450)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBBytesValue messageName:@"BytesValue" fileDescription:off_1000A5748 fields:&off_1000A5840 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7450 = (uint64_t)result;
  }
  return result;
}

@end