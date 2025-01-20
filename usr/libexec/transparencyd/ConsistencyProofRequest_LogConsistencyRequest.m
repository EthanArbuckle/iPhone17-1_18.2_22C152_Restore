@interface ConsistencyProofRequest_LogConsistencyRequest
+ (id)descriptor;
@end

@implementation ConsistencyProofRequest_LogConsistencyRequest

+ (id)descriptor
{
  id v2 = (id)qword_10032ECF8;
  if (!qword_10032ECF8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ConsistencyProofRequest_LogConsistencyRequest messageName:@"LogConsistencyRequest" fileDescription:&unk_100324980 fields:&off_100324998 fieldCount:2 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFC0];
    [v2 setupContainingMessageClass:ConsistencyProofRequest];
    qword_10032ECF8 = (uint64_t)v2;
  }
  return v2;
}

@end