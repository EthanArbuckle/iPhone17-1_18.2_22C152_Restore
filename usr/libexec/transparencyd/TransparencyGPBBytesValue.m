@interface TransparencyGPBBytesValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBytesValue

+ (id)descriptor
{
  id result = (id)qword_10032EC38;
  if (!qword_10032EC38)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBBytesValue messageName:@"BytesValue" fileDescription:off_100323D98 fields:&off_100323E90 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EC38 = (uint64_t)result;
  }
  return result;
}

@end