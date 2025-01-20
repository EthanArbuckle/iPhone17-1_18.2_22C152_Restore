@interface LogClosedNode
+ (id)descriptor;
@end

@implementation LogClosedNode

+ (id)descriptor
{
  id v2 = (id)qword_10015B268;
  if (!qword_10015B268)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:LogClosedNode messageName:@"LogClosedNode" fileDescription:&unk_1001560A0 fields:&off_100156698 fieldCount:2 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A298];
    qword_10015B268 = (uint64_t)v2;
  }
  return v2;
}

@end