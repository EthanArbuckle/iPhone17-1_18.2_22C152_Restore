@interface BatchUpdateRequest_UpdateData
+ (id)descriptor;
@end

@implementation BatchUpdateRequest_UpdateData

+ (id)descriptor
{
  id v2 = (id)qword_10032ECA0;
  if (!qword_10032ECA0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchUpdateRequest_UpdateData messageName:@"UpdateData" fileDescription:&unk_100324200 fields:&off_100324218 fieldCount:12 storageSize:72 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF41];
    [v2 setupContainingMessageClass:BatchUpdateRequest];
    qword_10032ECA0 = (uint64_t)v2;
  }
  return v2;
}

@end