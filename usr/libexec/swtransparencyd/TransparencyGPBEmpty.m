@interface TransparencyGPBEmpty
+ (id)descriptor;
@end

@implementation TransparencyGPBEmpty

+ (id)descriptor
{
  id result = (id)qword_100162108;
  if (!qword_100162108)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEmpty messageName:@"Empty" fileDescription:off_10015A710 fields:0 fieldCount:0 storageSize:4 flags:v3];
    qword_100162108 = (uint64_t)result;
  }
  return result;
}

@end