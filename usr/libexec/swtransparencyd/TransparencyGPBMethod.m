@interface TransparencyGPBMethod
+ (id)descriptor;
@end

@implementation TransparencyGPBMethod

+ (id)descriptor
{
  id v2 = (id)qword_100162218;
  if (!qword_100162218)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBMethod messageName:@"Method" fileDescription:off_10015B058 fields:&off_10015B070 fieldCount:7 storageSize:40 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010E780];
    qword_100162218 = (uint64_t)v2;
  }
  return v2;
}

@end