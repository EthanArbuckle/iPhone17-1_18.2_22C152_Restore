@interface ConsistencyProofRequest_LogConsistencyRequest
+ (id)descriptor;
@end

@implementation ConsistencyProofRequest_LogConsistencyRequest

+ (id)descriptor
{
  id v2 = (id)qword_10015B278;
  if (!qword_10015B278)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ConsistencyProofRequest_LogConsistencyRequest messageName:@"LogConsistencyRequest" fileDescription:&unk_100156778 fields:&off_100156790 fieldCount:2 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A2A8];
    [v2 setupContainingMessageClass:ConsistencyProofRequest];
    qword_10015B278 = (uint64_t)v2;
  }
  return v2;
}

@end