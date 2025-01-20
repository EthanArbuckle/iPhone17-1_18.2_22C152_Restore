@interface ConsistencyProofResponse
+ (id)descriptor;
@end

@implementation ConsistencyProofResponse

+ (id)descriptor
{
  id v2 = (id)qword_10015B280;
  if (!qword_10015B280)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ConsistencyProofResponse messageName:@"ConsistencyProofResponse" fileDescription:&unk_100156778 fields:&off_1001567D0 fieldCount:4 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A2B0];
    qword_10015B280 = (uint64_t)v2;
  }
  return v2;
}

@end