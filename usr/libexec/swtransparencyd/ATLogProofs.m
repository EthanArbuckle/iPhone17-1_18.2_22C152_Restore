@interface ATLogProofs
+ (id)descriptor;
@end

@implementation ATLogProofs

+ (id)descriptor
{
  id v2 = (id)qword_10015B308;
  if (!qword_10015B308)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ATLogProofs messageName:@"ATLogProofs" fileDescription:&unk_100156BD0 fields:&off_100156C88 fieldCount:2 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A3D8];
    qword_10015B308 = (uint64_t)v2;
  }
  return v2;
}

@end