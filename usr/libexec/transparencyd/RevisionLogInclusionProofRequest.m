@interface RevisionLogInclusionProofRequest
+ (id)descriptor;
@end

@implementation RevisionLogInclusionProofRequest

+ (id)descriptor
{
  id v2 = (id)qword_10032ED10;
  if (!qword_10032ED10)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:RevisionLogInclusionProofRequest messageName:@"RevisionLogInclusionProofRequest" fileDescription:&unk_100324980 fields:&off_100324AB8 fieldCount:4 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFE5];
    qword_10032ED10 = (uint64_t)v2;
  }
  return v2;
}

@end