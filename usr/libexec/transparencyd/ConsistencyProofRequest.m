@interface ConsistencyProofRequest
+ (id)descriptor;
@end

@implementation ConsistencyProofRequest

+ (id)descriptor
{
  id v2 = (id)qword_10032ECF0;
  if (!qword_10032ECF0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ConsistencyProofRequest messageName:@"ConsistencyProofRequest" fileDescription:&unk_100324980 fields:&off_1003248E0 fieldCount:5 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFB8];
    qword_10032ECF0 = (uint64_t)v2;
  }
  return v2;
}

@end