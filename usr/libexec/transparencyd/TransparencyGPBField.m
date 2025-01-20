@interface TransparencyGPBField
+ (id)descriptor;
@end

@implementation TransparencyGPBField

+ (id)descriptor
{
  id v2 = (id)qword_10032EBC8;
  if (!qword_10032EBC8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBField messageName:@"Field" fileDescription:off_100323AE0 fields:&off_100323AF8 fieldCount:10 storageSize:64 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AEA8];
    qword_10032EBC8 = (uint64_t)v2;
  }
  return v2;
}

@end