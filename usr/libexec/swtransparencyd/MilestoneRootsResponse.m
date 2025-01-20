@interface MilestoneRootsResponse
+ (id)descriptor;
@end

@implementation MilestoneRootsResponse

+ (id)descriptor
{
  id v2 = (id)qword_10015B380;
  if (!qword_10015B380)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:MilestoneRootsResponse messageName:@"MilestoneRootsResponse" fileDescription:&unk_100156E10 fields:&off_100156E28 fieldCount:5 storageSize:40 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A418];
    qword_10015B380 = (uint64_t)v2;
  }
  return v2;
}

@end