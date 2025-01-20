@interface PerApplicationTreeConfigNode
+ (id)descriptor;
@end

@implementation PerApplicationTreeConfigNode

+ (id)descriptor
{
  id v2 = (id)qword_10015B258;
  if (!qword_10015B258)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PerApplicationTreeConfigNode messageName:@"PerApplicationTreeConfigNode" fileDescription:&unk_1001560A0 fields:&off_1001565F8 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A278];
    qword_10015B258 = (uint64_t)v2;
  }
  return v2;
}

@end