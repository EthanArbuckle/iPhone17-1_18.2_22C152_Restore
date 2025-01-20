@interface QueryRequest
+ (id)descriptor;
@end

@implementation QueryRequest

+ (id)descriptor
{
  id v2 = (id)qword_10032EE98;
  if (!qword_10032EE98)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:QueryRequest messageName:@"QueryRequest" fileDescription:&unk_100325780 fields:&off_100325700 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3E8];
    qword_10032EE98 = (uint64_t)v2;
  }
  return v2;
}

@end