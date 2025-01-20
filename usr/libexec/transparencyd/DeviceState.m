@interface DeviceState
+ (id)descriptor;
@end

@implementation DeviceState

+ (id)descriptor
{
  id v2 = (id)qword_10032ECA8;
  if (!qword_10032ECA8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:DeviceState messageName:@"DeviceState" fileDescription:&unk_100324200 fields:&off_100324398 fieldCount:5 storageSize:48 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF5B];
    qword_10032ECA8 = (uint64_t)v2;
  }
  return v2;
}

@end