@interface TransparencyGPBEmpty
+ (id)descriptor;
@end

@implementation TransparencyGPBEmpty

+ (id)descriptor
{
  id result = (id)qword_10032EB40;
  if (!qword_10032EB40)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEmpty messageName:@"Empty" fileDescription:off_100323760 fields:0 fieldCount:0 storageSize:4 flags:v3];
    qword_10032EB40 = (uint64_t)result;
  }
  return result;
}

@end