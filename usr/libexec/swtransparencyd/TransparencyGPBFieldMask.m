@interface TransparencyGPBFieldMask
+ (id)descriptor;
@end

@implementation TransparencyGPBFieldMask

+ (id)descriptor
{
  id result = (id)qword_100162110;
  if (!qword_100162110)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBFieldMask messageName:@"FieldMask" fileDescription:off_10015A7A8 fields:&off_10015A788 fieldCount:1 storageSize:16 flags:v3];
    qword_100162110 = (uint64_t)result;
  }
  return result;
}

@end