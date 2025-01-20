@interface TransparencyGPBMethod
+ (id)descriptor;
@end

@implementation TransparencyGPBMethod

+ (id)descriptor
{
  id v2 = (id)qword_10032EC50;
  if (!qword_10032EC50)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBMethod messageName:@"Method" fileDescription:off_100323FE8 fields:&off_100324000 fieldCount:7 storageSize:40 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF00];
    qword_10032EC50 = (uint64_t)v2;
  }
  return v2;
}

@end