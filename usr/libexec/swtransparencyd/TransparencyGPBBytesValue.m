@interface TransparencyGPBBytesValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBytesValue

+ (id)descriptor
{
  id result = (id)qword_100162200;
  if (!qword_100162200)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBBytesValue messageName:@"BytesValue" fileDescription:off_10015AE08 fields:&off_10015AF00 fieldCount:1 storageSize:16 flags:v3];
    qword_100162200 = (uint64_t)result;
  }
  return result;
}

@end