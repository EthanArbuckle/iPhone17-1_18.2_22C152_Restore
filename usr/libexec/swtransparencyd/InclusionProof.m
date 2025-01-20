@interface InclusionProof
+ (id)descriptor;
@end

@implementation InclusionProof

+ (id)descriptor
{
  id v2 = (id)qword_10015B230;
  if (!qword_10015B230)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:InclusionProof messageName:@"InclusionProof" fileDescription:&unk_1001560A0 fields:&off_1001564D8 fieldCount:4 storageSize:40 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A263];
    qword_10015B230 = (uint64_t)v2;
  }
  return v2;
}

@end