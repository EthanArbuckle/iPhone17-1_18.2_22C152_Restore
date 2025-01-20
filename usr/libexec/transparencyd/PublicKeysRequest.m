@interface PublicKeysRequest
+ (id)descriptor;
@end

@implementation PublicKeysRequest

+ (id)descriptor
{
  id v2 = (id)qword_10032ED20;
  if (!qword_10032ED20)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PublicKeysRequest messageName:@"PublicKeysRequest" fileDescription:&unk_100324980 fields:&off_100324B98 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFEA];
    qword_10032ED20 = (uint64_t)v2;
  }
  return v2;
}

@end