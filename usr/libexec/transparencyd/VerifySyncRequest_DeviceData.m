@interface VerifySyncRequest_DeviceData
+ (id)descriptor;
@end

@implementation VerifySyncRequest_DeviceData

+ (id)descriptor
{
  id v2 = (id)qword_10032ECE0;
  if (!qword_10032ECE0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:VerifySyncRequest_DeviceData messageName:@"DeviceData" fileDescription:&unk_100324200 fields:&off_100324780 fieldCount:8 storageSize:56 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF8A];
    [v2 setupContainingMessageClass:VerifySyncRequest];
    qword_10032ECE0 = (uint64_t)v2;
  }
  return v2;
}

@end