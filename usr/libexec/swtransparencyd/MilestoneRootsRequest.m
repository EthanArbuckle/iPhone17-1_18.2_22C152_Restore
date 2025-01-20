@interface MilestoneRootsRequest
+ (id)descriptor;
@end

@implementation MilestoneRootsRequest

+ (id)descriptor
{
  id v2 = (id)qword_10015B378;
  if (!qword_10015B378)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:MilestoneRootsRequest messageName:@"MilestoneRootsRequest" fileDescription:&unk_100156E10 fields:&off_100156DB0 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A410];
    qword_10015B378 = (uint64_t)v2;
  }
  return v2;
}

@end