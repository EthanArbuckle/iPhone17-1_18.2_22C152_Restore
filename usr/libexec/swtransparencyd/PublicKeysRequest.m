@interface PublicKeysRequest
+ (id)descriptor;
@end

@implementation PublicKeysRequest

+ (id)descriptor
{
  id v2 = (id)qword_10015B2A0;
  if (!qword_10015B2A0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PublicKeysRequest messageName:@"PublicKeysRequest" fileDescription:&unk_100156778 fields:&off_100156990 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A2D2];
    qword_10015B2A0 = (uint64_t)v2;
  }
  return v2;
}

@end