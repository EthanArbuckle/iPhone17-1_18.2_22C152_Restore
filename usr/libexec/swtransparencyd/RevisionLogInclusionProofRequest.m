@interface RevisionLogInclusionProofRequest
+ (id)descriptor;
@end

@implementation RevisionLogInclusionProofRequest

+ (id)descriptor
{
  id v2 = (id)qword_10015B290;
  if (!qword_10015B290)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:RevisionLogInclusionProofRequest messageName:@"RevisionLogInclusionProofRequest" fileDescription:&unk_100156778 fields:&off_1001568B0 fieldCount:4 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A2CD];
    qword_10015B290 = (uint64_t)v2;
  }
  return v2;
}

@end