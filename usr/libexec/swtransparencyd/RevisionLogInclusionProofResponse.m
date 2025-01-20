@interface RevisionLogInclusionProofResponse
+ (id)descriptor;
@end

@implementation RevisionLogInclusionProofResponse

+ (id)descriptor
{
  id v2 = (id)qword_10015B298;
  if (!qword_10015B298)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:RevisionLogInclusionProofResponse messageName:@"RevisionLogInclusionProofResponse" fileDescription:&unk_100156778 fields:&off_100156930 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A330];
    qword_10015B298 = (uint64_t)v2;
  }
  return v2;
}

@end