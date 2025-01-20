@interface BatchUpdateResponse_UpdateResponseData
+ (id)descriptor;
@end

@implementation BatchUpdateResponse_UpdateResponseData

+ (id)descriptor
{
  id v2 = (id)qword_10032ECB8;
  if (!qword_10032ECB8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchUpdateResponse_UpdateResponseData messageName:@"UpdateResponseData" fileDescription:&unk_100324200 fields:&off_100324498 fieldCount:3 storageSize:32 flags:v4];
    [v2 setupOneofs:off_1003244F8 count:1 firstHasIndex:0xFFFFFFFFLL];
    [v2 setupExtraTextInfo:&unk_10028AF71];
    [v2 setupContainingMessageClass:BatchUpdateResponse];
    qword_10032ECB8 = (uint64_t)v2;
  }
  return v2;
}

@end