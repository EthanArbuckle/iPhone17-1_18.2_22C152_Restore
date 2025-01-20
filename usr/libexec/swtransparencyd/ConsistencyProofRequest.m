@interface ConsistencyProofRequest
+ (id)descriptor;
@end

@implementation ConsistencyProofRequest

+ (id)descriptor
{
  id v2 = (id)qword_10015B270;
  if (!qword_10015B270)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ConsistencyProofRequest messageName:@"ConsistencyProofRequest" fileDescription:&unk_100156778 fields:&off_1001566D8 fieldCount:5 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A2A0];
    qword_10015B270 = (uint64_t)v2;
  }
  return v2;
}

@end