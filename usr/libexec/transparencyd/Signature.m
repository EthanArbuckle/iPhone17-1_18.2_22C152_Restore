@interface Signature
+ (id)descriptor;
@end

@implementation Signature

+ (id)descriptor
{
  id v2 = (id)qword_10032ED98;
  if (!qword_10032ED98)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:Signature messageName:@"Signature" fileDescription:&unk_100324E10 fields:&off_100324E68 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B32D];
    qword_10032ED98 = (uint64_t)v2;
  }
  return v2;
}

@end