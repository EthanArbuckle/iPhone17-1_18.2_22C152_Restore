@interface LogConsistency
+ (id)descriptor;
@end

@implementation LogConsistency

+ (id)descriptor
{
  id v2 = (id)qword_10015B310;
  if (!qword_10015B310)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:LogConsistency messageName:@"LogConsistency" fileDescription:&unk_100156BD0 fields:&off_100156CC8 fieldCount:5 storageSize:48 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A3B5];
    qword_10015B310 = (uint64_t)v2;
  }
  return v2;
}

@end