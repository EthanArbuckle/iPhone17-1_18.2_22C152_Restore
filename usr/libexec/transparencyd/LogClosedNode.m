@interface LogClosedNode
+ (id)descriptor;
@end

@implementation LogClosedNode

+ (id)descriptor
{
  id v2 = (id)qword_10032EE00;
  if (!qword_10032EE00)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:LogClosedNode messageName:@"LogClosedNode" fileDescription:&unk_100324E10 fields:&off_100325408 fieldCount:2 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3D8];
    qword_10032EE00 = (uint64_t)v2;
  }
  return v2;
}

@end