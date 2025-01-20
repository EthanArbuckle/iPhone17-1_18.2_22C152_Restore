@interface MilestoneConsistency
+ (id)descriptor;
@end

@implementation MilestoneConsistency

+ (id)descriptor
{
  id v2 = (id)qword_10015B388;
  if (!qword_10015B388)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:MilestoneConsistency messageName:@"MilestoneConsistency" fileDescription:&unk_100156E10 fields:&off_100156EC8 fieldCount:2 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A424];
    qword_10015B388 = (uint64_t)v2;
  }
  return v2;
}

@end